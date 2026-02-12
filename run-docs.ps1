# AI 설계 문서 로컬 서버 실행 스크립트 (PowerShell)

param(
    [Parameter(Position=0)]
    [string]$Command = "start"
)

$ErrorActionPreference = "Stop"

# 색상 출력 함수
function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

function Show-Banner {
    Write-ColorOutput Cyan @"
╔═══════════════════════════════════════════╗
║   AI 설계 문서 로컬 서버 (Docker)        ║
╚═══════════════════════════════════════════╝
"@
}

function Show-Help {
    Show-Banner
    Write-Host ""
    Write-ColorOutput Yellow "사용법:"
    Write-Host "  .\run-docs.ps1 [명령어]"
    Write-Host ""
    Write-ColorOutput Yellow "명령어:"
    Write-Host "  start     - 문서 서버 시작 (기본값)"
    Write-Host "  stop      - 문서 서버 중지"
    Write-Host "  restart   - 문서 서버 재시작"
    Write-Host "  logs      - 로그 보기"
    Write-Host "  build     - Docker 이미지 다시 빌드"
    Write-Host "  clean     - 컨테이너 및 볼륨 삭제"
    Write-Host "  status    - 컨테이너 상태 확인"
    Write-Host "  help      - 도움말 표시"
    Write-Host ""
    Write-ColorOutput Yellow "예시:"
    Write-Host "  .\run-docs.ps1            # 서버 시작"
    Write-Host "  .\run-docs.ps1 stop       # 서버 중지"
    Write-Host "  .\run-docs.ps1 logs       # 로그 보기"
    Write-Host ""
}

function Start-Server {
    Show-Banner
    Write-ColorOutput Green "📦 Docker 컨테이너 시작 중..."

    # Docker가 설치되어 있는지 확인
    try {
        docker --version | Out-Null
    } catch {
        Write-ColorOutput Red "❌ Docker가 설치되어 있지 않습니다."
        Write-Host "Docker Desktop을 설치해주세요: https://www.docker.com/products/docker-desktop"
        exit 1
    }

    # Docker Compose 실행
    docker-compose up -d

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-ColorOutput Green "✅ 서버가 시작되었습니다!"
        Write-Host ""
        Write-ColorOutput Cyan "📖 문서 보기:"
        Write-ColorOutput Yellow "   http://localhost:4000"
        Write-Host ""
        Write-ColorOutput Cyan "💡 팁:"
        Write-Host "   - 문서를 수정하면 자동으로 새로고침됩니다 (LiveReload)"
        Write-Host "   - 로그 보기: .\run-docs.ps1 logs"
        Write-Host "   - 서버 중지: .\run-docs.ps1 stop"
        Write-Host ""
    } else {
        Write-ColorOutput Red "❌ 서버 시작 실패"
        exit 1
    }
}

function Stop-Server {
    Show-Banner
    Write-ColorOutput Yellow "🛑 Docker 컨테이너 중지 중..."
    docker-compose down

    if ($LASTEXITCODE -eq 0) {
        Write-ColorOutput Green "✅ 서버가 중지되었습니다."
    } else {
        Write-ColorOutput Red "❌ 서버 중지 실패"
        exit 1
    }
}

function Restart-Server {
    Show-Banner
    Write-ColorOutput Yellow "🔄 서버 재시작 중..."
    docker-compose restart

    if ($LASTEXITCODE -eq 0) {
        Write-ColorOutput Green "✅ 서버가 재시작되었습니다."
        Write-ColorOutput Yellow "   http://localhost:4000"
    } else {
        Write-ColorOutput Red "❌ 서버 재시작 실패"
        exit 1
    }
}

function Show-Logs {
    Show-Banner
    Write-ColorOutput Cyan "📋 로그 표시 중... (Ctrl+C로 종료)"
    Write-Host ""
    docker-compose logs -f
}

function Build-Image {
    Show-Banner
    Write-ColorOutput Yellow "🔨 Docker 이미지 빌드 중..."
    docker-compose build --no-cache

    if ($LASTEXITCODE -eq 0) {
        Write-ColorOutput Green "✅ 이미지 빌드 완료"
    } else {
        Write-ColorOutput Red "❌ 이미지 빌드 실패"
        exit 1
    }
}

function Clean-All {
    Show-Banner
    Write-ColorOutput Yellow "🧹 컨테이너 및 볼륨 삭제 중..."

    # 확인
    $confirmation = Read-Host "모든 컨테이너와 볼륨을 삭제하시겠습니까? (y/N)"
    if ($confirmation -ne 'y') {
        Write-ColorOutput Yellow "취소되었습니다."
        return
    }

    docker-compose down -v

    if ($LASTEXITCODE -eq 0) {
        Write-ColorOutput Green "✅ 정리 완료"
    } else {
        Write-ColorOutput Red "❌ 정리 실패"
        exit 1
    }
}

function Show-Status {
    Show-Banner
    Write-ColorOutput Cyan "📊 컨테이너 상태:"
    Write-Host ""
    docker-compose ps
}

# 명령어 처리
switch ($Command.ToLower()) {
    "start" { Start-Server }
    "stop" { Stop-Server }
    "restart" { Restart-Server }
    "logs" { Show-Logs }
    "build" { Build-Image }
    "clean" { Clean-All }
    "status" { Show-Status }
    "help" { Show-Help }
    default {
        Write-ColorOutput Red "❌ 알 수 없는 명령어: $Command"
        Write-Host ""
        Show-Help
        exit 1
    }
}

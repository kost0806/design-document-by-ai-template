# AI 설계 문서 템플릿

AI를 활용한 체계적인 소프트웨어 설계 문서 관리 템플릿입니다.

## 🎯 특징

- ✅ **체계적인 설계 흐름**: 요구사항 → HLD → DLD → 테스트 전략
- 🤖 **AI 프롬프트 템플릿**: 각 단계별 상세 가이드 제공
- 📊 **Mermaid 다이어그램**: 코드 기반 다이어그램 작성
- 🚀 **GitHub Pages 자동 배포**: 문서를 웹사이트로 자동 게시
- 🔍 **검색 기능**: just-the-docs 테마의 강력한 문서 검색

## 🚀 빠른 시작

### 1. 템플릿 사용하기

**방법 A: GitHub에서 "Use this template" 버튼 클릭**
```bash
# GitHub에서 이 레포지토리를 템플릿으로 사용하여 새 레포지토리 생성
```

**방법 B: Clone**
```bash
git clone https://github.com/your-username/AiWorkTemplate.git
cd AiWorkTemplate
```

### 2. 로컬에서 문서 보기

#### 방법 A: Docker 사용 (권장) 🐳

**Windows (PowerShell):**
```powershell
.\run-docs.ps1 start
```

**macOS / Linux:**
```bash
./run-docs.sh start
```

**사용 가능한 명령어:**
- `start` - 서버 시작
- `stop` - 서버 중지
- `restart` - 서버 재시작
- `logs` - 로그 보기
- `build` - 이미지 다시 빌드
- `clean` - 컨테이너/볼륨 삭제
- `status` - 상태 확인

#### 방법 B: 로컬 Ruby 환경

```bash
cd docs
bundle install
bundle exec jekyll serve

# 브라우저에서 http://localhost:4000 접속
```

### 3. AI로 설계 문서 작성

`templates/` 디렉토리의 프롬프트 템플릿을 사용하세요:

1. **요구사항 분석**: `templates/00-requirements-prompt.md`
2. **HLD 작성**: `templates/01-hld-prompt.md`
3. **DLD 작성**: `templates/02-dld-prompt.md`
4. **테스트 전략**: `templates/03-test-strategy-prompt.md`

AI (Claude, ChatGPT 등)에게 프롬프트를 전달하고, 생성된 내용을 `docs/` 디렉토리의 해당 파일에 작성하세요.

### 4. GitHub Pages 배포

#### 설정 방법

1. GitHub 레포지토리 Settings → Pages
2. Source: **GitHub Actions** 선택
3. `main` 브랜치에 push하면 자동 배포

#### 배포 확인

- 배포 URL: `https://your-username.github.io/your-repo/`
- Actions 탭에서 배포 상태 확인

## 📁 프로젝트 구조

```
AiWorkTemplate/
├── docs/                          # 설계 문서
│   ├── requirements/              # 요구사항
│   ├── hld/                       # High Level Design
│   ├── dld/                       # Detailed Level Design
│   └── test-strategy/             # 테스트 전략
├── templates/                     # AI 프롬프트 템플릿
│   ├── 00-requirements-prompt.md
│   ├── 01-hld-prompt.md
│   ├── 02-dld-prompt.md
│   └── 03-test-strategy-prompt.md
├── .github/workflows/             # GitHub Actions
│   └── deploy-pages.yml
└── README.md
```

## 📝 문서 작성 가이드

### 설계 단계별 작성 순서

1. **요구사항 분석** (`docs/requirements/`)
   - 프로젝트 목표와 기능 정의
   - 기능/비기능 요구사항 작성
   - 제약사항 파악

2. **High Level Design** (`docs/hld/`)
   - 전체 시스템 아키텍처 설계
   - 주요 컴포넌트 식별
   - 기술 스택 선정

3. **Detailed Level Design** (`docs/dld/`)
   - API 명세 작성
   - 데이터 모델 (ERD) 설계
   - 클래스 및 모듈 구조 정의

4. **테스트 전략** (`docs/test-strategy/`)
   - 테스트 계획 수립
   - 테스트 케이스 작성
   - 품질 메트릭 정의

### Mermaid 다이어그램 예시

```markdown
\`\`\`mermaid
graph TD
    A[요구사항] --> B[HLD]
    B --> C[DLD]
    C --> D[구현]
\`\`\`
```

## 🤖 AI 활용 팁

### 효과적인 프롬프트 작성

1. **구체적으로**: "사용자 인증 기능" 보다 "이메일/비밀번호 기반 JWT 인증"
2. **제약사항 명시**: "Node.js 사용", "PostgreSQL 필수"
3. **예시 제공**: 원하는 형식이나 스타일 예시 포함
4. **반복 개선**: 한 번에 완벽하게 하려 하지 말고 점진적으로 개선

### 추천 AI 도구

- **Claude** (Anthropic): 긴 문서 작성, 코드 생성
- **ChatGPT** (OpenAI): 다양한 설계 아이디어
- **GitHub Copilot**: 코드 기반 제안

## 🛠️ 커스터마이징

### _config.yml 수정

```yaml
# docs/_config.yml
title: 프로젝트 이름
description: 프로젝트 설명
baseurl: "/your-repo-name"
url: "https://your-username.github.io"
```

### 색상 테마 변경

```yaml
# docs/_config.yml
color_scheme: light  # 또는 dark
```

## 📚 참고 자료

- [Jekyll 문서](https://jekyllrb.com/docs/)
- [just-the-docs 테마](https://just-the-docs.com/)
- [Mermaid 다이어그램](https://mermaid.js.org/)
- [GitHub Pages](https://pages.github.com/)

## 🤝 기여

이슈 리포트, 기능 제안, 풀 리퀘스트를 환영합니다!

## 📄 라이선스

MIT License - 자유롭게 사용하세요.

---

**Happy Documenting with AI! 🚀**

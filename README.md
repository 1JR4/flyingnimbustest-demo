# Flying Nimbus Test

Provider-agnostic web and mobile application with comprehensive AI agent ecosystem for seamless development.

## 🚨 Core Principle: NO OVER-ENGINEERING
This project prioritizes working code over perfect architecture. We follow the **3-Strike Rule**: simplify, revert, replace.

## 🤖 AI Agent Ecosystem

This project uses 8 specialized Claude Code agents for seamless webapp and mobile development:

1. **orchestrator** 🎯 - Multi-agent coordinator and task manager
2. **backend-api** 🔧 - Server logic, APIs, database operations
3. **frontend-web** 💻 - React/Vue/Svelte web applications  
4. **mobile-developer** 📱 - React Native/Flutter mobile apps
5. **database-manager** 🗄️ - Schema, migrations, query optimization
6. **devops-engineer** ⚙️ - CI/CD, infrastructure, monitoring
7. **testing-specialist** 🧪 - Comprehensive testing strategy
8. **security-auditor** 🔒 - Security auditing and compliance

### Agent Usage
```bash
# Simple tasks - use specialized agents directly
> Use the backend-api subagent to add user profile endpoints
> Use the frontend-web subagent to create a responsive navigation

# Complex tasks - use orchestrator for coordination  
> Use the orchestrator subagent to implement user authentication system
> Use the orchestrator subagent to optimize application performance
```

## 📁 Project Structure

```
├── .claude/                 # AI agent configuration & contexts
│   ├── CLAUDE.md           # Master development standards
│   ├── HANDOFF_TEMPLATE.md # Agent communication template
│   ├── AGENT_BOUNDARIES.md # Agent responsibilities
│   └── agent-contexts.ts   # TypeScript context interfaces
├── .github/workflows/      # CI/CD pipelines
├── src/                    # Application source code
│   ├── providers/          # Provider-agnostic interfaces
│   ├── core/              # Business logic
│   ├── api/               # GraphQL layer
│   └── services/          # Application services
└── tests/                 # Test suites
```

## 🚀 Quick Start

### Prerequisites
- Node.js 20+
- Firebase CLI
- GitHub CLI (installed at `~/bin/gh`)

### Development Setup
```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Run tests
npm test

# Check code quality
npm run lint
npm run type-check
```

### Deployment
```bash
# Deploy to staging
npm run deploy:staging

# Deploy to production (requires approval)
npm run deploy:production
```

## 🏗️ Architecture

### Provider Agnostic Design
- Current: Firebase backend
- Future: Easily switchable to AWS, Azure, or other providers
- GraphQL API layer for unified data access
- Abstraction layers for all external services

### Technology Stack
- **Backend**: Node.js, TypeScript, GraphQL
- **Web**: Hotwire (Turbo + Stimulus) with Tailwind CSS
- **Mobile**: React Native (planned)
- **Database**: Firebase (abstracted via interfaces)
- **Hosting**: Firebase Hosting
- **CI/CD**: GitHub Actions
- **Testing**: BDD-first with Cucumber + Playwright
- **Development**: Git Worktrees for parallel feature development

## 📋 Agent Communication

### For AI Agents Working on This Project:

1. **Read `.claude/CLAUDE.md`** - Master guidelines and standards
2. **Check `.claude/AGENT_BOUNDARIES.md`** - Your domain responsibilities  
3. **Use `.claude/HANDOFF_TEMPLATE.md`** - For context transfer
4. **Follow agent-specific context** - TypeScript interfaces provided

### Current Session Context
Check `git log --oneline -10` and `git status` before starting work.

## 🔒 Security & Cost Optimization

- Environment variables for all secrets
- Rate limiting on all endpoints  
- Input validation at every layer
- Automatic dependency scanning
- Bundle size monitoring
- Performance budgets enforced

## 📊 Quality Gates

- **Test Coverage**: Minimum 80%
- **Performance**: Lighthouse score > 90
- **Security**: No high/critical vulnerabilities
- **Type Safety**: Strict TypeScript, no `any`

## 🤝 Contributing

This project is designed for AI agent collaboration. Each agent should:

1. Identify their specialization (Backend, Frontend, Mobile, etc.)
2. Review current context and recent changes
3. Follow domain boundaries and handoff procedures
4. Document decisions and provide context for next agent

## 🔧 Modern Development Workflow

### Available Scripts
```bash
# Development
npm run dev              # Start development server
npm test                 # Run BDD tests (primary)
npm run test:unit        # Run unit tests  
npm run build           # Build for production

# Feature Development (Korean methodology)
npm run backup           # Create feature backup ("원큐엔 절대 안됩니다")
npm run worktree:setup   # Setup parallel worktrees
npm run worktree:status  # Check worktree status

# Code Quality
npm run lint            # Lint code
npm run format          # Format code
npm run type-check      # TypeScript check

# Deployment
npm run deploy:staging  # Deploy to staging
npm run deploy:prod     # Deploy to production
```

### Hotwire Modern UI
- **Minimal JavaScript**: Server-side rendering with Turbo
- **Import Maps**: No build step required
- **Stimulus Controllers**: Progressive enhancement
- **Tailwind CSS**: shadcn-style utility classes

### BDD Testing Strategy
- **Gherkin Scenarios**: Natural language test specifications
- **Playwright Integration**: Real browser testing
- **Behavior Focus**: Test what users care about, not implementation

### Git Worktree Parallel Development
- **Multiple Features**: Work on different features simultaneously
- **No Branch Switching**: Each worktree maintains its state
- **AI Agent Friendly**: Run multiple Claude sessions in parallel

## 📚 Documentation

- **Development Standards**: `.claude/CLAUDE.md`
- **Modern UI Guide**: `HOTWIRE_GUIDE.md`
- **Parallel Development**: `GIT_WORKTREE_GUIDE.md`
- **Feature Backup Strategy**: `FEATURE_BACKUP_BDD_GUIDE.md`
- **Agent Documentation**: `.claude/agents/README.md`

## 🔄 Project Status

- ✅ Foundation established with best practices
- ✅ CI/CD pipelines configured
- ✅ Agent ecosystem documented
- ✅ Provider-agnostic architecture defined
- 🔄 Ready for feature development

---

**Repository**: https://github.com/1JR4/flyingnimbustest-demo  
**Firebase Project**: flyingnimbustest  
**Last Updated**: 2025-08-07
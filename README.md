# Flying Nimbus Test

Provider-agnostic web and mobile application with comprehensive AI agent ecosystem for seamless development.

## 🚨 Core Principle: NO OVER-ENGINEERING
This project prioritizes working code over perfect architecture. We follow the **3-Strike Rule**: simplify, revert, replace.

## 🤖 AI Agent Ecosystem

This project uses 8 specialized AI agents for seamless webapp and mobile development:

1. **Backend API Agent** 🔧 - Server logic, APIs, database operations
2. **Frontend Web Agent** 💻 - React/Vue/Svelte web applications  
3. **Mobile Agent** 📱 - React Native/Flutter mobile apps
4. **Database Agent** 🗄️ - Schema, migrations, query optimization
5. **DevOps Agent** ⚙️ - CI/CD, infrastructure, monitoring
6. **Testing Agent** 🧪 - Comprehensive testing strategy
7. **Security Agent** 🔒 - Security auditing and compliance
8. **UI/UX Agent** 🎨 - Design systems and user experience

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
- **Web**: React (configurable)
- **Mobile**: React Native (planned)
- **Database**: Firebase (abstracted via interfaces)
- **Hosting**: Firebase Hosting
- **CI/CD**: GitHub Actions

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

## 📚 Documentation

- **Development Standards**: `.claude/CLAUDE.md`
- **API Documentation**: `docs/API.md` (when created)
- **Architecture Decisions**: `docs/ARCHITECTURE.md` (when created)

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
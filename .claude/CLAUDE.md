# CLAUDE.md - AI Agent Context & Development Standards

> **CRITICAL**: This document is the single source of truth for all AI agents and developers working on this project. Read and follow these guidelines meticulously.

## 🚨 CORE PRINCIPLE: NO OVER-ENGINEERING

**SIMPLICITY FIRST**: Choose the simplest solution that works. We prioritize:
1. **Working code** over perfect architecture
2. **Pragmatic solutions** over theoretical best practices  
3. **Quick iterations** over lengthy planning
4. **Proven patterns** over cutting-edge experiments

### The 3-Strike Rule
1. If it doesn't work on first try, simplify
2. If it breaks after deploy, revert and rethink
3. If it needs constant maintenance, replace with simpler solution

### What This Means Practically:
- **NO** complex abstractions until absolutely necessary
- **NO** premature optimization
- **NO** dependency hell - minimize external packages
- **YES** to boring, battle-tested technology
- **YES** to incremental improvements
- **YES** to "good enough" when it meets requirements

## 🎯 Project Overview

**Project**: Flying Nimbus Test
**Purpose**: Provider-agnostic application with Firebase as initial backend
**Architecture**: Modular, scalable, cloud-native with abstraction layers

## 🏗️ Architecture Principles

### Provider Agnosticism
- **NEVER** write Firebase-specific code directly in business logic
- **ALWAYS** use abstraction layers and interfaces
- **IMPLEMENT** repository pattern for data access
- **USE** dependency injection for service providers

```typescript
// ❌ BAD - Direct Firebase dependency
import { getFirestore } from 'firebase/firestore';
const db = getFirestore();

// ✅ GOOD - Abstracted interface
import { DatabaseProvider } from '@/providers/database';
const db = DatabaseProvider.getInstance();
```

### Service Layer Architecture
```
┌─────────────────┐
│   UI/Frontend   │
├─────────────────┤
│  GraphQL Layer  │ ← Provider-agnostic API
├─────────────────┤
│ Business Logic  │ ← Core domain logic
├─────────────────┤
│  Service Layer  │ ← Abstraction interfaces
├─────────────────┤
│   Providers     │ ← Firebase, AWS, Azure implementations
└─────────────────┘
```

## 📁 Project Structure

```
/
├── .claude/              # AI agent configuration
│   └── CLAUDE.md        # This file - source of truth
├── .github/             
│   ├── workflows/       # CI/CD pipelines
│   ├── CODEOWNERS      # Code ownership rules
│   └── pull_request_template.md
├── src/
│   ├── api/            # GraphQL schemas & resolvers
│   │   ├── schema/     # GraphQL type definitions
│   │   └── resolvers/  # GraphQL resolvers
│   ├── core/           # Business logic (provider-agnostic)
│   │   ├── entities/   # Domain entities
│   │   ├── usecases/   # Business use cases
│   │   └── interfaces/ # Contract definitions
│   ├── providers/      # External service implementations
│   │   ├── firebase/   # Firebase-specific code
│   │   ├── aws/        # AWS-specific code (future)
│   │   └── interfaces/ # Provider contracts
│   ├── services/       # Application services
│   ├── utils/          # Shared utilities
│   └── config/         # Configuration management
├── tests/
│   ├── unit/          # Unit tests
│   ├── integration/   # Integration tests
│   └── e2e/           # End-to-end tests
├── docs/
│   ├── API.md         # API documentation
│   ├── ARCHITECTURE.md # Architecture decisions
│   └── HANDOFF.md     # Context handoff procedures
└── scripts/           # Build and deployment scripts
```

## 🔒 Security Standards

### API Keys & Secrets
- **NEVER** commit secrets to the repository
- **USE** environment variables for all sensitive data
- **IMPLEMENT** secret rotation every 90 days
- **VALIDATE** all environment variables on startup

```typescript
// config/env.validation.ts
const requiredEnvVars = [
  'DATABASE_URL',
  'API_KEY',
  'JWT_SECRET'
];

requiredEnvVars.forEach(varName => {
  if (!process.env[varName]) {
    throw new Error(`Missing required environment variable: ${varName}`);
  }
});
```

### Input Validation
- **SANITIZE** all user inputs
- **VALIDATE** data at every layer
- **USE** schema validation (Zod, Joi, Yup)
- **IMPLEMENT** rate limiting on all endpoints

### Authentication & Authorization
- **USE** JWT tokens with short expiration (15 minutes)
- **IMPLEMENT** refresh token rotation
- **ENFORCE** least privilege principle
- **LOG** all authentication events

## 💰 Cost Optimization

### API Cost Management
```typescript
// Implement caching layer
class CacheService {
  private cache = new Map();
  private readonly TTL = 5 * 60 * 1000; // 5 minutes
  
  async get<T>(key: string, fetcher: () => Promise<T>): Promise<T> {
    const cached = this.cache.get(key);
    if (cached && cached.expiry > Date.now()) {
      return cached.data;
    }
    
    const data = await fetcher();
    this.cache.set(key, {
      data,
      expiry: Date.now() + this.TTL
    });
    return data;
  }
}
```

### Database Optimization
- **BATCH** operations when possible
- **PAGINATE** all list queries (max 100 items)
- **INDEX** frequently queried fields
- **MONITOR** query performance
- **IMPLEMENT** connection pooling

### Storage Optimization
- **COMPRESS** images before upload
- **USE** CDN for static assets
- **IMPLEMENT** lazy loading
- **SET** appropriate cache headers
- **CLEAN** orphaned files regularly

## 🚀 CI/CD Pipeline

### Git Workflow
- **BRANCH NAMING**: `feature/`, `bugfix/`, `hotfix/`, `release/`
- **COMMIT CONVENTION**: Use conventional commits
  ```
  feat: add user authentication
  fix: resolve memory leak in cache service
  docs: update API documentation
  refactor: extract validation logic
  test: add unit tests for user service
  chore: update dependencies
  ```

### Pipeline Stages
1. **Lint & Format** - ESLint, Prettier
2. **Type Check** - TypeScript strict mode
3. **Unit Tests** - Jest with 80% coverage minimum
4. **Integration Tests** - Test service interactions
5. **Security Scan** - Dependency vulnerabilities
6. **Build** - Production build
7. **Deploy Preview** - Deploy to staging
8. **E2E Tests** - Cypress/Playwright on staging
9. **Production Deploy** - After manual approval

### Quality Gates
- **Code Coverage**: Minimum 80%
- **Performance**: Lighthouse score > 90
- **Security**: No high/critical vulnerabilities
- **Type Safety**: Strict TypeScript, no `any`
- **Bundle Size**: Monitor and alert on > 10% increase

## 📝 Documentation Standards

### Code Documentation
```typescript
/**
 * Processes user registration with email verification
 * 
 * @param {RegisterUserDto} userData - User registration data
 * @returns {Promise<User>} Created user object
 * @throws {ValidationError} If input data is invalid
 * @throws {ConflictError} If email already exists
 * 
 * @example
 * const user = await registerUser({
 *   email: 'user@example.com',
 *   password: 'SecurePass123!'
 * });
 */
async function registerUser(userData: RegisterUserDto): Promise<User> {
  // Implementation
}
```

### API Documentation
- **USE** GraphQL schema as documentation
- **PROVIDE** example queries and mutations
- **DOCUMENT** error codes and responses
- **MAINTAIN** Postman/Insomnia collections

### Context Handoff Rules
When handing off context to another AI agent or developer:

1. **Current State Summary**
   - What was just completed
   - What is currently in progress
   - What needs to be done next

2. **Technical Context**
   - Active feature branches
   - Pending migrations
   - Environment-specific configurations
   - Known issues or blockers

3. **Business Context**
   - User stories being addressed
   - Priority levels
   - Deadlines or time constraints

4. **Testing Status**
   - Tests written
   - Tests passing/failing
   - Coverage metrics

## 🧪 Testing Standards

### Test Categories
- **Unit Tests**: Test individual functions/methods
- **Integration Tests**: Test service interactions
- **E2E Tests**: Test user workflows
- **Performance Tests**: Load and stress testing

### Test Naming Convention
```typescript
describe('UserService', () => {
  describe('registerUser', () => {
    it('should create a new user with valid data', async () => {});
    it('should throw ValidationError for invalid email', async () => {});
    it('should throw ConflictError for duplicate email', async () => {});
  });
});
```

### Test Data Management
- **USE** factories for test data generation
- **ISOLATE** test databases
- **CLEAN** test data after each test
- **MOCK** external services

## 🔄 Continuous Improvement

### Code Review Checklist
- [ ] Follows architecture principles
- [ ] Includes appropriate tests
- [ ] Documentation is updated
- [ ] No hardcoded values
- [ ] Error handling is comprehensive
- [ ] Performance impact considered
- [ ] Security implications reviewed
- [ ] Backward compatibility maintained

### Performance Monitoring
- **TRACK** API response times
- **MONITOR** error rates
- **ALERT** on anomalies
- **REVIEW** metrics weekly

### Technical Debt Management
- **DOCUMENT** technical debt in issues
- **ALLOCATE** 20% of sprint for debt reduction
- **PRIORITIZE** security and performance debt
- **REVIEW** debt quarterly

## 🚨 Emergency Procedures

### Incident Response
1. **Identify** severity (P1-P4)
2. **Notify** stakeholders
3. **Mitigate** immediate impact
4. **Investigate** root cause
5. **Fix** and deploy
6. **Document** post-mortem

### Rollback Procedure
```bash
# Quick rollback to previous version
npm run deploy:rollback

# Or manual rollback
git revert HEAD
git push origin main
npm run deploy:production
```

## 🤖 AI Agent Instructions

### For New AI Agents
1. **READ** this entire document before making any changes
2. **CHECK** current branch and status: `git status`
3. **REVIEW** recent commits: `git log --oneline -10`
4. **TEST** locally before committing
5. **DOCUMENT** your changes thoroughly

### Communication Protocol
- **START** each session by reviewing this document
- **ANNOUNCE** what you plan to change
- **EXPLAIN** architectural decisions
- **WARN** about breaking changes
- **SUMMARIZE** what was accomplished

### Code Generation Rules
- **PREFER** TypeScript over JavaScript
- **USE** functional programming where appropriate
- **AVOID** premature optimization
- **IMPLEMENT** error boundaries
- **ADD** loading and error states
- **INCLUDE** accessibility features

## 📊 Metrics & KPIs

### Development Metrics
- **Deployment Frequency**: Daily
- **Lead Time**: < 2 hours
- **MTTR**: < 30 minutes
- **Change Failure Rate**: < 5%

### Application Metrics
- **Uptime**: 99.9%
- **Response Time**: P95 < 200ms
- **Error Rate**: < 0.1%
- **User Satisfaction**: > 4.5/5

## 🔄 Update Log

### Version Control for This Document
- **Last Updated**: 2025-08-07
- **Version**: 1.0.0
- **Changed By**: Initial setup by AI Agent

---

## ⚡ Quick Commands

```bash
# Development
npm run dev              # Start development server
npm run test            # Run all tests
npm run test:watch      # Run tests in watch mode
npm run lint            # Lint code
npm run format          # Format code

# Deployment
npm run build           # Build for production
npm run deploy:staging  # Deploy to staging
npm run deploy:prod     # Deploy to production

# Utilities
npm run analyze         # Analyze bundle size
npm run security        # Security audit
npm run update:deps     # Update dependencies safely
```

## 🎯 Current Priorities

1. **Establish provider-agnostic architecture**
2. **Set up comprehensive testing**
3. **Implement CI/CD pipeline**
4. **Create GraphQL API layer**
5. **Document all decisions**

---

**Remember**: This document is living and should be updated as the project evolves. All architectural decisions should be documented here first before implementation.
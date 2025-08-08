# 🚀 Flying Nimbus Project Starter Guide

Complete setup guide for starting new product development using the Flying Nimbus foundation.

## 📦 Available Project Templates

5 ready-to-use project templates with full Flying Nimbus foundation:

```
templates/
├── freshpaper-1/     # Template #1
├── freshpaper-2/     # Template #2  
├── freshpaper-3/     # Template #3
├── freshpaper-4/     # Template #4
└── freshpaper-5/     # Template #5
```

Each template includes:
- ✅ Complete AI agent ecosystem (8 specialized agents)
- ✅ CI/CD pipelines with GitHub Actions
- ✅ Provider-agnostic architecture
- ✅ TypeScript configuration
- ✅ Testing framework setup
- ✅ Security best practices
- ✅ Anti-over-engineering principles

## 🎯 Quick Start (5 Minutes)

### Option A: Use Existing Template
```bash
# 1. Copy template to new location
cp -r templates/freshpaper-1 ~/my-new-product
cd ~/my-new-product

# 2. Run the initialization script
curl -sSL https://raw.githubusercontent.com/1JR4/flying-nimbus/main/init-project.sh | bash

# 3. Start development
npm install && npm run dev
```

### Option B: Manual Setup
Follow the detailed steps below for full control over the setup process.

## 📋 Detailed Setup Process

### Step 1: Project Initialization

#### 1.1 Copy Template
```bash
# Choose a template (freshpaper-1 through freshpaper-5)
cp -r templates/freshpaper-1 /path/to/your/project
cd /path/to/your/project

# Or create outside flyingnimbustest directory:
cp -r /path/to/flyingnimbustest/templates/freshpaper-1 ~/my-awesome-product
```

#### 1.2 Initialize Git Repository
```bash
git init
git add .
git commit -m "feat: initial commit from Flying Nimbus template

🤖 Generated with Flying Nimbus Foundation v1.0.0
- Complete AI agent ecosystem
- Provider-agnostic architecture  
- CI/CD pipelines ready
- Security best practices implemented"
```

### Step 2: Firebase Setup

#### 2.1 Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Create a project" 
3. Choose project name (e.g., "my-awesome-product")
4. Enable Google Analytics (recommended)
5. Wait for project creation

#### 2.2 Connect Local Project
```bash
# Login to Firebase CLI
firebase login

# Initialize Firebase in your project
firebase init

# Select these services:
# ◯ Realtime Database (if needed)
# ◉ Firestore (recommended)
# ◉ Functions (if planning server functions)
# ◉ Hosting
# ◉ Storage (if file uploads needed)

# Choose "Use an existing project" and select your new project
```

#### 2.3 Update Configuration
```bash
# Update firebase.json with your project ID
sed -i '' 's/"default": "flyingnimbustest"/"default": "your-project-id"/' firebase.json

# Update package.json project name
sed -i '' 's/"name": "flyingnimbustest"/"name": "your-project-name"/' package.json
```

#### 2.4 Service Account Setup (Optional)
```bash
# Download service account key from Firebase Console
# Settings > Service accounts > Generate new private key
# Save as firebase-service-account.json (already in .gitignore)
```

### Step 3: GitHub Setup

#### 3.1 Create GitHub Repository
```bash
# Create repository (public or private)
gh repo create your-project-name --public --description "Your project description"

# Add remote
git remote add origin git@github.com:yourusername/your-project-name.git
git branch -M main
```

#### 3.2 Configure GitHub Actions Secrets
Go to GitHub repo > Settings > Secrets and variables > Actions

Add these secrets:
```
FIREBASE_SERVICE_ACCOUNT    # Content of service account JSON
FIREBASE_SERVICE_ACCOUNT_STAGING  # For staging environment (if separate)
CODECOV_TOKEN              # From codecov.io (optional)
SNYK_TOKEN                 # From snyk.io (optional)
SLACK_WEBHOOK              # For deployment notifications (optional)
```

#### 3.3 Push Initial Code
```bash
git push -u origin main
```

### Step 4: Environment Configuration

#### 4.1 Setup Environment Variables
```bash
# Copy environment template
cp .env.example .env

# Generate JWT secret
node -e "console.log('JWT_SECRET=' + require('crypto').randomBytes(64).toString('hex'))" >> .env
```

#### 4.2 Configure .env File
Edit `.env` with your specific values:

```env
# Application
NODE_ENV=development
PORT=3000
APP_NAME=your-project-name
API_VERSION=v1

# Security (GENERATE NEW VALUES!)
JWT_SECRET=your-generated-jwt-secret-here
JWT_EXPIRY=15m
REFRESH_TOKEN_EXPIRY=7d

# Firebase
FIREBASE_PROJECT_ID=your-firebase-project-id
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nYour private key here\n-----END PRIVATE KEY-----\n"
FIREBASE_CLIENT_EMAIL=your-service-account@your-project.iam.gserviceaccount.com

# Add other services as needed
```

### Step 5: Customization

#### 5.1 Update Project Metadata
```bash
# Update package.json
npm pkg set name="your-project-name"
npm pkg set description="Your project description"  
npm pkg set repository.url="git+https://github.com/yourusername/your-project-name.git"
npm pkg set author="Your Name"

# Update public/index.html
sed -i '' 's/<title>Flying Nimbus Test<\/title>/<title>Your App Name<\/title>/' public/index.html
```

#### 5.2 Customize README.md
Edit your README.md to replace placeholder content:
- Project name and description
- Specific features and goals
- Custom setup instructions
- Team information

#### 5.3 Update CI/CD Configuration
Edit `.github/workflows/ci.yml` and `.github/workflows/cd.yml`:
- Update project-specific environment variables
- Modify deployment targets
- Add custom testing steps

### Step 6: Development Setup

#### 6.1 Install Dependencies
```bash
npm install
```

#### 6.2 Verify Setup
```bash
# Run linting
npm run lint

# Run type checking  
npm run type-check

# Run tests (should pass with basic setup)
npm test

# Build project
npm run build
```

#### 6.3 Start Development
```bash
# Start development server
npm run dev

# Deploy to Firebase hosting
firebase deploy
```

## 🤖 AI Agent Usage

### Simple Tasks
```bash
# Use specialized agents directly
> Use the backend-api subagent to create user authentication endpoints

> Use the frontend-web subagent to build a responsive navigation component

> Use the database-manager subagent to design user profile schema
```

### Complex Tasks  
```bash
# Use orchestrator for multi-agent coordination
> Use the orchestrator subagent to implement complete user authentication system

> Use the orchestrator subagent to build real-time chat functionality

> Use the orchestrator subagent to optimize application performance across entire stack
```

### Agent Communication
The agents automatically:
- Follow anti-over-engineering principles
- Use provider-agnostic patterns
- Maintain consistent code style
- Create comprehensive documentation
- Implement proper testing
- Follow security best practices

## 🔧 Project Initialization Script

Create this as a starter prompt for new AI agents:

```markdown
# New Project Setup Context

## Project Details
- **Name**: [Your Project Name]
- **Description**: [Your Project Description]  
- **Firebase Project**: [your-firebase-project-id]
- **GitHub Repo**: [github.com/user/repo]
- **Domain**: [yourdomain.com] (if applicable)

## Current Status
- [ ] Firebase configured
- [ ] GitHub repository created
- [ ] Environment variables set
- [ ] CI/CD pipelines active
- [ ] Initial deployment successful

## Next Development Steps
1. [Define your first feature]
2. [Set up authentication] 
3. [Design data models]
4. [Create UI components]
5. [Implement business logic]

## Agent Instructions
Please help me implement [specific feature] following these priorities:
1. Working code over perfect architecture
2. Provider-agnostic design  
3. Security best practices
4. Comprehensive testing
5. Clear documentation

Use the appropriate specialized agents or orchestrator based on complexity.
```

## 🚨 Security Checklist

Before going live:
- [ ] Generate new JWT secrets (never use template defaults)
- [ ] Configure Firebase security rules
- [ ] Set up HTTPS and security headers
- [ ] Enable rate limiting
- [ ] Configure CORS properly
- [ ] Set up monitoring and alerting
- [ ] Review all environment variables
- [ ] Enable two-factor authentication on all services

## 📊 Success Metrics

Track these KPIs for your new project:
- **Setup Time**: From template copy to first deployment
- **Development Velocity**: Features implemented per week
- **Code Quality**: Test coverage, linting scores
- **Performance**: Page load times, API response times
- **Security**: Vulnerability scan results
- **User Experience**: Core Web Vitals scores

## 🔄 Template Updates

Keep your templates updated:
```bash
# Pull latest Flying Nimbus improvements
cd flyingnimbustest
git pull origin main

# Update your templates
for i in {1..5}; do
  echo "Updating freshpaper-$i template..."
  # Manually review and merge changes
done
```

## 💡 Pro Tips

### Development Efficiency
- Use the orchestrator for features spanning multiple domains
- Let specialized agents handle domain-specific tasks
- Follow the 3-Strike Rule: simplify, revert, replace
- Start with Firebase, migrate to other providers later if needed

### Common Pitfalls
- Don't over-engineer on day one
- Don't skip environment variable configuration
- Don't commit secrets to version control
- Don't deploy without running tests
- Don't ignore security best practices

### Scaling Strategy
1. **Phase 1**: MVP with core features
2. **Phase 2**: User feedback and iteration  
3. **Phase 3**: Performance optimization
4. **Phase 4**: Advanced features and scaling
5. **Phase 5**: Provider migration if needed

---

**Template System Version**: 1.0.0  
**Compatible with**: Flying Nimbus Foundation v1.0.0
**Last Updated**: 2025-08-07

Happy building! 🚀
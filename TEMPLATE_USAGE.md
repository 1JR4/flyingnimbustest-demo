# 📦 Project Template Usage Guide

Quick reference for using the 5 Flying Nimbus project templates for rapid product development.

## 🎯 Template Overview

```
templates/
├── freshpaper-1/     # Complete foundation template
├── freshpaper-2/     # Complete foundation template  
├── freshpaper-3/     # Complete foundation template
├── freshpaper-4/     # Complete foundation template
└── freshpaper-5/     # Complete foundation template
```

Each template is identical and includes the complete Flying Nimbus foundation:
- ✅ 8 specialized AI agents (orchestrator, backend-api, frontend-web, etc.)
- ✅ Provider-agnostic architecture
- ✅ CI/CD pipelines (GitHub Actions)
- ✅ Security best practices
- ✅ Testing framework
- ✅ Anti-over-engineering principles

## 🚀 Three Ways to Start a New Project

### Method 1: Copy Template (Fastest)
```bash
# Choose any template (they're identical)
cp -r templates/freshpaper-1 ~/my-awesome-product
cd ~/my-awesome-product

# Run automated setup
./init-project.sh

# Start development
npm run dev
```

### Method 2: Manual Setup (Full Control)
```bash
# Copy template
cp -r templates/freshpaper-2 /path/to/new/project
cd /path/to/new/project

# Follow detailed setup in PROJECT_STARTER.md
# Customize configuration manually
# Set up Firebase, GitHub, environment variables
```

### Method 3: Use as Reference (Learning)
```bash
# Keep templates as reference
# Copy specific files or configurations as needed
# Good for understanding the foundation structure
```

## 🔧 Quick Setup Checklist

For each new project:

### 1. Template Copy ✅
```bash
cp -r templates/freshpaper-X ~/new-project-name
cd ~/new-project-name
```

### 2. Project Configuration ⚙️
- [ ] Update `package.json` name and description
- [ ] Update `firebase.json` project ID
- [ ] Copy `.env.example` to `.env`
- [ ] Generate new JWT secrets
- [ ] Update `README.md` with project details

### 3. External Services 🌐
- [ ] Create Firebase project
- [ ] Create GitHub repository  
- [ ] Configure environment variables
- [ ] Set up CI/CD secrets

### 4. Development Setup 💻
- [ ] Run `npm install`
- [ ] Run `npm test` (verify setup)
- [ ] Run `npm run dev` (start development)
- [ ] Make first commit

## 🎨 Customization Examples

### Rename Project
```bash
# Update package.json
npm pkg set name="my-product-name"
npm pkg set description="My amazing product"

# Update Firebase configuration  
sed -i 's/"default": "flyingnimbustest"/"default": "my-firebase-project"/' firebase.json

# Update HTML title
sed -i 's/<title>.*<\/title>/<title>My Product<\/title>/' public/index.html
```

### Configure New Firebase Project
```bash
# Create project in Firebase Console first
firebase login
firebase use your-project-id

# Update configuration
echo '{"projects": {"default": "your-project-id"}}' > .firebaserc
```

### Set Up GitHub Repository
```bash
gh repo create my-product --public --description "My amazing product"
git remote add origin git@github.com:username/my-product.git
git push -u origin main
```

## 🤖 AI Agent Starter Prompts

### For Simple Features
```bash
# Backend development
> Use the backend-api subagent to create user authentication endpoints with JWT

# Frontend development  
> Use the frontend-web subagent to build a responsive dashboard with user stats

# Database work
> Use the database-manager subagent to design schema for blog posts with comments
```

### For Complex Features
```bash
# Multi-component features
> Use the orchestrator subagent to implement complete user authentication system with email verification

# Full-stack features
> Use the orchestrator subagent to build real-time chat functionality with message history

# Performance optimization
> Use the orchestrator subagent to optimize application performance across database, API, and frontend
```

### Project-Specific Context
```markdown
# New Project Context for AI Agents

## Project: [Your Project Name]
**Description**: [Brief description of what you're building]
**Target Users**: [Who will use this product]
**Key Features**: [List main features you plan to build]

## Technical Setup
- **Firebase Project**: [your-project-id]  
- **GitHub Repo**: [github.com/user/repo]
- **Environment**: [Development/Staging/Production]

## Current Priority
[Describe what you want to work on first]

## Instructions for AI Agents
Please help me build this following our anti-over-engineering principles:
1. Working code over perfect architecture
2. Start simple, enhance incrementally  
3. Use proven, boring technology
4. Provider-agnostic design for future flexibility

Use appropriate specialized agents based on task complexity.
```

## 📊 Template Maintenance

### Keep Templates Updated
```bash
# In the flyingnimbustest directory
git pull origin main  # Get latest improvements

# Review changes and update templates manually
# Test changes in a template before deploying
```

### Template Health Check
```bash
# For each template, verify:
cd templates/freshpaper-1
npm install
npm test
npm run build
npm run lint

# Should all pass without errors
```

### Add New Features to Templates
```bash
# After adding features to main project:
# 1. Test thoroughly
# 2. Update template files
# 3. Update documentation
# 4. Version the template system
```

## 💡 Best Practices

### Template Selection
- **All templates are identical** - choose any number (1-5)
- Use different templates for different products
- Keep templates clean and generic

### Project Naming
- Use kebab-case: `my-awesome-product`
- Keep names short but descriptive
- Avoid special characters or spaces

### Configuration Management
- Never commit secrets to version control
- Use environment variables for all configuration
- Generate new JWT secrets for each project
- Keep `.env.example` updated with new variables

### Development Workflow
1. **Start Simple**: Basic functionality first
2. **Use AI Agents**: Let them guide implementation
3. **Test Early**: Run tests frequently  
4. **Deploy Often**: Use CI/CD pipelines
5. **Monitor**: Set up error tracking and analytics

### Scaling Strategy
1. **Phase 1**: MVP with core features
2. **Phase 2**: User feedback and iteration
3. **Phase 3**: Performance optimization
4. **Phase 4**: Advanced features
5. **Phase 5**: Provider migration if needed

## 🔍 Troubleshooting

### Common Issues

**Template not copying correctly**
```bash
# Ensure source exists
ls -la templates/freshpaper-1

# Use absolute paths if relative fails
cp -r /full/path/to/templates/freshpaper-1 /full/path/to/destination
```

**npm install fails**
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and try again
rm -rf node_modules package-lock.json
npm install
```

**Firebase connection issues**
```bash
# Re-login to Firebase
firebase logout
firebase login

# Verify project access
firebase projects:list
firebase use your-project-id
```

**GitHub CLI not authenticated**
```bash
# Check authentication
gh auth status

# Re-authenticate if needed
gh auth login
```

### Getting Help

1. **Check Documentation**: `PROJECT_STARTER.md` for detailed setup
2. **Review Agent Docs**: `.claude/agents/README.md` for agent usage
3. **Check Issues**: Look for similar problems in GitHub issues
4. **Ask AI Agents**: They can help debug setup problems

---

**Template System Version**: 1.0.0  
**Last Updated**: 2025-08-07

Happy rapid prototyping! 🚀
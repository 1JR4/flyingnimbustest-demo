#!/bin/bash

# Flying Nimbus Project Initialization Script
# Automates the setup of a new project from template

set -e

echo "🚀 Flying Nimbus Project Initializer"
echo "===================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_step() {
    echo -e "${BLUE}Step $1:${NC} $2"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check prerequisites
print_step 1 "Checking prerequisites..."

if ! command -v node &> /dev/null; then
    print_error "Node.js is required but not installed"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    print_error "npm is required but not installed"
    exit 1
fi

if ! command -v git &> /dev/null; then
    print_error "Git is required but not installed"
    exit 1
fi

NODE_VERSION=$(node --version | sed 's/v//')
if [ "$(printf '%s\n' "20.0.0" "$NODE_VERSION" | sort -V | head -n1)" != "20.0.0" ]; then
    print_warning "Node.js 20+ recommended, you have $NODE_VERSION"
fi

print_success "Prerequisites check passed"

# Get project configuration
print_step 2 "Project configuration..."

read -p "Enter project name: " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
    print_error "Project name is required"
    exit 1
fi

read -p "Enter project description: " PROJECT_DESCRIPTION
read -p "Enter Firebase project ID (optional): " FIREBASE_PROJECT_ID
read -p "Enter GitHub username (optional): " GITHUB_USERNAME

# Validate project name
if [[ ! "$PROJECT_NAME" =~ ^[a-z][a-z0-9-]*$ ]]; then
    print_error "Project name must start with a letter and contain only lowercase letters, numbers, and hyphens"
    exit 1
fi

print_success "Configuration collected"

# Update package.json
print_step 3 "Updating project configuration..."

# Update package.json
if [ -f package.json ]; then
    # Use temporary file for cross-platform compatibility
    TEMP_FILE=$(mktemp)
    
    # Update package.json fields
    node -e "
        const pkg = require('./package.json');
        pkg.name = '$PROJECT_NAME';
        pkg.description = '$PROJECT_DESCRIPTION';
        if ('$GITHUB_USERNAME') {
            pkg.repository.url = 'git+https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git';
            pkg.bugs.url = 'https://github.com/$GITHUB_USERNAME/$PROJECT_NAME/issues';
            pkg.homepage = 'https://github.com/$GITHUB_USERNAME/$PROJECT_NAME#readme';
        }
        console.log(JSON.stringify(pkg, null, 2));
    " > "$TEMP_FILE"
    
    mv "$TEMP_FILE" package.json
    print_success "package.json updated"
else
    print_warning "package.json not found, skipping update"
fi

# Update firebase.json
if [ -f firebase.json ] && [ -n "$FIREBASE_PROJECT_ID" ]; then
    TEMP_FILE=$(mktemp)
    
    node -e "
        const firebase = require('./firebase.json');
        firebase.projects.default = '$FIREBASE_PROJECT_ID';
        console.log(JSON.stringify(firebase, null, 2));
    " > "$TEMP_FILE"
    
    mv "$TEMP_FILE" firebase.json
    print_success "firebase.json updated with project ID: $FIREBASE_PROJECT_ID"
fi

# Update public/index.html
if [ -f public/index.html ]; then
    sed -i.bak "s/<title>.*<\/title>/<title>$PROJECT_NAME<\/title>/" public/index.html
    rm -f public/index.html.bak
    print_success "public/index.html updated"
fi

# Generate JWT secret
print_step 4 "Setting up environment variables..."

if [ -f .env.example ] && [ ! -f .env ]; then
    cp .env.example .env
    
    # Generate JWT secret
    JWT_SECRET=$(node -e "console.log(require('crypto').randomBytes(64).toString('hex'))")
    
    # Update .env file
    if command -v sed &> /dev/null; then
        sed -i.bak "s/your-super-secret-jwt-key-change-this/$JWT_SECRET/" .env
        sed -i.bak "s/APP_NAME=flyingnimbustest/APP_NAME=$PROJECT_NAME/" .env
        
        if [ -n "$FIREBASE_PROJECT_ID" ]; then
            sed -i.bak "s/FIREBASE_PROJECT_ID=flyingnimbustest/FIREBASE_PROJECT_ID=$FIREBASE_PROJECT_ID/" .env
        fi
        
        rm -f .env.bak
        print_success "Environment variables configured with new JWT secret"
    else
        print_warning "Could not automatically update .env file. Please update manually."
    fi
else
    print_warning ".env file setup skipped (already exists or .env.example not found)"
fi

# Install dependencies
print_step 5 "Installing dependencies..."

if npm install --silent; then
    print_success "Dependencies installed successfully"
else
    print_error "Failed to install dependencies"
    exit 1
fi

# Run initial verification
print_step 6 "Running initial verification..."

echo "Running linter..."
if npm run lint --silent; then
    print_success "Linting passed"
else
    print_warning "Linting issues found (fixable with: npm run lint:fix)"
fi

echo "Running type check..."
if npm run type-check --silent; then
    print_success "Type checking passed"
else
    print_error "Type checking failed"
fi

echo "Running tests..."
if npm test --silent; then
    print_success "Tests passed"
else
    print_warning "Some tests failed (review and fix as needed)"
fi

# Git initialization
print_step 7 "Git repository setup..."

if [ ! -d .git ]; then
    git init
    print_success "Git repository initialized"
else
    print_success "Git repository already exists"
fi

# Stage all files
git add .

# Create initial commit
COMMIT_MESSAGE="feat: initialize $PROJECT_NAME from Flying Nimbus template

- Complete AI agent ecosystem (8 specialized agents)
- Provider-agnostic architecture with Firebase integration
- CI/CD pipelines with GitHub Actions
- Security best practices and anti-over-engineering principles
- TypeScript configuration and testing framework

🤖 Generated with Flying Nimbus Foundation v1.0.0

Co-Authored-By: Flying Nimbus Template System"

if git commit -m "$COMMIT_MESSAGE"; then
    print_success "Initial commit created"
else
    print_warning "Commit creation failed (files may already be committed)"
fi

# Final instructions
print_step 8 "Setup complete! 🎉"

echo ""
echo -e "${GREEN}✅ Project '$PROJECT_NAME' is ready for development!${NC}"
echo ""
echo "Next steps:"
echo "1. Start development server: ${YELLOW}npm run dev${NC}"

if [ -n "$FIREBASE_PROJECT_ID" ]; then
    echo "2. Deploy to Firebase: ${YELLOW}firebase deploy${NC}"
else
    echo "2. Configure Firebase: ${YELLOW}firebase init${NC}"
fi

if [ -n "$GITHUB_USERNAME" ]; then
    echo "3. Create GitHub repo: ${YELLOW}gh repo create $PROJECT_NAME --public${NC}"
    echo "4. Push to GitHub: ${YELLOW}git remote add origin git@github.com:$GITHUB_USERNAME/$PROJECT_NAME.git && git push -u origin main${NC}"
else
    echo "3. Create GitHub repository and push your code"
fi

echo ""
echo "AI Agent usage examples:"
echo "• ${BLUE}Use the backend-api subagent to create user authentication${NC}"
echo "• ${BLUE}Use the frontend-web subagent to build the landing page${NC}"  
echo "• ${BLUE}Use the orchestrator subagent to implement complete feature${NC}"
echo ""

echo "📚 Documentation:"
echo "• Project setup guide: ${YELLOW}PROJECT_STARTER.md${NC}"
echo "• Development standards: ${YELLOW}.claude/CLAUDE.md${NC}"
echo "• Agent documentation: ${YELLOW}.claude/agents/README.md${NC}"
echo ""

echo -e "${GREEN}Happy building! 🚀${NC}"

# Optional: Open in default editor
if command -v code &> /dev/null; then
    read -p "Open project in VS Code? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        code .
    fi
fi
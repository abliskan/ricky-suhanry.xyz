# Ricky Suhanry - Portfolio Website

A modern portfolio website built with Astro featuring static site generation with SPA-like features.

## 🚀 Live Demo

Visit the live website: [https://yourusername.github.io/your-repo-name](https://yourusername.github.io/your-repo-name)

## Features

- 🚀 Built with Astro.js
- 📝 Markdown and MDX support for content
- 🎨 Tailwind CSS for styling
- 🌓 Dark and light mode support
- 🔄 View Transitions API for smooth page transitions
- 📱 Responsive design
- 🔍 SEO optimized
- 📊 TypeScript support
- 🚀 Automated deployment with GitHub Pages
- 🔄 CI/CD with GitHub Actions
- 🛠️ Makefile with pre-commit hooks
- 🎯 Code quality tools (ESLint, Prettier)
- 🐕 **Husky + lint-staged integration**
- 📋 **Conventional commit validation**
- 🎯 **Staged file processing**

## 🛠️ Tech Stack

- **Framework**: [Astro](https://astro.build/)
- **Styling**: [Tailwind CSS](https://tailwindcss.com/)
- **Language**: [TypeScript](https://www.typescriptlang.org/)
- **Deployment**: [GitHub Pages](https://pages.github.com/)
- **CI/CD**: [GitHub Actions](https://github.com/features/actions)
- **Code Quality**: [ESLint](https://eslint.org/), [Prettier](https://prettier.io/)
- **Git Hooks**: [Husky](https://typicode.github.io/husky/), [lint-staged](https://github.com/okonet/lint-staged)
- **Development**: [Makefile](https://www.gnu.org/software/make/) for automation

## 🚀 Quick Start

### Prerequisites

- Node.js (version 18 or later)
- npm or yarn
- Git
- Make (for using Makefile commands)

### Quick Setup

```bash
# Clone the repository
git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name

# Quick project setup (install dependencies + setup Husky hooks)
make quick-start

# Start development server
make dev
```

### Manual Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. Install dependencies:
   ```bash
   make install
   # or
   npm install
   ```

3. Setup Husky hooks:
   ```bash
   make setup-husky
   ```

4. Start the development server:
   ```bash
   make dev
   # or
   npm run dev
   ```

5. Open your browser and go to [http://localhost:4321](http://localhost:4321)

## 🔧 Makefile Commands

### Development Commands
```bash
make help           # Show all available commands
make install        # Install dependencies + setup Husky
make dev           # Start development server
make build         # Build the project
make preview       # Preview the built site
make clean         # Clean build artifacts
```

### Code Quality Commands
```bash
make format        # Format code with Prettier
make lint          # Run ESLint checks
make lint-fix      # Run ESLint with auto-fix
make type-check    # Run TypeScript type checking
make quick-check   # Quick format + type check
```

### 🐕 Husky + lint-staged Commands
```bash
make setup-husky   # Setup Husky Git hooks
make remove-husky  # Remove Husky Git hooks
make test-hooks    # Test Git hooks manually
make lint-staged   # Run lint-staged on staged files
make staged-files  # Show currently staged files
```

### Deployment Commands
```bash
make deploy-local  # Build and prepare for deployment
make size-check    # Check bundle size after build
```

### Utility Commands
```bash
make info          # Show project information
make check-deps    # Check for outdated dependencies
make update-deps   # Update dependencies
make git-status    # Show detailed git status
make commit-example # Show commit message examples
```

## 🐕 Husky Integration

This project uses **Husky** and **lint-staged** for automated Git hooks:

### Pre-commit Hook
- **Triggers**: On every `git commit`
- **Actions**: 
  - Runs `lint-staged` on staged files only
  - Formats code with Prettier
  - Lints code with ESLint (with auto-fix)
  - Only processes files that are actually staged

### Pre-push Hook
- **Triggers**: On every `git push`
- **Actions**:
  - Runs TypeScript type checking
  - Tests project build
  - Prevents pushing if checks fail

### Commit Message Hook
- **Triggers**: On every commit message
- **Actions**:
  - Validates commit message format
  - Enforces [Conventional Commits](https://www.conventionalcommits.org/) standard
  - Provides helpful error messages with examples

### 📋 Conventional Commit Format

```bash
<type>[optional scope]: <description>

# Valid types:
feat     # New feature
fix      # Bug fix
docs     # Documentation changes
style    # Code style changes (formatting, etc.)
refactor # Code refactoring
test     # Adding or updating tests
chore    # Maintenance tasks
perf     # Performance improvements
ci       # CI/CD changes
build    # Build system changes
revert   # Reverting changes

# Examples:
feat: add new portfolio section
fix(header): resolve navigation issue
docs: update README with setup instructions
style: improve button hover effects
```

## 🎯 lint-staged Configuration

The project processes different file types appropriately:

```json
{
  "*.{js,ts,astro}": [
    "eslint --fix",
    "prettier --write"
  ],
  "*.{css,scss}": [
    "prettier --write"
  ],
  "*.{md,json,yaml,yml}": [
    "prettier --write"
  ]
}
```

## 📦 Build and Deploy

### Local Build

```bash
make build
# or
npm run build
```

### GitHub Pages Deployment

This project is configured for automatic deployment to GitHub Pages:

1. **Fork or clone** this repository to your GitHub account
2. **Update configuration**:
   - Edit `astro.config.mjs` and update the `site` and `base` URLs
   - Replace `yourusername` with your GitHub username
   - Replace `your-repo-name` with your repository name
3. **Enable GitHub Pages**:
   - Go to your repository settings
   - Navigate to "Pages" section
   - Set source to "GitHub Actions"
4. **Push to main branch** - the site will automatically build and deploy

## 🔧 Configuration

### Site Configuration

Update `astro.config.mjs`:

```js
export default defineConfig({
  site: 'https://yourusername.github.io',
  base: '/your-repo-name',
  // ... other config
});
```

### Personal Information

Update the following files with your information:
- `src/pages/index.astro` - Main portfolio content
- `src/components/Header.astro` - Navigation
- `src/components/Footer.astro` - Footer links

## 📁 Project Structure

```
/
├── .github/
│   └── workflows/          # GitHub Actions workflows
├── .husky/                 # Husky Git hooks
│   ├── pre-commit         # lint-staged execution
│   ├── pre-push           # type-check & build
│   └── commit-msg         # commit message validation
├── public/                 # Static assets
├── src/
│   ├── assets/            # Images and other assets
│   ├── components/        # Reusable Astro components
│   ├── content/           # Content collections (blog posts)
│   ├── layouts/           # Page layouts
│   └── pages/             # Pages and endpoints
├── .eslintrc.js           # ESLint configuration
├── .prettierrc.js         # Prettier configuration
├── .lintstagedrc.json     # lint-staged configuration
├── Makefile               # Development automation
├── astro.config.mjs       # Astro configuration
├── package.json           # Project dependencies
└── tailwind.config.mjs    # Tailwind CSS configuration
```

## 🔄 CI/CD Workflows

### Deploy Workflow (`.github/workflows/deploy.yml`)
- Triggers on push to `main` branch
- Builds and deploys to GitHub Pages
- Uses official Astro GitHub Action

### CI Workflow (`.github/workflows/ci.yml`)
- Runs on all branches except `main`
- Tests multiple Node.js versions (18, 20)
- Performs type checking and build verification

## 🎯 Git Hooks Workflow

### 1. Pre-commit (Automatic)
```bash
# When you run: git commit -m "feat: add new feature"
# Husky automatically runs:
1. lint-staged processes only staged files
2. Prettier formats the staged files
3. ESLint lints and fixes the staged files
4. If any step fails, commit is aborted
```

### 2. Pre-push (Automatic)
```bash
# When you run: git push
# Husky automatically runs:
1. TypeScript type checking
2. Project build test
3. If any step fails, push is aborted
```

### 3. Commit Message Validation (Automatic)
```bash
# When you commit with invalid message:
git commit -m "updated files"
# ❌ Husky rejects and shows format examples

# When you commit with valid message:
git commit -m "feat: add new portfolio section"
# ✅ Husky accepts and continues
```

## 🚀 Development Workflow

1. **Start Development**: `make dev`
2. **Make Changes**: Edit your code
3. **Stage Files**: `git add .`
4. **Check Staged**: `make staged-files`
5. **Commit**: `git commit -m "feat: your message"` (hooks run automatically)
6. **Push**: `git push` (hooks run automatically)

## 🎯 Benefits of Husky + lint-staged

1. **Performance**: Only processes staged files, not entire codebase
2. **Efficiency**: Automatic formatting and linting on commit
3. **Quality**: Prevents bad code from entering repository
4. **Consistency**: Enforces code style across team
5. **Standards**: Conventional commit messages for better changelog
6. **Safety**: Build verification before pushing

## 🎨 Customization

### Colors
Edit the color palette in `tailwind.config.mjs`:

```js
colors: {
  primary: {
    // Your primary color shades
  },
  // ... other colors
}
```

### Typography
Modify font settings in `tailwind.config.mjs` and update Google Fonts imports in `src/layouts/Layout.astro`.

### Code Quality Rules
- **ESLint**: Edit `.eslintrc.js` to customize linting rules
- **Prettier**: Edit `.prettierrc.js` to customize formatting rules
- **lint-staged**: Edit `.lintstagedrc.json` to customize staged file processing

## 🔧 Troubleshooting

### Husky Issues
```bash
# If hooks aren't working:
make remove-husky
make setup-husky

# Test hooks manually:
make test-hooks

# Check Husky status:
make info
```

### Commit Message Issues
```bash
# See valid commit examples:
make commit-example

# Test commit message format:
echo "feat: test message" | npx commitlint
```

### lint-staged Issues
```bash
# Run lint-staged manually:
make lint-staged

# Check staged files:
make staged-files

# Reset and re-stage:
git reset HEAD
git add .
```

Built with ❤️ using [Astro](https://astro.build/), automated with [Husky](https://typicode.github.io/husky/) + [lint-staged](https://github.com/okonet/lint-staged), and deployed on [GitHub Pages](https://pages.github.com/)
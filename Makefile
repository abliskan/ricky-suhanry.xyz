# Makefile for Ricky Suhanry Portfolio Website
# Author: Ricky Suhanry
# Description: Development utilities with Husky + lint-staged integration

.PHONY: help install dev build preview clean lint format type-check test pre-commit setup-hooks remove-hooks deploy-local

# Default target
.DEFAULT_GOAL := help

# Colors for output
RED := \033[0;31m
]
GREEN := \033[0;32m
]
YELLOW := \033[0;33m
]
BLUE := \033[0;34m
]
PURPLE := \033[0;35m
]
CYAN := \033[0;36m
]
WHITE := \033[0;37m
]
NC := \033[0m # No Color
]

# Project variables
PROJECT_NAME := ricky-portfolio
NODE_VERSION := 18
PACKAGE_MANAGER := npm

## Help
help: ## Show this help message
	@echo "$(CYAN)$(PROJECT_NAME) - Development Makefile with Husky + lint-staged$(NC)"
	@echo ""
	@echo "$(YELLOW)Available commands:$(NC)"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  $(GREEN)%-20s$(NC) %s\n", $$1, $$2}\' $(MAKEFILE_LIST)
	@echo ""
	@echo "$(PURPLE)🐕 Husky Integration:$(NC)"
	@echo "  $(GREEN)setup-husky$(NC)         Setup Husky Git hooks"
	@echo "  $(GREEN)remove-husky$(NC)        Remove Husky Git hooks"
	@echo "  $(GREEN)test-hooks$(NC)          Test Git hooks manually"

## Development
install: ## Install dependencies and setup Husky
	@echo "$(BLUE)📦 Installing dependencies...$(NC)"
	$(PACKAGE_MANAGER) install
	@echo "$(BLUE)🐕 Setting up Husky...$(NC)"
	$(PACKAGE_MANAGER) run prepare
	@echo "$(GREEN)✅ Dependencies and Husky installed successfully!$(NC)"

dev: ## Start development server
	@echo "$(BLUE)🚀 Starting development server...$(NC)"
	$(PACKAGE_MANAGER) run dev

build: ## Build the project
	@echo "$(BLUE)🏗️ Building project...$(NC)"
	$(PACKAGE_MANAGER) run build
	@echo "$(GREEN)✅ Build completed successfully!$(NC)"

preview: ## Preview the built site
	@echo "$(BLUE)👀 Starting preview server...$(NC)"
	$(PACKAGE_MANAGER) run preview

clean: ## Clean build artifacts and node_modules
	@echo "$(YELLOW)🧹 Cleaning build artifacts...$(NC)"
	rm -rf dist/
	rm -rf .astro/
	rm -rf node_modules/
	rm -rf .husky/_
	@echo "$(GREEN)✅ Clean completed!$(NC)"

## Code Quality
lint: ## Run linting checks
	@echo "$(BLUE)🔍 Running linting checks...$(NC)"
	$(PACKAGE_MANAGER) run lint
	@echo "$(GREEN)✅ Linting completed!$(NC)"

lint-fix: ## Run linting with auto-fix
	@echo "$(BLUE)🔧 Running linting with auto-fix...$(NC)"
	$(PACKAGE_MANAGER) run lint:fix
	@echo "$(GREEN)✅ Linting with auto-fix completed!$(NC)"

format: ## Format code with Prettier
	@echo "$(BLUE)💅 Formatting code...$(NC)"
	$(PACKAGE_MANAGER) run format
	@echo "$(GREEN)✅ Code formatting completed!$(NC)"

type-check: ## Run TypeScript type checking
	@echo "$(BLUE)🔍 Running type checks...$(NC)"
	$(PACKAGE_MANAGER) run type-check
	@echo "$(GREEN)✅ Type checking completed!$(NC)"

test: ## Run tests (if available)
	@echo "$(BLUE)🧪 Running tests...$(NC)"
	@if [ -f "package.json" ] && grep -q '"test"\' package.json; then \
		$(PACKAGE_MANAGER) run test; \
	else \
		echo "$(YELLOW)⚠️ No test script found in package.json$(NC)"; \
	fi

## Husky + lint-staged
setup-husky: ## Setup Husky Git hooks
	@echo "$(BLUE)🐕 Setting up Husky Git hooks...$(NC)"
	$(PACKAGE_MANAGER) run prepare
	@echo "$(GREEN)✅ Husky hooks installed successfully!$(NC)"
	@echo "$(CYAN)📋 Configured hooks:$(NC)"
	@echo "  • $(YELLOW)pre-commit$(NC): lint-staged (format & lint staged files)"
	@echo "  • $(YELLOW)pre-push$(NC): type-check & build"
	@echo "  • $(YELLOW)commit-msg$(NC): conventional commit format validation"

remove-husky: ## Remove Husky Git hooks
	@echo "$(YELLOW)🗑️ Removing Husky Git hooks...$(NC)"
	rm -rf .husky/_
	@echo "$(GREEN)✅ Husky hooks removed!$(NC)"

test-hooks: ## Test Git hooks manually
	@echo "$(BLUE)🧪 Testing Git hooks...$(NC)"
	@echo "$(CYAN)Testing pre-commit hook (lint-staged):$(NC)"
	npx lint-staged
	@echo "$(CYAN)Testing type-check:$(NC)"
	$(PACKAGE_MANAGER) run type-check
	@echo "$(GREEN)✅ All hooks tested successfully!$(NC)"

## Pre-commit (legacy support)
pre-commit: ## Run lint-staged (Husky integration)
	@echo "$(BLUE)🔍 Running pre-commit checks via lint-staged...$(NC)"
	npx lint-staged
	@echo "$(GREEN)✅ Pre-commit checks completed!$(NC)"

setup-hooks: setup-husky ## Alias for setup-husky (backward compatibility)

remove-hooks: remove-husky ## Alias for remove-husky (backward compatibility)

## Deployment
deploy-local: build ## Build and prepare for deployment
	@echo "$(BLUE)🚀 Preparing for deployment...$(NC)"
	@if [ -d "dist" ]; then \
		echo "$(GREEN)✅ Build artifacts ready in dist/ directory$(NC)"; \
		echo "$(CYAN)📁 Files ready for deployment:$(NC)"; \
		ls -la dist/; \
	else \
		echo "$(RED)❌ Build failed - dist/ directory not found$(NC)"; \
		exit 1; \
	fi

## Utilities
check-deps: ## Check for outdated dependencies
	@echo "$(BLUE)🔍 Checking for outdated dependencies...$(NC)"
	$(PACKAGE_MANAGER) outdated

update-deps: ## Update dependencies
	@echo "$(BLUE)⬆️ Updating dependencies...$(NC)"
	$(PACKAGE_MANAGER) update
	@echo "$(GREEN)✅ Dependencies updated!$(NC)"

info: ## Show project information
	@echo "$(CYAN)📊 Project Information:$(NC)"
	@echo "  Name: $(PROJECT_NAME)"
	@echo "  Node Version: $(NODE_VERSION)"
	@echo "  Package Manager: $(PACKAGE_MANAGER)"
	@echo "  Git Branch: $$(git branch --show-current 2>/dev/null || echo 'Not a git repository')"
	@echo "  Git Status: $$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ') files changed"
	@echo ""
	@echo "$(CYAN)🔧 Environment:$(NC)"
	@echo "  Node: $$(node --version 2>/dev/null || echo 'Not installed')"
	@echo "  NPM: $$(npm --version 2>/dev/null || echo 'Not installed')"
	@echo "  Git: $$(git --version 2>/dev/null || echo 'Not installed')"
	@echo ""
	@echo "$(CYAN)🐕 Husky Status:$(NC)"
	@if [ -d ".husky" ]; then \
		echo "  Status: $(GREEN)Installed$(NC)"; \
		echo "  Hooks: $$(ls .husky/ 2>/dev/null | grep -v _ | tr '\n' ' ')"; \
	else \
		echo "  Status: $(YELLOW)Not installed$(NC)"; \
	fi

## Quick commands
quick-start: install ## Quick project setup (install + setup Husky)
	@echo "$(GREEN)🎉 Project setup completed! You can now run 'make dev' to start development.$(NC)"
	@echo "$(CYAN)💡 Tip: Husky hooks are now active for all commits and pushes!$(NC)"

quick-check: format type-check ## Quick code quality check
	@echo "$(GREEN)✅ Quick checks completed!$(NC)"

## Advanced
watch-build: ## Watch for changes and rebuild
	@echo "$(BLUE)👀 Watching for changes...$(NC)"
	@while true; do \
		inotifywait -r -e modify,create,delete src/ 2>/dev/null && \
		echo "$(YELLOW)🔄 Changes detected, rebuilding...$(NC)" && \
		make build; \
	done

size-check: build ## Check bundle size
	@echo "$(BLUE)📏 Checking bundle size...$(NC)"
	@if [ -d "dist" ]; then \
		echo "$(CYAN)📊 Bundle size analysis:$(NC)"; \
		du -sh dist/; \
		echo "$(CYAN)📋 Largest files:$(NC)"; \
		find dist/ -type f -exec du -h {} + | sort -rh | head -10; \
	else \
		echo "$(RED)❌ No build found. Run 'make build' first.$(NC)"; \
	fi

## Git helpers
git-status: ## Show detailed git status
	@echo "$(CYAN)📋 Git Status:$(NC)"
	@git status
	@echo ""
	@echo "$(CYAN)📝 Recent commits:$(NC)"
	@git log --oneline -5

commit-check: test-hooks ## Run all checks before committing
	@echo "$(GREEN)✅ Ready to commit! All checks passed.$(NC)"

## Lint-staged specific
lint-staged: ## Run lint-staged manually
	@echo "$(BLUE)🎯 Running lint-staged on staged files...$(NC)"
	npx lint-staged
	@echo "$(GREEN)✅ Lint-staged completed!$(NC)"

staged-files: ## Show currently staged files
	@echo "$(CYAN)📁 Currently staged files:$(NC)"
	@git diff --cached --name-only

## Commit helpers
commit-example: ## Show commit message examples
	@echo "$(CYAN)📝 Conventional Commit Examples:$(NC)"
	@echo ""
	@echo "$(GREEN)✅ Valid formats:$(NC)"
	@echo "  feat: add new portfolio section"
	@echo "  fix(header): resolve navigation issue"
	@echo "  docs: update README with setup instructions"
	@echo "  style: improve button hover effects"
	@echo "  refactor(components): reorganize file structure"
	@echo "  test: add unit tests for utilities"
	@echo "  chore: update dependencies"
	@echo "  perf: optimize image loading"
	@echo "  ci: update GitHub Actions workflow"
	@echo "  build: configure new build tool"
	@echo ""
	@echo "$(YELLOW)⚠️ Invalid formats:$(NC)"
	@echo "  'updated files' (no type)"
	@echo "  'fix: this is a very long commit message that exceeds fifty characters' (too long)"
	@echo "  'Fix: capitalized type' (should be lowercase)"
# Photography Gallery Workspace

This VS Code workspace is configured for your photography gallery project using Thumbsup.

## Quick Start

### Option 1: Using VS Code Tasks (Recommended)

1. Open the Command Palette (`Cmd+Shift+P`)
2. Run `Tasks: Run Task`
3. Choose from available tasks:
   - **Setup Everything**: Installs GraphicsMagick and Thumbsup
   - **Build Gallery**: Generates the static gallery
   - **Run Server**: Starts local server on port 8000
   - **Build and Run**: Builds gallery and starts server

### Option 2: Manual Commands

```bash
# Install dependencies
brew install graphicsmagick
npm install -g thumbsup

# Build gallery
thumbsup --config config.json

# Run local server
python3 -m http.server 8000 --directory build_output
```

## Available Tasks

- **Install Dependencies**: Installs GraphicsMagick via Homebrew
- **Install Thumbsup**: Installs Thumbsup globally via npm
- **Build Gallery**: Generates static gallery files in `build_output/`
- **Run Server**: Starts HTTP server to preview gallery
- **Setup Everything**: Runs both install tasks in sequence
- **Build and Run**: Builds gallery and starts server

## Workspace Features

- File nesting for better organization
- Excluded build artifacts from search
- Handlebars syntax highlighting for theme files
- Python integration for running the local server
- Recommended extensions for web development

## Viewing Your Gallery

After running the **Build and Run** task, your gallery will be available at:
<http://localhost:8000>

## Project Structure

- `gallery/`: Source images organized by category
- `theme/`: Custom theme files (Handlebars templates)
- `build_output/`: Generated static gallery files
- `config.json`: Thumbsup configuration
- `.github/workflows/`: GitHub Actions for automated deployment

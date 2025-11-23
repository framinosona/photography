# Photography

Welcome to the **Photography** repository! This project is designed to showcase a collection of photographs through a web-based static gallery.

## Getting Started

Follow these steps to set up and run the project locally:

### macOS Setup

1. Install Dependencies:

```bash
brew install python3 exiftool graphicsmagick
```

```bash
sudo apt-get update
sudo apt-get install -y python3 exiftool graphicsmagick
```

2. Install Node 18 (thumbsup needs it):

```bash
brew install nvm
nvm install 18
nvm use 18
```

3. Install Thumbsup:

```bash
npm install -g thumbsup
```

### Build the Gallery

1. **Clone Repository**:

```bash
git clone https://github.com/framinosona/photography.git
cd photography
```

1. **Run thumbsup**:

```bash
thumbsup --config config.json
```

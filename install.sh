#!/usr/bin/env bash
set -e

# hunty installer
# Usage: curl -fsSL https://raw.githubusercontent.com/dblumenau/hunty/main/install.sh | bash

REPO="dblumenau/hunty"
BRANCH="main"
INSTALL_DIR="${HUNTY_INSTALL_DIR:-$HOME/.local/bin}"

echo "🔍 Installing hunty..."

# Create install directory
mkdir -p "$INSTALL_DIR"

# Download main script
curl -fsSL "https://raw.githubusercontent.com/$REPO/$BRANCH/hunty" -o "$INSTALL_DIR/hunty"
chmod +x "$INSTALL_DIR/hunty"

echo ""
echo "✅ hunty installed to $INSTALL_DIR/hunty"
echo ""

# Check if install dir is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "⚠️  $INSTALL_DIR is not in your PATH"
    echo ""
    echo "Add this to your ~/.zshrc or ~/.bashrc:"
    echo "  export PATH=\"\$PATH:$INSTALL_DIR\""
    echo ""
fi

# Check dependencies
echo "Checking dependencies..."
missing_deps=()
command -v gum &> /dev/null || missing_deps+=("gum")
command -v fd &> /dev/null || missing_deps+=("fd")
command -v rg &> /dev/null || missing_deps+=("ripgrep")
command -v jq &> /dev/null || missing_deps+=("jq")
command -v fzf &> /dev/null || missing_deps+=("fzf")

if [ ${#missing_deps[@]} -gt 0 ]; then
    echo ""
    echo "⚠️  Missing dependencies: ${missing_deps[*]}"
    echo ""
    echo "Install with:"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "  brew install ${missing_deps[*]}"
    elif command -v apt &> /dev/null; then
        echo "  sudo apt install ${missing_deps[*]}"
    elif command -v dnf &> /dev/null; then
        echo "  sudo dnf install ${missing_deps[*]}"
    elif command -v pacman &> /dev/null; then
        echo "  sudo pacman -S ${missing_deps[*]}"
    else
        echo "  brew install ${missing_deps[*]}  (macOS)"
        echo "  apt install ${missing_deps[*]}   (Debian/Ubuntu)"
    fi
else
    echo "✅ All dependencies installed"
fi

echo ""
echo "Run 'hunty' to get started, or 'hunty -h' for help"
echo ""
echo "💅 The hunt is ON, hunty."

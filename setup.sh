#!/bin/bash
# X/Twitter 工具链安装脚本
# 自动安装 x-tweet-fetcher 和 Camofox 浏览器

set -e

echo "🐦 X/Twitter 工具链安装器"
echo "=========================="

# 检查依赖
echo "📋 检查依赖..."
command -v python3 >/dev/null 2>&1 || { echo "❌ 需要 Python 3"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "❌ 需要 Node.js"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "❌ 需要 npm"; exit 1; }
command -v git >/dev/null 2>&1 || { echo "❌ 需要 Git"; exit 1; }

echo "✅ 依赖检查通过"

# 创建工作目录
WORK_DIR="${1:-$HOME/workspace}"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

echo ""
echo "📁 工作目录: $WORK_DIR"

# 安装 x-tweet-fetcher
if [ ! -d "x-tweet-fetcher" ]; then
    echo "📥 克隆 x-tweet-fetcher..."
    git clone https://github.com/ythx-101/x-tweet-fetcher.git
else
    echo "✅ x-tweet-fetcher 已存在"
fi

# 安装可选依赖
echo ""
echo "📦 安装 Python 依赖..."
pip3 install --user ddgs 2>/dev/null || pip3 install ddgs --break-system-packages 2>/dev/null || echo "⚠️  ddgs 安装失败，可手动安装"

# 安装 Camofox
if [ ! -d "camofox-browser" ]; then
    echo ""
    echo "📥 克隆 Camofox 浏览器..."
    git clone https://github.com/jo-inc/camofox-browser.git
    cd camofox-browser
    echo "📦 安装 npm 依赖 (可能需要几分钟)..."
    npm install
    cd ..
else
    echo "✅ camofox-browser 已存在"
fi

echo ""
echo "✅ 安装完成！"
echo ""
echo "🚀 快速开始:"
echo "   cd $WORK_DIR/x-tweet-fetcher"
echo "   python3 scripts/fetch_tweet.py --user elonmusk --limit 5"
echo ""
echo "🔧 启动 Camofox (需要时):"
echo "   cd $WORK_DIR/camofox-browser && npm start"
echo ""

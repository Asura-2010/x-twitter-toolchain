#!/bin/bash
# 关键词发现推文示例

if [ -z "$1" ]; then
    echo "用法: $0 <关键词1>[,关键词2,...] [数量]"
    echo "示例: $0 'OpenClaw' 5"
    echo "示例: $0 'AI Agent,LLM tools' 10"
    exit 1
fi

KEYWORDS="$1"
LIMIT="${2:-5}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FETCHER_DIR="${SCRIPT_DIR}/../x-tweet-fetcher"

if [ ! -d "$FETCHER_DIR" ]; then
    FETCHER_DIR="$HOME/workspace/x-tweet-fetcher"
fi

if [ ! -d "$FETCHER_DIR" ]; then
    echo "❌ 找不到 x-tweet-fetcher 目录"
    exit 1
fi

cd "$FETCHER_DIR"
python3 scripts/x_discover.py --keywords "$KEYWORDS" --limit "$LIMIT" --json

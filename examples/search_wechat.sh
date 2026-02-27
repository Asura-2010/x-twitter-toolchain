#!/bin/bash
# 搜狗微信文章搜索示例

if [ -z "$1" ]; then
    echo "用法: $0 <关键词> [数量]"
    echo "示例: $0 'AI Agent' 5"
    exit 1
fi

KEYWORD="$1"
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
python3 scripts/sogou_wechat.py --keyword "$KEYWORD" --limit "$LIMIT" --json

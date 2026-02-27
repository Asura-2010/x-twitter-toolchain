#!/bin/bash
# 抓取用户时间线示例

if [ -z "$1" ]; then
    echo "用法: $0 <用户名> [数量]"
    echo "示例: $0 elonmusk 10"
    exit 1
fi

USERNAME="$1"
LIMIT="${2:-10}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FETCHER_DIR="${SCRIPT_DIR}/../x-tweet-fetcher"

if [ ! -d "$FETCHER_DIR" ]; then
    # 尝试相对路径
    FETCHER_DIR="$HOME/workspace/x-tweet-fetcher"
fi

if [ ! -d "$FETCHER_DIR" ]; then
    echo "❌ 找不到 x-tweet-fetcher 目录"
    echo "请先运行 ./setup.sh 安装"
    exit 1
fi

cd "$FETCHER_DIR"
python3 scripts/fetch_tweet.py --user "$USERNAME" --limit "$LIMIT" --pretty

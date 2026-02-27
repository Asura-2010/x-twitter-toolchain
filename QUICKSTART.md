# 快速开始

## 一键安装

```bash
./setup.sh [工作目录]
```

默认工作目录：`~/workspace`

## 使用示例

### 1. 抓取用户时间线
```bash
./examples/fetch_user.sh elonmusk 10
```

### 2. 搜索微信文章
```bash
./examples/search_wechat.sh "AI Agent" 5
```

### 3. 关键词发现推文
```bash
./examples/discover_tweets.sh "OpenClaw" 5
```

### 4. 启动 Camofox (反爬支持)
```bash
cd ~/workspace/camofox-browser
npm start
```

## 手动使用

```bash
cd ~/workspace/x-tweet-fetcher

# 抓取推文
python3 scripts/fetch_tweet.py --user "username" --limit 5 --json

# 微信搜索
python3 scripts/sogou_wechat.py --keyword "关键词" --limit 5 --json

# 关键词发现
python3 scripts/x_discover.py --keywords "AI,LLM" --limit 5 --json
```

## 输出格式

- `--json`: 结构化 JSON (推荐，保留完整链接)
- `--text-only`: 人类可读格式
- `--pretty`: 格式化的 JSON

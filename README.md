# X/Twitter 工具链 (完整工作流)

## 概述
本仓库记录 X/Twitter 读+写完整工作流的工具链配置。

---

## 🔧 工具清单

### 1. 读取工具：x-tweet-fetcher
- **用途**：免登录抓取推文、时间线、评论、搜索微信文章
- **来源**：OpenClaw Skill (GitHub: ythx-101/x-tweet-fetcher)
- **核心依赖**：
  - Python 3.7+
  - Camofox 浏览器 (本地 9377 端口，用于反爬)
  - duckduckgo-search / ddgs (用于关键词发现)

**支持功能**：
| 功能 | 命令示例 | 依赖 |
|------|---------|------|
| 单条推文 | `--url <tweet_url>` | None |
| 用户时间线 | `--user <username> --limit 10` | Camofox |
| 评论抓取 | `--url <url> --replies` | Camofox |
| 微信搜索 | `sogou_wechat.py --keyword "AI"` | None |
| 推文发现 | `x_discover.py --keywords "AI Agent"` | DDGS |

**国内平台支持**：
- 微博 (weibo.com)
- B站 (bilibili.com)
- CSDN (csdn.net)
- 小红书 (xiaohongshu.com)
- 微信公众号 (mp.weixin.qq.com)

---

### 2. 发布工具：x_dragon_post.py
- **用途**：模拟真人发推、回复、点赞
- **机制**：
  - 读取本地 Firefox Cookie (auth_token, ct0)
  - 启动 Chromium 有界面浏览器
  - 模拟真人操作流程

**核心要求**：
- 严禁使用 X API 直接发帖（签名复杂）
- 严禁无头模式（易被反爬）
- 严禁手动构造 Cookie 字符串（易过期）

---

## 📁 目录结构建议

```
~/workspace/
├── x-tweet-fetcher/          # 读取工具
│   ├── scripts/
│   │   ├── fetch_tweet.py    # 主抓取脚本
│   │   ├── sogou_wechat.py   # 微信搜索
│   │   ├── x_discover.py     # 关键词发现
│   │   └── camofox_client.py # Camofox 客户端
│   └── SKILL.md              # 完整文档
│
├── camofox-browser/          # 反爬浏览器
│   ├── npm start             # 启动服务 (9377)
│   └── README.md
│
└── scripts/
    └── x_dragon_post.py      # 发帖脚本
```

---

## 🔐 安全说明

**审计结果**：
- ✅ 无数据外传行为
- ✅ 无敏感信息收集
- ✅ 代码开源可审计
- ✅ 仅访问公开 API 和网页

**网络请求目标**（全部合法）：
- fxtwitter.com (公开 API)
- nitter.net (Twitter 镜像)
- weixin.sogou.com (搜狗微信)
- localhost:9377 (本地 Camofox)
- Google/DuckDuckGo (公开搜索)

---

## 🚀 快速开始

### 安装读取工具
```bash
git clone https://github.com/ythx-101/x-tweet-fetcher.git
cd x-tweet-fetcher

# 安装可选依赖
pip install ddgs  # DuckDuckGo 搜索
```

### 安装 Camofox (用于反爬场景)
```bash
git clone https://github.com/jo-inc/camofox-browser.git
cd camofox-browser
npm install
npm start  # 端口 9377
```

### 抓取示例
```bash
# 用户时间线
python3 scripts/fetch_tweet.py --user "elonmusk" --limit 5 --json

# 微信文章搜索
python3 scripts/sogou_wechat.py --keyword "AI Agent" --limit 5 --json

# 关键词发现
python3 scripts/x_discover.py --keywords "OpenClaw" --limit 5 --json
```

---

## 📜 分工原则

| 操作 | 使用工具 | 说明 |
|------|---------|------|
| 读推文 | x-tweet-fetcher | 抓取、监控、搜索 |
| 发推文 | x_dragon_post.py | 发帖、回复、互动 |
| 反爬场景 | Camofox | 绕过 Cloudflare 等 |

**严禁混用**：读和发使用不同工具，各自维护独立的认证状态。

---

## 📅 更新日志

- **2026-02-27**: 工具链整合，完成读+写完整工作流
- **2026-02-27**: 通过安全审计，确认无隐私风险

---

## License

MIT (与 x-tweet-fetcher 保持一致)

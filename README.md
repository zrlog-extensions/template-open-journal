# Open Journal

面向 ZrLog 的 FreeMarker 博客主题。参考 Google 官方博客 The Keyword 的编辑版式：大标题、宽松留白、首篇焦点文章、规则卡片和蓝色点缀，展示你自己的站点名称与文章。

主题使用系统字体和本地资源，提供响应式导航、搜索、分类入口、文章详情及中英文文案。视觉与交互约定见 [设计说明](docs/design.md)。

当前版本为 **0.1.0**，源码托管于独立仓库 [zrlog-extensions/template-open-journal](https://github.com/zrlog-extensions/template-open-journal)，尚未发布 Release。已通过公共工具锁定的 ZrLog **3.9.2** 目录/ZIP 安装验收，以及桌面、手机浏览器检查。`theme.json` 的 `latestRelease` 保持 `null`，正式发布后由公共工具生成下载信息。

![Open Journal 首页预览](images/preview.jpg)

完整效果：[桌面首页](docs/screenshots/desktop-home.png) · [手机首页](docs/screenshots/mobile-home.png) · [文章详情](docs/screenshots/desktop-article.png)。截图使用公共基准文章，实际站点展示自己的内容。

## 开发与预览

需要 **JDK 17+、Git、Bash 和 curl**。公共工具使用 Maven Wrapper，无需单独安装 Maven；首次构建和预览需要联网下载依赖与固定运行时。主题本身没有前端构建步骤，修改 JavaScript 时使用 Node 检查语法。

将本主题与公共 `templates` 工程放在同一级目录。在主题根目录执行；已有 `../templates` 时跳过克隆步骤：

```bash
git clone https://github.com/zrlog-extensions/templates.git ../templates
git -C ../templates checkout fa397df332576b9dd798ac59a40d4ba96b3266a7
(cd ../templates && ./mvnw verify)
../templates/bin/theme check .
../templates/bin/theme preview . --port 7080
```

打开 **http://127.0.0.1:7080**。预览使用真实 ZrLog 前台、独立 SQLite 数据库及固定示例文章。修改 FTL/CSS/JS 后刷新页面；按 Ctrl+C 结束预览并清理临时站点。元信息、语言文件和配置变更后需要重启。

工具提交与 [toolkit.lock.json](toolkit.lock.json) 和 [CI](.github/workflows/theme.yml) 一致。升级时同时更新 README、锁文件及 workflow 的两个提交引用，并重新验收。模板字段和打包约定见 [公共主题规范](https://github.com/zrlog-extensions/templates/blob/fa397df332576b9dd798ac59a40d4ba96b3266a7/docs/theme-contract.md)。

## 主题配置

在 ZrLog 后台的主题配置中填写以下内容；留空时使用主题的中英文默认文案。

| 配置 | 用途 |
| --- | --- |
| `introTitle` | 首页标题 |
| `introText` | 首页标题下的简短介绍 |
| `footerText` | 页脚说明 |

配置定义位于 [setting/config-form.json](setting/config-form.json)，本地预览的值见 [examples/preview-settings.json](examples/preview-settings.json)。结束当前预览后，可分别检查配置、空列表或空评论：

```bash
../templates/bin/theme preview . --settings examples/preview-settings.json
../templates/bin/theme preview . --empty
../templates/bin/theme preview . --comments empty
```

默认评论只是固定预览内容，用于验证容器布局；真实评论提交和后台配置表单还需在实际站点检查。独立静态托管时，搜索和评论仍需要可访问的 ZrLog 后端。

## 构建与验收

在主题根目录执行：

```bash
../templates/bin/theme check .
for script in js/*.js; do node --check "$script"; done
bash bin/package.sh
bash ../templates/bin/verify-preview.sh . 17081 template-open-journal
```

公共 Java 工具生成 `dist/template-open-journal.zip` 和 `.zip.sha256`。ZIP 根目录直接包含 `template.properties`，只打包运行所需的模板、语言、配置与静态资源。`bin/package.sh` 默认使用相邻的 `templates` 工程，其他位置可通过 `ZRLOG_TEMPLATES_DIR` 指定。

验收脚本分别检查源码目录预览和经过真实安装器安装的 ZIP，结果保存在 `../templates/target/preview-check/template-open-journal/`。脚本通过后，还需在桌面 **1440×1000** 和手机 **390×844** 检查首页、详情、列表、空态、导航与搜索，确认键盘操作、正文图片、表格和代码可用且页面无横向溢出。完整项目见 [公共验收流程](https://github.com/zrlog-extensions/templates/blob/fa397df332576b9dd798ac59a40d4ba96b3266a7/docs/development.md)。

本次验收记录：[目录和 ZIP 结果](docs/runtime-acceptance.json)、[浏览器结果](docs/browser-acceptance.json)。已覆盖双语页面、标签/分类/归档/友链聚合页、搜索特殊字符、无封面回退、空内容、配置、无评论、键盘操作和无 JavaScript 情况。缺失文章沿用基准运行时的 HTTP 200 行为，页面显示未找到提示。

正文数学样式和字体固定使用 KaTeX 0.16.22，以匹配编辑器已有的公式 HTML；不添加公式渲染脚本。来源和许可证见 [第三方资源说明](docs/third-party.md)。

## 发布与主题市场

本仓库维护源码、设计、版本和 `theme.json`；[templates](https://github.com/zrlog-extensions/templates) 提供公共构建上传工具及主题索引，供 zrlog-www 呈现主题市场。

普通 `main` push 和 PR 会调用公共 workflow 构建及验证目录/ZIP；推送 `v<version>` tag 才会上传 GitHub Release。发布前应确认 `template.properties` 的版本、验收记录和预览图已更新。

以当前 `version=0.1.0` 为例，先生成可审阅的发布文件：

```bash
../templates/bin/theme publish . --tag v0.1.0 --output-dir dist --dry-run
```

确认远端仓库和 CI 可用、验收通过且修改已提交后，再触发正式发布：

```bash
git tag v0.1.0
git push origin v0.1.0
```

tag 去掉 `v` 后必须与主题版本完全一致。公共 Java 发布器上传 ZIP、SHA-256 和带真实下载信息的 `theme.json`；`--dry-run` 不上传，也不代表已经发布。

发布成功后，在 templates 的 `catalog.sources.json` 登记稳定配置地址 `https://github.com/zrlog-extensions/template-open-journal/releases/latest/download/theme.json`，由索引分配市场 ID。索引同步只获取配置文件，不拉取主题源码或 ZIP。未发布时可登记源码中的配置，但不能提供安装链接。也可改为自行维护 Release，具体约定见 [发布与市场配置契约](https://github.com/zrlog-extensions/templates/blob/fa397df332576b9dd798ac59a40d4ba96b3266a7/docs/publication-and-market.md)。

# Open Journal 工作约定

- 独立 ZrLog FreeMarker 主题，运行文件位于仓库根目录。
- 先读 docs/design.md，公共接口遵循 templates/docs/theme-contract.md 和固定 3.9.2 运行时。
- 参考 Google The Keyword 的编辑版式：留白、大标题、首篇焦点区、规则卡片、蓝色点缀；使用站点自己的品牌与文章数据。
- 公共 Java 工具负责构建/发布，不加入 Python 工具或复制服务端路由、DTO、模板引擎。
- README 命令、toolkit.lock.json 和可复用 workflow 使用相同的固定工具提交。
- 交付前运行 check、构建、目录/ZIP 真实冒烟和桌面/手机浏览器验收；修改 JS 要做语法检查。
- 未发布的 latestRelease 保持 null；不将源码复制回索引仓库。
- 不提交 dist、缓存、运行数据库或凭据。

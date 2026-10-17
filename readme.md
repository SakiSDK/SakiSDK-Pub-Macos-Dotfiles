<div align="center">

# 🍎 SakiSDK's macOS Dotfiles

**我的 macOS 生产力工具配置文件备份与管理**

[![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/macos/)
[![AeroSpace](https://img.shields.io/badge/AeroSpace-FF5722?style=for-the-badge&logo=windowsterminal&logoColor=white)](https://github.com/nikitabobko/AeroSpace)
[![WezTerm](https://img.shields.io/badge/WezTerm-4EAA25?style=for-the-badge&logo=gnometerminal&logoColor=white)](https://wezfurlong.org/wezterm/)

</div>

---

## 📂 配置文件一览

这里是本仓库包含的所有配置文件清单以及它们在系统中的对应位置：

| 图标 | 应用 / 工具 | 仓库内文件 | 说明 |
| :---: | :--- | :--- | :--- |
| 🚀 | **AeroSpace** | [`.aerospace.toml`](./.aerospace.toml) | 平铺窗口管理器，负责布局与核心快捷键 |
| 🍎 | **macOS Shell** | [`.zshrc`](./.zshrc) | Zsh 终端的环境变量、别名与主题配置 |
| ⌨️ | **skhd** | [`.skhdrc`](./.skhdrc) | 轻量级快捷键守护进程，补充系统快捷键 |
| 💻 | **WezTerm** | [`wezterm.lua`](./wezterm.lua) | GPU 加速终端模拟器的美化与功能配置 |

---

## 🛠️ 如何恢复配置 (Installation)

如果你换了一台新 Mac，可以通过以下步骤快速恢复这些配置环境：

### 1. 克隆仓库到本地
将本仓库克隆到用户主目录下的 `dotfiles` 文件夹中：
```bash
git clone https://github.com/SakiSDK/SakiSDK-Pub-Macos-Dotfiles.git ~/dotfiles
```

### 2. 将配置部署到系统

> 💡 **提示**：你可以选择“直接复制”或者“建立软链接”。推荐使用**软链接**，这样你在系统里修改配置时，Git 仓库会自动同步变化。

<details>
<summary><b>方案 A：直接复制文件（推荐新手）</b></summary>

```bash
cp ~/dotfiles/.aerospace.toml ~/.aerospace.toml
cp ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/.skhdrc ~/.config/skhd/skhdrc
cp ~/dotfiles/wezterm.lua ~/.config/wezterm/wezterm.lua
```
</details>

<details>
<summary><b>方案 B：建立软链接（推荐进阶玩家）</b></summary>

```bash
# 建立软链接（注意：如果目标路径已有文件，需先删除原文件）
ln -s ~/dotfiles/.aerospace.toml ~/.aerospace.toml
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.skhdrc ~/.config/skhd/skhdrc
ln -s ~/dotfiles/wezterm.lua ~/.config/wezterm/wezterm.lua
```
</details>

### 3. 重新加载配置
完成文件部署后，需重新加载各项服务使配置生效：

* **重新加载 AeroSpace**
```bash
aerospace reload-config
```

* **重新加载 Zsh 终端**
```bash
source ~/.zshrc
```

* **重新加载 skhd**
```bash
skhd --restart-service
```

---

## 📸 预览
* wezterm美化后图片
<div align="center">
  <!-- 建议在这里替换为你自己的桌面截图 -->
  <img src="./preview/wezterm-preview.png" width="80%" alt="Desktop Preview">
</div>

---
<div align="center">
  <i>Generated with ❤️ by SakiSDK</i>
</div>
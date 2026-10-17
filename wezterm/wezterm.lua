-- local wezterm = require("wezterm")

-- wezterm.on("format-tab-title", function(tab)
-- 	local mac_icon = ""
-- 	local title = tab.active_pane.title or "terminal"

-- 	return {
-- 		{ Text = "" .. mac_icon .. " " .. title .. "" },
-- 	}
-- end)

-- local config = {
-- 	font_size = 13,
-- 	font = wezterm.font("JetBrainsMono Nerd Font", {
-- 		weight = "Regular",
-- 	}),
-- 	color_scheme = "Catppuccin Mocha",
-- 	colors = {
-- 		tab_bar = {
-- 			background = "#1e1e2e",
-- 			active_tab = {
-- 				bg_color = "#313244",
-- 				fg_color = "#cdd6f4",
-- 				intensity = "Bold",
-- 			},
-- 			inactive_tab = {
-- 				bg_color = "#1e1e2e",
-- 				fg_color = "#6c7086",
-- 			},
-- 			inactive_tab_hover = {
-- 				bg_color = "#45475a",
-- 				fg_color = "#cdd6f4",
-- 			},
-- 		},
-- 	},

-- 	-- 关闭时提示
-- 	window_close_confirmation = "NeverPrompt",
-- 	-- 自动提示
-- 	automatically_reload_config = true,
-- 	-- 是否关闭花哨标签栏
-- 	--use_fancy_tab_bar = false,
-- 	-- 只有一个tab时，直接影藏tab栏
-- 	--hide_tab_bar_if_only_one_tab = true,
-- 	--macos窗口装饰类型
-- 	window_decorations = "RESIZE",
-- 	-- 隐藏tab栏右侧的加号按钮
-- 	--show_new_tab_button_in_tab_bar = false,
-- 	-- 整个窗口透明度
-- 	window_background_opacity = 0.9,
-- 	-- 毛玻璃模糊强度
-- 	macos_window_background_blur = 70,
-- 	--文本沪指区域的透明度
-- 	text_background_opacity = 0.9,
-- 	--改字体大小的时候，不自动改窗口大小
-- 	adjust_window_size_when_changing_font_size = false,
-- 	-- 终端内容与窗口边缘的内边距
-- 	window_padding = {
-- 		left = 20,
-- 		right = 20,
-- 		top = 20,
-- 		bottom = 20,
-- 	},
-- }

-- return config

local Config = require("config")

require("events.right-status").setup()
require("events.tab-title").setup()
require("events.new-tab-button").setup()

return Config:init()
  :append(require("config.appearance"))
  :append(require("config.bindings"))
  :append(require("config.domains"))
  :append(require("config.fonts"))
  :append(require("config.general"))
  :append(require("config.launch")).options

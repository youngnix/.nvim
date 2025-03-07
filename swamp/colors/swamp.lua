local p = {
	editor_bg = "#202020",
	editor_fg = "#E7DED5",
	accent = "#93c944",
	accent_alt = "#b58d48",
	lesser_accent = "#686868",
}

local groups = {
	Normal = {
		bg = p.editor_bg,
		fg = p.editor_fg,
	},
	-- Cursor = {
	-- 	bg = p.accent,
	-- 	bg = p.accent,
	-- },
	Visual = {
		bg = p.accent,
		fg = p.editor_bg,
	},
	Function = {
		fg = p.accent,
	},
	Keyword = {
		fg = p.accent,
	},
	CurSearch = {
		fg = p.accent,
	},
	IncSearch = {
		bold = true,
		bg = p.accent,
		fg = p.editor_bg,
	},
	LineNrAbove = {
		fg = p.lesser_accent,
	},
	LineNrBelow = {
		fg = p.lesser_accent,
	},
	LineNr = {
		fg = p.editor_fg,
	},
	CursorLineNr = {
		fg = p.editor_fg,
	},
	Pmenu = {
		fg = p.editor_fg,
		bg = p.editor_bg,
	},
	PmenuSel = {
		fg = p.editor_bg,
		bg = p.lesser_accent,
	},
	MatchParen = {
		fg = p.editor_fg,
	},
	ModeMsg = {
		fg = p.accent,
	},
	NonText = {
		fg = p.lesser_accent,
	},
	TermCursor = {
		bg = p.editor_fg,
		fg = p.editor_bg,
	},
	Directory = {
		fg = p.accent,
	},

	-- Treesitter groups
	["@attribute"] = {
		fg = p.accent_alt,
	},
	["@operator"] = {
		fg = p.lesser_accent,
	},
	["@keyword.function"] = {
		link = "Keyword",
	},
	["@keyword.operator"] = {
		fg = p.accent,
	},
	["@function"] = {
		fg = p.accent,
	},
	["@function.call"] = {
		fg = p.accent,
	},
	["@type"] = {
		fg = p.accent_alt,
	},
	["@constant"] = {
		fg = p.accent_alt,
	},
	["@type.builtin"] = {
		link = "Keyword",
	},
	["@keyword.conditional"] = {
		fg = p.accent,
	},
	["@keyword.type"] = {
		link = "Keyword",
	},
	["@keyword.return"] = {
		link = "Keyword",
	},
	["@keyword.repeat"] = {
		fg = p.accent,
	},
	["@keyword"] = {
		link = "Keyword",
	},
	["@comment"] = {
		fg = p.lesser_accent,
	},
	["@punctuation.special"] = {
		fg = p.lesser_accent,
	},
	["@punctuation"] = {
		fg = p.lesser_accent,
	},
	["@comment.note"] = {
		fg = p.accent,
	},
	["@comment.error"] = {
		link = "@comment.note",
	},
	["@comment.todo"] = {
		link = "@comment.note",
	},
	["@comment.warning"] = {
		link = "@comment.note",
	},
	["@tag"] = {
		fg = p.accent_alt,
	},
	["@tag.attribute"] = {
		fg = p.editor_fg,
	},
	["@tag.delimiter"] = {
		fg = p.lesser_accent,
	},
	-- Literals
	["_literal"] = {
		fg = p.accent_alt,
	},
	["@boolean"] = {
		link = "_literal",
	},
	["@number"] = {
		link = "_literal",
	},
	["@number.float"] = {
		link = "_literal",
	},
	["@string"] = {
		link = "_literal",
	},
	-- LaTeX bullshit
	["@punctuation.special.latex"] = {
		fg = p.accent,
	},
	["@module.latex"] = {
		fg = p.accent,
	},
	["@function.latex"] = {
		fg = p.accent,
	},
	["@markup.italic"] = {
		italic = true,
	},
	["@constant.builtin"] = {
		fg = p.accent_alt,
	},
}

for group in pairs(vim.api.nvim_get_hl(0, {})) do
	vim.api.nvim_set_hl(0, group, {})
end

for group, hl in pairs(groups) do
	vim.api.nvim_set_hl(0, group, hl)
end

vim.g.netrw_alto       = 1
vim.g.netrw_altv       = 1
vim.g.netrw_banner     = 0
vim.g.netrw_liststyle  = 0
vim.g.netrw_preview    = 1
vim.g.netrw_winsize    = 20

vim.g.mapleader        = ' '
vim.g.maplocalleader   = vim.g.mapleader

vim.opt.completeopt    = 'menu,menuone,noselect'
vim.opt.hlsearch       = false
vim.opt.laststatus     = 3
vim.opt.linebreak      = true
vim.opt.mouse          = ''

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.ruler          = true
vim.opt.showcmd        = true
vim.opt.signcolumn     = 'yes'
vim.opt.shortmess      = 'oOWsFtCcIaT'

vim.opt.smartcase      = true
vim.opt.ignorecase     = true

vim.opt.sidescrolloff  = 999
vim.opt.scrolloff      = 999
vim.opt.splitbelow     = true
vim.opt.splitright     = true

vim.opt.undofile       = true

vim.opt.lazyredraw     = true
vim.opt.redrawtime     = 500

vim.opt.updatetime     = 250
vim.opt.cindent        = true
vim.opt.cinoptions     = "Ns"
vim.opt.expandtab      = true
vim.opt.preserveindent = true
vim.opt.autoindent     = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 0

vim.opt.smartindent    = true
vim.opt.copyindent     = true
vim.opt.expandtab      = false
vim.opt.preserveindent = true
vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4

vim.opt.backspace      = 'indent,eol,start'
vim.opt.colorcolumn    = '120'

vim.opt.concealcursor  = 'nv'
vim.opt.conceallevel   = 0

vim.opt.incsearch      = true
vim.opt.numberwidth    = 1
vim.opt.redrawtime     = 500

vim.opt.timeout        = true
vim.opt.timeoutlen     = 1000
vim.opt.ttimeout       = true
vim.opt.ttimeoutlen    = 10
vim.opt.fillchars      = { eob = " " }

vim.opt.wildmenu       = true
vim.opt.wildignorecase = true
vim.opt.wrap           = true

vim.opt.path:append("**")
vim.opt.isfname:append("@-@")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
	end
})

require("lazy").setup({
	{
		"ThePrimeagen/vim-be-good",
	},
	{
		"xiyaowong/transparent.nvim",
	},
	{
		'nvim-tree/nvim-web-devicons'
	},
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		config = function()
			require("lualine").setup({
				options = {
					theme = "kanagawa",
					section_separators = { left = '', right = '' },
					component_separators = { left = '', right = '' }
				}
			})
		end
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = {
			theme = 'doom',
			config = {
				header = {
					[[]],
					[[       .--.                   .---.   ]],
					[[   .---|__|           .-.     |~~~|   ]],
					[[.--|===|--|_          |_|     |~~~|--.]],
					[[|  |===|  |'\     .---!~|  .--|   |--|]],
					[[|%%|   |  |.'\    |===| |--|%%|   |  |]],
					[[|%%|   |  |\.'\   |   | |__|  |   |  |]],
					[[|  |   |  | \  \  |===| |==|  |   |  |]],
					[[|  |   |__|  \.'\ |   |_|__|  |~~~|__|]],
					[[|  |===|--|   \.'\|===|~|--|%%|~~~|--|]],
					[[^--^---'--^    `-'`---^-^--^--^---'--']],
					[[]],
				},
				footer = {
					"Have you done your daily tasks?",
				},
				disable_move = true,
				center = {
					{
						icon = "📓 ",
						desc = "Notes",
						group = "@property",
						action = "Neorg index",
						key = "n",
					},
					{
						icon = "📔 ",
						desc = "Journal",
						group = "@property",
						action = "Neorg journal toc open",
						key = "j",
					},
					{
						icon = "⏪️ ",
						desc = "Yesterday",
						group = "@property",
						action = "Neorg journal yesterday",
						key = "y",
					},
					{
						icon = "📆 ",
						desc = "Today",
						group = "@property",
						action = "Neorg journal today",
						key = "t",
					},
					{
						icon = "⏩ ",
						desc = "Tomorrow",
						group = "@property",
						action = "Neorg journal tomorrow",
						key = "m",
					},
					{
						icon = "🛠️ ",
						desc = "Configuration",
						group = "@property",
						action = "e ~/.config/nvim/init.lua",
						key = "c",
					},
				},
			}
		},
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end
	},
	{
		"lukas-reineke/headlines.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local builtin = require('telescope.builtin')
			local actions = require('telescope.actions')

			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			require('telescope').setup {
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = actions.close,
							["<C-u>"] = false,
						}
					}
				},
				pickers = {},
				extensions = {}
			}
		end,
	},
	{
		"nvim-neorg/neorg-telescope",
	},
	{
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					['core.defaults'] = {},
					["core.export"] = {},
					["core.export.markdown"] = {
						config = {
							extensions = "all",
						},
					},
					["core.integrations.telescope"] = {
						config = {
							insert_file_link = {
								show_title_preview = true,
							},
						}
					},
					['core.concealer'] = {},
					['core.ui.calendar'] = {},
					['core.dirman'] = {
						config = {
							workspaces = {
								notes = "~/Notes",
							},
							default_workspace = "notes",
						},
					},
				},
			})
		end,
	},
	{
		'mbbill/undotree',
		config = function()
			vim.keymap.set("n", "<leader>u", "<cmd>UndotreeShow<CR>", { silent = true, noremap = true })
		end,
	},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{
		'hrsh7th/nvim-cmp',
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<C-e>'] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' },
				}, {
					{ name = 'buffer' },
				}),
			}

			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' },
				}, {
					{ name = 'buffer' },
				})
			})

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{
						name = 'cmdline',
						option = {
							treat_trailing_slash = false,
						}
					}
				})
			})
		end,
	},
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'williamboman/mason.nvim' },
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local lspconfig = require('lspconfig')

			local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspUserConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
					vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

					vim.api.nvim_create_autocmd("CursorHold", {
						buffer = ev.buf,
						callback = function()
							local opts = {
								focusable = false,
								close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
								border = 'rounded',
								source = 'always',
								prefix = ' ',
								scope = 'cursor',
							}

							vim.diagnostic.open_float(opts)
						end
					})
				end,
			})

			local on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end

				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Formatting", { clear = true }),
						buffer = bufnr,
						callback = function(ev)
							vim.lsp.buf.format({ buffer = bufnr })
						end,
					})
				end
			end

			local handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				["lua_ls"] = function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" }
								}
							}
						}
					})
				end,
				["phpactor"] = function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						root_dir = vim.loop.cwd,
					})
				end,
				["emmet_language_server"] = function(server_name)
					local custom_filetypes = {
						"php",
					}

					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						filetypes = vim.tbl_extend("force",
							lspconfig[server_name].document_config.default_config.filetypes, custom_filetypes)
					})
				end,
			}

			require('mason').setup()
			require('mason-lspconfig').setup({ handlers = handlers })

			lspconfig['clangd'].setup({})
			lspconfig['jdtls'].setup({})

			lspconfig['gdscript'].setup({
				port = 6005,
				host = '127.0.0.1',
				flags = {
					debounce_text_changes = 150,
				}
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				auto_install = true,
				enable = true,
				ensure_installed = {
					"lua",
					"php",
					"html",
					"css",
					"javascript",
				},

				incremental_selection = {
					enable = true,
				},

				textobjects = {
					enable = true,
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				indent = {
					enable = true,
					disable = {
						"gdscript",
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = { "InsertEnter" },
		config = function()
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			local cmp = require('cmp')

			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

			require("nvim-autopairs").setup({
				check_ts = true,
				enable_check_bracket_line = false
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		opts = {
			color_icons = true,
			default = true,
			strict = true,
		}
	},
})

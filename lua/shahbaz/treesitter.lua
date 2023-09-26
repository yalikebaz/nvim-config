-- -- local configs = require("nvim-treesitter.configs")
-- -- configs.setup({
--
-- require("nvim-treesitter.configs").setup({
--
--   ensure_installed = {
--     -- "c",
--     -- "go",
--     -- "lua",
--     -- "vim",
--     -- "vimdoc",
--     -- "sql",
--     -- "tsx",
--     -- "typescript",
--     -- "javascript",
--     -- "markdown",
--     -- "yaml",
--     -- "scss",
--     -- "python",
--     -- "json",
--     -- "html",
--   },
--
--   -- Install parsers synchronously (only applied to `ensure_installed`)
--   sync_install = false,
--
--   -- Automatically install missing parsers when entering buffer
--   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--   auto_install = false,
--
--   -- List of parsers to ignore installing (for "all")
--   ignore_install = {},
--
--   highlight = {
--     -- `false` will disable the whole extension
--     enable = true,
--
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
--   },
--   indent = { enable = true, disable = { "yaml" } },
--
--   context_commentstring = {
--     enable = true,
--     enable_autocmd = false,
--   },
--
--   rainbow = {
--     enable = true,
--     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
--     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
--     max_file_lines = nil, -- Do not enable for files with more than n lines, int
--     -- colors = {}, -- table of hex strings,
--     -- termcolors = {} -- table of colour name strings
--   },
-- })
--


-- I had some MAD treesitter problems :), i solved it by using this guy's treesitter config: https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb
-- I'm guessing it had to do with the ensure_installed section... maybe "javascript"?
local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "toml",
        "go",
        "fish",
        "json",
        "yaml",
        "css",
        "html",
        "lua"
    },
    autotag = {
        enable = true,
    },
    auto_install = true,
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

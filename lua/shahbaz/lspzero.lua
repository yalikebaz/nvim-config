-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "gopls",
    "eslint"
})

-- Fix Undefined global 'vim'
-- lsp.configure("sumneko_lua", {
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    -- ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    -- ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<C-e>"] = cmp.mapping.abort(),
    -- ["<CR>"] = cmp.mapping.confirm(),


    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Esc>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm(),
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings["<Tab>"] = nil
-- cmp_mappings["<S-Tab>"] = nil
--
-- cmp_mappings["<C-n>"] = nil
-- cmp_mappings["<C-p>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    },
})

--  INFO: These functions get rid of node_module results in goto definition by filtering out .d.ts files
local function filter(arr, fn)
    if type(arr) ~= "table" then
        return arr
    end

    local filtered = {}
    for k, v in pairs(arr) do
        if fn(v, k, arr) then
            table.insert(filtered, v)
        end
    end

    return filtered
end

local function filterReactDTS(value)
    return not string.match(value.filename, '%.d%.ts$')
end

local function on_list(options)
    local items = options.items
    if #items > 1 then
        items = filter(items, filterReactDTS)
    end

    vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
    vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end
--  end of filter functions

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition { on_list = on_list } end, opts) -- INFO: written like this to implement filter fn
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set("n", "[d", function()
    --   vim.diagnostic.goto_next()
    -- end, opts)
    -- vim.keymap.set("n", "]d", function()
    --   vim.diagnostic.goto_prev()
    -- end, opts)
    -- vim.keymap.set("n", "<leader>vca", function()
    --   vim.lsp.buf.code_action()
    -- end, opts)
    vim.keymap.set("n", "gr", function()
        -- vim.cmd [[Telescope lsp_references]]
        vim.cmd [[lua require('telescope.builtin').lsp_references({fname_width=70})]]
    end, opts)

    vim.keymap.set("n", "go", function()
        vim.cmd [[Other]]
    end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

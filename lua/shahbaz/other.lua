require("other-nvim").setup({
    mappings = {
        -- builtin mappings
        -- "livewire",
        -- "angular",
        -- "laravel",
        -- "rails",
        "golang",
        -- WORK MAPPINGS --
        -- Query to schema
        {
            pattern = "/graph/schema.queries.graphqls",
            target = "/graph/schema.graphqls",
            context = "Base schema" -- optional
        },
        {
            pattern = "/graph/schema.graphqls",
            target = "/graph/schema.queries.graphqls",
            context = "Base queries"
        },
        -- Query to resolver
        {
            pattern = "/graph/schema.queries.graphqls",
            target = "/graph/schema.queries.resolvers.go",
            context = "Resolvers" -- optional
        },
        {
            pattern = "/graph/schema.queries.resolvers.go",
            target = "/graph/schema.queries.graphqls",
            context = "Base queries"
        },
        -- Schema to pref/onboarding
        {
            pattern = "/graph/schema.graphqls",
            target = "/graph/schema_preferences.graphqls",
            context = "Pref schema" -- optional
        },
        {
            pattern = "/graph/schema.graphqls",
            target = "/graph/schema_onboarding.graphqls",
            context = "Onboarding schema" -- optional
        },
    },
    transformers = {
        -- defining a custom transformer
        lowercase = function(inputString)
            return inputString:lower()
        end
    },
    rememberBuffers = false,
    style = {
        -- How the plugin paints its window borders
        -- Allowed values are none, single, double, rounded, solid and shadow
        border = "double",
        -- Column seperator for the window
        seperator = "|",
        -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
        width = 0.7,
        -- min height in rows.
        -- when more columns are needed this value is extended automatically
        minHeight = 4
    },
})

local function keymapOptions(desc)
    return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
    }
end

-- Chat commands
vim.keymap.set({"n", "i"}, "<C-y>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({"n", "i"}, "<C-y>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Popup Chat"))
vim.keymap.set({"n", "i"}, "<C-y>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))

-- Prompt commands
vim.keymap.set({"n", "i"}, "<C-y>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set({"n", "i"}, "<C-y>a", "<cmd>GpAppend<cr>", keymapOptions("Append"))
vim.keymap.set({"n", "i"}, "<C-y>b", "<cmd>GpPrepend<cr>", keymapOptions("Prepend"))
vim.keymap.set({"n", "i"}, "<C-y>e", "<cmd>GpEnew<cr>", keymapOptions("Enew"))
vim.keymap.set({"n", "i"}, "<C-y>p", "<cmd>GpPopup<cr>", keymapOptions("Popup"))

-- Visual commands
vim.keymap.set("v", "<C-y>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions("Visual Chat New"))
vim.keymap.set("v", "<C-y>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Popup Chat"))
vim.keymap.set("v", "<C-y>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-y>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append"))
vim.keymap.set("v", "<C-y>b", ":<C-u>'<,'>GpPrepend<cr>", keymapOptions("Visual Prepend"))
vim.keymap.set("v", "<C-y>e", ":<C-u>'<,'>GpEnew<cr>", keymapOptions("Visual Enew"))
vim.keymap.set("v", "<C-y>p", ":<C-u>'<,'>GpPopup<cr>", keymapOptions("Visual Popup"))

vim.keymap.set({"n", "i", "v", "x"}, "<C-y>s", "<cmd>GpStop<cr>", keymapOptions("Stop"))

local conf = {
    hooks = {
        UnitTests = function(gp, params)
            local template = "I have the following code:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please respond by writing table driven unit tests for the code above."
            gp.Prompt(params, gp.Target.enew, nil, gp.config.command_model,
                template, gp.config.command_system_prompt)
        end,
    }
}

require("gp").setup(conf)

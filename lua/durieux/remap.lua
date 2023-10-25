-- Set up map function before trying new keybindings out!

local map = require("durieux.utils").map
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Easy open file explorer
 map("n", "<leader>fe", vim.cmd.Ex, { desc = "Easy open file explorer" })


local wk = require("which-key")
wk.register({
  c = { name = "Changing things" },
  d = { name = "Debugging" },
  f = { name = "Finding things" },
  g = { name = "Going places" },
  h = { name = "Harpoon" },
  r = { name = "Run things" },
  s = { name = "Controls splits" },
  u = {
    name = "Utilities",
  },
  w = { name = "Workspace" },
}, { prefix = "<leader>" })

wk.setup()

 map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { desc = "Telescope - Find files" })
-- map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep files in starting directory" })
-- map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Search for active buffers" })
-- map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Search for help tags" })
-- map("n", "<leader>ft", ":Telescope file_browser path=%:p:h<CR>", { desc = "Telescope File Browser" })
-- where the heck am I?
 map("n", "<leader>fl", ":lua print(vim.fn.expand('%'))<cr>", { desc = "Print CWD relative to project root" })
-- <<<Harpoon>>>
 map("n", "<leader>ht", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle Harpoon Menu" })
 map("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Add file to harpoon list" })
 for pos = 0, 9 do
 	map("n", "<leader>h" .. pos, function()
 	  require("harpoon.ui").nav_file(pos)
 	end, { desc = "Move to harpoon mark #" .. pos })
 end

  -- <<< SHOWING THINGS >>>
  vim.keymap.set("n", "<leader>fm", ":Telescope keymaps<cr>", { desc = "Show list of current user keymaps" })
 -- vim.keymap.set("n", "<leader>ch", function()
 --   popup.output_command(":!~/.config/bash/cht.sh")
 -- end, { desc = "Run cht.sh" })
  
   -- <<< Terminal Management >>>
   map("n", "<leader>tr", "<C-w>v<C-w>l:term<cr>", { desc = "Terminal - Open split to right" })
   map("t", "<esc>", "<C-\\><C-N>", { desc = "Terminal - Exit to normal mode" })
   -- <<< Window / Split Management >>>
   map("n", "<leader>ss", "<C-w>s", { desc = "Window - Split horizontal" })
   map("n", "<leader>sv", "<C-w>v", { desc = "Window - Split Vertical" })
   map("n", "<leader>sh", "<C-w>h", { desc = "Window - Move left by one split" })
   map("n", "<leader>sj", "<C-w>j", { desc = "Window - Move down by one split" })
   map("n", "<leader>sk", "<C-w>k", { desc = "Window - Move up by one split" })
   map("n", "<leader>sl", "<C-w>l", { desc = "Window - Move right by one split" })
 for pos = 1, 9 do
     local lhs = "<leader>s" .. pos
     local rhs = pos .. "<C-W>w"
     map("n", lhs, rhs, { desc = "Switch to window " .. pos })
 end

-- <<< QUALITY OF LIFE >>>
-- Easier reach to beginning and end of lines
map("n", "H", "^", { desc = "Edit - Move to beginning of text on current line" })
map("n", "L", "g_", { desc = "Edit - Move to end of text on current line" })
map("v", "L", "g_", { desc = "Edit - Move to end of text on current line - Visual mode" })

  -- move lines up and down
  map("n", "<A-k>", ":m .-2<cr>", { desc = "Edit - Move current line up" })          -- up
  map("n", "<A-j>", ":m .+1<cr>", { desc = "Edit - Move current line down" })        -- down
  map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Edit - Move selected lines up" })  -- up
  map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Edit - move selected lines down" }) -- down

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z")
 -- vim.keymap.set("n", "<C-d>", "<C-d>zz")
  -- vim.keymap.set("n", "<C-u>", "<C-u>zz")
  -- vim.keymap.set("n", "n", "nzzzv")
  -- vim.keymap.set("n", "N", "Nzzzv")


  -- make sure cursor stays centered in screen
  map("n", "J", "mzJ`z", { desc = "Cursor - Join lines but keep cursor position" })
  map("n", "<C-d>", "<C-d>zz", { desc = "Cursor - Scroll down and center cursor" })
  map("n", "<C-u>", "<C-u>zz", { desc = "Cursor - Scroll up and center cursor" })
  map("n", "n", "nzzzv", { desc = "Cursor - Jump to next search position and center cursor" })
  map("n", "N", "Nzzzv", { desc = "Cursor - Jump to previous search position and center cursor" })
  
   -- Yank to and Paste from system ceipboard
  map("n", "<leader>y", '"+yy', { desc = "Yank to system clipboard" })
  map("v", "<leader>y", '"+yy', { desc = "Yank to system clipboard" })
  map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
    -- change word under cursor
    map(
    "n",
    "<leader>w",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
        { desc = "Change all occurences of word undor cursor" }
  ) 
   -- Goto alternate file
  map("n", "<leader>ga", "<c-^>", { desc = "Go to alternate file" })
  
    -- <<< BASE LSP KEYMAPS >>>
  map("n", "<space>e", vim.diagnostic.open_float, { desc = "LSP - Open Diagnostic Float" })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP - Go to previous diagnostic item" })
  map("n", "]d", vim.diagnostic.goto_next, { desc = "LSP - Go to next diagnostic item" })
  map("n", "<space>q", vim.diagnostic.setloclist, { desc = "LSP - Set location list" })

 vim.keymap.set("n", "<leader>vwm", function()
     require("vim-with-me").StartVimWithMe()
 end)
 vim.keymap.set("n", "<leader>svwm", function()
     require("vim-with-me").StopVimWithMe()
 end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/durieux/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
vim.cmd("so")


map('n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>", {noremap = true, silent = true})


end)

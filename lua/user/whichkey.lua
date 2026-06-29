local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.setup({
  preset = "classic",
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  filter = function(mapping)
    return mapping.desc and mapping.desc ~= ""
  end,
  triggers = {
    { "<auto>", mode = "nxso" },
  },
  keys = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  win = {
    border = "rounded",
    padding = { 2, 2 },
    wo = {
      winblend = 0,
    },
  },
  layout = {
    width = { min = 20, max = 50 },
    spacing = 3,
  },
  icons = {
    breadcrumb = ">",
    separator = "->",
    group = "+",
    colors = false,
  },
})

local map_opts = {
  mode = "n",
  nowait = true,
  remap = false,
  silent = true,
}

wk.add({
  vim.tbl_extend("force", map_opts, { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" }),
  vim.tbl_extend("force", map_opts, {
    "<leader>b",
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    desc = "Buffers",
  }),
  vim.tbl_extend("force", map_opts, { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" }),
  vim.tbl_extend("force", map_opts, { "<leader>w", "<cmd>w!<CR>", desc = "Save" }),
  vim.tbl_extend("force", map_opts, { "<leader>q", "<cmd>q!<CR>", desc = "Quit" }),
  vim.tbl_extend("force", map_opts, { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer" }),
  vim.tbl_extend("force", map_opts, { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" }),
  vim.tbl_extend("force", map_opts, {
    "<leader>f",
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    desc = "Find files",
  }),
  vim.tbl_extend("force", map_opts, { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" }),
  vim.tbl_extend("force", map_opts, {
    "<leader>P",
    "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
    desc = "Projects",
  }),

  { "<leader>p", group = "Packer" },
  vim.tbl_extend("force", map_opts, { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile" }),
  vim.tbl_extend("force", map_opts, { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install" }),
  vim.tbl_extend("force", map_opts, { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync" }),
  vim.tbl_extend("force", map_opts, { "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status" }),
  vim.tbl_extend("force", map_opts, { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update" }),

  { "<leader>g", group = "Git" },
  vim.tbl_extend("force", map_opts, { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" }),
  vim.tbl_extend("force", map_opts, { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" }),
  vim.tbl_extend("force", map_opts, { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" }),
  vim.tbl_extend("force", map_opts, { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" }),
  vim.tbl_extend("force", map_opts, { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" }),
  vim.tbl_extend("force", map_opts, { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" }),
  vim.tbl_extend("force", map_opts, { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" }),
  vim.tbl_extend("force", map_opts, { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" }),
  vim.tbl_extend("force", map_opts, { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" }),
  vim.tbl_extend("force", map_opts, { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" }),
  vim.tbl_extend("force", map_opts, { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" }),
  vim.tbl_extend("force", map_opts, { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" }),
  vim.tbl_extend("force", map_opts, { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" }),

  { "<leader>l", group = "LSP" },
  vim.tbl_extend("force", map_opts, { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" }),
  vim.tbl_extend("force", map_opts, { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" }),
  vim.tbl_extend("force", map_opts, { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" }),
  vim.tbl_extend("force", map_opts, { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format" }),
  vim.tbl_extend("force", map_opts, { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" }),
  vim.tbl_extend("force", map_opts, { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" }),
  vim.tbl_extend("force", map_opts, { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" }),
  vim.tbl_extend("force", map_opts, { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" }),
  vim.tbl_extend("force", map_opts, { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" }),
  vim.tbl_extend("force", map_opts, { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" }),
  vim.tbl_extend("force", map_opts, { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" }),
  vim.tbl_extend("force", map_opts, { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" }),
  vim.tbl_extend("force", map_opts, { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" }),

  { "<leader>s", group = "Search" },
  vim.tbl_extend("force", map_opts, { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" }),
  vim.tbl_extend("force", map_opts, { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" }),
  vim.tbl_extend("force", map_opts, { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" }),
  vim.tbl_extend("force", map_opts, { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" }),
  vim.tbl_extend("force", map_opts, { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" }),
  vim.tbl_extend("force", map_opts, { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" }),
  vim.tbl_extend("force", map_opts, { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" }),
  vim.tbl_extend("force", map_opts, { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" }),

  { "<leader>t", group = "Terminal" },
  vim.tbl_extend("force", map_opts, { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" }),
  vim.tbl_extend("force", map_opts, { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU" }),
  vim.tbl_extend("force", map_opts, { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop" }),
  vim.tbl_extend("force", map_opts, { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" }),
  vim.tbl_extend("force", map_opts, { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" }),
  vim.tbl_extend("force", map_opts, { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" }),
  vim.tbl_extend("force", map_opts, { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" }),
})

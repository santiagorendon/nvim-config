if vim.fn.has("win32") == 1 then
  local paths = {}
  local function add_path(path)
    if path and path ~= "" then
      table.insert(paths, path)
    end
  end

  local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
  add_path(mason_bin)

  local winlibs = vim.fn.glob(
    vim.env.LOCALAPPDATA .. "/Microsoft/WinGet/Packages/BrechtSanders.WinLibs.POSIX.UCRT_*/mingw64/bin",
    false,
    true
  )
  if #winlibs > 0 then
    add_path(winlibs[1])
  end

  local fd = vim.fn.glob(vim.env.LOCALAPPDATA .. "/Microsoft/WinGet/Packages/sharkdp.fd_*/*", false, true)
  if #fd > 0 then
    for _, path in ipairs(fd) do
      if path:match("fd%-v[%d%.]+%-x86_64%-pc%-windows%-msvc$") then
        add_path(path)
        break
      end
    end
  end

  local lazygit = vim.fn.glob(vim.env.LOCALAPPDATA .. "/Microsoft/WinGet/Packages/JesseDuffield.lazygit_*", false, true)
  if #lazygit > 0 then
    add_path(lazygit[1])
  end

  local ripgrep = vim.fn.glob(vim.env.LOCALAPPDATA .. "/Microsoft/WinGet/Packages/BurntSushi.ripgrep.MSVC_*/*", false, true)
  if #ripgrep > 0 then
    for _, path in ipairs(ripgrep) do
      if path:match("ripgrep%-.+%-x86_64%-pc%-windows%-msvc$") then
        add_path(path)
        break
      end
    end
  end

  add_path(vim.env.APPDATA .. "\\Python\\Python311\\Scripts")
  add_path(vim.env.APPDATA .. "\\Python\\Python314\\Scripts")
  add_path(vim.env.LOCALAPPDATA .. "\\Python\\pythoncore-3.14-64")

  if #paths > 0 then
    vim.env.PATH = table.concat(paths, ";") .. ";" .. vim.env.PATH
  end
end

local treesitter_site = vim.fn.stdpath("data") .. "/site"
if not vim.list_contains(vim.api.nvim_list_runtime_paths(), treesitter_site) then
  vim.opt.rtp:prepend(treesitter_site)
end

local notebook_group = vim.api.nvim_create_augroup("notebook_buffer_settings", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre", "BufReadCmd", "BufNewFile" }, {
  group = notebook_group,
  pattern = "*.ipynb",
  callback = function(args)
    vim.api.nvim_set_option_value("swapfile", false, { buf = args.buf })
  end,
})

if vim.fn.has("win32") == 1 then
  vim.g.python3_host_prog = vim.env.LOCALAPPDATA .. "\\Programs\\Python\\Python311\\python.exe"
elseif vim.fn.has("mac") == 1 then
  vim.g.python3_host_prog = "/usr/bin/python3"
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

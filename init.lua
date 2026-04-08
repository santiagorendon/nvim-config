if vim.fn.has("win32") == 1 then
  local paths = {}

  local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
  if (vim.uv or vim.loop).fs_stat(mason_bin) then
    table.insert(paths, mason_bin)
  end

  local winlibs = vim.fn.glob(
    vim.env.LOCALAPPDATA .. "/Microsoft/WinGet/Packages/BrechtSanders.WinLibs.POSIX.UCRT_*/mingw64/bin",
    false,
    true
  )
  if #winlibs > 0 then
    table.insert(paths, winlibs[1])
  end

  if #paths > 0 then
    vim.env.PATH = table.concat(paths, ";") .. ";" .. vim.env.PATH
  end
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

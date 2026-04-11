# nvim-config

Personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## Plugins

### LeetCode
[kawre/leetcode.nvim](https://github.com/kawre/leetcode.nvim) — solve LeetCode problems inside Neovim.

- Language: Python 3
- Picker: Telescope
- Launch: `nvim leetcode.nvim`

### Jupyter Notebooks
[benlubas/molten-nvim](https://github.com/benlubas/molten-nvim) + [GCBallesteros/NotebookNavigator.nvim](https://github.com/GCBallesteros/NotebookNavigator.nvim) + [goerz/jupytext.nvim](https://github.com/goerz/jupytext.nvim)

- `.ipynb` files are converted to `py:percent` format via jupytext
- Molten handles Jupyter kernel execution with virtual text output
- Cell keymaps (active in `.ipynb` buffers):

| Key | Action |
|-----|--------|
| `]j` / `[j` | Next / prev cell |
| `<localleader>mi` | Init Molten (Python 3 kernel) |
| `<localleader>jr` | Run cell |
| `<localleader>jR` | Run cell and move |
| `<localleader>ja` | Run all cells |
| `<localleader>mv` | Run visual selection |
| `<localleader>mo` | Evaluate operator |
| `<localleader>ms` / `mh` | Show / hide output |
| `<localleader>me` | Enter output window |
| `<localleader>mI` / `mE` | Import / export output |

### Image Display
[folke/snacks.nvim](https://github.com/folke/snacks.nvim) image support enabled.

### Transparent Background
Background highlight groups are cleared so terminal transparency (e.g. WezTerm) shows through. Applied on startup and on colorscheme changes.

## Cross-platform

Works on Windows and macOS. Windows-specific toolchain paths (WinGet: WinLibs, fd, lazygit, ripgrep) are gated behind `vim.fn.has("win32")`. Python host is resolved per OS:

- **Windows:** `%LOCALAPPDATA%\Programs\Python\Python311\python.exe`
- **Mac:** `/usr/bin/python3` (update to your Homebrew path if needed, e.g. `/opt/homebrew/bin/python3`)

## Requirements

- Neovim >= 0.9
- [lazygit](https://github.com/jesseduffield/lazygit)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- Python 3 with `pynvim` installed (`pip install pynvim`)
- For Molten: Jupyter kernels available (`pip install jupyter ipykernel`)

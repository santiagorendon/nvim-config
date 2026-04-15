return {
  {
    "goerz/jupytext.nvim",
    lazy = false,
    opts = {
      jupytext = "C:/Users/santi/AppData/Roaming/Python/Python311/Scripts/jupytext.exe",
      format = "py:percent",
      update = true,
      filetype = function(_, format, metadata)
        if metadata and metadata.kernelspec and metadata.kernelspec.language then
          return metadata.kernelspec.language
        end
        if type(format) == "string" and format:match("^py") then
          return "python"
        end
        return ""
      end,
    },
  },
  {
    "GCBallesteros/NotebookNavigator.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-mini/mini.comment",
    },
    keys = {
      {
        "]j",
        function()
          require("notebook-navigator").move_cell("d")
        end,
        desc = "Next Notebook Cell",
      },
      {
        "[j",
        function()
          require("notebook-navigator").move_cell("u")
        end,
        desc = "Prev Notebook Cell",
      },
      {
        "<leader>jr",
        function()
          require("notebook-navigator").run_cell()
        end,
        desc = "Run Notebook Cell",
      },
      {
        "<leader>jR",
        function()
          require("notebook-navigator").run_and_move()
        end,
        desc = "Run Cell And Move",
      },
      {
        "<leader>ja",
        function()
          require("notebook-navigator").run_all_cells()
        end,
        desc = "Run All Notebook Cells",
      },
    },
    opts = {
      activate_hydra_keys = nil,
      repl_provider = "molten",
      syntax_highlight = true,
    },
    config = function(_, opts)
      require("notebook-navigator").setup(opts)

      local group = vim.api.nvim_create_augroup("notebook_buffer_keymaps", { clear = true })
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        group = group,
        pattern = "*.ipynb",
        callback = function(args)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
          end

          map("n", "<localleader>mi", "<cmd>MoltenInit python3<cr>", "Molten Init")
          map("n", "<localleader>ml", "<cmd>MoltenEvaluateLine<cr>", "Molten Line")
          map("n", "<localleader>mo", "<cmd>MoltenEvaluateOperator<cr>", "Molten Operator")
          map("n", "<localleader>mr", "<cmd>MoltenReevaluateCell<cr>", "Molten Reevaluate")
          map("n", "<localleader>md", "<cmd>MoltenDelete<cr>", "Molten Delete Cell")
          map("n", "<localleader>ms", "<cmd>MoltenShowOutput<cr>", "Molten Show Output")
          map("n", "<localleader>mh", "<cmd>MoltenHideOutput<cr>", "Molten Hide Output")
          map("n", "<localleader>mx", "<cmd>MoltenInterrupt<cr>", "Molten Interrupt")
          map("n", "<localleader>mn", "<cmd>MoltenNext<cr>", "Molten Next Cell")
          map("n", "<localleader>mp", "<cmd>MoltenPrev<cr>", "Molten Prev Cell")
          map("n", "<localleader>me", "<cmd>noautocmd MoltenEnterOutput<cr>", "Molten Enter Output")
          map("n", "<localleader>mI", "<cmd>MoltenImportOutput<cr>", "Molten Import Output")
          map("n", "<localleader>mE", "<cmd>MoltenExportOutput<cr>", "Molten Export Output")
          map("v", "<localleader>mv", ":<C-u>MoltenEvaluateVisual<cr>gv", "Molten Visual")
        end,
      })
    end,
  },
}

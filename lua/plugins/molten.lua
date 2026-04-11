return {
  {
    "benlubas/molten-nvim",
    version = false,
    lazy = false,
    build = ":UpdateRemotePlugins",
    cmd = {
      "MoltenInit",
      "MoltenDeinit",
      "MoltenInfo",
      "MoltenNext",
      "MoltenPrev",
      "MoltenEvaluateLine",
      "MoltenEvaluateVisual",
      "MoltenEvaluateOperator",
      "MoltenReevaluateCell",
      "MoltenDelete",
      "MoltenShowOutput",
      "MoltenHideOutput",
      "MoltenEnterOutput",
      "MoltenInterrupt",
      "MoltenImportOutput",
      "MoltenExportOutput",
    },
    init = function()
      vim.g.molten_image_provider = "none"
      vim.g.molten_auto_open_output = false
      vim.g.molten_output_win_border = { "", "-", "", "" }
      vim.g.molten_output_virt_lines = true
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_text_max_lines = 12
      vim.g.molten_auto_open_html_in_browser = true
    end,
  },
}

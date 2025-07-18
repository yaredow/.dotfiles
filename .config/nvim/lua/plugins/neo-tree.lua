return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["c"] = function(state)
            require("neo-tree.sources.filesystem.commands").copy_to_clipboard(state)
            vim.notify("File copied to Neo-tree clipboard", vim.log.levels.INFO)
          end,
        },
      },
    },
  },
}

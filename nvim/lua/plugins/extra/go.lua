return {
  {
    "yanskun/gotests.nvim",
    cmd = { "GoTests", "GoTestsAll" },
    config = function()
      require("gotests").setup()
    end,
  },
}

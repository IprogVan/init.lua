return {
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          java = {
            function()
              return {
                exe = "google-java-format",
                args = { "-" },
                stdin = true,
              }
            end,
          },
        },
      })

      vim.api.nvim_exec(
        [[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.java FormatWrite
        augroup END
      ]],
        true
      )
    end,
  }
}

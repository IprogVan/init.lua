return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.adapters.java = {
        type = "server",
        host = "127.0.0.1",
        port = 5005,
      }
      dap.configurations.java = {
        {
          type = "java",
          request = "launch",
          name = "Debug Current File",
          mainClass = "${file}",
          projectName = "${workspaceFolder}",
        },
        {
          type = "java",
          request = "attach",
          name = "Debug Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
  }
}

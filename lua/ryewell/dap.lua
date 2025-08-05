local dap = require("dap")
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#ff0000" })

vim.fn.sign_define("DapBreakpointCondition", { text = "⚠️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "🔍", texthl = "", linehl = "", numhl = "" })
vim.keymap.set("n", "<F8>", dap.continue, { noremap = true, silent = true })
vim.keymap.set("n", "<F9>", dap.step_over, { noremap = true, silent = true })
vim.keymap.set("n", "<F7>", dap.step_into, { noremap = true, silent = true })
vim.keymap.set("n", "<F12>", dap.step_out, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>lp", dap.list_breakpoints, { noremap = true, silent = true })

dap.adapters.codelldb = {
	type = "executable",
	command = "/home/ryewell/Dev/Tools/codelldb/extension/adapter/codelldb",
}

dap.configurations.rust = {
	{
		name = "Debug",
		type = "codelldb",
		request = "launch",
		program = function()
			local cargo_toml = io.open("Cargo.toml", "r")
			local bin_name = "main"
			for line in cargo_toml:lines() do
				local name = line:match('^name%s*=%s*"(.-)"')
				if name then
					bin_name = name
					break
				end
			end
			cargo_toml:close()

			vim.fn.jobstart("cargo build", {
				stdout_buffered = true,
				stderr_buffered = true,
				on_exit = function(_, code)
					if code ~= 0 then
						vim.notify("Cargo build failed", vim.log.levels.ERROR)
					end
				end,
			})

			return vim.fn.getcwd() .. "/target/debug/" .. bin_name
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}

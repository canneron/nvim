return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		
		lint.linters.golangci_lint = {
		cmd = "golangci-lint",
		args = { "run", "--out-format", "line-number" },
		stdin = false,
		ignore_exitcode = true,
		parser = require("lint.parser").from_pattern(
				[[[^:]+:(%d+):(%d+): (.*)]],
				{ "lnum", "col", "message" },
				{ source = "golangci-lint" }
			),
		}

		-- Add Go and Java linters
		lint.linters_by_ft = {
			go = { "golangci_lint" },
			--java = { "checkstyle" },
		}

		-- Optionally define checkstyle if not already present
		-- lint.linters.checkstyle = {
		--   cmd = 'checkstyle', -- or use a wrapper script
		--   stdin = false,
		--   args = {
		--     '-c', '/path/to/checkstyle-config.xml', -- path to your checkstyle config
		--     '%f',
		--   },
		--   stream = 'stdout',
		--   ignore_exitcode = true,
		--   parser = require("lint.parser").from_pattern(
		--     [[:%l:%l:%s+(%d+):%s+(.*)]], -- customize to your checkstyle output
		--     { "lnum", "message" },
		--     {}
		--   ),
		-- }

		local lint_augroup = vim.api.nvim_create_augroup("Lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}

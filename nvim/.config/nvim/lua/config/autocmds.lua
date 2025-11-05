-- https://github.com/folke/trouble.nvim/issues/428
-- https://github.com/folke/trouble.nvim/blob/dev/docs/examples.md#open-trouble-quickfix-when-the-qf-list-opens
vim.api.nvim_create_autocmd("BufRead", {
	callback = function(ev)
		if vim.bo[ev.buf].buftype == "quickfix" then
			vim.schedule(function()
				vim.cmd([[cclose]])
				vim.cmd([[Trouble qflist open]])
			end)
		end
	end,
})

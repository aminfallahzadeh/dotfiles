-- return {
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		event = "VeryLazy",
-- 		dependencies = { "nvim-tree/nvim-web-devicons" },
-- 		config = function()
-- 			-- -- try git status
--
-- 			-- helper function to loop over string lines
-- 			-- copied from https://stackoverflow.com/a/19329565
-- 			local function iterlines(s)
-- 				if s:sub(-1) ~= "\n" then
-- 					s = s .. "\n"
-- 				end
-- 				return s:gmatch("(.-)\n")
-- 			end
--
-- 			-- find directory
-- 			function find_dir(d)
-- 				-- return if root
-- 				if d == "/" then
-- 					return d
-- 				end
-- 				-- initialize git_state variable
-- 				if vim.b.git_state == nil then
-- 					vim.b.git_state = { "", "", "", "" }
-- 				end
-- 				-- fix terminal
-- 				if d:find("term://") ~= nil then
-- 					return "/tmp"
-- 				end
-- 				-- fix fzf
-- 				if d:find("/tmp/.*FZF") ~= nil then
-- 					return "/tmp"
-- 				end
-- 				-- fix fugitive etc.
-- 				if d:find("^%w+://") ~= nil then
-- 					vim.b.git_state[1] = " " .. d:gsub("^(%w+)://.*", "%1") .. " "
-- 					d = d:gsub("^%w+://", "")
-- 				end
-- 				-- check renaming
-- 				local ok, err, code = os.rename(d, d)
-- 				if not ok then
-- 					if code ~= 2 then
-- 						-- all other than not existing
-- 						return d
-- 					end
-- 					-- not existing
-- 					local newd = d:gsub("(.*/)[%w._-]+/?$", "%1")
-- 					return find_dir(newd)
-- 				end
-- 				-- d ok
-- 				return d
-- 			end
--
-- 			-- get git status
-- 			local function git_status()
-- 				vim.b.git_state = { "", "", "" }
-- 				-- get & check file directory
-- 				file_dir = find_dir(vim.fn.expand("%:p:h"))
-- 				-- check fugitive etc.
-- 				if vim.b.git_state[1] ~= "" then
-- 					return "u"
-- 				end
-- 				-- capture git status call
-- 				local cmd = "git -C " .. file_dir .. " status --porcelain -b 2> /dev/null"
-- 				local handle = assert(io.popen(cmd, "r"), "")
-- 				-- output contains empty line at end (removed by iterlines)
-- 				local output = assert(handle:read("*a"))
-- 				-- close io
-- 				handle:close()
--
-- 				local git_state = { "", "", "", "" }
-- 				-- branch coloring: 'o': up to date with origin; 'd': head detached; 'm': not up to date with origin
-- 				local branch_col = "o"
--
-- 				-- check if git repo
-- 				if output == "" then
-- 					-- not a git repo
-- 					-- save to variable
-- 					vim.b.git_state = git_state
-- 					-- exit
-- 					return branch_col
-- 				end
--
-- 				-- get line iterator
-- 				local line_iter = iterlines(output)
--
-- 				-- process first line (HEAD)
-- 				local line = line_iter()
-- 				if line:find("%(no branch%)") ~= nil then
-- 					-- detached head
-- 					branch_col = "d"
-- 				else
-- 					-- on branch
-- 					local ahead = line:gsub(".*ahead (%d+).*", "%1")
-- 					local behind = line:gsub(".*behind (%d+).*", "%1")
-- 					-- convert non-numeric to nil
-- 					ahead = tonumber(ahead)
-- 					behind = tonumber(behind)
-- 					if behind ~= nil then
-- 						git_state[1] = "↓ " .. tostring(behind) .. " "
-- 					end
-- 					if ahead ~= nil then
-- 						git_state[1] = git_state[1] .. "↑ " .. tostring(ahead) .. " "
-- 					end
-- 				end
--
-- 				-- loop over residual lines (files) &
-- 				-- store number of files
-- 				local git_num = { 0, 0, 0 }
-- 				for line in line_iter do
-- 					branch_col = "m"
-- 					-- get first char
-- 					local first = line:gsub("^(.).*", "%1")
-- 					if first == "?" then
-- 						-- untracked
-- 						git_num[3] = git_num[3] + 1
-- 					elseif first ~= " " then
-- 						-- staged
-- 						git_num[1] = git_num[1] + 1
-- 					end
-- 					-- get second char
-- 					local second = line:gsub("^.(.).*", "%1")
-- 					if second == "M" then
-- 						-- modified
-- 						git_num[2] = git_num[2] + 1
-- 					end
-- 				end
--
-- 				-- build output string
-- 				if git_num[1] ~= 0 then
-- 					git_state[2] = "● " .. git_num[1]
-- 				end
-- 				if git_num[2] ~= 0 then
-- 					git_state[3] = "+ " .. git_num[2]
-- 				end
-- 				if git_num[3] ~= 0 then
-- 					git_state[4] = "… " .. git_num[3]
-- 				end
--
-- 				-- save to variable
-- 				vim.b.git_state = git_state
--
-- 				return branch_col
-- 			end
-- 			require("lualine").setup({
-- 				globalstatus = true,
-- 				sections = {
-- 					lualine_x = { "ctime", "cdate" },
-- 					lualine_c = { "diagnostics" },
-- 					lualine_b = {
-- 						{
-- 							"branch",
-- 							color = function(_)
-- 								local gs = git_status()
-- 								if gs == "d" then
-- 									return { fg = "#916BDD" }
-- 								elseif gs ~= "m" then
-- 									return { fg = "#769945" }
-- 								end
-- 							end,
-- 						},
-- 						{
-- 							-- head status
-- 							"vim.b.git_state[1]",
-- 							color = function(_)
-- 								if vim.b.git_state[1]:find("^ %w+ $") ~= nil then
-- 									return { fg = "#F49B55" }
-- 								end
-- 							end,
-- 							padding = { left = 0, right = 0 },
-- 						},
-- 						{
-- 							-- staged files
-- 							"vim.b.git_state[2]",
-- 							color = { fg = "#769945" },
-- 							padding = { left = 0, right = 1 },
-- 						},
-- 						{
-- 							-- modified files
-- 							"vim.b.git_state[3]",
-- 							color = { fg = "#D75F00" },
-- 							padding = { left = 0, right = 1 },
-- 						},
-- 						{
-- 							-- untracked files
-- 							"vim.b.git_state[4]",
-- 							color = { fg = "#D99809" },
-- 							padding = { left = 0, right = 1 },
-- 						},
-- 						{
-- 							"diff",
-- 						},
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"archibate/lualine-time",
-- 		dependencies = { "nvim-tree/nvim-web-devicons" },
-- 		event = "VeryLazy",
-- 	},
-- }

local function setup_macro_refresh(lualine)
	vim.api.nvim_create_autocmd("RecordingEnter", {
		callback = function()
			lualine.refresh({
				place = { "statusline" },
			})
		end,
	})
	vim.api.nvim_create_autocmd("RecordingLeave", {
		callback = function()
			local timer = vim.loop.new_timer()
			timer:start(
				50,
				0,
				vim.schedule_wrap(function()
					lualine.refresh({
						place = { "statusline" },
					})
				end)
			)
		end,
	})
end

local function macro_recording_status()
	local function current_status()
		local register = vim.fn.reg_recording()
		return register == "" and "" or "RECORDING @" .. register
	end
	return { "macro-recording", fmt = current_status }
end

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.opt.laststatus = 0
		end,
		config = function()
			vim.opt.laststatus = 3
			local lualine = require("lualine")
			setup_macro_refresh(lualine)
			lualine.setup({
				options = {
					theme = "rose-pine",
					component_separators = "",
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "alpha" },
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
						macro_recording_status(),
					},
					lualine_b = {
						"branch",
						"diff",
						"diagnostics",
					},
					lualine_c = { "filename" },
					lualine_x = { "filetype" },
					lualine_y = { "ctime", "cdate", "progress" },
					lualine_z = {
						{ "location", separator = { right = "", left = "" }, left_padding = 2 },
					},
				},
				exntensions = { "fzf" },
			})
		end,
	},
	{
		"archibate/lualine-time",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},
}

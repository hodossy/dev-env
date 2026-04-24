local function load_file_into_buffer(file)
	local uri = vim.uri_from_fname(file)
	local new_buff = vim.uri_to_bufnr(uri)
	vim.api.nvim_win_set_buf(0, new_buff)
	vim.fn.execute("edit")
end

local function open_related_file(parent, base_filename, file_type, file_ext)
	local full_destination = parent .. "/" .. base_filename .. "." .. file_type .. "." .. file_ext

	local exists = vim.fn.filereadable(full_destination)
	-- don't open a buffer if the file doesn't exist since you may end up creating a file without knowing it
	if exists == 0 then
		vim.notify("File doesn't exist: " .. full_destination, vim.log.levels.WARN)
		return
	end

	load_file_into_buffer(full_destination)
end

local function get_curr_filename_parts()
	local path = require("plenary.path")

	local current_buffer = vim.api.nvim_buf_get_name(0)
	local buf_path = path:new(current_buffer)
	local relative_path = buf_path:make_relative()
	local filename = string.match(relative_path, "([^/]+)$")

	if string.match(filename, "spec%.[^%.]+$") then
		return buf_path:parent(), string.match(filename, "(.*)%.([^%.]+)%.spec%.([%w]+)$")
	elseif string.match(filename, "theme%.[^%.]+$") then
		return buf_path:parent(), string.match(filename, "(.*)%.([^%.]+)%.theme%.([%w]+)$")
	elseif string.match(filename, "stories%.[^%.]+$") then
		return buf_path:parent(), string.match(filename, "(.*)%.([^%.]+)%.stories%.([%w]+)$")
	else
		return buf_path:parent(), string.match(filename, "(.*)%.([^%.]+)%.([%w]+)$")
	end
end

local M = {}

function M.open_related_file_by_type(new_file_type)
	return function()
		local parent, base_filename, orig_file_type, file_ext = get_curr_filename_parts()

		open_related_file(parent, base_filename, new_file_type, file_ext)
	end
end

function M.open_related_file_by_ext(new_file_ext)
	return function()
		local parent, base_filename, file_type, orig_file_ext = get_curr_filename_parts()

		open_related_file(parent, base_filename, file_type, new_file_ext)
	end
end

function M.open_related_file_by_type_ext(new_file_type, new_file_ext)
	return function()
		local parent, base_filename, file_type, orig_file_ext = get_curr_filename_parts()

		open_related_file(parent, base_filename, file_type .. "." .. new_file_type, new_file_ext)
	end
end

return M

local globalListenerName = 'globallistenername'
local autocmdhandlers = {}

_G[globalListenerName] = function (name)
	autocmdhandlers[name]()
end

function AddEventListener (name, events, cb)
	autocmdhandlers[name] = cb
	vim.cmd('augroup ' .. name)
	vim.cmd('autocmd!')
	for _, v in ipairs(events) do
		local cmd = 'lua ' .. globalListenerName .. '("' .. name ..'")'
		vim.cmd('au ' .. v .. ' ' .. cmd)
	end
	vim.cmd('augroup end')
end

function RemoveEventListener (name)
	vim.cmd('augroup ' .. name)
	vim.cmd('autocmd!')
	vim.cmd('augroup end')
	autocmdhandlers[name] = nil
end

AddEventListener('ScrolloffFraction', { 'BufEnter,WinEnter,WinNew,VimResized *,*.*' }, function ()
	if (vim.opt.filetype ~= 'qf') then
		local vis_lines = vim.api.nvim_win_get_height(vim.fn.win_getid())
		vim.opt.scrolloff = math.floor(vis_lines * 0.25)
	end
end)

--[[ AddEventListener('LuaHighlight', { 'TextYankPost *' }, function()
	require'vim.highlight'.on_yank()
end) ]]

AddEventListener('DisableHighLight', { 'InsertEnter *' }, function ()
	vim.opt.hlsearch = false
end)

AddEventListener('EnableHighLight', { 'InsertLeave *' }, function ()
	vim.opt.hlsearch = true
end)


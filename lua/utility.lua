local is_windows = function ()
    local dir_separator = package.config:sub(1, 1)
    if dir_separator == '/' then
        return false
    else
        return true
    end
end

local register_autoformat = function()
    vim.api.nvim_create_autocmd({'BufWritePre'}, {
        buf = 0,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

local function get_user_home()
  local user_home_var = not is_windows() and "HOME" or "USERPROFILE"
  local home = os.getenv(user_home_var)
  return home
end

return {
    is_windows = is_windows,
    register_autoformat = register_autoformat,
    get_user_home = get_user_home,
}

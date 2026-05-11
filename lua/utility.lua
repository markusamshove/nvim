is_windows = function ()
    local dir_separator = package.config:sub(1, 1)
    if dir_separator == '/' then
        return false
    else
        return true
    end
end

return {
    is_windows = is_windows,
}

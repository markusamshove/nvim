return {
    {
        prefix = 'pwd',
        body = vim.fn.getcwd(),
        desc = 'Expand current working directory'
    },
    {
        prefix = 'heut',
        body =  os.date('%d.%m.%Y'),
        desc = 'Current day dd.mm.yyyy',
    },
    {
        prefix = 'tday',
        body =  os.date('%Y-%m-%d'),
        desc = 'Current day yyyy.mm.dd',
    },
}

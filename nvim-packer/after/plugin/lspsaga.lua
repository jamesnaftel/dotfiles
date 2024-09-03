local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
    request_timeout = 5000,
})

local lint_progress = function()
  local linters = require("lint").get_running()
  if #linters == 0 then
      return ""
  end
  return " [ " .. table.concat(linters, ", ") .. " ]"
end




vim.opt.laststatus = 2

Statusline = {}


function Statusline.active()
    return table.concat {
        "%f",
        lint_progress(),
        "%=",
        "%y [%P %l:%c]"
    }
end

function Statusline.inactive()
    return " %t"
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = group,
    desc = "Activate statusline on focus",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.Statusline.active()"
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = group,
    desc = "Deactivate statusline when unfocused",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
    end,
})

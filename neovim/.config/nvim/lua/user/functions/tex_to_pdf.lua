local f = require("user.functions.string_interpolation")

local function text_to_pdf()
 local fileName = vim.fn.expand("%")
  vim.notify(fileName)
  local fileTypeLength = 3;
  local fileNameWithoutFileType = string.sub(fileName, 0, string.len(fileName) - fileTypeLength - 1)

  return f "{fileNameWithoutFileType}.pdf"
 end

return text_to_pdf

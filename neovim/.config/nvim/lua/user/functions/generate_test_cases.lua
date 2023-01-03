local f = require("user.functions.string_interpolation")
local file_exists = require("user.functions.file_exists")

local function generate_test_cases()
  local fileName = vim.fn.expand("%")
  local fileTypeLength = 3
  local fileNameWithoutFileType = string.sub(fileName, 0, string.len(fileName) - fileTypeLength - 1)
  vim.notify(fileNameWithoutFileType)

  for i = 1, 10, 1 do
    local inputFile      = "./" .. fileNameWithoutFileType .. f ".in{i}"
    local outputFile     = "./" .. fileNameWithoutFileType .. f ".ans{i}"
    local compInputFile  = fileNameWithoutFileType .. f "_input{i-1}.txt"
    local compOutputFile = fileNameWithoutFileType .. f "_output{i-1}.txt"
    local exists         = file_exists(inputFile);

    if exists then
      os.execute(f "cp {inputFile} {compInputFile}")
      os.execute(f "cp {outputFile} {compOutputFile}")
    else
      vim.notify("Testcases generated successfully")
      break
    end
  end

end

return generate_test_cases

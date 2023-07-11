
-- Clean loaded modules
ModulesToClean = {"aguachumein"}

for k, _ in pairs(package.loaded) do
    for _, module_name in ipairs(ModulesToClean) do
        if string.match(k, "^" .. module_name) then
            package.loaded[k] = nil
        end
    end
end


-- Load
require("aguachumein")

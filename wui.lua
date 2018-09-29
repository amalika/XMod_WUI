--[[
  @Author xxzhushou
  @Repo   https://github.com/xxzhushou/WUI
]]--

local wui = {}

local moduleNames = {
    Radio = 'wcomp.wRadio',
    Button = 'wcomp.wButton',
    TabBar = 'wcomp.wTabBar',
    TabPage = 'wcomp.wTabPage',
    GridSelect = 'wcomp.wGridSelect',
    Checkbox = 'wcomp.wCheckbox',
    CheckboxList = 'wcomp.wCheckboxList',
}

for k, v in pairs(moduleNames) do
    if wui[k] == nil then
        wui[k] = require(v)
    end
end

return wui

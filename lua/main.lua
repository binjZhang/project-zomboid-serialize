Convertor = {}

Convertor.sub = {}

Convertor.main = {}

Convertor.main.java2lua = function(item)
    if item == nil then
        return {}
    end
    local script_type = item:getScriptItem():getTypeString()
    if Convertor.sub[script_type] == nil then
        return {}
    end
    return Convertor.sub[script_type].java2lua(item)
end
Convertor.main.lua2java = function(tab)
    if tab == nil or tab.script_type == nil then
        return nil
    end
    if Convertor.sub[tab.script_type] == nil then
        return nil
    end
    return Convertor.sub[tab.script_type].lua2java(tab)
end
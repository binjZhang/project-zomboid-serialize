
Convertor.sub.Drainable = {}

Convertor.sub.Drainable.java2lua = function(item)
    local tab = Convertor.sub.Normal.java2lua(item)
    return tab
end
Convertor.sub.Drainable.lua2java = function(tab)
    local item = Convertor.sub.Normal.lua2java(tab)
    if item == nil then
        return nil
    end
    return item
end
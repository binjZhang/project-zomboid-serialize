Convertor = Convertor or {}

Convertor.sub = Convertor.sub or {}

Convertor.sub.Drainable = {}

Convertor.sub.Drainable.java2lua = function(item)
    local tab = Convertor.sub.Normal.java2lua(item)
    return tab
end
Convertor.sub.Drainable.lua2java = function(tab)

end
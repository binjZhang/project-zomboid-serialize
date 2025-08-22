Convertor = Convertor or {}

Convertor.sub = Convertor.sub or {}

Convertor.sub.Normal = {}

Convertor.sub.Normal.java2lua = function(item)
    local tab = {}
    tab.full_type = item:getFullType()
    tab.type = item:getScriptItem():getTypeString()
    tab.condition = item:getCondition()
    if item:hasSharpness() then
        tab.sharpness = item:getSharpness()
    end
    tab.current_uses = item:getCurrentUses()
    tab.current_ammo_count = item:getCurrentAmmoCount()
    tab.weight = item:getWeight()
    tab.actual_weight = item:getActualWeight()
    tab.color_red = item:getColorRed()
    tab.color_blue = item:getColorBlue()
    tab.color_green = item:getColorGreen()
    tab.age = item:getAge()
    if item:getDisplayName() then
        tab.name = item:getDisplayName()
    end
    if item:getFluidContainer() and not item:isEmptyOfFluid() then
        local fluid_table = {}
        tab.fluid_container = fluid_table
        local fluid_container = item:getFluidContainer()
        local all_fluid_type = Fluid.getAllFluids()
        for i = 0, all_fluid_type:size() - 1 do
            local fluid = all_fluid_type:get(i)
            local fluid_amount = fluid_container:getSpecificFluidAmount(fluid)
            fluid_table[fluid:getFluidTypeString()] = fluid_amount
        end
    end
    tab.mod_data = item:getModData()
    return tab
end

Convertor.sub.Normal.lua2java = function(tab)
    local full_type = tab.full_type
    local item = instanceItem(full_type)
    if item == nil then
        return nil
    end
    if tab.condition then
        item:setCondition(tab.condition)
    end
    if tab.current_uses then
        item:setCurrentUses(tab.current_uses)
    end
    if tab.current_ammo_count then
        item:setCurrentAmmoCount(tab.current_ammo_count)
    end
    if item:hasSharpness() and tab.sharpness then
        item:setSharpness(tab.sharpness)
    end
    if tab.weight then
        item:setWeight(tab.weight)
    end
    if tab.actual_weight then
        item:setActualWeight(tab.actual_weight)
    end
    if tab.color_red then
        item:setColorRed(tab.color_red)
    end
    if tab.color_blue then
        item:setColorBlue(tab.color_blue)
    end
    if tab.color_green then
        item:setColorGreen(tab.color_green)
    end
    if tab.age then
        item:setAge(tab.age)
    end
    if tab.name then
        item:setName(tab.name)
    end
    if item:getFluidContainer() then
        item:getFluidContainer():Empty()
        if tab.fluid_container then
            for fluid_type, amount in pairs(tab.fluid_container) do
                item:getFluidContainer():addFluid(fluid_type, amount)
            end
        end
    end
    if tab.mod_data then
        item:getModData():wipe()
        for k, v in pairs(tab.mod_data) do
            item:getModData()[k] = v
        end
    end

    return item

end
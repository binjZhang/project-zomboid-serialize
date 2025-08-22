Convertor.sub.Normal = {}

Convertor.sub.Normal.java2lua = function(item)
    local tab = {}
    tab.actual_weight = item:getActualWeight()
    tab.age = item:getAge()
    tab.alcohol_power = item:getAlcoholPower()
    tab.ammo_type = item:getAmmoType()
    tab.attached_slot = item:getAttachedSlot()
    tab.attached_slot_type = item:getAttachedSlotType()
    tab.attached_to_model = item:getAttachedToModel()
    tab.attachment_replacement = item:getAttachmentReplacement()
    tab.attachment_type = item:getAttachmentType()
    tab.bandage_power = item:getBandagePower()
    tab.blood_level = item:getBloodLevel()
    tab.boredom_change = item:getBoredomChange()
    tab.brake_force = item:getBrakeForce()
    tab.break_sound = item:getBreakSound()
    tab.burnt_string = item:getBurntString()
    tab.chance_to_spawn_damaged = item:getChanceToSpawnDamaged()
    tab.can_be_activated = item:canBeActivated()
    tab.color_blue = item:getColorBlue()
    tab.color_green = item:getColorGreen()
    tab.color_red = item:getColorRed()
    tab.condition = item:getCondition()
    tab.condition_lower_normal = item:getConditionLowerNormal()
    tab.condition_lower_offroad = item:getConditionLowerOffroad()
    tab.condition_max = item:getConditionMax()
    tab.container_x = item:getContainerX()
    tab.container_y = item:getContainerY()
    tab.cooked_string = item:getCookedString()
    tab.cooking_time = item:getCookingTime()
    tab.count = item:getCount()
    tab.count_down_sound = item:getCountDownSound()
    tab.current_ammo_count = item:getCurrentAmmoCount()
    tab.current_uses = item:getCurrentUses()
    tab.custom_menu_option = item:getCustomMenuOption()
    tab.description = item:getDescription()
    tab.display_category = item:getDisplayCategory()
    tab.durability = item:getDurability()
    tab.engine_loudness = item:getEngineLoudness()
    tab.evolved_recipe_name = item:getEvolvedRecipeName()
    tab.explosion_sound = item:getExplosionSound()
    tab.fatigue_change = item:getFatigueChange()
    tab.full_type = item:getFullType()
    tab.gun_type = item:getGunType()
    tab.have_been_repaired = item:getHaveBeenRepaired()
    tab.head_condition = item:getHeadCondition()
    tab.id = item:getID()
    tab.is_crafting_consumed = item:getIsCraftingConsumed()
    tab.item_capacity = item:getItemCapacity()
    tab.item_heat = item:getItemHeat()
    tab.item_when_dry = item:getItemWhenDry()
    tab.job_delta = item:getJobDelta()
    tab.job_type = item:getJobType()
    tab.key_id = item:getKeyId()
    tab.last_aged = item:getLastAged()
    tab.light_distance = item:getLightDistance()
    tab.light_strength = item:getLightStrength()
    tab.max_ammo = item:getMaxAmmo()
    tab.max_capacity = item:getMaxCapacity()
    tab.media_type = item:getMediaType()
    tab.melting_time = item:getMeltingTime()
    tab.metal_value = item:getMetalValue()
    tab.minutes_to_burn = item:getMinutesToBurn()
    tab.minutes_to_cook = item:getMinutesToCook()
    tab.model_index = item:getModelIndex()
    --tab.module = item:getModule()
    if item:getDisplayName() then
        tab.name = item:getDisplayName()
    end
    tab.off_age = item:getOffAge()
    tab.off_age_max = item:getOffAgeMax()
    tab.off_string = item:getOffString()
    tab.origin_x = item:getOriginX()
    tab.origin_y = item:getOriginY()
    tab.origin_z = item:getOriginZ()
    tab.quality = item:getQuality()
    tab.recorded_media_index = item:getRecordedMediaIndex()
    tab.reduce_infection_power = item:getReduceInfectionPower()
    tab.registry_id = item:getRegistry_id()
    tab.remote_control_idd = item:getRemoteControlID()
    tab.remote_range = item:getRemoteRange()
    tab.replace_on_use = item:getReplaceOnUse()
    tab.replace_on_use_on = item:getReplaceOnUseOn()
    if item:hasSharpness() then
        tab.sharpness = item:getSharpness()
    end
    tab.stash_chance = item:getStashChance()
    tab.stash_map = item:getStashMap()
    tab.static_model = item:getStaticModel()
    tab.stress_change = item:getStressChange()
    tab.suspension_compression = item:getSuspensionCompression()
    tab.suspension_damping = item:getSuspensionDamping()
    tab.times_head_repaired = item:getTimesHeadRepaired()
    tab.times_repaired = item:getTimesRepaired()
    tab.tooltip = item:getTooltip()
    -- tab.type = item:getType()
    tab.un_cooked_string = item:getUnCookedString()
    tab.unhappy_change = item:getUnhappyChange()
    -- tab.uses = item:getUses()
    tab.weight = item:getWeight()
    tab.wet_cooldown = item:getWetCooldown()
    tab.wheel_friction = item:getWheelFriction()
    tab.worker = item:getWorker()
    tab.world_alpha = item:getWorldAlpha()
    tab.world_static_item = item:getWorldStaticItem()
    tab.world_static_model = item:getWorldStaticModel()
    tab.world_texture = item:getWorldTexture()
    tab.world_x_rotation = item:getWorldXRotation()
    tab.world_y_rotation = item:getWorldYRotation()
    tab.world_z_rotation = item:getWorldZRotation()
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
    if item:haveExtraItems() ~= nil and item:getExtraItems():size() > 0 then
        tab.extra_items = {}
        for i = 0, item:getExtraItems():size() - 1 do
            tab.extra_items[i] = item:getExtraItems():get(i)
        end
    end
    return tab
end

Convertor.sub.Normal.lua2java = function(tab)
    local full_type = tab.full_type
    local item = instanceItem(full_type)
    if item == nil then
        return nil
    end
    if tab.actual_weight then
        item:setActualWeight(tab.actual_weight)
    end
    if tab.age then
        item:setAge(tab.age)
    end
    if tab.alcohol_power then
        item:setAlcoholPower(tab.alcohol_power)
    end
    if tab.ammo_type then
        item:setAmmoType(tab.ammo_type)
    end
    if tab.attached_slot then
        item:setAttachedSlot(tab.attached_slot)
    end
    if tab.attached_slot_type then
        item:setAttachedSlotType(tab.attached_slot_type)
    end
    if tab.attached_to_model then
        item:setAttachedToModel(tab.attached_to_model)
    end
    if tab.attachment_replacement then
        item:setAttachmentReplacement(tab.attachment_replacement)
    end
    if tab.attachment_type then
        item:setAttachmentType(tab.attachment_type)
    end
    if tab.bandage_power then
        item:setBandagePower(tab.bandage_power)
    end
    if tab.blood_level then
        item:setBloodLevel(tab.blood_level)
    end
    if tab.boredom_change then
        item:setBoredomChange(tab.boredom_change)
    end
    if tab.brake_force then
        item:setBrakeForce(tab.brake_force)
    end
    if tab.break_sound then
        item:setBreakSound(tab.break_sound)
    end
    if tab.burnt_string then
        item:setBurntString(tab.burnt_string)
    end
    if tab.can_be_activated then
        item:setCanBeActivated(tab.can_be_activated)
    end
    if tab.chance_to_spawn_damaged then
        item:setChanceToSpawnDamaged(tab.chance_to_spawn_damaged)
    end
    if tab.color_blue then
        item:setColorBlue(tab.color_blue)
    end
    if tab.color_green then
        item:setColorGreen(tab.color_green)
    end
    if tab.color_red then
        item:setColorRed(tab.color_red)
    end
    if tab.condition then
        item:setCondition(tab.condition)
    end
    if tab.condition_lower_normal then
        item:setConditionLowerNormal(tab.condition_lower_normal)
    end
    if tab.condition_lower_offroad then
        item:setConditionLowerOffroad(tab.condition_lower_offroad)
    end
    if tab.condition_max then
        item:setConditionMax(tab.condition_max)
    end
    if tab.container_x then
        item:setContainerX(tab.container_x)
    end
    if tab.container_y then
        item:setContainerY(tab.container_y)
    end
    if tab.cooked_string then
        item:setCookedString(tab.cooked_string)
    end
    if tab.cooking_time then
        item:setCookingTime(tab.cooking_time)
    end
    if tab.count then
        item:setCount(tab.count)
    end
    if tab.count_down_sound then
        item:setCountDownSound(tab.count_down_sound)
    end
    if tab.current_ammo_count then
        item:setCurrentAmmoCount(tab.current_ammo_count)
    end
    if tab.current_uses then
        item:setCurrentUses(tab.current_uses)
    end
    if tab.custom_menu_option then
        item:setCustomMenuOption(tab.custom_menu_option)
    end
    if tab.description then
        item:setDescription(tab.description)
    end
    if tab.display_category then
        item:setDisplayCategory(tab.display_category)
    end
    if tab.durability then
        item:setDurability(tab.durability)
    end
    if tab.engine_loudness then
        item:setEngineLoudness(tab.engine_loudness)
    end
    if tab.evolved_recipe_name then
        item:setEvolvedRecipeName(tab.evolved_recipe_name)
    end
    if tab.explosion_sound then
        item:setExplosionSound(tab.explosion_sound)
    end
    if tab.fatigue_change then
        item:setFatigueChange(tab.fatigue_change)
    end
    if tab.gun_type then
        item:setGunType(tab.gun_type)
    end
    if tab.have_been_repaired then
        item:setHaveBeenRepaired(tab.have_been_repaired)
    end
    if tab.head_condition then
        item:setHeadCondition(tab.head_condition)
    end
    if tab.id then
        item:setID(tab.id)
    end
    if tab.is_crafting_consumed then
        item:setIsCraftingConsumed(tab.is_crafting_consumed)
    end
    if tab.item_capacity then
        item:setItemCapacity(tab.item_capacity)
    end
    if tab.item_heat then
        item:setItemHeat(tab.item_heat)
    end
    if tab.item_when_dry then
        item:setItemWhenDry(tab.item_when_dry)
    end
    if tab.job_delta then
        item:setJobDelta(tab.job_delta)
    end
    if tab.job_type then
        item:setJobType(tab.job_type)
    end
    if tab.key_id then
        item:setKeyId(tab.key_id)
    end
    if tab.last_aged then
        item:setLastAged(tab.last_aged)
    end
    if tab.light_distance then
        item:setLightDistance(tab.light_distance)
    end
    if tab.light_strength then
        item:setLightStrength(tab.light_strength)
    end
    if tab.max_ammo then
        item:setMaxAmmo(tab.max_ammo)
    end
    if tab.max_capacity then
        item:setMaxCapacity(tab.max_capacity)
    end
    if tab.media_type then
        item:setMediaType(tab.media_type)
    end
    if tab.melting_time then
        item:setMeltingTime(tab.melting_time)
    end
    if tab.metal_value then
        item:setMetalValue(tab.metal_value)
    end
    if tab.minutes_to_burn then
        item:setMinutesToBurn(tab.minutes_to_burn)
    end
    if tab.minutes_to_cook then
        item:setMinutesToCook(tab.minutes_to_cook)
    end
    if tab.model_index then
        item:setModelIndex(tab.model_index)
    end
    --if tab.module then
    --    item:setModule(tab.module)
    --end
    if tab.name then
        item:setName(tab.name)
    end
    if tab.off_age then
        item:setOffAge(tab.off_age)
    end
    if tab.off_age_max then
        item:setOffAgeMax(tab.off_age_max)
    end
    if tab.off_string then
        item:setOffString(tab.off_string)
    end
    if tab.origin_x then
        item:setOriginX(tab.origin_x)
    end
    if tab.origin_y then
        item:setOriginY(tab.origin_y)
    end
    if tab.origin_z then
        item:setOriginZ(tab.origin_z)
    end
    if tab.quality then
        item:setQuality(tab.quality)
    end
    if tab.recorded_media_index then
        item:setRecordedMediaIndex(tab.recorded_media_index)
    end
    if tab.reduce_infection_power then
        item:setReduceInfectionPower(tab.reduce_infection_power)
    end
    if tab.registry_id then
        item:setRegistry_id(tab.registry_id)
    end
    if tab.remote_control_id then
        item:setRemoteControlID(tab.remote_control_id)
    end
    if tab.remote_range then
        item:setRemoteRange(tab.remote_range)
    end
    if tab.replace_on_use then
        item:setReplaceOnUse(tab.replace_on_use)
    end
    if tab.replace_on_use_on then
        item:setReplaceOnUseOn(tab.replace_on_use_on)
    end
    if item:hasSharpness() and tab.sharpness then
        item:setSharpness(tab.sharpness)
    end
    if tab.stash_chance then
        item:setStashChance(tab.stash_chance)
    end
    if tab.stash_map then
        item:setStashMap(tab.stash_map)
    end
    if tab.static_model then
        item:setStaticModel(tab.static_model)
    end
    if tab.stress_change then
        item:setStressChange(tab.stress_change)
    end
    if tab.suspension_compression then
        item:setSuspensionCompression(tab.suspension_compression)
    end
    if tab.suspension_damping then
        item:setSuspensionDamping(tab.suspension_damping)
    end
    if tab.times_head_repaired then
        item:setTimesHeadRepaired(tab.times_head_repaired)
    end
    if tab.times_repaired then
        item:setTimesRepaired(tab.times_repaired)
    end
    if tab.tooltip then
        item:setTooltip(tab.tooltip)
    end
    --if tab.type then
    --    item:setType(tab.type)
    --end
    if tab.un_cooked_string then
        item:setUnCookedString(tab.un_cooked_string)
    end
    if tab.unhappy_change then
        item:setUnhappyChange(tab.unhappy_change)
    end
    --if tab.uses then
    --    item:setUses(tab.uses)
    --end
    if tab.weight then
        item:setWeight(tab.weight)
    end
    if tab.wet_cooldown then
        item:setWetCooldown(tab.wet_cooldown)
    end
    if tab.wheel_friction then
        item:setWheelFriction(tab.wheel_friction)
    end
    if tab.worker then
        item:setWorker(tab.worker)
    end
    if tab.world_alpha then
        item:setWorldAlpha(tab.world_alpha)
    end
    if tab.world_static_item then
        item:setWorldStaticItem(tab.world_static_item)
    end
    if tab.world_static_model then
        item:setWorldStaticModel(tab.world_static_model)
    end
    if tab.world_texture then
        item:setWorldTexture(tab.world_texture)
    end
    if tab.world_x_rotation then
        item:setWorldXRotation(tab.world_x_rotation)
    end
    if tab.world_y_rotation then
        item:setWorldYRotation(tab.world_y_rotation)
    end
    if tab.world_z_rotation then
        item:setWorldZRotation(tab.world_z_rotation)
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
    if item:haveExtraItems() then
        item:getExtraItems():clear()
    end
    if tab.extra_items then
        for _, ei in pairs(tab.extra_items) do
            item:addExtraItem(ei)
        end
    end

    return item

end
Hooks:PostHook(PlayerStandard, "update", "ads", function(self)
    local cam = self._camera_unit
    local ads = self:in_steelsight()
    for _, data in pairs(cam:spawn_manager():spawned_units()) do
        data.unit:set_visible(not ads)
    end
    if cam:visible() == ads then
        local inv = self._ext_inventory
        inv[ads and "hide_equipped_unit" or "show_equipped_unit"](inv)
        cam:set_visible(not ads)
    end
end)

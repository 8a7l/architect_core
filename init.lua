-- architect_core/init.lua
architect_core = {}

-- Зберігаємо шлях до папки зі схематиками
architect_core.schems_dir = minetest.get_modpath("architect_core") .. "/schems"

-- Універсальна функція для побудови карти
function architect_core.build(map_data)
    minetest.log("action", "[architect_core] Початок генерації карти...")
    
    for i, item in ipairs(map_data) do
        local delay = i * 0.1
        minetest.after(delay, function()
            local pos = {x = item.x, y = item.y, z = item.z}
            local path = architect_core.schems_dir .. "/" .. item.file
            local rot = item.rotation or "0"
            minetest.place_schematic(pos, path, rot, true)
        end)
    end
    
    minetest.after(#map_data * 0.1 + 1, function()
        minetest.log("action", "[architect_core] Карту збудовано.")
    end)
end
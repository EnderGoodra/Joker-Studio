-- =============
--  Config Menu
-- =============

Workshop.config_tab = function()
    return {n = G.UIT.ROOT, config = {r = 0.1, minw = 4, minh = 4, align = "cm", padding = 0.2, colour = G.C.BLACK}, nodes = {
        {n=G.UIT.C, nodes = {
            create_toggle({label = localize('conf_palette_lock'), ref_table = Workshop.config, ref_value = 'palette_lock', info = localize('conf_palette_lock_desc'), active_colour = Workshop.badge_colour, right = true}),
            create_toggle({label = localize('conf_run_reset'), ref_table = Workshop.config, ref_value = 'run_reset', info = localize('conf_run_reset_desc'), active_colour = Workshop.badge_colour, right = true}),
        }},
        {n=G.UIT.C, config = {align = "cm"}, nodes = {
            { n = G.UIT.R, config = {align = "cm"}, nodes = {
                {n=G.UIT.T, config={text = 'Make sure all files related to', scale = 0.3*1, colour = G.C.UI.TEXT_LIGHT}},
            }},
            { n = G.UIT.R, config = {align = "cm"}, nodes = {
                {n=G.UIT.T, config={text = 'Custom Jokers are closed before purging', scale = 0.3*1, colour = G.C.UI.TEXT_LIGHT}},
            }},
            { n = G.UIT.R, config = {align = "cm", padding = 0.2}, nodes = {
                UIBox_button({ colour = G.C.RED, button = "JC_Purge_Jokers", label = { 'Purge Custom Jokers' }, minw = 5, focus_args = { snap_to = true }}),
            }},
        }}
    }}
end

G.FUNCS.JC_Purge_Jokers = function()
    ClearCustomJokerData()
end


-- ==============
--  Joker Editor
-- ==============

function create_UIBox_JS_menu(card)
    G.E_MANAGER:add_event(Event({
        blockable = false,
        func = function()
            G.REFRESH_ALERTS = true
            return true
        end,
    }))
    local t = create_UIBox_generic_options({
        bg_colour = {0, 0, 0, 0.25},
        no_back = true,
        colour = HEX("666666"),
        outline_colour = HEX("ffffff"),
        contents = {
            {n = G.UIT.R, config = { align = "tm"}, nodes = {
                {n = G.UIT.C, config = { align = "cr", padding = 0.15}, nodes = {
                    JS_GenerateImage(1,1),
                    {n = G.UIT.R, config = { align = "cm"}, nodes = {
                        { n = G.UIT.C, nodes = {
                            { n = G.UIT.R, config = {padding = 0.1}, nodes = {
                                {n=G.UIT.T, config={text = 'Consumable not refunded', scale = 0.3, colour = G.C.UI.TEXT_LIGHT}}
                            }},
                            UIBox_button({ colour = G.C.RED, button = "JS_Cancel", label = { 'Exit ' }, minw = 3, focus_args = { snap_to = true }}),
                        }},
                        { n = G.UIT.C, nodes = {
                            { n = G.UIT.R, config = {padding = 0.1}, nodes = {
                                {n=G.UIT.T, config={text = ' ', scale = 0.3, colour = G.C.UI.TEXT_LIGHT}}
                            }},
                            UIBox_button({ colour = G.C.BLUE, button = "JS_Save", label = { 'Save' }, minw = 4.1, focus_args = { snap_to = true }}),
                        }},
                    }},
                }},
                {n = G.UIT.C, config = { align = "cl"}, nodes = {
                    {n = G.UIT.C, config = { padding = 0, align = "ct"}, nodes = JS_GeneratePalette()},
                }},
            }
        }}
    })
    return t
end

function JS_GeneratePalette()
    local palette = {
        { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            {n=G.UIT.T, config={text = 'Pen Colour', scale = 0.3*1, colour = G.C.UI.TEXT_LIGHT}}
        }},
    }
    if G.JS_TIER == 1 and Workshop.config.palette_lock then
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('ffffff'), button = "JS_Set_Pen", ref_table = {col = HEX('ffffff')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('bfc7d5'), button = "JS_Set_Pen", ref_table = {col = HEX('bfc7d5')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('4f6367'), button = "JS_Set_Pen", ref_table = {col = HEX('4f6367')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fd5f55'), button = "JS_Set_Pen", ref_table = {col = HEX('00000000')}, label = { 'X' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
    elseif G.JS_TIER == 2 and Workshop.config.palette_lock then
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fd5f55'), button = "JS_Set_Pen", ref_table = {col = HEX('fd5f55')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('f8db42'), button = "JS_Set_Pen", ref_table = {col = HEX('f8db42')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('55a383'), button = "JS_Set_Pen", ref_table = {col = HEX('55a383')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('009cfd'), button = "JS_Set_Pen", ref_table = {col = HEX('009cfd')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('ffffff'), button = "JS_Set_Pen", ref_table = {col = HEX('ffffff')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('bfc7d5'), button = "JS_Set_Pen", ref_table = {col = HEX('bfc7d5')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('4f6367'), button = "JS_Set_Pen", ref_table = {col = HEX('4f6367')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fd5f55'), button = "JS_Set_Pen", ref_table = {col = HEX('00000000')}, label = { 'X' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
    elseif G.JS_TIER == 3 and Workshop.config.palette_lock then
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fd5f55'), button = "JS_Set_Pen", ref_table = {col = HEX('fd5f55')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fda200'), button = "JS_Set_Pen", ref_table = {col = HEX('fda200')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('f8db42'), button = "JS_Set_Pen", ref_table = {col = HEX('f8db42')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('55a383'), button = "JS_Set_Pen", ref_table = {col = HEX('55a383')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('009cfd'), button = "JS_Set_Pen", ref_table = {col = HEX('009cfd')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('8a71e1'), button = "JS_Set_Pen", ref_table = {col = HEX('8a71e1')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('ffffff'), button = "JS_Set_Pen", ref_table = {col = HEX('ffffff')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('bfc7d5'), button = "JS_Set_Pen", ref_table = {col = HEX('bfc7d5')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('4f6367'), button = "JS_Set_Pen", ref_table = {col = HEX('4f6367')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fd5f55'), button = "JS_Set_Pen", ref_table = {col = HEX('00000000')}, label = { 'X' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
    else
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fd5f55'), button = "JS_Set_Pen", ref_table = {col = HEX('fd5f55')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('a6605d'), button = "JS_Set_Pen", ref_table = {col = HEX('a6605d')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fda200'), button = "JS_Set_Pen", ref_table = {col = HEX('fda200')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('b3760a'), button = "JS_Set_Pen", ref_table = {col = HEX('b3760a')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('f8db42'), button = "JS_Set_Pen", ref_table = {col = HEX('f8db42')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('cab433'), button = "JS_Set_Pen", ref_table = {col = HEX('cab433')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('55a383'), button = "JS_Set_Pen", ref_table = {col = HEX('55a383')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('538a73'), button = "JS_Set_Pen", ref_table = {col = HEX('538a73')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('009cfd'), button = "JS_Set_Pen", ref_table = {col = HEX('009cfd')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('0084d8'), button = "JS_Set_Pen", ref_table = {col = HEX('0084d8')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('8a71e1'), button = "JS_Set_Pen", ref_table = {col = HEX('8a71e1')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('6b618b'), button = "JS_Set_Pen", ref_table = {col = HEX('6b618b')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('ffffff'), button = "JS_Set_Pen", ref_table = {col = HEX('ffffff')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('bfc7d5'), button = "JS_Set_Pen", ref_table = {col = HEX('bfc7d5')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
        table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('4f6367'), button = "JS_Set_Pen", ref_table = {col = HEX('4f6367')}, label = { ' ' }, minw = 0.9, focus_args = { snap_to = true }}),
            }},
            { n = G.UIT.C, nodes = {
                UIBox_button({ colour = HEX('fd5f55'), button = "JS_Set_Pen", ref_table = {col = HEX('00000000')}, label = { 'X' }, minw = 0.9, focus_args = { snap_to = true }})
            }},
        }})
    end

    table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
        {n=G.UIT.T, config={text = 'Pen Size', scale = 0.3*1, colour = G.C.UI.TEXT_LIGHT}}
    }})
    table.insert(palette, { n = G.UIT.R, config = {padding = 0.1}, nodes = {
        { n = G.UIT.C, nodes = {
            UIBox_button({ colour = HEX('4f6367'), button = "JS_Set_Pen", ref_table = {siz = 1}, label = { '1' }, minw = 0.6, minh = 0.5, focus_args = { snap_to = true }}),
        }},
        { n = G.UIT.C, nodes = {
            UIBox_button({ colour = HEX('4f6367'), button = "JS_Set_Pen", ref_table = {siz = 2}, label = { '2' }, minw = 0.6, minh = 0.5, focus_args = { snap_to = true }})
        }},
        { n = G.UIT.C, nodes = {
            UIBox_button({ colour = HEX('4f6367'), button = "JS_Set_Pen", ref_table = {siz = 3}, label = { '3' }, minw = 0.6, minh = 0.5, focus_args = { snap_to = true }})
        }},
    }})
    return palette
end

function JS_SetAtlasActive()
    for i=1,2 do
        local data, size = NFS.read(Workshop.path..'assets/'..i..'x/custom/joker'..G.JS_ACTIVE_JOKER..'.png')
        local success, message NFS.write(Workshop.path..'assets/'..i..'x/custom/joker_active.png', data)
    end

    G.ASSET_ATLAS["egjs_atlas_custom_active"].image = love.graphics.newImage('/Mods/'..FolderName..'/assets/'..G.SETTINGS.GRAPHICS.texture_scaling..'x/custom/joker_active.png', {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling})
end

function JS_GenerateImage(countX, countY)
    G.viewed_collab = G.viewed_collab or 'The Binding of Isaac'

    local curr_collab = {
        artist = 'Franek',
        ml_text = {
          '© 2025 ZeniMax.  ZeniMax and Bethesda Game Studios',
          'are trademarks of the ZeniMax group of companies. ',
          'All rights reserved.',
        },
        art = 'collab_FO'
    }

    local collab_sprite = Sprite(0,0,3.5*G.CARD_W,3.5*G.CARD_H,G.ASSET_ATLAS['egjs_atlas_custom_active'], {x=0,y=0}) 
    local collab_sprite_invis = Sprite(0,0,3.5*G.CARD_W,3.5*G.CARD_H,G.ASSET_ATLAS['egjs_atlas_custom_active'], {x=0,y=0}) 
    
    local grid = {n = G.UIT.R, config = {padding = -3.5*G.CARD_W, align = "cm", colour = {0.3, 0.3, 0.3, 1}, minw = 3.5*G.CARD_W, minh = 3.5*G.CARD_H, emboss = 0}, nodes = {
            {n=G.UIT.O, config={colour = G.C.WHITE, object = collab_sprite, }},
            {n=G.UIT.C, config={colour = {0,0,0,0}, minw = 3.5*G.CARD_W, minh = 3.5*G.CARD_H, button = 'JS_Draw', JS_drag = true}},
        }}
    return grid
end

G.FUNCS.JS_Cancel = function()
    for i=1,2 do
        NFS.remove(Workshop.path..'assets/'..i..'x/custom/joker_active.png')
    end
    G.JS_MENU:remove()
    G.JS_ACTIVE_JOKER = 0
end

G.FUNCS.JS_Save = function()
    for i=1,2 do
        local data, size = NFS.read(Workshop.path..'assets/'..i..'x/custom/joker_active.png')
        local success, message = NFS.write(Workshop.path..'assets/'..i..'x/custom/joker'..G.JS_ACTIVE_JOKER..'.png', data)
    end
    JS_ReloadAtlas(true)
    for i=1,2 do
        NFS.remove(Workshop.path..'assets/'..i..'x/custom/joker_active.png')
    end

    G.JS_MENU:remove()
    G.JS_MENU = nil
    G.JA_SELECT = {
        CONDITION = 1,
        EFFECT = 1
    }
    G.JA_MENU = UIBox({
        definition = create_UIBox_JA_menu(),
        config = {
            align = "cm",
            offset = { x = 0, y = 10 },
            major = G.ROOM_ATTACH,
            bond = "Weak",
            instance_type = "POPUP",
        },
    })
    G.JA_MENU.alignment.offset.y = 0
    G.ROOM.jiggle = G.ROOM.jiggle + 1
    G.JA_MENU:align_to_major()
    --SMODS.save_mod_config(Workshop)

end

G.FUNCS.JS_Draw = function()
    JS_DrawCanvas("pen")
end

G.FUNCS.JS_Set_Pen = function(e)
    local args = e.config.ref_table
    if args.col then G.JS_PEN = args.col end
    if args.siz then G.JS_PEN_SIZE = args.siz end
    create_UIBox_JS_menu()
end

G.FUNCS.JS_Undo = function()
    if #G.JS_UNDO > 0 then
        JS_DrawCanvas("undo")
    end
end

G.FUNCS.JS_Clear = function()
    JS_DrawCanvas("clear")
end

JS_DrawCanvas = function(type)
    local _data1X, err1x = NFS.newFileData( Workshop.path..'assets/1x/custom/joker_active.png')
    local _data2X, err2x = NFS.newFileData( Workshop.path..'assets/2x/custom/joker_active.png')
    local center = {
        x = love.graphics.getWidth() / (G.TILESCALE * G.TILESIZE) / 2 - 1.08,
        y = love.graphics.getHeight() / (G.TILESCALE * G.TILESIZE) / 2 - 0.85,
    }
    local cursor_point = {
        x = math.max(0, -(center.x - 3.55) + G.CURSOR.VT.x),
        y = math.max(0, -(center.y - 4.75) + G.CURSOR.VT.y),
    }
    local int_cursor_point = {
        x = math.floor(math.min(cursor_point.x,7.1) / 7.1 * 71) + 1,
        y = math.floor(math.min(cursor_point.y,9.5) / 9.5 * 95) + 1
    }
    if not err1x and not err2x then
        local _imageData1x = love.image.newImageData( _data1X )
        local _imageData2x = love.image.newImageData( _data2X )

        local _size = G.JS_PEN_SIZE
        for a=-(_size-1),(_size-1) do
            for b=-(_size-1),(_size-1) do
                if not (a == -2 and b == -2
                or a == 2 and b == -2
                or a == -2 and b == 2
                or a == 2 and b == 2) then

                local px_x = math.max(1, math.min(int_cursor_point.x-1 + a, 69))
                local px_y = math.max(1, math.min(int_cursor_point.y-1 + b, 93))

                _imageData1x:setPixel(px_x, px_y, G.JS_PEN)

                _imageData2x:setPixel(px_x*2, px_y*2, G.JS_PEN)
                _imageData2x:setPixel(px_x*2+1, px_y*2, G.JS_PEN)
                _imageData2x:setPixel(px_x*2, px_y*2+1, G.JS_PEN)
                _imageData2x:setPixel(px_x*2+1, px_y*2+1, G.JS_PEN)
                end
            end
        end
        G.JS_UNDO[#G.JS_UNDO+1] = undoStep
        local filedata1x = _imageData1x:encode("png")
        local filedata2x = _imageData2x:encode("png")
        NFS.write(Workshop.path..'assets/1x/custom/joker_active.png', filedata1x)
        NFS.write(Workshop.path..'assets/2x/custom/joker_active.png', filedata2x)
        JS_ReloadAtlas(false)
    else
        if err1x then
            print("Could not get file data: "..err1x)
        end
        if err2x then
            print("Could not get file data: "..err2x)
        end
        
    end
    create_UIBox_JS_menu()
end

JS_ReloadAtlas = function(full)
    if not full then
        G.ASSET_ATLAS["egjs_atlas_custom_active"].image = love.graphics.newImage('/Mods/'..FolderName..'/assets/'..G.SETTINGS.GRAPHICS.texture_scaling..'x/custom/joker_active.png', {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling})
    end

    if full then
        for i=1,5 do
            G.ASSET_ATLAS["egjs_atlas_custom"..G.JS_ACTIVE_JOKER].image = love.graphics.newImage('/Mods/'..FolderName..'/assets/'..G.SETTINGS.GRAPHICS.texture_scaling..'x/custom/joker'..G.JS_ACTIVE_JOKER..'.png', {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling})
        end
    end
end

-- ============
--  Joker Menu
-- ============

function create_UIBox_JM_menu(card)
    G.E_MANAGER:add_event(Event({
        blockable = false,
        func = function()
            G.REFRESH_ALERTS = true
            return true
        end,
    }))
    local t = create_UIBox_generic_options({
        bg_colour = {0, 0, 0, 0.25},
        no_back = true,
        colour = HEX("666666"),
        outline_colour = HEX("ffffff"),
        contents = {
            {n = G.UIT.C, config = { align = "tm"}, nodes = {
                { n = G.UIT.R, config = { align = "cm"}, nodes = {
                    { n = G.UIT.C, { align = "cr"}, nodes = {
                        UIBox_button({ colour = G.C.RED, button = "JM_Select", ref_table = {id = 1}, label = { '1' }, minw = 1, minh = 0.65, focus_args = { snap_to = true }}),
                        UIBox_button({ colour = G.C.RED, button = "JM_Select", ref_table = {id = 2}, label = { '2' }, minw = 1, minh = 0.65, focus_args = { snap_to = true }}),
                        UIBox_button({ colour = G.C.RED, button = "JM_Select", ref_table = {id = 3}, label = { '3' }, minw = 1, minh = 0.65, focus_args = { snap_to = true }}),
                        UIBox_button({ colour = G.C.RED, button = "JM_Select", ref_table = {id = 4}, label = { '4' }, minw = 1, minh = 0.65, focus_args = { snap_to = true }}),
                        UIBox_button({ colour = G.C.RED, button = "JM_Select", ref_table = {id = 5}, label = { '5' }, minw = 1, minh = 0.65, focus_args = { snap_to = true }}),
                    }},
                    { n = G.UIT.C, { align = "cl"}, nodes = {
                        JM_GenerateCard()
                    }},
                }},
                { n = G.UIT.R, nodes = {
                    { n = G.UIT.C, nodes = {
                        { n = G.UIT.R, config = {padding = 0.1}, nodes = {
                            {n=G.UIT.T, config={text = 'Consumable not refunded', scale = 0.25, colour = G.C.UI.TEXT_LIGHT}}
                        }},
                        UIBox_button({ colour = G.C.RED, button = "JM_Cancel", label = { 'Exit' }, minw = 3, focus_args = { snap_to = true }}),
                    }},
                    { n = G.UIT.C, nodes = {
                        { n = G.UIT.R, config = {padding = 0.1}, nodes = {
                            {n=G.UIT.T, config={text = ' ', scale = 0.25, colour = G.C.UI.TEXT_LIGHT}}
                        }},
                        UIBox_button({ colour = G.C.GREEN, button = "JM_Add", label = { 'Add to Jokers' }, minw = 3, focus_args = { snap_to = true }}),
                    }},
                    { n = G.UIT.C, nodes = {
                        { n = G.UIT.R, config = {padding = 0.1}, nodes = {
                            {n=G.UIT.T, config={text = ' ', scale = 0.25, colour = G.C.UI.TEXT_LIGHT}}
                        }},
                        UIBox_button({ colour = G.C.BLUE, button = "JM_Edit", label = { 'Edit Joker' }, minw = 3, focus_args = { snap_to = true }}),
                    }},
                }},
            }
        }}
    })
    return t
end

G.FUNCS.JM_Select = function(e)
    local args = e.config.ref_table
    if args.id then G.JM_SELECT = args.id end

    local js_select_uibox = G.JM_MENU

    G.JM_MENU:remove()

    G.JM_MENU = UIBox({
        definition = create_UIBox_JM_menu(),
        config = {
            align = "cm",
            offset = { x = 0, y = 10 },
            major = G.ROOM_ATTACH,
            bond = "Weak",
            instance_type = 'ALERT',
        },
    })
    G.JM_MENU.alignment.offset.y = 0
	G.ROOM.jiggle = G.ROOM.jiggle + 1
	G.JM_MENU:align_to_major()
    --create_UIBox_JM_menu(card)

    --G.ROOM_ATTACH:recalculate()
end

G.FUNCS.JM_Cancel = function()
    G.JM_MENU:remove()
end

G.FUNCS.JM_Edit = function()
    G.JM_MENU:remove()

    G.JS_PEN = G.JS_PEN or G.C.RED
    G.JS_PEN_SIZE = G.JS_PEN_SIZE or 1
    G.JS_TIER = G.JM_TIER
    G.JS_ACTIVE_JOKER = G.JM_SELECT
    G.JS_UNDO = {}
    JS_SetAtlasActive()
    JS_ReloadAtlas(false)
    G.JS_MENU = UIBox({
		definition = create_UIBox_JS_menu(),
		config = {
			align = "cm",
			offset = { x = 0, y = 10 },
			major = G.ROOM_ATTACH,
			bond = "Weak",
			instance_type = "POPUP",
		},
	})
    G.JS_MENU.alignment.offset.y = 0
	G.ROOM.jiggle = G.ROOM.jiggle + 1
	G.JS_MENU:align_to_major()
end

G.FUNCS.JM_Add = function()
    JX_AddJoker()
    G.JM_MENU:remove()
    G.JM_SELECT = 1
end

function JM_GenerateCard()
    --local cardarea = CardArea( 2,2,3.5*G.CARD_W,0.75*G.CARD_H, {card_limit = 1, type = 'title', highlight_limit = 0})
    local selected_card = SMODS.create_card({set = "Joker", key = "j_egjs_cj_"..G.JM_SELECT, no_edition = true, skip_materialize = true})
    ease_value(selected_card.T, 'scale', 0.2 ,nil,'REAL',true,0.2)
    --cardarea:emplace(selected_card)
    local grid = {n = G.UIT.R, config = {padding = 0, align = "cm", colour = {0.3, 0.3, 0.3, 1}, minw = G.CARD_W * 1.2, minh = G.CARD_H * 1.2, emboss = 0}, nodes = {
            {n=G.UIT.O, config={colour = G.C.WHITE, object = selected_card }},
        }}
    return grid
end

-- ===============
--  Joker Ability
-- ===============

function create_UIBox_JA_menu(card)
    G.E_MANAGER:add_event(Event({
        blockable = false,
        func = function()
            G.REFRESH_ALERTS = true
            return true
        end,
    }))
    local _opt = {"test"}
    G.JA_CON = {}
    local t = create_UIBox_generic_options({
        bg_colour = {0, 0, 0, 0.25},
        no_back = true,
        colour = HEX("666666"),
        outline_colour = HEX("ffffff"),
        contents = {
            {n = G.UIT.C, config = { align = "tm"}, nodes = {
                { n = G.UIT.R, config = { align = "cm"}, nodes = {
                    { n = G.UIT.C, config = { align = "cm"}, nodes = {
                        { n = G.UIT.R, config = { align = "cm"}, nodes = {
                            condition_cycle = create_option_cycle({
                                options = GetTierCompatibleConditions(),
                                w = 4.5,
                                opt_callback = 'JA_cycle_condition',
                                focus_args = { snap_to = true, nav = 'wide' },
                                current_option = G.JA_SELECT.CONDITION or 1,
                                colour = G.C.RED,
                                no_pips = false,
                                mid = {n=G.UIT.R, config={align = "br"}, nodes={
                                    G.UIDEF.JA_text(CustomJokerConditions[GetTierCompatibleConditions()[G.JA_SELECT.CONDITION]].loc_key, nil)
                                    -- { n = G.UIT.C, config = { align = "cm"}, nodes = {
                                    --     G.UIDEF.JA_text(CustomJokerConditions[G.JA_SELECT.CONDITION].loc_key, nil)
                                    --     --{ n = G.UIT.O, config = {object = DynaText({string = localize{type ='name_text', key = blind_choice.config.key, set = 'Blind'}, colours = {G.C.WHITE},shadow = true, float = true,maxw = 2.2, scale = 0.45})}}
                                    -- }}
                                }}
                            }),
                        }},
                        { n = G.UIT.R, config = { align = "cm"}, nodes = {
                            effect_cycle = create_option_cycle({
                                options = GetTierCompatibleEffects(),
                                w = 4.5,
                                opt_callback = 'JA_cycle_effect',
                                focus_args = { snap_to = true, nav = 'wide' },
                                current_option = G.JA_SELECT.EFFECT or 1,
                                colour = G.C.RED,
                                no_pips = false,
                                mid = {n=G.UIT.R, config={align = "br"}, nodes={
                                    G.UIDEF.JA_text(CustomJokerConditions[GetTierCompatibleConditions()[G.JA_SELECT.CONDITION]].effects[GetTierCompatibleEffects()[G.JA_SELECT.EFFECT]].loc_key, {
                                        CustomJokerConditions[GetTierCompatibleConditions()[G.JA_SELECT.CONDITION]].effects[GetTierCompatibleEffects()[G.JA_SELECT.EFFECT]].amount[G.JM_TIER] or nil,
                                        ''..(G.GAME and G.GAME.probabilities.normal or 1),
                                        colours = {CustomJokerConditions[GetTierCompatibleConditions()[G.JA_SELECT.CONDITION]].effects[GetTierCompatibleEffects()[G.JA_SELECT.EFFECT]].loc_col
                                            and CustomJokerConditions[GetTierCompatibleConditions()[G.JA_SELECT.CONDITION]].effects[GetTierCompatibleEffects()[G.JA_SELECT.EFFECT]].loc_col[G.JM_TIER]
                                            or {G.C.RED}}})
                                }}
                            })
                        }},
                    }},
                }},
                { n = G.UIT.R, nodes = {
                    { n = G.UIT.C, nodes = {
                        { n = G.UIT.R, config = {padding = 0.1}, nodes = {
                            {n=G.UIT.T, config={text = 'Consumable not refunded', scale = 0.25, colour = G.C.UI.TEXT_LIGHT}}
                        }},
                        UIBox_button({ colour = G.C.RED, button = "JA_Cancel", label = { 'Exit' }, minw = 3, focus_args = { snap_to = true }}),
                    }},
                    { n = G.UIT.C, nodes = {
                        { n = G.UIT.R, config = {padding = 0.1}, nodes = {
                            {n=G.UIT.T, config={text = ' ', scale = 0.25, colour = G.C.UI.TEXT_LIGHT}}
                        }},
                        UIBox_button({ colour = G.C.BLUE, button = "JA_Save", label = { 'Save and Add' }, minw = 3, focus_args = { snap_to = true }}),
                    }},
                }},
            }
        }}
    })
    return t
end

G.FUNCS.JA_Cancel = function()
    G.JA_MENU:remove()
end

G.FUNCS.JA_Save = function()
    JX_AddJoker()

    Workshop.config.custom_jokers["joker"..G.JS_ACTIVE_JOKER].in_use = true
    Workshop.config.custom_jokers["joker"..G.JS_ACTIVE_JOKER].condition = GetTierCompatibleConditions()[G.JA_SELECT.CONDITION]
    Workshop.config.custom_jokers["joker"..G.JS_ACTIVE_JOKER].effect = GetTierCompatibleEffects()[G.JA_SELECT.EFFECT]
    Workshop.config.custom_jokers["joker"..G.JS_ACTIVE_JOKER].tier = G.JS_TIER
    G.JS_ACTIVE_JOKER = nil
    G.JA_MENU:remove()
    G.JA_SELECT = nil
    SMODS.save_mod_config(Workshop)
end

function G.UIDEF.JA_text(text_key, loc_vars) 
    local text = {}
    localize{type = 'other', key = text_key, vars = loc_vars or {}, nodes = text}

    local row = {}
    for k, v in ipairs(text) do
      row[#row+1] =  {n=G.UIT.R, config={align = "br"}, nodes=v}
    end
    local t = {n=G.UIT.R, config = {align = "cm", minh = 1,r = 0.3, padding = 0.07, minw = 1, colour = G.C.JOKER_GREY, shadow = true}, nodes={
                  {n=G.UIT.C, config={align = "cm", minh = 1,r = 0.2, padding = 0.1, minw = 1, colour = G.C.WHITE}, nodes={
                  {n=G.UIT.C, config={align = "cm", minh = 1,r = 0.2, padding = 0.03, minw = 1, colour = G.C.WHITE}, nodes=row}}
                  }
                }}
    return t
end

GetTierCompatibleConditions = function()
    local counter = 1
    local validPool = {}
    for k,v in pairs(CustomJokerConditions) do
        if v ~= nil and (not v.min_tier or v.min_tier <= G.JM_TIER) and ((not v.dependency) or (v.dependency and next(SMODS.find_mod(v.dependency)))) then
            validPool[counter] = k
            counter = counter + 1
        end
    end
    return validPool
end

GetTierCompatibleEffects = function()
    local counter = 1
    local validPool = {}
    table.sort(CustomJokerConditions[GetTierCompatibleConditions()[G.JA_SELECT.CONDITION]].effects, function(a, b) return (a.order or 1) < (b.order or 1) end)
    for k,v in pairs(CustomJokerConditions[GetTierCompatibleConditions()[G.JA_SELECT.CONDITION]].effects) do
        if v ~= nil and (not v.min_tier or v.min_tier <= G.JM_TIER) and ((not v.dependency) or (v.dependency and next(SMODS.find_mod(v.dependency)))) then
            validPool[counter] = k
            counter = counter + 1
        end
    end
    return validPool
end

G.FUNCS.JA_cycle_condition = function(args)
    G.JA_SELECT.CONDITION = args.to_key
    G.FUNCS.JA_cycle_effect({to_key = 1})

end

G.FUNCS.JA_cycle_effect = function(args)
    G.JA_SELECT.EFFECT = args.to_key
    G.JA_MENU:remove()
    G.JA_MENU = UIBox({
        definition = create_UIBox_JA_menu(),
        config = {
            align = "cm",
            offset = { x = 0, y = 10 },
            major = G.ROOM_ATTACH,
            bond = "Weak",
            instance_type = "POPUP",
        },
    })
    G.JA_MENU.alignment.offset.y = 0
    G.ROOM.jiggle = G.ROOM.jiggle + 1
    G.JA_MENU:align_to_major()
end

-- ==============
--  Multi-use
-- ==============

JX_AddJoker = function ()
    local card = SMODS.create_card({set = "Joker", key = "j_egjs_cj_"..G.JM_SELECT})
    if G.JM_MODIFIER then
        if G.JM_MODIFIER == "perishable" then
            card.ability.perishable = true
        end
    end
	card:add_to_deck()
	G.jokers:emplace(card)
end

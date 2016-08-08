function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	dxDrawText ( text, x - 1, y - 1, w - 1, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false ) -- black
	dxDrawText ( text, x + 1, y - 1, w + 1, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 1, y + 1, w - 1, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y + 1, w + 1, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 1, y, w - 1, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y, w + 1, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y - 1, w, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y + 1, w, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end

-- Settings variables
local textFont       = "default-bold"			-- The font of the tag text
local textScale      = 1						-- The scale of the tag text
local heightPadding  = 5						-- The amount of pixels the tag should be extended on either side of the vertical axis
local widthPadding   = 2						-- The amount of pixels the tag should be extended on either side of the horizontal axis
local xOffset        = 8						-- Distance between the player blip and the tag
local minAlpha       = 10						-- If blip alpha falls below this, the tag won't the shown
local textAlpha      = 255
local rectangleColor = tocolor(0,0,0,0)

-- Other variables
local floor          = math.floor
local w,h            = guiGetScreenSize()

local function drawMapStuff2()
	if isPlayerMapVisible() then
		local sx,sy,ex,ey     = getPlayerMapBoundingBox()							-- Map positions
		local mw,mh           = ex-sx,sy-ey											-- Map width/height
		local cx,cy           = (sx+ex)/2,(sy+ey)/2									-- Center position of the map
		local ppuX,ppuY       = mw/6000,mh/6000										-- Pixels per unit
		local fontHeight      = dxGetFontHeight(textScale,textFont)					-- Height of the specified font
		local yOffset         = fontHeight/2										-- How much pixels the tag should be offsetted at
		local px, py = 2862.4997558594,-233.13499450684
		local x          = floor(cx+px*ppuX+xOffset)						-- X for the nametag
		local y          = floor(cy+py*ppuY-yOffset)						-- Y for the nametag
		local pname      = "SAPD"
		local nameLength = dxGetTextWidth(pname,textScale,textFont)			-- Width of the playername
		local r,g,b      = 100,100,100
		dxDrawBorderedText(pname,x,y,x+nameLength,y+fontHeight, tocolor(r,g,b,textAlpha), textScale, "default-bold", "center", "center", false, false)
	end
end
addEventHandler("onClientRender",getRootElement(),drawMapStuff2)

-- MF
local floor          = math.floor
local w,h            = guiGetScreenSize()

local function drawMapStuff2()
	if isPlayerMapVisible() then
		local sx,sy,ex,ey     = getPlayerMapBoundingBox()							-- Map positions
		local mw,mh           = ex-sx,sy-ey											-- Map width/height
		local cx,cy           = (sx+ex)/2,(sy+ey)/2									-- Center position of the map
		local ppuX,ppuY       = mw/6000,mh/6000										-- Pixels per unit
		local fontHeight      = dxGetFontHeight(textScale,textFont)					-- Height of the specified font
		local yOffset         = fontHeight/2										-- How much pixels the tag should be offsetted at
		local px, py = 222.19046020508,1915.3247070313
		local x          = floor(cx+px*ppuX+xOffset)						-- X for the nametag
		local y          = floor(cy+py*ppuY-yOffset)						-- Y for the nametag
		local pname      = "MF"
		local nameLength = dxGetTextWidth(pname,textScale,textFont)			-- Width of the playername
		local r,g,b      = 0,100,0
		dxDrawBorderedText(pname,x,y,x+nameLength,y+fontHeight, tocolor(r,g,b,textAlpha), textScale, "default-bold", "center", "center", false, false)
	end
end
addEventHandler("onClientRender",getRootElement(),drawMapStuff2)

-- Co
local floor          = math.floor
local w,h            = guiGetScreenSize()

local function drawMapStuff2()
	if isPlayerMapVisible() then
		local sx,sy,ex,ey     = getPlayerMapBoundingBox()							-- Map positions
		local mw,mh           = ex-sx,sy-ey											-- Map width/height
		local cx,cy           = (sx+ex)/2,(sy+ey)/2									-- Center position of the map
		local ppuX,ppuY       = mw/6000,mh/6000										-- Pixels per unit
		local fontHeight      = dxGetFontHeight(textScale,textFont)					-- Height of the specified font
		local yOffset         = fontHeight/2										-- How much pixels the tag should be offsetted at
		local px, py = 2931.1567382813,2112.3666992188
		local x          = floor(cx+px*ppuX+xOffset)						-- X for the nametag
		local y          = floor(cy+py*ppuY-yOffset)						-- Y for the nametag
		local pname      = "Criminal Organzation"
		local nameLength = dxGetTextWidth(pname,textScale,textFont)			-- Width of the playername
		local r,g,b      = 100,0,0
		dxDrawBorderedText(pname,x,y,x+nameLength,y+fontHeight, tocolor(r,g,b,textAlpha), textScale, "default-bold", "center", "center", false, false)
	end
end
addEventHandler("onClientRender",getRootElement(),drawMapStuff2)

-- SM
local floor          = math.floor
local w,h            = guiGetScreenSize()

local function drawMapStuff2()
	if isPlayerMapVisible() then
		local sx,sy,ex,ey     = getPlayerMapBoundingBox()							-- Map positions
		local mw,mh           = ex-sx,sy-ey											-- Map width/height
		local cx,cy           = (sx+ex)/2,(sy+ey)/2									-- Center position of the map
		local ppuX,ppuY       = mw/6000,mh/6000										-- Pixels per unit
		local fontHeight      = dxGetFontHeight(textScale,textFont)					-- Height of the specified font
		local yOffset         = fontHeight/2										-- How much pixels the tag should be offsetted at
		local px, py = 2156.5451660156,613.38122558594
		local x          = floor(cx+px*ppuX+xOffset)						-- X for the nametag
		local y          = floor(cy+py*ppuY-yOffset)						-- Y for the nametag
		local pname      = "The Smurfs"
		local nameLength = dxGetTextWidth(pname,textScale,textFont)			-- Width of the playername
		local r,g,b      = 30,120,255
		dxDrawBorderedText(pname,x,y,x+nameLength,y+fontHeight, tocolor(r,g,b,textAlpha), textScale, "default-bold", "center", "center", false, false)
	end
end
addEventHandler("onClientRender",getRootElement(),drawMapStuff2)

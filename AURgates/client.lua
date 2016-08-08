local gate = false
local ID = false

addEventHandler("onClientResourceStart",resourceRoot,function()
	password_window = guiCreateWindow(100,100, 350, 160, "NGC ~ Password Required", false)

	guiWindowSetSizable(password_window, false)
	guiSetAlpha(password_window, 0.94)
	guiSetVisible(password_window, false)
	main_labelx_ = guiCreateLabel(50, 29, 258, 20, "Gate Password", false, password_window)
	guiSetFont(main_labelx_, "default-bold-small")
	guiLabelSetColor(main_labelx_, 254, 126, 0)
	guiLabelSetHorizontalAlign(main_labelx_, "center", false)
	enthqPass_edit = guiCreateEdit(50, 54, 258, 36, "", false, password_window)
	enthqPass_btn = guiCreateButton(50, 104, 122, 36, "Enter", false, password_window)
	closePasswordWnd_btn = guiCreateButton(178, 104, 130, 36, "Cancel", false, password_window)
	labelpass = guiCreateLabel(87, 149, 171, 21, "", false, password_window)
	guiLabelSetHorizontalAlign(labelpass, "center", false)

	local screenW,screenH=guiGetScreenSize()
	local windowW,windowH=guiGetSize(password_window,false)
	local x,y = (screenW-windowW)/2,(screenH-windowH)/2
	guiSetPosition(password_window,x,y,false)

end)

addEvent("requestHQPassword",true)
addEventHandler("requestHQPassword",root,function(id)
	guiSetVisible(password_window,true)
	showCursor(true)
	ID = id
end)

addEventHandler("onClientGUIClick",root,function()
	if source == closePasswordWnd_btn then
		guiSetVisible(password_window,false)
		showCursor(false)
		setElementData(localPlayer,"hqGateMarker",false)
	elseif source == enthqPass_btn then
		local text = guiGetText(enthqPass_edit)
		if text == "hqnews" then
			triggerServerEvent("openHQGate",localPlayer,ID)
			guiSetVisible(password_window,false)
			showCursor(false)
		end
	end
end)

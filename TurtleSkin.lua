if not pfUI then return end

pfUI:RegisterSkin("SpecialTalentUI", "vanilla", function()
  if (pfUI_config["disabled"] and pfUI_config["disabled"]["skin_SpecialTalentUI"] == "1") then
    return
  end

  local _, border = GetBorderSize()
  local hasSkinned = false
  
  local function ResizeButton(button, width, height)
    if button then
      button:SetWidth(width)
      button:SetHeight(height)
      if button.backdrop then
        button.backdrop:SetWidth(width)
        button.backdrop:SetHeight(height)
      end
    end
  end

  hooksecurefunc("SpecialTalentFrame_OnShow", function()
    SpecialTalentFrame:ClearAllPoints()
	SpecialTalentFrame:SetWidth(883)
	SpecialTalentFrame:SetHeight(545)
    SpecialTalentFrame:SetMovable(true)
	SpecialTalentFrameDragButton:Hide()
    SpecialTalentFrame:SetUserPlaced(false)
    SpecialTalentFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 50)
	
	local found = false
	for _, frameName in ipairs(UISpecialFrames) do
	  if frameName == "SpecialTalentFrame" then
		found = true
		break
	  end
	end
	if not found then
	  tinsert(UISpecialFrames, "SpecialTalentFrame")
	end

    if hasSkinned or not SpecialTalentFrame then return end
    hasSkinned = true

    StripTextures(SpecialTalentFrame)
    CreateBackdrop(SpecialTalentFrame, nil, nil, .75)
    CreateBackdropShadow(SpecialTalentFrame)
    SkinCloseButton(SpecialTalentFrameCloseButton, SpecialTalentFrame.backdrop, -6, -6)

    -- Tabs
    for i = 1, MAX_TALENT_TABS do
      local tab = _G["SpecialTalentFrameTab" .. i]
      if tab then SkinTab(tab) end
    end

    -- Talent Buttons
    for tab = 1, MAX_TALENT_TABS do
      for i = 1, MAX_NUM_TALENTS do
        local button = _G["SpecialTalentFrameTabFrame" .. tab .. "Talent" .. i]
        if button then
          StripTextures(SpecialTalentFrame, nil, "BACKGROUND")
		  StripTextures(SpecialTalentFrame, nil, "BORDER")
          CreateBackdrop(button)
          button:SetWidth(32)
          button:SetHeight(32)

          local planned = _G[button:GetName() .. "Planned"]
          if planned then
            planned:SetFont(pfUI.font_default, 11, "OUTLINE")
            planned:SetTextColor(0, 1, 1)
          end

          local rank = _G[button:GetName() .. "Rank"]
          if rank then
            rank:SetFont(pfUI.font_default, 11, "OUTLINE")
          end
        end
      end
    end

    -- Buttons and Checkboxes
	SpecialTalentRename:SetText("Rename")
	SkinButton(SpecialTalentRename)
	SkinButton(SpecialTalentUI_Rename)
	SkinButton(SpecialTalentUI_RenameCancel)
    SpecialTalentUI_RenamePanel:ClearAllPoints()
    SpecialTalentUI_RenamePanel:SetPoint("CENTER", SpecialTalentFrame, "CENTER", 0, 0)
	SpecialTalentUI_RenameInstructions:SetText("Rename Preset")
	StripTextures(SpecialTalentUI_RenameEditBox)
    CreateBackdrop(SpecialTalentUI_RenameEditBox, nil, nil, .85)
    CreateBackdrop(SpecialTalentUI_RenamePanel)
    SpecialTalentUI_RenameEditBox:ClearAllPoints()
    SpecialTalentUI_RenameEditBox:SetPoint("CENTER", SpecialTalentUI_RenamePanel, "CENTER", 0, 7)
	SpecialTalentUI_RenamePanel:SetHeight(80)
    SpecialTalentUI_Rename:SetWidth(90)
    SpecialTalentUI_Rename:SetHeight(18)
    SpecialTalentUI_Rename:ClearAllPoints()
    SpecialTalentUI_Rename:SetPoint("BOTTOM", SpecialTalentUI_RenamePanel, "BOTTOM", -60, 10)
    SpecialTalentUI_RenameCancel:SetWidth(90)
    SpecialTalentUI_RenameCancel:SetHeight(18)
    SpecialTalentUI_RenameCancel:ClearAllPoints()
    SpecialTalentUI_RenameCancel:SetPoint("BOTTOM", SpecialTalentUI_RenamePanel, "BOTTOM", 60, 10)
	
	SpecialTalentFrameNextButtonLarge:SetText("Next")
	SpecialTalentFramePreviousButtonLarge:SetText("Previous")
    SkinButton(SpecialTalentFrameMainButton)
    SkinButton(SpecialTalentFrameNextButtonLarge)
    SkinButton(SpecialTalentFramePreviousButtonLarge)
	
	SpecialTalentFrameResetButton:SetText("Reset")
	SpecialTalentUI_ResetInstructions:SetText("Reset Preset")
	SpecialTalentFrameResetButton:ClearAllPoints()
	SpecialTalentFrameResetButton:SetPoint("BOTTOM", SpecialTalentFrame, "BOTTOM", 0, 10)
	SpecialTalentUI_ResetConfirmationPanel:ClearAllPoints()
	SpecialTalentUI_ResetConfirmationPanel:SetPoint("BOTTOM", SpecialTalentFrame, "BOTTOM", 120, 20)
	SkinButton(SpecialTalentFrameResetButton)
	SkinButton(SpecialTalentUI_ResetOneButton)
	SkinButton(SpecialTalentUI_ResetTwoButton)
	SkinButton(SpecialTalentUI_ResetThreeButton)
	SkinButton(SpecialTalentUI_ResetAllButton)
	SkinButton(SpecialTalentUI_ResetCancel)
	SpecialTalentFrameResetButton:SetFrameLevel(100)
	SpecialTalentUI_ResetConfirmationPanel:SetFrameLevel(10)
    CreateBackdrop(SpecialTalentUI_ResetConfirmationPanel)

    SkinCheckbox(SpecialTalentFrameLearnedCheckButton)
    SkinCheckbox(SpecialTalentFramePlannedCheckButton)
    SkinCheckbox(SpecialTalentFrameForceShiftCheckButton)
	
	SpecialTalentFrameMinimizeButton:Hide()
	SpecialTalentFrameNextButtonSmall:Hide()
	SpecialTalentFramePreviousButtonSmall:Hide()
	
	ResizeButton(SpecialTalentRename, 70, 18)
	
	ResizeButton(SpecialTalentFrameNextButtonLarge, 70, 18)
	ResizeButton(SpecialTalentFramePreviousButtonLarge, 70, 18)
	
	ResizeButton(SpecialTalentFrameResetButton, 70, 18)
	ResizeButton(SpecialTalentUI_ResetOneButton, 100, 18)
	ResizeButton(SpecialTalentUI_ResetTwoButton, 100, 18)
	ResizeButton(SpecialTalentUI_ResetThreeButton, 100, 18)
	ResizeButton(SpecialTalentUI_ResetAllButton, 100, 18)
	ResizeButton(SpecialTalentUI_ResetCancel, 100, 18)
	
	-- Remove Player Icon
	SpecialTalentFramePortrait:Hide()
	
  end)
end)

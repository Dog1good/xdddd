local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dog1good/CoMp/refs/heads/main/source.lua"))()

local Window = Rayfield:CreateWindow({
   Name = "Arsenal Private",
   Icon = "atom",
   LoadingTitle = "Loading And Injecting Bypass",
   LoadingSubtitle = "by Dogi",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Posse",
      FileName = "Arsenal Configs"
   },

   Discord = {
      Enabled = true,
      Invite = "2sqVC7Ezsw",
      RememberJoins = false
   },

   KeySystem = true,
   KeySettings = {
      Title = "Arsenal Private",
      Subtitle = "Key System",
      Note = "Message Dogi on Discord for a Key!",
      FileName = "BombaPosseJedeKalba",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"nerobzle","jemizle","posse","Getzaprivate"}
   }
})

Rayfield:Notify({
   Title = "Inject",
   Content = "Successfully Injected Bypass",
   Duration = 9.5,
   Image = 10590477450,
})

local aimTab = Window:CreateTab("Legit Aim", nil)
local aimSection = aimTab:CreateSection("AimBot")

-- Store loop connection and FOV ring
local loop = nil
local fov = 150 -- Default FOV value
local smoothing = 1 -- Default smoothness
local fovColor = Color3.fromRGB(0, 0, 0) -- Default FOV color

local FOVring = Drawing.new("Circle") -- Create FOV ring once
FOVring.Visible = false
FOVring.Thickness = 1.5
FOVring.Radius = fov
FOVring.Transparency = 1
FOVring.Color = fovColor
FOVring.Position = workspace.CurrentCamera.ViewportSize / 2

-- Silent Aim Toggle
local SilentAimToggle = aimTab:CreateToggle({
   Name = "AimBot",
   CurrentValue = false,
   Flag = "SilentAimToggle",
   Callback = function(Value)
      local teamCheck = false
      local RunService = game:GetService("RunService")
      local UserInputService = game:GetService("UserInputService")

      local function getClosest(cframe)
         local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
         local target = nil
         local mag = math.huge

         for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") 
               and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer 
               and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
               
               local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
               
               if magBuf < mag then
                  mag = magBuf
                  target = v
               end
            end
         end
         return target
      end

      if Value then
         if loop then loop:Disconnect() end
         FOVring.Visible = true

         loop = RunService.RenderStepped:Connect(function()
            local pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
            local cam = workspace.CurrentCamera
            local zz = cam.ViewportSize / 2

            if pressed then
               local curTar = getClosest(cam.CFrame)
               if curTar and curTar.Character and curTar.Character:FindFirstChild("Head") then
                  local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
                  ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
                  
                  if (ssHeadPoint - zz).Magnitude < fov then
                     cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing * 0.1)
                  end
               end
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
               if loop then loop:Disconnect() loop = nil end
               FOVring.Visible = false
            end
         end)
      else
         if loop then loop:Disconnect() loop = nil end
         FOVring.Visible = false
      end
   end
})

SilentAimToggle:Set(false)

-- FOV Slider
local FOVSlider = aimTab:CreateSlider({
   Name = "Adjust FOV",
   Range = {30, 350},
   Increment = 10,
   Suffix = "FOV",
   CurrentValue = fov,
   Flag = "FOVSlider",
   Callback = function(Value)
      fov = Value
      FOVring.Radius = Value
   end,
})

FOVSlider:Set(fov)

-- Smoothness Slider
local SmoothnessSlider = aimTab:CreateSlider({
   Name = "Adjust Smoothness",
   Range = {1, 5},
   Increment = 1,
   Suffix = "Smooth",
   CurrentValue = smoothing,
   Flag = "SmoothnessSlider",
   Callback = function(Value)
      smoothing = Value
   end,
})

SmoothnessSlider:Set(smoothing)

-- FOV Color Picker
local FOVColorPicker = aimTab:CreateColorPicker({
   Name = "FOV Circle Color",
   Color = fovColor,
   Flag = "FOVColorPicker",
   Callback = function(Value)
      fovColor = Value
      FOVring.Color = fovColor
   end,
})

FOVColorPicker:Set(fovColor)

local rageTab = Window:CreateTab("Rage Aim", nil)
local rageSection = rageTab:CreateSection("Aimbot")

-- Store loop connection and FOV ring
local loop = nil
local fov = 150 -- Default FOV value
local smoothing = 8 -- Default smoothness
local fovColor = Color3.fromRGB(0, 0, 0) -- Default FOV color

local FOVring = Drawing.new("Circle") -- Create FOV ring once
FOVring.Visible = false
FOVring.Thickness = 1.5
FOVring.Radius = fov
FOVring.Transparency = 1
FOVring.Color = fovColor
FOVring.Position = workspace.CurrentCamera.ViewportSize / 2

-- Silent Aim Toggle
local SilentAimToggle = rageTab:CreateToggle({
   Name = "AimBot",
   CurrentValue = false,
   Flag = "SilentAimToggle",
   Callback = function(Value)
      local teamCheck = false
      local RunService = game:GetService("RunService")
      local UserInputService = game:GetService("UserInputService")

      local function getClosest(cframe)
         local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
         local target = nil
         local mag = math.huge

         for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") 
               and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer 
               and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
               
               local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
               
               if magBuf < mag then
                  mag = magBuf
                  target = v
               end
            end
         end
         return target
      end

      if Value then
         if loop then loop:Disconnect() end
         FOVring.Visible = true

         loop = RunService.RenderStepped:Connect(function()
            local pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
            local cam = workspace.CurrentCamera
            local zz = cam.ViewportSize / 2

            if pressed then
               local curTar = getClosest(cam.CFrame)
               if curTar and curTar.Character and curTar.Character:FindFirstChild("Head") then
                  local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
                  ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
                  
                  if (ssHeadPoint - zz).Magnitude < fov then
                     cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing * 0.1)
                  end
               end
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
               if loop then loop:Disconnect() loop = nil end
               FOVring.Visible = false
            end
         end)
      else
         if loop then loop:Disconnect() loop = nil end
         FOVring.Visible = false
      end
   end
})

SilentAimToggle:Set(false)

-- FOV Slider
local FOVSlider = rageTab:CreateSlider({
   Name = "Adjust FOV",
   Range = {150, 950},
   Increment = 10,
   Suffix = "FOV",
   CurrentValue = fov,
   Flag = "FOVSlider",
   Callback = function(Value)
      fov = Value
      FOVring.Radius = Value
   end,
})

FOVSlider:Set(fov)

-- Smoothness Slider
local SmoothnessSlider = rageTab:CreateSlider({
   Name = "Adjust Smoothness",
   Range = {8, 14},
   Increment = 1,
   Suffix = "Smooth",
   CurrentValue = smoothing,
   Flag = "SmoothnessSlider",
   Callback = function(Value)
      smoothing = Value
   end,
})

SmoothnessSlider:Set(smoothing)

-- FOV Color Picker
local FOVColorPicker = rageTab:CreateColorPicker({
   Name = "FOV Circle Color",
   Color = fovColor,
   Flag = "FOVColorPicker",
   Callback = function(Value)
      fovColor = Value
      FOVring.Color = fovColor
   end,
})

FOVColorPicker:Set(fovColor)

local espTab = Window:CreateTab("Visuals", nil)
local espSection = espTab:CreateSection("Player ESP")

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))()

local ToggleESP = espTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "ToggleESP",
   Callback = function(Value)
      ESP.Enabled = Value
      BoxToggle:Set(Value)
      NameToggle:Set(Value)
      HealthToggle:Set(Value)
      TracerToggle:Set(Value)
      DistanceToggle:Set(Value)
   end,
})

ToggleESP:Set(false)

-- Create individual toggles for ESP features
local BoxToggle = espTab:CreateToggle({
   Name = "Show Box",
   CurrentValue = false,
   Flag = "ToggleBox",
   Callback = function(Value)
      ESP.ShowBox = Value
   end,
})

local NameToggle = espTab:CreateToggle({
   Name = "Show Name",
   CurrentValue = false,
   Flag = "ToggleName",
   Callback = function(Value)
      ESP.ShowName = Value
   end,
})

local HealthToggle = espTab:CreateToggle({
   Name = "Show Health",
   CurrentValue = false,
   Flag = "ToggleHealth",
   Callback = function(Value)
      ESP.ShowHealth = Value
   end,
})

local TracerToggle = espTab:CreateToggle({
   Name = "Show Tracer",
   CurrentValue = false,
   Flag = "ToggleTracer",
   Callback = function(Value)
      ESP.ShowTracer = Value
   end,
})

local DistanceToggle = espTab:CreateToggle({
   Name = "Show Distance",
   CurrentValue = false,
   Flag = "ToggleDistance",
   Callback = function(Value)
      ESP.ShowDistance = Value
   end,
})

BoxToggle:Set(false)
NameToggle:Set(false)
HealthToggle:Set(false)
TracerToggle:Set(false)
DistanceToggle:Set(false)

local Divider = espTab:CreateDivider()

local mevTab = Window:CreateTab("Movement", nil)
local mevSection = mevTab:CreateSection("Movement")

local speedEnabled = false
local walkSpeed = 16

local ToggleSpeed = mevTab:CreateToggle({
   Name = "Speed",
   CurrentValue = false,
   Flag = "ToggleSpeed",
   Callback = function(Value)
      speedEnabled = Value
      if speedEnabled then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
      else
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      end
   end,
})

ToggleSpeed:Set(false)

local SpeedSlider = mevTab:CreateSlider({
   Name = "Adjust Speed",
   Range = {16, 100},
   Increment = 5,
   Suffix = "Speed",
   CurrentValue = walkSpeed,
   Flag = "SpeedSlider",
   Callback = function(Value)
      walkSpeed = Value
      if speedEnabled then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
      end
   end,
})

SpeedSlider:Set(walkSpeed)

local mscTab = Window:CreateTab("Misc", nil)
local mscSection = mscTab:CreateSection("Misc")

-- Create the Config tab
local cfgTab = Window:CreateTab("Configs", nil)
local cfgSection = cfgTab:CreateSection("Manage Configs")

-- Save Config Button
local SaveCFGButton = cfgTab:CreateButton({
   Name = "Save Config",
   Callback = function()
      pcall(function()
         Rayfield:SaveConfiguration() -- Use pcall to prevent errors
      end)
   end
})

-- Load Config Button
local LoadCFGButton = cfgTab:CreateButton({
   Name = "Load Config",
   Callback = function()
      pcall(function()
         Rayfield:LoadConfiguration() -- Use pcall to prevent errors
      end)
   end
})

-- Dropdown for selecting configs
local cfgList = {"Default", "Legit", "Rage", "ESP", "Custom1", "Custom2"} -- Replace with real config names
local ConfigDropdown = cfgTab:CreateDropdown({
   Name = "Select Config",
   Options = cfgList,
   CurrentOption = "Default",
   Flag = "ConfigDropdown",
   Callback = function(selectedConfig)
      pcall(function()
         Rayfield:LoadConfiguration() -- Rayfield may not support named configs, so remove the argument
      end)
   end
})

-- Text input for custom config name
local ConfigNameInput = cfgTab:CreateInput({
   Name = "Enter Config Name",
   PlaceholderText = "MyConfig1",
   RemoveTextAfterFocusLost = false,
   Callback = function(Value)
      customConfigName = Value
   end
})

-- Save Custom Config Button
local SaveCustomCFG = cfgTab:CreateButton({
   Name = "Save Custom Config",
   Callback = function()
      if customConfigName and customConfigName ~= "" then
         pcall(function()
            Rayfield:SaveConfiguration() -- Rayfield may not support custom file names
         end)
      else
         Rayfield:Notify({
            Title = "Error",
            Content = "Enter a valid config name!",
            Duration = 3
         })
      end
   end
})

local Divider = mevTab:CreateDivider()
local Divider = aimTab:CreateDivider()
local Divider = rageTab:CreateDivider()

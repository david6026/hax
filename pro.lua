local plrs = game:GetService("Players")
local me = plrs.LocalPlayer
local mouse = me:GetMouse()
local tween = game:GetService("TweenService")
local light = game:GetService("Lighting")
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local camera = game.Workspace.CurrentCamera

_G.Keybind = Enum.KeyCode.Insert
local ignore_binds = {Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.D, Enum.KeyCode.S, Enum.KeyCode.F9, Enum.KeyCode.F12, Enum.KeyCode.Tab, Enum.KeyCode.Space, Enum.KeyCode.Backspace, Enum.KeyCode.LeftControl, Enum.KeyCode.LeftShift, Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3}

local FOLDER = {
      Function_Guns = false,
      Function_Melees = false,
      Guns = {"G-17"},
      Melees = {},
      Skins = {
            GUNS = {
                  {id = "rbxassetid://15707661222", gun = "G-17"},
            },
            MELEES = {
                  
            },
      },
      Selection = {
            GUNS = {
                  ["G-17"] = false,   
            },
            MELEES = {
                  
            }
      }
}

local cmds = {"leave", "reset", "clear", "close", "reload"}

local functions = {
      FullbrightF = false;
      AutoOpenDoorsF = false;
      NoBarriersF = false;
      anti_voidF = nil;
      flyF = nil;
      anti_flingF = false;
      infstaminaF = false;
      nofalldamageF = false;
      highlightF = false;
      aimbotF = false;
      fast_pickupF = false;
      lockpickF = false;
      atmF = false;
      glass_armsF = false;
      inf_pepperF = false;
      instant_reloadF = false;
      hitbox_expanderF = false;
}

local remotes = {
      open_doorsRun;
      fovslider_dragging = false;
      fov_connection;
      gravityslider_dragging = false;
      circle = nil;
      circle_pos = nil;
      adonis_pressed = false;
      OCmenukeybind = false;
}

local ChatFrame = me.PlayerGui:WaitForChild("Chat").Frame
ChatFrame.ChatChannelParentFrame.Visible = true
ChatFrame.ChatBarParentFrame.Position = UDim2.new(0, 0, 1, -42)

local Gui = Instance.new("ScreenGui")
Gui.Parent = game.CoreGui
Gui.Name = "New"
Gui.Enabled = true
Gui.ResetOnSpawn = false

local dragg = Instance.new("Frame")
dragg.Parent = Gui
dragg.Name = "dragg"
dragg.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
dragg.Position = UDim2.new(0.24, 0, 0.132, 0)
dragg.Size = UDim2.new(0, 405, 0, 19)
dragg.Visible = true

uicdragg = Instance.new("UICorner")
uicdragg.Parent = dragg
uicdragg.CornerRadius = UDim.new(0, 8)

uisdragg = Instance.new("UIStroke")
uisdragg.Parent = dragg
uisdragg.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisdragg.Color = Color3.new(1, 1, 1)
uisdragg.LineJoinMode = Enum.LineJoinMode.Round
uisdragg.Thickness = 1

local mainframe = Instance.new("Frame")
mainframe.Parent = dragg
mainframe.Name = "Main"
mainframe.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
mainframe.Position = UDim2.new(-0.602, 0, 1.055, 0)
mainframe.Size = UDim2.new(0, 986, 0, 610)
mainframe.Visible = true

uicmf = Instance.new("UICorner")
uicmf.Parent = mainframe
uicmf.CornerRadius = UDim.new(0, 8)

uiscmf = Instance.new("UIScale")
uiscmf.Parent = mainframe
uiscmf.Scale = 0.8

uistmf = Instance.new("UIStroke")
uistmf.Parent = mainframe
uistmf.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
uistmf.Color = Color3.new(1, 1, 1)
uistmf.LineJoinMode = Enum.LineJoinMode.Round
uistmf.Thickness = 2
uistmf.Transparency = 0
uistmf.Enabled = true

uigmf = Instance.new("UIGradient")
uigmf.Parent = mainframe
uigmf.Rotation = 40
uigmf.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, Color3.new(0.117647, 0.117647, 0.117647)),
      ColorSequenceKeypoint.new(0.824, Color3.new(0.886275, 0.886275, 0.886275)),
      ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
})

local console = Instance.new("Frame")
console.Parent = mainframe
console.Name = "Console"
console.BackgroundColor3 = Color3.new(0.152941, 0.152941, 0.152941)
console.Position = UDim2.new(1.009, 0, 0.031, 0)
console.Size = UDim2.new(0, 550, 0, 580)
console.Visible = true

local uigconsole = Instance.new("UIGradient")
uigconsole.Parent = console
uigconsole.Rotation = 50
uigconsole.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, Color3.new(0.117647, 0.117647, 0.117647)),
      ColorSequenceKeypoint.new(0.5, Color3.new(0.27451, 0.27451, 0.27451)),
      ColorSequenceKeypoint.new(1, Color3.new(0.117647, 0.117647, 0.117647))
})

local consoletext = Instance.new("TextLabel")
consoletext.Parent = console
consoletext.Name = "ConsoleText"
consoletext.BackgroundTransparency = 1
consoletext.Position = UDim2.new(0, 0, 0, 0)
consoletext.Size = UDim2.new(0, 550, 0, 580)
consoletext.TextColor3 = Color3.new(1, 0, 0)
consoletext.TextSize = 18
consoletext.Text = ""
consoletext.TextWrapped = true
consoletext.ClipsDescendants = true
consoletext.RichText = true
consoletext.TextXAlignment = Enum.TextXAlignment.Left
consoletext.TextYAlignment = Enum.TextYAlignment.Top
consoletext.Visible = true

local commands = Instance.new("TextBox")
commands.Parent = console
commands.Name = "command"
commands.BackgroundColor3 = Color3.new(0.168627, 0.168627, 0.168627)
commands.Position = UDim2.new(-0, 0, 1, 0)
commands.Size = UDim2.new(0, 550, 0, 34)
commands.ClearTextOnFocus = false
commands.ClipsDescendants = true
commands.PlaceholderText = "Console Bar"
commands.PlaceholderColor3 = Color3.new(0.709804, 0.709804, 0.709804)
commands.TextSize = 17
commands.TextColor3 = Color3.new(1, 1, 1)
commands.Text = ""
commands.TextXAlignment = Enum.TextXAlignment.Left
commands.Visible = true

local uiscommands = Instance.new("UIStroke")
uiscommands.Parent = commands
uiscommands.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiscommands.Color = Color3.new(0.101961, 0.101961, 0.101961)
uiscommands.LineJoinMode = Enum.LineJoinMode.Round
uiscommands.Thickness = 2

local list = Instance.new("Frame")
list.Parent = mainframe
list.Name = "List"
list.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
list.Position = UDim2.new(0, 0, 0, 0)
list.Size = UDim2.new(0, 197, 0, 609)
list.Visible = true

uicl = Instance.new("UICorner")
uicl.Parent = list
uicl.CornerRadius = UDim.new(0, 8)

uistl = Instance.new("UIStroke")
uistl.Parent = list
uistl.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
uistl.Color = Color3.new(1, 1, 1)
uistl.LineJoinMode = Enum.LineJoinMode.Round
uistl.Thickness = 2
uistl.Transparency = 0
uistl.Enabled = true

uigl = Instance.new("UIGradient")
uigl.Parent = list
uigl.Rotation = 0
uigl.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
      ColorSequenceKeypoint.new(0.6, Color3.new(0.207843, 0.207843, 0.207843)),
      ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
})

local beta = Instance.new("TextLabel")
beta.Parent = mainframe
beta.Name = "beta"
beta.BackgroundColor3 = Color3.new(1, 1, 1)
beta.BackgroundTransparency = 1
beta.Position = UDim2.new(0.952, 0, -0.061, 0)
beta.Rotation = -9
beta.Size = UDim2.new(0, 119, 0, 50)
beta.TextColor3 = Color3.new(0, 0, 0)
beta.Text = "Beta"
beta.TextScaled = true
beta.Visible = true

uigb = Instance.new("UIGradient")
uigb.Parent = beta
uigb.Enabled = true

uistb = Instance.new("UIStroke")
uistb.Parent = beta
uistb.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
uistb.Color = Color3.new(1, 1, 1)
uistb.LineJoinMode = Enum.LineJoinMode.Round
uistb.Thickness = 1
uistb.Transparency = 0
uistb.Enabled = true

uiguist = Instance.new("UIGradient")
uiguist.Parent = uistb
uiguist.Enabled = true

local Menus = Instance.new("Folder")
Menus.Parent = mainframe
Menus.Name = "Menus"

local WorldList = Instance.new("TextButton")
WorldList.Parent = list
WorldList.Name = "World"
WorldList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
WorldList.Position = UDim2.new(0.054, 0, 0.021, 0)
WorldList.Size = UDim2.new(0, 176, 0, 38)
WorldList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
WorldList.Text = "World"
WorldList.TextScaled = true
WorldList.Visible = true

uicworldl = Instance.new("UICorner")
uicworldl.Parent = WorldList
uicworldl.CornerRadius = UDim.new(0, 25)

local PlayerList = Instance.new("TextButton")
PlayerList.Parent = list
PlayerList.Name = "Player"
PlayerList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
PlayerList.Position = UDim2.new(0.054, 0, 0.103, 0)
PlayerList.Size = UDim2.new(0, 176, 0, 38)
PlayerList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
PlayerList.Text = "Player"
PlayerList.TextScaled = true
PlayerList.Visible = true

uicplayerl = Instance.new("UICorner")
uicplayerl.Parent = PlayerList
uicplayerl.CornerRadius = UDim.new(0, 25)

local MainList = Instance.new("TextButton")
MainList.Parent = list
MainList.Name = "Main"
MainList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
MainList.Position = UDim2.new(0.054, 0, 0.19, 0)
MainList.Size = UDim2.new(0, 176, 0, 38)
MainList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
MainList.TextScaled = true
MainList.Text = "Main"
MainList.Visible = true

uicmainl = Instance.new("UICorner")
uicmainl.Parent = MainList
uicmainl.CornerRadius = UDim.new(0, 25)

local VisualList = Instance.new("TextButton")
VisualList.Parent = list
VisualList.Name = "Visual"
VisualList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
VisualList.Position = UDim2.new(0.054, 0, 0.271, 0)
VisualList.Size = UDim2.new(0, 176, 0, 38)
VisualList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
VisualList.TextScaled = true
VisualList.Text = "Visual"
VisualList.Visible = true

uicvisuall = Instance.new("UICorner")
uicvisuall.Parent = VisualList
uicvisuall.CornerRadius = UDim.new(0, 25)

local SkinsList = Instance.new("TextButton")
SkinsList.Parent = list
SkinsList.Name = "Skins"
SkinsList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
SkinsList.Position = UDim2.new(0.054, 0, 0.352, 0)
SkinsList.Size = UDim2.new(0, 176, 0, 38)
SkinsList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
SkinsList.TextScaled = true
SkinsList.Text = "Skins"
SkinsList.Visible = true

uicskinsl = Instance.new("UICorner")
uicskinsl.Parent = SkinsList
uicskinsl.CornerRadius = UDim.new(0, 25)

local TrollList = Instance.new("TextButton")
TrollList.Parent = list
TrollList.Name = "Troll"
TrollList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
TrollList.Position = UDim2.new(0.054, 0, 0.442, 0)
TrollList.Size = UDim2.new(0, 176, 0, 38)
TrollList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TrollList.TextScaled = true
TrollList.Text = "Troll"
TrollList.Visible = true

uictrolll = Instance.new("UICorner")
uictrolll.Parent = TrollList
uictrolll.CornerRadius = UDim.new(0, 25)

local FarmList = Instance.new("TextButton")
FarmList.Parent = list
FarmList.Name = "Farm"
FarmList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
FarmList.Position = UDim2.new(0.054, 0, 0.526, 0)
FarmList.Size = UDim2.new(0, 176, 0, 38)
FarmList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
FarmList.TextScaled = true
FarmList.Text = "Farm"
FarmList.Visible = true

uicfarm = Instance.new("UICorner")
uicfarm.Parent = FarmList
uicfarm.CornerRadius = UDim.new(0, 25)

local SettingsList = Instance.new("TextButton")
SettingsList.Parent = list
SettingsList.Name = "Settings"
SettingsList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
SettingsList.Position = UDim2.new(0.054, 0, 0.697, 0)
SettingsList.Size = UDim2.new(0, 176, 0, 38)
SettingsList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
SettingsList.TextScaled = true
SettingsList.Text = "Settings"
SettingsList.Visible = true

uicsettingsl = Instance.new("UICorner")
uicsettingsl.Parent = SettingsList
uicsettingsl.CornerRadius = UDim.new(0, 25)

local OthersList = Instance.new("TextButton")
OthersList.Parent = list
OthersList.Name = "Others"
OthersList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
OthersList.Position = UDim2.new(0.048, 0, 0.612, 0)
OthersList.Size = UDim2.new(0, 176, 0, 38)
OthersList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
OthersList.TextScaled = true
OthersList.Text = "Others (soon)"
OthersList.Visible = true

uicothersl = Instance.new("UICorner")
uicothersl.Parent = OthersList
uicothersl.CornerRadius = UDim.new(0, 25)

local ConfigList = Instance.new("TextButton")
ConfigList.Parent = list
ConfigList.Name = "Config"
ConfigList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
ConfigList.Position = UDim2.new(0.054, 0, 0.78, 0)
ConfigList.Size = UDim2.new(0, 176, 0, 38)
ConfigList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
ConfigList.TextScaled = true
ConfigList.Text = "Config (soon)"
ConfigList.Visible = true

uicconfigl = Instance.new("UICorner")
uicconfigl.Parent = ConfigList
uicconfigl.CornerRadius = UDim.new(0, 25)

local WorldMenu = Instance.new("Frame")
WorldMenu.Parent = Menus
WorldMenu.Name = "World"
WorldMenu.BackgroundTransparency = 1
WorldMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
WorldMenu.Size = UDim2.new(0, 774, 0, 598)
WorldMenu.Visible = true

local PlayerMenu = Instance.new("Frame")
PlayerMenu.Parent = Menus
PlayerMenu.Name = "Player"
PlayerMenu.BackgroundTransparency = 1
PlayerMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
PlayerMenu.Size = UDim2.new(0, 774, 0, 598)
PlayerMenu.Visible = false

local VisualMenu = Instance.new("Frame")
VisualMenu.Parent = Menus
VisualMenu.Name = "Visual"
VisualMenu.BackgroundTransparency = 1
VisualMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
VisualMenu.Size = UDim2.new(0, 774, 0, 598)
VisualMenu.Visible = false

local MainMenu = Instance.new("Frame")
MainMenu.Parent = Menus
MainMenu.Name = "Main"
MainMenu.BackgroundTransparency = 1
MainMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
MainMenu.Size = UDim2.new(0, 774, 0, 598)
MainMenu.Visible = false

local FarmMenu = Instance.new("Frame")
FarmMenu.Parent = Menus
FarmMenu.Name = "Farm"
FarmMenu.BackgroundTransparency = 1
FarmMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
FarmMenu.Size = UDim2.new(0, 774, 0, 598)
FarmMenu.Visible = false

local SettingsMenu = Instance.new("Frame")
SettingsMenu.Parent = Menus
SettingsMenu.Name = "Settings"
SettingsMenu.BackgroundTransparency = 1
SettingsMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
SettingsMenu.Size = UDim2.new(0, 774, 0, 598)
SettingsMenu.Visible = false

local TrollMenu = Instance.new("Frame")
TrollMenu.Parent = Menus
TrollMenu.Name = "Troll"
TrollMenu.BackgroundTransparency = 1
TrollMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
TrollMenu.Size = UDim2.new(0, 774, 0, 598)
TrollMenu.Visible = false

local SkinsMenu = Instance.new("Frame")
SkinsMenu.Parent = Menus
SkinsMenu.Name = "Skins"
SkinsMenu.BackgroundTransparency = 1
SkinsMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
SkinsMenu.Size = UDim2.new(0, 774, 0, 598)
SkinsMenu.Visible = false

local Fullbright = Instance.new("TextLabel")
Fullbright.Parent = WorldMenu
Fullbright.Name = "Fullbright"
Fullbright.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Fullbright.Position = UDim2.new(0.016, 0, 0.022, 0)
Fullbright.Size = UDim2.new(0, 194, 0, 32)
Fullbright.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Fullbright.TextScaled = true
Fullbright.Text = "Fullbright"
Fullbright.Visible = true

uicfullbright = Instance.new("UICorner")
uicfullbright.Parent = Fullbright
uicfullbright.CornerRadius = UDim.new(0, 8)

local FullbrightHow = Instance.new("ImageLabel")
FullbrightHow.Parent = Fullbright
FullbrightHow.Name = "how"
FullbrightHow.BackgroundColor3 = Color3.new(1, 1, 1)
FullbrightHow.Position = UDim2.new(1.077, 0, 0, 0)
FullbrightHow.Size = UDim2.new(0, 32, 0, 32)
FullbrightHow.Image = "rbxassetid://75772970732380"
FullbrightHow.ImageColor3 = Color3.new(1, 1, 1)
FullbrightHow.Visible = true

uicfullbrighthow = Instance.new("UICorner")
uicfullbrighthow.Parent = FullbrightHow
uicfullbrighthow.CornerRadius = UDim.new(8, 8)

local FullbrightControl = Instance.new("Frame")
FullbrightControl.Parent = Fullbright
FullbrightControl.Name = "Control"
FullbrightControl.BackgroundColor3 = Color3.new(0, 0, 0)
FullbrightControl.Position = UDim2.new(1.309, 0, 0, 0)
FullbrightControl.Size = UDim2.new(0, 81, 0, 35)
FullbrightControl.Visible = true

uicfullbrightcontrol = Instance.new("UICorner")
uicfullbrightcontrol.Parent = FullbrightControl
uicfullbrightcontrol.CornerRadius = UDim.new(8, 8)

uisfullbrightcontrol = Instance.new("UIStroke")
uisfullbrightcontrol.Parent = FullbrightControl
uisfullbrightcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisfullbrightcontrol.Color = Color3.new(1, 1, 1)
uisfullbrightcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisfullbrightcontrol.Thickness = 1

local FullbrightTurn = Instance.new("TextButton")
FullbrightTurn.Parent = FullbrightControl
FullbrightTurn.Name = "turn"
FullbrightTurn.BackgroundColor3 = Color3.new(1, 0, 0)
FullbrightTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
FullbrightTurn.Size = UDim2.new(0, 30, 0, 30)
FullbrightTurn.Text = ""
FullbrightTurn.Visible = true

uicfullbrightturn = Instance.new("UICorner")
uicfullbrightturn.Parent = FullbrightTurn
uicfullbrightturn.CornerRadius = UDim.new(8, 8)

uisfullbrightturn = Instance.new("UIStroke")
uisfullbrightturn.Parent = FullbrightTurn
uisfullbrightturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisfullbrightturn.Color = Color3.new(1, 1, 1)
uisfullbrightturn.LineJoinMode = Enum.LineJoinMode.Round
uisfullbrightturn.Thickness = 1

local open_doors = Instance.new("TextLabel")
open_doors.Parent = WorldMenu
open_doors.Name = "open_doors"
open_doors.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
open_doors.Position = UDim2.new(0.016, 0, 0.109, 0)
open_doors.Size = UDim2.new(0, 194, 0, 32)
open_doors.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
open_doors.TextScaled = true
open_doors.Text = "Auto open doors"
open_doors.Visible = true

uicopen_doors = Instance.new("UICorner")
uicopen_doors.Parent = open_doors
uicopen_doors.CornerRadius = UDim.new(0, 8)

local open_doorsHow = Instance.new("ImageLabel")
open_doorsHow.Parent = open_doors
open_doorsHow.Name = "how"
open_doorsHow.Position = UDim2.new(1.077, 0, 0, 0)
open_doorsHow.Size = UDim2.new(0, 32, 0, 32)
open_doorsHow.Image = "rbxassetid://75772970732380"
open_doorsHow.Visible = true

uicopen_doorshow = Instance.new("UICorner")
uicopen_doorshow.Parent = open_doorsHow
uicopen_doorshow.CornerRadius = UDim.new(8, 8)

local open_doorsControl = Instance.new("Frame")
open_doorsControl.Parent = open_doors
open_doorsControl.Name = "Control"
open_doorsControl.BackgroundColor3 = Color3.new(0, 0, 0)
open_doorsControl.Position = UDim2.new(1.309, 0, 0, 0)
open_doorsControl.Size = UDim2.new(0, 81, 0, 35)
open_doorsControl.Visible = true

uicopen_doorscontrol = Instance.new("UICorner")
uicopen_doorscontrol.Parent = open_doorsControl
uicopen_doorscontrol.CornerRadius = UDim.new(8, 8)

uisopen_doorscontrol = Instance.new("UIStroke")
uisopen_doorscontrol.Parent = open_doorsControl
uisopen_doorscontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisopen_doorscontrol.Color = Color3.new(1, 1, 1)
uisopen_doorscontrol.LineJoinMode = Enum.LineJoinMode.Round
uisopen_doorscontrol.Thickness = 1

local TurnOpen_doors = Instance.new("TextButton")
TurnOpen_doors.Parent = open_doorsControl
TurnOpen_doors.Name = "turn"
TurnOpen_doors.BackgroundColor3 = Color3.new(1, 0, 0)
TurnOpen_doors.Position = UDim2.new(0.046, 0, 0.071, 0)
TurnOpen_doors.Size = UDim2.new(0, 30, 0, 30)
TurnOpen_doors.Text = ""
TurnOpen_doors.Visible = true

uicturnopen_doors = Instance.new("UICorner")
uicturnopen_doors.Parent = TurnOpen_doors
uicturnopen_doors.CornerRadius = UDim.new(8, 8)

uisturnopen_doors = Instance.new("UIStroke")
uisturnopen_doors.Parent = TurnOpen_doors
uisturnopen_doors.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisturnopen_doors.Color = Color3.new(1, 1, 1)
uisturnopen_doors.LineJoinMode = Enum.LineJoinMode.Round
uisturnopen_doors.Thickness = 1

local nobarriers = Instance.new("TextLabel")
nobarriers.Parent = WorldMenu
nobarriers.Name = "NoBarriers"
nobarriers.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
nobarriers.Position = UDim2.new(0.016, 0, 0.192, 0)
nobarriers.Size = UDim2.new(0, 194, 0, 32)
nobarriers.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
nobarriers.TextScaled = true
nobarriers.Text = "No barriers"
nobarriers.Visible = true

uicnobarriers = Instance.new("UICorner")
uicnobarriers.Parent = nobarriers
uicnobarriers.CornerRadius = UDim.new(0, 8)

local nobarriersHow = Instance.new("ImageLabel")
nobarriersHow.Parent = nobarriers
nobarriersHow.Name = "how"
nobarriersHow.BackgroundColor3 = Color3.new(1, 1, 1)
nobarriersHow.Position = UDim2.new(1.077, 0, 0, 0)
nobarriersHow.Size = UDim2.new(0, 32, 0, 32)
nobarriersHow.Image = "rbxassetid://75772970732380"
nobarriersHow.Visible = true

uicnobarriershow = Instance.new("UICorner")
uicnobarriershow.Parent = nobarriersHow
uicnobarriershow.CornerRadius = UDim.new(8, 8)

local nobarriersControl = Instance.new("Frame")
nobarriersControl.Parent = nobarriers
nobarriersControl.Name = "Control"
nobarriersControl.BackgroundColor3 = Color3.new(0, 0, 0)
nobarriersControl.Position = UDim2.new(1.309, 0, 0, 0)
nobarriersControl.Size = UDim2.new(0, 81, 0, 35)
nobarriersControl.Visible = true

uicnobarrierscontrol = Instance.new("UICorner")
uicnobarrierscontrol.Parent = nobarriersControl
uicnobarrierscontrol.CornerRadius = UDim.new(8, 8)

uisnobarrierscontrol = Instance.new("UIStroke")
uisnobarrierscontrol.Parent = nobarriersControl
uisnobarrierscontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisnobarrierscontrol.Color = Color3.new(1, 1, 1)
uisnobarrierscontrol.LineJoinMode = Enum.LineJoinMode.Round
uisnobarrierscontrol.Thickness = 1

local nobarriersTurn = Instance.new("TextButton")
nobarriersTurn.Parent = nobarriersControl
nobarriersTurn.Name = "turn"
nobarriersTurn.BackgroundColor3 = Color3.new(1, 0, 0)
nobarriersTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
nobarriersTurn.Size = UDim2.new(0, 30, 0, 30)
nobarriersTurn.Text = ""
nobarriersTurn.Visible = true

uicnobarriersturn = Instance.new("UICorner")
uicnobarriersturn.Parent = nobarriersTurn
uicnobarriersturn.CornerRadius = UDim.new(8, 8)

uisnobarriersturn = Instance.new("UIStroke")
uisnobarriersturn.Parent = nobarriersTurn
uisnobarriersturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisnobarriersturn.Color = Color3.new(1, 1, 1)
uisnobarriersturn.LineJoinMode = Enum.LineJoinMode.Round
uisnobarriersturn.Thickness = 1

local FOV = Instance.new("TextLabel")
FOV.Parent = PlayerMenu
FOV.Name = "fov"
FOV.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
FOV.Position = UDim2.new(0.016, 0, 0.022, 0)
FOV.Size = UDim2.new(0, 194, 0, 32)
FOV.TextScaled = true
FOV.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
FOV.Text = "FOV"
FOV.Visible = true

uicFov = Instance.new("UICorner")
uicFov.Parent = FOV
uicFov.CornerRadius = UDim.new(0, 8)

local fovHow = Instance.new("ImageLabel")
fovHow.Parent = FOV
fovHow.Name = "how"
fovHow.Position = UDim2.new(1.077, 0, 0, 0)
fovHow.Size = UDim2.new(0, 32, 0, 32)
fovHow.Image = "rbxassetid://75772970732380"
fovHow.Visible = true

uicfovhow = Instance.new("UICorner")
uicfovhow.Parent = fovHow
uicfovhow.CornerRadius = UDim.new(8, 8)

local fovControl = Instance.new("TextLabel")
fovControl.Parent = FOV
fovControl.Name = "control"
fovControl.BackgroundColor3 = Color3.new(1, 1, 1)
fovControl.Position = UDim2.new(1.46, 0, 0.099, 0)
fovControl.Size = UDim2.new(0, 272, 0, 25)
fovControl.Text = ""
fovControl.Visible = true

uicfovcontrol = Instance.new("UICorner")
uicfovcontrol.Parent = fovControl
uicfovcontrol.CornerRadius = UDim.new(8, 8)

uisfovcontrol = Instance.new("UIStroke")
uisfovcontrol.Parent = fovControl
uisfovcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisfovcontrol.Color = Color3.new(0, 0, 0)
uisfovcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisfovcontrol.Thickness = 2.4
uisfovcontrol.Enabled = true

local fovSlider = Instance.new("TextButton")
fovSlider.Parent = fovControl
fovSlider.Name = "slide"
fovSlider.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
fovSlider.Position = UDim2.new(-0, 0, 0, 0)
fovSlider.Size = UDim2.new(0, 199, 0, 25)
fovSlider.TextSize = 15
fovSlider.TextColor3 = Color3.new(1, 1, 1)
fovSlider.Text = ""
fovSlider.Visible = true

uicfovslider = Instance.new("UICorner")
uicfovslider.Parent = fovSlider
uicfovslider.CornerRadius = UDim.new(8, 8)

local speed = Instance.new("TextLabel")
speed.Parent = PlayerMenu
speed.Name = "speed"
speed.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
speed.Position = UDim2.new(0.016, 0, 0.104, 0)
speed.Size = UDim2.new(0, 194, 0, 32)
speed.TextScaled = true
speed.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
speed.Text = "speed"
speed.Visible = true

uicspeed = Instance.new("UICorner")
uicspeed.Parent = speed
uicspeed.CornerRadius = UDim.new(0, 8)

local speedHow = Instance.new("ImageLabel")
speedHow.Parent = speed
speedHow.Position = UDim2.new(1.077, 0, 0, 0)
speedHow.Size = UDim2.new(0, 32, 0, 32)
speedHow.Image = "rbxassetid://75772970732380"
speedHow.Visible = true

uicspeedhow = Instance.new("UICorner")
uicspeedhow.Parent = speedHow
uicspeedhow.CornerRadius = UDim.new(8, 8)

local speedControl = Instance.new("TextLabel")
speedControl.Parent = speed
speedControl.Name = "control"
speedControl.BackgroundColor3 = Color3.new(1, 1, 1)
speedControl.Position = UDim2.new(1.46, 0, 0.099, 0)
speedControl.Size = UDim2.new(0, 272, 0, 25)
speedControl.Text = ""
speedControl.Visible = true

uicspeedcontrol = Instance.new("UICorner")
uicspeedcontrol.Parent = speedControl
uicspeedcontrol.CornerRadius = UDim.new(8, 8)

uisspeedcontrol = Instance.new("UIStroke")
uisspeedcontrol.Parent = speedControl
uisspeedcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisspeedcontrol.Color = Color3.new(0, 0, 0)
uisspeedcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisspeedcontrol.Thickness = 2.4

local speedSlide = Instance.new("TextButton")
speedSlide.Parent = speedControl
speedSlide.Name = "slide"
speedSlide.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
speedSlide.Position = UDim2.new(-0, 0, 0, 0)
speedSlide.Size = UDim2.new(0, 199, 0, 25)
speedSlide.Text = ""
speedSlide.Visible = true

uicspeedslide = Instance.new("UICorner")
uicspeedslide.Parent = speedSlide
uicspeedslide.CornerRadius = UDim.new(8, 8)

local speedSoon = Instance.new("TextLabel")
speedSoon.Parent = speed
speedSoon.Name = "soon"
speedSoon.BackgroundTransparency = 1
speedSoon.Position = UDim2.new(2.861, 0, 0.078, 0)
speedSoon.Size = UDim2.new(0, 89, 0, 32)
speedSoon.TextScaled = true
speedSoon.TextColor3 = Color3.new(1, 1, 1)
speedSoon.Text = "- soon"
speedSoon.Visible = true

local gravity = Instance.new("TextLabel")
gravity.Parent = PlayerMenu
gravity.Name = "gravity"
gravity.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
gravity.Position = UDim2.new(0.016, 0, 0.192, 0)
gravity.Size = UDim2.new(0, 194, 0, 32)
gravity.TextScaled = true
gravity.TextColor3 = Color3.new(0.784314, 0.784314, 0.78431)
gravity.Text = "gravity"
gravity.Visible = true

uicgravity = Instance.new("UICorner")
uicgravity.Parent = gravity
uicgravity.CornerRadius = UDim.new(0, 8)

local gravityHow = Instance.new("ImageLabel")
gravityHow.Parent = gravity
gravityHow.Name = "how"
gravityHow.Position = UDim2.new(1.077, 0, 0, 0)
gravityHow.Size = UDim2.new(0, 32, 0, 32)
gravityHow.Image = "rbxassetid://75772970732380"
gravityHow.Visible = true

uicgravityhow = Instance.new("UICorner")
uicgravityhow.Parent = gravityHow
uicgravityhow.CornerRadius = UDim.new(8, 8)

local gravityControl = Instance.new("TextLabel")
gravityControl.Parent = gravity
gravityControl.Name = "control"
gravityControl.BackgroundColor3 = Color3.new(1, 1, 1)
gravityControl.Position = UDim2.new(1.46, 0, 0.099, 0)
gravityControl.Size = UDim2.new(0, 272, 0, 25)
gravityControl.Text = ""
gravityControl.Visible = true

uicgravityControl = Instance.new("UICorner")
uicgravityControl.Parent = gravityControl
uicgravityControl.CornerRadius = UDim.new(8, 8)

uisgravityControl = Instance.new("UIStroke")
uisgravityControl.Parent = gravityControl
uisgravityControl.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisgravityControl.Color = Color3.new(0, 0, 0)
uisgravityControl.LineJoinMode = Enum.LineJoinMode.Round
uisgravityControl.Thickness = 2.4

local gravitySlider = Instance.new("TextButton")
gravitySlider.Parent = gravityControl
gravitySlider.Name = "slide"
gravitySlider.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
gravitySlider.Position = UDim2.new(-0, 0, 0, 0)
gravitySlider.Size = UDim2.new(0, 199, 0, 25)
gravitySlider.Text = ""
gravitySlider.Visible = true

uicgravityslider = Instance.new("UICorner")
uicgravityslider.Parent = gravitySlider
uicgravityslider.CornerRadius = UDim.new(8, 8)

local fly = Instance.new("TextLabel")
fly.Parent = PlayerMenu
fly.Name = "Fly"
fly.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
fly.Position = UDim2.new(0.016, 0, 0.275, 0)
fly.Size = UDim2.new(0, 194, 0, 32)
fly.TextScaled = true
fly.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
fly.Text = "Fly"
fly.Visible = true

uicfly = Instance.new("UICorner")
uicfly.Parent = fly
uicfly.CornerRadius = UDim.new(0, 8)

local flyHow = Instance.new("ImageLabel")
flyHow.Parent = fly
flyHow.Name = "how"
flyHow.Position = UDim2.new(1.077, 0, 0, 0)
flyHow.Size = UDim2.new(0, 32, 0, 32)
flyHow.Image = "rbxassetid://75772970732380"
flyHow.Visible = true

uicflyhow = Instance.new("UICorner")
uicflyhow.Parent = flyHow
uicflyhow.CornerRadius = UDim.new(8, 8)

local flyControl = Instance.new("Frame")
flyControl.Parent = fly
flyControl.Name = "Control"
flyControl.BackgroundColor3 = Color3.new(0, 0, 0)
flyControl.Position = UDim2.new(1.309, 0, 0, 0)
flyControl.Size = UDim2.new(0, 81, 0, 35)
flyControl.Visible = true

uicflycontrol = Instance.new("UICorner")
uicflycontrol.Parent = flyControl
uicflycontrol.CornerRadius = UDim.new(8, 8)

uisflycontrol = Instance.new("UIStroke")
uisflycontrol.Parent = flyControl
uisflycontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisflycontrol.Color = Color3.new(1, 1, 1)
uisflycontrol.LineJoinMode = Enum.LineJoinMode.Round
uisflycontrol.Thickness = 1

local flyTurn = Instance.new("TextButton")
flyTurn.Parent = flyControl
flyTurn.Name = "turn"
flyTurn.BackgroundColor3 = Color3.new(1, 0, 0)
flyTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
flyTurn.Size = UDim2.new(0, 30, 0, 30)
flyTurn.Text = ""
flyTurn.Visible = true

uicflyturn = Instance.new("UICorner")
uicflyturn.Parent = flyTurn
uicflyturn.CornerRadius = UDim.new(8, 8)

uisflyturn = Instance.new("UIStroke")
uisflyturn.Parent = flyTurn
uisflyturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisflyturn.Color = Color3.new(1, 1, 1)
uisflyturn.LineJoinMode = Enum.LineJoinMode.Round
uisflyturn.Thickness = 1

local flySoon = Instance.new("TextLabel")
flySoon.Parent = fly
flySoon.Name = "soon"
flySoon.BackgroundTransparency = 1
flySoon.BackgroundColor3 = Color3.new(1, 1, 1)
flySoon.Position = UDim2.new(1.8, 0, 0, 0)
flySoon.Size = UDim2.new(0, 89, 0, 32)
flySoon.TextScaled = true
flySoon.TextColor3 = Color3.new(1, 1, 1)
flySoon.Text = "- soon"
flySoon.Visible = true

local GlassArms = Instance.new("TextLabel")
GlassArms.Parent = VisualMenu
GlassArms.Name = "arms"
GlassArms.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
GlassArms.Position = UDim2.new(0.016, 0, 0.104, 0)
GlassArms.Size = UDim2.new(0, 194, 0, 32)
GlassArms.TextScaled = true
GlassArms.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
GlassArms.Text = "Glass arms"
GlassArms.Visible = true

uicglassarms = Instance.new("UICorner")
uicglassarms.Parent = GlassArms
uicglassarms.CornerRadius = UDim.new(0, 8)

local glassarmsHow = Instance.new("ImageLabel")
glassarmsHow.Parent = GlassArms
glassarmsHow.Name = "how"
glassarmsHow.Position = UDim2.new(1.077, 0, 0, 0)
glassarmsHow.Size = UDim2.new(0, 32, 0, 32)
glassarmsHow.Image = "rbxassetid://75772970732380"
glassarmsHow.Visible = true

uicglassarmsHow = Instance.new("UICorner")
uicglassarmsHow.Parent = glassarmsHow
uicglassarmsHow.CornerRadius = UDim.new(8, 8)

local glassarmsControl = Instance.new("Frame")
glassarmsControl.Parent = GlassArms
glassarmsControl.Name = "Control"
glassarmsControl.BackgroundColor3 = Color3.new(0, 0, 0)
glassarmsControl.Position = UDim2.new(1.309, 0, 0, 0)
glassarmsControl.Size = UDim2.new(0, 81, 0, 35)
glassarmsControl.Visible = true

uicglassarmsControl = Instance.new("UICorner")
uicglassarmsControl.Parent = glassarmsControl
uicglassarmsControl.CornerRadius = UDim.new(8, 8)

uisglassaramscontrol = Instance.new("UIStroke")
uisglassaramscontrol.Parent = glassarmsControl
uisglassaramscontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisglassaramscontrol.Color = Color3.new(1, 1, 1)
uisglassaramscontrol.LineJoinMode = Enum.LineJoinMode.Round
uisglassaramscontrol.Thickness = 1

local glassarmsTurn = Instance.new("TextButton")
glassarmsTurn.Parent = glassarmsControl
glassarmsTurn.Name = "turn"
glassarmsTurn.BackgroundColor3 = Color3.new(1, 0, 0)
glassarmsTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
glassarmsTurn.Size = UDim2.new(0, 30, 0, 30)
glassarmsTurn.Text = ""
glassarmsTurn.Visible = true

uicglassarmsturn = Instance.new("UICorner")
uicglassarmsturn.Parent = glassarmsTurn
uicglassarmsturn.CornerRadius = UDim.new(8, 8)

uisglassaramsturn = Instance.new("UIStroke")
uisglassaramsturn.Parent = glassarmsTurn
uisglassaramsturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisglassaramsturn.Color = Color3.new(1, 1, 1)
uisglassaramsturn.LineJoinMode = Enum.LineJoinMode.Round
uisglassaramsturn.Thickness = 1

local antifling = Instance.new("TextLabel")
antifling.Parent = PlayerMenu
antifling.Name = "anti-fling"
antifling.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
antifling.Position = UDim2.new(0.016, 0, 0.36, 0)
antifling.Size = UDim2.new(0, 194, 0, 32)
antifling.TextScaled = true
antifling.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
antifling.Text = "anti-fling"
antifling.Visible = true

uicantifling = Instance.new("UICorner")
uicantifling.Parent = antifling
uicantifling.CornerRadius = UDim.new(0, 8)

local antiflingHow = Instance.new("ImageLabel")
antiflingHow.Parent = antifling
antiflingHow.Name = "how"
antiflingHow.Position = UDim2.new(1.077, 0, 0, 0)
antiflingHow.Size = UDim2.new(0, 32, 0, 32)
antiflingHow.Image = "rbxassetid://75772970732380"
antiflingHow.Visible = true

uicantiflinghow = Instance.new("UICorner")
uicantiflinghow.Parent = antiflingHow
uicantiflinghow.CornerRadius = UDim.new(8, 8)

local antiflingControl = Instance.new("Frame")
antiflingControl.Parent = antifling
antiflingControl.Name = "Control"
antiflingControl.BackgroundColor3 = Color3.new(0, 0, 0)
antiflingControl.Position = UDim2.new(1.309, 0, 0, 0)
antiflingControl.Size = UDim2.new(0, 81, 0, 35)
antiflingControl.Visible = true

uicantiflingcontrol = Instance.new("UICorner")
uicantiflingcontrol.Parent = antiflingControl
uicantiflingcontrol.CornerRadius = UDim.new(8, 8)

uisantiflingcontrol = Instance.new("UIStroke")
uisantiflingcontrol.Parent = antiflingControl
uisantiflingcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisantiflingcontrol.Color = Color3.new(1, 1, 1)
uisantiflingcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisantiflingcontrol.Thickness = 1

local antiflingTurn = Instance.new("TextButton")
antiflingTurn.Parent = antiflingControl
antiflingTurn.Name = "turn"
antiflingTurn.BackgroundColor3 = Color3.new(1, 0, 0)
antiflingTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
antiflingTurn.Size = UDim2.new(0, 30, 0, 30)
antiflingTurn.Text = ""
antiflingTurn.Visible = true

uicantiflingturn = Instance.new("UICorner")
uicantiflingturn.Parent = antiflingTurn
uicantiflingturn.CornerRadius = UDim.new(8, 8)

uisantiflingturn = Instance.new("UIStroke")
uisantiflingturn.Parent = antiflingTurn
uisantiflingturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisantiflingturn.Color = Color3.new(1, 1, 1)
uisantiflingturn.LineJoinMode = Enum.LineJoinMode.Round
uisantiflingturn.Thickness = 1

local infstamina = Instance.new("TextLabel")
infstamina.Parent = PlayerMenu
infstamina.Name = "infstamina"
infstamina.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
infstamina.Position = UDim2.new(0.016, 0, 0.445, 0)
infstamina.Size = UDim2.new(0, 194, 0, 32)
infstamina.TextScaled = true
infstamina.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
infstamina.Text = "inf-stamina"
infstamina.Visible = true

uicinfstamina = Instance.new("UICorner")
uicinfstamina.Parent = infstamina
uicinfstamina.CornerRadius = UDim.new(0, 8)

local infstaminaHow = Instance.new("ImageLabel")
infstaminaHow.Parent = infstamina
infstaminaHow.Name = "how"
infstaminaHow.Position = UDim2.new(1.077, 0, 0, 0)
infstaminaHow.Size = UDim2.new(0, 32, 0, 32)
infstaminaHow.Image = "rbxassetid://75772970732380"
infstaminaHow.Visible = true

uicinfstaminahow = Instance.new("UICorner")
uicinfstaminahow.Parent = infstaminaHow
uicinfstaminahow.CornerRadius = UDim.new(8, 8)

local infstaminaControl = Instance.new("Frame")
infstaminaControl.Parent = infstamina
infstaminaControl.Name = "Control"
infstaminaControl.BackgroundColor3 = Color3.new(0, 0, 0)
infstaminaControl.Position = UDim2.new(1.309, 0, 0, 0)
infstaminaControl.Size = UDim2.new(0, 81, 0, 35)
infstaminaControl.Visible = true

uicinfstaminacontrol = Instance.new("UICorner")
uicinfstaminacontrol.Parent = infstaminaControl
uicinfstaminacontrol.CornerRadius = UDim.new(8, 8)

uisinfstaminacontrol = Instance.new("UIStroke")
uisinfstaminacontrol.Parent = infstaminaControl
uisinfstaminacontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisinfstaminacontrol.Color = Color3.new(1, 1, 1)
uisinfstaminacontrol.LineJoinMode = Enum.LineJoinMode.Round
uisinfstaminacontrol.Thickness = 1

local infstaminaTurn = Instance.new("TextButton")
infstaminaTurn.Parent = infstaminaControl
infstaminaTurn.Name = "turn"
infstaminaTurn.BackgroundColor3 = Color3.new(1, 0, 0)
infstaminaTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
infstaminaTurn.Size = UDim2.new(0, 30, 0, 30)
infstaminaTurn.Text = ""
infstaminaTurn.Visible = true

uicinfstaminaturn = Instance.new("UICorner")
uicinfstaminaturn.Parent = infstaminaTurn
uicinfstaminaturn.CornerRadius = UDim.new(8, 8)

uisinfstaminaturn = Instance.new("UIStroke")
uisinfstaminaturn.Parent = infstaminaTurn
uisinfstaminaturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisinfstaminaturn.Color = Color3.new(1, 1, 1)
uisinfstaminaturn.LineJoinMode = Enum.LineJoinMode.Round
uisinfstaminaturn.Thickness = 1

local nofalldamage = Instance.new("TextLabel")
nofalldamage.Parent = PlayerMenu
nofalldamage.Name = "nofalldamage"
nofalldamage.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
nofalldamage.Position = UDim2.new(0.016, 0, 0.527, 0)
nofalldamage.Size = UDim2.new(0, 194, 0, 32)
nofalldamage.TextScaled = true
nofalldamage.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
nofalldamage.Text = "no fall damage"
nofalldamage.Visible = true

uicnofalldamage = Instance.new("UICorner")
uicnofalldamage.Parent = nofalldamage
uicnofalldamage.CornerRadius = UDim.new(0, 8)

local nofalldamageHow = Instance.new("ImageLabel")
nofalldamageHow.Parent = nofalldamage
nofalldamageHow.Name = "how"
nofalldamageHow.Position = UDim2.new(1.077, 0, 0, 0)
nofalldamageHow.Size = UDim2.new(0, 32, 0, 32)
nofalldamageHow.Image = "rbxassetid://75772970732380"
nofalldamageHow.Visible = true

uicnofalldamagehow = Instance.new("UICorner")
uicnofalldamagehow.Parent = nofalldamageHow
uicnofalldamagehow.CornerRadius = UDim.new(8, 8)

local nofalldamageControl = Instance.new("Frame")
nofalldamageControl.Parent = nofalldamage
nofalldamageControl.Name = "Control"
nofalldamageControl.BackgroundColor3 = Color3.new(0, 0, 0)
nofalldamageControl.Position = UDim2.new(1.309, 0, 0, 0)
nofalldamageControl.Size = UDim2.new(0, 81, 0, 35)
nofalldamageControl.Visible = true

uicnofalldamagecontrol = Instance.new("UICorner")
uicnofalldamagecontrol.Parent = nofalldamageControl
uicnofalldamagecontrol.CornerRadius = UDim.new(8, 8)

uisnofalldamagecontrol = Instance.new("UIStroke")
uisnofalldamagecontrol.Parent = nofalldamageControl
uisnofalldamagecontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisnofalldamagecontrol.Color = Color3.new(1, 1, 1)
uisnofalldamagecontrol.LineJoinMode = Enum.LineJoinMode.Round
uisnofalldamagecontrol.Thickness = 1

local nofalldamageTurn = Instance.new("TextButton")
nofalldamageTurn.Parent = nofalldamageControl
nofalldamageTurn.Name = "turn"
nofalldamageTurn.BackgroundColor3 = Color3.new(1, 0, 0)
nofalldamageTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
nofalldamageTurn.Size = UDim2.new(0, 30, 0, 30)
nofalldamageTurn.Text = ""
nofalldamageTurn.Visible = true

uicnofalldamageturn = Instance.new("UICorner")
uicnofalldamageturn.Parent = nofalldamageTurn
uicnofalldamageturn.CornerRadius = UDim.new(8, 8)

uisnofalldamageturn = Instance.new("UIStroke")
uisnofalldamageturn.Parent = nofalldamageTurn
uisnofalldamageturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisnofalldamageturn.Color = Color3.new(1, 1, 1)
uisnofalldamageturn.LineJoinMode = Enum.LineJoinMode.Round
uisnofalldamageturn.Thickness = 1

local highlight = Instance.new("TextLabel")
highlight.Parent = VisualMenu
highlight.Name = "Highlight"
highlight.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
highlight.Position = UDim2.new(0.016, 0, 0.022, 0)
highlight.Size = UDim2.new(0, 194, 0, 32)
highlight.TextScaled = true
highlight.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
highlight.Text = "Highlight"
highlight.Visible = true

uichighlight = Instance.new("UICorner")
uichighlight.Parent = highlight
uichighlight.CornerRadius = UDim.new(0, 8)

local highlightHow = Instance.new("ImageLabel")
highlightHow.Parent = highlight
highlightHow.Name = "how"
highlightHow.Position = UDim2.new(1.077, 0, 0, 0)
highlightHow.Size = UDim2.new(0, 32, 0, 32)
highlightHow.Image = "rbxassetid://75772970732380"
highlightHow.Visible = true

uichighlighthow = Instance.new("UICorner")
uichighlighthow.Parent = highlightHow
uichighlighthow.CornerRadius = UDim.new(8, 8)

local highlightControl = Instance.new("Frame")
highlightControl.Parent = highlight
highlightControl.Name = "Control"
highlightControl.BackgroundColor3 = Color3.new(0, 0, 0)
highlightControl.Position = UDim2.new(1.309, 0, 0, 0)
highlightControl.Size = UDim2.new(0, 81, 0, 35)
highlightControl.Visible = true

uichighlightcontrol = Instance.new("UICorner")
uichighlightcontrol.Parent = highlightControl
uichighlightcontrol.CornerRadius = UDim.new(8, 8)

uishighlightcontrol = Instance.new("UIStroke")
uishighlightcontrol.Parent = highlightControl
uishighlightcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uishighlightcontrol.Color = Color3.new(1, 1, 1)
uishighlightcontrol.LineJoinMode = Enum.LineJoinMode.Round
uishighlightcontrol.Thickness = 1

local highlightTurn = Instance.new("TextButton")
highlightTurn.Parent = highlightControl
highlightTurn.Name = "turn"
highlightTurn.BackgroundColor3 = Color3.new(1, 0, 0)
highlightTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
highlightTurn.Size = UDim2.new(0, 30, 0, 30)
highlightTurn.Text = ""
highlightTurn.Visible = true

uichighlightturn = Instance.new("UICorner")
uichighlightturn.Parent = highlightTurn
uichighlightturn.CornerRadius = UDim.new(8, 8)

uishighlightturn = Instance.new("UIStroke")
uishighlightturn.Parent = highlightTurn
uishighlightturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uishighlightturn.Color = Color3.new(1, 1, 1)
uishighlightturn.LineJoinMode = Enum.LineJoinMode.Round
uishighlightturn.Thickness = 1

local Aimbot = Instance.new("TextLabel")
Aimbot.Parent = MainMenu
Aimbot.Name = "Aimbot"
Aimbot.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Aimbot.Position = UDim2.new(0.016, 0, 0.022, 0)
Aimbot.Size = UDim2.new(0, 194, 0, 32)
Aimbot.TextScaled = true
Aimbot.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Aimbot.Text = "Aim bot"
Aimbot.Visible = true

uicaimbot = Instance.new("UICorner")
uicaimbot.Parent = Aimbot
uicaimbot.CornerRadius = UDim.new(0, 8)

local aimbotHow = Instance.new("ImageLabel")
aimbotHow.Parent = Aimbot
aimbotHow.Name = "how"
aimbotHow.Position = UDim2.new(1.077, 0, 0, 0)
aimbotHow.Size = UDim2.new(0, 32, 0, 32)
aimbotHow.Image = "rbxassetid://75772970732380"
aimbotHow.Visible = true

uicaimbothow = Instance.new("UICorner")
uicaimbothow.Parent = aimbotHow
uicaimbothow.CornerRadius = UDim.new(8, 8)

local aimbotControl = Instance.new("Frame")
aimbotControl.Parent = Aimbot
aimbotControl.Name = "Control"
aimbotControl.BackgroundColor3 = Color3.new(0, 0, 0)
aimbotControl.Position = UDim2.new(1.309, 0, 0, 0)
aimbotControl.Size = UDim2.new(0, 81, 0, 35)
aimbotControl.Visible = true

uicaimbotcontrol = Instance.new("UICorner")
uicaimbotcontrol.Parent = aimbotControl
uicaimbotcontrol.CornerRadius = UDim.new(8, 8)

uisaimbotcontrol = Instance.new("UIStroke")
uisaimbotcontrol.Parent = aimbotControl
uisaimbotcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisaimbotcontrol.Color = Color3.new(1, 1, 1)
uisaimbotcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisaimbotcontrol.Thickness = 1

local aimbotTurn = Instance.new("TextButton")
aimbotTurn.Parent = aimbotControl
aimbotTurn.Name = "turn"
aimbotTurn.BackgroundColor3 = Color3.new(1, 0, 0)
aimbotTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
aimbotTurn.Size = UDim2.new(0, 30, 0, 30)
aimbotTurn.Text = ""
aimbotTurn.Visible = true

uicaimbotturn = Instance.new("UICorner")
uicaimbotturn.Parent = aimbotTurn
uicaimbotturn.CornerRadius = UDim.new(8, 8)

uisaimbotturn = Instance.new("UIStroke")
uisaimbotturn.Parent = aimbotTurn
uisaimbotturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisaimbotturn.Color = Color3.new(1, 1, 1)
uisaimbotturn.LineJoinMode = Enum.LineJoinMode.Round
uisaimbotturn.Thickness = 1

local function aimbotWithWallCheck(target)
    if functions.aimbotF and functions.wallcheckF then
        local ray = Ray.new(camera.CFrame.Position, (target.Position - camera.CFrame.Position).unit * 500)
        local hit = workspace:FindPartOnRayWithIgnoreList(ray, {me.Character})
        
        if hit and hit:IsDescendantOf(target.Parent) then
            -- Valid target not obstructed by walls
            return true
        else
            -- Obstructed by wall
            return false
        end
    end
    return true
end

-- Lockpick farm auto-click feature
local function autoLockpick()
    if functions.lockpickF then
        while functions.lockpickF do
            local lockpickTool = me.Backpack:FindFirstChild("Lockpick") or me.Character:FindFirstChild("Lockpick")
            if lockpickTool then
                lockpickTool:Activate() -- Simulate clicking lockpick tool
                wait(0.2) -- Adjust as needed for delay between activations
            else
                break -- Exit if no lockpick tool is found
            end
        end
    end
end

-- UI Toggle for Aimbot Wall Check
local wallCheckLabel = Instance.new("TextLabel")
wallCheckLabel.Parent = MainMenu
wallCheckLabel.Name = "WallCheck"
wallCheckLabel.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
wallCheckLabel.Position = UDim2.new(0.016, 0, 0.1, 0)
wallCheckLabel.Size = UDim2.new(0, 194, 0, 32)
wallCheckLabel.TextScaled = true
wallCheckLabel.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
wallCheckLabel.Text = "Aimbot Wall Check"
wallCheckLabel.Visible = true

local uicWallCheck = Instance.new("UICorner")
uicWallCheck.Parent = wallCheckLabel
uicWallCheck.CornerRadius = UDim.new(0, 8)

local wallCheckControl = Instance.new("Frame")
wallCheckControl.Parent = wallCheckLabel
wallCheckControl.Name = "Control"
wallCheckControl.BackgroundColor3 = Color3.new(0, 0, 0)
wallCheckControl.Position = UDim2.new(1.309, 0, 0, 0)
wallCheckControl.Size = UDim2.new(0, 81, 0, 35)
wallCheckControl.Visible = true

local uicWallCheckControl = Instance.new("UICorner")
uicWallCheckControl.Parent = wallCheckControl
uicWallCheckControl.CornerRadius = UDim.new(8, 8)

local wallCheckToggle = Instance.new("TextButton")
wallCheckToggle.Parent = wallCheckControl
wallCheckToggle.Name = "toggle"
wallCheckToggle.BackgroundColor3 = Color3.new(1, 0, 0)
wallCheckToggle.Position = UDim2.new(0.046, 0, 0.071, 0)
wallCheckToggle.Size = UDim2.new(0, 30, 0, 30)
wallCheckToggle.Text = ""
wallCheckToggle.Visible = true

local uicWallCheckToggle = Instance.new("UICorner")
uicWallCheckToggle.Parent = wallCheckToggle
uicWallCheckToggle.CornerRadius = UDim.new(8, 8)

wallCheckToggle.MouseButton1Click:Connect(function()
    functions.wallcheckF = not functions.wallcheckF
    wallCheckToggle.BackgroundColor3 = functions.wallcheckF and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
end)

-- Connect auto-lockpick function
spawn(autoLockpick)

local Fastpickup = Instance.new("TextLabel")
Fastpickup.Parent = WorldMenu
Fastpickup.Name = "Fast-pickup"
Fastpickup.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Fastpickup.Position = UDim2.new(0.016, 0, 0.275, 0)
Fastpickup.Size = UDim2.new(0, 194, 0, 32)
Fastpickup.TextScaled = true
Fastpickup.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Fastpickup.Text = "Fast pickup"
Fastpickup.Visible = true

uicfastpickup = Instance.new("UICorner")
uicfastpickup.Parent = Fastpickup
uicfastpickup.CornerRadius = UDim.new(0, 8)

local fastpickupHow = Instance.new("ImageLabel")
fastpickupHow.Parent = Fastpickup
fastpickupHow.Name = "how"
fastpickupHow.Position = UDim2.new(1.077, 0, 0, 0)
fastpickupHow.Size = UDim2.new(0, 32, 0, 32)
fastpickupHow.Image = "rbxassetid://75772970732380"
fastpickupHow.Visible = true

uicfastpickuphow = Instance.new("UICorner")
uicfastpickuphow.Parent = fastpickupHow
uicfastpickuphow.CornerRadius = UDim.new(8, 8)

local fastpickupControl = Instance.new("Frame")
fastpickupControl.Parent = Fastpickup
fastpickupControl.Name = "Control"
fastpickupControl.BackgroundColor3 = Color3.new(0, 0, 0)
fastpickupControl.Position = UDim2.new(1.309, 0, 0, 0)
fastpickupControl.Size = UDim2.new(0, 81, 0, 35)
fastpickupControl.Visible = true

uicfastpickupcontrol = Instance.new("UICorner")
uicfastpickupcontrol.Parent = fastpickupControl
uicfastpickupcontrol.CornerRadius = UDim.new(8, 8)

uisfastpickupcontrol = Instance.new("UIStroke")
uisfastpickupcontrol.Parent = fastpickupControl
uisfastpickupcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisfastpickupcontrol.Color = Color3.new(1, 1, 1)
uisfastpickupcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisfastpickupcontrol.Thickness = 1

local fastpickupTurn = Instance.new("TextButton")
fastpickupTurn.Parent = fastpickupControl
fastpickupTurn.Name = "turn"
fastpickupTurn.BackgroundColor3 = Color3.new(1, 0, 0)
fastpickupTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
fastpickupTurn.Size = UDim2.new(0, 30, 0, 30)
fastpickupTurn.Text = ""
fastpickupTurn.Visible = true

uicfastpickupturn = Instance.new("UICorner")
uicfastpickupturn.Parent = fastpickupTurn
uicfastpickupturn.CornerRadius = UDim.new(8, 8)

uisfastpickupturn = Instance.new("UIStroke")
uisfastpickupturn.Parent = fastpickupTurn
uisfastpickupturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisfastpickupturn.Color = Color3.new(1, 1, 1)
uisfastpickupturn.LineJoinMode = Enum.LineJoinMode.Round
uisfastpickupturn.Thickness = 1

local Lockpick = Instance.new("TextLabel")
Lockpick.Parent = FarmMenu
Lockpick.Name = "Lockpick"
Lockpick.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Lockpick.Position = UDim2.new(0.016, 0, 0.022, 0)
Lockpick.Size = UDim2.new(0, 194, 0, 32)
Lockpick.TextScaled = true
Lockpick.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Lockpick.Text = "Lockpick"
Lockpick.Visible = true

uiclockpick = Instance.new("UICorner")
uiclockpick.Parent = Lockpick
uiclockpick.CornerRadius = UDim.new(0, 8)

local lockpickHow = Instance.new("ImageLabel")
lockpickHow.Parent = Lockpick
lockpickHow.Name = "how"
lockpickHow.Position = UDim2.new(1.077, 0, 0, 0)
lockpickHow.Size = UDim2.new(0, 32, 0, 32)
lockpickHow.Image = "rbxassetid://75772970732380"
lockpickHow.Visible = true

uiclockpickhow = Instance.new("UICorner")
uiclockpickhow.Parent = lockpickHow
uiclockpickhow.CornerRadius = UDim.new(8, 8)

local lockpickControl = Instance.new("Frame")
lockpickControl.Parent = Lockpick
lockpickControl.Name = "Control"
lockpickControl.BackgroundColor3 = Color3.new(0, 0, 0)
lockpickControl.Position = UDim2.new(1.309, 0, 0, 0)
lockpickControl.Size = UDim2.new(0, 81, 0, 35)
lockpickControl.Visible = true

uiclockpickcontrol = Instance.new("UICorner")
uiclockpickcontrol.Parent = lockpickControl
uiclockpickcontrol.CornerRadius = UDim.new(8, 8)

uislockpickcontrol = Instance.new("UIStroke")
uislockpickcontrol.Parent = lockpickControl
uislockpickcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uislockpickcontrol.Color = Color3.new(1, 1, 1)
uislockpickcontrol.LineJoinMode = Enum.LineJoinMode.Round
uislockpickcontrol.Thickness = 1

local lockpickTrun = Instance.new("TextButton")
lockpickTrun.Parent = lockpickControl
lockpickTrun.Name = "turn"
lockpickTrun.BackgroundColor3 = Color3.new(1, 0, 0)
lockpickTrun.Position = UDim2.new(0.046, 0, 0.071, 0)
lockpickTrun.Size = UDim2.new(0, 30, 0, 30)
lockpickTrun.Text = ""
lockpickTrun.Visible = true

uiclockpickturn = Instance.new("UICorner")
uiclockpickturn.Parent = lockpickTrun
uiclockpickturn.CornerRadius = UDim.new(8, 8)

uislockpickturn = Instance.new("UIStroke")
uislockpickturn.Parent = lockpickTrun
uislockpickturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uislockpickturn.Color = Color3.new(1, 1, 1)
uislockpickturn.LineJoinMode = Enum.LineJoinMode.Round
uislockpickturn.Thickness = 1

local ATM = Instance.new("TextLabel")
ATM.Parent = FarmMenu
ATM.Name = "ATM"
ATM.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
ATM.Position = UDim2.new(0.016, 0, 0.099, 0)
ATM.Size = UDim2.new(0, 194, 0, 32)
ATM.TextScaled = true
ATM.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
ATM.Text = "ATM"
ATM.Visible = true

local uicatm = Instance.new("UICorner")
uicatm.Parent = ATM
uicatm.CornerRadius = UDim.new(0, 8)

local atmHow = Instance.new("ImageLabel")
atmHow.Parent = ATM
atmHow.Name = "how"
atmHow.Position = UDim2.new(1.077, 0, 0, 0)
atmHow.Size = UDim2.new(0, 32, 0, 32)
atmHow.Image = "rbxassetid://75772970732380"
atmHow.Visible = true

local uicatmhow = Instance.new("UICorner")
uicatmhow.Parent = atmHow
uicatmhow.CornerRadius = UDim.new(8, 8)

local atmControl = Instance.new("Frame")
atmControl.Parent = ATM
atmControl.Name = "Control"
atmControl.BackgroundColor3 = Color3.new(0, 0, 0)
atmControl.Position = UDim2.new(1.309, 0, 0, 0)
atmControl.Size = UDim2.new(0, 81, 0, 35)
atmControl.Visible = true

local uicatmcontrol = Instance.new("UICorner")
uicatmcontrol.Parent = atmControl
uicatmcontrol.CornerRadius = UDim.new(8, 8)

local uisatmcontrol = Instance.new("UIStroke")
uisatmcontrol.Parent = atmControl
uisatmcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisatmcontrol.Color = Color3.new(1, 1, 1)
uisatmcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisatmcontrol.Thickness = 1

local atmTurn = Instance.new("TextButton")
atmTurn.Parent = atmControl
atmTurn.Name = "turn"
atmTurn.BackgroundColor3 = Color3.new(1, 0, 0)
atmTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
atmTurn.Size = UDim2.new(0, 30, 0, 30)
atmTurn.Text = ""
atmTurn.Visible = true

local uicatmturn = Instance.new("UICorner")
uicatmturn.Parent = atmTurn
uicatmturn.CornerRadius = UDim.new(8, 8)

local uisatmturn = Instance.new("UIStroke")
uisatmturn.Parent = atmTurn
uisatmturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisatmturn.Color = Color3.new(1, 1, 1)
uisatmturn.LineJoinMode = Enum.LineJoinMode.Round
uisatmturn.Thickness = 1

local InfPepper = Instance.new("TextLabel")
InfPepper.Parent = TrollMenu
InfPepper.Name = "InfPepper"
InfPepper.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
InfPepper.Position = UDim2.new(0.016, 0, 0.022, 0)
InfPepper.Size = UDim2.new(0, 194, 0, 32)
InfPepper.TextScaled = true
InfPepper.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
InfPepper.Text = "inf pepper spray"
InfPepper.Visible = true

local uicinfpepper = Instance.new("UICorner")
uicinfpepper.Parent = InfPepper
uicinfpepper.CornerRadius = UDim.new(0, 8)

local infpepperHow = Instance.new("ImageLabel")
infpepperHow.Parent = InfPepper
infpepperHow.Name = "how"
infpepperHow.Position = UDim2.new(1.077, 0, 0, 0)
infpepperHow.Size = UDim2.new(0, 32, 0, 32)
infpepperHow.Image = "rbxassetid://75772970732380"
infpepperHow.Visible = true

local uicinfpepperhow = Instance.new("UICorner")
uicinfpepperhow.Parent = infpepperHow
uicinfpepperhow.CornerRadius = UDim.new(8, 8)

local infpepperControl = Instance.new("Frame")
infpepperControl.Parent = InfPepper
infpepperControl.Name = "Control"
infpepperControl.BackgroundColor3 = Color3.new(0, 0, 0)
infpepperControl.Position = UDim2.new(1.309, 0, 0, 0)
infpepperControl.Size = UDim2.new(0, 81, 0, 35)
infpepperControl.Visible = true

local uicinfpeppercontrol = Instance.new("UICorner")
uicinfpeppercontrol.Parent = infpepperControl
uicinfpeppercontrol.CornerRadius = UDim.new(8, 8)

local uisinfpeppercontrol = Instance.new("UIStroke")
uisinfpeppercontrol.Parent = infpepperControl
uisinfpeppercontrol.Thickness = 2
uisinfpeppercontrol.Color = Color3.new(1, 1, 1)

local infpepperTurn = Instance.new("TextButton")
infpepperTurn.Parent = infpepperControl
infpepperTurn.Name = "turn"
infpepperTurn.BackgroundColor3 = Color3.new(1, 0, 0)
infpepperTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
infpepperTurn.Size = UDim2.new(0, 30, 0, 30)
infpepperTurn.Text = ""
infpepperTurn.Visible = true

local uicinfpepperturn = Instance.new("UICorner")
uicinfpepperturn.Parent = infpepperTurn
uicinfpepperturn.CornerRadius = UDim.new(8, 8)

local uisinfpepperturn = Instance.new("UIStroke")
uisinfpepperturn.Parent = infpepperTurn
uisinfpepperturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisinfpepperturn.Color = Color3.new(1, 1, 1)
uisinfpepperturn.LineJoinMode = Enum.LineJoinMode.Round
uisinfpepperturn.Thickness = 1

local Adonis = Instance.new("TextLabel")
Adonis.Parent = SettingsMenu
Adonis.Name = "adonis"
Adonis.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Adonis.Position = UDim2.new(0.016, 0, 0.104, 0)
Adonis.Size = UDim2.new(0, 194, 0, 32)
Adonis.TextScaled = true
Adonis.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Adonis.Text = "Adonis bypass"
Adonis.Visible = true

local uicadonis = Instance.new("UICorner")
uicadonis.Parent = Adonis
uicadonis.CornerRadius = UDim.new(0, 8)

local adonisHow = Instance.new("ImageLabel")
adonisHow.Parent = Adonis
adonisHow.Name = "how"
adonisHow.Position = UDim2.new(1.077, 0, 0, 0)
adonisHow.Size = UDim2.new(0, 32, 0, 32)
adonisHow.Image = "rbxassetid://75772970732380"
adonisHow.Visible = true

local uicadonisHow = Instance.new("UICorner")
uicadonisHow.Parent = adonisHow
uicadonisHow.CornerRadius = UDim.new(8, 8)

local adonisLoad = Instance.new("TextButton")
adonisLoad.Parent = Adonis
adonisLoad.Name = "load"
adonisLoad.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
adonisLoad.Position = UDim2.new(1.36, 0, 0, 0)
adonisLoad.Size = UDim2.new(0, 104, 0, 32)
adonisLoad.Text = "Load"
adonisLoad.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
adonisLoad.TextScaled = true
adonisLoad.Visible = true

local uicadonisLoad = Instance.new("UICorner")
uicadonisLoad.Parent = adonisLoad
uicadonisLoad.CornerRadius = UDim.new(8, 8)

local uisadonisload = Instance.new("UIStroke")
uisadonisload.Parent = adonisLoad
uisadonisload.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisadonisload.Color = Color3.new(1, 1, 1)
uisadonisload.LineJoinMode = Enum.LineJoinMode.Round
uisadonisload.Thickness = 1

local Reload = Instance.new("TextLabel")
Reload.Parent = MainMenu
Reload.Name = "Reload"
Reload.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Reload.Position = UDim2.new(0.016, 0, 0.104, 0)
Reload.Size = UDim2.new(0, 194, 0, 32)
Reload.TextScaled = true
Reload.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Reload.Text = "Instant reload"
Reload.Visible = true

local uicreload = Instance.new("UICorner")
uicreload.Parent = Reload
uicreload.CornerRadius = UDim.new(0, 8)

local reloadHow = Instance.new("ImageLabel")
reloadHow.Parent = Reload
reloadHow.Name = "how"
reloadHow.Position = UDim2.new(1.077, 0, 0, 0)
reloadHow.Size = UDim2.new(0, 32, 0, 32)
reloadHow.Image = "rbxassetid://75772970732380"
reloadHow.Visible = true

local uicreloadhow = Instance.new("UICorner")
uicreloadhow.Parent = reloadHow
uicreloadhow.CornerRadius = UDim.new(8, 8)

local reloadControl = Instance.new("Frame")
reloadControl.Parent = Reload
reloadControl.Name = "Control"
reloadControl.BackgroundColor3 = Color3.new(0, 0, 0)
reloadControl.Position = UDim2.new(1.309, 0, 0, 0)
reloadControl.Size = UDim2.new(0, 81, 0, 35)
reloadControl.Visible = true

local uicreloadcontrol = Instance.new("UICorner")
uicreloadcontrol.Parent = reloadControl
uicreloadcontrol.CornerRadius = UDim.new(8, 8)

uisreloadcontrol = Instance.new("UIStroke")
uisreloadcontrol.Parent = reloadControl
uisreloadcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisreloadcontrol.Color = Color3.new(1, 1, 1)
uisreloadcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisreloadcontrol.Thickness = 1

local reloadTurn = Instance.new("TextButton")
reloadTurn.Parent = reloadControl
reloadTurn.Name = "turn"
reloadTurn.BackgroundColor3 = Color3.new(255, 0, 0)
reloadTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
reloadTurn.Size = UDim2.new(0, 30, 0, 30)
reloadTurn.Text = ""
reloadTurn.Visible = true

local uicreloadturn = Instance.new("UICorner")
uicreloadturn.Parent = reloadTurn
uicreloadturn.CornerRadius = UDim.new(8, 8)

uisreloadturn = Instance.new("UIStroke")
uisreloadturn.Parent = reloadTurn
uisreloadturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisreloadturn.Color = Color3.new(1, 1, 1)
uisreloadturn.LineJoinMode = Enum.LineJoinMode.Round
uisreloadturn.Thickness = 1

local Hitbox = Instance.new("TextLabel")
Hitbox.Parent = MainMenu
Hitbox.Name = "hitbox"
Hitbox.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Hitbox.Position = UDim2.new(0.016, 0, 0.187, 0)
Hitbox.Size = UDim2.new(0, 194, 0, 32)
Hitbox.TextScaled = true
Hitbox.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Hitbox.Text = "Hitbox expander"
Hitbox.Visible = true

local uichitbox = Instance.new("UICorner")
uichitbox.Parent = Hitbox
uichitbox.CornerRadius = UDim.new(0, 8)

local hitboxHow = Instance.new("ImageLabel")
hitboxHow.Parent = Hitbox
hitboxHow.Name = "how"
hitboxHow.Position = UDim2.new(1.077, 0, 0, 0)
hitboxHow.Size = UDim2.new(0, 32, 0, 32)
hitboxHow.Image = "rbxassetid://75772970732380"
hitboxHow.Visible = true

local uichitboxhow = Instance.new("UICorner")
uichitboxhow.Parent = hitboxHow
uichitboxhow.CornerRadius = UDim.new(8, 8)

local hitboxControl = Instance.new("Frame")
hitboxControl.Parent = Hitbox
hitboxControl.Name = "Control"
hitboxControl.BackgroundColor3 = Color3.new(0, 0, 0)
hitboxControl.Position = UDim2.new(1.309, 0, 0, 0)
hitboxControl.Size = UDim2.new(0, 81, 0, 35)
hitboxControl.Visible = true

local uichitboxcontrol = Instance.new("UICorner")
uichitboxcontrol.Parent = hitboxControl
uichitboxcontrol.CornerRadius = UDim.new(8, 8)

local uishitboxcontrol = Instance.new("UIStroke")
uishitboxcontrol.Parent = hitboxControl
uishitboxcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uishitboxcontrol.Color = Color3.new(1, 1, 1)
uishitboxcontrol.LineJoinMode = Enum.LineJoinMode.Round
uishitboxcontrol.Thickness = 1

local hitboxTurn = Instance.new("TextButton")
hitboxTurn.Parent = hitboxControl
hitboxTurn.Name = "turn"
hitboxTurn.BackgroundColor3 = Color3.new(255, 0, 0)
hitboxTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
hitboxTurn.Size = UDim2.new(0, 30, 0, 30)
hitboxTurn.Text = ""
hitboxTurn.Visible = true

local uichitboxturn = Instance.new("UICorner")
uichitboxturn.Parent = hitboxTurn
uichitboxturn.CornerRadius = UDim.new(8, 8)

local uishitboxturn = Instance.new("UIStroke")
uishitboxturn.Parent = hitboxTurn
uishitboxturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uishitboxturn.Color = Color3.new(1, 1, 1)
uishitboxturn.LineJoinMode = Enum.LineJoinMode.Round
uishitboxturn.Thickness = 1

local OCmenuKeybind = Instance.new("TextLabel")
OCmenuKeybind.Parent = SettingsMenu
OCmenuKeybind.Name = "keybind"
OCmenuKeybind.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
OCmenuKeybind.Position = UDim2.new(0.016, 0, 0.022, 0)
OCmenuKeybind.Size = UDim2.new(0, 194, 0, 32)
OCmenuKeybind.TextScaled = true
OCmenuKeybind.Text = "Menu Keybind"
OCmenuKeybind.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
OCmenuKeybind.Visible = true

local uisocmenukeybind = Instance.new("UICorner")
uisocmenukeybind.Parent = OCmenuKeybind
uisocmenukeybind.CornerRadius = UDim.new(0, 8)

local ocmenukeybindHow = Instance.new("ImageLabel")
ocmenukeybindHow.Parent = OCmenuKeybind
ocmenukeybindHow.Name = "how"
ocmenukeybindHow.Position = UDim2.new(1.077, 0, 0, 0)
ocmenukeybindHow.Size = UDim2.new(0, 32, 0, 32)
ocmenukeybindHow.Image = "rbxassetid://75772970732380"
ocmenukeybindHow.Visible = true

local uicocmenukeybindhow = Instance.new("UICorner")
uicocmenukeybindhow.Parent = ocmenukeybindHow
uicocmenukeybindhow.CornerRadius = UDim.new(8, 8)

local ocmenukeybindLoad = Instance.new("TextLabel")
ocmenukeybindLoad.Parent = OCmenuKeybind
ocmenukeybindLoad.Name = "load"
ocmenukeybindLoad.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
ocmenukeybindLoad.Position = UDim2.new(1.36, 0, 0, 0)
ocmenukeybindLoad.Size = UDim2.new(0, 104, 0, 32)
ocmenukeybindLoad.TextScaled = true
ocmenukeybindLoad.Text = "Insert"
ocmenukeybindLoad.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
ocmenukeybindLoad.Visible = true

local uicocmenukeybindload = Instance.new("UICorner")
uicocmenukeybindload.Parent = ocmenukeybindLoad
uicocmenukeybindload.CornerRadius = UDim.new(0, 8)

local uisocmenukeybindload = Instance.new("UIStroke")
uisocmenukeybindload.Parent = ocmenukeybindLoad
uisocmenukeybindload.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisocmenukeybindload.Color = Color3.new(1, 1, 1)
uisocmenukeybindload.LineJoinMode = Enum.LineJoinMode.Round
uisocmenukeybindload.Thickness = 1

local skinslistText = Instance.new("TextLabel")
skinslistText.Parent = SkinsMenu
skinslistText.Name = "text"
skinslistText.BackgroundTransparency = 1
skinslistText.Position = UDim2.new(0.37, 0, -0.01, 0)
skinslistText.Size = UDim2.new(0, 200, 0, 50)
skinslistText.TextColor3 = Color3.new(0.945098, 0.945098, 0.945098)
skinslistText.TextScaled = true
skinslistText.Text = "SKINS LIST"
skinslistText.Visible = true

local gunsSkins = Instance.new("TextLabel")
gunsSkins.Parent = SkinsMenu
gunsSkins.Name = "guns"
gunsSkins.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
gunsSkins.Position = UDim2.new(0.015, 0, 0.094, 0)
gunsSkins.Size = UDim2.new(0, 194, 0, 32)
gunsSkins.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
gunsSkins.TextScaled = true
gunsSkins.Text = "GUNS"
gunsSkins.Visible = true

local uicgunsskins = Instance.new("UICorner")
uicgunsskins.Parent = gunsSkins
uicgunsskins.CornerRadius = UDim.new(0, 8)

local gunsskinscontrol = Instance.new("Frame")
gunsskinscontrol.Parent = gunsSkins
gunsskinscontrol.Name = "Control"
gunsskinscontrol.BackgroundColor3 = Color3.new(0, 0, 0)
gunsskinscontrol.Position = UDim2.new(1.064, 0, -0.078, 0)
gunsskinscontrol.Size = UDim2.new(0, 81, 0, 35)
gunsskinscontrol.Visible = true

local uicgunsskinscontrol = Instance.new("UICorner")
uicgunsskinscontrol.Parent = gunsskinscontrol
uicgunsskinscontrol.CornerRadius = UDim.new(8, 8)

local uisgunsskinscontrol = Instance.new("UIStroke")
uisgunsskinscontrol.Parent = gunsskinscontrol
uisgunsskinscontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisgunsskinscontrol.Color = Color3.new(1, 1, 1)
uisgunsskinscontrol.LineJoinMode = Enum.LineJoinMode.Round
uisgunsskinscontrol.Thickness = 1

local gunsskinsTurn = Instance.new("TextButton")
gunsskinsTurn.Parent = gunsskinscontrol
gunsskinsTurn.Name = "turn"
gunsskinsTurn.BackgroundColor3 = Color3.new(1, 0, 0)
gunsskinsTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
gunsskinsTurn.Size = UDim2.new(0, 30, 0, 30)
gunsskinsTurn.Text = ""
gunsskinsTurn.Visible = true

local uicgunsskinsturn = Instance.new("UICorner")
uicgunsskinsturn.Parent = gunsskinsTurn
uicgunsskinsturn.CornerRadius = UDim.new(8, 8)

local uisgunsskinsturn = Instance.new("UIStroke")
uisgunsskinsturn.Parent = gunsskinsTurn
uisgunsskinsturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisgunsskinsturn.Color = Color3.new(1, 1, 1)
uisgunsskinsturn.LineJoinMode = Enum.LineJoinMode.Round
uisgunsskinsturn.Thickness = 1

local meleeSkins = Instance.new("TextLabel")
meleeSkins.Parent = SkinsMenu
meleeSkins.Name = "melees"
meleeSkins.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
meleeSkins.Position = UDim2.new(0.619, 0, 0.094, 0)
meleeSkins.Size = UDim2.new(0, 194, 0, 32)
meleeSkins.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
meleeSkins.TextScaled = true
meleeSkins.Text = "MELEES"
meleeSkins.Visible = true

local uicmeleeskins = Instance.new("UICorner")
uicmeleeskins.Parent = meleeSkins
uicmeleeskins.CornerRadius = UDim.new(0, 8)

local meleeskinsControl = Instance.new("Frame")
meleeskinsControl.Parent = meleeSkins
meleeskinsControl.Name = "Control"
meleeskinsControl.BackgroundColor3 = Color3.new(0, 0, 0)
meleeskinsControl.Position = UDim2.new(1.064, 0,-0.078, 0)
meleeskinsControl.Size = UDim2.new(0, 81, 0, 35)
meleeskinsControl.Visible = true

local uicmeleeskinscontrol = Instance.new("UICorner")
uicmeleeskinscontrol.Parent = meleeskinsControl
uicmeleeskinscontrol.CornerRadius = UDim.new(8, 8)

local uismeleeskinscontrol = Instance.new("UIStroke")
uismeleeskinscontrol.Parent = meleeskinsControl
uismeleeskinscontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uismeleeskinscontrol.Color = Color3.new(1, 1, 1)
uismeleeskinscontrol.LineJoinMode = Enum.LineJoinMode.Round
uismeleeskinscontrol.Thickness = 1

local meleeskinsTurn = Instance.new("TextButton")
meleeskinsTurn.Parent = meleeskinsControl
meleeskinsTurn.Name = "turn"
meleeskinsTurn.BackgroundColor3 = Color3.new(1, 0, 0)
meleeskinsTurn.Position = UDim2.new(0.046, 0, 0.071, 0)
meleeskinsTurn.Size = UDim2.new(0, 30, 0, 30)
meleeskinsTurn.Text = ""
meleeskinsTurn.Visible = true

local uicmeleeskinsturn = Instance.new("UICorner")
uicmeleeskinsturn.Parent = meleeskinsTurn
uicmeleeskinsturn.CornerRadius = UDim.new(8, 8)

local uismeleeskinsturn = Instance.new("UIStroke")
uismeleeskinsturn.Parent = meleeskinsTurn
uismeleeskinsturn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uismeleeskinsturn.Color = Color3.new(1, 1, 1)
uismeleeskinsturn.LineJoinMode = Enum.LineJoinMode.Round
uismeleeskinsturn.Thickness = 1

local gunsList = Instance.new("ScrollingFrame")
gunsList.Parent = SkinsMenu
gunsList.Name = "ginslist"
gunsList.BackgroundColor3 = Color3.new(0.333333, 0.333333, 0.333333)
gunsList.Position = UDim2.new(0.015, 0, 0.182, 0)
gunsList.Size = UDim2.new(0, 360, 0, 481)
gunsList.CanvasSize = UDim2.new(0, 0, 10, 0)
gunsList.ScrollBarImageColor3 = Color3.new(0, 0, 0)
gunsList.ScrollBarThickness = 5

local meleesList = Instance.new("ScrollingFrame")
meleesList.Parent = SkinsMenu
meleesList.Name = "meleeslist"
meleesList.BackgroundColor3 = Color3.new(0.333333, 0.333333, 0.333333)
meleesList.Position = UDim2.new(0.525, 0, 0.186, 0)
meleesList.Size = UDim2.new(0, 360, 0, 481)
meleesList.CanvasSize = UDim2.new(0, 0, 10, 0)
meleesList.ScrollBarImageColor3 = Color3.new(0, 0, 0)
meleesList.ScrollBarThickness = 5

local glockSkin = Instance.new("TextLabel")
glockSkin.Parent = gunsList
glockSkin.Name = "Glock"
glockSkin.BackgroundColor3 = Color3.new(1, 1, 1)
glockSkin.Position = UDim2.new(0.03, 0, 0.003, 0)
glockSkin.Size = UDim2.new(0, 250, 0, 40)
glockSkin.TextColor3 = Color3.new(0, 0, 0)
glockSkin.TextScaled = true
glockSkin.Text = "Glock - Anime girl"
glockSkin.Visible = true

local uicglockskin = Instance.new("UICorner")
uicglockskin.Parent = glockSkin
uicglockskin.CornerRadius = UDim.new(0, 8)

local glockskinCheck = Instance.new("TextButton")
glockskinCheck.Parent = glockSkin
glockskinCheck.Name = "check"
glockskinCheck.BackgroundColor3 = Color3.new(0, 0, 0)
glockskinCheck.Position = UDim2.new(1.055, 0, 0.063, 0)
glockskinCheck.Size = UDim2.new(0, 35, 0, 35)
glockskinCheck.Text = ""
glockskinCheck.Visible = true

local uicglockskincheck = Instance.new("UICorner")
uicglockskincheck.Parent = glockskinCheck
uicglockskincheck.CornerRadius = UDim.new(0, 5)

local glockskinCheckmark = Instance.new("ImageLabel")
glockskinCheckmark.Parent = glockskinCheck
glockskinCheckmark.BackgroundTransparency = 1
glockskinCheckmark.Position = UDim2.new(0, 0, 0, 0)
glockskinCheckmark.Size = UDim2.new(0, 35, 0, 35)
glockskinCheckmark.Image = "rbxassetid://6218581738"
glockskinCheckmark.Visible = false

local Commands = {
      leave = function()
            game:Shutdown()
      end,
      reset = function()
            me.Character.Humanoid.Health = 0
      end,
      cmds = function()
            ConsoleText(table.concat(cmds, ", "), "succes")
      end,
      clear = function()
            ConsoleText("")
      end,
      close = function()
            Gui:Destroy()
      end,
      reload = function()
            Gui:Destroy()
            wait(1)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/populyar1/just/refs/heads/main/Gui_v2.lua"))()
      end,
}

function SkinsL()
      run.RenderStepped:Connect(function()
            local char = me.Character or me.CharacterAdded:Wait()
            if not char then return end
            local tool = char:FindFirstChildOfClass("Tool")
            if not tool then return end
            
            if FOLDER.Function_Guns then
                  for _, a in ipairs(FOLDER.Skins.GUNS) do
                        if tool.Name  == a.gun then
                              for _, obj in ipairs(tool:GetDescendants()) do
                                    if obj:IsA("MeshPart") then
                                          if FOLDER.Selection.GUNS[a.gun] then
                                                obj.TextureID = a.id
                                          end
                                    end
                              end
                        end
                  end
            end
      end)
end

function hitboxL()
      function resize(plr)
            local function applyChanges(head)
                  local oldSize = Vector3.new(1.2, 1, 1)
                  local newSize = Vector3.new(6.5, 6.5, 6.5)
                  while run.Stepped:Wait() do
                        if functions.hitbox_expanderF then
                              if head.Size ~= newSize then
                                    head.Size = newSize
                              end
                              if not head.Massless then
                                    head.Massless = true
                              end
                              if head.Transparency ~= 0.5 then
                                    head.Transparency = 0.5
                              end
                        else
                              if head.Size ~= oldSize then
                                    head.Size = oldSize
                              end
                              if head.Massless then
                                    head.Massless = false
                              end
                              if head.Transparency ~= 0 then
                                    head.Transparency = 0
                              end
                        end
                  end
            end
            local function processCharacter(character)
                  local head = character:WaitForChild("Head", 5)
                  if head then
                        spawn(function()
                              applyChanges(head)
                        end)
                  end
            end
            plr.CharacterAdded:Connect(function(character)
                  processCharacter(character)
            end)
            if plr.Character then
                  processCharacter(plr.Character)
            end
      end
      function check()
            for _, a in pairs(plrs:GetPlayers()) do
                  if a ~= me then
                        resize(a)
                  end
            end
      end
      plrs.PlayerAdded:Connect(function(added)
            resize(added)
      end)
      check()
end

function instantreloadL()
      local gunR_remote = game:GetService("ReplicatedStorage").Events.GNX_R
      run.RenderStepped:Connect(function()
            if functions.instant_reloadF then
                  local tool = me.Character:FindFirstChildOfClass("Tool")
                  if tool then
                        if tool:FindFirstChild("IsGun") then
                              gunR_remote:FireServer(tick(), "KLWE89U0", tool);
                              gunR_remote:FireServer(tick(), "KLWE89U0", tool);
                        end
                  else
                        return
                  end
            end
      end)
end

function infpepperL(value)
      function pepper(obj)
            if value == true then
                  obj:FindFirstChild("Ammo").MinValue = 100
                  obj:FindFirstChild("Ammo").Value = 100
            else
                  obj:FindFirstChild("Ammo").MinValue = 0
            end
      end
      
      run.RenderStepped:Connect(function()
            local a1 = me.Backpack:FindFirstChild("Pepper-spray")
            if a1 then
                  if a1:FindFirstChild("Ammo").Value < 1 then
                        return nil
                  else
                        pepper(a1)
                  end
            else
                  local getchar = me.Character or me.CharacterAdded:Wait()
                  if getchar then
                        local a2 = getchar:FindFirstChild("Pepper-spray")
                        if a2 then
                              pepper(a2)
                        else
                              local waitpepper = me.Backpack:WaitForChild("Pepper-spray")
                              pepper(waitpepper)
                        end
                  end
            end
      end)
end

function glassarmsL(value)
      local viewfolder = camera:WaitForChild("ViewModel")
      if value == true then
            viewfolder["Left Arm"].Material = Enum.Material.ForceField
            viewfolder["Right Arm"].Material = Enum.Material.ForceField
      else
            viewfolder["Left Arm"].Material = Enum.Material.Plastic
            viewfolder["Right Arm"].Material = Enum.Material.Plastic
      end
      me.CharacterAdded:Connect(function()
            if value == true then
                  viewfolder["Left Arm"].Material = Enum.Material.ForceField
                  viewfolder["Right Arm"].Material = Enum.Material.ForceField
            else
                  viewfolder["Left Arm"].Material = Enum.Material.Plastic
                  viewfolder["Right Arm"].Material = Enum.Material.Plastic
            end
      end)
end

function antiflingL()
     ConsoleText("This function is disables", "text")
end

function lockpickL()
      function lockpick(gui)
            for _, a in pairs(gui:GetDescendants()) do
                  if a:IsA("ImageLabel") and a.Name == "Bar" then
                        if a.Parent.Name ~= "Attempts" then
                              local oldsize = a.Size
                              run.RenderStepped:Connect(function()
                                    if functions.lockpickF then
                                          task.wait()
                                          a.Size = UDim2.new(0, 280, 0, 280)
                                    else
                                          task.wait()
                                          a.Size = oldsize
                                    end
                              end)
                        end
                  end
            end
      end
      
      me.PlayerGui.ChildAdded:Connect(function(gui)
            if gui:IsA("ScreenGui") and gui.Name == "LockpickGUI" then
                  lockpick(gui)
            end
      end)
end

function fastpickupL()
      local proximityPrompts = {}

      workspace.DescendantAdded:Connect(function(item)
            if item:IsA("ProximityPrompt") then
                  proximityPrompts[item] = {
                        originalDuration = item.HoldDuration
                  }
            end
      end)

      run.RenderStepped:Connect(function()
            for prompt, info in pairs(proximityPrompts) do
                  if functions.fast_pickupF then
                        prompt.HoldDuration = 0
                  end
            end
      end)
end

function highlightL()
      local function isPlayerVisible(player)
            if player == plrs.LocalPlayer then return false end

            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                  local _, onScreen = camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
                  return onScreen
            end

            return false
      end

      local function updateHighlights()
            for _, player in pairs(plrs:GetPlayers()) do
                  local character = player.Character
                  if character then
                        local highlight = character:FindFirstChildOfClass("Highlight")
                        if functions.highlightF then
                              if isPlayerVisible(player) then
                                    if not highlight then
                                          highlight = Instance.new("Highlight")
                                          highlight.Parent = character
                                          highlight.FillTransparency = 1
                                    end
                              else
                                    if highlight then
                                          highlight:Destroy()
                                    end
                              end
                        else
                              if highlight then
                                    highlight:Destroy()
                              end
                        end
                  end
            end
      end

      while run.Heartbeat:Wait() do
            updateHighlights()
      end
end

function aimbotL()
      local aimpart = "Head"
      local target = nil
      local radius = 150
      local pressed = false
      local aimtarget
      local canusing = false
      local FirstPerson = true
      local velocity = true
      local predict = 13
      local offset = Vector3.new(0, 0.4, 0)

      remotes.circle = Drawing.new("Circle")
      remotes.circle.Color = Color3.fromRGB(255, 0, 0)
      remotes.circle.Thickness = 2
      remotes.circle.NumSides = 50
      remotes.circle.Radius = radius
      remotes.circle.Filled = false
      remotes.circle.Visible = true

      local function getClosestTarget()
            local closest, closestDist = nil, radius
            for _, player in pairs(plrs:GetPlayers()) do
                  if player ~= me and player.Character and player.Character:FindFirstChild(aimpart) then
                        local pos, onScreen = camera:WorldToViewportPoint(player.Character[aimpart].Position)
                        if onScreen then
                              local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(input:GetMouseLocation().X, input:GetMouseLocation().Y)).Magnitude
                              if distance < closestDist then
                                    closestDist = distance
                                    closest = player
                              end
                        end
                  end
            end
            return closest
      end
      remotes.circle_pos = run.RenderStepped:Connect(function()
            remotes.circle.Position = Vector2.new(input:GetMouseLocation().X, input:GetMouseLocation().Y)
      end)
      
      input.InputBegan:Connect(function(key)
            if not input:GetFocusedTextBox() then
                  if key.UserInputType == Enum.UserInputType.MouseButton2 then
                        pressed = true
                        aimtarget = getClosestTarget()
                  end
            end
      end)
      input.InputEnded:Connect(function(key)
            if not input:GetFocusedTextBox() then
                  if key.UserInputType == Enum.UserInputType.MouseButton2 then
                        pressed = false
                        aimtarget = nil
                  end
            end
      end)
      run.RenderStepped:Connect(function()
            if FirstPerson then
                  local magnitude = (camera.Focus.p - camera.CFrame.p).Magnitude
                  canusing = magnitude <= 1.5
            end
            if functions.aimbotF and pressed and aimtarget and aimtarget.Character then
                  local head = aimtarget.Character:FindFirstChild(aimpart)
                  local humanoid = aimtarget.Character:FindFirstChild("Humanoid")

                  if head and humanoid and humanoid.Health > 0 and canusing then
                        local targetPosition = head.Position + offset
                        if velocity then
                              targetPosition = targetPosition + head.Velocity / predict
                        end
                        camera.CFrame = camera.CFrame:Lerp(CFrame.new(camera.CFrame.p, targetPosition), 0.9)
                  end
            end
      end)
end

function atmL()
      ConsoleText("this function is disabled", "text")
end

function infstaminaL()
      local oldStamina
      local succes, no = pcall(function()
            oldStamina =
                  hookfunction(
                        getupvalue(getrenv()._G.S_Take, 2),
                        function(v1, ...)
                              if (functions.infstaminaF) then 
                                    v1 = 0
                              end
                              return oldStamina(v1, ...)
                        end
                  )
      end)
      if not succes then
            local s, n = pcall(function()
                  local stamina = {}
                  local char = me.Character or me.CharacterAdded:Wait()
                  local hum = char:FindFirstChildOfClass("Humanoid")
                  function get()
                        for index, value in pairs(getgc(true)) do
                              if type(value) == "table" and rawget(value, "S") then
                                    stamina[#stamina + 1] = value
                              end
                        end
                  end
                  get()
                  local r
                  r = game:GetService("RunService").RenderStepped:Connect(function()
                        for _, a in pairs(stamina) do
                              a.S = 100
                        end
                  end)
                  hum.Died:Connect(function()
                        r:Disconnect()
                  end)
                  me.CharacterAdded:Connect(function()
                        wait(2)
                        get()
                        r = game:GetService("RunService").RenderStepped:Connect(function()
                              for _, a in pairs(stamina) do
                                    a.S = 100
                              end
                        end)
                  end)
            end)
            if not s then
                  ConsoleText("Patched or you exploit not support", "error")
            end
      end
end

function fullbrightL(value)
      light.ExposureCompensation = value
end

function open_doorsL()
      remotes.open_doorsRun = run.RenderStepped:Connect(function()
            for _, i in pairs(game.Workspace:WaitForChild("Map").Doors:GetChildren()) do
                  if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - i:FindFirstChild("DoorBase").Position).Magnitude <= 20 then
                        if i:FindFirstChild("Values"):FindFirstChild("Locked").Value == true then
                              i:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer("Unlock", i.Lock)
                              local b1 = "Open"
                              local b2 = i:FindFirstChild("Knob2")
                              i:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer(b1, b2)
                        else
                              for _, a in pairs(game.Workspace:WaitForChild("Map").Doors:GetChildren()) do
                                    if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - a:FindFirstChild("DoorBase").Position).Magnitude <= 20 then
                                          local opened = a:FindFirstChild("Values"):FindFirstChild("Open")
                                          if opened and opened.Value == false then
                                                local a1 = "Open"
                                                local a2 = a:FindFirstChild("Knob2")
                                                a:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer(a1, a2)
                                          end
                                    end
                              end
                        end
                  end
            end
      end)
end

function nobarriersL(value)
      function disableTouchAndQuery(part)
            if part:IsA("BasePart") then
                  part.CanTouch = value
                  part.CanQuery = value
            end
      end

      function findAndDisableParts()
            partNames = {"BarbedWire", "RG_Part", "Spike"}

            for _, partName in ipairs(partNames) do
                  for _, part in pairs(game.Workspace:GetDescendants()) do
                        if part.Name == partName then
                              disableTouchAndQuery(part)
                        end
                  end
            end
      end
      function disableTouchAndQuery2(part)
            if part:IsA("BasePart") then
                  part.CanTouch = value
                  part.CanQuery = value
            end
      end

      function findAndDisableParts2()
            partNames2 = {"FirePart", "Grinder"}

            for _, partName in ipairs(partNames2) do
                  for _, part in pairs(game.Workspace:GetDescendants()) do
                        if part.Name == partName then
                              disableTouchAndQuery2(part)
                        end
                  end
            end
      end
      findAndDisableParts()
      findAndDisableParts2()
end

local stroke = 1
function ConsoleText(text, typeF)
      if stroke > 20 then
            consoletext.Text = ""
            stroke = 1
      end
      
      local strokeColor = '<font color="rgb(255, 255, 255)">'..stroke..".  "..'</font>'
      local errorColor = '<font color="rgb(255, 0, 0)">'..text..'</font>'
      local succesColor = '<font color="rgb(0, 255, 0)">'..text..'</font>'
      local textColor = '<font color="rgb(255, 255, 255)">'..text..'</font>'
      
      if consoletext.Text == "" and typeF == "error" then
            consoletext.Text = strokeColor..errorColor
            stroke += 1
      elseif consoletext.Text ~= "" and typeF == "error" then
            consoletext.Text = consoletext.Text.."\n"..strokeColor..errorColor
            stroke += 1
      end
      if consoletext.Text == "" and typeF == "succes" then
            consoletext.Text = strokeColor..succesColor
            stroke += 1
      elseif consoletext.Text ~= "" and typeF == "succes" then
            consoletext.Text = consoletext.Text.."\n"..strokeColor..succesColor
            stroke += 1
      end
      if consoletext.Text == "" and typeF == "text" then
            consoletext.Text = strokeColor..textColor
            stroke += 1
      elseif consoletext.Text ~= "" and typeF == "text" then
            consoletext.Text = consoletext.Text.."\n"..strokeColor..textColor
            stroke += 1
      end
      if text == "" then
            consoletext.Text = ""
            stroke = 1
      end
end

WorldList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= WorldMenu then
                  a.Visible = false
                  WorldMenu.Visible = true
            end
      end
end)

PlayerList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= PlayerMenu then
                  a.Visible = false
                  PlayerMenu.Visible = true
            end
      end
end)

VisualList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= VisualMenu then
                  a.Visible = false
                  VisualMenu.Visible = true
            end
      end
end)

MainList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= MainMenu then
                  a.Visible = false
                  MainMenu.Visible = true
            end
      end
end)

FarmList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= FarmMenu then
                  a.Visible = false
                  FarmMenu.Visible = true
            end
      end
end)

SettingsList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= SettingsMenu then
                  a.Visible = false
                  SettingsMenu.Visible = true
            end
      end
end)

TrollList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= TrollMenu then
                  a.Visible = false
                  TrollMenu.Visible = true
            end
      end
end)

SkinsList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= SkinsMenu then
                  a.Visible = false
                  SkinsMenu.Visible = true
            end
      end
end)

gunsskinsTurn.MouseButton1Click:Connect(function()
      if FOLDER.Function_Guns == false then
            FOLDER.Function_Guns = true
            gunsinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            gunsanim1 = tween:Create(gunsskinsTurn, gunsinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            gunsanim1:Play()
            gunsanim1.Completed:Connect(function()
                  gunsskinsTurn.BackgroundColor3 = Color3.new(0.0509804, 1, 0)
            end)
            SkinsL()
      elseif FOLDER.Function_Guns == true then
            FOLDER.Function_Guns = false
            gunsinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            gunsanim2 = tween:Create(gunsskinsTurn, gunsinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            gunsanim2:Play()
            gunsanim2.Completed:Connect(function()
                  gunsskinsTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

glockskinCheck.MouseButton1Click:Connect(function()
      if FOLDER.Selection.GUNS["G-17"] == false then
            glockskinCheckmark.Visible = true
            FOLDER.Selection.GUNS["G-17"] = true
      else
            glockskinCheckmark.Visible = false
            FOLDER.Selection.GUNS["G-17"] = false
      end
end)

ocmenukeybindLoad.MouseEnter:Connect(function()
      remotes.OCmenukeybind = true
      input.InputBegan:Connect(function(key, procces)
            if not procces and remotes.OCmenukeybind and key.UserInputType == Enum.UserInputType.MouseButton1 then
                  ocmenukeybindLoad.Text = "..."
                  local connect
                  connect = input.InputBegan:Connect(function(key2)
                        if not table.find(ignore_binds, key2.KeyCode) and not table.find(ignore_binds, key2.UserInputType) then
                              _G.Keybind = key2.KeyCode
                              local keyname = tostring(_G.Keybind):gsub("Enum.KeyCode.", "")
                              ocmenukeybindLoad.Text = keyname
                              connect:Disconnect()
                        else
                              return
                        end
                  end)
            end
      end)
end)

ocmenukeybindLoad.MouseLeave:Connect(function()
      remotes.OCmenukeybind = false
      local keyname = tostring(_G.Keybind):gsub("Enum.KeyCode.", "")
      ocmenukeybindLoad.Text = keyname
end)

hitboxTurn.MouseButton1Click:Connect(function()
      if functions.hitbox_expanderF == false then
            functions.hitbox_expanderF = true
            hitboxinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            hitboxanim1 = tween:Create(hitboxTurn, hitboxinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            hitboxanim1:Play()
            hitboxanim1.Completed:Connect(function()
                  hitboxTurn.BackgroundColor3 = Color3.new(0.14902, 1, 0)
            end)
            hitboxL()
      elseif functions.hitbox_expanderF == true then
            functions.hitbox_expanderF = false
            hitboxinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            hitboxanim2 = tween:Create(hitboxTurn, hitboxinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            hitboxanim2:Play()
            hitboxanim2.Completed:Connect(function()
                  hitboxTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

reloadTurn.MouseButton1Click:Connect(function()
      if functions.instant_reloadF == false then
            functions.instant_reloadF = true
            reloadinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            reloadanim1 = tween:Create(reloadTurn, reloadinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            reloadanim1:Play()
            reloadanim1.Completed:Connect(function()
                  reloadTurn.BackgroundColor3 = Color3.new(0, 1, 0)
            end)
            instantreloadL()
      elseif functions.instant_reloadF == true then
            functions.instant_reloadF = false
            reloadinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            reloadanim2 = tween:Create(reloadTurn, reloadinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            reloadanim2:Play()
            reloadanim2.Completed:Connect(function()
                  reloadTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

adonisLoad.MouseButton1Click:Connect(function()
      if remotes.adonis_pressed == false then
            remotes.adonis_pressed = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua",true))()
      else
            return nil
      end
end)

infpepperTurn.MouseButton1Click:Connect(function()
      if functions.inf_pepperF == false then
            functions.inf_pepperF = true
            infpepperinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            infpepperanim1 = tween:Create(infpepperTurn, infpepperinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            infpepperanim1:Play()
            infpepperanim1.Completed:Connect(function()
                  infpepperTurn.BackgroundColor3 = Color3.new(0.14902, 1, 0)
            end)
            infpepperL(true)
      elseif functions.inf_pepperF == true then
            functions.inf_pepperF = false
            infpepperinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            infpepperanim2 = tween:Create(infpepperTurn, infpepperinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            infpepperanim2:Play()
            infpepperanim2.Completed:Connect(function()
                  infpepperTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
            infpepperL(false)
      end
end)

glassarmsTurn.MouseButton1Click:Connect(function()
      if functions.glass_armsF == false then
            functions.glass_armsF = true
            glassarmsinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            glassarmsanim1 = tween:Create(glassarmsTurn, glassarmsinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            glassarmsanim1:Play()
            glassarmsanim1.Completed:Connect(function()
                  glassarmsTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            glassarmsL(true)
      elseif functions.glass_armsF == true then
            functions.glass_armsF = false
            glassarmsinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            glassarmsanim2 = tween:Create(glassarmsTurn, glassarmsinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            glassarmsanim2:Play()
            glassarmsanim2.Completed:Connect(function()
                  glassarmsTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
            glassarmsL(false)
      end
end)

antiflingTurn.MouseButton1Click:Connect(function()
      if functions.anti_flingF == false then
            functions.anti_flingF = true
            antiflinginfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            antiflinganim1 = tween:Create(antiflingTurn, antiflinginfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            antiflinganim1:Play()
            antiflinganim1.Completed:Connect(function()
                  antiflingTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            antiflingL()
      elseif functions.anti_flingF == true then
            functions.anti_flingF = false
            antiflinginfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            antiflinganim2 = tween:Create(antiflingTurn, antiflinginfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            antiflinganim2:Play()
            antiflinganim2.Completed:Connect(function()
                  antiflingTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

FullbrightTurn.MouseButton1Click:Connect(function()
      if functions.FullbrightF == false then
            functions.FullbrightF = true
            fullbrightinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            fullbrightanim1 = tween:Create(FullbrightTurn, fullbrightinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            fullbrightanim1:Play()
            fullbrightanim1.Completed:Connect(function()
                  FullbrightTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            fullbrightL(1)
      elseif functions.FullbrightF == true then
            functions.FullbrightF = false
            fullbrightL(0)
            fullbrightinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            fullbrightanim2 = tween:Create(FullbrightTurn, fullbrightinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            fullbrightanim2:Play()
            fullbrightanim2.Completed:Connect(function()
                  FullbrightTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

TurnOpen_doors.MouseButton1Click:Connect(function()
      if functions.AutoOpenDoorsF == false then
            functions.AutoOpenDoorsF = true
            open_doorsL()
            openDoorsinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            openDoorsanim1 = tween:Create(TurnOpen_doors, openDoorsinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            openDoorsanim1:Play()
            openDoorsanim1.Completed:Connect(function()
                  TurnOpen_doors.BackgroundColor3 = Color3.new(0.101961, 1, 0)
            end)
      elseif functions.AutoOpenDoorsF == true then
            functions.AutoOpenDoorsF = false
            remotes.open_doorsRun:Disconnect()
            openDoorsinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            openDoorsanim2 = tween:Create(TurnOpen_doors, openDoorsinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            openDoorsanim2:Play()
            openDoorsanim2.Completed:Connect(function()
                  TurnOpen_doors.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

nobarriersTurn.MouseButton1Click:Connect(function()
      if functions.NoBarriersF == false then
            functions.NoBarriersF = true
            nobarriersinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            nobarriersanim1 = tween:Create(nobarriersTurn, nobarriersinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            nobarriersanim1:Play()
            nobarriersanim1.Completed:Connect(function()
                  nobarriersTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            nobarriersL(false)
      elseif functions.NoBarriersF == true then
            functions.NoBarriersF = false
            nobarriersinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            nobarriersanim2 = tween:Create(nobarriersTurn, nobarriersinfo2, {Position = UDim2.new(0.041, 0, 0.071, 0)})
            nobarriersanim2:Play()
            nobarriersanim2.Completed:Connect(function()
                  nobarriersTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
            nobarriersL(true)
      end
end)

min1 = 0.08 * fovControl.AbsoluteSize.X
max1 = fovControl.AbsoluteSize.X

local minfov = 30
local maxfov = 120

fovSlider.MouseButton1Down:Connect(function()
      remotes.fovslider_dragging = true
end)

input.InputEnded:Connect(function(check)
      if check.UserInputType == Enum.UserInputType.MouseButton1 then
            remotes.fovslider_dragging = false
      end
end)

input.InputChanged:Connect(function(check2)
      if remotes.fovslider_dragging and check2.UserInputType == Enum.UserInputType.MouseMovement then
            mousepos = input:GetMouseLocation().X
            newsize = math.clamp(mousepos - fovControl.AbsolutePosition.X, min1, max1)
            btnSizeScale = newsize / fovControl.AbsoluteSize.X
            fovSlider.Size = UDim2.new(btnSizeScale, 0, fovSlider.Size.Y.Scale, fovSlider.Size.Y.Offset)
            fovProgress = (newsize - min1) / (max1 - min1)
            fov = math.clamp(minfov + (fovProgress * (maxfov - minfov)), minfov, maxfov)

            if remotes.fov_connection then
                  remotes.fov_connection:Disconnect()
            end

            remotes.fov_connection =  run.RenderStepped:Connect(function()
                  camera.FieldOfView = fov
            end)
      end
end)

local min2 = 0.08 * gravityControl.AbsoluteSize.X
local max2 = gravityControl.AbsoluteSize.X

local minGravity = 195
local maxGravity = 75

gravitySlider.MouseButton1Down:Connect(function()
      remotes.gravityslider_dragging = true
end)

input.InputEnded:Connect(function(check3)
      if check3.UserInputType == Enum.UserInputType.MouseButton1 then
            remotes.gravityslider_dragging = false
      end
end)

input.InputChanged:Connect(function(check4)
      if remotes.gravityslider_dragging and check4.UserInputType == Enum.UserInputType.MouseMovement then
            mousepos = input:GetMouseLocation().X
            newsize = math.clamp(mousepos - gravityControl.AbsolutePosition.X, min2, max2)
            btnSizeScale = newsize / gravityControl.AbsoluteSize.X
            gravitySlider.Size = UDim2.new(btnSizeScale, 0, gravitySlider.Size.Y.Scale, gravitySlider.Size.Y.Offset)
            gravityprogress = (newsize - min2) / (max2 - min2)
            Gravity = math.clamp(minGravity + (gravityprogress * (maxGravity - minGravity)), maxGravity, minGravity)
            game.Workspace.Gravity = Gravity
      end
end)

nofalldamageTurn.MouseButton1Click:Connect(function()
      if functions.nofalldamageF == false then
            functions.nofalldamageF = true
            nofalldamegeinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            nofalldamageanim1 = tween:Create(nofalldamageTurn, nofalldamegeinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            nofalldamageanim1:Play()
            nofalldamageanim1.Completed:Connect(function()
                  nofalldamageTurn.BackgroundColor3 = Color3.new(0.133333, 1, 0)
            end)

            character = me.Character or me.CharacterAdded:Wait()
            if character and character:FindFirstChild("HumanoidRootPart") then
                  force = Instance.new("ForceField")
                  force.Parent = character
                  force.Visible = false
            end

            me.CharacterAdded:Connect(function(newChar)
                  if functions.nofalldamageF then
                        newForce = Instance.new("ForceField")
                        newForce.Parent = newChar
                        newForce.Visible = false
                  end
            end)
      elseif functions.nofalldamageF == true then
            functions.nofalldamageF = false
            nofalldamageinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            nofalldamageanim2 = tween:Create(nofalldamageTurn, nofalldamageinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            nofalldamageanim2:Play()
            nofalldamageanim2.Completed:Connect(function()
                  nofalldamageTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
            char2 = me.Character or me.CharacterAdded:Wait()
            forceField = char2:FindFirstChildOfClass("ForceField")
            if forceField then
                  forceField:Destroy()
            end
      end
end)
highlightTurn.MouseButton1Click:Connect(function()
      if functions.highlightF == false then
            functions.highlightF = true
            highlightinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            highlightanim1 = tween:Create(highlightTurn, highlightinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            highlightanim1:Play()
            highlightanim1.Completed:Connect(function()
                  highlightTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            highlightL()
      elseif functions.highlightF == true then
            functions.highlightF = false
            highlightinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            highlightanim2 = tween:Create(highlightTurn, highlightinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            highlightanim2:Play()
            highlightanim2.Completed:Connect(function()
                  highlightTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

infstaminaTurn.MouseButton1Click:Connect(function()
      if functions.infstaminaF == false then
            functions.infstaminaF = true
            infstaminainfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            infstaminaanim1 = tween:Create(infstaminaTurn, infstaminainfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            infstaminaanim1:Play()
            infstaminaanim1.Completed:Connect(function()
                  infstaminaTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            local succ, err = pcall(function()
                  infstaminaL()
            end)
            if not succ then
                  ConsoleText("Patched or your exploit not support", "error")
            end
      elseif functions.infstaminaF == true then
            functions.infstaminaF = false
            infstaminainfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            infstaminaanim2 = tween:Create(infstaminaTurn, infstaminainfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            infstaminaanim2:Play()
            infstaminaanim2.Completed:Connect(function()
                  infstaminaTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

aimbotTurn.MouseButton1Click:Connect(function()
      if functions.aimbotF == false then
            functions.aimbotF = true
            aimbotinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            aimbotanim1 = tween:Create(aimbotTurn, aimbotinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            aimbotanim1:Play()
            aimbotanim1.Completed:Connect(function()
                  aimbotTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            local succ, err = pcall(function()
                  aimbotL()
            end)
            if not succ then
                  ConsoleText("Patched or your exploit not support", "error")
            end
      elseif functions.aimbotF == true then
            functions.aimbotF = false
            aimbotinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            aimbotanim2 = tween:Create(aimbotTurn, aimbotinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            aimbotanim2:Play()
            aimbotanim2.Completed:Connect(function()
                  aimbotTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
            remotes.circle:Destroy()
            remotes.circle = nil
            remotes.circle_pos:Disconnect()
            remotes.circle_pos = nil
      end
end)

fastpickupTurn.MouseButton1Click:Connect(function()
      if functions.fast_pickupF == false then
            functions.fast_pickupF = true
            fastpickupinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            fastpickupanim1 = tween:Create(fastpickupTurn, fastpickupinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            fastpickupanim1:Play()
            fastpickupanim1.Completed:Connect(function()
                  fastpickupTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            fastpickupL()
      elseif functions.fast_pickupF == true then
            functions.fast_pickupF = false
            fastpickupinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            fastpickupanim2 = tween:Create(fastpickupTurn, fastpickupinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            fastpickupanim2:Play()
            fastpickupanim2.Completed:Connect(function()
                  fastpickupTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

lockpickTrun.MouseButton1Click:Connect(function()
      if functions.lockpickF == false then
            functions.lockpickF = true
            lockpickinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            lockpickanim1 = tween:Create(lockpickTrun, lockpickinfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            lockpickanim1:Play()
            lockpickanim1.Completed:Connect(function()
                  lockpickTrun.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            lockpickL()
      elseif functions.lockpickF == true then
            functions.lockpickF = false
            lockpickinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            lockpickanim2 = tween:Create(lockpickTrun, lockpickinfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            lockpickanim2:Play()
            lockpickanim2.Completed:Connect(function()
                  lockpickTrun.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

atmTurn.MouseButton1Click:Connect(function()
      if functions.atmF == false then
            functions.atmF = true
            atminfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            atmanim1 = tween:Create(atmTurn, atminfo1, {Position = UDim2.new(0.59, 0, 0.071, 0)})
            atmanim1:Play()
            atmanim1.Completed:Connect(function()
                  atmTurn.BackgroundColor3 = Color3.new(0.184314, 1, 0)
            end)
            local succ, err = pcall(function()
                  atmL(math.huge)
            end)
            if not succ then
                  ConsoleText("Patched or your exploit not support", "error")
            end
      elseif functions.atmF == true then
            functions.atmF = false
            atminfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            atmanim2 = tween:Create(atmTurn, atminfo2, {Position = UDim2.new(0.046, 0, 0.071, 0)})
            atmanim2:Play()
            atmanim2.Completed:Connect(function()
                  atmTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
      end
end)

commands.FocusLost:Connect(function()
      local succ, err = pcall(function()
            if commands.Text == "" then
                  return
            else
                  local commandFunc = Commands[commands.Text]
                  if commandFunc then
                        commandFunc()
                  else
                        ConsoleText("Command not found!", "error")
                  end
            end
            commands.Text = ""
      end)
      if not succ then
            ConsoleText("Error: function not support for your exploit", "error")
            commands.Text = ""
      end
end)

dragging = false
dragInput = nil
dragStart = nil
startPos = nil

function update(input)
      delta = input.Position - dragStart
      newPosition = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
      )

      local anim1 = tween:Create(dragg, TweenInfo.new(0.1), {Position = newPosition})
      anim1:Play()
end

dragg.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = dragg.Position

            input.Changed:Connect(function()
                  if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                  end
            end)
      end
end)

dragg.InputChanged:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
      end
end)

input.InputChanged:Connect(function(input)
      if dragging and input == dragInput then
            update(input)
      end
end)

input.InputBegan:Connect(function(key)
      if key.KeyCode == _G.Keybind then
            if dragg.Visible == true then
                  dragg.Visible = false
            else
                  dragg.Visible = true
            end
      end
end)

cfg1 = {
      Rotation = 360
}

uiguist.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0.0, Color3.new(1, 0, 0.0156863)),
      ColorSequenceKeypoint.new(0.2, Color3.new(0.933333, 0.0235294, 1)),
      ColorSequenceKeypoint.new(0.4, Color3.new(0, 0.0156863, 1)),
      ColorSequenceKeypoint.new(0.6, Color3.new(0.0666667, 1, 0)),
      ColorSequenceKeypoint.new(0.8, Color3.new(1, 0.933333, 0.00392157)),
      ColorSequenceKeypoint.new(1, Color3.new(0.00392157, 1, 0.933333))
})

uigb.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0.0, Color3.new(0.729412, 0.231373, 0)),
      ColorSequenceKeypoint.new(0.2, Color3.new(0.729412, 0.231373, 0)),
      ColorSequenceKeypoint.new(0.4, Color3.new(0.729412, 0.231373, 0)),
      ColorSequenceKeypoint.new(0.6, Color3.new(1, 1, 1)),
      ColorSequenceKeypoint.new(0.8, Color3.new(1, 1, 1)),
      ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
})

bittween = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 3 , true)
bittweenanim = tween:Create(uiguist, bittween, cfg1)
bittweenanim:Play()

bittweenanim.Completed:Connect(function()
      beta.TextColor3 = Color3.new(1, 1, 1)
      uitextinfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 3, true)
      uitextanim = tween:Create(uigb, uitextinfo, cfg1)
      uitextanim:Play()
      uiguist.Enabled = false
      uitextanim.Completed:Connect(function()
            beta.TextColor3 = Color3.new(0, 0, 0)
            uiguist.Enabled = true
            bittweenanim:Play()
      end)
end)

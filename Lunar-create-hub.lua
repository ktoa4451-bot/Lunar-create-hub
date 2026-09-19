--========================================
-- LUNAR CREATOR HUB V2
-- PART 1/3
-- UI + LOADER + DASHBOARD
--========================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

--========================================
-- THEME
--========================================

local Theme = {
    Background = Color3.fromRGB(6, 7, 18),
    Sidebar = Color3.fromRGB(9, 10, 25),
    Panel = Color3.fromRGB(13, 14, 34),
    Card = Color3.fromRGB(18, 18, 43),
    CardHover = Color3.fromRGB(28, 22, 60),

    Purple = Color3.fromRGB(126, 45, 255),
    Purple2 = Color3.fromRGB(173, 83, 255),
    Purple3 = Color3.fromRGB(207, 137, 255),

    Text = Color3.fromRGB(245, 242, 255),
    SubText = Color3.fromRGB(157, 151, 190),
    Muted = Color3.fromRGB(100, 95, 130),

    Stroke = Color3.fromRGB(71, 43, 130),
    Green = Color3.fromRGB(90, 230, 150)
}

--========================================
-- TWEEN
--========================================

local function Tween(Object, Time, Properties, Style, Direction)

    local Info = TweenInfo.new(
        Time or 0.25,
        Style or Enum.EasingStyle.Quart,
        Direction or Enum.EasingDirection.Out
    )

    local Animation = TweenService:Create(
        Object,
        Info,
        Properties
    )

    Animation:Play()

    return Animation
end

--========================================
-- GUI PARENT
--========================================

local GuiParent

pcall(function()
    if gethui then
        GuiParent = gethui()
    end
end)

if not GuiParent then
    GuiParent = game:GetService("CoreGui")
end

local OldGui = GuiParent:FindFirstChild("LunarCreatorHubV2")

if OldGui then
    OldGui:Destroy()
end

--========================================
-- SCREEN GUI
--========================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LunarCreatorHubV2"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = GuiParent

--========================================
-- LOADER
--========================================

local Loader = Instance.new("Frame")
Loader.Size = UDim2.fromScale(1, 1)
Loader.BackgroundColor3 = Theme.Background
Loader.BorderSizePixel = 0
Loader.Parent = ScreenGui

local LoaderLogo = Instance.new("TextLabel")
LoaderLogo.Size = UDim2.new(0, 100, 0, 80)
LoaderLogo.Position = UDim2.new(0.5, -50, 0.5, -120)
LoaderLogo.BackgroundTransparency = 1
LoaderLogo.Text = "🌙"
LoaderLogo.TextSize = 58
LoaderLogo.Font = Enum.Font.GothamBold
LoaderLogo.TextColor3 = Theme.Purple3
LoaderLogo.Parent = Loader

local LoaderTitle = Instance.new("TextLabel")
LoaderTitle.Size = UDim2.new(0, 500, 0, 45)
LoaderTitle.Position = UDim2.new(0.5, -250, 0.5, -42)
LoaderTitle.BackgroundTransparency = 1
LoaderTitle.Text = "Lunar Creator Hub"
LoaderTitle.TextSize = 28
LoaderTitle.Font = Enum.Font.GothamBold
LoaderTitle.TextColor3 = Theme.Text
LoaderTitle.Parent = Loader

local LoaderStatus = Instance.new("TextLabel")
LoaderStatus.Size = UDim2.new(0, 400, 0, 25)
LoaderStatus.Position = UDim2.new(0.5, -200, 0.5, 10)
LoaderStatus.BackgroundTransparency = 1
LoaderStatus.Text = "Initializing..."
LoaderStatus.TextSize = 12
LoaderStatus.Font = Enum.Font.Gotham
LoaderStatus.TextColor3 = Theme.SubText
LoaderStatus.Parent = Loader

local LoaderBarBG = Instance.new("Frame")
LoaderBarBG.Size = UDim2.new(0, 360, 0, 6)
LoaderBarBG.Position = UDim2.new(0.5, -180, 0.5, 52)
LoaderBarBG.BackgroundColor3 = Theme.Card
LoaderBarBG.BorderSizePixel = 0
LoaderBarBG.Parent = Loader

local LoaderBarBGCorner = Instance.new("UICorner")
LoaderBarBGCorner.CornerRadius = UDim.new(1, 0)
LoaderBarBGCorner.Parent = LoaderBarBG

local LoaderBar = Instance.new("Frame")
LoaderBar.Size = UDim2.new(0, 0, 1, 0)
LoaderBar.BackgroundColor3 = Theme.Purple
LoaderBar.BorderSizePixel = 0
LoaderBar.Parent = LoaderBarBG

local LoaderBarCorner = Instance.new("UICorner")
LoaderBarCorner.CornerRadius = UDim.new(1, 0)
LoaderBarCorner.Parent = LoaderBar

local LoaderGradient = Instance.new("UIGradient")
LoaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Theme.Purple),
    ColorSequenceKeypoint.new(1, Theme.Purple3)
})
LoaderGradient.Parent = LoaderBar

--========================================
-- MAIN WINDOW
--========================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 920, 0, 590)
Main.Position = UDim2.new(0.5, -460, 0.5, -295)
Main.BackgroundColor3 = Theme.Background
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Theme.Purple
MainStroke.Transparency = 0.35
MainStroke.Thickness = 1
MainStroke.Parent = Main

--========================================
-- SIDEBAR
--========================================

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 205, 1, 0)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 20)
SidebarCorner.Parent = Sidebar

local SidebarCover = Instance.new("Frame")
SidebarCover.Size = UDim2.new(0, 25, 1, 0)
SidebarCover.Position = UDim2.new(1, -25, 0, 0)
SidebarCover.BackgroundColor3 = Theme.Sidebar
SidebarCover.BorderSizePixel = 0
SidebarCover.Parent = Sidebar

--========================================
-- BRAND
--========================================

local BrandMoon = Instance.new("TextLabel")
BrandMoon.Size = UDim2.new(0, 55, 0, 60)
BrandMoon.Position = UDim2.new(0, 18, 0, 17)
BrandMoon.BackgroundTransparency = 1
BrandMoon.Text = "🌙"
BrandMoon.TextSize = 36
BrandMoon.Font = Enum.Font.GothamBold
BrandMoon.TextColor3 = Theme.Purple3
BrandMoon.Parent = Sidebar

local BrandTitle = Instance.new("TextLabel")
BrandTitle.Size = UDim2.new(0, 125, 0, 30)
BrandTitle.Position = UDim2.new(0, 76, 0, 19)
BrandTitle.BackgroundTransparency = 1
BrandTitle.Text = "Lunar"
BrandTitle.TextXAlignment = Enum.TextXAlignment.Left
BrandTitle.TextSize = 22
BrandTitle.Font = Enum.Font.GothamBold
BrandTitle.TextColor3 = Theme.Text
BrandTitle.Parent = Sidebar

local BrandSub = Instance.new("TextLabel")
BrandSub.Size = UDim2.new(0, 125, 0, 22)
BrandSub.Position = UDim2.new(0, 77, 0, 42)
BrandSub.BackgroundTransparency = 1
BrandSub.Text = "Creator Hub"
BrandSub.TextXAlignment = Enum.TextXAlignment.Left
BrandSub.TextSize = 13
BrandSub.Font = Enum.Font.GothamMedium
BrandSub.TextColor3 = Theme.Purple2
BrandSub.Parent = Sidebar

--========================================
-- NAVIGATION
--========================================

local Navigation = Instance.new("ScrollingFrame")
Navigation.Name = "Navigation"
Navigation.Size = UDim2.new(1, -20, 1, -155)
Navigation.Position = UDim2.new(0, 10, 0, 105)
Navigation.BackgroundTransparency = 1
Navigation.BorderSizePixel = 0
Navigation.ScrollBarThickness = 0
Navigation.CanvasSize = UDim2.new(0, 0, 0, 0)
Navigation.Parent = Sidebar

local NavigationLayout = Instance.new("UIListLayout")
NavigationLayout.Padding = UDim.new(0, 5)
NavigationLayout.SortOrder = Enum.SortOrder.LayoutOrder
NavigationLayout.Parent = Navigation

local Categories = {
    {"Dashboard", "⌂"},
    {"Creator Tools", "✦"},
    {"Build", "◇"},
    {"Testing", "▷"},
    {"Visuals", "◉"},
    {"Player", "●"},
    {"Server", "▣"},
    {"Utilities", "⚙"},
    {"Settings", "☷"}
}

local CategoryButtons = {}

--========================================
-- CATEGORY BUTTON
--========================================

local function CreateCategory(Name, Icon, Order)

    local Button = Instance.new("TextButton")
    Button.Name = Name
    Button.Size = UDim2.new(1, 0, 0, 48)
    Button.BackgroundColor3 = Theme.Sidebar
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.LayoutOrder = Order
    Button.Parent = Navigation

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Button

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Size = UDim2.new(0, 42, 1, 0)
    IconLabel.Position = UDim2.new(0, 8, 0, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = Icon
    IconLabel.TextSize = 21
    IconLabel.Font = Enum.Font.GothamMedium
    IconLabel.TextColor3 = Theme.SubText
    IconLabel.Parent = Button

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, -55, 1, 0)
    TextLabel.Position = UDim2.new(0, 52, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = Name
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextSize = 13
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.TextColor3 = Theme.SubText
    TextLabel.Parent = Button

    Button.MouseEnter:Connect(function()

        if not Button:GetAttribute("Selected") then

            Tween(Button, 0.15, {
                BackgroundColor3 = Theme.CardHover
            }):Play()

            Tween(IconLabel, 0.15, {
                TextColor3 = Theme.Purple2
            }):Play()
        end
    end)

    Button.MouseLeave:Connect(function()

        if not Button:GetAttribute("Selected") then

            Tween(Button, 0.15, {
                BackgroundColor3 = Theme.Sidebar
            }):Play()

            Tween(IconLabel, 0.15, {
                TextColor3 = Theme.SubText
            }):Play()
        end
    end)

    CategoryButtons[Name] = {
        Button = Button,
        Icon = IconLabel,
        Text = TextLabel
    }

    return Button
end

for Index, Data in ipairs(Categories) do
    CreateCategory(Data[1], Data[2], Index)
end

--========================================
-- SIDEBAR FOOTER
--========================================

local FooterMoon = Instance.new("TextLabel")
FooterMoon.Size = UDim2.new(0, 40, 0, 40)
FooterMoon.Position = UDim2.new(0, 18, 1, -62)
FooterMoon.BackgroundTransparency = 1
FooterMoon.Text = "🌙"
FooterMoon.TextSize = 24
FooterMoon.Font = Enum.Font.GothamBold
FooterMoon.TextColor3 = Theme.Purple2
FooterMoon.Parent = Sidebar

local FooterTitle = Instance.new("TextLabel")
FooterTitle.Size = UDim2.new(0, 130, 0, 22)
FooterTitle.Position = UDim2.new(0, 62, 1, -65)
FooterTitle.BackgroundTransparency = 1
FooterTitle.Text = "Lunar Creator Hub"
FooterTitle.TextXAlignment = Enum.TextXAlignment.Left
FooterTitle.TextSize = 11
FooterTitle.Font = Enum.Font.GothamMedium
FooterTitle.TextColor3 = Theme.SubText
FooterTitle.Parent = Sidebar

local FooterVersion = Instance.new("TextLabel")
FooterVersion.Size = UDim2.new(0, 100, 0, 18)
FooterVersion.Position = UDim2.new(0, 62, 1, -45)
FooterVersion.BackgroundTransparency = 1
FooterVersion.Text = "v2.0"
FooterVersion.TextXAlignment = Enum.TextXAlignment.Left
FooterVersion.TextSize = 10
FooterVersion.Font = Enum.Font.Gotham
FooterVersion.TextColor3 = Theme.Muted
FooterVersion.Parent = Sidebar

--========================================
-- CONTENT
--========================================

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -205, 1, 0)
Content.Position = UDim2.new(0, 205, 0, 0)
Content.BackgroundTransparency = 1
Content.Parent = Main

--========================================
-- TOP BAR
--========================================

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 72)
TopBar.BackgroundTransparency = 1
TopBar.Parent = Content

local TopDescription = Instance.new("TextLabel")
TopDescription.Size = UDim2.new(0, 320, 0, 45)
TopDescription.Position = UDim2.new(0, 28, 0, 17)
TopDescription.BackgroundTransparency = 1
TopDescription.Text = "Tools for Roblox creators\nand developers"
TopDescription.TextXAlignment = Enum.TextXAlignment.Left
TopDescription.TextSize = 13
TopDescription.Font = Enum.Font.Gotham
TopDescription.TextColor3 = Theme.SubText
TopDescription.Parent = TopBar

--========================================
-- STATUS PILLS
--========================================

local StatusContainer = Instance.new("Frame")
StatusContainer.Size = UDim2.new(0, 350, 0, 46)
StatusContainer.Position = UDim2.new(1, -450, 0, 13)
StatusContainer.BackgroundColor3 = Theme.Panel
StatusContainer.BorderSizePixel = 0
StatusContainer.Parent = TopBar

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 16)
StatusCorner.Parent = StatusContainer

local StatusStroke = Instance.new("UIStroke")
StatusStroke.Color = Theme.Stroke
StatusStroke.Transparency = 0.35
StatusStroke.Parent = StatusContainer

local function CreateStatus(Name, Icon, X)

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Size = UDim2.new(0, 28, 0, 30)
    IconLabel.Position = UDim2.new(0, X, 0, 8)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = Icon
    IconLabel.TextSize = 17
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.TextColor3 = Theme.Purple2
    IconLabel.Parent = StatusContainer

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(0, 55, 0, 17)
    NameLabel.Position = UDim2.new(0, X + 30, 0, 6)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = Name
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.TextSize = 9
    NameLabel.Font = Enum.Font.Gotham
    NameLabel.TextColor3 = Theme.SubText
    NameLabel.Parent = StatusContainer

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 65, 0, 19)
    ValueLabel.Position = UDim2.new(0, X + 30, 0, 21)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = "--"
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Left
    ValueLabel.TextSize = 12
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextColor3 = Theme.Text
    ValueLabel.Parent = StatusContainer

    return ValueLabel
end

local FPSValue = CreateStatus("FPS", "◉", 10)
local PingValue = CreateStatus("Ping", "◌", 125)
local TimeValue = CreateStatus("Time", "◷", 240)

--========================================
-- MINIMIZE
--========================================

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 36, 0, 36)
MinimizeButton.Position = UDim2.new(1, -88, 0, 18)
MinimizeButton.BackgroundColor3 = Theme.Panel
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = "—"
MinimizeButton.TextSize = 18
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextColor3 = Theme.Text
MinimizeButton.AutoButtonColor = false
MinimizeButton.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 11)
MinCorner.Parent = MinimizeButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 36, 0, 36)
CloseButton.Position = UDim2.new(1, -45, 0, 18)
CloseButton.BackgroundColor3 = Theme.Panel
CloseButton.BorderSizePixel = 0
CloseButton.Text = "×"
CloseButton.TextSize = 21
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Theme.Text
CloseButton.AutoButtonColor = false
CloseButton.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 11)
CloseCorner.Parent = CloseButton

--========================================
-- PAGE
--========================================

local Page = Instance.new("ScrollingFrame")
Page.Name = "Page"
Page.Size = UDim2.new(1, -30, 1, -82)
Page.Position = UDim2.new(0, 15, 0, 72)
Page.BackgroundTransparency = 1
Page.BorderSizePixel = 0
Page.ScrollBarThickness = 3
Page.ScrollBarImageColor3 = Theme.Purple
Page.CanvasSize = UDim2.new(0, 0, 0, 0)
Page.Parent = Content

local PageLayout = Instance.new("UIListLayout")
PageLayout.Padding = UDim.new(0, 14)
PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
PageLayout.Parent = Page

local PagePadding = Instance.new("UIPadding")
PagePadding.PaddingLeft = UDim.new(0, 4)
PagePadding.PaddingRight = UDim.new(0, 4)
PagePadding.PaddingBottom = UDim.new(0, 15)
PagePadding.Parent = Page

--========================================
-- WELCOME CARD
--========================================

local Welcome = Instance.new("Frame")
Welcome.Size = UDim2.new(1, -8, 0, 125)
Welcome.BackgroundColor3 = Theme.Panel
Welcome.BorderSizePixel = 0
Welcome.Parent = Page

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 17)
WelcomeCorner.Parent = Welcome

local WelcomeStroke = Instance.new("UIStroke")
WelcomeStroke.Color = Theme.Purple
WelcomeStroke.Transparency = 0.3
WelcomeStroke.Parent = Welcome

local WelcomeGradient = Instance.new("UIGradient")
WelcomeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Theme.Panel),
    ColorSequenceKeypoint.new(0.65, Color3.fromRGB(25, 17, 65)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(53, 18, 105))
})
WelcomeGradient.Rotation = 15
WelcomeGradient.Parent = Welcome

local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Size = UDim2.new(1, -180, 0, 36)
WelcomeTitle.Position = UDim2.new(0, 24, 0, 22)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "Welcome back! 👋"
WelcomeTitle.TextXAlignment = Enum.TextXAlignment.Left
WelcomeTitle.TextSize = 24
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.TextColor3 = Theme.Text
WelcomeTitle.Parent = Welcome

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, -190, 0, 30)
WelcomeText.Position = UDim2.new(0, 25, 0, 61)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Use the menu on the left to access all creator tools."
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
WelcomeText.TextSize = 12
WelcomeText.Font = Enum.Font.Gotham
WelcomeText.TextColor3 = Theme.SubText
WelcomeText.Parent = Welcome

local WelcomeMoon = Instance.new("TextLabel")
WelcomeMoon.Size = UDim2.new(0, 130, 0, 100)
WelcomeMoon.Position = UDim2.new(1, -145, 0, 12)
WelcomeMoon.BackgroundTransparency = 1
WelcomeMoon.Text = "🌙"
WelcomeMoon.TextSize = 72
WelcomeMoon.Font = Enum.Font.GothamBold
WelcomeMoon.TextColor3 = Theme.Purple2
WelcomeMoon.Parent = Welcome

--========================================
-- QUICK TOOLS TITLE
--========================================

local QuickTitle = Instance.new("TextLabel")
QuickTitle.Size = UDim2.new(1, -8, 0, 30)
QuickTitle.BackgroundTransparency = 1
QuickTitle.Text = "⚡  Quick Tools"
QuickTitle.TextXAlignment = Enum.TextXAlignment.Left
QuickTitle.TextSize = 17
QuickTitle.Font = Enum.Font.GothamBold
QuickTitle.TextColor3 = Theme.Text
QuickTitle.Parent = Page

--========================================
-- QUICK TOOLS GRID
--========================================

local QuickGrid = Instance.new("Frame")
QuickGrid.Size = UDim2.new(1, -8, 0, 82)
QuickGrid.BackgroundTransparency = 1
QuickGrid.Parent = Page

local QuickLayout = Instance.new("UIGridLayout")
QuickLayout.CellSize = UDim2.new(0.25, -8, 1, 0)
QuickLayout.CellPadding = UDim2.new(0, 10, 0, 0)
QuickLayout.SortOrder = Enum.SortOrder.LayoutOrder
QuickLayout.Parent = QuickGrid

local function CreateQuickTool(Name, Description, Icon)

    local Button = Instance.new("TextButton")
    Button.BackgroundColor3 = Theme.Card
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = QuickGrid

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 13)
    Corner.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Theme.Stroke
    Stroke.Transparency = 0.45
    Stroke.Parent = Button

    local IconBG = Instance.new("Frame")
    IconBG.Size = UDim2.new(0, 43, 0, 43)
    IconBG.Position = UDim2.new(0, 10, 0.5, -21)
    IconBG.BackgroundColor3 = Color3.fromRGB(45, 20, 90)
    IconBG.BorderSizePixel = 0
    IconBG.Parent = Button

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 11)
    IconCorner.Parent = IconBG

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Size = UDim2.fromScale(1, 1)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = Icon
    IconLabel.TextSize = 20
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.TextColor3 = Theme.Purple3
    IconLabel.Parent = IconBG

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -67, 0, 21)
    TitleLabel.Position = UDim2.new(0, 62, 0, 17)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = Name
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextSize = 11
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.Parent = Button

    local DescriptionLabel = Instance.new("TextLabel")
    DescriptionLabel.Size = UDim2.new(1, -67, 0, 18)
    DescriptionLabel.Position = UDim2.new(0, 62, 0, 38)
    DescriptionLabel.BackgroundTransparency = 1
    DescriptionLabel.Text = Description
    DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescriptionLabel.TextSize = 8
    DescriptionLabel.Font = Enum.Font.Gotham
    DescriptionLabel.TextColor3 = Theme.SubText
    DescriptionLabel.Parent = Button

    Button.MouseEnter:Connect(function()

        Tween(Button, 0.18, {
            BackgroundColor3 = Theme.CardHover
        }):Play()

        Tween(IconBG, 0.18, {
            BackgroundColor3 = Color3.fromRGB(68, 28, 130)
        }):Play()

        Tween(IconLabel, 0.18, {
            TextColor3 = Theme.Text
        }):Play()
    end)

    Button.MouseLeave:Connect(function()

        Tween(Button, 0.18, {
            BackgroundColor3 = Theme.Card
        }):Play()

        Tween(IconBG, 0.18, {
            BackgroundColor3 = Color3.fromRGB(45, 20, 90)
        }):Play()

        Tween(IconLabel, 0.18, {
            TextColor3 = Theme.Purple3
        }):Play()
    end)

    return Button
end

CreateQuickTool("FPS Counter", "Show current FPS", "◉")
CreateQuickTool("Ping Counter", "Show network ping", "◌")
CreateQuickTool("Coordinates", "Show position", "⌖")
CreateQuickTool("Clock", "Show current time", "◷")

--========================================
-- INFORMATION ROW
--========================================

local InfoRow = Instance.new("Frame")
InfoRow.Size = UDim2.new(1, -8, 0, 145)
InfoRow.BackgroundTransparency = 1
InfoRow.Parent = Page

local InfoLayout = Instance.new("UIGridLayout")
InfoLayout.CellSize = UDim2.new(0.5, -7, 1, 0)
InfoLayout.CellPadding = UDim2.new(0, 14, 0, 0)
InfoLayout.Parent = InfoRow

--========================================
-- INFO CARD
--========================================

local function CreateInfoPanel(TitleText, Icon)

    local Card = Instance.new("Frame")
    Card.BackgroundColor3 = Theme.Panel
    Card.BorderSizePixel = 0
    Card.Parent = InfoRow

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 15)
    Corner.Parent = Card

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Theme.Stroke
    Stroke.Transparency = 0.4
    Stroke.Parent = Card

    local Header = Instance.new("TextLabel")
    Header.Size = UDim2.new(1, -30, 0, 30)
    Header.Position = UDim2.new(0, 15, 0, 10)
    Header.BackgroundTransparency = 1
    Header.Text = Icon .. "   " .. TitleText
    Header.TextXAlignment = Enum.TextXAlignment.Left
    Header.TextSize = 14
    Header.Font = Enum.Font.GothamBold
    Header.TextColor3 = Theme.Text
    Header.Parent = Card

    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(1, -30, 0, 1)
    Line.Position = UDim2.new(0, 15, 0, 45)
    Line.BackgroundColor3 = Theme.Stroke
    Line.BorderSizePixel = 0
    Line.Parent = Card

    return Card
end

local ServerCard = CreateInfoPanel("Server Information", "▣")
local PlayerCard = CreateInfoPanel("Player Information", "●")

--========================================
-- SERVER DATA
--========================================

local function AddDataLabel(Parent, X, Y, Title, Value)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0, 100, 0, 18)
    TitleLabel.Position = UDim2.new(0, X, 0, Y)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = Title
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextSize = 9
    TitleLabel.Font = Enum.Font.Gotham
    TitleLabel.TextColor3 = Theme.SubText
    TitleLabel.Parent = Parent

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 135, 0, 20)
    ValueLabel.Position = UDim2.new(0, X, 0, Y + 16)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = Value
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Left
    ValueLabel.TextSize = 11
    ValueLabel.Font = Enum.Font.GothamMedium
    ValueLabel.TextColor3 = Theme.Text
    ValueLabel.Parent = Parent

    return ValueLabel
end

AddDataLabel(
    ServerCard,
    18,
    53,
    "Place ID",
    tostring(game.PlaceId)
)

local JobValue = AddDataLabel(
    ServerCard,
    190,
    53,
    "Job ID",
    string.sub(game.JobId, 1, 14) .. "..."
)

local PlayersValue = AddDataLabel(
    ServerCard,
    18,
    92,
    "Players",
    tostring(#Players:GetPlayers())
        .. " / "
        .. tostring(Players.MaxPlayers)
)

local ServerTimeValue = AddDataLabel(
    ServerCard,
    190,
    92,
    "Server Time",
    os.date("%H:%M:%S")
)

--========================================
-- PLAYER DATA
--========================================

AddDataLabel(
    PlayerCard,
    18,
    53,
    "Username",
    LocalPlayer.Name
)

AddDataLabel(
    PlayerCard,
    190,
    53,
    "User ID",
    tostring(LocalPlayer.UserId)
)

AddDataLabel(
    PlayerCard,
    18,
    92,
    "Display Name",
    LocalPlayer.DisplayName
)

AddDataLabel(
    PlayerCard,
    190,
    92,
    "Account Age",
    tostring(LocalPlayer.AccountAge) .. " days"
)

--========================================
-- RECENT UPDATES
--========================================

local Updates = Instance.new("Frame")
Updates.Size = UDim2.new(0.62, -8, 0, 145)
Updates.BackgroundColor3 = Theme.Panel
Updates.BorderSizePixel = 0
Updates.Parent = Page

local UpdatesCorner = Instance.new("UICorner")
UpdatesCorner.CornerRadius = UDim.new(0, 15)
UpdatesCorner.Parent = Updates

local UpdatesStroke = Instance.new("UIStroke")
UpdatesStroke.Color = Theme.Stroke
UpdatesStroke.Transparency = 0.4
UpdatesStroke.Parent = Updates

local UpdatesTitle = Instance.new("TextLabel")
UpdatesTitle.Size = UDim2.new(1, -30, 0, 30)
UpdatesTitle.Position = UDim2.new(0, 15, 0, 10)
UpdatesTitle.BackgroundTransparency = 1
UpdatesTitle.Text = "◈   Recent Updates"
UpdatesTitle.TextXAlignment = Enum.TextXAlignment.Left
UpdatesTitle.TextSize = 14
UpdatesTitle.Font = Enum.Font.GothamBold
UpdatesTitle.TextColor3 = Theme.Text
UpdatesTitle.Parent = Updates

local UpdateLine = Instance.new("Frame")
UpdateLine.Size = UDim2.new(1, -30, 0, 1)
UpdateLine.Position = UDim2.new(0, 15, 0, 43)
UpdateLine.BackgroundColor3 = Theme.Stroke
UpdateLine.BorderSizePixel = 0
UpdateLine.Parent = Updates

local UpdateData = {
    {"v2.0", "New Creator Hub interface"},
    {"v1.5", "Creator utilities updated"},
    {"v1.2", "Improved animations"},
    {"v1.0", "Initial Creator Hub release"}
}

for Index, Data in ipairs(UpdateData) do

    local Y = 49 + ((Index - 1) * 23)

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 7, 0, 7)
    Dot.Position = UDim2.new(0, 17, 0, Y + 5)
    Dot.BackgroundColor3 = Theme.Purple2
    Dot.BorderSizePixel = 0
    Dot.Parent = Updates

    local DotCorner = Instance.new("UICorner")
    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = Dot

    local VersionLabel = Instance.new("TextLabel")
    VersionLabel.Size = UDim2.new(0, 50, 0, 18)
    VersionLabel.Position = UDim2.new(0, 32, 0, Y)
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Text = Data[1]
    VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
    VersionLabel.TextSize = 9
    VersionLabel.Font = Enum.Font.GothamBold
    VersionLabel.TextColor3 = Theme.Text
    VersionLabel.Parent = Updates

    local DescriptionLabel = Instance.new("TextLabel")
    DescriptionLabel.Size = UDim2.new(1, -95, 0, 18)
    DescriptionLabel.Position = UDim2.new(0, 82, 0, Y)
    DescriptionLabel.BackgroundTransparency = 1
    DescriptionLabel.Text = Data[2]
    DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescriptionLabel.TextSize = 9
    DescriptionLabel.Font = Enum.Font.Gotham
    DescriptionLabel.TextColor3 = Theme.SubText
    DescriptionLabel.Parent = Updates
end

--========================================
-- START CREATING
--========================================

local StartCard = Instance.new("Frame")
StartCard.Size = UDim2.new(0.38, -6, 0, 145)
StartCard.BackgroundColor3 = Color3.fromRGB(38, 16, 75)
StartCard.BorderSizePixel = 0
StartCard.Parent = Page

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 15)
StartCorner.Parent = StartCard

local StartGradient = Instance.new("UIGradient")
StartGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 14, 65)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(83, 20, 150))
})
StartGradient.Rotation = 20
StartGradient.Parent = StartCard

local StartIcon = Instance.new("TextLabel")
StartIcon.Size = UDim2.new(0, 45, 0, 35)
StartIcon.Position = UDim2.new(0, 18, 0, 13)
StartIcon.BackgroundTransparency = 1
StartIcon.Text = "✦"
StartIcon.TextSize = 27
StartIcon.Font = Enum.Font.GothamBold
StartIcon.TextColor3 = Theme.Purple3
StartIcon.Parent = StartCard

local StartTitle = Instance.new("TextLabel")
StartTitle.Size = UDim2.new(1, -25, 0, 28)
StartTitle.Position = UDim2.new(0, 18, 0, 43)
StartTitle.BackgroundTransparency = 1
StartTitle.Text = "Start Creating"
StartTitle.TextXAlignment = Enum.TextXAlignment.Left
StartTitle.TextSize = 18
StartTitle.Font = Enum.Font.GothamBold
StartTitle.TextColor3 = Theme.Text
StartTitle.Parent = StartCard

local StartDescription = Instance.new("TextLabel")
StartDescription.Size = UDim2.new(1, -30, 0, 30)
StartDescription.Position = UDim2.new(0, 18, 0, 70)
StartDescription.BackgroundTransparency = 1
StartDescription.Text = "Build, test and customize\nyour Roblox experience."
StartDescription.TextXAlignment = Enum.TextXAlignment.Left
StartDescription.TextSize = 9
StartDescription.Font = Enum.Font.Gotham
StartDescription.TextColor3 = Theme.SubText
StartDescription.Parent = StartCard

local ExploreButton = Instance.new("TextButton")
ExploreButton.Size = UDim2.new(1, -36, 0, 28)
ExploreButton.Position = UDim2.new(0, 18, 1, -38)
ExploreButton.BackgroundColor3 = Theme.Purple
ExploreButton.BorderSizePixel = 0
ExploreButton.Text = "Explore Tools   →"
ExploreButton.TextSize = 10
ExploreButton.Font = Enum.Font.GothamBold
ExploreButton.TextColor3 = Theme.Text
ExploreButton.AutoButtonColor = false
ExploreButton.Parent = StartCard

local ExploreCorner = Instance.new("UICorner")
ExploreCorner.CornerRadius = UDim.new(0, 9)
ExploreCorner.Parent = ExploreButton

ExploreButton.MouseEnter:Connect(function()

    Tween(ExploreButton, 0.18, {
        BackgroundColor3 = Theme.Purple2
    }):Play()
end)

ExploreButton.MouseLeave:Connect(function()

    Tween(ExploreButton, 0.18, {
        BackgroundColor3 = Theme.Purple
    }):Play()
end)

--========================================
-- PAGE SIZE
--========================================

PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

    Page.CanvasSize = UDim2.new(
        0,
        0,
        0,
        PageLayout.AbsoluteContentSize.Y + 25
    )
end)

--========================================
-- DRAG SYSTEM
--========================================

local Dragging = false
local DragStart
local StartPosition

TopBar.InputBegan:Connect(function(Input)

    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = Input.Position
        StartPosition = Main.Position

        Input.Changed:Connect(function()

            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(Input)

    if not Dragging then
        return
    end

    if Input.UserInputType == Enum.UserInputType.MouseMovement
        or Input.UserInputType == Enum.UserInputType.Touch then

        local Delta = Input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
    end
end)

--========================================
-- STATUS UPDATE
--========================================

local FrameCounter = 0
local LastFPSUpdate = tick()

RunService.RenderStepped:Connect(function()

    FrameCounter += 1

    local Now = tick()

    if Now - LastFPSUpdate >= 1 then

        FPSValue.Text = tostring(FrameCounter)

        FrameCounter = 0
        LastFPSUpdate = Now

        local Success, Ping = pcall(function()
            return LocalPlayer:GetNetworkPing() * 1000
        end)

        if Success then
            PingValue.Text = math.floor(Ping) .. " ms"
        end

        TimeValue.Text = os.date("%H:%M")
        ServerTimeValue.Text = os.date("%H:%M:%S")
    end
end)

--========================================
-- CLOSE ANIMATION
--========================================

CloseButton.MouseEnter:Connect(function()

    Tween(CloseButton, 0.15, {
        BackgroundColor3 = Color3.fromRGB(105, 35, 70)
    }):Play()
end)

CloseButton.MouseLeave:Connect(function()

    Tween(CloseButton, 0.15, {
        BackgroundColor3 = Theme.Panel
    }):Play()
end)

CloseButton.MouseButton1Click:Connect(function()

    Tween(Main, 0.35, {
        Size = UDim2.new(0, 850, 0, 540),
        Position = UDim2.new(0.5, -425, 0.5, -270),
        BackgroundTransparency = 1
    }):Play()

    task.wait(0.35)

    ScreenGui:Destroy()
end)

--========================================
-- LOADER
--========================================

task.spawn(function()

    local Steps = {
        {"Loading Creator Hub...", 0.22},
        {"Preparing interface...", 0.45},
        {"Loading creator tools...", 0.68},
        {"Preparing dashboard...", 0.86},
        {"Ready!", 1}
    }

    for _, Step in ipairs(Steps) do

        LoaderStatus.Text = Step[1]

        Tween(LoaderBar, 0.35, {
            Size = UDim2.new(Step[2], 0, 1, 0)
        }):Play()

        task.wait(0.38)
    end

    task.wait(0.25)

    Main.Visible = true
    Main.BackgroundTransparency = 1
    Main.Size = UDim2.new(0, 850, 0, 540)
    Main.Position = UDim2.new(0.5, -425, 0.5, -270)

    Tween(Main, 0.45, {
        Size = UDim2.new(0, 920, 0, 590),
        Position = UDim2.new(0.5, -460, 0.5, -295),
        BackgroundTransparency = 0
    }):Play()

    Tween(Loader, 0.35, {
        BackgroundTransparency = 1
    }):Play()

    task.wait(0.35)

    Loader:Destroy()

    local Dashboard = CategoryButtons["Dashboard"]

    Dashboard.Button:SetAttribute("Selected", true)
    Dashboard.Button.BackgroundColor3 = Theme.Purple
    Dashboard.Icon.TextColor3 = Theme.Text
    Dashboard.Text.TextColor3 = Theme.Text
end)

--========================================
-- FINAL
--========================================

print("========================================")
print("Lunar Creator Hub V2")
print("PART 1/3 loaded")
print("Dashboard UI ready")
print("========================================")

--========================================
-- LUNAR CREATOR HUB V2
-- PART 2/3
-- CREATOR TOOLS + BUILD + TESTING
--========================================

--========================================
-- CREATOR STATE
--========================================

local CreatorState = {
    AutoRefresh = false,
    ShowCoordinates = true,
    ShowPlayerInfo = true,
    ShowServerInfo = true,

    TestMode = false,
    FPSDisplay = true,
    PingDisplay = true,
    ClockDisplay = true,

    HitboxPreview = false,
    SpawnPreview = false,
    GridPreview = false,

    AnchorParts = false,
    CanCollidePreview = false,

    DarkMode = true,
    CompactMode = false
}

--========================================
-- PAGE HELPERS
--========================================

local function ClearPage()
    for _, child in ipairs(Page:GetChildren()) do
        if not child:IsA("UIListLayout")
        and not child:IsA("UIPadding") then
            child:Destroy()
        end
    end
end

local function CreateSectionTitle(text, description)
    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, 0, 0, 58)
    Holder.BackgroundTransparency = 1
    Holder.Parent = Page

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 28)
    Title.BackgroundTransparency = 1
    Title.Text = text
    Title.TextColor3 = Theme.Text
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Holder

    local Desc = Instance.new("TextLabel")
    Desc.Position = UDim2.new(0, 0, 0, 30)
    Desc.Size = UDim2.new(1, 0, 0, 22)
    Desc.BackgroundTransparency = 1
    Desc.Text = description or ""
    Desc.TextColor3 = Theme.SubText
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 12
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Holder

    return Holder
end

--========================================
-- TOGGLE CREATOR
--========================================

local function CreateCreatorToggle(parent, title, description, stateName, callback)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, 0, 0, 64)
    Card.BackgroundColor3 = Theme.Card
    Card.BorderSizePixel = 0
    Card.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Card

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Theme.Stroke
    Stroke.Transparency = 0.45
    Stroke.Parent = Card

    local Title = Instance.new("TextLabel")
    Title.Position = UDim2.new(0, 16, 0, 10)
    Title.Size = UDim2.new(1, -90, 0, 22)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = Theme.Text
    Title.Font = Enum.Font.GothamSemibold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Card

    local Desc = Instance.new("TextLabel")
    Desc.Position = UDim2.new(0, 16, 0, 33)
    Desc.Size = UDim2.new(1, -90, 0, 18)
    Desc.BackgroundTransparency = 1
    Desc.Text = description or ""
    Desc.TextColor3 = Theme.SubText
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 11
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Card

    local Toggle = Instance.new("TextButton")
    Toggle.Position = UDim2.new(1, -58, 0.5, -13)
    Toggle.Size = UDim2.new(0, 42, 0, 26)
    Toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    Toggle.Text = ""
    Toggle.AutoButtonColor = false
    Toggle.Parent = Card

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = Toggle

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 20, 0, 20)
    Knob.Position = UDim2.new(0, 3, 0.5, -10)
    Knob.BackgroundColor3 = Theme.Text
    Knob.BorderSizePixel = 0
    Knob.Parent = Toggle

    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob

    local function Update()
        local Enabled = CreatorState[stateName]

        Tween(Toggle, {
            BackgroundColor3 = Enabled and Theme.Purple or Color3.fromRGB(45, 45, 65)
        }, 0.18)

        Tween(Knob, {
            Position = Enabled
                and UDim2.new(1, -23, 0.5, -10)
                or UDim2.new(0, 3, 0.5, -10)
        }, 0.18)
    end

    Toggle.MouseButton1Click:Connect(function()
        CreatorState[stateName] = not CreatorState[stateName]

        Update()

        if callback then
            callback(CreatorState[stateName])
        end
    end)

    Card.MouseEnter:Connect(function()
        Tween(Card, {
            BackgroundColor3 = Theme.CardHover
        }, 0.15)
    end)

    Card.MouseLeave:Connect(function()
        Tween(Card, {
            BackgroundColor3 = Theme.Card
        }, 0.15)
    end)

    Update()

    return Card
end

--========================================
-- ACTION BUTTON
--========================================

local function CreateActionButton(parent, title, description, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 62)
    Button.BackgroundColor3 = Theme.Card
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Theme.Stroke
    Stroke.Transparency = 0.45
    Stroke.Parent = Button

    local Title = Instance.new("TextLabel")
    Title.Position = UDim2.new(0, 16, 0, 10)
    Title.Size = UDim2.new(1, -32, 0, 22)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = Theme.Text
    Title.Font = Enum.Font.GothamSemibold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Button

    local Desc = Instance.new("TextLabel")
    Desc.Position = UDim2.new(0, 16, 0, 34)
    Desc.Size = UDim2.new(1, -32, 0, 18)
    Desc.BackgroundTransparency = 1
    Desc.Text = description or ""
    Desc.TextColor3 = Theme.SubText
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 11
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Button

    Button.MouseEnter:Connect(function()
        Tween(Button, {
            BackgroundColor3 = Theme.CardHover
        }, 0.15)

        Tween(Stroke, {
            Color = Theme.Purple2,
            Transparency = 0.15
        }, 0.15)
    end)

    Button.MouseLeave:Connect(function()
        Tween(Button, {
            BackgroundColor3 = Theme.Card
        }, 0.15)

        Tween(Stroke, {
            Color = Theme.Stroke,
            Transparency = 0.45
        }, 0.15)
    end)

    Button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return Button
end

--========================================
-- INFO CARD
--========================================

local function CreateCreatorInfo(parent, title, value)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(0.5, -6, 0, 72)
    Card.BackgroundColor3 = Theme.Card
    Card.BorderSizePixel = 0
    Card.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Card

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Theme.Stroke
    Stroke.Transparency = 0.5
    Stroke.Parent = Card

    local Title = Instance.new("TextLabel")
    Title.Position = UDim2.new(0, 14, 0, 10)
    Title.Size = UDim2.new(1, -28, 0, 18)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = Theme.SubText
    Title.Font = Enum.Font.Gotham
    Title.TextSize = 11
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Card

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Position = UDim2.new(0, 14, 0, 31)
    ValueLabel.Size = UDim2.new(1, -28, 0, 28)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = value
    ValueLabel.TextColor3 = Theme.Text
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 15
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Left
    ValueLabel.Parent = Card

    return Card, ValueLabel
end

--========================================
-- CREATOR TOOLS PAGE
--========================================

local function BuildCreatorToolsPage()
    ClearPage()

    CreateSectionTitle(
        "Creator Tools",
        "Useful local tools for developing and testing your experience."
    )

    local Grid = Instance.new("Frame")
    Grid.Size = UDim2.new(1, 0, 0, 132)
    Grid.BackgroundTransparency = 1
    Grid.Parent = Page

    local Layout = Instance.new("UIGridLayout")
    Layout.CellSize = UDim2.new(0.5, -6, 0, 60)
    Layout.CellPadding = UDim2.new(0, 12, 0, 12)
    Layout.Parent = Grid

    CreateActionButton(
        Grid,
        "Copy Position",
        "Copy your current coordinates when supported.",
        function()
            local Character = LocalPlayer.Character
            local Root = Character and Character:FindFirstChild("HumanoidRootPart")

            if Root then
                local Position = Root.Position
                local Text = string.format(
                    "%.2f, %.2f, %.2f",
                    Position.X,
                    Position.Y,
                    Position.Z
                )

                if setclipboard then
                    pcall(function()
                        setclipboard(Text)
                    end)
                end
            end
        end
    )

    CreateActionButton(
        Grid,
        "Refresh Information",
        "Refresh player and server information.",
        function()
            if BuildCreatorToolsPage then
                Tween(Page, {
                    CanvasPosition = Vector2.new(0, 0)
                }, 0.25)
            end
        end
    )

    CreateActionButton(
        Grid,
        "Reset Camera",
        "Return the camera to the local character.",
        function()
            local Camera = workspace.CurrentCamera
            local Character = LocalPlayer.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

            if Camera and Humanoid then
                Camera.CameraSubject = Humanoid
            end
        end
    )

    CreateActionButton(
        Grid,
        "Rejoin Session",
        "Reload the current experience session.",
        function()
            local TeleportService = game:GetService("TeleportService")

            pcall(function()
                TeleportService:Teleport(
                    game.PlaceId,
                    LocalPlayer
                )
            end)
        end
    )

    local ToolsList = Instance.new("Frame")
    ToolsList.Size = UDim2.new(1, 0, 0, 200)
    ToolsList.BackgroundTransparency = 1
    ToolsList.Parent = Page

    local ToolsLayout = Instance.new("UIListLayout")
    ToolsLayout.Padding = UDim.new(0, 8)
    ToolsLayout.Parent = ToolsList

    CreateCreatorToggle(
        ToolsList,
        "Coordinate Display",
        "Keep your current position available in the dashboard.",
        "ShowCoordinates"
    )

    CreateCreatorToggle(
        ToolsList,
        "Player Information",
        "Display local player development information.",
        "ShowPlayerInfo"
    )

    CreateCreatorToggle(
        ToolsList,
        "Server Information",
        "Display server and place information.",
        "ShowServerInfo"
    )

    CreateCreatorToggle(
        ToolsList,
        "Auto Refresh",
        "Automatically refresh creator information.",
        "AutoRefresh"
    )
end

--========================================
-- BUILD PAGE
--========================================

local function BuildBuildPage()
    ClearPage()

    CreateSectionTitle(
        "Build",
        "Local building helpers and development previews."
    )

    local BuildList = Instance.new("Frame")
    BuildList.Size = UDim2.new(1, 0, 0, 330)
    BuildList.BackgroundTransparency = 1
    BuildList.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.Parent = BuildList

    CreateCreatorToggle(
        BuildList,
        "Grid Preview",
        "Show a visual grid around the workspace origin.",
        "GridPreview",
        function(Enabled)
            local Existing = workspace:FindFirstChild("LunarCreatorGrid")

            if not Enabled then
                if Existing then
                    Existing:Destroy()
                end
                return
            end

            if Existing then
                return
            end

            local Folder = Instance.new("Folder")
            Folder.Name = "LunarCreatorGrid"
            Folder.Parent = workspace

            local Size = 100
            local Step = 10

            for X = -Size, Size, Step do
                local Part = Instance.new("Part")
                Part.Name = "GridX"
                Part.Anchored = true
                Part.CanCollide = false
                Part.CanQuery = false
                Part.CanTouch = false
                Part.Transparency = 0.8
                Part.Size = Vector3.new(0.08, 0.05, Size * 2)
                Part.Position = Vector3.new(X, 0, 0)
                Part.Color = Theme.Purple
                Part.Material = Enum.Material.Neon
                Part.Parent = Folder
            end

            for Z = -Size, Size, Step do
                local Part = Instance.new("Part")
                Part.Name = "GridZ"
                Part.Anchored = true
                Part.CanCollide = false
                Part.CanQuery = false
                Part.CanTouch = false
                Part.Transparency = 0.8
                Part.Size = Vector3.new(Size * 2, 0.05, 0.08)
                Part.Position = Vector3.new(0, 0, Z)
                Part.Color = Theme.Purple
                Part.Material = Enum.Material.Neon
                Part.Parent = Folder
            end
        end
    )

    CreateCreatorToggle(
        BuildList,
        "Spawn Preview",
        "Highlight the default spawn locations.",
        "SpawnPreview",
        function(Enabled)
            for _, Object in ipairs(workspace:GetDescendants()) do
                if Object:IsA("SpawnLocation") then
                    if Enabled then
                        Object.Color = Theme.Purple
                        Object.Material = Enum.Material.Neon
                    else
                        Object.Material = Enum.Material.Plastic
                    end
                end
            end
        end
    )

    CreateCreatorToggle(
        BuildList,
        "Anchor Preview",
        "Show which parts are currently anchored.",
        "AnchorParts",
        function(Enabled)
            for _, Object in ipairs(workspace:GetDescendants()) do
                if Object:IsA("BasePart") then
                    if Enabled then
                        Object.LocalTransparencyModifier = Object.Anchored and 0.15 or 0
                    else
                        Object.LocalTransparencyModifier = 0
                    end
                end
            end
        end
    )

    CreateCreatorToggle(
        BuildList,
        "Collision Preview",
        "Highlight parts that have collisions enabled.",
        "CanCollidePreview",
        function(Enabled)
            for _, Object in ipairs(workspace:GetDescendants()) do
                if Object:IsA("BasePart") then
                    if Enabled then
                        Object.LocalTransparencyModifier = Object.CanCollide and 0.2 or 0.75
                    else
                        Object.LocalTransparencyModifier = 0
                    end
                end
            end
        end
    )

    CreateActionButton(
        BuildList,
        "Clean Build Previews",
        "Remove all Lunar development preview objects.",
        function()
            local Grid = workspace:FindFirstChild("LunarCreatorGrid")

            if Grid then
                Grid:Destroy()
            end

            CreatorState.GridPreview = false
            CreatorState.SpawnPreview = false
            CreatorState.AnchorParts = false
            CreatorState.CanCollidePreview = false

            for _, Object in ipairs(workspace:GetDescendants()) do
                if Object:IsA("BasePart") then
                    Object.LocalTransparencyModifier = 0
                end
            end
        end
    )
end

--========================================
-- TESTING PAGE
--========================================

local function BuildTestingPage()
    ClearPage()

    CreateSectionTitle(
        "Testing",
        "Developer-focused local testing controls."
    )

    local TestList = Instance.new("Frame")
    TestList.Size = UDim2.new(1, 0, 0, 350)
    TestList.BackgroundTransparency = 1
    TestList.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.Parent = TestList

    CreateCreatorToggle(
        TestList,
        "Test Mode",
        "Enable the local Creator Hub testing state.",
        "TestMode",
        function(Enabled)
            if Enabled then
                print("[Lunar Creator Hub] Test Mode enabled")
            else
                print("[Lunar Creator Hub] Test Mode disabled")
            end
        end
    )

    CreateCreatorToggle(
        TestList,
        "Hitbox Preview",
        "Show a visual preview around the local character.",
        "HitboxPreview",
        function(Enabled)
            local Character = LocalPlayer.Character

            if not Character then
                return
            end

            local Existing = Character:FindFirstChild("LunarHitboxPreview")

            if not Enabled then
                if Existing then
                    Existing:Destroy()
                end
                return
            end

            if Existing then
                return
            end

            local Root = Character:FindFirstChild("HumanoidRootPart")

            if Root then
                local Box = Instance.new("BoxHandleAdornment")
                Box.Name = "LunarHitboxPreview"
                Box.Adornee = Root
                Box.Size = Vector3.new(4, 6, 2)
                Box.Transparency = 0.65
                Box.Color3 = Theme.Purple2
                Box.AlwaysOnTop = true
                Box.ZIndex = 5
                Box.Parent = Character
            end
        end
    )

    CreateCreatorToggle(
        TestList,
        "FPS Display",
        "Show the current frame rate in the top status bar.",
        "FPSDisplay"
    )

    CreateCreatorToggle(
        TestList,
        "Ping Display",
        "Show the current network latency in the top status bar.",
        "PingDisplay"
    )

    CreateCreatorToggle(
        TestList,
        "Clock Display",
        "Show the current local time in the top status bar.",
        "ClockDisplay"
    )

    CreateActionButton(
        TestList,
        "Print Character Debug",
        "Print basic character information to the console.",
        function()
            local Character = LocalPlayer.Character

            if not Character then
                warn("[Lunar Creator Hub] Character unavailable")
                return
            end

            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            local Root = Character:FindFirstChild("HumanoidRootPart")

            print("========================================")
            print("Lunar Character Debug")
            print("Character:", Character.Name)
            print("Humanoid:", Humanoid and Humanoid.Name or "Missing")
            print("Root:", Root and Root.Name or "Missing")

            if Root then
                print("Position:", Root.Position)
            end

            print("========================================")
        end
    )

    CreateActionButton(
        TestList,
        "Print Workspace Debug",
        "Print useful workspace information to the console.",
        function()
            print("========================================")
            print("Lunar Workspace Debug")
            print("PlaceId:", game.PlaceId)
            print("JobId:", game.JobId)
            print("Gravity:", workspace.Gravity)
            print("Camera:", workspace.CurrentCamera)
            print("========================================")
        end
    )
end

--========================================
-- VISUALS PAGE
--========================================

local function BuildVisualsPage()
    ClearPage()

    CreateSectionTitle(
        "Visuals",
        "Local visual overlays and development indicators."
    )

    local VisualList = Instance.new("Frame")
    VisualList.Size = UDim2.new(1, 0, 0, 280)
    VisualList.BackgroundTransparency = 1
    VisualList.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.Parent = VisualList

    CreateCreatorToggle(
        VisualList,
        "FPS Counter",
        "Show FPS information in the Creator Hub.",
        "FPSDisplay"
    )

    CreateCreatorToggle(
        VisualList,
        "Ping Counter",
        "Show network latency information.",
        "PingDisplay"
    )

    CreateCreatorToggle(
        VisualList,
        "Clock",
        "Show the local clock.",
        "ClockDisplay"
    )

    CreateCreatorToggle(
        VisualList,
        "Coordinates",
        "Keep position information visible.",
        "ShowCoordinates"
    )

    CreateCreatorToggle(
        VisualList,
        "Player Info",
        "Keep player information visible.",
        "ShowPlayerInfo"
    )
end

--========================================
-- PLAYER PAGE
--========================================

local function BuildPlayerPage()
    ClearPage()

    CreateSectionTitle(
        "Player",
        "Information about the local player and character."
    )

    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")

    local Grid = Instance.new("Frame")
    Grid.Size = UDim2.new(1, 0, 0, 150)
    Grid.BackgroundTransparency = 1
    Grid.Parent = Page

    local GridLayout = Instance.new("UIGridLayout")
    GridLayout.CellSize = UDim2.new(0.5, -6, 0, 70)
    GridLayout.CellPadding = UDim2.new(0, 12, 0, 10)
    GridLayout.Parent = Grid

    CreateCreatorInfo(
        Grid,
        "Username",
        LocalPlayer.Name
    )

    CreateCreatorInfo(
        Grid,
        "Display Name",
        LocalPlayer.DisplayName
    )

    CreateCreatorInfo(
        Grid,
        "User ID",
        tostring(LocalPlayer.UserId)
    )

    CreateCreatorInfo(
        Grid,
        "Health",
        Humanoid and string.format(
            "%.0f / %.0f",
            Humanoid.Health,
            Humanoid.MaxHealth
        ) or "Unavailable"
    )

    if Root then
        local Position = Root.Position

        CreateCreatorInfo(
            Page,
            "Coordinates",
            string.format(
                "X %.2f   Y %.2f   Z %.2f",
                Position.X,
                Position.Y,
                Position.Z
            )
        )
    end

    CreateActionButton(
        Page,
        "Refresh Character",
        "Refresh the local character information.",
        function()
            BuildPlayerPage()
        end
    )
end

--========================================
-- SERVER PAGE
--========================================

local function BuildServerPage()
    ClearPage()

    CreateSectionTitle(
        "Server",
        "Current experience and server information."
    )

    local Grid = Instance.new("Frame")
    Grid.Size = UDim2.new(1, 0, 0, 220)
    Grid.BackgroundTransparency = 1
    Grid.Parent = Page

    local Layout = Instance.new("UIGridLayout")
    Layout.CellSize = UDim2.new(0.5, -6, 0, 70)
    Layout.CellPadding = UDim2.new(0, 12, 0, 10)
    Layout.Parent = Grid

    CreateCreatorInfo(
        Grid,
        "Place ID",
        tostring(game.PlaceId)
    )

    CreateCreatorInfo(
        Grid,
        "Players",
        tostring(#Players:GetPlayers())
    )

    CreateCreatorInfo(
        Grid,
        "Max Players",
        tostring(Players.MaxPlayers)
    )

    CreateCreatorInfo(
        Grid,
        "Job ID",
        string.sub(game.JobId, 1, 16)
    )

    CreateCreatorInfo(
        Grid,
        "Workspace Gravity",
        tostring(workspace.Gravity)
    )

    CreateCreatorInfo(
        Grid,
        "Creator",
        tostring(game.CreatorId)
    )

    CreateActionButton(
        Page,
        "Refresh Server",
        "Refresh the current server information.",
        function()
            BuildServerPage()
        end
    )
end

--========================================
-- UTILITIES PAGE
--========================================

local function BuildUtilitiesPage()
    ClearPage()

    CreateSectionTitle(
        "Utilities",
        "Small tools for everyday creator workflows."
    )

    local UtilityList = Instance.new("Frame")
    UtilityList.Size = UDim2.new(1, 0, 0, 330)
    UtilityList.BackgroundTransparency = 1
    UtilityList.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.Parent = UtilityList

    CreateActionButton(
        UtilityList,
        "Copy Place ID",
        "Copy the current experience PlaceId.",
        function()
            if setclipboard then
                pcall(function()
                    setclipboard(tostring(game.PlaceId))
                end)
            end
        end
    )

    CreateActionButton(
        UtilityList,
        "Copy Job ID",
        "Copy the current server JobId.",
        function()
            if setclipboard then
                pcall(function()
                    setclipboard(game.JobId)
                end)
            end
        end
    )

    CreateActionButton(
        UtilityList,
        "Copy Username",
        "Copy the local player's username.",
        function()
            if setclipboard then
                pcall(function()
                    setclipboard(LocalPlayer.Name)
                end)
            end
        end
    )

    CreateActionButton(
        UtilityList,
        "Clear Preview Objects",
        "Remove Lunar development preview objects.",
        function()
            local Grid = workspace:FindFirstChild("LunarCreatorGrid")

            if Grid then
                Grid:Destroy()
            end

            local Character = LocalPlayer.Character

            if Character then
                local Hitbox = Character:FindFirstChild("LunarHitboxPreview")

                if Hitbox then
                    Hitbox:Destroy()
                end
            end
        end
    )

    CreateActionButton(
        UtilityList,
        "Print Creator State",
        "Print current Creator Hub settings.",
        function()
            print("========================================")
            print("Lunar Creator State")

            for Name, Value in pairs(CreatorState) do
                print(Name, Value)
            end

            print("========================================")
        end
    )
end

--========================================
-- SETTINGS PAGE
--========================================

local function BuildSettingsPage()
    ClearPage()

    CreateSectionTitle(
        "Settings",
        "Customize the local Creator Hub experience."
    )

    local SettingsList = Instance.new("Frame")
    SettingsList.Size = UDim2.new(1, 0, 0, 220)
    SettingsList.BackgroundTransparency = 1
    SettingsList.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.Parent = SettingsList

    CreateCreatorToggle(
        SettingsList,
        "Dark Mode",
        "Use the dark Lunar Creator Hub theme.",
        "DarkMode"
    )

    CreateCreatorToggle(
        SettingsList,
        "Compact Mode",
        "Reduce spacing inside creator pages.",
        "CompactMode"
    )

    CreateActionButton(
        SettingsList,
        "Reset Creator Settings",
        "Restore default Creator Hub settings.",
        function()
            for Name, Value in pairs(CreatorState) do
                if typeof(Value) == "boolean" then
                    CreatorState[Name] = false
                end
            end

            CreatorState.DarkMode = true
            CreatorState.FPSDisplay = true
            CreatorState.PingDisplay = true
            CreatorState.ClockDisplay = true
            CreatorState.ShowCoordinates = true
            CreatorState.ShowPlayerInfo = true
            CreatorState.ShowServerInfo = true

            BuildSettingsPage()
        end
    )

    CreateActionButton(
        SettingsList,
        "Creator Hub Version",
        "Lunar Creator Hub V2",
        function()
            print("Lunar Creator Hub V2")
        end
    )
end

--========================================
-- PAGE ROUTER
--========================================

local function OpenCreatorPage(Name)
    if Name == "Dashboard" then
        BuildDashboardPage()

    elseif Name == "Creator Tools" then
        BuildCreatorToolsPage()

    elseif Name == "Build" then
        BuildBuildPage()

    elseif Name == "Testing" then
        BuildTestingPage()

    elseif Name == "Visuals" then
        BuildVisualsPage()

    elseif Name == "Player" then
        BuildPlayerPage()

    elseif Name == "Server" then
        BuildServerPage()

    elseif Name == "Utilities" then
        BuildUtilitiesPage()

    elseif Name == "Settings" then
        BuildSettingsPage()
    end
end

--========================================
-- NAVIGATION CONNECTIONS
--========================================

for _, Button in ipairs(Sidebar:GetChildren()) do
    if Button:IsA("TextButton") then
        Button.MouseButton1Click:Connect(function()

            local Name = Button:GetAttribute("PageName")

            if Name then
                OpenCreatorPage(Name)
            end

        end)
    end
end

--========================================
-- NAVIGATION ATTRIBUTE FALLBACK
--========================================

local NavigationNames = {
    ["Dashboard"] = "Dashboard",
    ["Creator Tools"] = "Creator Tools",
    ["Build"] = "Build",
    ["Testing"] = "Testing",
    ["Visuals"] = "Visuals",
    ["Player"] = "Player",
    ["Server"] = "Server",
    ["Utilities"] = "Utilities",
    ["Settings"] = "Settings"
}

for _, Object in ipairs(Sidebar:GetDescendants()) do
    if Object:IsA("TextButton") then
        local Text = Object.Text

        for Name, PageName in pairs(NavigationNames) do
            if string.find(Text, Name, 1, true) then
                Object:SetAttribute("PageName", PageName)
            end
        end
    end
end

--========================================
-- SAFE CHARACTER REFRESH
--========================================

LocalPlayer.CharacterAdded:Connect(function(Character)
    task.wait(1)

    if CreatorState.HitboxPreview then
        local Root = Character:FindFirstChild("HumanoidRootPart")

        if Root then
            local Existing = Character:FindFirstChild("LunarHitboxPreview")

            if not Existing then
                local Box = Instance.new("BoxHandleAdornment")
                Box.Name = "LunarHitboxPreview"
                Box.Adornee = Root
                Box.Size = Vector3.new(4, 6, 2)
                Box.Transparency = 0.65
                Box.Color3 = Theme.Purple2
                Box.AlwaysOnTop = true
                Box.ZIndex = 5
                Box.Parent = Character
            end
        end
    end
end)

--========================================
-- AUTO REFRESH
--========================================

task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        task.wait(2)

        if CreatorState.AutoRefresh then
            if CreatorState.HitboxPreview then
                local Character = LocalPlayer.Character
                local Root = Character and Character:FindFirstChild("HumanoidRootPart")

                if Root then
                    local Box = Character:FindFirstChild("LunarHitboxPreview")

                    if Box and Box:IsA("BoxHandleAdornment") then
                        Box.Adornee = Root
                    end
                end
            end
        end
    end
end)

--========================================
-- FINAL PAGE SETUP
--========================================

pcall(function()
    OpenCreatorPage("Dashboard")
end)

print("========================================")
print("Lunar Creator Hub V2")
print("PART 2/3 loaded")
print("Creator Tools ready")
print("Build system ready")
print("Testing system ready")
print("========================================")

--========================================
-- CONFIG MANAGER
--========================================

local ConfigFolder = "LunarCreatorHubV2"

local function CaptureCreatorConfig()
    local Data = {}

    for Name, Value in pairs(CreatorState) do
        Data[Name] = Value
    end

    return Data
end

local function ApplyCreatorConfig(Data)
    if type(Data) ~= "table" then
        return
    end

    for Name, Value in pairs(Data) do
        if CreatorState[Name] ~= nil then
            CreatorState[Name] = Value
        end
    end
end

local function SaveCreatorConfig(Name)
    if not Name or Name == "" then
        return false
    end

    if not writefile then
        warn("[Lunar Creator Hub] writefile is unavailable")
        return false
    end

    local Data = CaptureCreatorConfig()

    local Success, Encoded = pcall(function()
        return game:GetService("HttpService"):JSONEncode(Data)
    end)

    if not Success then
        return false
    end

    pcall(function()
        if makefolder and not isfolder(ConfigFolder) then
            makefolder(ConfigFolder)
        end
    end)

    local SuccessWrite = pcall(function()
        writefile(
            ConfigFolder .. "/" .. Name .. ".json",
            Encoded
        )
    end)

    return SuccessWrite
end

local function LoadCreatorConfig(Name)
    if not readfile then
        warn("[Lunar Creator Hub] readfile is unavailable")
        return false
    end

    local Success, Content = pcall(function()
        return readfile(
            ConfigFolder .. "/" .. Name .. ".json"
        )
    end)

    if not Success then
        return false
    end

    local DecodeSuccess, Data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(Content)
    end)

    if not DecodeSuccess then
        return false
    end

    ApplyCreatorConfig(Data)

    return true
end

local function DeleteCreatorConfig(Name)
    if not delfile then
        warn("[Lunar Creator Hub] delfile is unavailable")
        return false
    end

    local Success = pcall(function()
        delfile(
            ConfigFolder .. "/" .. Name .. ".json"
        )
    end)

    return Success
end

--========================================
-- CONFIG PAGE
--========================================

local function BuildConfigPage()
    ClearPage()

    CreateSectionTitle(
        "Configuration",
        "Save and restore your Creator Hub preferences."
    )

    local ConfigList = Instance.new("Frame")
    ConfigList.Size = UDim2.new(1, 0, 0, 280)
    ConfigList.BackgroundTransparency = 1
    ConfigList.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.Parent = ConfigList

    local NameBox = Instance.new("TextBox")
    NameBox.Size = UDim2.new(1, 0, 0, 48)
    NameBox.BackgroundColor3 = Theme.Card
    NameBox.BorderSizePixel = 0
    NameBox.Text = ""
    NameBox.PlaceholderText = "Configuration name..."
    NameBox.PlaceholderColor3 = Theme.Muted
    NameBox.TextColor3 = Theme.Text
    NameBox.Font = Enum.Font.Gotham
    NameBox.TextSize = 13
    NameBox.ClearTextOnFocus = false
    NameBox.Parent = ConfigList

    local NameCorner = Instance.new("UICorner")
    NameCorner.CornerRadius = UDim.new(0, 12)
    NameCorner.Parent = NameBox

    local NamePadding = Instance.new("UIPadding")
    NamePadding.PaddingLeft = UDim.new(0, 14)
    NamePadding.PaddingRight = UDim.new(0, 14)
    NamePadding.Parent = NameBox

    CreateActionButton(
        ConfigList,
        "Save Configuration",
        "Save the current Creator Hub settings.",
        function()
            local Name = NameBox.Text

            if Name == "" then
                return
            end

            local Success = SaveCreatorConfig(Name)

            if Success then
                print("[Lunar Creator Hub] Saved:", Name)
            end
        end
    )

    CreateActionButton(
        ConfigList,
        "Load Configuration",
        "Load a previously saved configuration.",
        function()
            local Name = NameBox.Text

            if Name == "" then
                return
            end

            local Success = LoadCreatorConfig(Name)

            if Success then
                print("[Lunar Creator Hub] Loaded:", Name)
            end
        end
    )

    CreateActionButton(
        ConfigList,
        "Delete Configuration",
        "Delete the selected configuration file.",
        function()
            local Name = NameBox.Text

            if Name == "" then
                return
            end

            local Success = DeleteCreatorConfig(Name)

            if Success then
                print("[Lunar Creator Hub] Deleted:", Name)
            end
        end
    )

    CreateActionButton(
        ConfigList,
        "Print Current Configuration",
        "Print all current Creator Hub settings.",
        function()
            print("========================================")
            print("Lunar Creator Configuration")

            for Name, Value in pairs(CreatorState) do
                print(Name, "=", Value)
            end

            print("========================================")
        end
    )
end

--========================================
-- CONFIG NAVIGATION
--========================================

local ConfigButton = nil

for _, Object in ipairs(Sidebar:GetDescendants()) do
    if Object:IsA("TextButton") then
        if string.find(Object.Text, "Settings", 1, true) then
            ConfigButton = Object
            break
        end
    end
end

if ConfigButton then
    ConfigButton.MouseButton1Click:Connect(function()
        task.defer(function()
            BuildSettingsPage()

            local ConfigTitle = Instance.new("TextLabel")
            ConfigTitle.Size = UDim2.new(1, 0, 0, 28)
            ConfigTitle.BackgroundTransparency = 1
            ConfigTitle.Text = "Configuration Manager"
            ConfigTitle.TextColor3 = Theme.Purple3
            ConfigTitle.Font = Enum.Font.GothamBold
            ConfigTitle.TextSize = 15
            ConfigTitle.TextXAlignment = Enum.TextXAlignment.Left
            ConfigTitle.Parent = Page
        end)
    end)
end

--========================================
-- MINI BUTTON
--========================================

local MiniButton = Instance.new("TextButton")
MiniButton.Name = "MiniButton"
MiniButton.Size = UDim2.new(0, 58, 0, 58)
MiniButton.Position = UDim2.new(0, 22, 0.5, -29)
MiniButton.BackgroundColor3 = Theme.Panel
MiniButton.BorderSizePixel = 0
MiniButton.Text = "🌙"
MiniButton.TextSize = 28
MiniButton.TextColor3 = Theme.Purple3
MiniButton.AutoButtonColor = false
MiniButton.Visible = false
MiniButton.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(1, 0)
MiniCorner.Parent = MiniButton

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Theme.Purple
MiniStroke.Thickness = 1.5
MiniStroke.Transparency = 0.15
MiniStroke.Parent = MiniButton

--========================================
-- MINIMIZE SYSTEM
--========================================

local IsMinimized = false
local MainSize = Main.Size
local MainPosition = Main.Position

local function MinimizeHub()
    if IsMinimized then
        return
    end

    IsMinimized = true

    local FadeObjects = {}

    for _, Object in ipairs(Main:GetDescendants()) do
        if Object:IsA("GuiObject") then
            table.insert(FadeObjects, Object)
        end
    end

    for _, Object in ipairs(FadeObjects) do
        if Object:IsA("TextLabel")
        or Object:IsA("TextButton")
        or Object:IsA("TextBox") then
            Tween(Object, {
                TextTransparency = 1
            }, 0.15)
        elseif Object:IsA("ImageLabel")
        or Object:IsA("ImageButton") then
            Tween(Object, {
                ImageTransparency = 1
            }, 0.15)
        end
    end

    Tween(Main, {
        Size = UDim2.new(0, 100, 0, 70),
        Position = UDim2.new(
            MainPosition.X.Scale,
            MainPosition.X.Offset + 410,
            MainPosition.Y.Scale,
            MainPosition.Y.Offset + 260
        )
    }, 0.35)

    task.wait(0.35)

    Main.Visible = false
    MiniButton.Visible = true

    MiniButton.Size = UDim2.new(0, 0, 0, 0)

    Tween(MiniButton, {
        Size = UDim2.new(0, 58, 0, 58)
    }, 0.3)
end

local function RestoreHub()
    if not IsMinimized then
        return
    end

    IsMinimized = false

    Tween(MiniButton, {
        Size = UDim2.new(0, 0, 0, 0)
    }, 0.22)

    task.wait(0.22)

    MiniButton.Visible = false

    Main.Visible = true
    Main.Size = UDim2.new(0, 100, 0, 70)

    Tween(Main, {
        Size = MainSize,
        Position = MainPosition
    }, 0.4)

    task.wait(0.25)

    for _, Object in ipairs(Main:GetDescendants()) do
        if Object:IsA("TextLabel")
        or Object:IsA("TextButton")
        or Object:IsA("TextBox") then
            Object.TextTransparency = 0
        elseif Object:IsA("ImageLabel")
        or Object:IsA("ImageButton") then
            Object.ImageTransparency = 0
        end
    end
end

if MinimizeButton then
    MinimizeButton.MouseButton1Click:Connect(function()
        MinimizeHub()
    end)
end

MiniButton.MouseButton1Click:Connect(function()
    RestoreHub()
end)

--========================================
-- MINI BUTTON HOVER
--========================================

MiniButton.MouseEnter:Connect(function()
    Tween(MiniButton, {
        BackgroundColor3 = Theme.CardHover
    }, 0.15)

    Tween(MiniStroke, {
        Color = Theme.Purple2,
        Thickness = 2
    }, 0.15)
end)

MiniButton.MouseLeave:Connect(function()
    Tween(MiniButton, {
        BackgroundColor3 = Theme.Panel
    }, 0.15)

    Tween(MiniStroke, {
        Color = Theme.Purple,
        Thickness = 1.5
    }, 0.15)
end)

--========================================
-- MINI BUTTON DRAG
--========================================

local MiniDragging = false
local MiniDragStart
local MiniStartPosition

MiniButton.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1
    or Input.UserInputType == Enum.UserInputType.Touch then

        MiniDragging = true
        MiniDragStart = Input.Position
        MiniStartPosition = MiniButton.Position
    end
end)

MiniButton.InputChanged:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseMovement
    or Input.UserInputType == Enum.UserInputType.Touch then

        MiniDragInput = Input
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if not MiniDragging then
        return
    end

    if Input.UserInputType == Enum.UserInputType.MouseMovement
    or Input.UserInputType == Enum.UserInputType.Touch then

        local Delta = Input.Position - MiniDragStart

        MiniButton.Position = UDim2.new(
            MiniStartPosition.X.Scale,
            MiniStartPosition.X.Offset + Delta.X,
            MiniStartPosition.Y.Scale,
            MiniStartPosition.Y.Offset + Delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1
    or Input.UserInputType == Enum.UserInputType.Touch then

        MiniDragging = false
    end
end)

--========================================
-- CLOSE ANIMATION
--========================================

local Closing = false

local function CloseHub()
    if Closing then
        return
    end

    Closing = true

    for _, Object in ipairs(Main:GetDescendants()) do
        if Object:IsA("TextLabel")
        or Object:IsA("TextButton")
        or Object:IsA("TextBox") then

            Tween(Object, {
                TextTransparency = 1
            }, 0.18)

        elseif Object:IsA("ImageLabel")
        or Object:IsA("ImageButton") then

            Tween(Object, {
                ImageTransparency = 1
            }, 0.18)
        end
    end

    Tween(Main, {
        Size = UDim2.new(0, 700, 0, 420)
    }, 0.3)

    task.wait(0.3)

    Tween(ScreenGui, {
        IgnoreGuiInset = true
    }, 0.01)

    ScreenGui:Destroy()
end

if CloseButton then
    CloseButton.MouseButton1Click:Connect(function()
        CloseHub()
    end)
end

--========================================
-- ESCAPE CLOSE
--========================================

UserInputService.InputBegan:Connect(function(Input, Processed)
    if Processed then
        return
    end

    if Input.KeyCode == Enum.KeyCode.RightShift then
        if IsMinimized then
            RestoreHub()
        else
            MinimizeHub()
        end
    end
end)

--========================================
-- FPS UPDATE
--========================================

local FPS = 0
local FPSFrames = 0
local FPSTime = 0

RunService.RenderStepped:Connect(function(Delta)
    FPSFrames += 1
    FPSTime += Delta

    if FPSTime >= 1 then
        FPS = FPSFrames
        FPSFrames = 0
        FPSTime = 0

        if CreatorState.FPSDisplay and FPSLabel then
            FPSLabel.Text = "FPS  " .. tostring(FPS)
        elseif FPSLabel then
            FPSLabel.Text = "FPS  --"
        end
    end
end)

--========================================
-- PING UPDATE
--========================================

task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        task.wait(1)

        local Ping = 0

        pcall(function()
            Ping = math.floor(
                LocalPlayer:GetNetworkPing() * 1000
            )
        end)

        if PingLabel then
            if CreatorState.PingDisplay then
                PingLabel.Text = "PING  " .. tostring(Ping) .. "ms"
            else
                PingLabel.Text = "PING  --"
            end
        end
    end
end)

--========================================
-- CLOCK UPDATE
--========================================

task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        task.wait(1)

        if TimeLabel then
            if CreatorState.ClockDisplay then
                TimeLabel.Text = os.date("%H:%M:%S")
            else
                TimeLabel.Text = "--:--:--"
            end
        end
    end
end)

--========================================
-- CHARACTER POSITION UPDATE
--========================================

task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        task.wait(0.2)

        if CreatorState.ShowCoordinates then
            local Character = LocalPlayer.Character
            local Root = Character and Character:FindFirstChild("HumanoidRootPart")

            if Root and CoordinateLabel then
                local Position = Root.Position

                CoordinateLabel.Text = string.format(
                    "X %.1f  Y %.1f  Z %.1f",
                    Position.X,
                    Position.Y,
                    Position.Z
                )
            end
        end
    end
end)

--========================================
-- PLAYER COUNT UPDATE
--========================================

task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        task.wait(2)

        if PlayerCountLabel then
            PlayerCountLabel.Text =
                tostring(#Players:GetPlayers())
                .. " Players"
        end
    end
end)

--========================================
-- PAGE SIZE UPDATE
--========================================

if Page and Page:FindFirstChildOfClass("UIListLayout") then
    local PageLayout = Page:FindFirstChildOfClass("UIListLayout")

    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(
            0,
            0,
            0,
            PageLayout.AbsoluteContentSize.Y + 30
        )
    end)
end

--========================================
-- FINAL DASHBOARD
--========================================

pcall(function()
    if BuildDashboardPage then
        BuildDashboardPage()
    end
end)

--========================================
-- FINAL READY ANIMATION
--========================================

task.spawn(function()
    task.wait(0.25)

    if Main and Main.Parent then
        Main.Position = UDim2.new(
            0.5,
            0,
            0.5,
            30
        )

        Tween(Main, {
            Position = MainPosition
        }, 0.45)
    end
end)

--========================================
-- FINAL STATUS
--========================================

print("========================================")
print("Lunar Creator Hub V2")
print("PART 3/3 loaded")
print("Config Manager ready")
print("Minimize system ready")
print("Testing system ready")
print("Creator Hub fully loaded")
print("========================================")

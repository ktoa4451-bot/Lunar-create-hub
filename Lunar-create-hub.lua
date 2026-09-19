--========================================
-- LUNAR CREATOR HUB
-- PART 1/3
--========================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

--========================================
-- THEME
--========================================

local Theme = {
    Background = Color3.fromRGB(12, 10, 18),
    Panel = Color3.fromRGB(20, 16, 30),
    Panel2 = Color3.fromRGB(27, 21, 40),

    Purple = Color3.fromRGB(145, 80, 255),
    PurpleDark = Color3.fromRGB(92, 48, 160),
    PurpleSoft = Color3.fromRGB(180, 130, 255),

    Text = Color3.fromRGB(240, 235, 250),
    SubText = Color3.fromRGB(155, 145, 175),

    Stroke = Color3.fromRGB(65, 48, 90),
    Hover = Color3.fromRGB(38, 29, 55)
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

    return TweenService:Create(Object, Info, Properties)
end

--========================================
-- GUI PARENT
--========================================

local Parent

pcall(function()
    if gethui then
        Parent = gethui()
    end
end)

if not Parent then
    Parent = game:GetService("CoreGui")
end

local Old = Parent:FindFirstChild("LunarCreatorHub")

if Old then
    Old:Destroy()
end

--========================================
-- SCREEN GUI
--========================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LunarCreatorHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = Parent

--========================================
-- LOADER
--========================================

local Loader = Instance.new("Frame")
Loader.Name = "Loader"
Loader.Size = UDim2.fromScale(1, 1)
Loader.Position = UDim2.fromScale(0, 0)
Loader.BackgroundColor3 = Theme.Background
Loader.BorderSizePixel = 0
Loader.Parent = ScreenGui

local LoaderCorner = Instance.new("UICorner")
LoaderCorner.CornerRadius = UDim.new(0, 0)
LoaderCorner.Parent = Loader

local LoaderLogo = Instance.new("TextLabel")
LoaderLogo.Size = UDim2.new(0, 100, 0, 80)
LoaderLogo.Position = UDim2.new(0.5, -50, 0.5, -125)
LoaderLogo.BackgroundTransparency = 1
LoaderLogo.Text = "🌙"
LoaderLogo.TextSize = 58
LoaderLogo.Font = Enum.Font.GothamBold
LoaderLogo.TextColor3 = Theme.PurpleSoft
LoaderLogo.Parent = Loader

local LoaderTitle = Instance.new("TextLabel")
LoaderTitle.Size = UDim2.new(0, 500, 0, 50)
LoaderTitle.Position = UDim2.new(0.5, -250, 0.5, -45)
LoaderTitle.BackgroundTransparency = 1
LoaderTitle.Text = "Lunar Creator Hub"
LoaderTitle.TextSize = 28
LoaderTitle.Font = Enum.Font.GothamBold
LoaderTitle.TextColor3 = Theme.Text
LoaderTitle.Parent = Loader

local LoaderStatus = Instance.new("TextLabel")
LoaderStatus.Size = UDim2.new(0, 400, 0, 30)
LoaderStatus.Position = UDim2.new(0.5, -200, 0.5, 5)
LoaderStatus.BackgroundTransparency = 1
LoaderStatus.Text = "Initializing..."
LoaderStatus.TextSize = 14
LoaderStatus.Font = Enum.Font.Gotham
LoaderStatus.TextColor3 = Theme.SubText
LoaderStatus.Parent = Loader

local ProgressBackground = Instance.new("Frame")
ProgressBackground.Size = UDim2.new(0, 360, 0, 6)
ProgressBackground.Position = UDim2.new(0.5, -180, 0.5, 50)
ProgressBackground.BackgroundColor3 = Theme.Panel2
ProgressBackground.BorderSizePixel = 0
ProgressBackground.Parent = Loader

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(1, 0)
ProgressCorner.Parent = ProgressBackground

local Progress = Instance.new("Frame")
Progress.Size = UDim2.new(0, 0, 1, 0)
Progress.BackgroundColor3 = Theme.Purple
Progress.BorderSizePixel = 0
Progress.Parent = ProgressBackground

local ProgressGradient = Instance.new("UIGradient")
ProgressGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Theme.PurpleDark),
    ColorSequenceKeypoint.new(1, Theme.PurpleSoft)
})
ProgressGradient.Parent = Progress

local ProgressCorner2 = Instance.new("UICorner")
ProgressCorner2.CornerRadius = UDim.new(1, 0)
ProgressCorner2.Parent = Progress

--========================================
-- MAIN WINDOW
--========================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 780, 0, 510)
Main.Position = UDim2.new(0.5, -390, 0.5, -255)
Main.BackgroundColor3 = Theme.Background
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Theme.Stroke
MainStroke.Thickness = 1.2
MainStroke.Transparency = 0.15
MainStroke.Parent = Main

--========================================
-- TOP BAR
--========================================

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 62)
TopBar.BackgroundColor3 = Theme.Panel
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 18)
TopCorner.Parent = TopBar

local TopCover = Instance.new("Frame")
TopCover.Size = UDim2.new(1, 0, 0, 20)
TopCover.Position = UDim2.new(0, 0, 1, -20)
TopCover.BackgroundColor3 = Theme.Panel
TopCover.BorderSizePixel = 0
TopCover.Parent = TopBar

--========================================
-- LOGO
--========================================

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(0, 45, 0, 45)
Logo.Position = UDim2.new(0, 14, 0, 8)
Logo.BackgroundTransparency = 1
Logo.Text = "🌙"
Logo.TextSize = 27
Logo.Font = Enum.Font.GothamBold
Logo.TextColor3 = Theme.PurpleSoft
Logo.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 230, 0, 28)
Title.Position = UDim2.new(0, 58, 0, 9)
Title.BackgroundTransparency = 1
Title.Text = "Lunar Creator Hub"
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Theme.Text
Title.Parent = TopBar

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 250, 0, 20)
Subtitle.Position = UDim2.new(0, 59, 0, 33)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Creator utilities"
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextColor3 = Theme.SubText
Subtitle.Parent = TopBar

local Version = Instance.new("TextLabel")
Version.Size = UDim2.new(0, 70, 0, 22)
Version.Position = UDim2.new(1, -145, 0, 20)
Version.BackgroundTransparency = 1
Version.Text = "v1.0"
Version.TextSize = 11
Version.Font = Enum.Font.GothamMedium
Version.TextColor3 = Theme.PurpleSoft
Version.Parent = TopBar

--========================================
-- CONTROL BUTTONS
--========================================

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 34, 0, 34)
MinimizeButton.Position = UDim2.new(1, -75, 0, 14)
MinimizeButton.BackgroundColor3 = Theme.Panel2
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = "—"
MinimizeButton.TextSize = 18
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextColor3 = Theme.Text
MinimizeButton.AutoButtonColor = false
MinimizeButton.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 10)
MinCorner.Parent = MinimizeButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 34, 0, 34)
CloseButton.Position = UDim2.new(1, -38, 0, 14)
CloseButton.BackgroundColor3 = Theme.Panel2
CloseButton.BorderSizePixel = 0
CloseButton.Text = "×"
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Theme.Text
CloseButton.AutoButtonColor = false
CloseButton.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseButton

--========================================
-- BODY
--========================================

local Body = Instance.new("Frame")
Body.Name = "Body"
Body.Size = UDim2.new(1, -20, 1, -72)
Body.Position = UDim2.new(0, 10, 0, 67)
Body.BackgroundTransparency = 1
Body.Parent = Main

--========================================
-- SIDEBAR
--========================================

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 185, 1, 0)
Sidebar.BackgroundColor3 = Theme.Panel
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Body

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 14)
SidebarCorner.Parent = Sidebar

local SidebarTitle = Instance.new("TextLabel")
SidebarTitle.Size = UDim2.new(1, -24, 0, 28)
SidebarTitle.Position = UDim2.new(0, 12, 0, 12)
SidebarTitle.BackgroundTransparency = 1
SidebarTitle.Text = "CREATOR"
SidebarTitle.TextXAlignment = Enum.TextXAlignment.Left
SidebarTitle.TextSize = 11
SidebarTitle.Font = Enum.Font.GothamBold
SidebarTitle.TextColor3 = Theme.SubText
SidebarTitle.Parent = Sidebar

local CategoryContainer = Instance.new("ScrollingFrame")
CategoryContainer.Name = "Categories"
CategoryContainer.Size = UDim2.new(1, -14, 1, -55)
CategoryContainer.Position = UDim2.new(0, 7, 0, 48)
CategoryContainer.BackgroundTransparency = 1
CategoryContainer.BorderSizePixel = 0
CategoryContainer.ScrollBarThickness = 2
CategoryContainer.ScrollBarImageColor3 = Theme.PurpleDark
CategoryContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
CategoryContainer.Parent = Sidebar

local CategoryLayout = Instance.new("UIListLayout")
CategoryLayout.Padding = UDim.new(0, 6)
CategoryLayout.SortOrder = Enum.SortOrder.LayoutOrder
CategoryLayout.Parent = CategoryContainer

local CategoryPadding = Instance.new("UIPadding")
CategoryPadding.PaddingLeft = UDim.new(0, 2)
CategoryPadding.PaddingRight = UDim.new(0, 2)
CategoryPadding.Parent = CategoryContainer

--========================================
-- CONTENT
--========================================

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -197, 1, 0)
Content.Position = UDim2.new(0, 197, 0, 0)
Content.BackgroundColor3 = Theme.Panel
Content.BorderSizePixel = 0
Content.Parent = Body

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 14)
ContentCorner.Parent = Content

local PageTitle = Instance.new("TextLabel")
PageTitle.Name = "PageTitle"
PageTitle.Size = UDim2.new(1, -30, 0, 35)
PageTitle.Position = UDim2.new(0, 15, 0, 12)
PageTitle.BackgroundTransparency = 1
PageTitle.Text = "Dashboard"
PageTitle.TextXAlignment = Enum.TextXAlignment.Left
PageTitle.TextSize = 20
PageTitle.Font = Enum.Font.GothamBold
PageTitle.TextColor3 = Theme.Text
PageTitle.Parent = Content

local PageDescription = Instance.new("TextLabel")
PageDescription.Name = "PageDescription"
PageDescription.Size = UDim2.new(1, -30, 0, 24)
PageDescription.Position = UDim2.new(0, 15, 0, 42)
PageDescription.BackgroundTransparency = 1
PageDescription.Text = "Tools for Roblox creators and developers."
PageDescription.TextXAlignment = Enum.TextXAlignment.Left
PageDescription.TextSize = 12
PageDescription.Font = Enum.Font.Gotham
PageDescription.TextColor3 = Theme.SubText
PageDescription.Parent = Content

local PageContainer = Instance.new("ScrollingFrame")
PageContainer.Name = "PageContainer"
PageContainer.Size = UDim2.new(1, -24, 1, -82)
PageContainer.Position = UDim2.new(0, 12, 0, 72)
PageContainer.BackgroundTransparency = 1
PageContainer.BorderSizePixel = 0
PageContainer.ScrollBarThickness = 3
PageContainer.ScrollBarImageColor3 = Theme.PurpleDark
PageContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
PageContainer.Parent = Content

local PageLayout = Instance.new("UIListLayout")
PageLayout.Padding = UDim.new(0, 8)
PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
PageLayout.Parent = PageContainer

--========================================
-- CATEGORIES
--========================================

local Categories = {
    {
        Name = "Dashboard",
        Icon = "⌂",
        Description = "Creator dashboard"
    },

    {
        Name = "Creator Tools",
        Icon = "✦",
        Description = "General creator tools"
    },

    {
        Name = "Build",
        Icon = "▣",
        Description = "Building utilities"
    },

    {
        Name = "Testing",
        Icon = "◈",
        Description = "Testing and debugging"
    },

    {
        Name = "Visuals",
        Icon = "◉",
        Description = "Visual creator tools"
    },

    {
        Name = "Player",
        Icon = "●",
        Description = "Player information"
    },

    {
        Name = "Server",
        Icon = "◇",
        Description = "Server information"
    },

    {
        Name = "Utilities",
        Icon = "⚙",
        Description = "Useful utilities"
    },

    {
        Name = "Settings",
        Icon = "☾",
        Description = "Hub settings"
    }
}

local CategoryButtons = {}
local CurrentCategory = nil

--========================================
-- CLEAR PAGE
--========================================

local function ClearPage()
    for _, Child in ipairs(PageContainer:GetChildren()) do
        if not Child:IsA("UIListLayout") then
            Child:Destroy()
        end
    end

    PageContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
end

--========================================
-- EMPTY PAGE
--========================================

local function ShowPage(Category)
    ClearPage()

    PageTitle.Text = Category.Name
    PageDescription.Text = Category.Description

    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -4, 0, 110)
    Card.BackgroundColor3 = Theme.Panel2
    Card.BorderSizePixel = 0
    Card.Parent = PageContainer

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 12)
    CardCorner.Parent = Card

    local CardTitle = Instance.new("TextLabel")
    CardTitle.Size = UDim2.new(1, -30, 0, 30)
    CardTitle.Position = UDim2.new(0, 15, 0, 15)
    CardTitle.BackgroundTransparency = 1
    CardTitle.Text = Category.Name
    CardTitle.TextXAlignment = Enum.TextXAlignment.Left
    CardTitle.TextSize = 16
    CardTitle.Font = Enum.Font.GothamBold
    CardTitle.TextColor3 = Theme.Text
    CardTitle.Parent = Card

    local CardText = Instance.new("TextLabel")
    CardText.Size = UDim2.new(1, -30, 0, 40)
    CardText.Position = UDim2.new(0, 15, 0, 48)
    CardText.BackgroundTransparency = 1
    CardText.Text = "Creator functions will be added here."
    CardText.TextXAlignment = Enum.TextXAlignment.Left
    CardText.TextSize = 12
    CardText.Font = Enum.Font.Gotham
    CardText.TextColor3 = Theme.SubText
    CardText.Parent = Card

    PageContainer.CanvasSize = UDim2.new(
        0,
        0,
        0,
        PageLayout.AbsoluteContentSize.Y + 10
    )
end

--========================================
-- CATEGORY BUTTONS
--========================================

for Index, Category in ipairs(Categories) do

    local Button = Instance.new("TextButton")
    Button.Name = Category.Name
    Button.Size = UDim2.new(1, 0, 0, 42)
    Button.BackgroundColor3 = Theme.Panel
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.LayoutOrder = Index
    Button.Parent = CategoryContainer

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button

    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.new(0, 32, 1, 0)
    Icon.Position = UDim2.new(0, 8, 0, 0)
    Icon.BackgroundTransparency = 1
    Icon.Text = Category.Icon
    Icon.TextSize = 16
    Icon.Font = Enum.Font.GothamBold
    Icon.TextColor3 = Theme.SubText
    Icon.Parent = Button

    local Text = Instance.new("TextLabel")
    Text.Size = UDim2.new(1, -48, 1, 0)
    Text.Position = UDim2.new(0, 42, 0, 0)
    Text.BackgroundTransparency = 1
    Text.Text = Category.Name
    Text.TextXAlignment = Enum.TextXAlignment.Left
    Text.TextSize = 12
    Text.Font = Enum.Font.GothamMedium
    Text.TextColor3 = Theme.SubText
    Text.Parent = Button

    Button.MouseEnter:Connect(function()
        if CurrentCategory ~= Category.Name then
            Tween(Button, 0.15, {
                BackgroundColor3 = Theme.Hover
            }):Play()
        end
    end)

    Button.MouseLeave:Connect(function()
        if CurrentCategory ~= Category.Name then
            Tween(Button, 0.15, {
                BackgroundColor3 = Theme.Panel
            }):Play()
        end
    end)

    Button.MouseButton1Click:Connect(function()

        CurrentCategory = Category.Name

        for _, Data in pairs(CategoryButtons) do
            Tween(Data.Button, 0.18, {
                BackgroundColor3 = Theme.Panel
            }):Play()

            Tween(Data.Text, 0.18, {
                TextColor3 = Theme.SubText
            }):Play()

            Tween(Data.Icon, 0.18, {
                TextColor3 = Theme.SubText
            }):Play()
        end

        Tween(Button, 0.2, {
            BackgroundColor3 = Theme.PurpleDark
        }):Play()

        Tween(Text, 0.2, {
            TextColor3 = Theme.Text
        }):Play()

        Tween(Icon, 0.2, {
            TextColor3 = Theme.PurpleSoft
        }):Play()

        ShowPage(Category)
    end)

    CategoryButtons[Category.Name] = {
        Button = Button,
        Text = Text,
        Icon = Icon
    }
end

--========================================
-- CATEGORY CANVAS
--========================================

CategoryLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    CategoryContainer.CanvasSize = UDim2.new(
        0,
        0,
        0,
        CategoryLayout.AbsoluteContentSize.Y + 10
    )
end)

PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    PageContainer.CanvasSize = UDim2.new(
        0,
        0,
        0,
        PageLayout.AbsoluteContentSize.Y + 10
    )
end)

--========================================
-- DRAG SYSTEM
--========================================

local Dragging = false
local DragStart
local StartPosition

local function UpdateDrag(Input)
    local Delta = Input.Position - DragStart

    Main.Position = UDim2.new(
        StartPosition.X.Scale,
        StartPosition.X.Offset + Delta.X,
        StartPosition.Y.Scale,
        StartPosition.Y.Offset + Delta.Y
    )
end

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

    if Dragging then

        if Input.UserInputType == Enum.UserInputType.MouseMovement
            or Input.UserInputType == Enum.UserInputType.Touch then

            UpdateDrag(Input)
        end
    end
end)

--========================================
-- CLOSE
--========================================

CloseButton.MouseEnter:Connect(function()
    Tween(CloseButton, 0.15, {
        BackgroundColor3 = Color3.fromRGB(120, 45, 70)
    }):Play()
end)

CloseButton.MouseLeave:Connect(function()
    Tween(CloseButton, 0.15, {
        BackgroundColor3 = Theme.Panel2
    }):Play()
end)

CloseButton.MouseButton1Click:Connect(function()

    Tween(Main, 0.25, {
        Size = UDim2.new(0, 720, 0, 470),
        Position = UDim2.new(0.5, -360, 0.5, -235)
    }):Play()

    Tween(Main, 0.2, {
        BackgroundTransparency = 1
    }):Play()

    task.wait(0.25)

    ScreenGui:Destroy()
end)

--========================================
-- MINIMIZE PLACEHOLDER
--========================================

local MiniButton = Instance.new("TextButton")
MiniButton.Name = "MiniButton"
MiniButton.Size = UDim2.new(0, 54, 0, 54)
MiniButton.Position = UDim2.new(0.5, -27, 0.5, -27)
MiniButton.BackgroundColor3 = Theme.Panel
MiniButton.BorderSizePixel = 0
MiniButton.Text = "🌙"
MiniButton.TextSize = 27
MiniButton.Font = Enum.Font.GothamBold
MiniButton.TextColor3 = Theme.PurpleSoft
MiniButton.Visible = false
MiniButton.AutoButtonColor = false
MiniButton.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 17)
MiniCorner.Parent = MiniButton

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Theme.PurpleDark
MiniStroke.Thickness = 1.2
MiniStroke.Parent = MiniButton

MinimizeButton.MouseButton1Click:Connect(function()
    -- Minimize system will be completed in PART 3/3.
end)

MiniButton.MouseButton1Click:Connect(function()
    -- Restore system will be completed in PART 3/3.
end)

--========================================
-- LOADER ANIMATION
--========================================

task.spawn(function()

    local Steps = {
        {"Initializing creator tools...", 0.18},
        {"Loading interface...", 0.38},
        {"Preparing utilities...", 0.62},
        {"Loading workspace...", 0.82},
        {"Almost ready...", 1}
    }

    for _, Step in ipairs(Steps) do

        LoaderStatus.Text = Step[1]

        Tween(Progress, 0.35, {
            Size = UDim2.new(Step[2], 0, 1, 0)
        }):Play()

        task.wait(0.35)
    end

    task.wait(0.25)

    Main.Visible = true
    Main.BackgroundTransparency = 1
    Main.Size = UDim2.new(0, 720, 0, 470)
    Main.Position = UDim2.new(0.5, -360, 0.5, -235)

    Tween(Main, 0.35, {
        Size = UDim2.new(0, 780, 0, 510),
        Position = UDim2.new(0.5, -390, 0.5, -255),
        BackgroundTransparency = 0
    }):Play()

    Tween(Loader, 0.35, {
        BackgroundTransparency = 1
    }):Play()

    task.wait(0.35)

    Loader:Destroy()

    CategoryButtons["Dashboard"].Button.BackgroundColor3 = Theme.PurpleDark
    CategoryButtons["Dashboard"].Text.TextColor3 = Theme.Text
    CategoryButtons["Dashboard"].Icon.TextColor3 = Theme.PurpleSoft

    CurrentCategory = "Dashboard"

    ShowPage(Categories[1])
end)

--========================================
-- FINAL
--========================================

print("========================================")
print("Lunar Creator Hub")
print("PART 1/3 loaded")
print("========================================")

--========================================
-- LUNAR CREATOR HUB
-- PART 2/3
-- CREATOR TOOLS + BUILD + TESTING
--========================================

--========================================
-- CREATOR STATE
--========================================

local CreatorState = {
    FPSCounter = true,
    PingCounter = true,
    Coordinates = false,
    Clock = true,

    Fullbright = false,
    NoFog = false,

    Freecam = false,
    Noclip = false,

    ShowParts = false,
    ShowModels = false,

    TestMode = false
}

--========================================
-- PAGE HELPERS
--========================================

local function AddSectionTitle(TextValue)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -4, 0, 30)
    Label.BackgroundTransparency = 1
    Label.Text = TextValue
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamBold
    Label.TextColor3 = Theme.PurpleSoft
    Label.Parent = PageContainer

    return Label
end

--========================================
-- TOGGLE
--========================================

local function CreateCreatorToggle(Name, StateName, Callback)

    local Button = Instance.new("TextButton")
    Button.Name = Name
    Button.Size = UDim2.new(1, -4, 0, 52)
    Button.BackgroundColor3 = Theme.Panel2
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = PageContainer

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Button

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -75, 0, 22)
    TitleLabel.Position = UDim2.new(0, 15, 0, 7)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = Name
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextSize = 13
    TitleLabel.Font = Enum.Font.GothamMedium
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.Parent = Button

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, -75, 0, 17)
    StatusLabel.Position = UDim2.new(0, 15, 0, 29)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.TextSize = 10
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Parent = Button

    local Switch = Instance.new("Frame")
    Switch.Size = UDim2.new(0, 42, 0, 22)
    Switch.Position = UDim2.new(1, -57, 0.5, -11)
    Switch.BackgroundColor3 = Theme.Background
    Switch.BorderSizePixel = 0
    Switch.Parent = Button

    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = Switch

    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 16, 0, 16)
    Circle.Position = UDim2.new(0, 3, 0.5, -8)
    Circle.BackgroundColor3 = Theme.SubText
    Circle.BorderSizePixel = 0
    Circle.Parent = Switch

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = Circle

    local function Refresh()

        local Enabled = CreatorState[StateName]

        if Enabled then

            StatusLabel.Text = "Enabled"
            StatusLabel.TextColor3 = Theme.PurpleSoft

            Tween(Switch, 0.18, {
                BackgroundColor3 = Theme.PurpleDark
            }):Play()

            Tween(Circle, 0.18, {
                Position = UDim2.new(1, -19, 0.5, -8),
                BackgroundColor3 = Theme.PurpleSoft
            }):Play()

        else

            StatusLabel.Text = "Disabled"
            StatusLabel.TextColor3 = Theme.SubText

            Tween(Switch, 0.18, {
                BackgroundColor3 = Theme.Background
            }):Play()

            Tween(Circle, 0.18, {
                Position = UDim2.new(0, 3, 0.5, -8),
                BackgroundColor3 = Theme.SubText
            }):Play()
        end
    end

    Button.MouseEnter:Connect(function()

        Tween(Button, 0.15, {
            BackgroundColor3 = Theme.Hover
        }):Play()
    end)

    Button.MouseLeave:Connect(function()

        Tween(Button, 0.15, {
            BackgroundColor3 = Theme.Panel2
        }):Play()
    end)

    Button.MouseButton1Click:Connect(function()

        CreatorState[StateName] = not CreatorState[StateName]

        Refresh()

        if Callback then
            Callback(CreatorState[StateName])
        end
    end)

    Refresh()

    return Button
end

--========================================
-- INFO CARD
--========================================

local function CreateInfoCard(TitleText, DescriptionText)

    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -4, 0, 82)
    Card.BackgroundColor3 = Theme.Panel2
    Card.BorderSizePixel = 0
    Card.Parent = PageContainer

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Card

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -30, 0, 25)
    TitleLabel.Position = UDim2.new(0, 15, 0, 10)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = TitleText
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.Parent = Card

    local Description = Instance.new("TextLabel")
    Description.Size = UDim2.new(1, -30, 0, 32)
    Description.Position = UDim2.new(0, 15, 0, 35)
    Description.BackgroundTransparency = 1
    Description.Text = DescriptionText
    Description.TextWrapped = true
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.TextSize = 11
    Description.Font = Enum.Font.Gotham
    Description.TextColor3 = Theme.SubText
    Description.Parent = Card

    return Card
end

--========================================
-- DASHBOARD
--========================================

local function BuildDashboard()

    ClearPage()

    PageTitle.Text = "Dashboard"
    PageDescription.Text = "Welcome to Lunar Creator Hub."

    CreateInfoCard(
        "Creator Hub",
        "A collection of utilities designed for Roblox creators and developers."
    )

    CreateInfoCard(
        "Environment",
        "Use the categories on the left to access creator tools."
    )

    AddSectionTitle("QUICK STATUS")

    CreateCreatorToggle(
        "FPS Counter",
        "FPSCounter"
    )

    CreateCreatorToggle(
        "Ping Counter",
        "PingCounter"
    )

    CreateCreatorToggle(
        "Clock",
        "Clock"
    )
end

--========================================
-- CREATOR TOOLS PAGE
--========================================

local function BuildCreatorTools()

    ClearPage()

    PageTitle.Text = "Creator Tools"
    PageDescription.Text = "General utilities for creators."

    AddSectionTitle("PERFORMANCE")

    CreateCreatorToggle(
        "FPS Counter",
        "FPSCounter"
    )

    CreateCreatorToggle(
        "Ping Counter",
        "PingCounter"
    )

    CreateCreatorToggle(
        "Coordinates",
        "Coordinates"
    )

    CreateCreatorToggle(
        "Clock",
        "Clock"
    )

    AddSectionTitle("ENVIRONMENT")

    CreateCreatorToggle(
        "Fullbright",
        "Fullbright",
        function(Enabled)

            if not Enabled then
                return
            end

            local Lighting = game:GetService("Lighting")

            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
        end
    )

    CreateCreatorToggle(
        "No Fog",
        "NoFog",
        function(Enabled)

            local Lighting = game:GetService("Lighting")

            if Enabled then
                Lighting.FogEnd = 100000
                Lighting.FogStart = 100000
            else
                Lighting.FogStart = 0
                Lighting.FogEnd = 100000
            end
        end
    )
end

--========================================
-- BUILD PAGE
--========================================

local function BuildBuildPage()

    ClearPage()

    PageTitle.Text = "Build"
    PageDescription.Text = "Tools for inspecting and testing your build."

    AddSectionTitle("INSPECTION")

    CreateCreatorToggle(
        "Show Parts",
        "ShowParts",
        function(Enabled)

            for _, Object in ipairs(workspace:GetDescendants()) do

                if Object:IsA("BasePart") then

                    local Existing = Object:FindFirstChild("LunarCreatorPart")

                    if Enabled then

                        if not Existing then

                            local Selection = Instance.new("SelectionBox")
                            Selection.Name = "LunarCreatorPart"
                            Selection.Adornee = Object
                            Selection.Color3 = Theme.Purple
                            Selection.LineThickness = 0.03
                            Selection.Parent = Object
                        end

                    elseif Existing then
                        Existing:Destroy()
                    end
                end
            end
        end
    )

    CreateCreatorToggle(
        "Show Models",
        "ShowModels",
        function(Enabled)

            for _, Object in ipairs(workspace:GetDescendants()) do

                if Object:IsA("Model") then

                    local Root = Object.PrimaryPart

                    if Root then

                        local Existing = Object:FindFirstChild("LunarCreatorModel")

                        if Enabled then

                            if not Existing then

                                local Highlight = Instance.new("Highlight")
                                Highlight.Name = "LunarCreatorModel"
                                Highlight.Adornee = Object
                                Highlight.FillTransparency = 0.85
                                Highlight.OutlineColor = Theme.Purple
                                Highlight.Parent = Object
                            end

                        elseif Existing then
                            Existing:Destroy()
                        end
                    end
                end
            end
        end
    )

    AddSectionTitle("DEVELOPER")

    CreateInfoCard(
        "Build Inspector",
        "Visual inspection helpers can be used while developing your experience."
    )
end

--========================================
-- TESTING PAGE
--========================================

local function BuildTestingPage()

    ClearPage()

    PageTitle.Text = "Testing"
    PageDescription.Text = "Testing utilities for development sessions."

    AddSectionTitle("TEST MODE")

    CreateCreatorToggle(
        "Test Mode",
        "TestMode",
        function(Enabled)

            if Enabled then

                warn("[Lunar Creator] Test Mode enabled")

            else

                warn("[Lunar Creator] Test Mode disabled")
            end
        end
    )

    CreateInfoCard(
        "Testing",
        "Use this section for controlled testing while developing your Roblox experience."
    )

    AddSectionTitle("DEBUG")

    CreateCreatorToggle(
        "Coordinates",
        "Coordinates"
    )

    CreateCreatorToggle(
        "FPS Counter",
        "FPSCounter"
    )

    CreateCreatorToggle(
        "Ping Counter",
        "PingCounter"
    )
end

--========================================
-- VISUALS PAGE
--========================================

local function BuildVisualsPage()

    ClearPage()

    PageTitle.Text = "Visuals"
    PageDescription.Text = "Visual helpers for development."

    AddSectionTitle("VISUAL HELPERS")

    CreateCreatorToggle(
        "Fullbright",
        "Fullbright"
    )

    CreateCreatorToggle(
        "No Fog",
        "NoFog"
    )

    CreateInfoCard(
        "Visual Tools",
        "Additional visual customization will be added in the next update."
    )
end

--========================================
-- PAGE ROUTER
--========================================

local function OpenCreatorPage(CategoryName)

    if CategoryName == "Dashboard" then

        BuildDashboard()

    elseif CategoryName == "Creator Tools" then

        BuildCreatorTools()

    elseif CategoryName == "Build" then

        BuildBuildPage()

    elseif CategoryName == "Testing" then

        BuildTestingPage()

    elseif CategoryName == "Visuals" then

        BuildVisualsPage()

    else

        ClearPage()

        PageTitle.Text = CategoryName
        PageDescription.Text = "Creator utilities."

        CreateInfoCard(
            CategoryName,
            "This section will be expanded in PART 3/3."
        )
    end
end

--========================================
-- REPLACE CATEGORY CONNECTIONS
--========================================

for _, Category in ipairs(Categories) do

    local Data = CategoryButtons[Category.Name]

    if Data then

        Data.Button.MouseButton1Click:Connect(function()

            OpenCreatorPage(Category.Name)

        end)
    end
end

--========================================
-- INITIAL PAGE
--========================================

OpenCreatorPage("Dashboard")

--========================================
-- PART 2 READY
--========================================

print("========================================")
print("Lunar Creator Hub")
print("PART 2/3 loaded")
print("Creator Tools ready")
print("Build system ready")
print("Testing system ready")
print("========================================")

--========================================
-- LUNAR CREATOR HUB
-- PART 3/3
-- PLAYER + SERVER + UTILITIES + SETTINGS
--========================================

--========================================
-- PLAYER PAGE
--========================================

local function BuildPlayerPage()

    ClearPage()

    PageTitle.Text = "Player"
    PageDescription.Text = "Information about your current player."

    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")

    AddSectionTitle("PLAYER INFORMATION")

    CreateInfoCard(
        "Username",
        LocalPlayer.Name
    )

    CreateInfoCard(
        "Display Name",
        LocalPlayer.DisplayName
    )

    CreateInfoCard(
        "User ID",
        tostring(LocalPlayer.UserId)
    )

    CreateInfoCard(
        "Account Age",
        tostring(LocalPlayer.AccountAge) .. " days"
    )

    if Humanoid then

        CreateInfoCard(
            "Humanoid",
            "Health: "
                .. math.floor(Humanoid.Health)
                .. " / "
                .. math.floor(Humanoid.MaxHealth)
        )
    end

    if Root then

        local Position = Root.Position

        CreateInfoCard(
            "Coordinates",
            string.format(
                "X: %.1f   Y: %.1f   Z: %.1f",
                Position.X,
                Position.Y,
                Position.Z
            )
        )
    end
end

--========================================
-- SERVER PAGE
--========================================

local function BuildServerPage()

    ClearPage()

    PageTitle.Text = "Server"
    PageDescription.Text = "Information about the current server."

    AddSectionTitle("SERVER INFORMATION")

    CreateInfoCard(
        "Place ID",
        tostring(game.PlaceId)
    )

    CreateInfoCard(
        "Job ID",
        tostring(game.JobId)
    )

    CreateInfoCard(
        "Players",
        tostring(#Players:GetPlayers())
            .. " / "
            .. tostring(Players.MaxPlayers)
    )

    CreateInfoCard(
        "Server Time",
        os.date("%H:%M:%S")
    )

    CreateInfoCard(
        "Game",
        game:GetService("MarketplaceService"):GetProductInfo(
            game.PlaceId
        ).Name
    )
end

--========================================
-- UTILITY OVERLAY
--========================================

local UtilityOverlay = Instance.new("Frame")
UtilityOverlay.Name = "UtilityOverlay"
UtilityOverlay.Size = UDim2.new(0, 210, 0, 90)
UtilityOverlay.Position = UDim2.new(1, -225, 0, 20)
UtilityOverlay.BackgroundColor3 = Theme.Panel
UtilityOverlay.BorderSizePixel = 0
UtilityOverlay.Visible = false
UtilityOverlay.Parent = ScreenGui

local UtilityCorner = Instance.new("UICorner")
UtilityCorner.CornerRadius = UDim.new(0, 12)
UtilityCorner.Parent = UtilityOverlay

local UtilityStroke = Instance.new("UIStroke")
UtilityStroke.Color = Theme.Stroke
UtilityStroke.Thickness = 1
UtilityStroke.Parent = UtilityOverlay

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(1, -20, 0, 25)
FPSLabel.Position = UDim2.new(0, 10, 0, 8)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "FPS: --"
FPSLabel.TextXAlignment = Enum.TextXAlignment.Left
FPSLabel.TextSize = 12
FPSLabel.Font = Enum.Font.GothamMedium
FPSLabel.TextColor3 = Theme.Text
FPSLabel.Parent = UtilityOverlay

local PingLabel = Instance.new("TextLabel")
PingLabel.Size = UDim2.new(1, -20, 0, 25)
PingLabel.Position = UDim2.new(0, 10, 0, 32)
PingLabel.BackgroundTransparency = 1
PingLabel.Text = "Ping: --"
PingLabel.TextXAlignment = Enum.TextXAlignment.Left
PingLabel.TextSize = 12
PingLabel.Font = Enum.Font.GothamMedium
PingLabel.TextColor3 = Theme.Text
PingLabel.Parent = UtilityOverlay

local ClockLabel = Instance.new("TextLabel")
ClockLabel.Size = UDim2.new(1, -20, 0, 25)
ClockLabel.Position = UDim2.new(0, 10, 0, 56)
ClockLabel.BackgroundTransparency = 1
ClockLabel.Text = "Time: --"
ClockLabel.TextXAlignment = Enum.TextXAlignment.Left
ClockLabel.TextSize = 12
ClockLabel.Font = Enum.Font.GothamMedium
ClockLabel.TextColor3 = Theme.Text
ClockLabel.Parent = UtilityOverlay

--========================================
-- UTILITY UPDATE LOOP
--========================================

task.spawn(function()

    local LastTime = tick()
    local Frames = 0

    while ScreenGui.Parent do

        Frames += 1

        local CurrentTime = tick()

        if CurrentTime - LastTime >= 1 then

            local FPS = Frames
            Frames = 0
            LastTime = CurrentTime

            if CreatorState.FPSCounter then
                FPSLabel.Text = "FPS: " .. tostring(FPS)
            end

            if CreatorState.Clock then
                ClockLabel.Text = "Time: " .. os.date("%H:%M:%S")
            end

            if CreatorState.PingCounter then

                local Success, Ping = pcall(function()
                    return LocalPlayer:GetNetworkPing() * 1000
                end)

                if Success then
                    PingLabel.Text =
                        "Ping: " .. math.floor(Ping) .. " ms"
                end
            end
        end

        task.wait()
    end
end)

--========================================
-- UTILITY VISIBILITY
--========================================

task.spawn(function()

    while ScreenGui.Parent do

        local ShowUtility =
            CreatorState.FPSCounter
            or CreatorState.PingCounter
            or CreatorState.Clock

        UtilityOverlay.Visible = ShowUtility

        FPSLabel.Visible = CreatorState.FPSCounter
        PingLabel.Visible = CreatorState.PingCounter
        ClockLabel.Visible = CreatorState.Clock

        task.wait(0.2)
    end
end)

--========================================
-- UTILITIES PAGE
--========================================

local function BuildUtilitiesPage()

    ClearPage()

    PageTitle.Text = "Utilities"
    PageDescription.Text = "Useful creator utilities."

    AddSectionTitle("OVERLAY")

    CreateCreatorToggle(
        "FPS Counter",
        "FPSCounter"
    )

    CreateCreatorToggle(
        "Ping Counter",
        "PingCounter"
    )

    CreateCreatorToggle(
        "Clock",
        "Clock"
    )

    CreateCreatorToggle(
        "Coordinates",
        "Coordinates"
    )

    AddSectionTitle("INFORMATION")

    CreateInfoCard(
        "FPS",
        "Displays an approximate frame rate counter."
    )

    CreateInfoCard(
        "Ping",
        "Displays the local network latency reported by Roblox."
    )
end

--========================================
-- SETTINGS PAGE
--========================================

local Settings = {
    Animations = true,
    DarkMode = true
}

local function BuildSettingsPage()

    ClearPage()

    PageTitle.Text = "Settings"
    PageDescription.Text = "Configure Lunar Creator Hub."

    AddSectionTitle("INTERFACE")

    local AnimationButton = CreateCreatorToggle(
        "Animations",
        "Animations"
    )

    CreatorState.Animations = Settings.Animations

    AnimationButton.MouseButton1Click:Connect(function()
        Settings.Animations = CreatorState.Animations
    end)

    CreateInfoCard(
        "Lunar Creator Hub",
        "Creator-focused interface and utilities."
    )

    AddSectionTitle("CONFIG")

    local ResetButton = Instance.new("TextButton")
    ResetButton.Size = UDim2.new(1, -4, 0, 48)
    ResetButton.BackgroundColor3 = Theme.Panel2
    ResetButton.BorderSizePixel = 0
    ResetButton.Text = "Reset Settings"
    ResetButton.TextSize = 13
    ResetButton.Font = Enum.Font.GothamMedium
    ResetButton.TextColor3 = Theme.Text
    ResetButton.AutoButtonColor = false
    ResetButton.Parent = PageContainer

    local ResetCorner = Instance.new("UICorner")
    ResetCorner.CornerRadius = UDim.new(0, 12)
    ResetCorner.Parent = ResetButton

    ResetButton.MouseButton1Click:Connect(function()

        CreatorState.FPSCounter = true
        CreatorState.PingCounter = true
        CreatorState.Clock = true
        CreatorState.Coordinates = false
        CreatorState.Fullbright = false
        CreatorState.NoFog = false
        CreatorState.TestMode = false

        Settings.Animations = true
        CreatorState.Animations = true
    end)
end

--========================================
-- FINAL PAGE ROUTER
--========================================

local PreviousOpenCreatorPage = OpenCreatorPage

OpenCreatorPage = function(CategoryName)

    if CategoryName == "Dashboard" then

        BuildDashboard()

    elseif CategoryName == "Creator Tools" then

        BuildCreatorTools()

    elseif CategoryName == "Build" then

        BuildBuildPage()

    elseif CategoryName == "Testing" then

        BuildTestingPage()

    elseif CategoryName == "Visuals" then

        BuildVisualsPage()

    elseif CategoryName == "Player" then

        BuildPlayerPage()

    elseif CategoryName == "Server" then

        BuildServerPage()

    elseif CategoryName == "Utilities" then

        BuildUtilitiesPage()

    elseif CategoryName == "Settings" then

        BuildSettingsPage()

    else

        PreviousOpenCreatorPage(CategoryName)
    end
end

--========================================
-- RECONNECT CATEGORY BUTTONS
--========================================

for _, Category in ipairs(Categories) do

    local Data = CategoryButtons[Category.Name]

    if Data then

        Data.Button.MouseButton1Click:Connect(function()

            CurrentCategory = Category.Name

            for _, Other in pairs(CategoryButtons) do

                Tween(Other.Button, 0.15, {
                    BackgroundColor3 = Theme.Panel
                }):Play()

                Tween(Other.Text, 0.15, {
                    TextColor3 = Theme.SubText
                }):Play()

                Tween(Other.Icon, 0.15, {
                    TextColor3 = Theme.SubText
                }):Play()
            end

            Tween(Data.Button, 0.18, {
                BackgroundColor3 = Theme.PurpleDark
            }):Play()

            Tween(Data.Text, 0.18, {
                TextColor3 = Theme.Text
            }):Play()

            Tween(Data.Icon, 0.18, {
                TextColor3 = Theme.PurpleSoft
            }):Play()

            OpenCreatorPage(Category.Name)
        end)
    end
end

--========================================
-- MINIMIZE SYSTEM
--========================================

local IsMinimized = false

MinimizeButton.MouseEnter:Connect(function()

    Tween(MinimizeButton, 0.15, {
        BackgroundColor3 = Theme.Hover
    }):Play()
end)

MinimizeButton.MouseLeave:Connect(function()

    Tween(MinimizeButton, 0.15, {
        BackgroundColor3 = Theme.Panel2
    }):Play()
end)

MinimizeButton.MouseButton1Click:Connect(function()

    if IsMinimized then
        return
    end

    IsMinimized = true

    local Center = Main.AbsolutePosition
        + (Main.AbsoluteSize / 2)

    MiniButton.Position = UDim2.fromOffset(
        Center.X - 27,
        Center.Y - 27
    )

    MiniButton.Visible = true
    MiniButton.BackgroundTransparency = 1
    MiniButton.Size = UDim2.new(0, 20, 0, 20)

    Tween(MiniButton, 0.3, {
        BackgroundTransparency = 0,
        Size = UDim2.new(0, 54, 0, 54)
    }):Play()

    Tween(Main, 0.3, {
        Size = UDim2.new(0, 54, 0, 54),
        Position = UDim2.fromOffset(
            Center.X - 27,
            Center.Y - 27
        ),
        BackgroundTransparency = 1
    }):Play()

    task.wait(0.3)

    Main.Visible = false
end)

--========================================
-- RESTORE SYSTEM
--========================================

MiniButton.MouseButton1Click:Connect(function()

    if not IsMinimized then
        return
    end

    IsMinimized = false

    local Center = MiniButton.AbsolutePosition
        + (MiniButton.AbsoluteSize / 2)

    Main.Visible = true
    Main.BackgroundTransparency = 1
    Main.Size = UDim2.new(0, 54, 0, 54)
    Main.Position = UDim2.fromOffset(
        Center.X - 27,
        Center.Y - 27
    )

    Tween(Main, 0.35, {
        Size = UDim2.new(0, 780, 0, 510),
        Position = UDim2.new(0.5, -390, 0.5, -255),
        BackgroundTransparency = 0
    }):Play()

    Tween(MiniButton, 0.2, {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 20, 0, 20)
    }):Play()

    task.wait(0.2)

    MiniButton.Visible = false
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

        Input.Changed:Connect(function()

            if Input.UserInputState == Enum.UserInputState.End then
                MiniDragging = false
            end
        end)
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

--========================================
-- CLOSE CLEANUP
--========================================

CloseButton.MouseButton1Click:Connect(function()

    UtilityOverlay:Destroy()

    for _, Object in ipairs(workspace:GetDescendants()) do

        local PartESP = Object:FindFirstChild("LunarCreatorPart")
        local ModelESP = Object:FindFirstChild("LunarCreatorModel")

        if PartESP then
            PartESP:Destroy()
        end

        if ModelESP then
            ModelESP:Destroy()
        end
    end
end)

--========================================
-- FINAL
--========================================

print("========================================")
print("Lunar Creator Hub")
print("PART 3/3 loaded")
print("Player tools ready")
print("Server tools ready")
print("Utilities ready")
print("Settings ready")
print("========================================")

local Intro = {}
local TweenService = game:GetService("TweenService")
function Intro.MakeInstance(class, properties)
    local inst = Instance.new(class)
    for name, v in pairs(properties) do
        inst[name] = v
    end
    return inst
end

local custom_assets = {
    MoonHookIcon = getcustomasset("Moonhook/MoonHook.png"),
    MoonHookText = getcustomasset("Moonhook/MoonHookText.png"),
    Bedwars_Thumbnail = getcustomasset("Moonhook/Bedwars.jpeg")
}
Intro["GuiIntro"] = Intro.MakeInstance("ScreenGui", {
    Name = "IntroGui_MoonHook",
    Enabled = true,
    ResetOnSpawn = false,
    DisplayOrder = 50,
    Parent = game:GetService("CoreGui")
})
Intro["Thumbnail"] = Intro.MakeInstance("ImageLabel", {
    Name = "Thumbnail",
    Size = UDim2.new(0, 550, 0, 500),
    Position = UDim2.new(1, -320, 0, -60),
    AnchorPoint = Vector2.new(0, 0),
    Image = custom_assets.Bedwars_Thumbnail,
    ImageTransparency = 1,
    BackgroundTransparency = 1,
    Parent = Intro["GuiIntro"]
})
Intro["Fade"] = Intro.MakeInstance("UIGradient", {
    Rotation = 180,
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0,0),
        NumberSequenceKeypoint.new(0.7,0),
        NumberSequenceKeypoint.new(1,1)
    }),
    Parent = Intro["Thumbnail"]
})
Intro["IntroFrame"] = Intro.MakeInstance("Frame", {
    Name = "IntroFrame",
    Position = UDim2.new(0.5, 0, -50, 0),
    BackgroundColor3 = Color3.new(0, 0, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 200, 0, 200),
    BorderSizePixel = 0,
    Parent = Intro["GuiIntro"]
})
Intro["Size"] = Intro.MakeInstance("UIScale", {
    Parent = Intro["IntroFrame"]
})
Intro["ImagesContainer"] = Intro.MakeInstance("ScrollingFrame", {
    Size = Intro["IntroFrame"].Size,
    BackgroundTransparency = 1,
    CanvasSize = Intro["IntroFrame"].Size,
    ScrollBarThickness = 0,
    ClipsDescendants = true,
    Parent = Intro["IntroFrame"]
})
Intro["MoonHookIcon"] = Intro.MakeInstance("ImageLabel", {
    Size = Intro["IntroFrame"].Size,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 0, -30, 0),
    Image = custom_assets.MoonHookIcon,
    Parent = Intro["ImagesContainer"]
})
Intro["MoonHookText"] = Intro.MakeInstance("ImageLabel", {
    Size = Intro["IntroFrame"].Size,
    Position = UDim2.new(0, 0, 30, 0),
    BackgroundTransparency = 1,
    Image = custom_assets.MoonHookText,
    Parent = Intro["ImagesContainer"]
})
Intro["Stroke"] = Intro.MakeInstance("UIStroke", {
    Thickness = 0.3,
    Color = Color3.fromRGB(255, 255, 255),
    Parent = Intro["IntroFrame"]
})
Intro["IntroCredit"] = Intro.MakeInstance("TextLabel", {
    Text = "Intro Credits: Wild Wide",
    TextSize = 4.5,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Position = UDim2.new(0, 100, 0, 5),
    Parent = Intro["IntroFrame"]
})

task.spawn(function()
    local info = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local tween = TweenService:Create(Intro["IntroFrame"], info, {["Position"] = UDim2.new(0.5, 0, 0.5, 0)})
    local tween2 = TweenService:Create(Intro["Thumbnail"], info, {["ImageTransparency"] = 0})
    tween:Play()
    tween2:Play()
end)

task.wait(1.5)
task.spawn(function()
    local info = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local tween1 = TweenService:Create(Intro["MoonHookIcon"], info, {Position = UDim2.new(0, 0, 0, 0)})
    local tween2 = TweenService:Create(Intro["MoonHookText"], info, {Position = UDim2.new(0, 0, 0, 0)})
    tween1:Play()
    tween2:Play()
end)
task.wait(2.5)
task.spawn(function()
    local info = TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local tween = TweenService:Create(Intro["Size"], info, {Scale = 0})
    local tween2 = TweenService:Create(Intro["Thumbnail"], info, {["ImageTransparency"] = 1})
    tween:Play()
    tween2:Play()
end)
task.wait(0.3)
Intro["GuiIntro"]:Destroy()

--[[

================================================================

===          GUIA DE SCRIPT: VERIFICADOR DE GRUPO          ===

================================================================

Versão Melhorada por Gemini

Funcionalidades:

- Painel de configuração fácil de usar.

- Design moderno com cantos arredondados e contornos.

- Botões interativos com efeitos de hover.

- Funcionalidade para copiar o link e fechar a janela.

- Código limpo, comentado e organizado.

================================================================

--]]

--[[ SERVIÇOS DO ROBLOX ]]--

-- É uma boa prática definir os serviços em variáveis no início do script.

local Players = game:GetService("Players")

local TweenService = game:GetService("TweenService")

--[[ CONFIGURAÇÕES ]]--

-- Edite os valores abaixo para personalizar sua GUI facilmente!

local Config = {

    -- Link do seu grupo do Roblox ou Discord

    LinkDoGrupo = "https://rbx-url.com/s9qwO9w-",

    -- Textos da GUI

    Titulo = "ACESSO NECESSÁRIO",

    Descricao = "Para liberar todas as funções do script, você precisa entrar no nosso grupo do Roblox.",

    TextoBotaoCopiar = "Copiar Link",

    TextoBotaoCopiado = "Copiado!",

    TextoTutorial = "TUTORIAL:\n1. Clique para copiar o link.\n2. Cole no seu navegador.\n3. Entre no grupo e re-entre no jogo!",

    -- Aparência e Cores (em RGB, de 0 a 255)

    CorPrincipal = Color3.fromRGB(45, 45, 45),       -- Fundo principal (cinza escuro)

    CorSecundaria = Color3.fromRGB(30, 30, 30),      -- Cor do cabeçalho

    CorDestaque = Color3.fromRGB(220, 50, 50),       -- Cor do botão principal (vermelho)

    CorHover = Color3.fromRGB(255, 80, 80),          -- Cor do botão ao passar o mouse

    CorTextoPrincipal = Color3.fromRGB(255, 255, 255),-- Cor do texto (branco)

    CorContorno = Color3.fromRGB(120, 120, 120),

    -- Fontes

    FonteTitulo = Enum.Font.SourceSansBold,

    FonteCorpo = Enum.Font.SourceSans

}

--[[ FUNÇÕES AUXILIARES ]]--

-- Função para criar um efeito de tween (animação suave) nos botões

local function criarTween(objeto, propriedades)

    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    return TweenService:Create(objeto, tweenInfo, propriedades)

end

--[[ CRIAÇÃO DA GUI ]]--

-- 1. Tela Principal (ScreenGui)

local screenGui = Instance.new("ScreenGui")

screenGui.ResetOnSpawn = false

screenGui.Name = "VerificadorGrupoGUI"

-- 2. Frame Principal (a janela da GUI)

local mainFrame = Instance.new("Frame")

mainFrame.Name = "MainFrame"

mainFrame.Parent = screenGui

mainFrame.Size = UDim2.new(0, 420, 0, 280)

mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

mainFrame.BackgroundColor3 = Config.CorPrincipal

mainFrame.BorderSizePixel = 0

mainFrame.Active = true -- Permite arrastar

mainFrame.Draggable = true -- Permite arrastar

-- Adiciona cantos arredondados ao frame principal

local uiCornerFrame = Instance.new("UICorner")

uiCornerFrame.CornerRadius = UDim.new(0, 12)

uiCornerFrame.Parent = mainFrame

-- 3. Cabeçalho (Header)

local header = Instance.new("Frame")

header.Name = "Header"

header.Parent = mainFrame

header.Size = UDim2.new(1, 0, 0, 40)

header.BackgroundColor3 = Config.CorSecundaria

header.BorderSizePixel = 0

-- Cantos arredondados apenas na parte de cima do cabeçalho

local uiCornerHeader = Instance.new("UICorner")

uiCornerHeader.CornerRadius = UDim.new(0, 12)

uiCornerHeader.Parent = header

-- 4. Título da GUI

local titulo = Instance.new("TextLabel")

titulo.Name = "Titulo"

titulo.Parent = header

titulo.Size = UDim2.new(1, -50, 1, 0) -- Deixa espaço para o botão de fechar

titulo.Position = UDim2.new(0, 15, 0, 0)

titulo.BackgroundTransparency = 1

titulo.TextColor3 = Config.CorTextoPrincipal

titulo.Font = Config.FonteTitulo

titulo.TextSize = 18

titulo.Text = Config.Titulo

titulo.TextXAlignment = Enum.TextXAlignment.Left

-- 5. Botão de Fechar (X)

local botaoFechar = Instance.new("TextButton")

botaoFechar.Name = "BotaoFechar"

botaoFechar.Parent = header

botaoFechar.Size = UDim2.new(0, 30, 0, 30)

botaoFechar.Position = UDim2.new(1, -35, 0.5, 0)

botaoFechar.AnchorPoint = Vector2.new(0.5, 0.5)

botaoFechar.BackgroundColor3 = Config.CorSecundaria

botaoFechar.TextColor3 = Config.CorTextoPrincipal

botaoFechar.Font = Enum.Font.SourceSansBold

botaoFechar.TextSize = 20

botaoFechar.Text = "X"

botaoFechar.BackgroundTransparency = 0.5

-- 6. Descrição principal

local descricao = Instance.new("TextLabel")

descricao.Name = "Descricao"

descricao.Parent = mainFrame

descricao.Size = UDim2.new(1, -40, 0, 60)

descricao.Position = UDim2.new(0.5, 0, 0.35, 0)

descricao.AnchorPoint = Vector2.new(0.5, 0.5)

descricao.BackgroundTransparency = 1

descricao.TextColor3 = Config.CorTextoPrincipal

descricao.Font = Config.FonteCorpo

descricao.TextSize = 16

descricao.TextWrapped = true

descricao.Text = Config.Descricao

-- 7. Botão de Copiar Link

local botaoCopiar = Instance.new("TextButton")

botaoCopiar.Name = "BotaoCopiar"

botaoCopiar.Parent = mainFrame

botaoCopiar.Size = UDim2.new(0, 180, 0, 45)

botaoCopiar.Position = UDim2.new(0.3, 0, 0.65, 0)

botaoCopiar.AnchorPoint = Vector2.new(0.5, 0.5)

botaoCopiar.BackgroundColor3 = Config.CorDestaque

botaoCopiar.TextColor3 = Config.CorTextoPrincipal

botaoCopiar.Font = Config.FonteTitulo

botaoCopiar.TextSize = 18

botaoCopiar.Text = Config.TextoBotaoCopiar

local uiCornerBotao = Instance.new("UICorner")

uiCornerBotao.CornerRadius = UDim.new(0, 8)

uiCornerBotao.Parent = botaoCopiar

local uiStrokeBotao = Instance.new("UIStroke")

uiStrokeBotao.Color = Color3.new(1, 1, 1)

uiStrokeBotao.Thickness = 0

uiStrokeBotao.Transparency = 0.5

uiStrokeBotao.Parent = botaoCopiar

-- 8. Texto do Tutorial

local tutorial = Instance.new("TextLabel")

tutorial.Name = "Tutorial"

tutorial.Parent = mainFrame

tutorial.Size = UDim2.new(0, 180, 0, 100)

tutorial.Position = UDim2.new(0.75, 0, 0.73, 0)

tutorial.AnchorPoint = Vector2.new(0.5, 0.5)

tutorial.BackgroundTransparency = 1

tutorial.TextColor3 = Config.CorTextoPrincipal

tutorial.Font = Config.FonteCorpo

tutorial.TextSize = 14

tutorial.TextWrapped = true

tutorial.TextXAlignment = Enum.TextXAlignment.Left

tutorial.Text = Config.TextoTutorial

--[[ LÓGICA E EVENTOS ]]--

-- Evento para fechar a GUI

botaoFechar.MouseButton1Click:Connect(function()

    screenGui:Destroy()

end)

-- Evento para copiar o link

botaoCopiar.MouseButton1Click:Connect(function()

    if setclipboard then

        setclipboard(Config.LinkDoGrupo)

        botaoCopiar.Text = Config.TextoBotaoCopiado

        wait(2)

        botaoCopiar.Text = Config.TextoBotaoCopiar

    else

        warn("'setclipboard' não está disponível neste executor.")

        botaoCopiar.Text = "Erro!"

        wait(2)

        botaoCopiar.Text = Config.TextoBotaoCopiar

    end

end)

-- Efeitos de Hover para os botões

local tweenCopiarEnter = criarTween(botaoCopiar, {BackgroundColor3 = Config.CorHover})

local tweenCopiarLeave = criarTween(botaoCopiar, {BackgroundColor3 = Config.CorDestaque})

local tweenFecharEnter = criarTween(botaoFechar, {BackgroundTransparency = 0})

local tweenFecharLeave = criarTween(botaoFechar, {BackgroundTransparency = 0.5})

botaoCopiar.MouseEnter:Connect(function() tweenCopiarEnter:Play() end)

botaoCopiar.MouseLeave:Connect(function() tweenCopiarLeave:Play() end)

botaoFechar.MouseEnter:Connect(function() tweenFecharEnter:Play() end)

botaoFechar.MouseLeave:Connect(function() tweenFecharLeave:Play() end)

--[[ FINALIZAÇÃO ]]--

-- Adiciona a GUI à tela do jogador

screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

print("GUI de Verificação de Grupo carregada com sucesso!")

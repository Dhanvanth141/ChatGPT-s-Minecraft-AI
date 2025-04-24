-- Bounty to find em
local monitor = peripheral.find("monitor")
if not monitor then
    print("MAYONAISE ON A ESCALATOR.. expect the esclator isn't working (NO MONITOR) ")
    return
end

-- the computer is gray too yay
monitor.setBackgroundColor(colors.gray)
monitor.clear()
monitor.setTextColor(colors.white)

-- where me cursor
local cursorY = 1

-- Handle me history AND I'LL GET YOU A BISCUIT, monitor oh monita
local function writeToMonitor(text)
    local width, height = monitor.getSize()
    if cursorY > height then
        monitor.scroll(1)
        cursorY = height
        monitor.setCursorPos(1, cursorY)
        monitor.clearLine()
    end
    monitor.setCursorPos(1, cursorY)
    monitor.write(text)
    cursorY = cursorY + 1
end

-- pattern based ai (i told ai not to reinvent the wheel)
local function getAIResponse(input)
    input = input:lower()
    if input:find("hello") or input:find("hi") then
        return "Hello! How can I assist you today?"
    elseif input:find("how are you") then
        return "I'm just a bunch of code, but I'm functioning as expected!"
    elseif input:find("bye") or input:find("exit") then
        return "Goodbye! Have a great day!"
    elseif input:find("help") then
        return "You can greet me, ask how I am, or say 'bye' to exit."
    else
        return "I'm not sure how to respond to that."
    end
end

-- handle the shit we shit and shit pattern shits
while true do
    term.setTextColor(colors.white)
    term.write("You: ")
    local userInput = read()
    writeToMonitor("You: " .. userInput)
    local aiReply = getAIResponse(userInput)
    writeToMonitor("AI: " .. aiReply)
    if userInput:lower():find("bye") or userInput:lower():find("exit") then
        break
    end
end

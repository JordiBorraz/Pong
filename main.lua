local w, h -- Variables to store the screen width and height

local ballX, ballY -- Variables to store the position of the ball in the screen (Uncomment at the start of TODO 6)
local ballSpeed -- Variable to store the ball speed (Uncomment at the start of TODO 8)
local playerX, playerY, cpuX, cpuY -- Variables to store the position of the player and cpu paddle (Uncomment at the start of TODO 10)
local paddleSpeed -- Variable to store the paddle speed (Uncomment at the start of TODO 12)
local ballAngle -- Variable to estore the ball movement angle (Uncomment at the start of TODO 16)
local playerPoints, cpuPoints -- Variable to store the player and cpu points (Uncomment at the start of TODO 21)
local ballRadius

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  -- TODO 5: Load the font to use in the game and set it
  font = love.graphics.newFont("pong.ttf", 60)
  love.graphics.setFont(font)
  -- TODO 6: Initialize the position of the ball at the center of the screen
  ballX = w/2
  ballY = h/2
  -- TODO 8: Initialize the ball speed for going to the left
  --ballSpeed = -3
  -- TODO 10: Initialize the player and cpu paddles position
  playerX = 30
  playerY = 230 --275 original
  cpuX = 775
  cpuY = 275
  -- TODO 12: Initialize the paddle speed
  paddleSpeed = 3
  -- TODO 16: Initialize the ball angle
  ballAngle=50
  
  -- TODO 18: Comment all the code of the TODO 8 and initialize the ball speed without sign
  ballSpeed = 3
  -- TODO 21: Initialize the player and cpu points variables
  playerPoints = 0
  cpuPoints = 0
  
  ballRadius = 20
end

function love.update(dt)
  -- TODO 9: Make the ball move using the ballSpeed variable
  -- TODO 17: Comment all the code of the TODO 9 and make the ball move using the ballAngle variable
 ballX = ballX + ballSpeed * math.cos(ballAngle);
 ballY = ballY + ballSpeed * math.sin(ballAngle);
  -- TODO 13: Move the player paddle getting the up and down arrows keys of the keyboard using the variable paddleSpeed
  if love.keyboard.isDown("up") then
    playerY = playerY - paddleSpeed
  end
if love.keyboard.isDown("down") then
  playerY = playerY + paddleSpeed
end

  -- TODO 14: Detect the ball collision with the player paddle and make it bounce
DeltaX= ballX - math.max(playerX, math.min(ballX,playerX+10));
DeltaY = ballY - math.max(playerY, math.min(ballY, playerY+50));
if(DeltaX*DeltaX+DeltaY*DeltaY)<(20*20)then
  ballSpeed=3
end

  -- TODO 15: Detect the ball collision with the cpu paddle and make it bounce
DeltaXCpu= ballX - math.max(cpuX, math.min(ballX,cpuX+10));
DeltaYCpu = ballY - math.max(cpuY, math.min(ballY, cpuY+50));
if(DeltaXCpu*DeltaXCpu+DeltaYCpu*DeltaYCpu)<(20*20)then
  ballSpeed=-3
end



  -- TODO 25: Add the needed code at TODO 19 to make the ball quicker at paddle collision
  -- TODO 19: Comment all the code of the TODO 14 and TODO 15 and make it bounce using the new ball angle
  
  -- TODO 20: Detect the ball collision with the top and bottom of the field and make it bounce
     if ballY < ballRadius/2 then 
       ballY = ballY + ballSpeed
     end
     if ballY > h - ballRadius/2 then
       ballY = ballY - ballSpeed
     end
     
  --DeltaY = ballY - math.max(playerY, math.min(ballY, playerY+50));
  
  -- TODO 26: Add the needed code at TODO 23 to reset the ball speed
  -- TODO 23: Detect the ball collision with the player and cpu sides, increse the points accordingly and reset the ball
  if ballX <= 5 then
    cpuPoints = cpuPoints +1
    ballX = w/2
    ballY = h/2
    ballSpeed = 3
  end
  if ballX >= 795 then
    playerPoints = playerPoints + 1
    ballX = w/2
    ballY = h/2
    ballSpeed = 3
  end
  
  
  -- TODO 24: Make the cpu paddle move to get the ball
  if (ballY < cpuY) then
    cpuY = cpuY - paddleSpeed
  elseif (ballY > cpuY) then
    cpuY = cpuY + paddleSpeed
  else
  end
end

function love.draw()
  -- TODO 1: Draw the center of the field
  love.graphics.line(w/2, 0, w/2, h)
  love.graphics.setLineWidth(4)
  -- TODO 2: Draw the ball at the center of the field
  --love.graphics.circle("fill",w/2, h/2, 25)
  -- TODO 3: Draw the player and cpu paddles
  --love.graphics.rectangle("fill", 5, 275, 10, 50)
  --love.graphics.rectangle("fill", 785, 275, 10, 50)
  -- TODO 4: Draw the player and cpu points
  --love.graphics.print("0",font, 200, 10)
  --love.graphics.print("0",font, 600, 10)
  -- TODO 7: Comment all the code of the TODO 2 and use the ballX and ballY variables to draw the ball
  love.graphics.circle("fill",ballX, ballY, ballRadius)
  -- TODO 11: Comment all the code of the TODO 3 and use the playerX, playerY, cpuX and cpuY variables to draw the player and cpu paddles
  love.graphics.rectangle("fill", playerX, playerY, 10, 50)
  love.graphics.rectangle("fill", cpuX, cpuY, 10, 50)
  -- TODO 22: Comment all the code of the TODO 4 and use the playerPoints and cpuPOints variables to draw the points
  love.graphics.print(playerPoints,font, 200, 10)
  love.graphics.print(cpuPoints,font, 600, 10)
end
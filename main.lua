 
button_flag = 1
draw_flag = false
function love.load()
	love.filesystem.setIdentity("Desktop/doodle/Notes")
	MASTER_CLOCK = 0
	ctrl_clock = 0
	ctrl_counter = 0
	check = love.graphics.newImage("Images/check.png")
	hand = love.graphics.newImage("Images/hand.jpg")
	pen = love.graphics.newImage("Images/pen.png")
	button_color = {255,0,0}
	button_color_2 = {0,255,0}
	button_color_3 = {255,255,0}
	button_color_4 = {255,0,255}
	button_color_5 = {0,255,255}
	colors = {button_color, button_color_2, button_color_3, button_color_4, button_color_5}
	button_flag_2 = true
	points = {}
	temp = {}
	scroll_vel = 70
	draw_mode = "select" -- either SELECT, DRAW, or...
	scroll_position = 0
	BP = {{10,110, 556, 589}} --BUTTON POSITIONS!!! IMPORTANT!!!
	scroll_flag = false
	tool_wheel_flag = false
	hover_flag = false
	eraser_flag = false
	save_flag = false
end

function love.update(dt)
	MASTER_CLOCK = MASTER_CLOCK + dt
	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()
	if button_flag == true then
		button_color = {0,255,0}
	else
		button_color = {255,0,0}
	end
	if button_flag_2 == true then
		button_color_2 = {0,255,0}
	else
		button_color_2 = {255,0,0}
	end
	if draw_flag == true and love.mouse.isDown(1) then
		points[#points + 1] = {mouseX, mouseY + scroll_position, colors[button_flag]} 
	else
		--ERROR HANDELING: STROKE RECOGNITION
		if points[#points] ~= "end_stroke" then
			points[#points + 1] = "end_stroke"
		end
		if mouseX >= 10 and mouseX < 110 then
			if mouseY >= 556 and mouseY <= 589 then
				draw_flag = false
				if love.mouse.isDown(1) then
					button_flag = 1
				end
			else
				draw_flag = true
			end	
		end
		if mouseX >= 110 and mouseX < 210 then
			if mouseY >= 556 and mouseY <= 589 then
				draw_flag = false
				if love.mouse.isDown(1) then
					button_flag = 2
				end
			else
				draw_flag = true
			end	
		end
		if mouseX >= 210 and mouseX < 310 then
			if mouseY >= 556 and mouseY <= 589 then
				draw_flag = false
				if love.mouse.isDown(1) then
					button_flag = 3
				end
			else
				draw_flag = true
			end	
		end
		if mouseX >= 310 and mouseX < 410 then
			if mouseY >= 556 and mouseY <= 589 then
				draw_flag = false
				if love.mouse.isDown(1) then
					button_flag = 4
				end
			else
				draw_flag = true
			end	
		end
		if mouseX >= 410 and mouseX < 510 then
			if mouseY >= 556 and mouseY <= 589 then
				draw_flag = false
				if love.mouse.isDown(1) then
					button_flag = 5
				end
			else
				draw_flag = true
			end	
		end
		--SCROLLER
		if mouseX >= 730 and mouseX <= 800 then
			if mouseY >= 0 and mouseY <= 600 then
				draw_flag = false
				if love.mouse.isDown(1) then
					if mouseY > scroll_position then
						scroll_position = scroll_position + scroll_vel * dt
					elseif mouseY <= scroll_position then
						scroll_position = scroll_position - scroll_vel * dt
					end
					
					
					scroll_flag = true
				end
			else
				draw_flag = true
			end	
		end
		if mouseX >= 610 and mouseX < 710 then
			if mouseY >= 490 and mouseY <= 590 then
				draw_flag = false
			else
				draw_flag = true
			end
		end	
	end --800-70, 0, 70, 600
	if love.keyboard.isDown("lctrl") then
		if love.keyboard.isDown("z") then
		
		elseif love.keyboard.isDown("x") then
		
		elseif love.keyboard.isDown("b") then
		
		elseif love.keyboard.isDown("c") then
		
		elseif love.keyboard.isDown("v") then
		
		elseif love.keyboard.isDown("rctrl") then
			love.load()
		end
	end
	if love.keyboard.isDown("escape") and love.keyboard.isDown("f2") then
		love.event.quit()
	end
end	

function love.draw()

	for i = 1, (#points-1) do
		if points[i+1] ~= "end_stroke" and points[i] ~= "end_stroke" then
			love.graphics.setColor(points[i][3])
			love.graphics.line(points[i][1], points[i][2] - scroll_position, points[i+1][1], points[i+1][2] - scroll_position)
		end
	end	
	local s0 = love.graphics.getPointSize()
	local s = love.graphics.getPointSize() + 3
	love.graphics.setColor(button_color)
	love.graphics.rectangle("fill", 10, 556, 100, 33)
	love.graphics.setColor(button_color_2)
	love.graphics.rectangle("fill", 110, 556, 100, 33)
	love.graphics.setColor(button_color_3)
	love.graphics.rectangle("fill", 210, 556, 100, 33)
	love.graphics.setColor(button_color_4)
	love.graphics.rectangle("fill", 310, 556, 100, 33)
	love.graphics.setColor(button_color_5)
	love.graphics.rectangle("fill", 410, 556, 100, 33)
	love.graphics.setColor(0,0,255)
	love.graphics.rectangle("line", 210, 556, 100, 33)
	love.graphics.rectangle("line", 10, 556, 100, 33)
	love.graphics.rectangle("line", 110, 556, 100, 33)
	love.graphics.rectangle("line", 310, 556, 100, 33)
	love.graphics.rectangle("line", 410, 556, 100, 33)
	love.graphics.setPointSize(s)
	love.graphics.setPointSize(s0)
	love.graphics.setColor(0,0,0)
	love.graphics.line(10 + (button_flag - 1) * 100, 556 + 33/2, 10 + button_flag * 100, 556 + 33/2)
	love.graphics.line(10 + (button_flag - 1) * 100, 556 + 33/4, 10 + button_flag * 100, 556 + 33/4)
	love.graphics.line(10 + (button_flag - 1) * 100, 556 + 99/4, 10 + button_flag * 100, 556 + 99/4)
	love.graphics.line(10 + (button_flag - 1 + 1/2) * 100, 556, 10 + (button_flag - 1 + 1/2) * 100, 556 + 33)
	love.graphics.line(10 + (button_flag - 1 + 1/4) * 100, 556, 10 + (button_flag - 1 + 1/4) * 100, 556 + 33)
	love.graphics.line(10 + (button_flag - 1 + 3/4) * 100, 556, 10 + (button_flag - 1 + 3/4) * 100, 556 + 33)
	love.graphics.setColor(100,255,0)
	love.graphics.rectangle("fill", 800-70, 0, 70, 600)
	love.graphics.setColor(0,0,0)
	love.graphics.line(800-70/2, 0, 800-70/2, 600)
	love.graphics.setColor(0,100,0)
	love.graphics.rectangle("fill", 800-70, scroll_position, 70, 62)
	love.graphics.setColor(255,255,255)
	if draw_flag == true then
		love.graphics.draw(pen, 10 + 6 * 100, 600 - 10 - 100, 0, 100/pen:getWidth(), 100/pen:getHeight())
		love.graphics.setColor(0,0,255)
	elseif draw_flag == false then
		love.graphics.draw(hand, 10 + 6 * 100, 600 - 10 - 100, 0, 100/hand:getWidth(), 100/hand:getHeight())
		love.graphics.setColor(255,0,0)
	end
	love.graphics.rectangle("line", 610, 490, 100, 100)
	if love.keyboard.isDown("lctrl") then
		love.graphics.setColor(255,255,255)
		love.graphics.printf("Menu: \n Press Z for coordinate grid \n Press X for right angle \n Press C for circle \n Press V for straight edge \n Press B to save! \n Press RCTRL to erase",100,400,300, "left")
		if love.keyboard.isDown("z") then
		
		elseif love.keyboard.isDown("x") then
		
		elseif love.keyboard.isDown("b") then
		
		elseif love.keyboard.isDown("c") then
		
		elseif love.keyboard.isDown("v") then
		
		elseif love.keyboard.isDown("rctrl") then
			love.load()
		end
	end
end

function love.keypressed(k)
	if k == "z" then
		button_flag = 1
	end	
	if k == "x" then
		button_flag = 2
	end
	if k == "c" then
		button_flag = 3
	end
	if k == "v" then
		button_flag = 4
	end
	if k == "b" then
		button_flag = 5
	end
	if k == "space" then
		if draw_flag == true then
			draw_flag = false
		elseif draw_flag == false then
			draw_flag = true
		end
	end
	if k == "f1" then
		success = love.window.showMessageBox("some string", os.time(), "error")
		local screenshot = love.graphics.newScreenshot()
		screenshot:encode("png", os.time() .. ".png")
	end
	if k == "return" then
		success = love.window.showMessageBox("Save Result!", "Your notes have been saved as " .. os.time() .. ".png!", "error")
		local screenshot = love.graphics.newScreenshot()
		screenshot:encode("png", os.time() .. ".png")
		love.load()
	end
end

function love.keyreleased(j)
	
end

function love.mousereleased(m)

end

function love.mousepressed(x,y,n,b)
	if n == 1 then
		if x >= 610 and x < 710 then
			if y >= 490 and y <= 590 then
				if draw_flag == true then
					draw_flag = false
				elseif draw_flag == false then
					draw_flag = true
				end
			end
		end	
	end	
end


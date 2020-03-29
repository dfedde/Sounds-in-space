function love.load()
    love.audio.setDistanceModel('inverse')
    shipX = 800 / 2
    shipY = 600 / 2
    shipAngle = 1.5
    shipSpeed = 100
    music = love.audio.newSource("song.ogg", "static")
    audioX = 800 / 2
    audioY = 600 / 2
    music:setVolume(1)
    music:setRelative(false)
    music:setRolloff(0.1)
    music:setAttenuationDistances( 1, 10 )
    music:setCone(0, 1, .2)
    music:setDirection(1, 1, 0)
    music:play()
end

function love.update(dt)
  
    if love.keyboard.isDown('w') then
         shipX = shipX + math.cos(shipAngle) * shipSpeed * dt
         shipY = shipY + math.sin(shipAngle) * shipSpeed * dt
    end

    if love.keyboard.isDown('q') then
         shipAngle = shipAngle - 5 * dt
    end

    if love.keyboard.isDown('e') then
         shipAngle = shipAngle + 5 * dt
    end

    love.audio.setPosition(shipX, shipY)

    love.audio.setOrientation( math.cos(shipAngle), math.sin(shipAngle), 0, 0, 0, -1 )
end

function love.draw()
    love.graphics.print('audio effects enabled: '..tostring(love.audio.isEffectsSupported( )), 0, 15)
    love.graphics.print('oriantationX: '..tostring(math.cos(shipAngle)), 0, 30)
    love.graphics.print('oriantationY: '..tostring(-math.sin(shipAngle)), 0, 45)

    love.graphics.setColor(0, 0, 1)
    love.graphics.circle('fill', shipX, shipY, 30)

    music:setPosition(audioX, audioY)

    love.graphics.setColor(0, 1, 1)
    local shipCircleDistance = 20
    love.graphics.circle(
        'fill',
        shipX + math.cos(shipAngle) * shipCircleDistance,
        shipY + math.sin(shipAngle) * shipCircleDistance,
        5
    )

    love.graphics.circle(
        'fill',
        audioX,
        audioY,
        5
    )

    -- Temporary
    love.graphics.setColor(1, 1, 1)
    love.graphics.print('shipAngle: '..shipAngle)
end

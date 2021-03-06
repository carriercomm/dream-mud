local Player = require "game.Player"

local PlayerManager = class(function(self, world)
	self.players = {}
	self.world = world
end)

function PlayerManager:_findFreeId()
	local id = 1
	while self.players[id] ~= nil do
		id = id + 1
	end
	return id
end

function PlayerManager:createPlayer(connection)
	local id = self:_findFreeId()
	local player = Player.new(id, self.world, connection)
	self.players[id] = player
	return player
end

function PlayerManager:deletePlayer(player)
	self.players[player.id] = nil
end

return PlayerManager


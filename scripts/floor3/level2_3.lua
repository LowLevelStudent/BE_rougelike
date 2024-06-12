local level23 = Entity:New({
	components = {
		transform = { size = { width = 1920, height = 1080 } },
		tilemapRender = { tilemap = "floor3Room" },
	},
})

function level23:OnCreate()
	CanLeaveLevel2_1 = false
  EntitiesToKill = 0
end

function level23:OnStart()
  SpawnEntity("WallHorizontal", 1920 / 2, 100, 0)
	SpawnEntity("WallHorizontal", 1920 / 2, 1080 - 30, 0)
	SpawnEntity("WallVertical", 70, 1080 / 2, 0)
	SpawnEntity("WallVertical", 1920 - 70, 1080 / 2, 0)

	playerID = SpawnEntity("Player", LastPlayerPos.x, LastPlayerPos.y, 0)

	local ent = Ecs:GetEntity(playerID)
	local playerX, playerY = GetEntityPos(ent)
	local holderID = SpawnEntity("WeaponHolder", playerX, playerY, 0)
	weaponID = SpawnEntity(PlayerGun, playerX + 50, playerY, 0)
	SetEntityParent(weaponID, holderID)
	SetEntityParent(holderID, playerID)

	ent.holder = holderID
	ent.weapon = weaponID

  local doorID = SpawnEntity("Door", 2 * 1920 / 3, 1080 - 60, 0)
	FlipDown(Ecs:GetEntity(doorID))

end

function level23:OnUpdate(deltaTime)
	if EntitiesToKill <= 0 then
		CanLeaveLevel1_1 = true
		RoomsToClear = RoomsToClear - 1
	end
end


return level23



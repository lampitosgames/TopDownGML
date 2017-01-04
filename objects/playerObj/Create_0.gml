///@description Set Movement Constants

phy_fixed_rotation = true;

dir = [0, 1];
isInPitfall = false;
lastSafePos = [x, y];

maxSpeed = 400;
dirForceMag = 110;

isJumping = false;
isSprinting = false;
isSneaking = false;

jumpTimer = 0;
jumpModifier = 0.045;
jumpCooldownMod = 2.5;
jumpLengthMod = 6;

sprintMod = 1.5;
sneakMod = 0.4;
//How long (in seconds) before the sprint bonus can be applied to jumps
sprintWarmup = 0.5;
sprintWarmupCounter = 0;
///@description Set Movement Constants
//Parent character
char = undefined;

//Direction
dir = [0, 1];
maxSpeed = 400;
dirForceMag = 110;
lastSafePos = [x, y];

/* Constants related to jumping */
startJump = false;
isJumping = false;
//jumpTimer is used to count steps for jump length and jump cooldown
jumpTimer = 0;
//jumpModifier*maxSpeed*dirVec = jump velocity
jumpModifier = 4.7;
//1 second / jumpCooldownMod is the minimum time between jumps
jumpCooldownMod = 5;
// 1 second / jumpLengthMod is how long a jump lasts
jumpLengthMod = 6;


/* Constants related to sneaking/walking */
isSneaking = false;
//sneakMod*maxSpeed = sneak/walk speed
sneakMod = 0.4;


/* Constants related to sprinting */
isSprinting = false;
//sprintMod*maxSpeed = sprint speed
sprintMod = 1.5;


/* Constants related to falling */
isInPitfall = false;
falling = false;
fallTimer = 0;
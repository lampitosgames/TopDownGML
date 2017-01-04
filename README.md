# TopDownGML
A proof of concept for top down games in GM:S 2.  If I can get some core functionality down, I have plans to turn this into a fully fledged story-based top down RPG.

# Development Log #
This is temporary, I'll find a better place later.
#### January 2017 ####
- 01/04/17: Updated lots of movement constants. Jumping feels a lot more natural. Added a prototype tileset and created a test room for platforming across various sized gaps and over water. Added a "falling" effect.
- 01/03/17: Added simple wall collisions. Added a camera with movement acceleration. Changed some player movement constants. Added a toggle-able debug flag.

#### December 2016 ####
- 12/31/16: Switched to physics based movement.  The player now has momentum and a bit of inertia.  Movement feels more clean and natural.  Added basic jumping, sprinting, and sneaking.
- 12/29/16: Added a small 2D vector library with basic functions.  Made the game delta_time based.  Finished input controller to support fully rebindable keys and the possibility for gamepad controls with analog sticks.  Implemented basic movement.
- 12/28/16: Initial project started.  Upgraded to GM:S 2 and started working on an input controller

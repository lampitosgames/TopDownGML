# TopDownGML
A proof of concept for top down games in GM:S 2.  If I can get some core functionality down, I have plans to turn this into a fully fledged story-based top down RPG.

# Development Log #
This is temporary, I'll find a better place later.
#### January 2017 ####
- 01/25/17: Setting up and testing new dev environment on my laptop.
- 01/22/17: Laid the groundwork for vertex-based pathfinding using theta*.  There is now a grid containing obstacles and a grid of "nodes" to path along.  Next step is to implement a line of sight function that takes two nodes and determines if the line between them is valid.
- 01/21/17: Replaced mp_grid with a custom data structure.
- 01/18/17: Started the codebase for AI pathfinding. Currently I'm using game maker's mp_grid data structure, but it is incredibly slow and it will be difficult to pathfind with. Next todo item is creating my own data structure that is more suited to my needs.
- 01/17/17: Started modular character design that uses object composition.
- 01/12/17: Abstracted the player's core movement code into seperate parent object. This marks the start of NPC work.  NPCs will derive from the same 'Character' class as the player, but use AI instead of player input to determine actions.
- 01/11/17: Added basic pause functionality. Overhauled pitfalls to use collision boxes. The player only falls if their entire collision box has entered a pitfall object. Added temporary player art from a different game I have lying around.
- 01/10/17: Added very basic cursor functionality.  The sprite is a placeholder.
- 01/08/17: Overhauled jumping by adding displacement prediction and a jumping 'aim assist'. When jumping, if the player would land in a pitfall, the game checks a 90 deg arc to find a safer landing location.  Also added a script to rotate vectors using a rotation matrix.
- 01/06/17: Refactored the player's step event. I moved lots of code into individual scripts for long-term readability. The player's step event is growing quickly so breaking related logic into scripts seemed appropriate.
- 01/04/17: Updated lots of movement constants. Jumping feels a lot more natural. Added a prototype tileset and created a test room for platforming across various sized gaps and over water. Added a "falling" effect.
- 01/03/17: Added simple wall collisions. Added a camera with movement acceleration. Changed some player movement constants. Added a toggle-able debug flag.

#### December 2016 ####
- 12/31/16: Switched to physics based movement.  The player now has momentum and a bit of inertia.  Movement feels more clean and natural.  Added basic jumping, sprinting, and sneaking.
- 12/29/16: Added a small 2D vector library with basic functions.  Made the game delta_time based.  Finished input controller to support fully rebindable keys and the possibility for gamepad controls with analog sticks.  Implemented basic movement.
- 12/28/16: Initial project started.  Upgraded to GM:S 2 and started working on an input controller

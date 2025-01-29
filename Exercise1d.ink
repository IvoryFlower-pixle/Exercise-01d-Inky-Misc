/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 + A story with at least 6 knots
 + Vary some text via a loop
 + Create a function that serves as a timer. (This is shown in the video)
*/

VAR Lantern = 0
VAR time = -5 

-> Forest_entrance

== Forest_entrance ==
You stood at the entrance to a forest, looking down the path leading deeper inside. You never planned to come to this place, but for some reason...
It felt like something was drawing you here.

* [Enter the forest] -> Forest_path

END

== Forest_path ==
{left_Path: Your back at the turn. |You go down the path, looking around as you walk, the forest was lit up by the afternoon sun making the place feel warm. You can't help but smile at the memories it brings of an old friend you used to play with. After walking for a while, you come across another path heading to the left. }

What do you do?
+ [Go down the left path] -> left_Path
+ [Keep heading strait ] -> Cave_entrance

-> END

== left_Path ==
{Bench: While this place is nice, you can tell this isn't where you need to be. |You turn and head down the left path. You don't find anything interesting for a while until you come across a small clearing with a pond. You look around and notice there to be a stone bench with something on top of it.}

* [Investigate Stone Bench] -> Bench
+ [Go back] -> Forest_path

-> END

== Bench ==
 ~Lantern = Lantern + 1
Walking up to the bench you find a old oil lamp. You take it as you feel it may be of use to you.
* [ Go back] -> left_Path

-> END

== Cave_entrance ==
You keep walking strait and find an entrance to a cave. You knew this was where you needed to be but with how dark the cave was, you needed a light if you wanted to move forward. 

* {Lantern > 0} [Light the Oil Lamp] -> Lit_Cave_Entrance
+ [Go back] -> Forest_path

-> END

== Lit_Cave_Entrance == 
With the path now lit, you could make your way inside. You note that you only have about 40 minutes to find what your looking for before you had to make your way back or risk the lamp going out.

You have {advance_time() } minutes left

+ [Enter the cave] -> Crossroad

-> END

== Crossroad ==
{Left_Tunnel: Since there wasn't much down the left tunnel, you should probably check out the other tunnel. |Walking into the cave, you appreciate the sudden coolness as the heat was starting to bother you. You walk for a few minutes untill you come across two paths to take. One to the left and one to the right. You should be careful in which path you choose.}

You have {advance_time() } Minutes left

+ [Go left] -> Left_Tunnel
+ [Go right] -> Right_Tunnel
* { time == 40} [Out of time] -> Bad_Ending

->END

== Left_Tunnel ==
{Lost_time: You wasted your time coming here, you should head back. |You walk down the left tunnel for some time and come across a small room. Should you investigate?}
You have {advance_time() } Minutes left

* [Investigate] -> Lost_time
+ [Go Back] -> Crossroad
* { time == 40} [Out of time] -> Bad_Ending

-> END

== Lost_time ==
You find nothing, looks like this was just a waste of time.
* [Go back] -> Left_Tunnel

-> END

== Right_Tunnel ==
You go down the right tunnel and come across a big room with lots of things to investigate. What do you do?

You have {advance_time() } Minutes left

* [Investigate crack in the wall] -> crack
* [Investigate pile of rubble] -> rubble
* [Investigate the corners of the room] -> Corner
* [Investigate hole in the floor] -> Floor
* [Investigate the ceiling] -> Ceiling
+ [Go Back] -> Crossroad
* { time == 40} [Out of time] -> Bad_Ending

-> END

== crack ==
You look at the crack in the wall but find nothing. You don't really think you could fit anything in it anyway.
* [Go back] -> Right_Tunnel

-> END

== rubble ==
You dig throught the pile of rubble and eventually you find an old toy. A small stuffed rabbit.
* [Grab toy] -> Good_Ending

-> END

== Corner ==
Sadly you find nothing in the corner.
* [Go back] -> Right_Tunnel

-> END

== Floor ==
You wounder what could of caused there to be a hole in the floor, but soon lose intrest when finding nothing inside.
* [Go back] -> Right_Tunnel

-> END

== Ceiling ==
I don't know why your looking at the ceiling, theres nothing there.

* [Go back] -> Right_Tunnel

-> END

== Good_Ending ==
Grabing the toy, and looking at it. You find yourself recognizing it as a long lost toy of your friend. A toy they had said they had lost when exploring as a child. Sadly that friend had passed away a few months ago so you coulden't return it to them. But at least you could keep it safe in memory of them.

-> END

  == Bad_Ending ==
    You ran out of time and you need to make your way back. TO bad you couldn't find what your looking for.
    -> END

== function advance_time ==

    ~ time = time + 5
    
    {
        - time > 40:
            END
    }    
    
    {    
      - time == 0:
            ~ return "40"
        
        - time == 5:
            ~ return "35"
        
        - time == 10:
            ~ return "30"
        
        - time == 15:
            ~ return "35"
        
          - time == 20:
            ~ return "20"
        
        - time == 25:
            ~ return "15"
        
        - time == 30:
            ~ return "10"
        
          - time == 35:
            ~ return "5"
        
        - time == 40:
            ~ return "0"
        
      
    }
    
    ~ return time
    
  
    

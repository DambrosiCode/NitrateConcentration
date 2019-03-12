As any aquarist will tell you a well cycled tank (IE one where beneficial bacteria will convert fish waste into less harmful nitrates)
is vital to good fish health. However nitrates in large concentrations can be just as unhealthy for aquatic pets. One of the simplest ways
to deal with this is to regularly replace tank water with fresh, clean water. Unfourtunatley full water changes (IE where the entire tank
is replaced with clean water thus eliminating 100% of nitrates) is at best difficult and at worst stressful for the tank denizens. Therefore
partial water changes (usually 20% of the total tank size replaced once a week) are performed instead. However, the amount needed to be changed
and how often is something of a guessing game, as the ammount of nitrates removed in a water change may not out weigh the amount of 
nitrates that the tank gains between then and the next water change, thus failing to reduce the nitrates in the tank long-term. 

Here is a simple script written to take the guess work out of how much/how often tank water should be changed. The script takes three
parameters (the amount of nitrates in your tap water, nitrates currently in your tank, how many gallons are in your tank, and how often you
want to change the water) and outputs a graph with multiple line ranging from 0%-100% water changes, how much your chosen regular 
water changes will affect the long-term nitrate level. 

### Input: ###
Standard parameters (8.5 gal, weekly water change, 10ppm tap water, tank starting out at 20ppm). It's recommended you change these
to match your tank's parameters. 

**water_N(float)**: nitrates in tap water, can be calculated with an at home tank-chemistry set or a local petstore  
**tank_N(float)**: nitrates in tank, can be calculated the same way as above  
**gal(float)**: gallons in tank  
**N_inc(float)**: how much do your nitrates increase per day. Here you will have to do some estimations. Online calculators based on the amount
  of fish and what species exist, or you can simply test the nitrate level changes between two days.   
**change_days(int)**: how often do you change   
**perm.change_days(int)**: same as above

### Output: ###
Line graph with 10 lines, each one designating a different percentage change of your total gallons. Generally nitrates in a tank 
should be around 10ppm, so a regular water change at the percentage that evens out around that is usually best.

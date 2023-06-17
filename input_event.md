# InputEventJoypadMotion

## Xbox 360 and Turle Beach Recon

```
             axis=4                                                      axis=5                            
                \                                                          /                               
                 |                                                        |                                
                 V                                                        V                                
button_index=9    ___   ___---------''''''''''''''''''''---------___   ___    button_index=10              
             \ _-' __--'    button_index=5                          '--__ '-_/                             
            _-' _-'                       \ .--.                         '-_ '-_                           
            \_-'                           (    )                    -Y-    '-_/ <------Y--- button_index=3
            /      (+0)              __     '--'     __                        \                           
           /         |              (__)            (__)      -X-               \ <-----X--- button_index=2
          /    (-1)-- --(+1)         /                \                  -B-     \ <----B--- button_index=1
         /       axis|       button_index=4     button_index=6                    \                        
        /          (-0)                                           -A-              \ <--A--- button_index=0
       /        /                                                                   \                      
      /        /                .---o-.              (-3)                            \                     
     /   button_index=7        /    |  \           axis|                              \                    
    /                         o---+-+   |        (-2)-- --(+2)                         \                   
   |                          |   +-+---o              |                                |                  
   |                           \  |    /             (+3)  \                            |                  
  /                             '-o---'                     '---- button_index=8         \                 
  |                                                                                      |                 
  |                     ___---------''''''''''''''''''''---------___                     |                 
  |                 __--                                            --__                 |                 
  |               _-          ^   ^ ^   ^                               -_               |                 
  |             _-            |   | |   |                                 -_             |                 
   \          _-              |   | |   |                                   -_          /                  
    \_______-'                |   | |   |                                     '-_______/                   
                              |   | |    \                                                                 
                              |   | |     '--- D-RIGHT --- button_index=14                                 
                              |   |  \                                                                     
                              |   |   '--- D-UP ---------- button_index=11                                 
                              |    \                                                                       
                              |     '--- D-DOWN ---------- button_index=12                                 
                               \                                                                           
                                '--- D-LEFT -------------- button_index=13                                 
```

| `button_index` | Button                |
| -------------- | --------------------- |
| 0              | A                     |
| 1              | B                     |
| 2              | X                     |
| 3              | Y                     |
| 4              | "Back" button         |
| 5              | "On" button           |
| 6              | "Start" button        |
| 7              | Left Analog Stick     |
| 8              | Right Analog Stick    |
| 9              | Left Shoulder/Bumper  |
| 10             | Right Shoulder/Bumper |
| 11             | D-Pad Up              |
| 12             | D-Pad Down            |
| 13             | D-Pad Left            |
| 14             | D-Pad Right           |

| `axis` | Location           | Min | Max |
| ------ | ------------------ | --- | --- |
| 0      | Left Analog Stick  | -1  | +1  |
| 1      | Left Analog Stick  | -1  | +1  |
| 2      | Right Analog Stick | -1  | +1  |
| 3      | Right Analog Stick | -1  | +1  |
| 4      | Left Trigger       | 0   | +1  |
| 5      | Right Trigger      | 0   | +1  |

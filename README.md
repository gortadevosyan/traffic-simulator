	The logic of the game is as follows: First user is prompted for some values: width of the road, number of the cars, duration of the green, orange, red lights and then for min and max speeds. Please make sure that you input all the values in the right order, also, time of red light>= time of green+orange lights, please pay attention. Max speed>= Min speed, if the input is incorrect the program crashes.

​	The logic of traffic light is the following: red-green-orange-red, there is no orange light before green.

​	Cars have different sizes, from w/4 to3*w/4 and only integer values, the bigger the w, higher is the number various of car sizes. Length of the car is always two times the width of the car.

​	The key to the victory is in the following: The cars with the smallest and biggest sizes and speed should be able to pass the crossroad under the time T(orange)+T(red)-T(green)-T(orange)=T(red)-T(green). It guarantees a victory for the user, if no car passes under the red light.

Recommended input values:

number of cars: 10+

width of the road: 20+

probability that a car wouldn't stop under the red light: 0-100

green light: 3+ integer value

orange light: 1+ integer value

red light: green+orange lights +1(at least)

vmax: 35 at most, in higher values animation isn't smooth

vmin: 5, in lower values it's to slow and consequently takes longer to see the end of the animation.

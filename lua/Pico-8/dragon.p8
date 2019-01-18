pico-8 cartridge // http://www.pico-8.com
version 4
__lua__

cls()

turning_list={}
iteration=0

function next_iteration()
 turn_count = #turning_list
 current_position = 0
 new_length=2*turn_count+1
 for this_turn in all(turning_list) do
  current_position += 1
  destination_position = new_length - current_position + 1
  turning_list[destination_position ]  = bin_not( turning_list[current_position] )
 end
 turning_list[turn_count+1] = 1
 iteration+=1
end

function bin_not(var)
  if var == 1 then
   return 0
  else
   return 1
  end
end

function iter_up_to(var)
 while iteration < var do
  next_iteration()
 end
end


exec_time=time(iter_up_to(10))

vec2d={
 __add=function(a,b) 
  return {x=(a.x+b.x), y=(a.y+b.y)} 
 end
}

orientation = {}
orientation.__index = orientation

function orientation:new()
 return setmetatable({ direction = 0 }, orientation)
end

function orientation:mod_check()
 if self.direction < 0  then
  self.direction = 3
 elseif 3 < self.direction then
  self.direction = 0
 end
end

function orientation:left(var)
 self.direction += 1
 self:mod_check()
end

function orientation:right(var)
 self.direction -= 1
 self:mod_check()
end

function draw_turning_list()
 my_orientation = orientation:new()
  
 start_point = {x=20,y=20} setmetatable(start_point, vec2d)
 line_color = 12
 
 for some_turn in all(turning_list) do
  if some_turn == 1 then
   my_orientation:left()
  else
   my_orientation:right()
  end
  start_point = draw_line(start_point, my_orientation.direction, 2,  line_color)
 end
end

function draw_line(input_point, direction, distance, input_color) 
 end_point = input_point setmetatable(end_point, vec2d)
 delta = {x=0,y=0} setmetatable(delta, vec2d)
 
 if direction == 0 then
  delta = {x=0,y=distance}
 elseif direction == 1 then
  delta = {x=distance,y=0}
 elseif direction == 2 then
  delta = {x=0,y=-distance}
 elseif direction == 3 then
  delta = {x=-distance,y=0}
 end 
 
 end_point += delta

 line (input_point.x, input_point.y, end_point.x, end_point.y, input_color)
 
 return end_point
end


print(time(draw_turning_list()))


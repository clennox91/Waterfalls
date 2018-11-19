# Input and screen clearing things!
require "io/console"

input = ""
Empty = 0
User = 1
Island = 2
Waterfall = 3
message = "Water is all around!"

gridSize = 20
grid = Array.new(gridSize){ Array.new(gridSize){ Empty } }
grid[0][0] = User
row_position = 0
col_position = 0
grid[2][4] = Waterfall
grid[3][5] = Waterfall
grid[2][7] = Waterfall
grid[2][3] = Island
grid[1][3] = Island
grid[3][3] = Island
grid[4][4] = Island
grid[4][3] = Island
grid[4][5] = Island
grid[1][4] = Island
grid[1][5] = Island
grid[1][6] = Island
grid[1][7] = Island
grid[1][8] = Island
grid[1][9] = Island
grid[2][9] = Island
grid[3][9] = Island
grid[4][9] = Island



loading_message = "Today you wont be sticking to the rivers & lakes that you're used to..."
loading_message.each_char do |i|
   print i
   sleep(0.1)
end
system "cls"
puts ""

while input != "q"
   (0...gridSize).each do |i|
       (0...gridSize).each do |j|
           if grid[i][j] == Empty
               print "≈ "

           end
           if grid[i][j] == User
               print "Ω "
           end
           if grid[i][j] == Waterfall
               print "▓ "
           end
           if grid[i][j] == Island
               print "ö "
           end

       end
       puts #print one array, hits enter, prints next array
   end
   (0...gridSize).each do |r|
       (0...gridSize).each do |c|
           if grid[r][c] == User
               row_position = r
               col_position = c
               puts message

           end

       end
   end

   # get single character input
   input = STDIN.getch
   # character doesn't get typed when a person types it

   if row_position > 0 && grid[row_position - 1][col_position] != Island
       if input == 'w'
           if grid[row_position - 1][col_position] == Waterfall
               message = "You found a waterfall!!!"
               #sleep(3)
           else
               message = "Water is all around!"
           end
           grid[row_position - 1][col_position] = User
           grid[row_position][col_position] = Empty
       end
   end
   if col_position > 0 && grid[row_position][col_position - 1] != Island
       if input == 'a'
           if grid[row_position][col_position - 1] == Waterfall
               message = "You found a waterfall!!!"
               #sleep(3)
           else
               message = "Water is all around!"
           end
           grid[row_position][col_position - 1] = User
           grid[row_position][col_position] = Empty
       end
   end
   if row_position < gridSize - 1 && grid[row_position + 1][col_position] != Island
       if input == 's'
           if grid[row_position + 1][col_position] == Waterfall
               message = "You found a waterfall!!!"
               #sleep(3)
           else
               message = "Water is all around!"
           end
           grid[row_position + 1][col_position] = User
           grid[row_position][col_position] = Empty
       end
   end
   if col_position < gridSize - 1 && grid[row_position][col_position + 1] != Island
       if input == 'd'
           if grid[row_position][col_position + 1] == Waterfall
               message = "You found a waterfall!!!"
               #sleep(3)
           else
               message = "Water is all around!"
           end
           grid[row_position][col_position + 1] = User
           grid[row_position][col_position] = Empty
       end
   end

   still_searching = false
   (0...gridSize).each do |i|
       (0...gridSize).each do |j|
           if grid[i][j] == Waterfall
               still_searching = true
           end
       end
   end
   if still_searching == false
       message = "You have found all waterfalls! You are not as scrub!"
end
   # clear screen for windows
   system "cls"
end



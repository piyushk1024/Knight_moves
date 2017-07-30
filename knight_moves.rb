class Node #Node class - has parent,child and values
  attr_accessor :parent,:child
  attr_reader  :value
  def initialize(value = nil,parent = nil)
    @value = value
    @parent = parent
    @child = [] #Upto 8 moves are possible from each position, hence the array
  end
end

def return_pos(arr,el) #helper function that returns the array index of queried element
  pos = 0
  arr.each do |x|
    return pos if x == el
    pos += 1
  end
end

def displayboard(pos) #Function to draw chess grid
  puts ""
  i = 0
  while i < 8
    row = ""
    j = 0
    while j < 8
      if pos.include? [j,i] #if position represents one of the moves, put its move no instead square
        row += " #{return_pos(pos,[j,i])} "
      else
        row += " ■ "
      end
      j += 1
    end
    puts row.center(50)
    i += 1
  end
  puts ""
end

def valid_moves(init_pos) #calculates and returns all the valid moves from present position
  moves = []
  if init_pos[0] + 2  < 8
    moves << [init_pos[0] + 2,init_pos[1] +1] if init_pos[1] +1 < 8
    moves << [init_pos[0] + 2,init_pos[1] -1] if init_pos[1] -1 >= 0
  end
  if init_pos[0] - 2  >= 0
    moves << [init_pos[0] - 2,init_pos[1] +1] if init_pos[1] +1 < 8
    moves << [init_pos[0] - 2,init_pos[1] -1] if init_pos[1] -1 >= 0
  end
  if init_pos[1] + 2  < 8
    moves << [init_pos[0] + 1,init_pos[1] +2] if init_pos[0] +1 < 8
    moves << [init_pos[0] - 1,init_pos[1] +2] if init_pos[0] -1 >= 0
  end
  if init_pos[1] -2 >= 0
    moves << [init_pos[0] + 1,init_pos[1] -2] if init_pos[0] +1 < 8
    moves << [init_pos[0] - 1,init_pos[1] -2] if init_pos[0] -1 >= 0
  end
  moves
end

def print_trail(node,arr = []) #traces the final position to the root by identifying the parents
  arr.unshift(node.value) #to add in reverse position
  if node.parent != nil
    print_trail(node.parent,arr) #didn't really need to be recursive
  else
    puts "Knight can reach final position in #{arr.length-1} moves"
    puts arr.inspect
    displayboard(arr)
  end
end

def knight_moves(init_pos,fin_pos)
  root = Node.new(init_pos) #set initial position as the root of the tree
  depth = 0
  curr_row= [root] #for iteration purpose
  return print_trail(root) if root.value == fin_pos #trivial case of starting pos == final pos
  found = false #flag for looping
  until found
    new_row = [] #for newly added positions
    curr_row.each do |node| #cycle through each position of present level
      moves = valid_moves(node.value)
      moves.each do |x|
        new_node = Node.new(x,node)
        new_row << new_node
        if x == fin_pos #check if end condition is met
          return print_trail(new_node)
        end
      end
    end
    curr_row = new_row #select the next level for iteration
  end
end
#sample knight moves
knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3])
knight_moves([3,3],[0,0])
knight_moves([0,0],[7,6])
knight_moves([0,0],[7,7])
#puts valid_moves([3,3]).inspect

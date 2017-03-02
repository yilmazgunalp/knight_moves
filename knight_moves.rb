class Game
  
attr_accessor :vertices, :adjacency_list 

def initialize
  
  @vertices = []
for i in 0..7 
  for j in 0..7
  @vertices << Node.new([i,j])
  end
  end  
  
  
@adjacency_list = []
vertices.each do |vertex|
  list = []
  
  if vertex.key[0]-2 >= 0 && vertex.key[1]+1 < 8
  list << vertices[(vertex.key[0]-2)*8+vertex.key[1]+1]
  end
  
  if vertex.key[0]-2 >= 0 && vertex.key[1]-1 >= 0
  list << vertices[(vertex.key[0]-2)*8+vertex.key[1]-1]
  end
  
  if vertex.key[0]-1 >= 0 && vertex.key[1]+2 < 8
  list << vertices[(vertex.key[0]-1)*8+vertex.key[1]+2]
  end
  
   if vertex.key[0]+1 < 8 && vertex.key[1]+2 < 8
  list << vertices[(vertex.key[0]+1)*8+vertex.key[1]+2]
  end
  
  if vertex.key[0]+2 < 8 && vertex.key[1]+1 < 8
  list << vertices[(vertex.key[0]+2)*8+vertex.key[1]+1]
  end
  
  if vertex.key[0]+2 < 8 && vertex.key[1]-1 >= 0 
  list << vertices[(vertex.key[0]+2)*8+vertex.key[1]-1]
  end
  
  if vertex.key[0]-1 >= 0 && vertex.key[1]-2 >= 0
  list << vertices[(vertex.key[0]-1)*8+vertex.key[1]-2]
  end
  
  if  vertex.key[0]+1 < 8 && vertex.key[1]-2 >= 0
  list << vertices[(vertex.key[0]+1)*8+vertex.key[1]-2]
  end
  
  @adjacency_list << list
  end    
  
end  

class Node 
  attr_accessor :key, :distance, :predecessor
  def initialize key 
    @key = key
    end  
    
  def inspect 
    @key
    end  
  end 


def get_path(node,path = []) 
  if node.predecessor.nil?  
  return path 
  else
  path << node.predecessor
  get_path node.predecessor, path
  end
  end  

def bfs(src,dest,vertices,adjacency_list)
      if src == dest 
  return nil   
  end  
  src.distance = 0
  q = [src] 
  results = [] 
  
  while !q.empty?
    runner = q.shift
    adjacency_list[vertices.index(runner)].each do |neighbour|
    if neighbour.distance.nil?
      neighbour.predecessor = runner  
      neighbour.distance = runner.distance + 1 
      if neighbour == dest
      results << neighbour
      return get_path(neighbour, results).reverse
      else
      q << neighbour
      end
    end
    end
   
  end
  end  


# bfs(vertices[62],vertices[0],vertices,adjacency_list)
 
def knight_moves(a,b)
    bfs(@vertices[a[0]*8+a[1]],@vertices[b[0]*8+b[1]],@vertices,@adjacency_list)
end  

end

game = Game.new

game.knight_moves([7,7],[0,0])

require_relative './node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
    current_node = nil
    nodes_to_visit = @root
    
    while nodes_to_visit != nil
      current_node = nodes_to_visit
      if value < current_node.value
        nodes_to_visit = current_node.left
      elsif value > current_node.value
        nodes_to_visit = current_node.right
      else
        return current_node
      end
    end

    return nil
  end

  def insert(value)
    node = Node.new(value)
    if @root == nil
      @root = node
      return @root
    end

    last = nil
    nodes_to_visit = @root

    while nodes_to_visit != nil
      if node.value < nodes_to_visit.value
        last = nodes_to_visit
        nodes_to_visit  = nodes_to_visit.left
      elsif node.value > nodes_to_visit.value
        last = nodes_to_visit
        nodes_to_visit = nodes_to_visit.right
      else
        return nil
      end
    end

    if node.value < last.value 
      last.left = node
    elsif node.value > last.value
      last.right = node
    end
  end

end 

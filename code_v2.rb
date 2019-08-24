class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if infinite_loop?(list_node)
    puts "true"
    exit 1
  elsif list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list, previous=nil)
  if infinite_loop?(list)
    return true
  else
    if list
      # store original next_node value
      new_node = list.next_node
      # change current next_node value to equal previous node
      list.next_node = previous
      # use recursion to call method again until list is done
      # use original next_node as the new current node
      # use original node as new previous node
      reverse_list(new_node, list)
    end
  end
end

def infinite_loop?(list)
  tortoise = list
  hare = list

  while hare
    hare = hare.next_node
    if hare == nil
      return false
    end

    hare = hare.next_node
    tortoise = tortoise.next_node
    if hare == tortoise
      return true
    end
  end

  return false
end



node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

print_values(node3)

puts "-------"

revlist = reverse_list(node3)
print_values(node1)

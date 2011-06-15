#!/usr/bin/ruby
#
#Dan Kendall 06/2011
#
#tree.rb
#

module HashTree
   def node_name
      keys[0]
   end

   def children
      children_list = []
      values[0].each_pair do |k,v|
         children_list.push({k => v})
      end
      children_list
   end

   def visit(&block)
      block.call self
   end

   def visit_all(&block)
      visit &block
      children.each { |child| child.visit_all &block }
   end
end

class Hash
   include HashTree
end

class Tree
   attr :node_hash

   def initialize(seed_hash = {})
      @node_hash = seed_hash
   end

   def visit(&block)
      node_hash.visit &block
   end

   def visit_all(&block)
      node_hash.visit_all &block
   end
end

my_tree = Tree.new({'grandpa' => {'dad' => {'child_1' => {}, 'child_2' => {}}, 'uncle' => {'child_3' => {}, 'child_4' => {}}}})
my_tree.visit { |node| puts node.node_name }

puts
puts 'Visiting all'
my_tree.visit_all { |node| puts node.node_name }

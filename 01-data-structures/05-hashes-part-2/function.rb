def printHash
	# print location and value of each entry
	@items.each_with_index do |item, i|
		if item == nil
			puts "\nIndex #{i} is empty\n"
		elsif item.is_a?(Node) == true
			puts "Item at index #{i} is a node.\nkey = #{item.key}, value = #{item.value}"
		else
			current_node = item.head
			puts "\nIndex #{i} is a Linked List.\nHead Node:\nkey = #{item.head.key},\nvalue = #{current_node.value}\n"
			if current_node.next
				current_node = current_node.next
				if current_node.next == nil
					puts "Tail node:\nkey = #{current_node.key},\nvalue = #{current_node.value}"
				else
					puts "Next node:\nkey = #{current_node.key},\nvalue = #{current_node.value}"
				end
			end
			puts "Hash load factor = #{load_factor}"
		end
	end
end
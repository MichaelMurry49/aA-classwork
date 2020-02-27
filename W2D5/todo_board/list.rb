require_relative "item"

class List

    def initialize(label)
        @label = label
        @items = []
    end


    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description="")
       if Item.valid_date?(deadline)
        @items << Item.new(title,deadline,description)
        return true 
       end
       false
    end 

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index >= size
        true
    end

    def swap(idx1, idx2)
        idx1 = idx1.to_i
        idx2 = idx2.to_i
        return false if !valid_index?(idx1) || !valid_index?(idx2)
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        true
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        print_priority
    end

    def print
        p "------------------------------------------------------------------"
        p "                             #{@label}"
        p "------------------------------------------------------------------"
        p "Index | Item                   | Deadline            | Complete"
        p "------------------------------------------------------------------"
        @items.each_with_index do |item, idx|
            sym = item.done ? 'X' : ''
           p "#{idx}     | #{item.title}               |  #{item.deadline}|  #{sym} "
        end
        p "------------------------------------------------------------------"
    end


    def print_full_item(index)
        index = index.to_i
        p "------------------------------------------------------------------"
        p "#{@items[index].title} | #{@items[index].description}  | #{@items[index].deadline}|  #{@items[index].done}"  
        p "------------------------------------------------------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1) 
        index = index.to_i
        amount = amount.to_i
        return false if !valid_index?(index)
        amount.abs.times do
            swap(index, index - 1)
            index -= 1
        end
        true
    end

    def down(index, amount = 1) 
        index = index.to_i
        amount = amount.to_i
        return false if !valid_index?(index)
        amount.abs.times do
            swap(index, index + 1)
            index += 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.reject!  {|ele| @items.index(ele) == index}
        true
    end

    def purge
        @items.each_with_index do |item, index|
            if item.done 
                remove_item(index)
            end
        end
    end

end

# my_list = List.new('Groceries')
# my_list.size
# my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# my_list.add_item('toothpaste', '2019-10-25')
# my_list.add_item('shampoo', '2019-10-24')
# my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
# my_list.priority
# # my_list.swap(0,  2)
# my_list.priority
# my_list.print
# my_list.sort_by_date!
# my_list.print
# # p my_list[1]
# # p my_list[3]
# #my_list.print_priority
# # my_list.up(3, 2)
# # my_list.print
# # my_list.down(1, 2)
# # my_list.print
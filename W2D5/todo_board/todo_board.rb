require_relative "item"
require_relative "list"

class Todo_board

    def initialize(label)
        @lists = {}
    end

    def get_command 
        p "Enter a commade: "
        cmd, list_name, *args = gets.chomp.split(' ')
        case cmd
        when 'mklist'
            @lists[list_name] = List.new(list_name)
            true 
        when 'ls'
            print @lists.keys
            true
        when 'showall'
            @lists.each { |k, v| v.print }
        when 'mktodo'
            @lists[list_name].add_item(*args)
        when 'up'
            @lists[list_name].up(*args)
        when 'down'
            @lists[list_name].down(*args)
        when 'swap'
            @lists[list_name].swap(*args)
        when 'sort'
            @lists[list_name].sort_by_date!
            true
        when 'priority'
            @lists[list_name].priority
            true
        when 'toggle'
            @lists[list_name][args[0].to_i].toggle
            true
        when 'rm'
            @lists[list_name].remove_item(args[0].to_i)
        when 'purge'
            @lists[list_name].purge
        when 'print'
            if args.length == 0
                @lists[list_name].print
            else
                @lists[list_name].print_full_item(args[0])
            end
            true
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while get_command 
            get_command
        end
    end

end

todo_board = Todo_board.new("Groceries")
todo_board.run
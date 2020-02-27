require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each do |k, v| 
        @rooms[k] = Room.new(v)
    end
  end

  def name
    @name.split.map { |each_part| each_part.capitalize }.join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
        p 'sorry, room does not exist'
    else 
        if @rooms[room_name].add_occupant(person)
            p 'check in successful'
        else
            p 'sorry, room is full'
        end
    end
  end

  def has_vacancy?
    @rooms.each { |k, v| return true if v.available_space > 0}
    false
  end

  def list_rooms # "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1
    @rooms.each { |k, v| puts k + ' ' + v.available_space.to_s }
  end
end

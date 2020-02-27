class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
     arr.all?{|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def initialize(chars)
     if Code.valid_pegs?(chars)
        @pegs = chars.map{|char| char.upcase}
     else
        raise "invalid pegs"
     end
  end

  def pegs
     @pegs
  end

  def self.random(len)
     random_chars = []
     len.times { random_chars << POSSIBLE_PEGS.keys.sample}
     return Code.new(random_chars)
  end

  def self.from_string(str)
      Code.new(str.chars)
  end

  def [](i)
     @pegs[i]
  end

  def length
     @pegs.length
  end

  def num_exact_matches(code)     
     count = 0
     @pegs.each.with_index { |char, index| count += 1 if char == code.pegs[index]}   
     count
  end

  def num_near_matches(code)
     count = 0
     code.pegs.each.with_index {|char ,i|  count += 1 if  @pegs.include?(char)}
     count - num_exact_matches(code)  
  end

  def ==(code)
    code.length == num_exact_matches(code)
  end
end


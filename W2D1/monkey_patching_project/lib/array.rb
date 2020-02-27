# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0

    self.max - self.min
  end

  def average
    return nil if self.length == 0

    self.sum / (self.length + 0.0)
  end

  def median
    return nil if self.length == 0
    sorted = self.sort
    len = sorted.length
    if self.length.odd?
      return sorted[len / 2]
    else
      return (sorted[len / 2] + sorted[len / 2 - 1]) / 2.0
    end
  end

  def counts
    hash = Hash.new(0)

    self.each { |char| hash[char] += 1 }
    hash
  end

  def my_count(num)
    count = 0

    self.each { |el| count += 1 if el == num }
    count
  end

  def my_index(num)
    self.each_with_index { |el, idx| return idx if el == num }
    nil
  end

  def my_uniq
    newArr = []
    hash = Hash.new(0)
    self.each { |el| hash[el] += 1 }
    hash.each { |k, v| newArr << k }
    newArr
  end

  def my_transpose
    array = Array.new(self.length) { Array.new(self[0].length) }
    self.each_with_index do |row, i|
      row.each_with_index do |ele, j|
        array[j][i] = self[i][j]
      end
    end
    array
  end
end

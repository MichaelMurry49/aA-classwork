class Array

  def two_sum
    res = []
    (0...self.length - 1).each do |i|
      (i + 1...self.length).each do |j|
        res << [i, j] if self[i] + self[j] == 0
      end
    end
    res 
  end

  def my_transpose
    cols=[]
    (0...self.length).each do |i|
      sub=[]
      (0...self.length).each do |j|
        sub << self[j][i]
      end
      cols << sub
    end
    cols
  end

  def stock_picker
    res = []
    min = self[0]
    max_prof = 0
    self.each_with_index do |el, i|
      min = el if el < min
      current_prof = self[i] - min
      if current_prof > max_prof
        max_prof = current_prof
        res[0] = self.index(min)
        res[1] = i
      end
    end
    res
  end
end
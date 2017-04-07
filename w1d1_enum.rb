class Array
  def my_each &prc
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end

  def my_select &prc
    arr = []
    self.my_each do |el|
      arr.push(el) if prc.call(el)
    end
    arr
  end

  def my_reject &prc
    arr = []
    self.my_each do |el|
      arr.push(el) if !prc.call(el)
    end
    arr
  end

  def my_any? &prc
    self.my_each do |el|
      return true if prc.call(el)
    end
    return false
  end

  def my_all? &prc
    self.my_each do |el|
      return false if !prc.call(el)
    end
    return true
  end
end

class Array
  def my_flatten
    flattened = self.my_flatten_helper
    flattened.reduce([]) do |acum, el|
      if el.class == Array
        acum += el.my_flatten_helper
      else
        acum.push(el)
      end
      acum
    end

  end

  def my_flatten_helper
    self.reduce([]) do |accum, el|
      if el.class == Array
        accum += el
      else
        accum.push(el)
      end
      accum
    end
  end

  def my_zip *args
    self.map.with_index do |el, i|
      args.reduce([self[i]]) do |acum, arg|
        acum.push(arg[i])
      end
    end
  end

  def my_join sep=''
    str = ''
    self.each.with_index {|el,i|
      if(i == 0)
        str += "#{el}"
      else
      str += "#{sep}#{el}"
      end
    }
    str
  end

  def my_reverse
    arr = []
    self.each do |el|
      arr.unshift(el)
    end
    arr
  end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]

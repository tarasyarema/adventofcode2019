file_data = File.open("in").readlines.map(&:chomp)[0]
w, t = 25, 6
line = file_data.split("")

def p1(line, w, t)
  min, s = 1e+9, 0
  len = line.length - 1

  x, y, z = 0, 0, 0

  for j in 0..len
    if (j % (w * t)) == 0 and j != 0
      if x < min
        min = x
        s = y * z
      end

      x = 0
      y = 0
      z = 0
    end
    
    case line[j]
    when "0"
      x += 1
    when "1"
      y += 1
    when "2"
      z += 1 
    end
  end
  
  puts "#{min}: #{s}\n"
end

def p2(line, w, t)
  image = Array.new(w * t, 2)
  len = line.length - 1

  for j in 0..len
    i = (j % (w * t))

    if image[i] != 2
      next
    end

    case line[j]
    when "0"
      image[i] = 0
    when "1"
      image[i] = 1
    when "2"
      image[i] = 2
    end
  end
  
  puts "{\"data\":#{image}}\n"
end

p1(line, w, t)
p2(line, w, t)

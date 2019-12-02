import strutils
import strformat
from sequtils import map

let f = open("in")

var 
    data = f.readLine().split({','}).map(parseInt)
    found = false
    magic = 19690720
    len = high(data)

f.close()

for a in 0..len:
    if found:
        break
    
    for b in 0..len:
        var 
            tmp_data = data
            i = 0

        tmp_data[1] = a
        tmp_data[2] = b        

        while i < len:
            case tmp_data[i]
            of 1:
                tmp_data[tmp_data[i+3]] = tmp_data[tmp_data[i+1]] + tmp_data[tmp_data[i+2]]
                i += 4

            of 2:
                tmp_data[tmp_data[i+3]] = tmp_data[tmp_data[i+1]] * tmp_data[tmp_data[i+2]]
                i += 4
            
            of 99:
                break
            
            else:
                discard

        if tmp_data[0] == magic:
            found = true
            echo fmt"{tmp_data[1]} {tmp_data[2]} - {tmp_data[0]}"
            break

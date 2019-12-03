directions = {
    "U": (1, +1),
    "D": (1, -1),
    "L": (0, +1),
    "R": (0, -1)
}

parse_list = lambda l: [(e[0], int(e[1::])) for e in l]    
sum_points = lambda v, w: [x + y for x, y in zip(v, w)]
dist_point = lambda v, w: sum([abs(x - y) for x, y in zip(v, w)])

def get_points(l):
    steps = 0
    base = [0, 0]
    ret = {}

    for d, s in parse_list(l):
        for i in range(1, s+1):
            steps += 1

            if directions[d][0] == 0:
                tmp = [base[0] + directions[d][1] * i, base[1]]
            elif directions[d][0] == 1:
                tmp = [base[0], base[1] + directions[d][1] * i]

            ret[",".join(map(str, tmp))] = steps

            if i == s:
                base = tmp

    return ret

def get_min(lines):
    target = get_points(lines[0])
    min_d, steps = 1e+9, None
    base = [0, 0]

    c_steps = 0

    for d, s in parse_list(lines[1]):
        for i in range(1, s+1):
            c_steps += 1

            if directions[d][0] == 0:
                tmp = [base[0] + directions[d][1] * i, base[1]]
            elif directions[d][0] == 1:
                tmp = [base[0], base[1] + directions[d][1] * i]

            tmp_str = ",".join(map(str, tmp))
            
            if target.get(tmp_str):
                tmp_d = target[tmp_str] + c_steps

                if tmp_d < min_d:
                    min_d = tmp_d

            if i == s:
                base = tmp

    return min_d

def main():
    lines = [l.split(",") for l in open("in", "r").readlines()]
    min_d = get_min(lines)    

    print("Sol:", min_d)
    
if __name__ == "__main__":    
    main()
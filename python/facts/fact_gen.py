ranges = [(1, 0xabcc), (2, 0x300), (3, 8), (4, 0)]

def ack_ref(m, n, memo):
    assert m >= 0
    assert n >= 0

    key = f'{m}:{n}'

    past = memo.get(key, -1)
    if past != -1:
        return past

    result = 0
    
    if m == 0:
        result = n + 1
    elif n == 0:
        result = ack_ref(m - 1, 1, memo)  
    else:
        result = ack_ref(m-1, ack_ref(m, n-1, memo), memo)

    memo[key] = result

    return result

def generate_files(ranges):
    lines = ""
    memo = {}
    for r in ranges:
        m, N = r
        for n in range(N + 1):
            lines += f'{m},{n},{ack_ref(m, n, memo)}\n'

    file = open("facts.csv", "w+")
    file.writelines(lines)
    file.close()       

generate_files(ranges)
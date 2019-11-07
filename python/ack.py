def ack(s):

    if len(s) < 3:
        return
    
    m = s[-2]
    n = s[-1]

    if m == 0:
        res = n + 1
        while True:
            if s.pop() == -1:
                break

        s.append(res)
        ack(s)
        return

    if n == 0:
        s += [m - 1, 1]
        ack(s)
        return

    s += [m - 1, -1]
    s += [m, n - 1]
    ack(s)
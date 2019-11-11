def towers(s):
    goup = s[0]
    n = s[-1]

    if len(stack) == 2 and (n == 1 or goup):
        return

    if n == 1 or goup:
        res = s.pop()
        s[-1] = 2 * res + 1
        s[0] = True
        towers(s)
        return

    s.append(n - 1)
    towers(s)


stack = [False, 6]
towers(stack)
print(stack[-1])

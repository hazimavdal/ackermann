from ack import ack

facts = open("facts/facts.csv").read().split('\n')

for fact in facts:
    parts = fact.split(',')
    m, n, expected = [int(i) for i in parts]
    
    stack = [-1, m, n]
    ack(stack)

    assert stack[-1] == expected

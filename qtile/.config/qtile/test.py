class ListNode(object):
     def __init__(self, val=0, next=None):
         self.val = val
         self.next = next

def addTwoNumbers(self, l1, l2):
    result = ListNode()
    head = result
    carry = 0
    while l1 or l2:
        result.val = l1.val if l1.val else 0 + l2.val if l2.val else 0 + carry
        if result.val > 9:
            result.val = result.val % 10
            carry = 1
        else:
            carry = 0
        if l1.next or l2.next:
            result.next = ListNode()
            result = result.next
        l1 = l1.next
        l2 = l2.next
    return head

l1 = ListNode(val=2, next=ListNode(val=4, next=ListNode(val=3)))
l2 = ListNode(val=5, next=ListNode(val=6, next=ListNode(val=4)))

print()

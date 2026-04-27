/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var output = ListNode(Int.min)
        var last = output

        var left = list1
        var right = list2

        while left != nil || right != nil {
            if let leftVal = left?.val, leftVal <= right?.val ?? Int.max {
                last.next = left
                last = left!
                left = left?.next
                continue
            }

            if let rightVal = right?.val, rightVal <= left?.val ?? Int.max {
                last.next = right
                last = right!
                right = right?.next
                continue
            }
        }

        return output.next
    }
}

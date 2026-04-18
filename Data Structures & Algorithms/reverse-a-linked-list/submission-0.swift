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
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head else { return nil }

        var currentHead = head
        var next = currentHead.next

        while let newHead = next {
            next = newHead.next
            newHead.next = currentHead
            currentHead = newHead
        }

        head.next = nil
        return currentHead
    }
}

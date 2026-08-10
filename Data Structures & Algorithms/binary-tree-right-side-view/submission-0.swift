/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var queue = [root]
        var result = [Int]()
        while !queue.isEmpty {
            var len = queue.count
            while len > 0 {
                guard let front = queue.first else { return [] }
                if len == 1 {
                    result.append(front.val)
                }
                if let left = front.left {
                    queue.append(left)
                }
                if let right = front.right {
                    queue.append(right)
                }
                queue.removeFirst()
                len -= 1
            }
        }
        return result
    }
}

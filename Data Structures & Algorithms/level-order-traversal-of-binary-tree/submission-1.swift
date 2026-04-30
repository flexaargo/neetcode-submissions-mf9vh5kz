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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        var order: [[Int]] = []
        var queue = [root]

        while !queue.isEmpty {
            let levelLength = queue.count

            var level: [Int] = []
            for i in 0..<levelLength {
                let current = queue.removeFirst()
                level.append(current.val)
                if let left = current.left {
                    queue.append(left)
                }

                if let right = current.right {
                    queue.append(right)
                }
            }
            order.append(level)
        }

        return order
    }
}

extension TreeNode: CustomDebugStringConvertible {
    var debugDescription: String { "\(val)" }
}
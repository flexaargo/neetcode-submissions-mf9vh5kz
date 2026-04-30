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
        var order: [[Int]] = [[root.val]]

        func updateOrder(_ node: TreeNode?, depth: Int) {
            guard let node else { return }
            if !order.indices.contains(depth) {
                order.append([])
            }
            order[depth].append(node.val)
            updateOrder(node.left, depth: depth + 1)
            updateOrder(node.right, depth: depth + 1)
        }

        updateOrder(root.left, depth: 1)
        updateOrder(root.right, depth: 1)

        return order
    }
}

extension TreeNode: CustomDebugStringConvertible {
    var debugDescription: String { "\(val)" }
}
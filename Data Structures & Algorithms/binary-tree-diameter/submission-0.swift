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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let leftDepth = depth(root.left)
        let rightDepth = depth(root.right)
        
        let diameter = max(leftDepth + rightDepth, max(diameterOfBinaryTree(root.left), diameterOfBinaryTree(root.right)))
        return diameter
    }

    func depth(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }
        return 1 + max(depth(node.left), depth(node.right))
    }
}

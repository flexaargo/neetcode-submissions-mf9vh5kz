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
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root else { return false }
        return validate(root, min: Int.min, max: Int.max)
    }

    func validate(_ node: TreeNode?, min: Int, max: Int) -> Bool {
        guard let node else { return true }
        guard node.val > min, node.val < max else { return false }
        return validate(node.left, min: min, max: node.val) && validate(node.right, min: node.val, max: max)
    }
}

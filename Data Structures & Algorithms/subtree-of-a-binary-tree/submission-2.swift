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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root, let subRoot else { 
            return root == nil && subRoot == nil
        }
        if root.val == subRoot.val {
            if isStrictSubtree(root.left, subRoot.left) && isStrictSubtree(root.right, subRoot.right) {
                return true 
            }
        }
        if let rootLeft = root.left, isSubtree(rootLeft, subRoot) {
            return true
        }
        if let rootRight = root.right, isSubtree(rootRight, subRoot) {
            return true
        }
        return false
    }

    func isStrictSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root, let subRoot else { 
            return root == nil && subRoot == nil
        }
        if root.val == subRoot.val {
            if isSubtree(root.left, subRoot.left) && isSubtree(root.right, subRoot.right) {
                return true 
            }
        }
        return false
    }
}

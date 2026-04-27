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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p?.val == q?.val else { return false }

        let isLeftSame = {
            guard p?.left != nil || q?.left != nil else { return true }
            return isSameTree(p?.left, q?.left)
        }()

        let isRightSame = {
            guard p?.right != nil || q?.right != nil else { return true }
            return isSameTree(p?.right, q?.right)
        }()

        return isLeftSame && isRightSame
    }
}

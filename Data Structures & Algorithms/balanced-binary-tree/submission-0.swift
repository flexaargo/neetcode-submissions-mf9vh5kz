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
    private var balanced = true

    func isBalanced(_ root: TreeNode?) -> Bool {
        func length(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            let leftLength = length(node.left)
            let rightLength = length(node.right)
            balanced = balanced && abs(leftLength - rightLength) <= 1
            return 1 + max(leftLength, rightLength)
        }

        _ = length(root)

        return balanced
    }
}

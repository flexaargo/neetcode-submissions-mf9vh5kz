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
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        return 1 + goodNodes(root.left, root.val) + goodNodes(root.right, root.val)
    }

    func goodNodes(_ root: TreeNode?, _ treeMax: Int) -> Int {
        guard let root else { return 0 }
        let newMax = max(treeMax, root.val)
        let baseCount = (root.val >= newMax) ? 1 : 0
        let leftGoodNodes = root.left.map { goodNodes($0, newMax) } ?? 0
        let rightGoodNodes = root.right.map { goodNodes($0, newMax) } ?? 0
        return baseCount + leftGoodNodes + rightGoodNodes
    }
}

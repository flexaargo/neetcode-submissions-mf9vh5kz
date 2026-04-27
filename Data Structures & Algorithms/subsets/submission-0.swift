class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var out: [[Int]] = []
        var current: [Int] = []

        func backtrack(_ index: Int) {
            guard nums.indices.contains(index) else { return }
            current.append(nums[index])
            backtrack(index + 1)
            out.append(current)
            current.removeLast()
            backtrack(index + 1)
        }

        out.append(current)
        backtrack(0)
        return out
    }
}

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var out: [[Int]] = []

        func backtrack(_ index: Int, _ path: [Int]) {
            guard nums.indices.contains(index) else { 
                out.append(path)
                return 
            }

            backtrack(index + 1, path + [nums[index]])
            backtrack(index + 1, path)
        }

        backtrack(0, [])
        return out
    }
}

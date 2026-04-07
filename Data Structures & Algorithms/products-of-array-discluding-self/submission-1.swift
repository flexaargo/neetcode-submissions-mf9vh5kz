class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }

        var prefixed = nums // Array<Int>(repeating: 1, count: nums.count)
        var suffixed = nums // Array<Int>(repeating: 1, count: nums.count)

        for i in stride(from: 0, to: nums.count, by: 1) {
            guard nums.indices.contains(i-1) else { continue }
            prefixed[i] = prefixed[i-1] * prefixed[i]
        }

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            guard nums.indices.contains(i+1) else { continue }
            suffixed[i] = suffixed[i+1] * suffixed[i]
        }

        var result = Array<Int>(repeating: 1, count: nums.count)

        for i in 0..<result.count {
            let prefix = prefixed.indices.contains(i-1) ? prefixed[i-1] : 1
            let suffix = suffixed.indices.contains(i+1) ? suffixed[i+1] : 1
            result[i] = prefix * suffix
        }

        return result
    }
}

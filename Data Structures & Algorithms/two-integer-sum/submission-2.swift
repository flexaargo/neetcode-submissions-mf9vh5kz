class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var complements = [Int: Int]()
        for (index, num) in nums.enumerated() {
            let c = target - num
            if let otherIndex = complements[c] {
                return [otherIndex, index]
            }
            complements[num] = index
        }

        return []
    }
}

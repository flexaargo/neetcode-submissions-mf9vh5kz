class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // num to index
        var seenMap = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            let needs = target - num
            if let seenIndex = seenMap[needs] {
                return [seenIndex, index]
            }
            seenMap[num] = index
        }
        return []
    }
}

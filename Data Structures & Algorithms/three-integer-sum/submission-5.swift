class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result: [[Int]] = []
        for (i, num) in sortedNums.enumerated() {
            if i > 0 && num == sortedNums[i-1] {
                continue
            }

            var l = i+1
            var r = sortedNums.count-1
            while l < r, l < sortedNums.count {
                var sum = num + sortedNums[l] + sortedNums[r]
                if sum < 0 {
                    l += 1
                    continue
                }
                if sum > 0 {
                    r -= 1
                    continue
                }
                if sum == 0 {
                    result.append([num, sortedNums[l], sortedNums[r]])
                    l += 1
                    while sortedNums[l-1] == sortedNums[l], l < r {
                        l += 1
                    }
                }
            }
        }
        return result
    }
}

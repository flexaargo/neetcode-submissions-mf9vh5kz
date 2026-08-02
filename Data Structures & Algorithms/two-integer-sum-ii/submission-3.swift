class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var l = 0
        var r = numbers.count - 1

        while numbers[l] + numbers[r] != target {
            var sum = numbers[l] + numbers[r]
            if sum > target {
                r -= 1
            } else {
                l += 1
            }
        }

        return [l + 1, r + 1]
    }
}

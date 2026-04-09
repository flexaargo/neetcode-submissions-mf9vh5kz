class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var lastIndex: Int = numbers.count - 1
        var firstIndex: Int = 0

        while numbers[firstIndex] + numbers[lastIndex] != target {
            let largest = numbers[lastIndex]
            let smallest = numbers[firstIndex]

            if largest + smallest > target {
                lastIndex -= 1
            } else {
                firstIndex += 1
            }
        }

        return [firstIndex + 1, lastIndex + 1]
    }
}

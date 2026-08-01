class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var seen = Set<Int>()
        for num in nums {
            let (inserted, _) = seen.insert(num)
            if !inserted { return true }
        }
        return false
    }
}

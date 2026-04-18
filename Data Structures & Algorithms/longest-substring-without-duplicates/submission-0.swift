class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var characterSet = Set<Character>()
        var substring = Array<Character>()
        var maxLength = 0

        for char in s {
            while characterSet.contains(char) {
                let first = substring.removeFirst()
                characterSet.remove(first)
            }

            substring.append(char)
            characterSet.insert(char)

            maxLength = max(maxLength, substring.count)
        }

        return maxLength
    }
}

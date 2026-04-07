class Solution {

    func encode(_ strs: [String]) -> String {
        return strs.reduce(into: "") { partial, str in
            partial.append("\(str.count).\(str)")
        }
    }

    func decode(_ str: String) -> [String] {
        var result: [String] = []

        var str = str
        while !str.isEmpty, let characterCount = firstCharacterCount(in: str) {
            str = String(str.dropFirst(characterCount.1))
            let part = String(str.prefix(characterCount.0))
            result.append(part)
            str = String(str.dropFirst(part.count))
        }

        return result
    }

    /// Returns the character count and character count of the marker
    private func firstCharacterCount(in str: String) -> (Int, Int)? {
        var len = 0
        while len < str.count {
            let index = str.index(str.startIndex, offsetBy: len)
            if str[index] == "." {
                let characterCount = Int(str.prefix(len))!
                return (characterCount, len + 1)
            }
            len += 1
        }
        return nil
    }
}

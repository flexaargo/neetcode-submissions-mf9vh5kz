class Solution {

    func encode(_ strs: [String]) -> String {
        var result = ""
        for str in strs {
            let cnt = str.count
            result.append("\(cnt).\(str)")
        }
        return result
    }

    func decode(_ str: String) -> [String] {
        var result = [String]()
        var curLen = ""
        var index: String.Index? = str.startIndex

        while let i = index, str.indices.contains(i) {
            let char = str[i]
            if char.isNumber {
                curLen.append(char)
                index = str.index(i, offsetBy: 1, limitedBy: str.endIndex)
            } else {
                let len = Int(curLen) ?? 0
                curLen = ""
                guard len > 0 else {
                    index = str.index(i, offsetBy: 1, limitedBy: str.endIndex)
                    result.append("")
                    continue
                }
                guard 
                    let startIndex = str.index(i, offsetBy: 1, limitedBy: str.endIndex),
                    let endIndex = str.index(startIndex, offsetBy: len-1, limitedBy: str.endIndex)
                else { break }
                let range = startIndex...endIndex
                let substring = String(str[range])
                result.append(substring)
                index = str.index(endIndex, offsetBy: 1, limitedBy: str.endIndex)
            }
        }
        return result
    }
}

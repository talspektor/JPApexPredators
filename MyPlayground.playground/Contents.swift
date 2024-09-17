import UIKit

func convert(_ intValue: Int) -> String {
    if intValue == 0 {
            return ""
        }
    let double = Double(intValue) / 3
        return double.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", double) : String(format: "%.2f", double)
}

convert(0)

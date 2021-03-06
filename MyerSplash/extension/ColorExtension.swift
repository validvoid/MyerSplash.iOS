import Foundation
import UIKit

extension UIColor {
    var redValue: CGFloat {
        return CIColor(color: self).red
    }

    var greenValue: CGFloat {
        return CIColor(color: self).green
    }

    var blueValue: CGFloat {
        return CIColor(color: self).blue
    }

    var alphaValue: CGFloat {
        return CIColor(color: self).alpha
    }

    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: CGFloat(alpha) / 255.0)
    }

    convenience init(_ argb: String) {
        var str = argb
        if (str.starts(with: "#")) {
            str = str.subString(from: 1)
        }

        var color = [Int]()

        if (str.count == 6) {
            color.append(255)
        }

        for i in stride(from: 0, to: str.count, by: 2) {
            guard let c = Int(str.subString(i, i + 1), radix: 16) else {
                fatalError("error occurs at \(str.subString(i, i + 1)).")
            }
            color.append(c)
        }

        self.init(color[1], color[2], color[3], color[0])
    }

    convenience init(rgb: Int) {
        self.init(
                red: CGFloat((rgb >> 16) & 0xFF),
                green: CGFloat((rgb >> 8) & 0xFF),
                blue: CGFloat(rgb & 0xFF),
                alpha: CGFloat(1)
        )
    }

    func isLightColor() -> Bool {
        return getLuma() > 120
    }

    func getLuma() -> CGFloat {
        return 0.299 * redValue * 255 + 0.587 * greenValue * 255 + 0.114 * blueValue * 255
    }

    func getDarker(alpha: CGFloat) -> UIColor {
        return UIColor(red: (redValue * alpha),
                       green: (greenValue * alpha),
                       blue: (blueValue * alpha),
                       alpha: alpha)
    }
}
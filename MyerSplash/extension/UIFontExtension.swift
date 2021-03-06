import Foundation
import UIKit

extension UIFont {
    var bold: UIFont {
        return with(traits: .traitBold)
    }

    var italic: UIFont {
        return with(traits: .traitItalic)
    }

    var boldItalic: UIFont {
        return with(traits: [.traitBold, .traitItalic])
    }

    func with(traits: UIFontDescriptorSymbolicTraits, fontSize: CGFloat = 0.0) -> UIFont {
        var descriptor: UIFontDescriptor!
        if (traits == UIFontDescriptorSymbolicTraits.traitBold) {
            descriptor = UIFontDescriptor(name: "Helvetica-Bold", size: fontSize)
        } else {
            self.fontDescriptor.withSymbolicTraits(traits)
        }

        return UIFont(descriptor: descriptor, size: fontSize)
    }
}
import Foundation
import UIKit
import Nuke

extension Nuke.Cache {
    static func isCached(urlString: String?) -> Bool {
        guard let url = urlString else {
            return false
        }

        let request = Nuke.Request(url: URL(string: url)!)
        return Cache.shared[request] != nil
    }
}

extension UIView {
    func showToast(_ text: String) {
        ToastView.Builder.init()
                         .attachTo(self)
                         .setMarginBottom(Dimensions.TOAST_MARGIN_BOTTOM)
                         .setText(text)
                         .build()
                         .show()
    }
}
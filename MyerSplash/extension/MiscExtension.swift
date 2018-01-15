import Foundation
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
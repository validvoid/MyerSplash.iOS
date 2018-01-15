import Foundation

class Request {
    static let BASE_URL           = "https://api.unsplash.com/"
    static let PHOTO_URL          = "https://api.unsplash.com/photos?"
    static let FEATURED_PHOTO_URL = "https://api.unsplash.com/collections/featured?"
    static let RANDOM_PHOTOS_URL  = "https://api.unsplash.com/photos/random?"
    static let SEARCH_URL         = "https://api.unsplash.com/search/photos?"

    static let AUTO_CHANGE_WALLPAPER       = "https://juniperphoton.net/myersplash/wallpapers/"
    static let AUTO_CHANGE_WALLPAPER_THUMB = "https://juniperphoton.net/myersplash/wallpapers/thumbs/"

    static let ME_HOME_PAGE = "https://unsplash.com/@juniperphoton"

    static let CLIENT_ID_KEY = "client_id"

    static let KEY_PLIST_NAME    = "Key"
    static let UNSPLASH_KEY_NAME = "UnsplashKey"

    private (set) static var clientId: String = ""

    static func getClientId() -> String {
        if (clientId.isEmpty) {
            var keyDict: NSDictionary?
            if let path = Bundle.main.path(forResource: KEY_PLIST_NAME, ofType: "plist") {
                keyDict = NSDictionary(contentsOfFile: path)
            }
            if let dict = keyDict {
                clientId = (dict.value(forKey: UNSPLASH_KEY_NAME) as? String) ?? ""
            }
        }
        return clientId
    }
}
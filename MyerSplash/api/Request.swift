import Foundation

class Request {
    private (set) static var BASE_URL = "https://api.unsplash.com/"
    private (set) static var PHOTO_URL = "https://api.unsplash.com/photos?"
    private (set) static var FEATURED_PHOTO_URL = "https://api.unsplash.com/collections/featured?"
    private (set) static var RANDOM_PHOTOS_URL = "https://api.unsplash.com/photos/random?"
    private (set) static var SEARCH_URL = "https://api.unsplash.com/search/photos?"

    private (set) static var AUTO_CHANGE_WALLPAPER = "https://juniperphoton.net/myersplash/wallpapers/"
    private (set) static var AUTO_CHANGE_WALLPAPER_THUMB = "https://juniperphoton.net/myersplash/wallpapers/thumbs/"

    private (set) static var ME_HOME_PAGE = "https://unsplash.com/@juniperphoton"

    private (set) static var CLIENT_ID_KEY = "client_id"

    private static var clientId: String = ""
    private static var KEY_PLIST_NAME = "Key"
    private static var UNSPLASH_KEY_NAME = "UnsplashKey"

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
import UIKit

class Event {
    var name: String
    var date: Int
    
    init(json: [String: Any]) {
        name = json["name"] as! String
        date = json["date"] as? Int ?? 0
    }

}

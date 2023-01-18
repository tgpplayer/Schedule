import Foundation

class GetterPoster {
    
    struct Event: Decodable {
        let date: Int
        let name: String
    }
    
    var eventNames = [String]()
    var valueOfDates = [Any]()
    
    func send() {
        let urlSession = URLSession.shared
        let url = URL(string: "https://superapi.netlify.app/api/db/eventos")
        
        urlSession.dataTask(with: url!) { data, response, error in
            print("Data: \(String(describing: data))")
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                
                for i in json as! [[String: Any]] {
                    self.eventNames.append(i["name"] as! String)
                    self.valueOfDates.append(i["date"]!)
                }
                
                print(self.eventNames)
                print(self.valueOfDates)
                
                let date = NSDate(timeIntervalSince1970: self.valueOfDates[1] as! TimeInterval)
                print(date)
                //print(date)
//                //print(String(describing: json))
//                let dictJSON = String(describing: json).data(using: .utf8)
//
//                let events = try? JSONDecoder().decode(Event.self, from: dictJSON!)
//                print(events?.name)
//                print(type(of: events))
                
            }
        }.resume()
        
        
    }
}

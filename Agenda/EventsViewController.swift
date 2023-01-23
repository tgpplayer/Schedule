import UIKit

class EventsViewController: UIViewController, UITableViewDataSource {
    
    var eventList: [Event] = []
    @IBOutlet weak var listTables: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTables.dataSource = self
        
        getEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listTables.reloadData()
    }
    
    func getEvents() {
        let urlSession = URLSession.shared
        let url =  URL(string: "https://superapi.netlify.app/api/db/eventos")
        
        urlSession.dataTask(with: url!) { data, response, error  in
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                for i in json as! [[String: Any]]{
                    let ev = Event(json: i)
                    self.eventList.append(ev)
                    
                }
                DispatchQueue.main.async {
                    self.listTables.reloadData()
                }
            }
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventRow = listTables.dequeueReusableCell(withIdentifier: "eventRowId", for: indexPath) as! EventRow
        
        let dateFormatted = NSDate(timeIntervalSince1970: TimeInterval(Double(eventList[indexPath.row].date)))
        
        print("Fecha formateada correctamente -> \(dateFormatted)")
        
        eventRow.nameEvent.text = eventList[indexPath.row].name
        eventRow.date.text = "\(dateFormatted)"
        
        return eventRow
    }
    
    
}

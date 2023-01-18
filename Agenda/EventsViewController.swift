import UIKit

class EventsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var eventsTable: UITableView!
    static var events = [Event]()
    
    var getterPoster: GetterPoster = GetterPoster()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTable.dataSource = self
        getterPoster.send()
    }
    override func viewDidAppear(_ animated: Bool) {
        eventsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventsViewController.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventRow: EventRow = tableView.dequeueReusableCell(withIdentifier: "eventRowId", for: indexPath) as! EventRow
        
        let event = EventsViewController.events[indexPath.row]
        
        let date = event.date.description.components(separatedBy: " ")
        eventRow.nameDateEvent.text = event.name + "  -  " + date[0] + " " + date[1]
        return eventRow
    }
}

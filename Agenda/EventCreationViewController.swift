//
//  EventCreationViewController.swift
//  Agenda
//
//  Created by Apps2M on 16/1/23.
//

import UIKit

class EventCreationViewController: UIViewController {
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventDate: UIDatePicker!
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func getEventInfo(_ sender: UIButton) {
        let name = eventName.text
        let date = eventDate.date
        event = Event(name: name!, date: date)
        EventsViewController.events.append(event!)
        print(EventsViewController.events)
        navigationController?.popToRootViewController(animated: true)
    }
    
}

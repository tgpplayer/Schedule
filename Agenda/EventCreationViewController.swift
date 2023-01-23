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
    
    @IBAction func sendNewEventInfo(_ sender: UIButton) {
        let parameters: [String: Any] = [
            "name": eventName.text!,
            "date": String(Int(eventDate.date.timeIntervalSince1970))
        ]
        
        let url = URL(string: "https://superapi.netlify.app/api/db/eventos")

        var POSTpetition = URLRequest(url: url!)
        POSTpetition.httpMethod = "POST"
        POSTpetition.addValue("application/json", forHTTPHeaderField: "Content-Type")
        POSTpetition.addValue("application/json", forHTTPHeaderField: "Accept")
            
        
        do {
            POSTpetition.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: POSTpetition) {data, response, error in
            print("Datos \(String(describing: data))")
            
        }.resume()
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}

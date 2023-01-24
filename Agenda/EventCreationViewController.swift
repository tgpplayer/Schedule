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
    
    @IBAction func sendNewEventInfo(_ sender: UIButton) {
        print("PRINTS DE CUANDO SE CREA EL EVENTO")
        print(eventDate.date.timeIntervalSince1970)
        print(eventDate.date)
        print("Fecha" + String(Double(eventDate.date.timeIntervalSince1970)))
        let parameters: [String: Any] = [
            "name": eventName.text!,
            "date": Int(eventDate.date.timeIntervalSince1970 * 1000)
        ]

        let url = URL(string: "https://superapi.netlify.app/api/db/eventos")

        var POSTpetition = URLRequest(url: url!)
        POSTpetition.httpMethod = "POST"
        POSTpetition.addValue("application/json", forHTTPHeaderField: "Content-Type")
        POSTpetition.addValue("application/json", forHTTPHeaderField: "Accept")


        do {
            POSTpetition.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            print("Fecha \(String(describing: parameters["date"]))")
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

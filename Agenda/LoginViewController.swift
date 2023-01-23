//
//  ViewController.swift
//  Agenda
//
//  Created by Apps2M on 12/1/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func validateUser(_ sender: UIButton) {
        let parameters: [String: Any] = [
            "user": String(username.text!),
            "pass": String(password.text!)
        ]
        
        let url = URL(string: "https://superapi.netlify.app/api/login")

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
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
                
                if httpResponse.statusCode == 200 {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "eventList", sender: nil)
                    }
                }
            }
        }.resume()
        
    }
    
}


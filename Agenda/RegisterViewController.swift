import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var newUserName: UITextField!
    @IBOutlet weak var newUserPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func resgiterUser(_ sender: UIButton) {
        let parameters: [String: Any] = [
            "user": newUserName.text!,
            "pass": newUserPassword.text!
        ]
        
        let url = URL(string: "https://superapi.netlify.app/api/register")

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
        
        dismiss(animated: true) //Last action after al the information is sent
    }
    @IBAction func toLogin(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

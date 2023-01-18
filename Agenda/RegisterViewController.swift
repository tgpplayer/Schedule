import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func resgiterUser(_ sender: UIButton) {
        
        dismiss(animated: true) //Last action after al the information is sent
    }
    @IBAction func toLogin(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

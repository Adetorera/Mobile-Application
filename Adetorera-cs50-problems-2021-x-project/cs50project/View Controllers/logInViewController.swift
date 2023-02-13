//
//  logInViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 24/10/2021.
//

import UIKit
import FirebaseAuth

class logInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    func validateFields() -> String? {
            
            //Check that all fields are filled in
            if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||  passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                return "Please fill in all fields."
            }
        //Check if the password is secure.
                let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if Utilities.isPasswordValid(cleanedPassword) == false {
                    //Password isn't secure enough
                    return "Incorrect Password"
                }
                
                return nil
            }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func loginTapped(_ sender: Any) {
        
        //Validate Text Fields
        
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
        
        //Create cleaned versions of the Text Field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Signing In The User
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                //Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
               }

               else {
                let signUphomeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.SignupHomeViewController) as? SignupHomeViewController
                
                self.view.window?.rootViewController = signUphomeViewController
                self.view.window?.makeKeyAndVisible()
               }
            }
        
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}

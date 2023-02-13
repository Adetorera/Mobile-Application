//
//  signUpViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 31/10/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class signUpViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        //Hide the error label
        errorLabel.alpha = 0
        
        //Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    //Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    
    func validateFields() -> String? {
            
            //Check that all fields are filled in
            if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                return "Please fill in all fields."
            }
        //Check if the password is secure.
                let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if Utilities.isPasswordValid(cleanedPassword) == false {
                    //Password isn't secure enough
                    return "Please make sure your password is at least 8 characters, contains a special character and a number."
                }
                
                return nil
            }

        //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func signUpTapped(_ sender: Any) {
        // Validate the fields
               let error = validateFields()
               
               if error != nil {
                   
                   // There's something wrong with the fields, show error message
                   showError(error!)
               }
               else {
                   
                   // Create cleaned versions of the data
                   
                   let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let name = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   
                   // Create the user
                 
                Auth.auth().createUser(withEmail: email, password: password) { (result,err) in
                    //Check for errors
                    if err != nil {
                        
                        //There was an error creating user
                        self.showError("Error creating user")
                    }
                    else{
                        //User was successfully created, store the data
                        let db = Firestore.firestore()
                        
                        db.collection("users").addDocument(data: ["email":email, "name":name, "uid":result!.user.uid]) {
                            (error) in
                            
                            if  error != nil {
                                //Error saving user data
                                self.showError("Error saving user data")
                            }
                        }
                        
                        //Transition to home screen
                        self.transitionToHome()
                        
                    }
                }
                   
                   
                   
               }
           }
           
           func showError(_ message:String) {
               
               errorLabel.text = message
               errorLabel.alpha = 1
           }
           
    func transitionToHome() {
        let signupHomeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.SignupHomeViewController) as? SignupHomeViewController
        
        view.window?.rootViewController = signupHomeViewController
        view.window?.makeKeyAndVisible()
    }
       }



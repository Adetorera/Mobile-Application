//
//  LoginHomeViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 25/10/2021.
//

import UIKit

class LoginHomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var finalName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            welcomeLabel.text = "Welcome " + finalName
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

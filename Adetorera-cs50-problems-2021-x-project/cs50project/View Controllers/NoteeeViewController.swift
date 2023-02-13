//
//  NoteeeViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 30/10/2021.
//

import UIKit

class NoteeeViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
       @IBOutlet var noteLabel: UITextView!

       public var noteTitle: String = ""
       public var note: String = ""

       override func viewDidLoad() {
           super.viewDidLoad()
           titleLabel.text = noteTitle
           noteLabel.text = note
       }


   }

//
//  TextEntryyyViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 30/10/2021.
//

import UIKit

class TextEntryyyViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
        @IBOutlet var noteField: UITextView!

        public var completion: ((String, String) -> Void)?

        override func viewDidLoad() {
            super.viewDidLoad()
            titleField.becomeFirstResponder()
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        }

        @objc func didTapSave() {
            if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
                completion?(text, noteField.text)
            }
        }


    }

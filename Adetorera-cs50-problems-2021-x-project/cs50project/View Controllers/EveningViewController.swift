//
//  EveningViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 30/10/2021.
//

import UIKit

class EveningViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!

    var models: [(title: String, note: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Evening Manifestation"
    }

    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "newww") as? TextEntryyyViewController else {
            return
        }
        vc.title = "New Manifestation"
        vc.navigationItem.largeTitleDisplayMode = .never
         vc.completion = { noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: noteTitle, note: note))
            self.label.isHidden = true
            self.table.isHidden = false

            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellssss", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = models[indexPath.row]

        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "noteee") as? NoteeeViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Manifestations"
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }

}

//
//  GoalsViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 29/10/2021.
//


import RealmSwift
import UIKit

/*
 - To show list of current to do list itmes
 - To enter new to do list items
 - To show previously entered to do list item
 - Item
 - Date
 */

class ToDoListItem: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}

class GoalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    private let realm = try! Realm()
    private var data = [ToDoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        data = realm.objects(ToDoListItem.self).map({ $0 })
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
    }

    // Mark: Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].item
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // Open the screen where we can see item info and dleete
        let item = data[indexPath.row]

        guard let vc = storyboard?.instantiateViewController(identifier: "view") as? ViewViewController else {
            return
        }

        vc.item = item
        vc.deletionHandler = { [weak self] in
            self?.refresh()
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = item.item
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func didTapAddButton() {
        guard let vc = storyboard?.instantiateViewController(identifier: "enter") as? EntryViewController else {
            return
        }
        vc.completionHandler = { [weak self] in
            self?.refresh()
        }
        vc.title = "New Item"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }

    func refresh() {
        data = realm.objects(ToDoListItem.self).map({ $0 })
        table.reloadData()
    }

}
 /*
import UIKit

class GoalsViewController: UIViewController, UITableViewDataSource {
    
    private let table : UITableView = {
        
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()

   var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.items = UserDefaults.standard.stringArray(forKey: "Goals") ?? []
        title = "Goals"
        view.addSubview(table)
        table.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Goal", message: "Enter New Goal", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Enter Your Goal..."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (_) in
            
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    
                    
                    //Enter New Item
                    DispatchQueue.main.async {
                        var currentItems = UserDefaults.standard.stringArray(forKey: "Goals") ?? []
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems , forKey: "Goals")
                        self?.items.append(text)
                        self? .table.reloadData()
                    }
                    
                }
            }
            
        }))
        present(alert, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    
        override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            table.frame = view.bounds
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

func tableView(tableView:UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
        
        tableView.beginUpdates()
        
        tableView.deleteRows(at: [indexPath], with: .fade )
        
        tableView.endUpdates()
    }
    
}

func tableView(tableView:UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    
    return .delete
    
}

/*
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        let sheet = UIAlertController  (title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.items.remove(at: indexPath.row)
            var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
            currentItems.remove(at: indexPath.row)
            UserDefaults.standard.setValue(currentItems, forKey: "items")
            UserDefaults.standard.removeObject(forKey: item)
            UserDefaults.standard.synchronize()
            self?.table.reloadData()
        }))
        present(sheet, animated: true)
 }*/*/

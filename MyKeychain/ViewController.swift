//
//  ViewController.swift
//  MyKeychain
//
//  Created by Dorian Emenir on 23/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    static var shared = ViewController()
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    /// Segue's identifier from ViewController view to AddNewIds
    let addPwd = "addPwd"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
///    Button to add new user
    @IBAction func addBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: addPwd, sender: sender)
    }
    
    
    // MARK: - Navigation Add btn
        
        /// Segue performed when add btn is clicked
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == addPwd else { return }
            guard let _ = segue.destination as? AddNewIds else { return }
        }
    
}

//MARK: Extension for VC : UITableView

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
///    Setup tableView
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
///    Number of sections in tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
///    Number of rows per section in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UDHelper.shared.getUser().count
    }
    
///   Contents of a cell at a given index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = UDHelper.shared.getUser()[indexPath.row]
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = item
        cell.contentConfiguration = config
        return cell
    }
    
///    Editing a row
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
///    Behaviour of the editing style
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            UDHelper.shared.removeFromArray(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
///    When a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(UDHelper.shared.getUser()[indexPath.row])
        AddNewIds.shared.urlLinkTF.text = UDHelper.shared.getUser()[indexPath.row]
        AddNewIds.shared.userIdTF.text = UDHelper.shared.getUser()[indexPath.row]
        AddNewIds.shared.passwordTF.text = UDHelper.shared.getUser()[indexPath.row]
        performSegue(withIdentifier: addPwd, sender: indexPath.row)
    }
}


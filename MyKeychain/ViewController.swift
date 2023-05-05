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
    
    /// Segue's identifier from ListController view to DeailController's
    let addPwd = "addPwd"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }


    @IBAction func addBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: addPwd, sender: sender)
    }
    
    
    // MARK: - Navigation
        
        /// Segue performed when a row is selected
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == addPwd else { return }
            guard let _ = segue.destination as? AddNewIds else { return }
        }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UDHelper.shared.getUser().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = UDHelper.shared.getUser()[indexPath.row]
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = item
        cell.contentConfiguration = config
        return cell
    }
}

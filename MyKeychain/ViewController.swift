//
//  ViewController.swift
//  MyKeychain
//
//  Created by Dorian Emenir on 23/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    /// Segue's identifier from ListController view to DeailController's
    let addPwd = "addPwd"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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


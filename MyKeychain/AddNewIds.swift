//
//  AddNewIds.swift
//  MyKeychain
//
//  Created by Dorian Emenir on 24/04/2023.
//

import UIKit

class AddNewIds: UIViewController {
    
    static var shared = AddNewIds()
    
    @IBOutlet weak var urlLinkTF: UITextField!
    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var validNewIdBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    @IBAction func validNewIdBtnPressed(_ sender: UIButton) {
        urlLinkTF.resignFirstResponder()
        userIdTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        guard let url = urlLinkTF.text else { return }
        guard let userId = userIdTF.text else { return }
        guard let pwd = passwordTF.text else { return }
        UDHelper.shared.setUrl(url)
        UDHelper.shared.setUser(userId)
        UDHelper.shared.setPwd(pwd)
        ViewController.shared.tableView.reloadData()
        urlLinkTF.text = nil
        userIdTF.text = nil
        passwordTF.text = nil
    }
    

}

//MARK: Extension for AddNewIds : UITextfield

extension AddNewIds: UITextFieldDelegate {
    
///    Setup textfield
    func setupTextField() {
        urlLinkTF.delegate = self
        userIdTF.delegate = self
        passwordTF.delegate = self
    }
    
///    Configure "return" btn's behaviour
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        urlLinkTF.resignFirstResponder()
        userIdTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        return true
    }
}

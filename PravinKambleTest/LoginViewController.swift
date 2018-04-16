//
//  ViewController.swift
//  PravinKambleTest
//
//  Created by Pravin Kamble on 12/04/18.
//  Copyright © 2018 Pravin Kamble. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let coreDataManager = CoreDataManager()
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.usernameTF {
            
            textField.becomeFirstResponder()
        }
        
        else if textField == self.passwordTF {
            
            textField.becomeFirstResponder()
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.usernameTF {
            
            textField.resignFirstResponder()
        }
        else if textField == self.passwordTF {
            
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        
        
        let username : String!
        let password : String!
        
        username = self.usernameTF.text
        password = self.passwordTF.text
        
        if username == ""{
            
            self.alert(alertTitle: "Alert", alertMessage: "Please enter your user name.")
        }
        else if password == ""{
            
            self.alert(alertTitle: "Alert", alertMessage: "Please enter your password.")
        }
        else{
            
                print(username)
                print(password)
                
                let status =  self.coreDataManager.searchData(username: username, password: password)
                
                if status == true{
                    
                    self.usernameTF.text = nil
                    self.passwordTF.text = nil
                    self.view.endEditing(true)
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "SidMain") as! MainViewViewController
                    vc.navigationItem.hidesBackButton = true
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
                else{
                    
                    self.usernameTF.text = nil
                    self.passwordTF.text = nil
                    self.view.endEditing(true)
                    self.alert(alertTitle: "Failure", alertMessage: "Invalid Credentials.")
                }
        }
        
        
        //self.coreDataManager.fetchData()
    }
    
    func alert(alertTitle: String, alertMessage: String){
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


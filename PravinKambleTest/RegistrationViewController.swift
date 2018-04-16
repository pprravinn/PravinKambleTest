//
//  RegistrationViewController.swift
//  PravinKambleTest
//
//  Created by Pravin Kamble on 12/04/18.
//  Copyright © 2018 Pravin Kamble. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    let coreDataManager = CoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "User Registration"
        
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
        else if textField == self.emailTF {
            
            textField.becomeFirstResponder()
        }
        else if textField == self.passwordTF {
            
            textField.becomeFirstResponder()
        }
        else if textField == self.confirmPasswordTF {
            
            textField.becomeFirstResponder()
        }
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.usernameTF {
            
            textField.resignFirstResponder()
        }
        else if textField == self.emailTF {
            
            textField.resignFirstResponder()
        }
        else if textField == self.passwordTF {
            
            textField.resignFirstResponder()
        }
        else if textField == self.confirmPasswordTF {
            
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        let username : String!
        let email : String!
        let password : String!
        let confirmPassword : String!
        
        username = self.usernameTF.text
        email = self.emailTF.text
        password = self.passwordTF.text
        confirmPassword = self.confirmPasswordTF.text
        
        if username == ""{
            
            self.alert(alertTitle: "Alert", alertMessage: "Please enter your user name.")
        }
        else if email == ""{
            
            self.alert(alertTitle: "Alert", alertMessage: "Please enter your email.")
        }
        else if password == ""{
            
            self.alert(alertTitle: "Alert", alertMessage: "Please enter your password.")
        }
        else if confirmPassword == ""{
            
            self.alert(alertTitle: "Alert", alertMessage: "Please enter your confirm password.")
        }
        else{
            
            if password != confirmPassword {
                
                self.alert(alertTitle: "Alert", alertMessage: "Password doesn't matched.")
            }
            else{
                
                print(username)
                print(email)
                print(password)
                
                //self.insertUserData(username: username, email: email, password: password)
               let status =  self.coreDataManager.insertUserData(username: username, email: email, password: password)
                
                if status == true{
                    
                    self.alert(alertTitle: "Sucess", alertMessage: "User is sucessfully registered.")
                    self.usernameTF.text = nil
                    self.emailTF.text = nil
                    self.passwordTF.text = nil
                    self.confirmPasswordTF.text = nil
                    
                    self.view.endEditing(true)
                }
                else{
                    
                    self.alert(alertTitle: "Failure", alertMessage: "Unable to register user data.")
                }
        
            }
        }
       
    }
    
   func alert(alertTitle: String, alertMessage: String){
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

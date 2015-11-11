//
//  LoginViewController.swift
//  You and Me List
//
//  Created by Paul Prestwood on 11/10/15.
//  Copyright © 2015 Paul Prestwood. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate {
    
    var dataModel: DataModel!
    
    var firebase = Firebase(url: "https://you-and-me-list.firebaseio.com/")
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func LoginButton(sender: UIButton) {
        logUser()
        
    }
    @IBAction func SignupButton(sender: UIButton) {
        firebase.createUser(emailTextField.text, password: passwordTextField.text) { (error:NSError!) -> Void in
            if (error != nil) {
                print(error.localizedDescription)
            } else {
                print ("New user created")
                self.logUser()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logUser() {
        print("Start logging user")
        firebase.authUser(emailTextField.text, password: passwordTextField.text) { (error:NSError!, authData:FAuthData!) -> Void in
            if ( error != nil) {
                print(error.localizedDescription)
            } else {
                print("user logged \(authData.description)")
            }
        }
    }
    
}

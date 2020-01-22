//
//  PersonViewController.swift
//  black_shop
//
//  Created by Владислав Бочаров on 03/01/2020.
//  Copyright © 2020 Владислав Бочаров. All rights reserved.
// профиль и магазин на карте

    import UIKit
    import Firebase

    class PersonViewController: UIViewController {

        @IBOutlet weak var greetLabel: UILabel!
        @IBOutlet weak var twoStack: UIStackView!
        @IBOutlet weak var inVutton: UIButton!
        @IBOutlet weak var emailField: UITextField!
        @IBOutlet weak var passwordField: UITextField!
        
        
        var signState: Bool = true{
            willSet{
                if newValue {
                    twoStack.isHidden = false
                    emailField.isHidden = false
                    passwordField.isHidden = false
                    inVutton.setTitle("Вход", for: .normal)
                    greetLabel.text="Добро пожаловать"
                    
                } else{
                    twoStack.isHidden = true
                    emailField.isHidden = true
                    passwordField.isHidden = true
                    inVutton.setTitle("Выход", for: .normal)
                }
            }
        }
        
        @IBAction func enterButton(_ sender: Any) {
            
            if (signState){
            guard
              let email = emailField.text,
              let password = passwordField.text,
              email.count > 0,
              password.count > 0
              else {
                return
            }

            Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (result, error) in
             if error == nil{
               if let result = result {
                   print(result.user.uid)
                self.greetLabel.text = "Здравствуйте, \(String(describing: result.user.email!))"
                self.signState = !self.signState
               }
             }
              else{
               let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
               let defaultAction = UIAlertAction(title: "OK", style: .cancel)
            { (action) in
            do {
                   try Auth.auth().signOut()
               }
            catch let signOutError as NSError {
                   print ("Error signing out: %@", signOutError)
               }
              }
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
              }}
                
            } else{
                
                let user = Auth.auth().currentUser!
                let onlineRef = Database.database().reference(withPath: "users/\(user.uid)")
                    onlineRef.removeValue { (error, _) in
                    if let error = error {
                        print("Removing online failed: \(error)")
                        return
                    }
                do {
                    try Auth.auth().signOut()
                    self.signState = !self.signState
                } catch (let error) {
                    print("Auth sign out failed: \(error)")
                    }
                }
            }

        }
        
        @IBOutlet weak var infoTable: UITableView!
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            Auth.auth().addStateDidChangeListener() { auth, user in
              if user != nil {
                self.signState = false
                self.greetLabel.text = "Здравствуйте, \(user!.email!)"
              }
            }
        }
}


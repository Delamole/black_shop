//
//  SignUpViewController.swift
//  black_shop
//
//  Created by Владислав Бочаров on 03/01/2020.
//  Copyright © 2020 Владислав Бочаров. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    @IBOutlet weak var nameUserField: UITextField!
    @IBOutlet weak var passwordUserField: UITextField!
    @IBOutlet weak var emailUserField: UITextField!
    
    
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didSignUp(_ sender: Any) {
        guard
                 let email = passwordUserField.text,
                 let password = passwordUserField.text,
                 let name = nameUserField.text,
                 email.count > 0,
                 password.count > 0,
                 name.count > 0
                 else {
                   return
               }
        
        Auth.auth().createUser(withEmail: emailUserField.text!, password: passwordUserField.text!){ (result, error) in
         if error == nil {
            if let result = result {
                print(result.user.uid)
                let ref = Database.database().reference().child("users")
                ref.child(result.user.uid).updateChildValues(["name" : self.nameUserField.text!])
                self.dismiss(animated: true, completion: nil)
                
            }
        }
         else{
           let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
           let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        
        do {
               try Auth.auth().signOut()
           }
        catch let signOutError as NSError {
               print ("Error signing out: %@", signOutError)
           }
            
        }
    }
              
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? PersonViewController, segue.identifier=="returnSignUp"{
                vc.greetLabel.text = nameUserField.text!
                vc.signState = !vc.signState
            }
    }
}

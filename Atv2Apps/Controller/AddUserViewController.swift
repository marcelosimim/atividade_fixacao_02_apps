//
//  AddUserViewController.swift
//  Atv2Apps
//
//  Created by Marcelo Simim on 17/09/21.
//

import UIKit
import Firebase

class AddUserViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageProfile:ImageProfile = ImageProfile()
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageProfile.images[0]
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text{
            db.collection("users").addDocument(data: ["name":name, "email": email, "password":password,"image":imageProfile.imageIndex]){ (error) in
                if let e = error{
                    print(e)
                }
            }
        }
    }
    
    @IBAction func previousPressed(_ sender: Any) {
        imageProfile.previousImage()
        updateUI()
        
    }
    @IBAction func nextPressed(_ sender: UIButton) {
        imageProfile.nextImage()
        updateUI()
    }
    
    func updateUI(){
        let index = imageProfile.imageIndex
        imageView.image = imageProfile.images[index]
    }
}

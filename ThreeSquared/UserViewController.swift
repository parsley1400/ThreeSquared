//
//  UserViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/10/17.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class UserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameText: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var myImage: UIImage!
    var myName: String!
    var score: Int = 0
    
    let saveScore: UserDefaults = UserDefaults.standard
    
    var ref: DatabaseReference!
    var uid: String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.layer.cornerRadius = 75
        saveButton.layer.cornerRadius = 20
        
        let tapGestureImage:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(UserViewController.tappedImage(_:)))
        
        tapGestureImage.delegate = self
        nameText.delegate = self
        
        self.imageView.addGestureRecognizer(tapGestureImage)
        
        if saveScore.object(forKey:"userboolean") as? Bool == true{
                   nameText.text = saveScore.object(forKey:"name") as? String
//                   imageView.image = saveScore.object(forKey:"image") as? UIImage
               }

        ref = Database.database().reference()
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tappedImage(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameText.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveActionButton(){
        if saveScore.object(forKey:"userboolean") as? Bool == true{
            let userID = Auth.auth().currentUser?.uid
                let newdata = ["username": NSString(string: self.nameText.text ?? "name")]
                self.ref.child("user").child(userID!).updateChildValues(newdata)
        }else{
        Auth.auth().signInAnonymously() { (authResult, error) in
            if error != nil{
                print("Auth Error :\(error!.localizedDescription)")
            }
            guard let user = authResult?.user else { return }
            //            let isAnonymous = user.isAnonymous
            self.uid = user.uid
            return
                
                self.ref.child("user").child(user.uid).setValue(["userid": self.uid ?? " ", "username": NSString(string: self.nameText.text ?? "name"), "highscore": NSNumber(integerLiteral: self.score)])
        }
        }
        
        
        

                saveScore.set(nameText.text, forKey:"name")
        //        saveScore.set(imageView.image, forKey:"image")
                saveScore.set(true, forKey:"userboolean")

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

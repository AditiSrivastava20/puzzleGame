//
//  ViewController.swift
//  puzzlegame
//
//  Created by Sierra 4 on 16/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    @IBOutlet weak var imagePicker: UIImageView!
    @IBOutlet weak var pressButton: UIButton!
    var profileImage =  UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
@IBAction func btnTap(_ sender: Any) {
  
let profileImage = UIImagePickerController()
 profileImage.delegate = self
 
 profileImage.sourceType = UIImagePickerControllerSourceType.photoLibrary
 profileImage.allowsEditing = false
 self.present(profileImage , animated: true) {

 }
 }
 func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
 dismiss(animated: true, completion: nil)
 }
 
 func imagePickerController(_ picker : UIImagePickerController , didFinishPickingMediaWithInfo info : [String : Any]) {
 if let  profileImage = info[UIImagePickerControllerOriginalImage] as? UIImage! {
 imagePicker.image =  profileImage
    
 }
 else {

 }
 self.dismiss(animated: true
 , completion: nil)
 }
 
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController : newViewController = segue.destination as! newViewController
        destViewController.img = imagePicker.image!
        
    }
 
 
 }
 
 
 
 

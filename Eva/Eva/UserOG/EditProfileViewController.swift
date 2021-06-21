//
//  EditProfileViewController.swift
//  Eva
//
//  Created by LMNTrix on 4/30/21.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var editProfileBttn: UIButton!
    @IBOutlet weak var updateProfile: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabbar = tabBarController as! HomeTabBarViewController
        self.apartment = tabbar.apartment
        self.roomie = tabbar.roomie
        
        fNameTextField.delegate = self
        lNameTextField.delegate = self
        contactTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
       imagePicker.delegate = self
        profileImage.image = UIImage(named: "noprofile.png")
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.backgroundColor = UIColor.black
       // profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.cornerRadius = 80
        profileImage.clipsToBounds = true
        
        
        fNameTextField.text = roomie.firstName
        lNameTextField.text = roomie.lastName
        contactTextField.text = roomie.contact
        emailTextField.text = roomie.email
        passwordTextField.text = roomie.password
        fNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        lNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        contactTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        updateProfile.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func changePicture(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func editProfileClicked(_ sender: Any) {
        fNameTextField.isEnabled = true
        lNameTextField.isEnabled = true
        contactTextField.isEnabled = true
        emailTextField.isEnabled = true
        passwordTextField.isEnabled = true
        
        
        fNameTextField.text = ""
        lNameTextField.text = ""
        contactTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        updateProfile.isHidden = false
        editProfileBttn.isHidden = true
    }
    
    @IBAction func updateBtnClicked(_ sender: Any) {
        var fName = fNameTextField.text!
        var lName = lNameTextField.text!
        var contact = contactTextField.text!
        var email = emailTextField.text!
        var password = passwordTextField.text!
    
        if fName != ""{
            roomie.firstName = fName
        }
        if lName != ""{
            roomie.lastName = lName
        }
        if contact != ""{
            roomie.contact = contact
        }
        if email != ""{
            if isValidEmail(email){
                roomie.email = email
            }else{
                showAlert(message: "Email is not valid. Please try again")
            }
        }
        if password != ""{
            roomie.password = password
        }
        
        fNameTextField.isEnabled = false
        lNameTextField.isEnabled = false
        contactTextField.isEnabled = false
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
        
        updateProfile.isHidden = true
        editProfileBttn.isHidden = false
        
        print(roomie.firstName)
        
        fNameTextField.text = roomie.firstName
        lNameTextField.text = roomie.lastName
        contactTextField.text = roomie.contact
        emailTextField.text = roomie.email
        passwordTextField.text = roomie.password
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fNameTextField.resignFirstResponder()
        lNameTextField.resignFirstResponder()
        contactTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}



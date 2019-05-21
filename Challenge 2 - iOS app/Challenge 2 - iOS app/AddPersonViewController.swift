//
//  AddPersonViewController.swift
//  Challenge 2 - iOS app
//
//  Created by Hod Kimhi on 2019-05-19.
//  Copyright © 2019 hodkimhi. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var roleTextField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var infoTextViewPlaceholderText: UILabel!
    @IBOutlet weak var selectImage: UIButton!
    @IBOutlet weak var photoView: UIImageView!
    
    //MARK: - IBActions
    @IBAction func selectImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {        
        let shouldContinue =
            !(nameTextField.text?.isEmpty)! && //if name text field is not empty
            !(roleTextField.text?.isEmpty)! && //if role text field is not empty
            !(infoTextView.text?.isEmpty)! && //if info text view is not empty
            (photoView.image != UIImage(named: "circle")) && //if the image is not the default image
            (photoView.image != UIImage()) //if the image is not empty (should never happen)
        
        if shouldContinue
        {
            let name = nameTextField.text!
            let role = roleTextField.text!
            let info = infoTextView.text!
            let image = photoView.image!
            
            let newPerson = Person(name: name, role: role, info: info, image: image)
            if(newPerson.role == "Designer")
            {
                designers.insert(newPerson, at: 0)
            }
            else if(newPerson.role == "Developer")
            {
                developers.insert(newPerson, at: 0)
            }
            else
            {
                other.insert(newPerson, at: 0)
            }
            
            dismiss(animated: true, completion: nil)
        }
        else
        {
            errorAlert()
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismissKeyboard()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        roleTextField.delegate = self
        infoTextView.delegate = self
        nameTextField.tag = 0
        roleTextField.tag = 1
        infoTextView.tag = 2
        
        nameTextField.returnKeyType = .next
        nameTextField.autocapitalizationType = .words
        nameTextField.autocorrectionType = .no
        nameTextField.spellCheckingType = .no
        
        roleTextField.returnKeyType = .next
        roleTextField.autocapitalizationType = .sentences
        roleTextField.autocorrectionType = .yes
        roleTextField.spellCheckingType = .yes
        
        infoTextView.returnKeyType = .done
        infoTextView.autocapitalizationType = .sentences
        infoTextView.autocorrectionType = .yes
        infoTextView.spellCheckingType = .yes
        
        photoView.layer.cornerRadius = photoView.frame.size.width / 2
        photoView.clipsToBounds = true
        
        infoTextView.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        infoTextView.layer.borderWidth = 1.0;
        infoTextView.layer.cornerRadius = 5.0;
        
        infoTextViewPlaceholderText.textColor = UIColor(red: 215/255, green: 214/255, blue: 218/255, alpha: 1.0)
        infoTextViewPlaceholderText.text = "Information"
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(nameTextField.text?.isEmpty)! //if name text field is empty, auto-select the keyboard
        {
            nameTextField.becomeFirstResponder()
        }
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    //MARK: - TextField delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
    }
    
    //MARK: - TextView Delegates
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        infoTextViewPlaceholderText.isHidden = true
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        if infoTextView.text.isEmpty
        {
            infoTextViewPlaceholderText.isHidden = false
        }
    }

    //MARK: - UIImagePickerController Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoView.contentMode = .scaleAspectFit
            photoView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Custom Functions
    func errorAlert()
    {
        let alert = UIAlertController(title: "Invalid Input", message: "Make sure none of the fields are empty and remember to select a profile image", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

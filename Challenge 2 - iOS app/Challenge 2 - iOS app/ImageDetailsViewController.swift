//
//  ImageDetailsViewController.swift
//  Challenge 2 - iOS app
//
//  Created by Hod Kimhi on 2019-05-18.
//  Copyright © 2019 hodkimhi. All rights reserved.
//

import UIKit

class ImageDetailsViewController: UIViewController, UITextViewDelegate {

    //MARK: - IBOutlets
    
    @IBOutlet weak var photoName: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var photoDescription: UILabel!
    @IBOutlet weak var photoDescriptionTextView: UITextView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    //MARK: - Variables
    var person: Person = Person(name: "", role: "", info: "", image: UIImage())
    
//    var pointer: UnsafeMutablePointer<Person> = Person(name: "", role: "", info: "", image: UIImage())
    
    //MARK: - ViewController Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //these aren't editable so they will never change. Therefore we can load them in viewDidLoad isntead of viewWillAppear
        photoName.text = person.name
        roleLabel.text = person.role
        photoView.image = person.image
        
        photoDescriptionTextView.delegate = self
        
        photoView.layer.cornerRadius = photoView.frame.size.width / 2
        photoView.clipsToBounds = true
        
        photoDescription.lineBreakMode = .byWordWrapping
        photoDescription.numberOfLines = 0
        
        photoDescriptionTextView.returnKeyType = .done
        photoDescriptionTextView.autocapitalizationType = .sentences
        photoDescriptionTextView.autocorrectionType = .yes
        photoDescriptionTextView.spellCheckingType = .yes
        
        photoDescriptionTextView.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        photoDescriptionTextView.layer.borderWidth = 1.0;
        photoDescriptionTextView.layer.cornerRadius = 5.0;
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        photoDescription.text = person.info //update label text
        photoDescriptionTextView.text = photoDescription.text //update textview text
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //person is just a local copy of the person we're viewing, so we find where they are in the array and replace the info parameter of the person object currently in the array with the new value.
        if(person.role.lowercased() == "developer")
        {
            let index = developers.firstIndex(of: person)
            developers[index!].info = photoDescription.text!
        }
        else if(person.role.lowercased() == "designer")
        {
            let index = designers.firstIndex(of: person)
            designers[index!].info = photoDescription.text!
        }
        else
        {
            let index = other.firstIndex(of: person)
            other[index!].info = photoDescription.text!
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if(editing)
        {
            photoDescriptionTextView.text = photoDescription.text
            photoDescriptionTextView.becomeFirstResponder()
            
            photoDescription.isHidden = true
            photoDescriptionTextView.isHidden = false
        }
        else
        {
            photoDescription.text = photoDescriptionTextView.text
            photoDescriptionTextView.resignFirstResponder()
            
            photoDescription.isHidden = false
            photoDescriptionTextView.isHidden = true
        }
    }
    
    //MARK: - TextView Delegates
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            setEditing(false, animated: true)
            textView.resignFirstResponder()
        }
        return true
    }
    
    //MARK: - Custom Functinos
    @objc func dismissKeyboard()
    {
        self.setEditing(false, animated: true)
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

//
//  ImagesViewController.swift
//  Challenge 2 - iOS app
//
//  Created by Hod Kimhi on 2019-05-18.
//  Copyright © 2019 hodkimhi. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Variables
    var person: Person = Person(name: "", role: "", info: "", image: UIImage())

    //MARK: - IBOutlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imagesTableView: UITableView!
    
    //MARK: - IBActions
    @IBAction func switchToggled(_ sender: Any) {
        imagesTableView.reloadData()
    }
    
    //MARK: - ViewController Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesTableView.reloadData()
        imagesTableView.tableFooterView = UIView(frame: CGRect.zero)
        self.title = "Home"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imagesTableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated:animated)
        
        imagesTableView.isEditing = editing
    }
    
    // MARK: - UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            returnValue = developers.count
        case 1:
            returnValue = designers.count
        case 2:
            returnValue = other.count
        default:
            break
        }
        
        return returnValue
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            cell.photoName.text = developers[indexPath.row].name
            cell.photoView.image = developers[indexPath.row].image
        case 1:
            cell.photoName.text = designers[indexPath.row].name
            cell.photoView.image = designers[indexPath.row].image
        case 2:
            cell.photoName.text = other[indexPath.row].name
            cell.photoView.image = other[indexPath.row].image
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            person = developers[indexPath.row]
        case 1:
            person = designers[indexPath.row]
        case 2:
            person = other[indexPath.row]
        default:
            break
        }
        
        performSegue(withIdentifier: "ListToDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                developers.remove(at: indexPath.row)
            case 1:
                designers.remove(at: indexPath.row)
            case 2:
                other.remove(at: indexPath.row)
            default:
                break
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var movedObject: Person
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            movedObject = developers[sourceIndexPath.row]
            developers.remove(at: sourceIndexPath.row)
            developers.insert(movedObject, at: destinationIndexPath.row)
        case 1:
            movedObject = designers[sourceIndexPath.row]
            designers.remove(at: sourceIndexPath.row)
            designers.insert(movedObject, at: destinationIndexPath.row)
        case 2:
            movedObject = other[sourceIndexPath.row]
            other.remove(at: sourceIndexPath.row)
            other.insert(movedObject, at: destinationIndexPath.row)
        default:
            break
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListToDetails"
        {
            if let vc = segue.destination as? ImageDetailsViewController
            {
                vc.person = person
            }
        }
    }

}

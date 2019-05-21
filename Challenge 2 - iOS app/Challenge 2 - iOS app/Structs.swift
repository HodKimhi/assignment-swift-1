//
//  Structs.swift
//  Challenge 2 - iOS app
//
//  Created by Hod Kimhi on 2019-05-18.
//  Copyright © 2019 hodkimhi. All rights reserved.
//

import Foundation
import UIKit

struct Person
{
    var name: String
    var role: String
    var info: String
    var image: UIImage
    
    init(name: String, role: String, info: String, image: UIImage)
    {
        self.name = name
        self.role = role
        self.info = info
        self.image = image
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
    let areEqual =
        lhs.name == rhs.name &&
        lhs.role == rhs.role &&
        lhs.info == rhs.info &&
        lhs.image == rhs.image
    
    return areEqual
    }
}

var developer1 = Person(name: "Amir Chabi", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Amir Chabi")!)
var developer2 = Person(name: "Kimia Nikazm", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Kimia Nikazm")!)
var developer3 = Person(name: "Pevisha Joshi", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Pevisha Joshi")!)
var developer4 = Person(name: "Henry Lo", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Henry Lo")!)
var developer5 = Person(name: "Daniel Mathews", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Daniel Mathews")!)
var developer6 = Person(name: "Yuria Nishimura", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Yuria Nishimura")!)
var developer7 = Person(name: "Roland Tecson", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Roland Tecson")!)
var developer8 = Person(name: "Adrian Van Der Est", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Adrian Van Der Est")!)

var designer1 = Person(name: "Vivien Anayian", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Vivien Anayian")!)
var designer2 = Person(name: "Kitty Chan", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Kitty Chan")!)
var designer3 = Person(name: "Crystal Chow", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Crystal Chow")!)
var designer4 = Person(name: "Kevin Choy", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Kevin Choy")!)
var designer5 = Person(name: "Ronald Ho", role: "Developer", info: "Game of Apps S2 Developer Mentor", image: UIImage(named: "Ronald Ho")!)
var designer6 = Person(name: "Sahar A.K", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Sahar A.K")!)
var designer7 = Person(name: "Justin Lim", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Justin Lim")!)
var designer8 = Person(name: "Janice Ng", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Janice Ng")!)
var designer9 = Person(name: "Nathan Ngai", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Nathan Ngai")!)
var designer10 = Person(name: "Tahra Priebjrivat", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Tahra Priebjrivat")!)
var designer11 = Person(name: "Mayra Pulido", role: "Designer", info: "Game of Apps S2 Design Mentor", image: UIImage(named: "Mayra Pulido")!)

var other1 = Person(name: "Taylor Macvittie", role: "Project Manager & HR", info: "Game of Apps S2 Project Manager & HR Mentor", image: UIImage(named: "Taylor Macvittie")!)


var developers: [Person] = [developer1, developer2, developer3, developer4, developer5, developer6, developer7, developer8]
var designers: [Person] = [designer1, designer2, designer3, designer4, designer5, designer6, designer7, designer8, designer9, designer10, designer11]
var other: [Person] = [other1]

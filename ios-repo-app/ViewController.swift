//
//  ViewController.swift
//  ios-repo-app
//
//  Created by Brian Bansenauer on 10/5/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var sid: UITextField!
    
    @IBOutlet weak var resultInfo: UILabel!
    
    let path = "http://216.186.69.45/services/device/users"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveToAPI(_ sender: Any) {
        //create a Repository object needed to invoke the API's create method
        let userRepo = Repository(withPath: path)
        
        let newUser = User()
        newUser.FirstName = firstName.text
        newUser.LastName = lastName.text
        newUser.PhoneNumber = phoneNumber.text
        newUser.SID = sid.text
        
        userRepo.create(a: newUser)  { (user) in
            if let id = user?.UserID, let first = user?.FirstName, let last = user?.LastName {
                self.resultInfo.text = "Successfully create user \(first) \(last) with id \(id)"
            }
        }
    }
    
}


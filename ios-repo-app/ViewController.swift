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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveToAPI(_ sender: Any) {
        
        let userRepo = Repository<Music>(withPath: "https://www.orangevalleycaa.org/api/music")
        
        let newMusic = Music()
        newMusic.id = 8
        newMusic.name = firstName.text
        newMusic.description = lastName.text
        
        userRepo.create(a: newMusic)  { (music) in
            if let id = music?.id, let name = music?.name, let desc = music?.description {
                self.resultInfo.text = "Successfully created music with id \(id) name \(name) and description \(desc)"
            }
        }
    }
    
}


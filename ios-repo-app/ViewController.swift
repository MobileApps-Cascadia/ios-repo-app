//
//  ViewController.swift
//  ios-repo-app
//
//  Created by Brian Bansenauer on 10/5/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var music_url: UITextField!
    @IBOutlet weak var descriptions: UITextField!
    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var resultInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveToAPI(_ sender: Any) {
        //TODO: create a Repository object needed to invoke the API's create method at //"https://www.orangevalleycaa.org/api/music/"
        let userRepo = Repository<Music>(withPath: "https://www.orangevalleycaa.org/api/music")
        
        let newMusic = Music()
        newMusic.name = name.text
        newMusic.music_url = music_url.text
        newMusic.description = descriptions.text
        newMusic.id = 8 //id.text
        
        userRepo.create(a: newMusic)
    }
}
    

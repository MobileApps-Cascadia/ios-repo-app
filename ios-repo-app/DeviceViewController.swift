//
//  DeviceViewController.swift
//  ios-repo-app
//
//  Created by Student Account on 10/7/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit



class DeviceViewController: UIViewController {

    @IBOutlet weak var deviceNum: UITextField!
    @IBOutlet weak var deviceType: UITextField!
    @IBOutlet weak var resultsInfo: UILabel!
    
    let devicePath = "http://216.186.69.45/services/device/devices"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveToAPI(_ sender: Any) {
        //create a Repository object needed to invoke the API's create method
        let deviceRepo = Repository<Device>(withPath: devicePath)
        
        let newDevice = Device()
        newDevice.DeviceNum = deviceNum.text
        newDevice.DeviceType = DeviceType.withLabel(deviceType.text!)
        
        deviceRepo.create(a: newDevice)  { device in
            if let id = device?.DeviceID, let num = device?.DeviceNum, let type = device?.DeviceType {
                self.resultsInfo.text = "Successfully saved device \(num) \(type) with id \(id)"
            }
        }
    }

}

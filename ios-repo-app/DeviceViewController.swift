//
//  DeviceViewController.swift
//  ios-repo-app
//
//  Created by Student Account on 10/7/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

class DeviceViewController: UIViewController {

   
    @IBOutlet weak var DeviceNum: UITextField!
    @IBOutlet weak var DeviceType: UITextField!
    
    @IBOutlet weak var resultInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func APISave(_ sender: Any) {
        let deviceRepo = Repository<Device>(withPath: "http://216.186.69.45/services/device/devices")
        
        let newDevice = Device()
        newDevice.DeviceNum = DeviceNum.text
        newDevice.DeviceType = DeviceType.text
        
        deviceRepo.create(a: newDevice)  { (device) in
            if let id = device?.DeviceID, let num = device?.DeviceNum, let type = device?.DeviceType {
                self.resultInfo.text = "Successfully create device \(num) \(type) with id \(id)"
            }
        }
    }    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

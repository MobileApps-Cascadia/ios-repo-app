//
//  DeviceViewController.swift
//  ios-repo-app
//
//  Created by juanita aguilar on 10/11/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

class DeviceViewController: UIViewController {
    
    
    
    @IBOutlet weak var deviceId: UITextField!
    
    @IBOutlet weak var deviceNum: UITextField!
    
    
    @IBOutlet weak var deviceType: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func SaveDevice(_ sender: Any) {
        
        let deviceRepo = DeviceRepository(withPath: "http://216.186.69.45/services/device/")
                  
                  let newDevice = Device()
                 newDevice.DeviceID = deviceId.text
                  newDevice.DeviceNum = deviceNum.text
                 newDevice.DeviceType = deviceType.text.map { (DeviceType(rawValue: $0) ?? DeviceType(rawValue: "No device Type")!) }
                  
                  
                  deviceRepo.create(a: newDevice)  { (device) in
                      if let id = device?.DeviceID, let num = device?.DeviceNum, let type = device?.DeviceType {
                       //  self.resultInfo.text = "Successfully create device \(num) \(type) with id \(id)"
                        
                        print("Successfully create device \(num) \(type) with id \(id)"
                        )
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

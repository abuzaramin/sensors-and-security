//
//  AccelerometerViewController.swift
//  SensorsAndSecurity
//
//  Created by Abuzar Amin on 05/05/2021.
//  Copyright © 2021 Abuzar Amin. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {

    var motionManager = CMMotionManager()
    
    @IBOutlet weak var xTF: UITextField!
    @IBOutlet weak var yTF: UITextField!
    @IBOutlet weak var zTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear (_ _animated : Bool) {
        motionManager.accelerometerUpdateInterval = 0.2
    
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            if let myData = data {
                self.xTF.text =  String(format: "X = %f", myData.acceleration.x)
                self.yTF.text = String(format: "Y = %f", myData.acceleration.y)
                self.zTF.text = String(format: "Z = %f", myData.acceleration.z)
            }
        }
    }
    

    

}

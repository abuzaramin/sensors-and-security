//
//  MagnetometerViewController.swift
//  SensorsAndSecurity
//
//  Created by Abuzar Amin on 05/05/2021.
//  Copyright © 2021 Abuzar Amin. All rights reserved.
//

import UIKit
import CoreMotion

class MagnetometerViewController: UIViewController {
    @IBOutlet weak var xTF: UITextField!
    @IBOutlet weak var yTF: UITextField!
    @IBOutlet weak var zTF: UITextField!
    var motionManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear (_ _animated : Bool) {
        motionManager.magnetometerUpdateInterval = 0.2
        motionManager.startMagnetometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            if let myData = data {
                self.xTF.text =  String(format: "X = %f", myData.magneticField.x)
                self.yTF.text = String(format: "Y = %f", myData.magneticField.y)
                self.zTF.text = String(format: "Z = %f", myData.magneticField.z)
            }
        }
    }
}

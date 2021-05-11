//
//  GyroViewController.swift
//  SensorsAndSecurity
//
//  Created by Abuzar Amin on 05/05/2021.
//  Copyright © 2021 Abuzar Amin. All rights reserved.
//

import UIKit
import CoreMotion

class GyroViewController: UIViewController {

    var motionManager = CMMotionManager()
    
    
    @IBOutlet weak var xTf: UITextField!

    @IBOutlet weak var yTf: UITextField!
    
    
    @IBOutlet weak var zTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear (_ _animated : Bool) {
        motionManager.gyroUpdateInterval = 0.2
        motionManager.startGyroUpdates(to: OperationQueue.current!) {
            (data, error) in
            if let myData = data {
                self.xTf.text =  String(format: "X = %f", myData.rotationRate.x)
                self.yTf.text = String(format: "Y = %f", myData.rotationRate.y)
                self.zTf.text = String(format: "Z = %f", myData.rotationRate.z)
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

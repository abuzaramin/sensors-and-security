//
//  FingerPrintViewController.swift
//  SensorsAndSecurity
//
//  Created by Abuzar Amin on 06/05/2021.
//  Copyright © 2021 Abuzar Amin. All rights reserved.
//

import UIKit
import LocalAuthentication

class FingerPrintViewController: UIViewController {

    var context = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            LAPolicy.deviceOwnerAuthenticationWithBiometrics
    }
    
        let reason = "Log in to your account"
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

            if success {

                // Move to the main thread because a state update triggers UI changes.
                DispatchQueue.main.async { [unowned self] in
                    
                  //  performSegue(withIdentifier: "showMainScreen", sender: nil)
                    
                    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                    let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MyNavigation") as! UINavigationController
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = redViewController
                }

            } else {
                print(error?.localizedDescription ?? "Failed to authenticate")

                // Fall back to a asking for username and password.
                // ...
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

//
//  ViewController.swift
//  SensorsAndSecurity
//
//  Created by Abuzar Amin on 05/05/2021.
//  Copyright © 2021 Abuzar Amin. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController , GADBannerViewDelegate {

   // @IBOutlet weak var gadBannerView: GADBannerView!
var gadBannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       gadBannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(gadBannerView)
        gadBannerView.adUnitID = "ca-app-pub-2254028467443583/9111564841"
        gadBannerView.rootViewController = self;
        gadBannerView.load(GADRequest())
        gadBannerView.delegate = self
    }

    func addBannerViewToView(_ bannerView: GADBannerView) {
        gadBannerView.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(gadBannerView)
       view.addConstraints(
         [NSLayoutConstraint(item: bannerView,
                             attribute: .bottom,
                             relatedBy: .equal,
                             toItem: bottomLayoutGuide ,
                             attribute: .top,
                             multiplier: 1,
                             constant: 0),
          NSLayoutConstraint(item: bannerView,
                             attribute: .centerX,
                             relatedBy: .equal,
                             toItem: view,
                             attribute: .centerX,
                             multiplier: 1,
                             constant: 0)
         ])
      }
    

    @IBAction func gyroTapped(_ sender: UIButton) {
        
      
    }
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }
    
}


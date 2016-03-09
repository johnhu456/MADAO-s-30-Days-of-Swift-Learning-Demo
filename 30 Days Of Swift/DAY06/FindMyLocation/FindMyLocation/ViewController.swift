//
//  ViewController.swift
//  FindMyLocation
//
//  Created by MADAO on 16/3/3.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var lblLocation: UILabel!
    
    //定位管理器
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocation.clipsToBounds = true
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func findButtonOnClicked(sender: AnyObject) {
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.startUpdatingLocation()
//        }
        locationManager.startUpdatingLocation()
    }
    
    //MARK: - LocationManagerDelegate
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placeMark, error) -> Void in
            if error != nil
            {
                self.lblLocation.text = "error" + error!.localizedDescription
                return
            }
            if placeMark?.count > 0 {
                let place = placeMark![0]
                print(place)
                self.disPlayLocation(place)
            }
            
        }
    }
    
    func disPlayLocation(place : CLPlacemark) {
        locationManager.stopUpdatingHeading()
//        let locality = (place.locality != nil) ? place.locality : ""
//        let postalCode = (place.postalCode != nil) ? place.postalCode : ""
//        let adm

        lblLocation.text = (place.name != nil) ? place.name : ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  FirstViewController.swift
//  myLocations
//
//  Created by ios on 14.08.2017.
//  Copyright © 2017 ismek. All rights reserved.
//

import UIKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var getButton: UIButton!
    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var updatingLocation = false
    var lastLocationError: Error?
    // Reverse G-Code islemleri
    var geoCode = CLGeocoder()
    var placeMark: CLPlacemark?
    var performReverseGeocoding = false
    var lastGeocodingError: Error?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tagButton_Action(_ sender: UIButton) {
        
    }
    
    @IBAction func getButton_Action(_ sender: UIButton) {
        //once izin isteyelim
        let authState = CLLocationManager.authorizationStatus()
        
        if authState == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        else if authState == .denied {
            showLocationServicesDeniedAlert()
            return
        }
        startLocationManager()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print( "didFailedWithError: \(error)")
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        
        lastLocationError = error
        stopLocationsManager()
        updateLabels()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let newLocation = locations.last!
        print( "didUpdateLocations: \(newLocation)")
        location = newLocation
        updateLabels()
        lastLocationError = nil
        
        if newLocation.timestamp.timeIntervalSinceNow < -5 {
            return
        }
        if newLocation.horizontalAccuracy < 0 {
            return
        }
        if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy {
            lastLocationError = nil
            location = newLocation
            updateLabels()
            
            if newLocation.horizontalAccuracy <= locationManager.desiredAccuracy {
                messageLabel.text = "We are done"
                stopLocationsManager()
                // configureGetButton()
            }
            // GeoCode reversing
            if !performReverseGeocoding{
                print("Going revers coding..")
                performReverseGeocoding = true
                
                geoCode.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) in
                    //print("Found adress: \(placemarks) Errors: \(error)")
                    self.lastGeocodingError = error
                    if error == nil, let p = placemarks, !p.isEmpty{
                        self.placeMark = p.last!
                    }else {
                        self.placeMark = nil
                    }
                })
                self.performReverseGeocoding = false
                self.updateLabels()
            }
            
        }
    
    }
    
    func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(title: "OK", message: "Location Service Disabled.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateLabels(){
        if let location = location {
            // var derece = Int(location.coordinate.latitude)
            latLabel.text = String(format: "%.8f", location.coordinate.latitude)
            longLabel.text = String(format: "%.8f", location.coordinate.longitude)
            tagButton.isEnabled = true
            messageLabel.text = ""
            
            //revers
            if let place=placeMark {
                adressLabel.text = place.administrativeArea //formatla burayı
            }
            else if performReverseGeocoding {
                adressLabel.text = "Searching address.."
            }
            else if lastGeocodingError != nil {
                adressLabel.text = "error: not found address"
            }
            else {
                adressLabel.text = "no adress found"
            }
            
        }
        else {
            latLabel.text = ""
            longLabel.text = ""
            adressLabel.text = "Get a new location!"
            tagButton.isEnabled = false
            messageLabel.text = ""
            
            var statusMessage = ""
            if let error = lastLocationError as? NSError {
                if error.domain == kCLErrorDomain && error.code == CLError.denied.rawValue {
                    statusMessage = "Location services has no permission"
                }
                else {
                    statusMessage = "Location Error, get my location again."
                }
            }
            else if !CLLocationManager.locationServicesEnabled() {
                statusMessage = "Location services disabled"
            }
            else if updatingLocation {
                statusMessage = "Searching..."
            }
            else {
                statusMessage = "Unknown location, tap the button to get again."
            }
            messageLabel.text = statusMessage
        }
    }
    
    func stopLocationsManager() {
        if updatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
        }
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }
    
    func configureGetButton(){
        if updatingLocation {
            getButton.setTitle("Stop", for: .normal)
        }
        else {
            getButton.setTitle("Get my Location", for: .normal)
        }
    }
    
}


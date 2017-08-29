//
//  FirstViewController.swift
//  Localbume
//
//  Created by coskun on 26.08.2017.
//  Copyright © 2017 coskun. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latDegreeLabel: UILabel!
    @IBOutlet weak var longDegreeLabel: UILabel!
    @IBOutlet weak var latMinuteLabel: UILabel!
    @IBOutlet weak var longMinuteLabel: UILabel!
    @IBOutlet weak var latSingLabel: UILabel!
    @IBOutlet weak var longSingLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var updatingLocation = false
    var lastLocationError: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // locationManager.delegate = self
        updateLabels()
        configureGetPositionButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError: \(error.description)")
        
        if error.code == CLError.LocationUnknown.rawValue {
            return
        }
        
        lastLocationError = error
        stopLocationManager()
        updateLabels()
        configureGetPositionButton()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last
        print("didUpdateLocations: \(newLocation)")
        
        //1
        if newLocation?.timestamp.timeIntervalSinceNow < -5 { return }
        //2
        if newLocation?.horizontalAccuracy < 0 { return }
        //3
        if location == nil ||
            location!.horizontalAccuracy > newLocation?.horizontalAccuracy {
            //4
            location = newLocation
            updateLabels()
            lastLocationError = nil
                
            if newLocation?.horizontalAccuracy <= locationManager.desiredAccuracy {
                print("*** We're done! ***")
                stopLocationManager()
                configureGetPositionButton()
            }
        }
        

    }

    @IBAction func getPosition_Action(sender: UIButton) {
        let authState = CLLocationManager.authorizationStatus()
        
        if authState == CLAuthorizationStatus.NotDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        else if authState == CLAuthorizationStatus.Denied || authState == CLAuthorizationStatus.Restricted {
            showLocationServicesDeniedAlert()
            return
        }
        
        if updatingLocation {
            stopLocationManager()
            configureGetPositionButton()
            messageLabel.text = "Stopped."
        } else {
            location = nil
            lastLocationError = nil
            
            startLocationManager()
            updateLabels()
            configureGetPositionButton()
        }
    }
    
    @IBAction func tagPosition_Action(sender: AnyObject) {
    }
    
    // MARK: - Helpers
    func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location services for this app in Settings.", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
        //present(alert, animated: true, completion: nil)
    }
    
    func updateLabels() {
        if let location = location {
            latitudeLabel.text = String(format: "%.8f",  location.coordinate.latitude)
            longitudeLabel.text = String(format: "%.8f",  location.coordinate.longitude)
            
            let latDeg = abs(Int(location.coordinate.latitude))
            let lonDeg = abs(Int(location.coordinate.longitude))
            let latMin = abs(Double(location.coordinate.latitude)) - Double(latDeg)
            let lonMin = abs(Double(location.coordinate.longitude)) - Double(lonDeg)
            
            latDegreeLabel.text = String(latDeg)
            longDegreeLabel.text = String(format: "%03d", lonDeg)
            latMinuteLabel.text = String(format: "%07.4f", latMin * 60)
            longMinuteLabel.text = String(format: "%07.4f", lonMin * 60)
            
            // Hata yoksa göstergeyi kullan
            if lastLocationError == nil {
                let frm = NSDateFormatter()
                frm.dateFormat = "yyyy-MM-dd - HH:mm:ss"
                messageLabel.text = "Updated on: \(frm.stringFromDate(location.timestamp))"
            }
        } else {
            latitudeLabel.text = "?? - ????"
            longitudeLabel.text = "?? - ????"
            
            latDegreeLabel.text = "00"
            longDegreeLabel.text = "00"
            latMinuteLabel.text = "00,0000"
            longMinuteLabel.text = "00,0000"
            addressLabel.text = "- ??? -"
            tagButton.enabled = false
            
            messageLabel.text = "Tap to 'Get My Position' first."
            // Error Handlers start here
            var responseMessage: String
            if let error = lastLocationError as NSError! {
                if error.domain == kCLErrorDomain && error.code == CLError.Denied.rawValue{
                    responseMessage = "No location service permission. Go to your settings to fix it."
                } else {
                    responseMessage = "Error getting location."
                }
            } else if !CLLocationManager.locationServicesEnabled() {
                responseMessage = "Location services disabled."
            } else if updatingLocation {
                responseMessage = "Searching..."
            } else {
                responseMessage = "Tap 'Get My Position' to start."
            }
            
            messageLabel.text = responseMessage
        }
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }
    
    func stopLocationManager(){
        if updatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
        }
    }
    
    func configureGetPositionButton() {
        if updatingLocation {
            getButton.setTitle("Stop", forState: UIControlState.Normal)
        } else {
            getButton.setTitle("Get My Position", forState: UIControlState.Normal)
        }
    }
    
    
}


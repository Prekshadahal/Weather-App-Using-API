//
//  ViewController.swift
//  RequestAPI
//
//  Created by Preksha Dahal on 31/08/2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var Temperature: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var UiImagebg: UIImageView!
 
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        assignBgImage()
        // Ask for Authorisation from the User.
                self.locationManager.requestAlwaysAuthorization()
                // For use in foreground
                self.locationManager.requestWhenInUseAuthorization()
                if CLLocationManager.locationServicesEnabled() {
                    locationManager.delegate = self
                    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                    locationManager.startUpdatingLocation()
                }
        
        func assignBgImage(){

            if (Temperature.text ?? "28" >= "20" && Temperature.text ?? "32" <= "30"){
                let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                backgroundImage.image = UIImage(named: "rainy")
                backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
                self.view.insertSubview(backgroundImage, at: 0)
            }
            else{
                let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                backgroundImage.image = UIImage(named: "clouds")
                backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
                self.view.insertSubview(backgroundImage, at: 0)
            }
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "thunder")
            backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage, at: 0)
        }
    }
    
    func apiCall(latitude: Double, longitude: Double){

        WeatherViewModel.shared.getWeather(lat: latitude, long: longitude) { response in
            
            print(response)
            
            self.cityName.text = response.name
            self.Temperature.text = "\((response.main?.temp ?? 0.0)/10)" //decimal maa convert garna
            self.country.text = response.weather?.first?.description ?? "" //array lai nikaaleko
            self.weatherType.text = response.sys?.country
           
        } fail: { error in
            print(error)
        }

        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        self.apiCall(latitude: locValue.latitude, longitude: locValue.longitude)
        }
}

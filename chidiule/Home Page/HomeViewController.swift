//
//  ViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/5.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import CoreLocation



class HomeViewController: UIViewController, AdPageViewControllerDelegate
, CategoryPageViewControllerDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var adPageControl: UIPageControl!
    @IBOutlet weak var categoryPageControl: UIPageControl!
    @IBOutlet weak var arrowDownIconImage: UIImageView!
    @IBOutlet weak var recommendationCollectionView: UICollectionView!
    

    
    @IBAction func search(_ sender: Any) {
        print("try to search")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier:"SearchViewController") as! SearchViewController
        vc.homeVC = self
        vc.modalTransitionStyle   = .crossDissolve;
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    let recommendationDatasource: RecommendationDatasource = RecommendationDatasource()
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var city: String?
    var country: String?
    var countryShortName: String?

    @IBAction func changeLocation(_ sender: Any) {
        print("try to change location")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        let templateImage = arrowDownIconImage.image?.withRenderingMode(.alwaysTemplate)
//        arrowDownIconImage.image = templateImage
//        arrowDownIconImage.tintColor = UIColor.black
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        

//        self.navigationController?.hidesBarsOnSwipe = true
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.barTintColor = .white
        
        recommendationCollectionView.dataSource = recommendationDatasource
        
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        if authStatus == .denied || authStatus == .restricted {
            // add any alert or inform the user to to enable location services
        }
        
        // here you can call the start location function
        startLocationManager()
        
    }
    
    
    func startLocationManager(){
        // always good habit to check if locationServicesEnabled
        if CLLocationManager.locationServicesEnabled() {

            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    func stopLocationManager(){
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil

    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
                        
//            let longitude = location.coordinate.longitude
//            let latitude = location.coordinate.latitude
            // Here is the place you want to start reverseGeocoding
            geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                // always good to check if no error
                // also we have to unwrap the placemark because it's optional
                // I have done all in a single if but you check them separately
                if error == nil, let placemark = placemarks, !placemark.isEmpty {
                    self.placemark = placemark.last
                }
                // a new function where you start to parse placemarks to get the information you need
                self.parsePlacemarks(location: location)
                if let city = self.city{
//                    self.currentCityLabel.text = city
                }
                
            })
        }
    }
    func parsePlacemarks(location: CLLocation?){
        // here we check if location manager is not nil using a _ wild card
        if let _ = location {
            // unwrap the placemark
            if let placemark = placemark {
                // wow now you can get the city name. remember that apple refers to city name as locality not city
                // again we have to unwrap the locality remember optionalllls also some times there is no text so we check that it should not be empty
                if let city = placemark.locality, !city.isEmpty {
                    // here you have the city name
                    // assign city name to our iVar
                    self.city = city
                }
                // the same story optionalllls also they are not empty
                if let country = placemark.country, !country.isEmpty {
                    
                    self.country = country
                }
                // get the country short name which is called isoCountryCode
                if let countryShortName = placemark.isoCountryCode, !countryShortName.isEmpty {
                    
                    self.countryShortName = countryShortName
                }
                
            }
            
            
        } else {
            // add some more check's if for some reason location manager is nil
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        stopLocationManager()

    }
    func setupAdPageController(numberOfPages: Int){
        adPageControl.numberOfPages = numberOfPages
    }
    func turnAdPageController(to index: Int){
        adPageControl.currentPage = index
    }
    func setupCategoryPageController(numberOfPages: Int){
        categoryPageControl.numberOfPages = numberOfPages
    }
    func turnCategoryPageController(to index: Int){
        categoryPageControl.currentPage = index
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdPageViewSegue" {
            let destinationVC = segue.destination as! AdPageViewController
            destinationVC.pageViewControllerDelegate = self
        }
        if segue.identifier == "CategoryPageViewSegue" {
            let destinationVC = segue.destination as! CategoryPageViewController
            destinationVC.pageViewControllerDelegate = self
        }
        
    }


}

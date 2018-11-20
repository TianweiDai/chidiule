//
//  AddressTableViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/13.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class AddressTableViewCell: UITableViewCell, CLLocationManagerDelegate {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var phoneLabel: UILabel!
    let manager = CLLocationManager()
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var phoneView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
        
        
    }
    
    func addAnnotation(location: CLLocation, name: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = name
        mapView.addAnnotation(annotation)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let annotation = mapView.annotations[0]
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: (location.coordinate.latitude + annotation.coordinate.latitude) / 2, longitude: (location.coordinate.longitude + annotation.coordinate.longitude) / 2)
        let region = MKCoordinateRegion(center: myLocation, span: span)
        
        mapView.setRegion(region, animated: true)
        
        mapView.showsUserLocation = true
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

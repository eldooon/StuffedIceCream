//
//  LocationController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/2/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import MapKit

class LocationController: UIViewController {
    
    let neighborhoodLabel: UILabel = {
        let label = UILabel()
        label.text = "EAST VILLAGE"
        label.font = UIFont.primaryBold
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "139 1ST AVENUE, NEW YORK, NY 10003"
        label.font = UIFont.primaryLight
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        let location = CLLocationCoordinate2D(latitude: 40.7280466, longitude: -73.98536439999998)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        map.centerCoordinate = location
        map.setRegion(MKCoordinateRegion.init(center: location, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)), animated: true)
        map.addAnnotation(annotation)
        return map
    }()

    let hoursLabel: UILabel = {
        let label = UILabel()
        label.text = "HOURS"
        label.font = UIFont.primary
        return label
    }()
    
    let monThursLabel: UILabel = {
        let label = UILabel()
        label.text = "MONDAY - THURSDAY"
        label.font = UIFont.primary
        return label
    }()
    
    let monThursTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2:00PM - 10:30PM"
        label.font = UIFont.primaryLight
        return label
    }()
    
    let friSatLabel: UILabel = {
        let label = UILabel()
        label.text = "FRIDAY - SATURDAY"
        label.font = UIFont.primary
        return label
    }()
    
    let friSatTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2:00PM - 11:30PM"
        label.font = UIFont.primaryLight
        return label
    }()
    
    let sunLabel: UILabel = {
        let label = UILabel()
        label.text = "SUNDAY"
        label.font = UIFont.primary
        return label
    }()
    
    let sunTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "1:00PM - 10:30PM"
        label.font = UIFont.primaryLight
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "LOCATION"
        view.backgroundColor = .white
        createLayout()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(addressTapped ))
        addressLabel.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createLayout() {
        
        view.addSubview(neighborhoodLabel)
        neighborhoodLabel.anchor(centerX: view.centerXAnchor, centerY: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(addressLabel)
        addressLabel.anchor(centerX: neighborhoodLabel.centerXAnchor, centerY: nil, top: neighborhoodLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(mapView)
        mapView.anchor(centerX: nil, centerY: nil, top: addressLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 300)
        
        view.addSubview(hoursLabel)
        hoursLabel.anchor(centerX: neighborhoodLabel.centerXAnchor, centerY: nil, top: mapView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(monThursLabel)
        monThursLabel.anchor(centerX: neighborhoodLabel.centerXAnchor, centerY: nil, top: hoursLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(monThursTimeLabel)
        monThursTimeLabel.anchor(centerX: neighborhoodLabel.centerXAnchor, centerY: nil, top: monThursLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(friSatLabel)
        friSatLabel.anchor(centerX: neighborhoodLabel.centerXAnchor, centerY: nil, top: monThursTimeLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(friSatTimeLabel)
        friSatTimeLabel.anchor(centerX: neighborhoodLabel.centerXAnchor, centerY: nil, top: friSatLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        view.addSubview(sunLabel)
        sunLabel.anchor(centerX: neighborhoodLabel.centerXAnchor, centerY: nil, top: friSatTimeLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        view.addSubview(sunTimeLabel)
        sunTimeLabel.anchor(centerX: neighborhoodLabel.centerXAnchor, centerY: nil, top: sunLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc func addressTapped(sender:UITapGestureRecognizer) {
        
        let latitude: CLLocationDegrees = 40.7280466
        let longitude: CLLocationDegrees = -73.98536439999998
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Stuffed Icecream"
        mapItem.openInMaps(launchOptions: options)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

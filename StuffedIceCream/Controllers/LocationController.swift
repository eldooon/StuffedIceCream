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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        createLayout()
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
        mapView.anchor(centerX: nil, centerY: nil, top: addressLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 300)
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

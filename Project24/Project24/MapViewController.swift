//
//  MapViewController.swift
//  Project24
//
//  Created by Alex Motor on 9/30/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeLabel: UILabel!
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        return manager
    }()
    private let geocoder = CLGeocoder()
    private var searchController: UISearchController!
    private let resultController = ResultViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
        
        configureSearch()
    }
    
    private func configureSearch() {
        let controller = UISearchController(searchResultsController: resultController)
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = true
        controller.searchBar.placeholder = "Enter place name"
        navigationItem.searchController = controller
        definesPresentationContext = true
        self.searchController = controller
        
        resultController.didSelectPlace = { [weak self] place in
            controller.isActive = false
            
            guard let coordinate = place.location?.coordinate else { return }
            
            if let annots = self?.mapView.annotations {
                self?.mapView.removeAnnotations(annots)
            }
            
            let pin = PinAnnotation(title: place.name ?? "N/A", coordinate: coordinate)
            self?.mapView.addAnnotation(pin)
            
            self?.move(to: place)
        }
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .satellite
        case 2: mapView.mapType = .hybrid
        default:
            fatalError()
        }
    }
    
    func move(to place: CLPlacemark) {
        guard let coordinate = place.location?.coordinate else { return }
        
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        mapView.setRegion(MKCoordinateRegion(center: coordinate, span: span), animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let view = MKAnnotationView(annotation: annotation, reuseIdentifier: "id")
        mapView.dequeueReusableAnnotationView(withIdentifier: "id")
        view.centerOffset = CGPoint(x: 0, y: -16)
        view.image = UIImage(named: "pin")
        return view
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        geocoder.reverseGeocodeLocation(location) { [weak self] (places, error) in
            if let place = places?.first {
                self?.placeLabel.text = place.formatAddress()
            } else {
                self?.placeLabel.text = "Error: \(error!)"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension MapViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text!

        geocoder.cancelGeocode()
        geocoder.geocodeAddressString(text) { [weak self] places, error in
            if let places = places {
                self?.resultController.places = places
            } else {
                self?.resultController.places = []
            }
        }
    }
}

extension CLPlacemark {
    func formatAddress() -> String {
        return [
            name,
            thoroughfare,
            subThoroughfare,
            locality,
            isoCountryCode
        ].compactMap { $0 }.joined(separator: ", ")
    }
}

class PinAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
    }
}

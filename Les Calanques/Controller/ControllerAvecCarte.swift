//
//  ControllerAvecCarte.swift
//  Les Calanques
//
//  Created by Clément Doche on 6/24/19.
//  Copyright © 2019 La Tropicom. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var calanques: [Calanque] = CalanqueCollection().all()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addAnnotations()

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "reuseId"
        
        //verifier que ce ne soit pas la position de l'utilisateur
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        
        if let anno = annotation as? MonAnnotation{
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
                annotationView?.image = UIImage(named: "placeholder")
                annotationView?.canShowCallout = true
                return annotationView
            } else {
                return annotationView
            }
        }
        return nil
    }
    
    func addAnnotations() {
        
        for calanque in calanques {
            
            
            //Annotation de base
            //let annotation = MKPointAnnotation()
            //annotation.coordinate = calanque.coordonnee
            //annotation.title = calanque.nom
            //mapView.addAnnotation(annotation)
            
            //Annotation Custom
            let annotation = MonAnnotation(calanque)
            mapView.addAnnotation(annotation)
        }
        
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0: mapView.mapType = MKMapType.standard
        case 1: mapView.mapType = .satellite
        case 2: mapView.mapType = .hybrid
        default: break
        }
        
    }
    
    
    @IBAction func getPosition(_ sender: Any) {
    }

}

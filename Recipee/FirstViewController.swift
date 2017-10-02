//
//  FirstViewController.swift
//  Recipee
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    //Map
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var featureRecipeView: UIScrollView!
    var publixArray = [UIImage]()
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.20,0.20)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation,span)
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        publixArray = [#imageLiteral(resourceName: "publix"), #imageLiteral(resourceName: "publix2"), #imageLiteral(resourceName: "publix3"), #imageLiteral(resourceName: "publix4"), #imageLiteral(resourceName: "publix5")]
        
        for i in 0..<publixArray.count{
            let imageView = UIImageView()
            imageView.image = publixArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y:0, width: self.featureRecipeView.frame.width, height: self.featureRecipeView.frame.height)
            
            featureRecipeView.contentSize.width = featureRecipeView.frame.width * CGFloat(i + 1)
            featureRecipeView.addSubview(imageView)
            
            
        }
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        //Annotations
        //Publix Town Center
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
        let publixTownCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.264374, -81.526688)
        let publixTownCenterRegion:MKCoordinateRegion = MKCoordinateRegionMake(publixTownCenter, span)
        map.setRegion(publixTownCenterRegion, animated: true)
        
        let publixTownCenterAnnotation = MKPointAnnotation()
        publixTownCenterAnnotation.coordinate = publixTownCenter
        publixTownCenterAnnotation.title = "Publix Town Center"
        map.addAnnotation(publixTownCenterAnnotation)
        
        //Costco Town Center
        let costcoTownCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.252058, -81.534193)
        let costcoTownCenterRegion:MKCoordinateRegion = MKCoordinateRegionMake(costcoTownCenter, span)
        map.setRegion(costcoTownCenterRegion, animated: true)
        
        let costcoTownCenterAnnotation = MKPointAnnotation()
        costcoTownCenterAnnotation.coordinate = costcoTownCenter
        costcoTownCenterAnnotation.title = "Costco Town Center"
        map.addAnnotation(costcoTownCenterAnnotation)
        
        //Aldi's Town Center
        let aldisTownCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.265054, -81.528750)
        let aldisTownCenterRegion:MKCoordinateRegion = MKCoordinateRegionMake(aldisTownCenter, span)
        map.setRegion(aldisTownCenterRegion, animated: true)
        
        let aldisTownCenterAnnotation = MKPointAnnotation()
        aldisTownCenterAnnotation.coordinate = aldisTownCenter
        aldisTownCenterAnnotation.title = "Aldi's Town Center"
        map.addAnnotation(aldisTownCenterAnnotation)
        
        //Walmart Beach Blvd.
        let walmartBeachBlvd: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.283723, -81.562701)
        let walmartBeachBlvdRegion:MKCoordinateRegion = MKCoordinateRegionMake(walmartBeachBlvd, span)
        map.setRegion(walmartBeachBlvdRegion, animated: true)
        
        let walmartBeachBlvdAnnotation = MKPointAnnotation()
        walmartBeachBlvdAnnotation.coordinate = walmartBeachBlvd
        walmartBeachBlvdAnnotation.title = "Walmart Beach Blvd."
        map.addAnnotation(walmartBeachBlvdAnnotation)
        
        //Sam's Club
        let samsClubBeachBlvd: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.284418, -81.539917)
        let samsClubBeachBlvdRegion:MKCoordinateRegion = MKCoordinateRegionMake(samsClubBeachBlvd, span)
        map.setRegion(samsClubBeachBlvdRegion, animated: true)
        
        let samsClubBeachBlvdAnnotation = MKPointAnnotation()
        samsClubBeachBlvdAnnotation.coordinate = samsClubBeachBlvd
        samsClubBeachBlvdAnnotation.title = "Sam's Club Beach Blvd."
        map.addAnnotation(samsClubBeachBlvdAnnotation)
        
        //Publix Baymeadows 295
        let publix295: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.214146, -81.518136)
        let publix295Region:MKCoordinateRegion = MKCoordinateRegionMake(publix295, span)
        map.setRegion(publix295Region, animated: true)
        
        let publix295Annotation = MKPointAnnotation()
        publix295Annotation.coordinate = publix295
        publix295Annotation.title = "Publix - Reedy Branch"
        map.addAnnotation(publix295Annotation)
        
        //Publix Baymeadows SS
        let publixBayMeadows: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.219082, -81.553184)
        let publixBayMeadowsRegion:MKCoordinateRegion = MKCoordinateRegionMake(publixBayMeadows, span)
        map.setRegion(publixBayMeadowsRegion, animated: true)
        
        let publixBayMeadowsAnnotation = MKPointAnnotation()
        publixBayMeadowsAnnotation.coordinate = publixBayMeadows
        publixBayMeadowsAnnotation.title = "Publix Deerwood Village"
        map.addAnnotation(publixBayMeadowsAnnotation)
        
        //BJ's Atlantic
        let bjAtlantic: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.317680, -81.486932)
        let bjAtlanticRegion:MKCoordinateRegion = MKCoordinateRegionMake(bjAtlantic, span)
        map.setRegion(bjAtlanticRegion, animated: true)
        
        let bjAtlanticAnnotation = MKPointAnnotation()
        bjAtlanticAnnotation.coordinate = bjAtlantic
        bjAtlanticAnnotation.title = "BJs Atlantic Blvd"
        map.addAnnotation(bjAtlanticAnnotation)
        
        //Walmart Atlantic
        let walmartAtlantic: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.219082, -81.553184)
        let walmartAtlanticRegion:MKCoordinateRegion = MKCoordinateRegionMake(walmartAtlantic, span)
        map.setRegion(walmartAtlanticRegion, animated: true)
        
        let walmartAtlanticAnnotation = MKPointAnnotation()
        walmartAtlanticAnnotation.coordinate = publixBayMeadows
        walmartAtlanticAnnotation.title = "Walmart Atlantic Blvd"
        map.addAnnotation(walmartAtlanticAnnotation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


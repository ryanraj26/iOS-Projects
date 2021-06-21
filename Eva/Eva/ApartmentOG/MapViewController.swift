//
//  MapViewController.swift
//  Eva
//
//  Created by LMNTrix on 4/29/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet weak var myMap: MKMapView!
    
    var apartment = ApartmentModel(name: "H", number: "")

    @IBAction func searchBtn(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            
           // activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil
            {
                print("ERROR")
            }
            else
            {
                //Remove annotations
                let annotations = self.myMap.annotations
                self.myMap.removeAnnotations(annotations)
                
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Create annotation
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.myMap.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span1 = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span1)
//                let span = MKCoordinateSpanMake(0.1, 0.1)
//                let region = MKCoordinateRegionMake(coordinate, span)
                self.myMap.setRegion(region, animated: true)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        // Do any additional setup after loading the view.
    }
    
    func initMap(){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = ApartmentData.currentApartment.name
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            
           // activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil
            {
                print("ERROR")
            }
            else
            {
                //Remove annotations
                let annotations = self.myMap.annotations
                self.myMap.removeAnnotations(annotations)
                
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Create annotation
                let annotation = MKPointAnnotation()
                annotation.title = "Our Home"
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.myMap.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span1 = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span1)
//                let span = MKCoordinateSpanMake(0.1, 0.1)
//                let region = MKCoordinateRegionMake(coordinate, span)
                self.myMap.setRegion(region, animated: true)
            }
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initMap()
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func getter(apartment: ApartmentModel){
        self.apartment = apartment
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

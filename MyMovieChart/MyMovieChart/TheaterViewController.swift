//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by LEE on 2023/02/05.
//

import UIKit
import MapKit
class TheaterViewController: UIViewController {

    @IBOutlet var map: MKMapView!
    
    var param: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = param["상영관명"] as? String
        // Do any additional setup after loading the view.
        
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        let regionRadius: CLLocationDistance = 100
        
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        map.setRegion(coordinateRegion, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        self.map.addAnnotation(point)
        
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

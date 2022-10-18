//
//  MapViewController.swift
//  ios-test-sda
//
//  Created by Tenti Atika Putri on 17/10/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapViewMK: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        showMapView()

    }

    func showMapView() {

        let locations = dummyDataModel

        let initialLocation = CLLocation(latitude: 47.09139684143848, longitude: -122.40709304809572)
        mapViewMK.centerToLocation(initialLocation)

        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = "\(location.id)"

            let loc = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)

            annotation.coordinate = loc
            mapViewMK.addAnnotation(annotation)

        }
    }

    @IBAction func showListView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listViewController = storyBoard.instantiateViewController(withIdentifier: "UsersID") as? UsersScreenViewController
        listViewController?.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(listViewController!, animated: true)
    }

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 10000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

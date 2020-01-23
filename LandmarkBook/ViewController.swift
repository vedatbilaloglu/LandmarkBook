//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Vedat Bilaloğlu on 23.01.2020.
//  Copyright © 2020 Vedat Bilaloglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

     var landmarkNames = [String]()
     var landmarkImage = [UIImage]()
     var landmarkDescription = [String]()
    
     var chosenLandmarkNames = ""
     var chosenLandmarkImage = UIImage()
     var chosenLandmarkDescription = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Add landmark names to array
        landmarkNames.append("Antalya")
        landmarkNames.append("Big Island")
        landmarkNames.append("Dolma Bahce Palace")
        landmarkNames.append("Galata Tower")
        landmarkNames.append("Cappadocia")
        
        // Add landmark image to array
        landmarkImage.append(UIImage(named: "antalya.jpg")!)
        landmarkImage.append(UIImage(named: "buyukada.jpg")!)
        landmarkImage.append(UIImage(named: "dolmabahce.jpg")!)
        landmarkImage.append(UIImage(named: "galatakulesi.jpg")!)
        landmarkImage.append(UIImage(named: "kapadokya.jpg")!)
        
        // Add landmark description to array
        landmarkDescription.append("Antalya (Turkish pronunciation: [anˈtalja]) is the fifth-most populous city in Turkey and the capital of Antalya Province. Located on Anatolia's southwest coast bordered by the Taurus Mountains, Antalya is the largest Turkish city on the Mediterranean coast with over one million people in its metropolitan area.")
        landmarkDescription.append("Büyükada (Greek: Πρίγκηπος or Πρίγκιπος, rendered Prinkipos or Prinkipo) is the largest of the nine so-called Princes' Islands in the Sea of Marmara, near Istanbul, with an area of about 2 square miles (5 square kilometres). It is officially a neighbourhood in the Adalar (Islands) district of Istanbul Province, Turkey.")
        landmarkDescription.append("Dolmabahçe Palace (Turkish: Dolmabahçe Sarayı, IPA: [doɫmabahˈtʃe saɾaˈjɯ]) located in the Beşiktaş district of Istanbul, Turkey, on the European coast of the Strait of Istanbul, served as the main administrative center of the Ottoman Empire from 1856 to 1887 and from 1909 to 1922 (Yıldız Palace was used in the interim period).")
        landmarkDescription.append("The Galata Tower (Galata Kulesi in Turkish) — called Christea Turris (the Tower of Christ in Latin) by the Genoese — is a medieval stone tower in the Galata/Karaköy quarter of Istanbul, Turkey, just to the north of the Golden Horn's junction with the Bosphorus. It is a high, cone-capped cylinder that dominates the skyline and offers a panoramic vista of Istanbul's historic peninsula and its environs.")
        landmarkDescription.append("Cappadocia (/kæpəˈdoʊʃə/; also Capadocia; Greek: Καππαδοκία, Kappadokía, from Old Persian: Katpatuka, Armenian: Կապադովկիա, Kapadovkia, Turkish: Kapadokya) is a historical region in Central Anatolia, largely in the Nevşehir, Kayseri, Kırşehir, Aksaray, and Niğde Provinces in Turkey.")
        
        navigationItem.title = "Landmark Book"
        
    }
    
    // Delete Row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImage.remove(at: indexPath.row)
            landmarkDescription.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        
    }

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkNames = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImage[indexPath.row]
        chosenLandmarkDescription = landmarkDescription[indexPath.row]
        
        performSegue(withIdentifier: "toimageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toimageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkNames = chosenLandmarkNames
            destinationVC.selectedlandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkDescription = chosenLandmarkDescription
            
        }
    }
    
}




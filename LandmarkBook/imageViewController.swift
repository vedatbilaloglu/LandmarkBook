//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Vedat Bilaloğlu on 23.01.2020.
//  Copyright © 2020 Vedat Bilaloglu. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    
    @IBOutlet weak var textView: UITextView!
    var selectedLandmarkNames = ""
    var selectedlandmarkImage = UIImage()
    var selectedLandmarkDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        landmarkLabel.text = selectedLandmarkNames
        imageView.image = selectedlandmarkImage
        textView.text = selectedLandmarkDescription
        
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

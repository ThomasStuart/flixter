//
//  ViewSingleMovie.swift
//  flixter
//
//  Created by Thomas James Stuart on 2/18/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import UIKit
import Foundation
import AlamofireImage


class ViewSingleMovie: UIViewController {

    var imageURLDEST    = "imageURLDEST not set according to ViewSingleMovie"
    var titleDEST       = "titleDEST not set according to ViewSingleMovie"
    var descriptionDEST = "descriptionDEST not set according to ViewSingleMovie"
   
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let posterUrl  = URL(string: selectedImage)
    
        imageOutlet.af_setImage(withURL: posterUrl!)
        titleOutlet.text       = selectedTitle
        descriptionOutlet.text = selectedSynopsis
        
        // Do any additional setup after loading the view.
    }
    
    

}

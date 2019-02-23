//
//  MoviesDetailsViewController.swift
//  flixter
//
//  Created by Thomas James Stuart on 2/19/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

//  stopped at 7:40 on - Movie Details Screen

import UIKit

class MoviesDetailsViewController: UIViewController {

    var movie: [String:Any]!
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //For the poster image
        var baseUrl    = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl  = URL(string: baseUrl + posterPath)
        posterView.af_setImage(withURL: posterUrl!)
        
        //Filling the text labels
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        //For the back-drop image
        baseUrl           = "https://image.tmdb.org/t/p/w780"
        let backdropPath  = movie["backdrop_path"] as! String
        let backposterURL = URL(string: baseUrl + backdropPath)
        backdropView.af_setImage(withURL: backposterURL!)
        
    }
    
}

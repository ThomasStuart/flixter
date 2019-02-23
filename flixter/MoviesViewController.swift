//
//  MoviesViewController.swift
//  flixter
//
//  Created by Thomas James Stuart on 2/12/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage


class MoviesViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String:Any]]()


    override func viewDidLoad() {
        
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.tableView.reloadData()
            
            }
        }
        task.resume()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("The API has -> " + "\(movies.count)" + " <- movies in the data package")
        return movies.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
         let movie = movies[indexPath.row]
         let titleSet    = movie["title"] as! String
         let synopsisSet = movie["overview"] as! String
        
        cell.titleLabel!.text   = titleSet
        cell.synopsisLabel.text = synopsisSet
        
        
         let baseUrl    = "https://image.tmdb.org/t/p/w185"
         let posterPath = movie["poster_path"] as! String
         let posterUrl  = URL(string: baseUrl + posterPath)
        
        cell.posterView.af_setImage(withURL: posterUrl!)
        

        return cell
        
    }
    

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any? ){
        // Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for:cell)!
        
        let movie = movies[indexPath.row]
        
        
        let detailsViewController = segue.destination as! MoviesDetailsViewController
        detailsViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    

}

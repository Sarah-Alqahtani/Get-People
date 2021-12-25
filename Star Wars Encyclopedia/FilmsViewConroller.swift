//
//  FilmsViewConroller.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 25/12/2021.
//

import UIKit

class FilmsViewConroller: UITableViewController {
    var Film:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://swapi.dev/api/films/?format=json")
               
               URLSession.shared.dataTask(with: url!, completionHandler: {
                   data, response, error in
                   do{
                       let response = try JSONDecoder().decode(decodeFilms.self, from: data!)
                       for film in response.results{
                           
                        self.Film.append(film.title)
                      
                       }
                       
                       DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
                   }catch{
                       print(error)
        
                   }
            
               
               })
            .resume()
                    }
                
                
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return Film.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = Film[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
}

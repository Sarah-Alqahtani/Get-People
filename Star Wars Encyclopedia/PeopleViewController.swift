

import UIKit
class PeopleViewController: UITableViewController {
    // Hardcoded data for now
    var people:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
             let url = URL(string: "https://swapi.dev/api/people/?format=json")
             let session = URLSession.shared
             let task = session.dataTask(with: url!, completionHandler: {
                 // see: Swift closure expression syntax
                 data, response, error in

                 do {
                    
                     if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                         if let result=jsonResult["results"] as? NSArray{
                             for object in result{
                                 if let jsonObject=object as? NSDictionary{
                                     self.people.append(jsonObject["name"] as! String)
                                 }
                             }
                         }
                         
                     }
                     DispatchQueue.main.async {
                         self.tableView.reloadData()
                     }
                     
                 } catch {
                     print(error)
                 }
             })
            
             task.resume()
                    }
                
                
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
}



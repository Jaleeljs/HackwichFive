//
//  ViewController.swift
//  HackwichFive
//
//  Created by CM Student on 2/26/18.
//  Copyright © 2018 CM Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //define an array variable using an array literal with 5 items of type string
 
    @IBOutlet weak var tableView: UITableView!
    var colorarray = ["Kapolei Kalapawai"]
    
    
    var restaurantImageData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        
//set VC as Delegate
//self.tableView.datasource = self
        
        
        let path = Bundle.main.path( forResource: "Property List", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        
        restaurantImageData = dict!.object(forKey:"restaurantImages") as! [String]
  
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return colorarray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //set up cell to display items in colorarray
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let text = colorarray[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if segue.identifier == "mySeague"
            {
                let s1 = segue.destination as! detailedViewController
                let imageIndex = tableView.indexPathForSelectedRow?.row
                s1.imagePass = restaurantImageData[imageIndex!]
            }
        }
        
    }
    


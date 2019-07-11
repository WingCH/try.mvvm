//
//  ViewController.swift
//  try.mvvm
//
//  Created by CHAN Hong Wing on 11/7/2019.
//  Copyright © 2019 CHAN Hong Wing. All rights reserved.
//

import UIKit

// MARK: - View Controller

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // #1 - The UITableViewDataSource and
        // UITableViewDelegate protocols are
        // adopted in extensions.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailSegue" {
            
            if let destinationViewController = segue.destination as? DetailViewController
            {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let index = indexPath.row
                // #2 - The ViewModel is the app's de facto data source.
                // The ViewModel data for the currently-selected table
                // view cell representing a Messier object is passed to
                // a detail view controller via a segue.
                destinationViewController.messierViewModel = messierViewModel[index]
            }
        }
        
    } // end func prepare
    
} // end class ViewController

// MARK: - UITableView Delegate

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UITableView Data Source

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messierViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        // #1 - The ViewModel is the app's de facto data source.
        tableViewCell?.imageView?.image = UIImage(named: messierViewModel[indexPath.row].thumbnail)
        tableViewCell?.textLabel?.text = messierViewModel[indexPath.row].formalName
        tableViewCell?.detailTextLabel?.text = messierViewModel[indexPath.row].commonName
        
        return tableViewCell!
    }
    
} // end extension ViewController : UITableViewDataSource

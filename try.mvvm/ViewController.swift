//
//  ViewController.swift
//  try.mvvm
//
//  Created by CHAN Hong Wing on 11/7/2019.
//  Copyright © 2019 CHAN Hong Wing. All rights reserved.
// https://www.appcoda.com.tw/mvvm-vs-mvc/

import UIKit

// #1 - WHY ARE ALL THESE PROTOCOLS ADOPTED HERE?
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // #2 - WHY IS THE MODEL IN THE VIEW CONTROLLER?
    let dataSource = ["one", "two", "three"]
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    @IBOutlet weak var tableView: UITableView!
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Help", style: .plain, target: self, action: #selector(myRightSideBarButtonItemTapped(_:)))
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // #3 - OK, ALL THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #4 - IF YOU WANT MAINTAINABLE HELP, PUT
    // THIS IN A SEPARATE FILE
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!) {
        print("Right navbar button item tapped.")
    }
    
    // #5 - OK, THIS SHOULD GO IN A
    // UIViewController SUBCLASS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            
            if let destinationViewController = segue.destination as? DetailViewController
            {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let index = indexPath.row
                destinationViewController.data = dataSource[index]
            }
        }
        
    }
    
    // #6 - WHY IS THIS IN A UIViewController SUBCLASS?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // #6 - WHY IS THIS IN A UIViewController SUBCLASS?
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // #6 - WHY IS THIS IN A UIViewController SUBCLASS?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // #6 - WHY IS THIS IN A UIViewController SUBCLASS?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        tableViewCell?.textLabel?.text = dataSource[indexPath.row]
        tableViewCell?.detailTextLabel?.text = dataSource[indexPath.row] + " subtitle"
        
        return tableViewCell!
        
    }
    
} // end class ViewController


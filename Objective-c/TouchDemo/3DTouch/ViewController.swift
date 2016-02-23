//
//  ViewController.swift
//  3DTouch
//
//  Created by cysu on 16/2/22.
//  Copyright © 2016年 TouchDemo. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var cellTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lists"
        
        self.navigationController?.navigationBar.translucent = false
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        cellTitles = ["Red", "Yellow", "Blue"]
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")! as UITableViewCell
        cell.textLabel?.text = cellTitles[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let detailController = DetailViewController()
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


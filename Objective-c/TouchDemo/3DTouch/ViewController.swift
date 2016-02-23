//
//  ViewController.swift
//  3DTouch
//
//  Created by cysu on 16/2/22.
//  Copyright © 2016年 TouchDemo. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {

    @IBOutlet weak var tableView: UITableView!
    var cellTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lists"
        
        self.navigationController?.navigationBar.translucent = false
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        cellTitles = ["Red", "Yellow", "Blue"]
        self.registerForPreviewingWithDelegate(self, sourceView: tableView)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "shortcutItemDidTouch:", name: "shortcutItemTouched", object: nil)
    }

    @objc func shortcutItemDidTouch(notification : NSNotification) {
        let controllerTitle = notification.object as! String
        self.navigationController?.popViewControllerAnimated(true)
        
        let detailController = DetailViewController(titleText: controllerTitle)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
// MARK: UIViewControllerPreviewingDelegate
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let indexPath = tableView.indexPathForRowAtPoint(location)
        let cell = tableView.cellForRowAtIndexPath(indexPath!)
        previewingContext.sourceRect = (cell?.frame)!
        
        let controllerTitle = cellTitles[(indexPath?.row)!]
        let detailController = DetailViewController(titleText: controllerTitle)
        
        let titleView = UILabel(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 35))
        titleView.text = controllerTitle
        titleView.textAlignment = .Center
        titleView.backgroundColor = UIColor.whiteColor()
        titleView.tag = 1444
        
        detailController.view.addSubview(titleView)
        
        return detailController
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        for lable in viewControllerToCommit.view.subviews {
            if lable.tag == 1444 {
                lable.removeFromSuperview()
            }
        }
        
        self.showViewController(viewControllerToCommit, sender: nil)
    }
    
// MARK: tableView Method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")! as UITableViewCell
        cell.textLabel?.text = cellTitles[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let detailTitle = cellTitles[indexPath.row]
        let detailController = DetailViewController(titleText: detailTitle)
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


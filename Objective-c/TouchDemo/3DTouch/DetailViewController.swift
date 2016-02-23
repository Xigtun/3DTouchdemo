//
//  DetailViewController.swift
//  TouchDemo
//
//  Created by cysu on 16/2/22.
//  Copyright © 2016年 TouchDemo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    convenience init (titleText : String) {
        self.init()
        title = titleText
        
        if titleText == "Red" {
            view.backgroundColor = UIColor.redColor()
        } else if titleText == "Yellow" {
            view.backgroundColor = UIColor.yellowColor()
        } else if titleText == "Blue" {
            view.backgroundColor = UIColor.blueColor()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        let actionOne = UIPreviewAction(title: "Action One", style: .Default) { (_, _) -> Void in
            
        }
        let actionTwo = UIPreviewAction(title: "Action Two", style: .Selected) { (_, _) -> Void in
            
        }
        let actionThree = UIPreviewAction(title: "Action Three", style: .Destructive) { (_, _) -> Void in
            
        }
        let items = [actionOne, actionTwo, actionThree]
        return items
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

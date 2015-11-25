//
//  ViewController.swift
//  kameraApp
//
//  Created by kosuge satoshi on 2015/11/18.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit
import AssetsLibrary
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.tintColor = UIColor.redColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "投稿", style: UIBarButtonItemStyle.Plain, target: self, action: "submitView")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func submitView(){
        performSegueWithIdentifier("submit", sender: nil)
    }
    
}


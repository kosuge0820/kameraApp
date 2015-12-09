//
//  ViewController.swift
//  kameraApp
//
//  Created by kosuge satoshi on 2015/11/18.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit
import AssetsLibrary

final class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageStock = ImageStock.sharedInstance

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        

    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.tintColor = UIColor.redColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "投稿", style: UIBarButtonItemStyle.Plain, target: self, action: "submitView")
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func submitView(){
        performSegueWithIdentifier("submit", sender: nil)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageStock.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        
        let collectionImage = UIImageView()
        collectionImage.frame = CGRect(x: 0 , y: 0 , width: 140, height: 140 )
        let images = imageStock.images
        collectionImage.image = images[indexPath.item]
        cell.addSubview(collectionImage)

        return cell
    }
}



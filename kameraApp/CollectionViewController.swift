//
//  ViewController.swift
//  kameraApp
//
//  Created by kosuge satoshi on 2015/11/18.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit

final class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageStock = ImageStock.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.tintColor = UIColor.redColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "投稿", style: .Plain, target: self, action: "transitToPostViewController")
        collectionView.reloadData()
    }
    
    func transitToPostViewController(){
        performSegueWithIdentifier("submit", sender: nil)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageStock.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        
        let collectionImage = UIImageView()
        collectionImage.frame.origin = CGPointZero
        collectionImage.frame.size = CGSize(width: 187, height: 187)
        let images = imageStock.images
        collectionImage.image = images[indexPath.item]
        cell.addSubview(collectionImage)
        return cell
    }
}



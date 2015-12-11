//
//  SubmitViewController.swift
//  kameraApp
//
//  Created by kosuge satoshi on 2015/11/18.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit
import AssetsLibrary

final class SubmitViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var photoImage: UIImageView!
    
    var imageStock = ImageStock.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.setTitle("save", forState: .Normal)
        saveButton.center = self.view.center
        saveButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        saveButton.setTitleColor(UIColor.blackColor(), forState: .Selected)
        saveButton.addTarget(self, action: "saveButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(saveButton)
        
        selectButton.setTitle("select", forState: .Normal)
        selectButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        selectButton.setTitleColor(UIColor.blackColor(), forState: .Selected)
        selectButton.addTarget(self, action: "selectButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(selectButton)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.tintColor = UIColor.redColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "toBackViewController")
    }
    
    func saveButton(sender:UIButton) {
        if photoImage.image == nil{
        
            let alertView = UIAlertController(title: "アラート" , message:"imageが選択されていません" , preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: {
                (action: UIAlertAction!) -> Void in
            })
            
            alertView.addAction(alertAction)
            self.presentViewController(alertView, animated: true, completion: nil)
        } else {
        imageStock.images.append(photoImage.image!)
        print(imageStock.images)
        dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func selectButton(sender:UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .PhotoLibrary
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
        photoImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func toBackViewController(){
       dismissViewControllerAnimated(true, completion: nil)
    }
    
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
//---------------------------------------カメラロールの全ての写真を取得------------------------------------------
//    import Photos
    
    
//    var photoAssent = [PHAsset]()
//
//    enum PHAssetMediaType : Int {
//        case Unknown
//        case Image
//        case Video
//        case Audio
//    }
    
//    private func Allphoto(){
//        photoAssent = []
//        //ソート条件を指定
//        let options = PHFetchOptions()
//        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//        
//        //画像を全て取得
//        let assets: PHFetchResult = PHAsset.fetchAssetsWithMediaType(.Image, options: nil)
//                                          //fetchAssetsWithMediaTypeで欲しいメディアの種類を指定し、リクエストする
//        assets.enumerateObjectsUsingBlock { (asset, index, stop) -> Void in
//        
//        let manager: PHImageManager = PHImageManager()
//        manager.requestImageForAsset(asset as! PHAsset,
//            targetSize: CGSizeMake(70, 70),
//            contentMode: .AspectFit,
//            options: nil) { (image, info) -> Void in
//                
//            self.photoImage.image = image  //UIImageViewに画像を表示する
//            }
//        self.photoAssent.append(asset as! PHAsset)
//        }
//        print(photoAssent)
//    }
//----------------------------------------------------------------------------------------------------------



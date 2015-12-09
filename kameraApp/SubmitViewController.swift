//
//  SubmitViewController.swift
//  kameraApp
//
//  Created by kosuge satoshi on 2015/11/18.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit
import AssetsLibrary

class SubmitViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var takePictureButton: UIButton!
 
  
    
    var imageStock = ImageStock.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.setTitle("save", forState: UIControlState.Normal)
        saveButton.addTarget(self, action: "saveButton:", forControlEvents: UIControlEvents.TouchUpInside)
        saveButton.center = self.view.center
        self.view.addSubview(saveButton)
        
        selectButton.setTitle("select", forState: UIControlState.Normal)
        selectButton.addTarget(self, action: "selectButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(selectButton)
        
        takePictureButton.addTarget(self, action: "takePictureButton:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.tintColor = UIColor.redColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "toBackViewController")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func saveButton(sender:UIButton){
        if photoImage.image == nil{
        
            let alertView = UIAlertController(title: "アラート" , message:"imageが選択されていません" , preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
                (action:UIAlertAction!) -> Void in
            })
            
            alertView.addAction(alertAction)
            self.presentViewController(alertView, animated: true, completion: nil)
            
            
        } else {
        imageStock.images.append(photoImage.image!)
        print(imageStock.images)
        dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    func selectButton(sender:UIButton){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            self.presentViewController(imagePickerController, animated: true, completion: nil)

//            UIImagePickerController　カメラ画像や写真アルバムを表示するクラス
//            UIImagePickerControllerSourceType.PhotoLibrary　写真アルバムから取得す
//            UIImagePickerControllerSourceType.Camera        カメラで撮影して取得する
//            UIImagePickerControllerSourceType.SavedPhotosAlbum　写真アルバム内のカメラロールから取得する

        }
    }
    
    func takePictureButton(sender:UIButton){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
        let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
        
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        photoImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectLabel.text = "画像を保存"
        self.dismissViewControllerAnimated(true, completion: nil)

//          infoの中には取得した画像のデータや色々データが格納されている。辞書型
//          UIImagePickerControllerOriginalImage   オリジナルの画像を取得する
//          UIImagePickerControllerCropRect        ユーザーが大きさを変更した後の画像を取得する
//          UIImagePickerControllerMediaMetadata　　撮影時刻や撮影場所などのメタデータを取得する
//　　       dismissViewControllerAnimated(true, completion: nil)モーダルビューコントロラーを非表示にするメソッド　引数のcompletionには非表示になった後の処理をおこなう
//            UIImageWriteToSavedPhotosAlbum(photoImage,nil, nil, nil)画像を写真アルバムに保存する関数一つ目はUIimage画像を指定する。２〜４はその後の処理

    }
    
    func toBackViewController(){
       dismissViewControllerAnimated(true, completion: nil)
    }
    
}

    
    
    
    
    
    
    
    
    
    
    
    
    




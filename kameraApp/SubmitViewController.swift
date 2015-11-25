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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.setTitle("save", forState: UIControlState.Normal)
        saveButton.addTarget(self, action: "saveButton:", forControlEvents: UIControlEvents.TouchUpInside)
        saveButton.center = self.view.center
        saveButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        saveButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
        self.view.addSubview(saveButton)
        
        selectButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        selectButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
        selectButton.setTitle("select", forState: UIControlState.Normal)
        selectButton.addTarget(self, action: "selectButton:", forControlEvents: UIControlEvents.TouchUpInside)
//        selectButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//      selectButton.frame = CGRectZero ---CGRectMake(0, 0, 0, 0)と同じ
//      位置を決めるときはCGRectを使うのが社内規則
        self.view.addSubview(selectButton)
        
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.tintColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func saveButton(sender:UIButton){
    print("ボタンをtableViewに保存しました")
    }
    
    func selectButton(sender:UIButton){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(imagePickerController, animated: true, completion: nil)
//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//            UIImagePickerController　カメラ画像や写真アルバムを表示するクラス
//            UIImagePickerControllerSourceType.PhotoLibrary　写真アルバムから取得す
//            UIImagePickerControllerSourceType.Camera        カメラで撮影して取得する
//            UIImagePickerControllerSourceType.SavedPhotosAlbum　写真アルバム内のカメラロールから取得する
//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
        }
        
    print("カメラロールにアクセスできました")
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
        photoImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//          infoの中には取得した画像のデータや色々データが格納されている。辞書型
//          UIImagePickerControllerOriginalImage   オリジナルの画像を取得する
//          UIImagePickerControllerCropRect        ユーザーが大きさを変更した後の画像を取得する
//          UIImagePickerControllerMediaMetadata　　撮影時刻や撮影場所などのメタデータを取得する
//　　       dismissViewControllerAnimated(true, completion: nil)モーダルビューコントロラーを非表示にするメソッド　引数のcompletionには非表示になった後の処理をおこなう
//            UIImageWriteToSavedPhotosAlbum(photoImage,nil, nil, nil)画像を写真アルバムに保存する関数一つ目はUIimage画像を指定する。２〜４はその後の処理
//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
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



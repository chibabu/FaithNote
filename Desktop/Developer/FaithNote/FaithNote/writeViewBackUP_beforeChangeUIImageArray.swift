////
////  writeView.swift
////  FaithNote
////
////  Created by 차종훈 on 2017. 5. 7..
////  Copyright © 2017년 Carus. All rights reserved.
////
//
//import UIKit
//import Photos
////import RealmSwift
//
//
//
//
//
//class writeView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    
//    
//    //MARK : - Variable start
//    
//    //            let realm = Realm(path: "/Users/carus/Desktop/TestRealm.realm")
//    
//    //    let fileURL = FileManager.default
//    //        .containerURL(forSecurityApplicationGroupIdentifier: "group.io.realm.examples.extension")!
//    //        .appendingPathComponent("Library/Caches/default.realm")
//    //
//    //        func setDefaultRealmForUser(username: String) {
//    //            var config = Realm.Configuration()
//    //
//    //            // Use the default directory, but replace the filename with the username
//    //            config.fileURL = config.fileURL!.deletingLastPathComponent()
//    //                .appendingPathComponent("\(username).realm")
//    //
//    //            // Set this as the configuration used for the default Realm
//    //            Realm.Configuration.defaultConfiguration = config
//    //        }
//    
//    // imageInWriteView
//    //    @IBOutlet weak var imageInWriteView: UIImageView!
//    
//    
//    @IBOutlet weak var writeCollection: UICollectionView!
//    
//    
//    @IBAction func Down(_ sender: UIBarButtonItem) {
//        self.writeTextView.resignFirstResponder()
//        
//        
//    }
//    
//    @IBOutlet var toolBarView: UIToolbar!
//    
//    @IBOutlet weak var writeTextView: UITextView!
//    
//    // 메모 삭제 시작
//    
//    @IBAction func toolBarDelete(_ sender: UIBarButtonItem) {
//        
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        
//        let arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
//        
//        
//        if memoNumber != -1 {
//            
//            
//            // 텍스트 부분
//            mMemoDataValue.remove(at: memoNumber)
//            mMemoDataDic[arraySelect] = mMemoDataValue
//            UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)_Faith")
//            // 텍스트 부분 끝
//            
//            
//            
//            // 이미지 로컬 부분
//            localFileDelete (directory: directoryNameList)
//            
//            // 이미지 로컬 부분 끝
//            
//            
//            // 이미지 변수 부분
//            directoryNameList.remove(at: memoNumber)
//            UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
//            
//            mMemoImageDic.remove(at: memoNumber)
//            UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
//            // 이미지 변수 부분 끝
//            
//            
//            
//            
//            
//            print("directoryNameList :", directoryNameList)
//            print("directoryNameListTemp :", directoryNameListTemp)
//            print("mMemoImageDic :" ,mMemoImageDic)
//            print("mMemoDataValue :", mMemoDataValue)
//            print("memoNumber :",memoNumber)
//            
//            
//            self.performSegue(withIdentifier: "goToViewUI", sender: self)
//            
//        } else {
//            if directoryNameListTemp != [] { // 이미지 추가를 해줬을 경우 로컬 파일을 지우고 변수에 저장되 값도 모두 지워준다
//                
//                localFileDelete (directory: directoryNameListTemp)
//                
//                directoryNameListTemp.removeAll()
//                self.performSegue(withIdentifier: "goToViewUI", sender: self)
//                
//            } else { // 이미지를 추가해주지 않았으면 아무것도 해줄 필요 없이 그냥 화면만 넘기면 됨
//                self.performSegue(withIdentifier: "goToViewUI", sender: self)
//                
//            }
//        }
//    }
//    
//    
//    
//    
//    // 메모 삭제 끝
//    
//    
//    func localFileDelete (directory : [String]) {
//        let fileManager = FileManager.default
//        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
//        let documentsPath = documentsUrl.path
//        
//        do {
//            //                if let documentPath = documentsPath
//            //                {
//            //                    let fileNames = try fileManager.contentsOfDirectory(atPath: "\(documentsPath!)/\(directoryNameList[memoNumber])_Faith")
//            //                    print("all files in cache: \(fileNames)")
//            //                    for fileName in fileNames {
//            
//            
//            //                        if (fileName.hasSuffix(".jpg"))
//            //                        {
//            let filePathName = "\(documentsPath!)/\(directory[memoNumber])_Faith"
//            try fileManager.removeItem(atPath: filePathName)
//            //                            print("filePathName :", filePathName)
//            //                        }
//            //                    }
//            
//            //                    let files = try fileManager.contentsOfDirectory(atPath: "\(directoryNameList[memoNumber])_Faith")
//            _ = try fileManager.contentsOfDirectory(atPath: "\(directory[memoNumber])_Faith")
//            
//            //                    print("all files in cache after deleting images: \(files)")
//            //                    print("documentPath :", documentPath)
//            
//        }
//            
//            //            }
//        catch {
//            print("Could not clear temp folder: \(error)")
//        }
//        
//        
//    }
//    
//    
//    
//    @IBAction func toolBarImage(_ sender: UIBarButtonItem) {
//        
//        
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
//        imagePicker.sourceType = .photoLibrary
//        
//        
//        present(imagePicker, animated: true, completion: nil)
//        
//        
//    }
//    
//    
//    @IBAction func toolBarTakePic(_ sender: UIBarButtonItem) {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .camera
//        present(imagePicker, animated: true, completion: nil)
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    //    var attrStr = String()
//    let imagePicker = UIImagePickerController()
//    
//    //        var imageList = [String]()
//    
//    
//    func generateHashString() -> String {
//        let currentHash = Date().hashValue.description
//        
//        return currentHash
//    }
//    
//    
//    // Variable end
//    
//    
//    
//    func randomString(length: Int) -> String {
//        
//        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        let len = UInt32(letters.length)
//        
//        var randomString = ""
//        
//        for _ in 0 ..< length {
//            let rand = arc4random_uniform(len)
//            var nextChar = letters.character(at: Int(rand))
//            randomString += NSString(characters: &nextChar, length: 1) as String
//        }
//        
//        return randomString
//    }
//    
//    
//    
//    
//    
//    
//    func imageSaveToLocal (_ imageUrl: URL?, _ image: UIImage) {
//        
//        
//        //            var assets = PHAsset.fetchAssets(withALAssetURLs: [imageUrl!], options: nil)
//        
//        //            if let fileAsset = assets.firstObject {
//        
//        //                imagesList.append(p)
//        //                print(imagesList)
//        //                let fileName = (fileAsset.creationDate?.description)!
//        
//        do {
//            //                    imageFileName = randomString(length: 4)
//            //                    print("directoryname :",directoryName)
//            //                    UserDefaults.standard.set(directoryNameList, forKey: "directoryNameList")
//            
//            imageFileName = generateHashString()
//            
//            let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            
//            
//            if memoNumber == -1 { // 새글 입력일 때,
//                //                        directoryNameListTemp.insert(imageFileName, at: 0)
//                //                        let dataPath = documentsURL.appendingPathComponent("\(directoryNameListTemp[directoryNameListTemp.endIndex-1])_Faith")
//                
//                directoryNameListTemp.append(imageFileName)
//                let dataPath = documentsURL.appendingPathComponent("\(directoryNameListTemp[0])_Faith")
//                let fileURL = dataPath.appendingPathComponent("\(imageFileName)_Faith.jpg")
//                //                        print("directoryNameListTemp :",directoryNameListTemp)
//                //                        print("directoryName :", directoryName)
//                if let pngImageData = UIImagePNGRepresentation(image) {
//                    try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
//                    try pngImageData.write(to: fileURL, options: .atomic)
//                    
//                } else {}
//                
//            } else { // 입력된 글을 수정할 때
//                //                        let dataPath = documentsURL.appendingPathComponent("\(memoNumber)_Faith")
//                //                        let fileURL = dataPath.appendingPathComponent("\(fileName)_\(memoNumber)_Faith.jpg")
//                directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as! [String]
//                
//                if (directoryNameList[memoNumber] == ""){ // 입력된 글을 수정 하는데, 해당 글에 이미지가 없었을 때
//                    
//                    //                            directoryNameListTemp.insert(imageFileName, at: 0)
//                    //                            let dataPath = documentsURL.appendingPathComponent("\(directoryNameListTemp[directoryNameListTemp.endIndex-1])_Faith")
//                    
//                    directoryNameListTemp.append(imageFileName)
//                    let dataPath = documentsURL.appendingPathComponent("\(directoryNameListTemp[0])_Faith")
//                    let fileURL = dataPath.appendingPathComponent("\(imageFileName)_Faith.jpg")
//                    
//                    if let pngImageData = UIImagePNGRepresentation(image) {
//                        try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
//                        try pngImageData.write(to: fileURL, options: .atomic)
//                    }
//                    
//                } else { // 입력된 글을 수정 하는데, 해당 글에 이미지가 있었을 때
//                    
//                    mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as! [[String]]
//                    
//                    
//                    directoryNameListTemp.append(imageFileName)
//                    //                            directoryNameList += directoryNameListTemp
//                    
//                    
//                    let dataPath = documentsURL.appendingPathComponent("\(directoryNameList[memoNumber])_Faith")
//                    let fileURL = dataPath.appendingPathComponent("\(imageFileName)_Faith.jpg")
//                    
//                    if let pngImageData = UIImagePNGRepresentation(image) {
//                        try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
//                        try pngImageData.write(to: fileURL, options: .atomic)
//                        
//                        
//                    }
//                    
//                }
//                
//                
//            }
//            //                    mMemoImageValue.append(fileName)
//            
//            
//        } catch { }
//        
//        var frame = self.writeTextView.frame
//        frame.size.height = 390
//        self.writeTextView.frame = frame
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    //    var imagesList = [PHAsset]()
//    let arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
//    
//    
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
//        
//        dismiss(animated: true)
//        
//        // get the selected image as a UIImage object
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        let imageUrl = info[UIImagePickerControllerReferenceURL] as? URL
//        
//        imageSaveToLocal(imageUrl, image)
//        print("image :", image)
//        
//        
//        
//        
//        writeCollection.reloadData()
//        
//        
//        
//        
//        //imageInWriteView
//        //        imageInWriteView.image = image
//        
//        // save a PHAsset reference in imagesList array for later use
//        //        let imageUrl = info[UIImagePickerControllerReferenceURL] as? URL
//        //
//        //            let assets = PHAsset.fetchAssets(withALAssetURLs: [imageUrl!], options: nil)
//        //
//        //            if let fileAsset = assets.firstObject {
//        //
//        ////                imagesList.append(p)
//        ////                print(imagesList)
//        //                let fileName = (fileAsset.creationDate?.description)!
//        //
//        //                do {
//        //                    let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        //                    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        //                    let dataPath = documentsURL.appendingPathComponent("\(memoNumber)_Faith")
//        //                    let fileURL = dataPath.appendingPathComponent("\(fileName)_\(memoNumber)_Faith.jpg")
//        //                    mMemoImageValue.append(fileName)
//        //
//        //                    if let pngImageData = UIImagePNGRepresentation(image) {
//        //                        try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
//        //                        try pngImageData.write(to: fileURL, options: .atomic)
//        //
//        //                    }
//        //                } catch { }
//        //
//        //                var frame = self.writeTextView.frame
//        //                frame.size.height = 390
//        //                self.writeTextView.frame = frame
//        //        }
//        
//        
//        
//        //                print("imageURL: ", imageUrl)
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    func getAssetFullsize(asset: PHAsset) -> UIImage {
//        let manager = PHImageManager.default()
//        let option = PHImageRequestOptions()
//        var img = UIImage()
//        option.isSynchronous = true
//        let w = asset.pixelWidth
//        let h = asset.pixelHeight
//        manager.requestImage(for: asset, targetSize: CGSize(width: w, height: h), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
//            img = result!
//        })
//        return img
//    }
//    
//    func getAssetThumbnail(asset: PHAsset) -> UIImage {
//        let manager = PHImageManager.default()
//        let option = PHImageRequestOptions()
//        var thumbnail = UIImage()
//        option.isSynchronous = true
//        let w = 100
//        let h = 100
//        manager.requestImage(for: asset, targetSize: CGSize(width: w, height: h), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
//            thumbnail = result!
//        })
//        return thumbnail
//    }
//    
//    
//    
//    
//    
//    
//    //    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo editinginfo: [String : Any])
//    //    { if let pickedImage = editinginfo[UIImagePickerControllerOriginalImage] as? UIImage {
//    //        let imageUrl          = editinginfo[UIImagePickerControllerReferenceURL] as! URL
//    //        let imageName         = imageUrl.lastPathComponent
//    //        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//    //        let photoURL          = NSURL(fileURLWithPath: documentDirectory)
//    //
//    //
//    //
//    //        let asset = PHAsset.fetchAssets(withALAssetURLs: [imageUrl], options: nil).firstObject!
//    ////        let fileName = asset.creationDate?.description
//    //        let fileName = Date().description
//    ////        let stringUrl = imageUrl.relativeString
//    //
//    //
//    //        let localPath         = photoURL.appendingPathComponent("ASD/\(fileName).jpg")
//    //        let imageFileName     = "\(fileName).jpg"
//    //        let image             = editinginfo[UIImagePickerControllerOriginalImage] as! UIImage
//    //        let data              = UIImagePNGRepresentation(image)
//    ////        let dataImage = data?.base64EncodedString(options: .lineLength64Characters)
//    //
//    //
//    //
//    //
//    //
//    //
//    //
//    //
//    //        print(imageFileName)
//    //
//    //        UserDefaults.standard.set(imageFileName, forKey: "imageFileName")
//    //
//    //
//    ////        UserDefaults.standard.register(defaults: ["\(attrStr)": stringUrl])
//    ////        UserDefaults.standard.set(stringUrl, forKey: "imageData")
//    //
//    //
//    //
//    //
//    //
//    //
//    //
//    //
//    //        print("imageUrl: ", imageUrl)
//    //        print("imageName: ", imageName)
//    //        print("documentDirectory: ", documentDirectory)
//    //        print("image: ", image)
//    //        print("imageUrl: ", imageUrl)
//    //        print("photoURL: ", photoURL)
//    //        print("localPath: ", localPath)
//    //
//    //
//    //
//    //
//    ////        do {
//    ////            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    //////            let fileURL = documentsURL.appendingPathComponent("\(fileName).png")
//    //////            let pngImageData = UIImagePNGRepresentation(image)
//    ////                try data?.write(to: fileURL, options: .atomic)
//    ////
//    ////                print("filePath: ", documentsURL)
//    ////
//    ////
//    ////            print("filePath: ", documentsURL)
//    //
//    ////        } catch { }
//    //
//    //        do
//    //        {
//    //            try data?.write(to: localPath!, options: Data.WritingOptions.atomic)
//    //        }
//    //        catch
//    //        {
//    //            // Catch exception here and act accordingly
//    //        }
//    //
//    //        self.dismiss(animated: true, completion: nil)
//    //        }
//    //    }
//    
//    
//    
//    
//    
//    
//    
//    func textViewDidBeginEditing(_ textView: UITextView)
//    {
//        var frame = self.writeTextView.frame
//        frame.size.height = 280.5
//        self.writeTextView.frame = frame
//    }
//    
//    
//    //imageInWriteView
//    //    public func textViewDidEndEditing(_ textView: UITextView)
//    //    {
//    //        if imageInWriteView.image != nil {
//    //            var frame = self.writeTextView.frame
//    //            frame.size.height = 390
//    //            self.writeTextView.frame = frame
//    //        } else {
//    //        var frame = self.writeTextView.frame
//    //        frame.size.height = 510
//    //        self.writeTextView.frame = frame
//    //        }
//    //    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    override func viewDidAppear(_ animated: Bool) {
//        
//        
//        
//        
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        if memoNumber == -1 {
//            self.writeTextView.becomeFirstResponder()//텍스트필드에 포커스
//            
//            
//        }
//    }
//    
//    
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.writeTextView.resignFirstResponder()
//        
//    }
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        
//        
//        directoryName = randomString(length: 4)
//        
//        
//        //        directoryName = generateHashString()
//        
//        writeTextView.inputAccessoryView = toolBarView
//        
//        writeTextView.delegate = self
//        
//        
//        
//        
//        let arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
//        
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        
//        let arraySelectNumber = UserDefaults.standard.object(forKey: "arraySelectNumber") as! Int
//        
//        
//        
//        print("memoNumber :", memoNumber)
//        print("selectNumber :", arraySelectNumber)
//        
//        // 새 메모 작성(-1)할 때와 수정할 때 텍스트 입력 화면 Start
//        
//        if memoNumber == -1 { // 새 메모
//            
//            // 텍스트 부분
//            mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as? [String] ?? [String]()
//            writeTextView.text = ""
//            
//            // 텍스트 부분 끝
//            
//            
//            
//            // 이미지 부분
//            mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
//            directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]() // 디렉토리 배열 불러오기
//            
//            // 이미지 부분 끝
//            
//            print("directoryNameList :", directoryNameList)
//            
//            
//            
//            //            mMemoImageValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith2") as? [String] ?? [String]()
//            //            directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]()
//            
//            //            mMemoImageDirectory = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith3") as? [[String]] ?? [[String]]()
//            
//            // 여기
//            //            mMemoDataValue2 = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith2") as? [String : [String]] ?? [String : [Any]]()
//            
//            
//            
//            
//            
//            
//            
//        } else { // 메모 수정
//            
//            // 텍스트 부분
//            mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as! [String]
//            writeTextView.text = mMemoDataValue[memoNumber] as! String
//            // 텍스트 부분 끝
//            
//            
//            
//            // 이미지 부분
//            mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
//            directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]() // 디렉토리 배열 불러오기
//            // 이미지 부분 끝
//            
//            //            mMemoImageValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith2") as? [String] ?? [String]()
//            //            mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith2") as! [String : [String]]
//            //            mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith2") as! [[String]]
//            //            mMemoImageDirectory = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith3") as! [[String]]
//            //            print("old memo nameList :", directoryNameList)
//            //
//            //            print("DataV :", mMemoDataValue)
//            //            print("ImageV :", mMemoImageValue)
//            //            print("ImageD :", mMemoImageDic)
//            
//            //            mMemoDataValue2 = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith2") as? [String : [String]] ?? [String : [Any]]()
//            
//            
//            // 여기
//            
//            //            mMemoImageValue = mMemoDataValue2[(mMemoDataValue[memoNumber] as! String)]! as! [String]
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            //            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            //            if mMemoImageDic[memoNumber] != [] {
//            //                mMemoImageValue = mMemoImageDic[memoNumber]
//            //
//            //                for i in 0...mMemoImageValue.endIndex {
//            
//            //                let filePath = documentsURL.appendingPathComponent("\(memoNumber)\(mMemoImageValue[indexPath.row])_\([indexPath.row])_Faith.jpg").path
//            
//            //            imageInWriteView.image = UIImage(contentsOfFile: filePath)
//            
//            
//            //                print("filepath :",filePath)
//            // 몇개 보여줄거야
//            //                func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            //                    print("dddd:",mMemoImageValue.count)
//            //
//            //                    return mMemoImageValue.count
//            //                }
//            //
//            //                // 뭐 보여줄거야
//            //                func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            //
//            //                    let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! writeCell
//            //
//            //                    let filePath = documentsURL.appendingPathComponent("\(memoNumber)/\(mMemoImageValue[indexPath.row])_\(indexPath.row)_Faith.jpg").path
//            //
//            //                    //                    let TitleImageName = mMemoImageValue[indexPath.row]
//            //                    //                    let TitleImage = UIImage(named: TitleImageName)
//            //                    let TitleImage = UIImage(contentsOfFile: filePath)
//            //
//            //                    imageCell.writeImageView.image = TitleImage
//            //                    //            imageCell.TitleLabel.text = Data[indexPath.row]["TitleLabel"]
//            //                    print("dddddwwww:",TitleImage)
//            //
//            //                    return imageCell
//            //                }
//            //
//            //                // 클릭하면 어떻게 돼
//            //                func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            //
//            //                    //            self.performSegue(withIdentifier: "ToDashBoard", sender: self)
//            //
//            //                    print("writeCell")
//            //                }
//            
//            
//            
//            
//            
//            
//            
//            
//            //            }
//            
//            //            imagesList = UserDefaults.standard.object(forKey: "imagesList") as? [PHAsset] ?? [PHAsset]()
//            
//            //            func changeImage(_ sender: Any) {
//            //                if imagesList.count > 0 {
//            //
//            //                    // get the full-size image from PHAsset
//            ////                    imageInWriteView.image = getAssetFullsize(asset: imagesList[indexList])
//            //
//            //                    // or, just get a thumbnail-sized image
//            //                    imageInWriteView.image = getAssetThumbnail(asset: imagesList[0])
//            //
//            ////                    indexList = (indexList + 1) % imagesList.count
//            //
//            //                    print("asset :",imageInWriteView.image)
//            
//            //            func loadImage (imageInWirteView) {
//            //                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            //                let filePath = documentsURL.appendingPathComponent("*_\(arraySelect).jpg").path
//            //                if FileManager.default.fileExists(atPath: filePath){
//            //                    return UIImage(contentsOfFile: filePath)
//            //                }
//            //            }
//            
//            //            let fileName = UserDefaults.standard.object(forKey: "temp") as! [String]
//            
//            
//            //                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            //            if mMemoImageValue != [] {
//            //                let filePath = documentsURL.appendingPathComponent("\(arraySelect)_Faith/\(mMemoImageValue[memoNumber])_\(arraySelect)_Faith.jpg").path
//            //
//            //            print("filepath :",filePath)
//            //            print("asd : ", UIImage(contentsOfFile: filePath)!)
//            
//            //                if FileManager.default.fileExists(atPath: filePath){
//            
//            //                    imageInWriteView.image = UIImage(contentsOfFile: filePath)
//            //            }
//            //                }
//            //imageInWriteView
//            //            if imageInWriteView.image != nil {
//            //                var frame = self.writeTextView.frame
//            //                frame.size.height = 390
//            //                self.writeTextView.frame = frame
//            //            }
//            
//        }
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    func basicAlert (_ messages : String){ // 글을 입력 안했으면 경고창
//        let alertView = UIAlertController(title: "Error", message: messages, preferredStyle: UIAlertControllerStyle.alert)
//        // alertview에 확인버튼 삽입
//        alertView.addAction(UIAlertAction(title: "return", style: UIAlertActionStyle.default, handler: nil))
//        
//        // 현재 viewcontroller에 추가하기
//        self.present(alertView, animated: true, completion: nil)
//    }
//    
//    
//    
//    // 입력 저장 버튼 Start
//    
//    @IBAction func writeSave(_ sender: UIButton) {
//        
//        let arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
//        
//        
//        
//        
//        //        let imagesListSave = UserDefaults.standard.object(forKey: "imagesList") as? [String] ?? [String]()
//        //        let fileName = UserDefaults.standard.object(forKey: "temp") as? [String] ?? [String]()
//        
//        
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        //
//        //            if writeTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//        //            let alertView = UIAlertController(title: "Error", message: "No Contents", preferredStyle: UIAlertControllerStyle.alert)
//        //                            // alertview에 확인버튼 삽입
//        //            alertView.addAction(UIAlertAction(title: "return", style: UIAlertActionStyle.default, handler: nil))
//        //
//        //            // 현재 viewcontroller에 추가하기
//        //            self.present(alertView, animated: true, completion: nil)
//        //
//        //
//        //            }
//        
//        if writeTextView.text == "" {
//            if writeTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//                basicAlert("No Contents")
//            }
//            
//        } else {
//            
//            if memoNumber == -1 { //새글 추가하는 경우
//                
//                // 글 부분
//                mMemoDataValue.insert(writeTextView.text, at: 0)
//                UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)_Faith")
//                // 글 부분 끝
//                
//                
//                // 이미지 파일 부분
//                if directoryNameListTemp != [] { // 이미지를 넣었을 때
//                    directoryNameList.insert(directoryNameListTemp[0] , at: 0) // 이미지 디렉토리 이름 저장
//                    UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
//                    
//                    mMemoImageDic.insert(directoryNameListTemp, at: 0) // 이미지 파일 이름 저장
//                    UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
//                    
//                } else { // 이미지를 넣지 않았을 때
//                    directoryNameList.insert("", at: 0)  // 이미지 디렉토리 이름 널값 저장(인덱스 맞춰주기 위해)
//                    UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
//                    
//                    mMemoImageDic.insert(directoryNameListTemp, at: 0) // 이미지 파일 이름 널값 저장(인덱스 맞춰주기 위해)
//                    UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
//                    
//                }
//                
//                // 이미지 파일 부분 끝
//                
//                
//                
//                //                directoryDic.updateValue(directoryNameList, forKey: "\(directoryName)")
//                //                UserDefaults.standard.set(directoryDic, forKey: "\(arraySelect)_\(directoryName)")
//                
//                //                print("directoryDic :", directoryDic)
//                print("directoryNameList :", directoryNameList)
//                print("directoryNameListTemp :", directoryNameListTemp)
//                print("mMemoImageDic :" ,mMemoImageDic)
//                print("mMemoDataValue :", mMemoDataValue)
//                
//                
//                
//            } else { // 글 수정 하는 경우
//                
//                
//                // 텍스트 부분
//                mMemoDataValue.remove(at: memoNumber)
//                mMemoDataValue.insert(writeTextView.text, at: memoNumber)
//                mMemoDataDic[arraySelect] = mMemoDataValue
//                UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)_Faith")
//                // 텍스트 부분 끝
//                
//                
//                
//                // 이미지 부분
//                if (directoryNameList[memoNumber] == ""){ // 이미지 값이 없었을 때
//                    
//                    directoryNameList[memoNumber] = directoryNameListTemp[0] // ""값 대신 새로 입력된 디렉토리 이름 넣어주기
//                    UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
//                    mMemoImageDic[memoNumber] = directoryNameListTemp // ""값 대신 새로 입력된 파일배열 넣어주기
//                    UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
//                } else { // 이미지 값이 있어서 추가해주는 경우
//                    //                    mMemoImageDic[memoNumber] = mMemoImageDic[memoNumber] + directoryNameListTemp // 기존 있던 값에다가 새로 입력된 파일배열 추가 // 이부분이 넌센스인데 셀 부분에서 템프값을 넣어줘 버려서 여기서 더 넣어줄 필요가 없어서 생략..
//                    UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
//                }
//                
//                // 이미지 부분 끝
//                
//                
//                
//                
//                
//                //                UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
//                
//                //                mMemoImageDic.remove(at: memoNumber)
//                //                mMemoImageDic.insert(mMemoImageValue as! [String], at: memoNumber)
//                //                UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith2")
//                
//                //                mMemoImageDic.remove(at: memoNumber)
//                //                mMemoImageDic.insert(directoryNameList , at: memoNumber)
//                //                UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith2")
//                
//                //                directoryDic.updateValue(directoryNameList, forKey: "\(directoryName)")
//                //                UserDefaults.standard.set(directoryDic, forKey: "\(arraySelect)_\(directoryName)")
//                
//                // 여기
//                //                print("directoryNameList :", mMemoImageDic)
//                
//                print("directoryNameList :", directoryNameList)
//                print("directoryNameListTemp :", directoryNameListTemp)
//                print("mMemoImageDic :" ,mMemoImageDic)
//                print("mMemoDataValue :", mMemoDataValue)
//                
//                //                imageList = mMemoImageDic[memoNumber]
//                //                UserDefaults.standard.set(imageList, forKey: "imageList")
//                
//                //                mMemoImageDirectory.remove(at: memoNumber)
//                //                directoryNameList = UserDefaults.standard.object(forKey: "directoryNameList") as! [String]
//                //                mMemoImageDirectory.insert( directoryNameList , at: memoNumber)
//                //                UserDefaults.standard.set(mMemoImageDirectory, forKey: "\(arraySelect)_Dic_Faith3")
//                //                imageList = mMemoImageDirectory[memoNumber]
//                
//                
//                //                UserDefaults.standard.set(imageList, forKey: "imageList")
//                
//                
//                //                mMemoDataValue2.updateValue(mMemoImageValue, forKey: mMemoDataValue[memoNumber] as! String)
//                //                mMemoDataCombine.updateValue(mMemoDataValue2, forKey: arraySelect)
//                //                mMemoDataDic[arraySelect] = mMemoDataValue
//                //                UserDefaults.standard.set(mMemoDataValue2, forKey: "\(arraySelect)_Faith2")
//                
//                
//                //                print("image :",mMemoImageValue)
//                
//                
//                //                print(mMemoDataValue)
//                
//                
//                
//            }
//            
//            directoryNameListTemp.removeAll()
//            self.performSegue(withIdentifier: "goToViewUI", sender: self)
//        }
//    }
//    
//    
//    // 입력 저장 버튼 End
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    // 입력 취소 버튼 Start
//    
//    @IBAction func writeCancle(_ sender: UIButton) {
//        
//        if directoryNameListTemp != [] { // 이미지 추가를 해줬을 경우 로컬 파일을 지우고 변수에 저장되 값도 모두 지워준다
//            
//            localFileDelete (directory: directoryNameListTemp)
//            
//            directoryNameListTemp.removeAll()
//            self.performSegue(withIdentifier: "goToViewUI", sender: self)
//            
//        } else { // 이미지를 추가해주지 않았으면 아무것도 해줄 필요 없이 그냥 화면만 넘기면 됨
//            self.performSegue(withIdentifier: "goToViewUI", sender: self)
//            
//        }
//        
//    }
//    
//    // 입력 취소 버튼 End
//    
//    
//    
//    
//    
//    
//    
//    // 이미지 셀 시작
//    
//    
//    // 몇개 보여줄거야
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        
//        
//        
//        
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
//        directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]() // 디렉토리 배열 불러오기
//        
//        
//        if memoNumber != -1 {
//            return mMemoImageDic[memoNumber].count + directoryNameListTemp.count
//            
//        } else if directoryNameListTemp.count >= 1 {
//            print("directoryTemp :", directoryNameListTemp)
//            return directoryNameListTemp.count
//        }
//        
//        
//        
//        return 0
//        //                            return directoryNameListTemp.count
//        
//        
//        
//    }
//    
//    
//    func clickImage (_ imageIndex : Int) {  // 추가된 이미지 제거
//        let alertController = UIAlertController(title: "Do you want to DELETE this Image?", message: "Image Number : \(imageIndex+1)", preferredStyle: .alert)
//        
//        let confirmAction = UIAlertAction(title: "Delete", style: .default) { (_) in
//            directoryNameListTemp.remove(at: imageIndex)
//            
//            self.writeCollection.reloadData()
//            
//            
//        }
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
//        
//        
//        
//        alertController.addAction(confirmAction)
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    // 뭐 보여줄거야
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        
//        
//        
//        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! writeCell
//        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        
//        
//        if memoNumber != -1 {
//            mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
//            mMemoImageDic[memoNumber] += directoryNameListTemp
//            print("mmemoImageDic[memonumber] :", mMemoImageDic[memoNumber])
//            
//            
//            //            directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]()
//            
//            print("directoryNameList :", directoryNameList)
//            print("directoryNameListTemp :", directoryNameListTemp)
//            print("mMemoImageDic :" ,mMemoImageDic)
//            print("mMemoDataValue :", mMemoDataValue)
//            print("memoNumber :",memoNumber)
//            print("mMemoImageDic[memoNumber][indexPath.row] :", mMemoImageDic[memoNumber][indexPath.row])
//            
//            let filePath = documentsURL.appendingPathComponent("\(directoryNameList[memoNumber])_Faith/\(mMemoImageDic[memoNumber][indexPath.row])_Faith.jpg").path
//            
//            
//            let TitleImage = UIImage(contentsOfFile: filePath)
//            //            print(filePath)
//            //                print("TitleImage :", TitleImage)
//            imageCell.writeImageView.image = TitleImage
//            //            imageCell.TitleLabel.text = Data[indexPath.row]["TitleLabel"]
//            
//            
//        } else if directoryNameListTemp.count >= 1 {
//            let filePath = documentsURL.appendingPathComponent("\(directoryNameListTemp[0])_Faith/\(directoryNameListTemp[indexPath.row])_Faith.jpg").path
//            
//            let TitleImage = UIImage(contentsOfFile: filePath)
//            //            print(filePath)
//            //                print("TitleImage :", TitleImage)
//            imageCell.writeImageView.image = TitleImage
//        }
//        
//        
//        
//        return imageCell
//    }
//    
//    // 클릭하면 어떻게 돼
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        
//        clickImage(indexPath.row)
//        //            self.performSegue(withIdentifier: "ToDashBoard", sender: self)
//        
//        
//    }
//    
//    
//    // 이미지 셀 끝
//    
//    
//    
//}

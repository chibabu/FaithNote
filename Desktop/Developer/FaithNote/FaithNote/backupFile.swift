// writeView BackUP



//import UIKit
////import AssetsLibrary
////import AVFoundation
//import Photos
////import RealmSwift
//
//
//
//
//
//
//
//
//class writeView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
//    
//    
//    //    let filePicker = UIVideoEditorController()
//    
//    //    var asset = ALAssetsLibrary()
//    
//    //    var asset = PHPhotoLibrary()
//    
//    
//    
//    @IBOutlet weak var writeImageView: UIView!
//    
//    //    let realm = Realm(path: "/Users/carus/Desktop/TestRealm.realm")
//    
//    let imagePicker = UIImagePickerController()
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
//    @IBAction func toolBarCancel(_ sender: UIBarButtonItem) {
//        self.performSegue(withIdentifier: "goToViewUI", sender: self)
//    }
//    
//    @IBAction func toolBarImage(_ sender: UIBarButtonItem) {
//        
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
//        imagePicker.sourceType = .photoLibrary
//        
//        
//        present(imagePicker, animated: true, completion: nil)
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
//    //    @IBAction func toolBarDrawing(_ sender: UIBarButtonItem) {
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
//    
//    
//    
//    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
//        
//        let scale = newWidth / image.size.width
//        let newHeight = image.size.height * scale
//        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
//        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
//        
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        return newImage
//    }
//    
//    
//    
//    
//    //    func imageLoad() {
//    //
//    //        let imageData = UserDefaults.standard.value(forKey: "imgData") as! Data
//    //        let imageFromData = UIImage(data: imageData)!
//    //
//    //        let attachment = NSTextAttachment()
//    //        //            attachment.image = pickedImage
//    //
//    //        attachment.image = resizeImage(image: imageFromData, newWidth: 200)
//    //        //            let addImg = attachment.image(named: pickedImage[IndexPath.row])
//    //
//    //        //put your NSTextAttachment into and attributedString
//    //        let attString = NSAttributedString(attachment: attachment)
//    //
//    //        writeTextView.textStorage.insert(attString, at: writeTextView.selectedRange.location)
//    //    }
//    
//    
//    
//    // image picker start
//    
//    //    func getUIImagefromAsseturl (url: NSURL) {
//    //
//    //        asset.assetForURL(url, resultBlock: { asset in
//    //            if let ast = asset {
//    //                let assetRep = ast.defaultRepresentation()
//    //                let iref = assetRep.fullResolutionImage().takeUnretainedValue()
//    //                let image = UIImage(CGImage: iref)
//    //                dispatch_async(dispatch_get_main_queue(), {
//    //                    // ...Update UI with image here
//    //                })
//    //            }
//    //        }, failureBlock: { error in
//    //            print("Error: \(error)")
//    //        })
//    //    }
//    
//    
//    
//    /**
//     * Copy a resource from the bundle to the temp directory.
//     * Returns either NSURL of location in temp directory, or nil upon failure.
//     *
//     * Example: copyBundleResourceToTemporaryDirectory("kittens", "jpg")
//     */
//    //    public func copyBundleResourceToTemporaryDirectory(resourceName: String, fileExtension: String) -> NSURL?
//    //    {
//    //        // Get the file path in the bundle
//    //        if let bundleURL = Bundle.main.url(forResource: resourceName, withExtension: fileExtension) {
//    //
//    //            let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
//    //
//    //            // Create a destination URL.
//    ////            let targetURL = tempDirectoryURL.URLByAppendingPathComponent("\(resourceName).\(fileExtension)")
//    //
//    //            let targetURL = tempDirectoryURL.appendingPathComponent("\(resourceName).\(fileExtension)")
//    //            // Copy the file.
//    //            do {
//    //                try FileManager.default.copyItem(at: bundleURL, to: targetURL)
//    //                return targetURL as NSURL
//    //            } catch let error {
//    //                NSLog("Unable to copy file: \(error)")
//    //            }
//    //        }
//    //
//    //        return nil
//    //    }
//    
//    //
//    
//    
//    var attrStr = String()
//    
//    public func imageDataAttribute(_ pickedImage : UIImage) {
//        
//        var attributedString :NSMutableAttributedString!
//        attributedString = NSMutableAttributedString(attributedString:writeTextView.attributedText)
//        let textAttachment = NSTextAttachment()
//        textAttachment.image = pickedImage
//        
//        let oldWidth = textAttachment.image!.size.width;
//        
//        //I'm subtracting 10px to make the image display nicely, accounting
//        //for the padding inside the textView
//        
//        let scaleFactor = oldWidth / (writeTextView.frame.size.width - 100);
//        textAttachment.image = UIImage(cgImage: textAttachment.image!.cgImage!, scale: scaleFactor, orientation: .up)
//        let attrStringWithImage = NSAttributedString(attachment: textAttachment)
//        attributedString.append(attrStringWithImage)
//        writeTextView.attributedText = attributedString
//        writeTextView.font = UIFont(name: (writeTextView.font?.fontName)!, size: 15)
//        
//        //        attrStr.append(String)
//        //        print("String : ",attributedString)
//        attrStr = attributedString.description
//        //        print("writeView :",attrStr)
//        //        attrStr.append(String)
//        
//        UserDefaults.standard.set(attrStr, forKey: "imgData")
//        
//        
//    }
//    
//    
//    
//    
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo editinginfo: [String : Any])
//    { if let pickedImage = editinginfo[UIImagePickerControllerOriginalImage] as? UIImage {
//        let imageUrl          = editinginfo[UIImagePickerControllerReferenceURL] as! URL
//        let imageName         = imageUrl.lastPathComponent
//        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        let photoURL          = NSURL(fileURLWithPath: documentDirectory)
//        let localPath         = photoURL.appendingPathComponent(imageName)
//        let image             = editinginfo[UIImagePickerControllerOriginalImage] as! UIImage
//        let data              = UIImagePNGRepresentation(image)
//        let dataImage = data?.base64EncodedString(options: .lineLength64Characters)
//        
//        //        print("localPath: ",imageName)
//        //        print("localPath: ",imageUrl)
//        //
//        //        print("localPath: ",documentDirectory)
//        //
//        //        print("localPath: ",photoURL)
//        //        print("localPath: ",localPath)
//        //        print("localPath: ",image)
//        let stringUrl = imageUrl.relativeString
//        
//        //        UserDefaults.standard.set(stringUrl, forKey: "imageDataString")
//        
//        //        let imageAsset = pickedImage.imageAsset!
//        
//        //        print("string url:",pickedImage.imageAsset!)
//        //                print("asset:",stringUrl)
//        
//        //        imageDataAttribute(pickedImage)
//        writeImageView.image = pickedImage
//        
//        UserDefaults.standard.register(defaults: ["\(attrStr)": stringUrl])
//        UserDefaults.standard.set(stringUrl, forKey: "imageData")
//        
//        
//        
//        //        let imageData = dataImage
//        //        let dataDecode:NSData = NSData(base64Encoded: imageData!, options:.ignoreUnknownCharacters)!
//        //        print("data :", dataDecode)
//        //        let avatarImage:UIImage = UIImage(data: dataDecode as Data)!
//        //        imageDataAttribute(avatarImage)
//        //        print("tst1 :",attrStr)
//        //        print("tst2 :",stringUrl)
//        
//        
//        //        UserDefaults.standard.register(defaults: ["imgData":UIImageJPEGRepresentation(pickedImage, 100)!])
//        //        UserDefaults.standard.set(UIImageJPEGRepresentation(pickedImage, 100), forKey: "imgData")
//        
//        //        if writeImageView.image != nil {
//        //            var frame = self.writeTextView.frame
//        //            frame.size.height = 390
//        //            self.writeTextView.frame = frame
//        //        }
//        
//        do
//        {
//            try data?.write(to: localPath!, options: Data.WritingOptions.atomic)
//        }
//        catch
//        {
//            // Catch exception here and act accordingly
//        }
//        
//        self.dismiss(animated: true, completion: nil)
//        }
//    }
//    
//    
//    
//    
//    public func imagePickerControllera(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo editingInfo: [String:Any]) {
//        if let pickedImage = editingInfo[UIImagePickerControllerOriginalImage] as? UIImage {
//            //            print("ok")
//            
//            //            let imageManager = PHCachingImageManager()
//            
//            
//            
//            let imageUrl = editingInfo[UIImagePickerControllerReferenceURL] as! URL
//            let imageName = imageUrl.lastPathComponent
//            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String!
//            let photoUrl = URL(fileURLWithPath: documentDirectory!)
//            let localPath = photoUrl.appendingPathComponent(imageName)
//            let data = UIImagePNGRepresentation(pickedImage)
//            
//            
//            
//            let asset = PHAsset.fetchAssets(withALAssetURLs: [imageUrl], options: nil).firstObject!
//            
//            
//            
//            
//            //            if let data = UIImageJPEGRepresentation(pickedImage, 0.8) {
//            //                let filename = documentDirectory.appendingPathComponent("copy.png")
//            //                try? data.write(to: filename)
//            //            }
//            
//            
//            
//            
//            //            class func fetchAssets(withALAssetURLs assetURLs: [URL], options: PHFetchOptions?) -> PHFetchResult<PHAsset>
//            
//            
//            
//            //            var assetImage = imageManager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
//            //})
//            
//            
//            //            print("assetImage: ", assetImage)
//            
//            
//            
//            print("image path:", imageUrl)
//            print("image name:", imageName)
//            print("photo url:", photoUrl)
//            print("local path:", localPath)
//            
//            let stringUrl = imageUrl.relativeString
//            //            print("String url:", stringUrl)
//            //
//            print("strung url:", stringUrl)
//            print("asset:", asset)
//            //            writeTextView.text = stringUrl
//            
//            //            getUIImagefromAsseturl(imageUrl)
//            //            dismiss(animated: true, completion: nil)
//            
//            picker.dismiss(animated: true, completion: nil)
//            //            print(pickedImage)
//            
//            //            let redView = UIImageView()
//            //            redView.frame = CGRect(x: 20, y: 40, width: 200, height: 200)
//            //            redView.image = pickedImage
//            //            self.view.addSubview(redView)
//            
//            
//            
//            
//            //
//            
//            //            let size = CGSize(width: 30, height: 30)
//            //            let img = UIImage(named: change_arr[indexPath.row]);
//            //            let addImg = UIImageView(image: UIImage(named: change_arr[indexPath.row]));
//            //            addImg.frame = CGRect(origin: newCursorPosition, size: size)
//            //            message.addSubview(addImg);
//            
//            //            let redView = UIImageView(image: pickedImage)
//            //            redView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//            //            self.writeTextView.addSubview(redView)
//            //            let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 200, height: 200))
//            //            writeTextView.textContainer.exclusionPaths = [path]
//            //            self.writeTextView.addSubview(redView)
//            
//            
//            
//            
//            var attributedString :NSMutableAttributedString!
//            attributedString = NSMutableAttributedString(attributedString:writeTextView.attributedText)
//            let textAttachment = NSTextAttachment()
//            textAttachment.image = pickedImage
//            
//            let oldWidth = textAttachment.image!.size.width;
//            
//            //I'm subtracting 10px to make the image display nicely, accounting
//            //for the padding inside the textView
//            
//            let scaleFactor = oldWidth / (writeTextView.frame.size.width - 100);
//            textAttachment.image = UIImage(cgImage: textAttachment.image!.cgImage!, scale: scaleFactor, orientation: .up)
//            let attrStringWithImage = NSAttributedString(attachment: textAttachment)
//            attributedString.append(attrStringWithImage)
//            writeTextView.attributedText = attributedString
//            writeTextView.font = UIFont(name: (writeTextView.font?.fontName)!, size: 15)
//            //            UserDefaults.standard.set(attributedString, forKey: "imgData")
//            
//            
//            //
//            //            attachment.image = resizeImage(image: pickedImage, newWidth: 200)
//            //
//            
//            UserDefaults.standard.register(defaults: ["imgData":UIImageJPEGRepresentation(pickedImage, 100)!])
//            UserDefaults.standard.set(UIImageJPEGRepresentation(pickedImage, 100), forKey: "imgData")
//            
//            
//            //            copyBundleResourceToTemporaryDirectory(imageName, image)
//            
//            
//            
//            
//            
//            
//            //            writeTextView.isEditable = false
//            //            writeTextView.isSelectable = false
//            
//        }
//    }
//    
//    // image picker end
//    //
//    //    func getDocumentsDirectory() -> URL {
//    //        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//    //        let documentsDirectory = paths[0]
//    //        return documentsDirectory
//    //    }
//    //
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    //
//    //
//    //    func textViewDidChangeSelection(_ textView: UITextView) {
//    //        let minLocation  = 3
//    //        let currentRange = textView.selectedRange
//    //        if (currentRange.location < minLocation) {
//    //            let lengthDelta = (minLocation - currentRange.location)
//    //            //Minus the number of characters moved so the end point of the selection does not change.
//    //            let newRange = NSMakeRange(minLocation, currentRange.length - lengthDelta);
//    //            //Should use UITextInput protocol
//    //            writeTextView.selectedRange = newRange
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
//    func textViewDidBeginEditing(_ textView: UITextView)
//    {
//        var frame = self.writeTextView.frame
//        frame.size.height = 280.5
//        self.writeTextView.frame = frame
//    }
//    
//    func textViewDidEndEditing(_ textView: UITextView)
//    {
//        //        if writeImageView.image != nil {
//        //            var frame = self.writeTextView.frame
//        //            frame.size.height = 390
//        //            self.writeTextView.frame = frame
//        //        } else {
//        var frame = self.writeTextView.frame
//        frame.size.height = 510
//        self.writeTextView.frame = frame
//        //        }
//    }
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
//            //        self.writeTextView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 1, height: 1))
//            
//        }
//    }
//    
//    
//    
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.writeTextView.resignFirstResponder()
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        
//        
//        // for swift 2.0 Xcode 7
//        //        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        
//        
//        writeTextView.inputAccessoryView = toolBarView
//        
//        writeTextView.delegate = self
//        
//        
//        
//        
//        
//        
//        
//        
//        let arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
//        
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        
//        //        UserDefaults.standard.object(forKey: "imgData")
//        
//        
//        
//        
//        
//        
//        // 새 메모 작성(-1)할 때와 수정할 때 텍스트 입력 화면 Start
//        
//        if memoNumber == -1 {
//            
//            mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)") as? [String] ?? [String]()
//            
//            writeTextView.text = ""
//            
//            //            print(mMemoDataValue)
//            //            print(memoNumber)
//            
//            
//        } else {
//            
//            
//            
//            mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)") as! [String]
//            
//            //            writeTextView.text = mMemoDataValue[memoNumber]
//            
//            writeTextView.text = mMemoDataValue[memoNumber] as! String
//            
//            
//            
//            //            var imgDataStr = UserDefaults.standard.object(forKey: "imgData") as? NSAttributedString
//            
//            
//            
//            //            func getDocumentsDirectory() -> URL {
//            //                let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            //                let documentsDirectory = paths[0]
//            //                print("documnet:", paths)
//            //
//            //
//            //                return documentsDirectory
//            //            }
//            
//            
//            
//            
//            //
//            //            let pickedImageData = UserDefaults.standard.value(forKey: "key") as! Data
//            //            let pickedImage = UIImage(data: pickedImageData)!
//            //
//            //
//            //            print("pickedImage: ",pickedImage)
//            //
//            //            var attributedString :NSMutableAttributedString!
//            //            attributedString = NSMutableAttributedString(attributedString:writeTextView.attributedText)
//            //            let textAttachment = NSTextAttachment()
//            //            textAttachment.image = pickedImage
//            //            let oldWidth = textAttachment.image!.size.width
//            //
//            //            let scaleFactor = oldWidth / (writeTextView.frame.size.width - 100);
//            //            textAttachment.image = UIImage(cgImage: textAttachment.image!.cgImage!, scale: scaleFactor, orientation: .up)
//            //            let attrStringWithImage = NSAttributedString(attachment: textAttachment)
//            //            attributedString.append(attrStringWithImage)
//            //            writeTextView.attributedText = attributedString
//            //
//            
//            
//            
//            
//            //            print(mMemoDataValue)
//            //            print(memoNumber)
//            
//        }
//    }
//    
//    
//    
//    
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
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        
//        if writeTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//            let alertView = UIAlertController(title: "Error", message: "No Contents", preferredStyle: UIAlertControllerStyle.alert)
//            // alertview에 확인버튼 삽입
//            alertView.addAction(UIAlertAction(title: "return", style: UIAlertActionStyle.default, handler: nil))
//            
//            // 현재 viewcontroller에 추가하기
//            self.present(alertView, animated: true, completion: nil)
//            
//            
//        } else if memoNumber == -1 {
//            UserDefaults.standard.object(forKey: "\(arraySelect)")
//            
//            
//            
//            mMemoDataValue.insert(writeTextView.text, at: 0)
//            
//            //                mMemoDataImage.insert(writeTextView.attributedText, at: 0)
//            
//            //                mMemoDataValue.insert(writeTextView.attributedText, at: 0)
//            
//            //                mMemoDataImage.insert(writeTextView.attributedText, at: 0)
//            print("attributedText :",writeTextView.textStorage)
//            
//            
//            
//            
//            mMemoDataDic[arraySelect] = mMemoDataValue
//            UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)")
//            
//            // pic start
//            //                UserDefaults.standard.register(defaults: ["key":UIImageJPEGRepresentation(pickedImage, 100)!])
//            //                UserDefaults.standard.set(UIImageJPEGRepresentation(pickedImage, 100), forKey: "key")
//            
//            //                let attString = UserDefaults.standard.object(forKey: "imgData")
//            //                writeTextView.textStorage.insert(attString as! NSAttributedString, at: writeTextView.selectedRange.location)
//            
//            //pic end
//            
//            
//            print(mMemoDataDic)
//            print(mMemoDataValue)
//            
//            
//            self.performSegue(withIdentifier: "goToViewUI", sender: self)
//            
//        } else {
//            
//            
//            mMemoDataValue.remove(at: memoNumber)
//            mMemoDataValue.insert(writeTextView.text, at: memoNumber)
//            mMemoDataDic[arraySelect] = mMemoDataValue
//            UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)")
//            
//            
//            print(mMemoDataValue)
//            
//            
//            self.performSegue(withIdentifier: "goToViewUI", sender: self)
//            
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
//        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        
//        let arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
//        
//        
//        if memoNumber != -1 {
//            //            mMemoData.remove(at: memoNumber)
//            //            UserDefaults.standard.set(mMemoData, forKey: "mMemoData")
//            
//            mMemoDataValue.remove(at: memoNumber)
//            mMemoDataDic[arraySelect] = mMemoDataValue
//            UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)")
//            
//        }
//    }
//    
//    
//    // 입력 취소 버튼 End
//    
//    

//}


// writeView end

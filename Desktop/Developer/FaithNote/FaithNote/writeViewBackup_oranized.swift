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
//    
//    @IBOutlet var toolBarView: UIToolbar!
//    
//    @IBOutlet weak var writeTextView: UITextView!
//    
//    @IBOutlet weak var writeCollection: UICollectionView!
//    
//    let imagePicker = UIImagePickerController()
//    
//    
//    
//    // Variable end
//    
//    
//    
//    
//    //MARK : - Function Start
//    
//    
//    
//    // 로컬 파일 삭제 Function start
//    
//    func localFileDelete (directory : [String]) {
//        let fileManager = FileManager.default
//        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
//        let documentsPath = documentsUrl.path
//        
//        do {
//            
//            let filePathName = "\(documentsPath!)/\(directory[memoNumber])_Faith"
//            try fileManager.removeItem(atPath: filePathName)
//            
//            _ = try fileManager.contentsOfDirectory(atPath: "\(directory[memoNumber])_Faith")
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
//    // 로컬 파일 삭제 Function End
//    
//    
//    
//    
//    
//    // 이미지 추가 Function Start
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
//    }
//    // 이미지 추가 Function End
//    
//    
//    
//    
//    // 키보드 무빙 Function Start
//    
//    @IBAction func Down(_ sender: UIBarButtonItem) {
//        self.writeTextView.resignFirstResponder()
//        
//    }
//    // 키보드 무빙 End
//    
//    
//    
//    
//    
//    // 랜덤 해쉬값 Start
//    
//    func generateHashString() -> String {
//        let currentHash = Date().hashValue.description
//        
//        return currentHash
//    }
//    // 랜덤 해쉬값 End
//    
//    
//    
//    func imageWriteToLocal (_ documentsURL: URL?, _ image: UIImage, _ dNLT: String, _ iFN: String) {
//        let dataPath = documentsURL?.appendingPathComponent("\(dNLT)_Faith")
//        let fileURL = dataPath?.appendingPathComponent("\(iFN)_Faith.jpg")
//        if let pngImageData = UIImagePNGRepresentation(image) {
//            try! FileManager.default.createDirectory(atPath: (dataPath?.path)!, withIntermediateDirectories: true, attributes: nil)
//            try! pngImageData.write(to: fileURL!, options: .atomic)
//            
//        }
//    }
//    
//    
//    
//    
//    // 이미지 로컬에 저장 시작
//    func imageSaveToLocal (_ imageUrl: URL?, _ image: UIImage) {
//        
//        do {
//            
//            imageFileName = generateHashString()
//            
//            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            
//            
//            if memoNumber == -1 { // 새글 입력일 때,
//                
//                
//                directoryNameListTemp.append(imageFileName)
//                let dataPath = documentsURL.appendingPathComponent("\(directoryNameListTemp[0])_Faith")
//                let fileURL = dataPath.appendingPathComponent("\(imageFileName)_Faith.jpg")
//                
//                if let pngImageData = UIImagePNGRepresentation(image) {
//                    try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
//                    try pngImageData.write(to: fileURL, options: .atomic)
//                    
//                } else {}
//                
//            } else { // 입력된 글을 수정할 때
//                
//                
//                directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as! [String]
//                
//                if (directoryNameList[memoNumber] == ""){ // 입력된 글을 수정 하는데, 해당 글에 이미지가 없었을 때
//                    
//                    
//                    
//                    directoryNameListTemp.append(imageFileName)
//                    let dataPath = documentsURL.appendingPathComponent("\(directoryNameListTemp[0])_Faith")
//                    let fileURL = dataPath.appendingPathComponent("\(imageFileName)_Faith.jpg")
//                    
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
//    // 이미지 로컬에 저장 끝
//    
//    
//    
//    
//    
//    // 이미지 피커 시작
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
//        
//        dismiss(animated: true)
//        
//        // get the selected image as a UIImage object
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        let imageUrl = info[UIImagePickerControllerReferenceURL] as? URL
//        
//        imageSaveToLocal(imageUrl, image)
//        
//        writeCollection.reloadData()
//        
//    }
//    // 이미지 피커 끝
//    
//    
//    
//    
//    // 텍스트 뷰 크기 설정 시작
//    func textViewDidBeginEditing(_ textView: UITextView)
//    {
//        var frame = self.writeTextView.frame
//        frame.size.height = 280.5
//        self.writeTextView.frame = frame
//    }
//    // 텍스트 뷰 크기 설정 끝
//    
//    
//    
//    
//    
//    // 기본 경고창 시작
//    func basicAlert (_ messages : String){ // 글을 입력 안했으면 경고창
//        let alertView = UIAlertController(title: "Error", message: messages, preferredStyle: UIAlertControllerStyle.alert)
//        // alertview에 확인버튼 삽입
//        alertView.addAction(UIAlertAction(title: "return", style: UIAlertActionStyle.default, handler: nil))
//        
//        // 현재 viewcontroller에 추가하기
//        self.present(alertView, animated: true, completion: nil)
//    }
//    // 기본 경고창 끝
//    
//    
//    
//    
//    // 추가된 이미지 제거 시작
//    func clickImage (_ imageIndex : Int) {
//        let alertController = UIAlertController(title: "Do you want to DELETE this Image?", message: "Image Number : \(imageIndex+1)", preferredStyle: .alert)
//        
//        let confirmAction = UIAlertAction(title: "Delete", style: .default) { (_) in
//            directoryNameListTemp.remove(at: imageIndex)
//            
//            self.writeCollection.reloadData()
//            
//        }
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
//        
//        alertController.addAction(confirmAction)
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
//        
//    }
//    // 추가된 이미지 제거 끝
//    
//    
//    
//    
//    
//    
//    // 이미지 콜렉션 시작
//    
//    
//    // 몇개 보여줄거야
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        //            let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
//        directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]() // 디렉토리 배열 불러오기
//        
//        
//        if memoNumber != -1 {
//            return mMemoImageDic[memoNumber].count + directoryNameListTemp.count
//            
//        } else if directoryNameListTemp.count >= 1 {
//            return directoryNameListTemp.count
//        }
//        
//        return 0
//        
//    }
//    
//    // 뭐 보여줄거야
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        
//        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! writeCell
//        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        //            let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        
//        
//        if memoNumber != -1 {
//            mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
//            mMemoImageDic[memoNumber] += directoryNameListTemp
//            print("이미지 콜렉션 뷰 directoryNameList :", directoryNameList)
//            print("이미지 콜렉션 뷰 directoryNameListTemp :", directoryNameListTemp)
//            print("이미지 콜렉션 뷰 mMemoImageDic :" ,mMemoImageDic)
//            print("이미지 콜렉션 뷰 mMemoDataValue :", mMemoDataValue)
//            print("이미지 콜렉션 뷰 mMemoImageDic[memoNumber][indexPath.row] :", mMemoImageDic[memoNumber][indexPath.row])
//            
//            let filePath = documentsURL.appendingPathComponent("\(directoryNameList[memoNumber])_Faith/\(mMemoImageDic[memoNumber][indexPath.row])_Faith.jpg").path
//            
//            
//            let TitleImage = UIImage(contentsOfFile: filePath)
//            imageCell.writeImageView.image = TitleImage
//            //            imageCell.TitleLabel.text = Data[indexPath.row]["TitleLabel"]
//            
//            
//        } else if directoryNameListTemp.count >= 1 {
//            let filePath = documentsURL.appendingPathComponent("\(directoryNameListTemp[0])_Faith/\(directoryNameListTemp[indexPath.row])_Faith.jpg").path
//            
//            let TitleImage = UIImage(contentsOfFile: filePath)
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
//    // 이미지 콜렉선 끝
//    
//    
//    
//    // Function End
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    // 메모 삭제 시작
//    
//    @IBAction func toolBarDelete(_ sender: UIBarButtonItem) {
//        
//        
//        if memoNumber != -1 {
//            
//            
//            // 텍스트 부분
//            mMemoDataValue.remove(at: memoNumber)
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
//            print("메모 삭제 후 directoryNameList :", directoryNameList)
//            print("메모 삭제 후 directoryNameListTemp :", directoryNameListTemp)
//            print("메모 삭제 후 mMemoImageDic :" ,mMemoImageDic)
//            print("메모 삭제 후 mMemoDataValue :", mMemoDataValue)
//            print("메모 삭제 후 memoNumber :",memoNumber)
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
//    // 메모 삭제 끝
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
//        writeTextView.inputAccessoryView = toolBarView
//        
//        writeTextView.delegate = self
//        
//        
//        memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
//        
//        arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
//        
//        arraySelectNumber = UserDefaults.standard.object(forKey: "arraySelectNumber") as! Int
//        
//        
//        
//        print("뷰디드 로드 memoNumber :", memoNumber)
//        print("뷰디드 로드 selectNumber :", arraySelectNumber)
//        print("뷰디드 로드 arraySelect :", arraySelect)
//        
//        
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
//            print("뷰디드로드 : 새 메모 작성(-1) 텍스트 입력 화면 directoryNameList :", directoryNameList)
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
//            print("뷰디드로드 : 메모 수정 텍스트 입력 화면 directoryNameList :", directoryNameList)
//            
//            
//        }
//    }
//    // 새 메모 작성(-1)할 때와 수정할 때 텍스트 입력 화면 End
//    
//    
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
//        
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
//                // 이미지 파일 부분 끝
//                
//                
//                print("글 저장버튼 클릭 : 새글 추가 directoryNameList :", directoryNameList)
//                print("글 저장버튼 클릭 : 새글 추가 directoryNameListTemp :", directoryNameListTemp)
//                print("글 저장버튼 클릭 : 새글 추가 mMemoImageDic :" ,mMemoImageDic)
//                print("글 저장버튼 클릭 : 새글 추가 mMemoDataValue :", mMemoDataValue)
//                
//                
//                
//            } else { // 글 수정 하는 경우
//                
//                
//                // 텍스트 부분
//                mMemoDataValue.remove(at: memoNumber)
//                mMemoDataValue.insert(writeTextView.text, at: memoNumber)
//                UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)_Faith")
//                // 텍스트 부분 끝
//                
//                
//                
//                // 이미지 부분
//                if (directoryNameList[memoNumber] == ""){ // 이미지 값이 없는 메모를 수정할 때
//                    if directoryNameListTemp != [] { // 이미지 추가가 있는 경우
//                        directoryNameList[memoNumber] = directoryNameListTemp[0] // ""값 대신 새로 입력된 디렉토리 이름 넣어주기
//                        UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
//                        mMemoImageDic[memoNumber] = directoryNameListTemp // ""값 대신 새로 입력된 파일배열 넣어주기
//                        UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
//                    }
//                    
//                    
//                } else { // 이미지 값이 있는 메모를 수정할 때
//                    //                    mMemoImageDic[memoNumber] = mMemoImageDic[memoNumber] + directoryNameListTemp // 기존 있던 값에다가 새로 입력된 파일배열 추가 // 이부분이 넌센스인데 셀 부분에서 템프값을 넣어줘 버려서 여기서 더 넣어줄 필요가 없어서 생략..
//                    UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
//                }
//                
//                // 이미지 부분 끝
//                
//                
//                print("글 저장버튼 클릭 : 글 수정 directoryNameList :", directoryNameList)
//                print("글 저장버튼 클릭 : 글 수정 directoryNameListTemp :", directoryNameListTemp)
//                print("글 저장버튼 클릭 : 글 수정 mMemoImageDic :" ,mMemoImageDic)
//                print("글 저장버튼 클릭 : 글 수정 mMemoDataValue :", mMemoDataValue)
//                
//                
//            }
//            
//            directoryNameListTemp.removeAll()
//            self.performSegue(withIdentifier: "goToViewUI", sender: self)
//        } // 텍스트가 nil 이 아닐때 (else) 닫아주기
//        
//    }
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
//    
//    
//    
//    
//}

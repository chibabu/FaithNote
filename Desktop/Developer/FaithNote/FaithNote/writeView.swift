//
//  writeView.swift
//  FaithNote
//
//  Created by 차종훈 on 2017. 5. 7..
//  Copyright © 2017년 Carus. All rights reserved.
//

import UIKit
import ELCImagePickerController
//import Photos
//import RealmSwift




class writeView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource, ELCImagePickerControllerDelegate  {

    
    
    
    
    

    
    

    
        
        

    
//MARK : - Variable start
    
        
        @IBOutlet var toolBarView: UIToolbar!
    
        @IBOutlet weak var writeTextView: UITextView!
        
        @IBOutlet weak var writeCollection: UICollectionView!

        let imagePicker = UIImagePickerController()
        let elcImagePicker = ELCImagePickerController(imagePicker: ())
        
        

    internal var selectedMemoNumber = 0
        
        // Variable end
        
    
        
        
//MARK : - Function Start
    
    
    
    
    
       // 로컬 파일 삭제 시작
    
    func localFileDelete (directory : String, fileName : String) {
        let fileManager = FileManager.default
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
        let documentsPath = documentsUrl.path
        do {
            
            //                print("directory[memoNumber] :", directory)
            
            let filePathName = "\(documentsPath!)/\(directory)_Faith/\(fileName)_Faith.jpg"
            try fileManager.removeItem(atPath: filePathName)
            
            //                _ = try fileManager.contentsOfDirectory(atPath: "\(directory[memoNumber])_Faith")
            
        }
            
            //            }
        catch {
            print("Could not clear temp folder: \(error)")
        }
        
        
    }
    
       // 로컬 파일 삭제 끝
        
    
    
    
    
        
    

    
        
        
        
        
        // 이미지 추가 Function Start
        
        @IBAction func toolBarImage(_ sender: UIBarButtonItem) {
            
            func availableAddImageNumber () -> Int {
                let countImage = 3 - directoryNameListTemp.count

                return countImage
            }
            
            elcImagePicker?.maximumImagesCount = availableAddImageNumber()
            elcImagePicker?.returnsOriginalImage = false
            elcImagePicker?.returnsImage = true
            elcImagePicker?.onOrder = true
            elcImagePicker?.imagePickerDelegate = self
            present((elcImagePicker)!, animated: true, completion: nil)

            
//            imagePicker.delegate = self
//            imagePicker.allowsEditing = false
//            imagePicker.sourceType = .photoLibrary
//            present(imagePicker, animated: true, completion: nil)
            
        }
        // 이미지 추가 Function End
        
        
        
        
        // 키보드 무빙 Function Start
        
    @IBAction func downKeyBoard(_ sender: UIBarButtonItem) {
        self.writeTextView.resignFirstResponder()

    }

        // 키보드 무빙 End
        
        
        
        
        
        // 랜덤 해쉬값 Start
        
        func generateHashString() -> String {
            let currentHash = Date().hashValue.description
            
            return currentHash
        }
        // 랜덤 해쉬값 End
    
    
    
    
    // 로컬 디렉토리 삭제 Function start
    
    func localDirectoryDelete (directory : [String]) {
        let fileManager = FileManager.default
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL

        let documentsPath = documentsUrl.path
        
        do {
            let filePathName = "\(documentsPath!)/\(directory[memoNumber])_Faith"
//                    let filePathName = "\(documentUrl)/\(directory[memoNumber])_Faith"
        print("NSTemporaryDirectory() :", NSTemporaryDirectory())

            try fileManager.removeItem(atPath: filePathName)
    }
        catch {
            print("Could not clear temp folder: \(error)")
        }
        
    }
    
    
    
    // 로컬 디렉토리 삭제 Function End
    
    func localDirectoryDelete2 (directory : [String]) {
    let fileManager = FileManager.default
    let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
        do {
    let filePaths = try fileManager.contentsOfDirectory(atPath: "\(documentsUrl)/\(directory[memoNumber])_Faith")
        print("filePaths :",filePaths)
    for filePath in filePaths {
    try fileManager.removeItem(atPath: filePath)
    }
        }
        catch {
            print("Could not clear temp folder: \(error)")
        }
  
}




    
        // 이미지 로컬에 저장 시작
        func imageWriteToLocal (_ imageFDA: [UIImage], _ directoryNLT: String, _ imageFNA: [String]) {
            
            
            
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

//            let dataPath = documentsURL.appendingPathComponent("\(directoryNLT)_Faith")
//                try! FileManager.default.createDirectory(atPath: (dataPath.path), withIntermediateDirectories: true, attributes: nil)
            
                for i in 0..<imageFNA.count {
                    print("imageFNA.count :", imageFNA.count )
                    print("imageFNA[i] :", imageFNA[i])
                    print("imageFDA[i] :", imageFDA[i])
                    
                    let dataPath = documentsURL.appendingPathComponent("\(directoryNLT)_Faith")

                    
            let fileURL = dataPath.appendingPathComponent("\(imageFNA[i])_Faith.jpg")
            let pngImageData = UIImagePNGRepresentation(imageFDA[i])
                    try! FileManager.default.createDirectory(atPath: (dataPath.path), withIntermediateDirectories: true, attributes: nil)
                try! pngImageData?.write(to: fileURL, options: .atomic)
                    
                }
            
        }
        // 이미지 로컬에 저장 끝
        
        //                        mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as! [[String]]
        //
        //
        //                        directoryNameListTemp.append(imageFileName)
        //
        //
        //                        let dataPath = documentsURL.appendingPathComponent("\(directoryNameList[memoNumber])_Faith")
        //                        let fileURL = dataPath.appendingPathComponent("\(imageFileName)_Faith.jpg")
        //
        //                        if let pngImageData = UIImagePNGRepresentation(image) {
        //                            try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
        //                            try pngImageData.write(to: fileURL, options: .atomic)
        //
        //                            
        //                        }
        
        
        
        
        
        // 이미지 임시저장 시작
        func imageSaveToTemp (_ imageUrl: URL, _ imageFile: UIImage) {
            
            imageFileName = generateHashString()
            
//            print("imageUrl :",imageUrl)
//            print("imageUrlArrayTemp :", imageUrlArrayTemp)
//            
//            if imageUrlArrayTemp.contains(imageUrl) {
//                
//                
//            } else {
            
            print("이미지 피커 이전 imageArrayTemp :", imageArrayTemp)

            
            directoryNameListTemp.insert(imageFileName, at: 0) // 이미지 랜덤해쉬 이름 배열
            imageUrlArrayTemp.insert(imageUrl, at: 0) // 실제 이미지 URL 데이터 배열
            imageArrayTemp.insert(imageFile, at: 0) // 실제 이미지 파일 데이터 배열
                
//                print("zzz directoryNameListTemp :", directoryNameListTemp)
//                print("zzz imageFileName :" ,imageFileName)
            print("이미지 피커 이후 imageArrayTemp :", imageArrayTemp)
            
//            }
        }
        // 이미지 임시저장 끝
        
        
        
        
        
        // 이미지 피커 시작
    
    func elcImagePickerControllerDidCancel(_ picker: ELCImagePickerController!) {

        dismiss(animated: true, completion: nil)
        
    }
    
    func elcImagePickerController(_ picker: ELCImagePickerController!, didFinishPickingMediaWithInfo info: [Any]) {

        dismiss(animated: true, completion: nil)
//        print("info.count :", info.count)

        for i in 0..<info.count {
        let imageFileDicTemp = info[i] as! [String:Any]
        let imageFile = imageFileDicTemp[UIImagePickerControllerOriginalImage] as! UIImage
        let imageUrl = imageFileDicTemp[UIImagePickerControllerReferenceURL] as! URL
//            imageArrayTemp.insert(imageFile, at: 0)

            imageSaveToTemp(imageUrl, imageFile)
            
        }
        
    }
    
        // 이미지 피커 끝
        
        
        
        
        // 텍스트 뷰 크기 설정 시작
    
        func textViewDidBeginEditing(_ textView: UITextView) // 텍스트뷰 눌렀을 때
        {
            var frame = self.writeTextView.frame
            frame.size.height = 260
            self.writeTextView.frame = frame
        }

    
    func textViewDidEndEditing(_ textView: UITextView) { // 텍스트뷰 나갔을 때
        if directoryNameListTemp != [] { // 이미지가 있으면
        var frame = self.writeTextView.frame
        frame.size.height = 380
        self.writeTextView.frame = frame
        } else {
            var frame = self.writeTextView.frame
            frame.size.height = 520
            self.writeTextView.frame = frame
        }
    }

    // 텍스트 뷰 크기 설정 끝
    
    
    
    
    
    // 콜렉션 뷰 크기 설정 시작
        
    func imageCollectionHide (_ bool: Bool) {
        writeCollection.isHidden = bool
    }
        
        // 콜렉션 뷰 크기 설정 끝
    
    
    
        // 기본 경고창 시작
        func basicAlert (_ messages : String){ // 글을 입력 안했으면 경고창
            let alertView = UIAlertController(title: "Error", message: messages, preferredStyle: UIAlertControllerStyle.alert)
            // alertview에 확인버튼 삽입
            alertView.addAction(UIAlertAction(title: "return", style: UIAlertActionStyle.default, handler: nil))
            
            // 현재 viewcontroller에 추가하기
            self.present(alertView, animated: true, completion: nil)
        }
        // 기본 경고창 끝
        
        
        
        
        // 추가된 이미지 제거 시작
        func clickImage (_ imageIndex : Int) {
            let alertController = UIAlertController(title: "Do you want to DELETE this Image?", message: "Image Number : \(imageIndex+1)", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "Delete", style: .default) { (_) in
                directoryNameListTemp.remove(at: imageIndex)
                
                self.writeCollection.reloadData()
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        // 추가된 이미지 제거 끝
        
        
        
        
        
        
        // 이미지 콜렉션 시작
        
        
        // 몇개 보여줄거야
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
//            mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
            directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]() // 디렉토리 배열 불러오기


            if memoNumber != -1 { // 글 수정일 경우
                
                
//                return mMemoImageDic[memoNumber].count + directoryNameListTemp.count
                print("directoryNameListTemp.count :", directoryNameListTemp.count)
                return directoryNameListTemp.count

                
                
                
            } else if directoryNameListTemp.count >= 1 { // 새글 입력일 때 이미지 값이 하나라도 있을 경우
                return directoryNameListTemp.count
            } else {}
            
            return 0 // 값이 없을 경우
        }
        
        // 뭐 보여줄거야
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            

            let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! writeCell

            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            
            if memoNumber != -1 { // 글 수정일 경우
                print("글 수정일 경우")
//                mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
                
//                reverseTemp = directoryNameListTemp
//                reverseTemp += mMemoImageDic[memoNumber] // 순서 뒤바뀌도록(나중에 넣은게 앞에 보이도록)
//                mMemoImageDic[memoNumber] = reverseTemp
                
                
                
                
//                print("memoNumber : ",memoNumber )
//                print("이미지 콜렉션 뷰 directoryNameList :", directoryNameList)
////                print("이미지 콜렉션 뷰 directoryNameListTemp :", directoryNameListTemp)
//                print("이미지 콜렉션 뷰 mMemoImageDic :" ,mMemoImageDic)
////                print("이미지 콜렉션 뷰 mMemoDataValue :", mMemoDataValue)
//                print("이미지 콜렉션 뷰 mMemoImageDic[memoNumber][indexPath.row] :", mMemoImageDic[memoNumber][indexPath.row])
//                print("이미지 콜렉션 뷰 mMemoImageDic[memoNumber]:", mMemoImageDic[memoNumber])

//                print("이미지 콜렉션 뷰 imageArrayTemp :", imageArrayTemp)

                
                
                
//                let filePath = documentsURL.appendingPathComponent("\(directoryNameList[memoNumber])_Faith/\(mMemoImageDic[memoNumber][indexPath.row])_Faith.jpg").path
                let filePath = documentsURL.appendingPathComponent("\(directoryNameList[memoNumber])_Faith/\(directoryNameListTemp[indexPath.row])_Faith.jpg").path
//                let testPath = documentsURL.appendingPathComponent("\(directoryNameList[memoNumber])_Faith/\(directoryNameListTemp[indexPath.row])_Faith.jpg")
                // 이상하게 인덱스패스 로우를 3 값밖에 못 불러온다.. 이유는 모르겠음
                
                
                print("directoryNameListTemp[indexPath.row] :", directoryNameListTemp[indexPath.row])
                print("filePath :", filePath)
//                print("testPath :", testPath)


                
                
                let TitleImage = UIImage(contentsOfFile: filePath)
//                let imageUrlTemp = URL(fileURLWithPath: filePath, isDirectory: true)
                
//                print("TitleImage :", TitleImage)

                if TitleImage != nil { // 기존 저장된 이미지가 있을 때
                    print("기존 저장된 이미지가 있을 때")
                    
                imageArrayTemp.append(TitleImage!)
//                    imageUrlArrayTemp.append(imageUrlTemp)
//                    print("imageUrlArrayTemp:",imageUrlArrayTemp)
                    imageCell.writeImageView.image = imageArrayTemp[indexPath.row]

                } else if imageArrayTemp != [] { // 기존 저장된 이미지가 없고, 피커로 추가하는 이미지가 있을 때
                    print("기존 저장된 이미지가 없고, 피커로 추가하는 이미지가 있을 때")
                    
                imageCell.writeImageView.image = imageArrayTemp[indexPath.row]
                } else {
                // 기존 저장된 이미지도 없고 피커로 추가도 안하면 아무것도 안함
                print("기존 저장된 이미지도 없고 피커로 추가도 안하면 아무것도 안함")
                }

            } else if directoryNameListTemp.count >= 1 { // 새글 입력일 때 이미지 값이 하나라도 있을 경우
                print("새글 입력일 때 이미지 값이 하나라도 있을 경우")
                imageCell.writeImageView.image = imageArrayTemp[indexPath.row]
            } else {}
            

            return imageCell
        }
        
        // 클릭하면 어떻게 돼
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            clickImage(indexPath.row)
            

            directoryNameListTemp.remove(at: indexPath.row)
            imageArrayTemp.remove(at: indexPath.row)
            
            collectionView.reloadData()
            
//            localFileDelete(directory: directoryNameList, fileName: mMemoImageDic[memoNumber][indexPath.row])
            //            self.performSegue(withIdentifier: "ToDashBoard", sender: self)
            
            
        }
        
        
        // 이미지 콜렉선 끝
        
        
        
// Function End


    
    
    
    // 입력 저장 버튼 Start
    
    @IBAction func writeSave(_ sender: UIButton) {


        
        if writeTextView.text == "" {
            if writeTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            basicAlert("No Contents")
            }

        } else {
        
            if memoNumber == -1 { //새글 추가하는 경우
                
                print("새글 추가하는 경우")
        
                // 글 부분
                mMemoDataValue.insert(writeTextView.text, at: 0)
                UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)_Faith")
                // 글 부분 끝
                
                
                // 이미지 부분 시작
                if directoryNameListTemp != [] { // 이미지를 넣었을 때
                        print("이미지를 넣었을 때")
                    directoryNameList.insert(directoryNameListTemp[0] , at: 0) // 이미지 디렉토리 이름 저장
                    UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
                    
                    mMemoImageDic.insert(directoryNameListTemp, at: 0) // 이미지 파일 이름 저장
                    UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
                    
                    // 파일 로컬디렉토리에 쓰기
                    imageWriteToLocal(imageArrayTemp, directoryNameListTemp[0], directoryNameListTemp)
                    
                    
                    
                } else { // 이미지를 넣지 않았을 때
                    print("이미지를 넣지 않았을 때")
                    directoryNameList.insert("", at: 0)  // 이미지 디렉토리 이름 널값 저장(인덱스 맞춰주기 위해)
                    UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
                    
                    mMemoImageDic.insert(directoryNameListTemp, at: 0) // 이미지 파일 이름 널값 저장(인덱스 맞춰주기 위해)
                    UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
                    
                }
                // 이미지 부분 끝
                
                
                
                

//                print("글 저장버튼 클릭 : 새글 추가 directoryNameList :", directoryNameList)
//                print("글 저장버튼 클릭 : 새글 추가 directoryNameListTemp :", directoryNameListTemp)
//                print("글 저장버튼 클릭 : 새글 추가 mMemoImageDic :" ,mMemoImageDic)
//                print("글 저장버튼 클릭 : 새글 추가 mMemoDataValue :", mMemoDataValue)



            } else { // 글 수정 하는 경우
            

                // 텍스트 부분
                mMemoDataValue.remove(at: memoNumber)
                mMemoDataValue.insert(writeTextView.text, at: memoNumber)
                UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)_Faith")
                // 텍스트 부분 끝
                
                
                
                // 이미지 부분
                if (directoryNameList[memoNumber] == ""){ // 이미지 값이 없는 메모를 수정할 때
                    if directoryNameListTemp != [] { // 이미지 추가가 있는 경우
                        print("이미지 값이 없는 메모를 수정할 때 이미지 추가가 있는 경우")
                        print("directoryNameListTemp :", directoryNameListTemp)
                    directoryNameList[memoNumber] = directoryNameListTemp[0] // ""값 대신 새로 입력된 디렉토리 이름 넣어주기
                        UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
                        mMemoImageDic[memoNumber] = directoryNameListTemp // ""값 대신 새로 입력된 파일배열 넣어주기
                        UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
                        
                        imageWriteToLocal(imageArrayTemp, directoryNameListTemp[0], directoryNameListTemp)

                    } else {
                    print("이미지 값이 없는 메모를 수정할 때 이미지 추가가 없는 경우")
                    }
                    
                    
                } else { // 이미지 값이 있는 메모를 수정할 때
                    
//                    if directoryNameListTemp == [] {
//                        
//                    }
                    print("이미지 값이 있는 메모를 수정할 때")
//                    print("imageArrayTemp :", imageArrayTemp)
//                    print("directoryNameListTemp :", directoryNameListTemp)
//                    print("mMemoImageDic :", mMemoImageDic)
                    mMemoImageDic[memoNumber] = directoryNameListTemp // 기존 있던 값에다가 새로 입력된 파일배열 추가 // 이부분이 넌센스인데 셀 부분에서 템프값을 넣어줘 버려서 여기서 더 넣어줄 필요가 없어서 생략..
                    UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
                    
                    
                    print("imageArrayTemp :", imageArrayTemp)
                    print("directoryNameListTemp :", directoryNameListTemp)
                    print("mMemoImageDic :", mMemoImageDic)
                
                    localDirectoryDelete(directory: directoryNameList) // 이미지 파일을 찾아서 지워줘보자...
                    
                    imageWriteToLocal(imageArrayTemp, directoryNameList[memoNumber], directoryNameListTemp)
                }
                
                // 이미지 부분 끝

                
//                print("글 저장버튼 클릭 : 글 수정 directoryNameList :", directoryNameList)
//                print("글 저장버튼 클릭 : 글 수정 directoryNameListTemp :", directoryNameListTemp)
//                print("글 저장버튼 클릭 : 글 수정 mMemoImageDic :" ,mMemoImageDic)
//                print("글 저장버튼 클릭 : 글 수정 mMemoDataValue :", mMemoDataValue)
                
            
    }

        directoryNameListTemp.removeAll()
        imageUrlArrayTemp.removeAll()
        imageArrayTemp.removeAll()

        self.performSegue(withIdentifier: "goToViewUI", sender: self)
        } // 텍스트가 nil 이 아닐때 (else) 닫아주기
        
    }
        
    // 입력 저장 버튼 End
    
    
    
    
    
    // 메모 삭제 시작
    
    @IBAction func toolBarDelete(_ sender: UIBarButtonItem) {
        
        
        if memoNumber != -1 { // 기존 작성된 글일 경우
            
            
            // 텍스트 부분
            mMemoDataValue.remove(at: memoNumber)
            UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)_Faith")
            // 텍스트 부분 끝
            
            
            localDirectoryDelete (directory: directoryNameList)

            // 이미지 변수 부분
            directoryNameList.remove(at: memoNumber)
            UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
            
            mMemoImageDic.remove(at: memoNumber)
            UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
            // 이미지 변수 부분 끝
            
            
            
            
            
//            print("메모 삭제 후 directoryNameList :", directoryNameList)
//            print("메모 삭제 후 directoryNameListTemp :", directoryNameListTemp)
//            print("메모 삭제 후 mMemoImageDic :" ,mMemoImageDic)
//            print("메모 삭제 후 mMemoDataValue :", mMemoDataValue)
//            print("메모 삭제 후 memoNumber :",memoNumber)
            

            directoryNameListTemp.removeAll()
            imageArrayTemp.removeAll()
            imageUrlArrayTemp.removeAll()
            
            self.performSegue(withIdentifier: "goToViewUI", sender: self)
            
        } else { // 새 글일 경우
            
            
                directoryNameListTemp.removeAll()
                imageArrayTemp.removeAll()
                imageUrlArrayTemp.removeAll()
                self.performSegue(withIdentifier: "goToViewUI", sender: self)
                
            }
    }
    
    // 메모 삭제 끝
    
    
    
    
    
    
    // 입력 취소 버튼 Start
    
    @IBAction func writeCancle(_ sender: UIButton) {
        
       
            
            directoryNameListTemp.removeAll()
            imageArrayTemp.removeAll()
            imageUrlArrayTemp.removeAll()
            self.performSegue(withIdentifier: "goToViewUI", sender: self)
            
       
        
  }
    
    // 입력 취소 버튼 End
        
        
        
        
        
        
        
        
        
        
        override func viewDidAppear(_ animated: Bool) {
            

            
            if memoNumber == -1 {
                self.writeTextView.becomeFirstResponder()//텍스트필드에 포커스
                
            }
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if directoryNameListTemp != [] { // 이미지 값이 있으면 콜렉션 뷰를 숨기지 않는다
            imageCollectionHide (false)
            
            var frame = self.writeTextView.frame
            frame.size.height = 380
            self.writeTextView.frame = frame
            
        } else {
            imageCollectionHide (true)

        }
        writeCollection.reloadData()

    }
    
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.writeTextView.resignFirstResponder()
            
        }
        
        
        
        override func viewDidLoad() {
            
            
            
            writeCollection.layer.borderColor = UIColor.lightGray.cgColor

            
            writeTextView.inputAccessoryView = toolBarView
            
            writeTextView.delegate = self
            
            
            memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
            
            arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
            
            arraySelectNumber = UserDefaults.standard.object(forKey: "arraySelectNumber") as! Int
            
            
            
//            print("뷰디드 로드 memoNumber :", memoNumber)
//            print("뷰디드 로드 selectNumber :", arraySelectNumber)
//            print("뷰디드 로드 arraySelect :", arraySelect)
//            print("뷰디드 로드 mMemoImageDic :", mMemoImageDic)
//            print("뷰디드 로드 directoryNameList :", directoryNameList)
//            print("뷰디드 로드 mMemoDataValue :", mMemoDataValue)

            
            
            // 새 메모 작성(-1)할 때와 수정할 때 텍스트 입력 화면 Start
            
            if memoNumber == -1 { // 새 메모

                // 텍스트 부분
                mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as? [String] ?? [String]()
                writeTextView.text = ""
                
                // 텍스트 부분 끝
                
                
                
                // 이미지 부분
                mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
                directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]() // 디렉토리 배열 불러오기
                
                // 이미지 부분 끝
                
//                print("뷰디드로드 : 새 메모 작성(-1) 텍스트 입력 화면 directoryNameList :", directoryNameList)
                
                
                
                
                
                
                
            } else { // 메모 수정
                
                // 텍스트 부분
                mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as! [String]
                writeTextView.text = mMemoDataValue[memoNumber]
                // 텍스트 부분 끝
                
                
                
                // 이미지 부분
                mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
                directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]() // 디렉토리 배열 불러오기
                
                directoryNameListTemp = mMemoImageDic[memoNumber]
                // 이미지 부분 끝
                
//                print("뷰디드로드 : 메모 수정 텍스트 입력 화면 directoryNameList :", directoryNameList)
                
                
            }
            // 새 메모 작성(-1)할 때와 수정할 때 텍스트 입력 화면 End
            
            
            
        }
        
        
        
        


    

}

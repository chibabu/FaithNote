//
//  main.swift
//  FaithNote
//
//  Created by 차종훈 on 2017. 5. 6..
//  Copyright © 2017년 Carus. All rights reserved.
//

import UIKit
//import RealmSwift

class mainView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
//    var mMemoContainer = fMemo()
//    var mMemoImageFile = fImage()


    //MARK: - PickerView Declare
    @IBOutlet weak var pickerCatego: UIPickerView!
    @IBOutlet weak var memoTableView: UITableView!
    @IBOutlet weak var labelFolderSelect: UILabel!
    @IBOutlet weak var labelMemo: UILabel!
    
    
    
    
// function ----

    
    
    
    // 로컬 파일 삭제 Function start
    
    func localFileDeleteAll (directory : [String]) {
        let fileManager = FileManager.default
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
        let documentsPath = documentsUrl.path
        do {
            
            //                print("directory[memoNumber] :", directory)
            for i in 0...directory.count-1 {
                print("directory.count :", directory.count)
                print("directory: ", directory)
            let filePathName = "\(documentsPath!)/\(directory[i])_Faith"
            try fileManager.removeItem(atPath: filePathName)
            
//            _ = try fileManager.contentsOfDirectory(atPath: "\(directory[i])_Faith")
            }
        }
            
            //            }
        catch {
            print("Could not clear temp folder: \(error)")
        }
        
        
    }
    // 로컬 파일 삭제 Function End
    
    
    
    
    
    
    
// function End ----

    
    
    
//    var mMemoContainer = fMemo()

    
    
    // Create Folder start
    
    @IBAction func createFolder(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Create Folder", message: "Please input new folder name :", preferredStyle: .alert)
        
        // 아무값도 입력하지 않았을 때
        let confirmAction = UIAlertAction(title: "Create", style: .default) { (_) in
            if let field = alertController.textFields?[0] {
                if (field.text?.trimmingCharacters(in: .whitespaces).isEmpty)! {
                    
                    let alertView = UIAlertController(title: "Error", message: "No Contents", preferredStyle: UIAlertControllerStyle.alert)
                    // alertview에 확인버튼 삽입
                    alertView.addAction(UIAlertAction(title: "return", style: UIAlertActionStyle.default, handler: nil))
                    
                    // 현재 viewcontroller에 추가하기
                    self.present(alertView, animated: true, completion: nil)
                    
                    
                } else {
                    
                    // 값은 입력 받았으나 기존 있던값을 입력했을 때
                    if arrayCategory.contains(field.text!) {
                        
                        let alertView = UIAlertController(title: "Error", message: "Found a Same Title!", preferredStyle: UIAlertControllerStyle.alert)
                        // alertview에 확인버튼 삽입
                        alertView.addAction(UIAlertAction(title: "return", style: UIAlertActionStyle.default, handler: nil))
                        
                        // 현재 viewcontroller에 추가하기
                        self.present(alertView, animated: true, completion: nil)
                        
                    }
                    else
                    {


                
                        
//                                try! realm.write {
//                                    let mMemoContainer = fMemo()
//
//                                    let mMemoIndex = fIndex()
//                                    mMemoIndex.fIndexNum = realm.objects(fIndex.self).endIndex+1
//                                    
//                                    mMemoContainer.fCategory = field.text!
//                                    mMemoContainer.fMemoidx = realm.objects(fMemo.self).endIndex+1
//                                    
//                    
//                                    mMemoIndex.fMemoList.append(mMemoContainer)
//                                    
//                                    
//                                    realm.add(mMemoContainer)
//                                    realm.add(mMemoIndex, update : true)
//                                    
//                                    print(" Photo stored.")
//                                }
//                        
                        
                        
                        
                        
                        arrayCategory.insert(field.text!, at: 0)
                        
                        
                        UserDefaults.standard.set(arrayCategory, forKey: "arrayCategory")
                        
//                        print("arrayCategory :", arrayCategory)
                        
                        self.pickerCatego.selectRow(0, inComponent: 0, animated: true)
                        self.pickerView(self.pickerCatego, didSelectRow: 0, inComponent: 0)
                        
//                        UserDefaults.standard.synchronize()
                        
                        self.pickerCatego.reloadAllComponents()
                        
                        
                    }
                }
            } else {
                // user did not fill field
            }
            
            
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "folder name"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    // Create Folder end
    

    
    
    
    
    // search bar start
    
    @IBOutlet weak var textSearchBar: UISearchBar!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textSearchBar.resignFirstResponder()
    }

//    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
//        textSearchBar.resignFirstResponder()
//        return true
//    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        textSearchBar.resignFirstResponder()

    }
    

    
    // search bar end
    
    
    
    
    
    
    // Delete Folder start
    
    @IBAction func deleteFolder(_ sender: UIButton) {
        
        

        
        if arrayCategory != [] {
            
        arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
            
            mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as? [String] ?? [String]()

            
        arraySelectNumber = UserDefaults.standard.object(forKey: "arraySelectNumber") as! Int
            
            

            
        arrayCategory.remove(at: arraySelectNumber)
        UserDefaults.standard.set(arrayCategory, forKey: "arrayCategory")
            
        mMemoDataValue.removeAll()
            UserDefaults.standard.set(mMemoDataValue, forKey: "\(arraySelect)_Faith")
            
            
            
            
            // 이미지 부분
            
            
            mMemoImageDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Dic_Faith") as? [[String]] ?? [[String]]() // 이미지 배열 불러오기
            directoryNameList = UserDefaults.standard.object(forKey: "\(arraySelect)_directoryNameList") as? [String] ?? [String]() // 디렉토리 배열 불러오기
            
            
            print("directoryNameList :", directoryNameList)
            if directoryNameList != []{ // 디렉토리값이 있다면
            localFileDeleteAll (directory: directoryNameList)
            }
            
            // 이미지 변수 부분
            directoryNameList.removeAll()
            UserDefaults.standard.set(directoryNameList, forKey: "\(arraySelect)_directoryNameList")
            
            mMemoImageDic.removeAll()
            UserDefaults.standard.set(mMemoImageDic, forKey: "\(arraySelect)_Dic_Faith")
            // 이미지 변수 부분 끝
            
            // 이미지 부분 끝
            
            
            
            
            
            pickerCatego.reloadAllComponents()

            
//            pickerCatego.selectRow(arraySelectNumber, inComponent: 0, animated: true)
            
//            if arraySelectNumber == 0 {
//                pickerView(pickerCatego, didSelectRow: arraySelectNumber, inComponent: 0) }
             if arraySelectNumber < arrayCategory.endIndex {
            pickerView(pickerCatego, didSelectRow: arraySelectNumber, inComponent: 0)
//                 print(arraySelectNumber)
//                 print(arrayCategory.endIndex)
               
            } else {
                pickerView(pickerCatego, didSelectRow: arraySelectNumber-1, inComponent: 0)

            }
            
            memoTableView.reloadData()
        
        } else {

            
        }

    }
    
    
    // Delete Foldr end
    
    
    
    
    // Add memo start
    
    @IBAction func addMemo(_ sender: UIButton) {
        
        
        if arrayCategory != [] {
            
            arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as! String
            
            UserDefaults.standard.set(arraySelect, forKey: "arraySelect")
            
            UserDefaults.standard.set(-1, forKey: "memoNumber")
            
            
            self.performSegue(withIdentifier: "toWriteView", sender: self)
            
            
        } else {
            let alertView = UIAlertController(title: "Error", message: "No Folder!", preferredStyle: UIAlertControllerStyle.alert)
            // alertview에 확인버튼 삽입
            alertView.addAction(UIAlertAction(title: "return", style: UIAlertActionStyle.default, handler: nil))
            
            // 현재 viewcontroller에 추가하기
            self.present(alertView, animated: true, completion: nil)
            
            
        }
    }
    
    // Add memo end

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() { // 뷰윌어페어보다 먼저
        super.viewDidLoad()
        

        self.textSearchBar.delegate = self
        
        labelFolderSelect.layer.borderColor = UIColor.lightGray.cgColor
        labelMemo.layer.borderColor = UIColor.lightGray.cgColor
        
        //MARK: - PickerView Act
        pickerCatego.delegate = self
        pickerCatego.dataSource = self
        //MARK: - PickerView Act ..end
        
        
        
        arrayCategory = UserDefaults.standard.object(forKey: "arrayCategory") as? [String] ?? [String]()

        arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as? String ?? String()

        mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as? [String] ?? [String]()

//        print("뷰디드로드 - arraySelect :" ,arraySelect)
//
//        print("뷰디드로드 - arrayCategory :" ,arrayCategory)
//
//        print("뷰디드로드 - mMemoDataValue :" ,mMemoDataValue)
//        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let arraySelectNumTemp = UserDefaults.standard.integer(forKey: "arraySelectNumber")
        pickerCatego.selectRow(arraySelectNumTemp, inComponent: 0, animated: false)
        
//        print("뷰윌어페어 - arrayCategory :" ,arrayCategory)
        
    }
    
    
    
    

    
    //MARK: - PickerView Declare ..start
    
    
    

    

    
    // 총 갯수
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

//        let mMemoContainerCount = realm.objects(fMemo.self).count

        return arrayCategory.count
//        return mMemoContainerCount

    }
    
    // 뭘 보여줄거냐
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        
//        let mMemoContainerCell = Array(realm.objects(fMemo.self).sorted(byKeyPath: "fMemoidx"))
        
        
        
//        let mMemoContainerCellArray = mMemoContainerCell.map{$0.fCategory}
        
        
            return arrayCategory[row]
        
//         return mMemoContainerCellArray.reversed()[row]

        
    }
    
    // 몇개씩 보여줄꺼냐?
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        
        
        if arrayCategory != [] {

        

            UserDefaults.standard.set(arrayCategory.index(of: arrayCategory[row])!, forKey: "arraySelectNumber")
            
            UserDefaults.standard.set(arrayCategory[row], forKey: "arraySelect")
            
//            arraySelect = arrayCategory[row]
            
            
//            print(arrayCategory[row])
//            print(arrayCategory)
            

        } else {
            
            
            
        }

        memoTableView.reloadData()
    }
    
    //MARK: - PickerView Declare ..end
    

    
    
    
    
    //MARK: - TableView Declare
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        //        let mMemoDataDic = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as? [String] ?? [String]()
        //
        //        if mMemoDataDic.count == 0 {
        //            return 1
        //        }
        arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as? String ?? String()

                mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as? [String] ?? [String]()
        
//        print("테이블뷰 - mMemoDataValue :", mMemoDataValue)
        if mMemoDataValue == [] {
            return 1
        }
        
        
        return mMemoDataValue.count
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMemo = tableView.dequeueReusableCell(withIdentifier: "cellMemo", for: indexPath) as! mainCell
        
        
        
        
        //        print("test :",test)
        
//        arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as? String ?? String()
//        mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as? [String] ?? [String]()
        
//        print("테이블뷰 - arraySelect :" ,arraySelect)
//        
//        print("테이블뷰 - arrayCategory :" ,arrayCategory)
//        
//        print("테이블뷰 - mMemoDataValue :" ,mMemoDataValue)
        
        
        if arrayCategory != [] && mMemoDataValue.count == 0 {
            mMemoDataValue = ["Add New Memo"]
            cellMemo.memoTitle!.text = mMemoDataValue[0]
            
        } else if mMemoDataValue.count == 0 {
            mMemoDataValue = ["Add New Category"]
            cellMemo.memoTitle!.text = mMemoDataValue[0]
        } else {
            cellMemo.memoTitle!.text = mMemoDataValue[indexPath.row]
            
        }
        
        
        return cellMemo
        
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        memoNumber = indexPath.row
//        print("memoNumber :",memoNumber)
//
//        arraySelect = UserDefaults.standard.object(forKey: "arraySelect") as? String ?? String()
//        
//        mMemoDataValue = UserDefaults.standard.object(forKey: "\(arraySelect)_Faith") as? [String] ?? [String]()
//        
//        if arrayCategory != [] && mMemoDataValue.count == 0 {
//            
//            UserDefaults.standard.set(-1, forKey: "memoNumber")
//            self.performSegue(withIdentifier: "toWriteView", sender: self)
//            
//        } else if mMemoDataValue.count == 0 {
//            print("보류 -> 클릭하면 폴더 생성하도록")
//        } else {
//            UserDefaults.standard.set(memoNumber, forKey: "memoNumber")
//            self.performSegue(withIdentifier: "toWriteView", sender: self)
//        }
//    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Check if there is a identifier for the segue, prevent from crashing/just in case.
        //As segue.identifier is optional, everytime you unwrapped optional var, you should either use 'if let' or 'guard let'

        if let segueIdentifier = segue.identifier {
            // you can saftely use 'segueIdentifier' here now, coz is unwrapped and its not null
            // you can perform several segues from one viewcontroller, add if else to handle different segueIdentifier
            if segueIdentifier == "toWriteView" {

                if let selectedRow = memoTableView.indexPathForSelectedRow?.row {
                    let writeView = segue.destination as! writeView
                    writeView.selectedMemoNumber = selectedRow
                }else{
                    // logically this line will never be reached
                    print("you didnt selected a row")
                }
            }// else if segueIdentifier == ""
        }else{
            //if segue.identifier is null, handle the error
        }
    }


    //MARK: - TableView Declare ..end
    
    
    
    
    
    
    
    
    

    


}

//
//  ViewController.swift
//  DemoELCImagePickerController
//
//  Created by Hasya.Panchasara on 29/11/16.
//  Copyright © 2016 Hasya Panchasara. All rights reserved.
//

import UIKit


class ViewController: UIViewController, ELCImagePickerControllerDelegate {

    var picker = ELCImagePickerController(imagePicker: ())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        picker?.maximumImagesCount = 5
        picker?.imagePickerDelegate = self
        self.present(picker!, animated: true, completion: nil)
        
    }
    
    func elcImagePickerController(_ picker: ELCImagePickerController!, didFinishPickingMediaWithInfo info: [AnyObject]!) {
        
    }
    
    
    func elcImagePickerControllerDidCancel(_ picker: ELCImagePickerController!) {
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


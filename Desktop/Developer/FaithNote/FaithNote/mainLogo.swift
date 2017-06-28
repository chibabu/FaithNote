//
//  ViewController.swift
//  FaithNote
//
//  Created by 차종훈 on 2017. 5. 6..
//  Copyright © 2017년 Carus. All rights reserved.
//

import UIKit

class mainLogo: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 1초 후 mainLogo VC의 timeToMoveOn 함수를 실행한다.
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(mainLogo.timeToMoveOn), userInfo: nil, repeats: false)
    }
    
    // MARK: - Segue(페이지 넘기기)를 이용하여 goToMainUI 화살표 방향으로 페이지를 넘긴다.
    func timeToMoveOn() {
        self.performSegue(withIdentifier: "goToMainUI", sender: self)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


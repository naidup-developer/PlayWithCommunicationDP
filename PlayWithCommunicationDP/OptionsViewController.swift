//
//  OptionsViewController.swift
//  PlayWithCommunicationDP
//
//  Created by Chanti on 16/12/20.
//  Copyright © 2020 Naidu. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    var answer: [String: Any] = [:]
    
    var selected : (([String : Any])->())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onclickModi(_ sender: UIButton) {
        answer["answer"] = true
        answer["name"] = "Modi"
        
        //Step 3 : Notifications
       // NotificationCenter.default.post(name: QuizNotificationName.quizAnswer, object: nil, userInfo: answer)
        selected(answer)
        
        navigationController?.popViewController(animated: true)
       
    }
    @IBAction func onClickSonia(_ sender: UIButton) {
        answer["answer"] = false
        answer["name"] = "Sonia"
        //NotificationCenter.default.post(name: QuizNotificationName.quizAnswer, object: nil, userInfo: answer)
        selected(answer)
        navigationController?.popViewController(animated: true)
        
        
    }
}

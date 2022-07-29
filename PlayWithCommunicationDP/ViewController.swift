//
//  ViewController.swift
//  PlayWithCommunicationDP
//
//  Created by Chanti on 16/12/20.
//  Copyright © 2020 Naidu. All rights reserved.
//

import UIKit

struct QuizNotificationName {
    //Step 1 : Notification
    static let quizAnswer = NSNotification.Name("quizAnswer")
}

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notificationSetup()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //Step 2: Notification
    func notificationSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(userAnsweredQuestion(_:)), name: QuizNotificationName.quizAnswer, object: nil)
    }
    
    
    @objc func userAnsweredQuestion(_ notification: Notification){
        if let notiInfo = notification.userInfo as NSDictionary? {
            if let anser = notiInfo["answer"] as? Bool {
                if anser {
                    self.view.backgroundColor = .orange
                    answerLabel.text = notiInfo["name"] as! String
                }else {
                    self.view.backgroundColor = .green
                    answerLabel.text = notiInfo["name"] as! String
                }
            }
        }
        
    }
    
    
    @IBAction func tonext(_ sender: UIButton) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? OptionsViewController
        vc?.selected = results(data:)
        
    }
    
    func results(data: [String : Any]){
        if let anser = data["answer"] as? Bool {
            if anser {
                self.view.backgroundColor = .orange
                answerLabel.text = data["name"] as? String
            }else {
                self.view.backgroundColor = .green
                answerLabel.text = data["name"] as? String
            }
        }
    }
    
}






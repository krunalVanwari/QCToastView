//
//  ViewController.swift
//  QCToastView
//
//  Created by Qurious Click on 27/04/22.
//

import UIKit
import QCToastView

class ViewController: UIViewController {

    let toastView = QCToastView.shared
    
    @IBOutlet weak var displayText:UITextField!
    @IBOutlet weak var segmentControl:UISegmentedControl!
    @IBOutlet weak var btnTextColor:UIButton!
    @IBOutlet weak var btnbackgroundColor:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showToastPressed(_ sender:Any) {
        
        var theme:QCToastView.ToastTheme {
            
            if segmentControl.selectedSegmentIndex == 0 {
                return .light
            } else if segmentControl.selectedSegmentIndex == 1 {
                return .dark
            } else {
                return .custom(textColor: btnTextColor.backgroundColor!, backgroundColor: btnbackgroundColor.backgroundColor!)
            }
        }
        
        toastView
            .theme(theme)
        
        toastView.showToast(message: displayText.text ?? "", vc: self)
    }


}


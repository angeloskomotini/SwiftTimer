//
//  MainScreen.swift
//  SwiftTimer
//
//  Created by Angelos Staboulis on 29/12/19.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    let utility = Utility()
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    var start:Bool!=false
    @IBAction func btnStart(_ sender: Any) {
        start = true
        if(start==true){
            utility.stopTimer = false
            utility.fireAll(hours: hours, minutes: minutes, seconds: seconds)
            btnStart.setTitle("Stop", for:.normal)
            start=false
        }
        if((btnStart.titleLabel?.text!.contains("Stop"))!){
            utility.stopTimer = true
            hours.text = "00"
            minutes.text = "00"
            seconds.text = "00"
            btnStart.setTitle("Start", for:.normal)
            start=true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
      
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

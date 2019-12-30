//
//  Utility.swift
//  SwiftTimer
//
//  Created by Angelos Staboulis on 29/12/19.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import Foundation
import UIKit
class Utility{
    var counterSeconds = Int()
    var counterMinutes = Int()
    var counterHours = Int()
    var stopTimer:Bool!=false
    func fireSeconds(lblHours:UILabel,lblMinutes:UILabel,lblSeconds:UILabel){
        Timer.scheduledTimer(withTimeInterval: 1 , repeats: true) { (timer) in
            if(self.stopTimer==true){
                self.counterSeconds = 0
                timer.invalidate()
            }
            if(self.counterSeconds > 59 ){
                self.counterSeconds = 0
                timer.invalidate()
                self.fireMinutes(hours:lblHours,minutes: lblMinutes, seconds: lblSeconds)

            }
            else{
                if(self.counterSeconds < 10 ){
                    lblSeconds.text = "0"+String(self.counterSeconds)
                }
                else{
                    lblSeconds.text = String(self.counterSeconds)
                }
                self.counterSeconds = self.counterSeconds + 1
                
            }
        }
        
    }
    func fireMinutes(hours:UILabel,minutes:UILabel,seconds:UILabel){
        if (((seconds.text?.contains("59"))!) && ((minutes.text?.contains("00"))!))
        {
                    self.counterMinutes = 1
                    minutes.text = "0"+String(self.counterMinutes)
                    self.fireSeconds(lblHours:hours,lblMinutes:minutes,lblSeconds:seconds)

        }
        else{
                    self.counterMinutes = self.counterMinutes + 1
                    if((self.counterMinutes == 59) && ((seconds.text?.contains("59"))!)){
                                self.counterMinutes = 0
                                self.counterSeconds = 0
                                self.fireHours(hours:hours,minutes:minutes,seconds:seconds)
                    }
                    else{
                                if(self.counterMinutes < 10){
                                    minutes.text = "0"+String(self.counterMinutes)
                                }
                                else{
                                    minutes.text = String(self.counterMinutes)
                                }
                                    self.fireSeconds(lblHours:hours,lblMinutes:minutes,lblSeconds:seconds)
                    }
        }
                              
        

       
    }
    func fireHours(hours:UILabel,minutes:UILabel,seconds:UILabel){
                self.counterHours = self.counterHours + 1
                if(self.counterHours < 10){
                    hours.text = "0"+String(self.counterHours)
                }
                else{
                    hours.text = String(self.counterHours)
                }
                
                self.fireMinutes(hours:hours,minutes:minutes,seconds:seconds)
               

                
    }
    func fireAll(hours:UILabel,minutes:UILabel,seconds:UILabel){
            self.fireSeconds(lblHours: hours, lblMinutes: minutes, lblSeconds: seconds)
    }
    
}

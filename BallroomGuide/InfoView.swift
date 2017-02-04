//
//  InfoViewController.swift
//  BallroomGuide
//
//  Created by Bowen Sun on 1/12/17.
//  Copyright © 2017 Bowen Sun. All rights reserved.
//

import UIKit

class InfoView: UIView{

    @IBOutlet weak var BPButton: UIButton!
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        if let superView = newSuperview{
            self.frame = superView.frame
        }
    }
    
    @IBAction func goToBP(){
        UIApplication.shared.openURL(URL(string : "https://appsto.re/us/QR_Leb.i")!)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

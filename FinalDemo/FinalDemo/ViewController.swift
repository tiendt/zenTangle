//
//  ViewController.swift
//  FinalDemo
//
//  Created by Tien Dao on 4/12/16.
//  Copyright © 2016 Tien Dao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = try! AVAudioPlayer (contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gong", ofType: "mp3")!))
    
    var timer = NSTimer()
    let timeDisplayInterval: NSTimeInterval = 0.5 //display time by updating time label
    
    var secondsToEndTimer: NSTimeInterval = 0.0 //hold users' timing choice in seconds
    
    var timeIntervalCounter: NSTimeInterval = 0.0 //counter for timer, keep track o timer to update label
    
    var checkIfTiming = false //check if timer is running
    
    //timer outlets
    
    @IBOutlet weak var timeDisplayLabel: UILabel!
    @IBOutlet weak var upOrDownSwitch: UISwitch!
    
    //button outlets
    
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button25: UIButton!
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button35: UIButton!
    @IBOutlet weak var button40: UIButton!
    @IBOutlet weak var button60: UIButton!
    @IBOutlet weak var button70: UIButton!
    @IBOutlet weak var button80: UIButton!
    @IBOutlet weak var button90: UIButton!
    
    //imageView outlets to hold highlighted buttons
    
    @IBOutlet weak var button15HighLighted: UIImageView!
    @IBOutlet weak var button20HighLighted: UIImageView!
    @IBOutlet weak var button25HighLighted: UIImageView!
    @IBOutlet weak var button30HighLighted: UIImageView!
    @IBOutlet weak var button35HighLighted: UIImageView!
    @IBOutlet weak var button40HighLighted: UIImageView!
    @IBOutlet weak var button60HighLighted: UIImageView!
    @IBOutlet weak var button70HighLighted: UIImageView!
    @IBOutlet weak var button80HighLighted: UIImageView!
    @IBOutlet weak var button90HighLighted: UIImageView!
    
    
       //startPause outlet
    
    @IBOutlet weak var startPauseOutlet: UIButton!
    
    //reset outlet
    
    @IBOutlet weak var resetOutlet: UIButton!
    
    //switch outlet
    
    @IBOutlet weak var countUpOrDownSwitch: UISwitch!
    
    //check the state of startPauseButton
    var startPauseButtonStateCheck = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add border to view
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.blackColor().CGColor
        //view.layer.borderColor = UIColor.cyanColor().CGColor
        
        //hide all hightlighted buttons
        
        button15HighLighted.hidden = true
        button20HighLighted.hidden = true
        button25HighLighted.hidden = true
        button30HighLighted.hidden = true
        button35HighLighted.hidden = true
        button40HighLighted.hidden = true
        button60HighLighted.hidden = true
        button70HighLighted.hidden = true
        button80HighLighted.hidden = true
        button90HighLighted.hidden = true
        
    }

    @IBAction func startPausePressed(sender: AnyObject) {
        
        if startPauseButtonStateCheck {
            let pause = UIImage (named: "pauseButton") as UIImage!
            startPauseOutlet.setImage(pause, forState: .Normal)
            startPauseButtonStateCheck = false
        }
        else {
            let start = UIImage (named: "start") as UIImage!
            startPauseOutlet.setImage(start, forState: .Normal)
            startPauseButtonStateCheck = true
        }
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(timeDisplayInterval, target: self, selector: "checkIfUserTimeIsReached:", userInfo: nil, repeats: true)
            timeDisplayLabel.text = formattedTimeString (timeIntervalCounter)
            checkIfTiming = true
        }
        else {
            timeDisplayLabel.text = formattedTimeString (timeIntervalCounter)
            timer.invalidate()
        }
    }
    
    func formattedTimeString (time: NSTimeInterval) -> String {
        let min = Int (time) / 60
        let secs = Int (time) % 60
        //let fracs = Int ((time = Double (secs)) * 10.0)
        return String (format: "%02i:%02i", min, secs)
    }
    
    func checkIfUserTimeIsReached (timer: NSTimer) {
        if upOrDownSwitch.on {
            timeIntervalCounter -= timeDisplayInterval
            
            if timeIntervalCounter <= 0 {
                timeDisplayLabel.text = "Session Finished"
                audioPlayer.play()
                
                timer.invalidate()
                checkIfTiming = false
                
                let start = UIImage (named: "start") as UIImage!
                startPauseOutlet.setImage(start, forState: .Normal)
            }
            
            else {
                timeDisplayLabel.text = formattedTimeString(timeIntervalCounter)
            }
        }
        
        else {
            timeIntervalCounter += timeDisplayInterval
            
            if timeIntervalCounter >= secondsToEndTimer {
                timeDisplayLabel.text = "Session Finished"
                audioPlayer.play()
                timer.invalidate()
                checkIfTiming = false
                
                let start = UIImage (named: "start") as UIImage!
                startPauseOutlet.setImage(start, forState: .Normal)

            }
            else {
                timeDisplayLabel.text = formattedTimeString(timeIntervalCounter)
            }

            
        }
    }
    
    @IBAction func timeSelectPressed(sender: AnyObject) {
        
        if sender.tag == 15 {
            setAllButtonSelectionsToNormal()
            button15.setImage(UIImage(named:"button15HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button15HighLighted.hidden = false
            secondsToEndTimer = 900
            resetTimer (self)
            
        }
        if sender.tag == 20 {
            setAllButtonSelectionsToNormal()
            button20.setImage(UIImage(named:"button20HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button20HighLighted.hidden = false
            secondsToEndTimer = 1200
            resetTimer (self)
            
        }
        if sender.tag == 25 {
            setAllButtonSelectionsToNormal()
            button25.setImage(UIImage(named:"button25HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button25HighLighted.hidden = false
            secondsToEndTimer = 1500
            resetTimer (self)
            
        }
        if sender.tag == 30 {
            setAllButtonSelectionsToNormal()
            button30.setImage(UIImage(named:"button30HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button30HighLighted.hidden = false
            secondsToEndTimer = 1800
            resetTimer (self)
            
        }
        if sender.tag == 35 {
            setAllButtonSelectionsToNormal()
            button35.setImage(UIImage(named:"button35HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button35HighLighted.hidden = false
            secondsToEndTimer = 2100
            resetTimer (self)
            
        }
        if sender.tag == 40 {
            setAllButtonSelectionsToNormal()
            button40.setImage(UIImage(named:"button40HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button40HighLighted.hidden = false
            secondsToEndTimer = 2400
            resetTimer (self)
            
        }
        if sender.tag == 60 {
            setAllButtonSelectionsToNormal()
            button60.setImage(UIImage(named:"button60HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button60HighLighted.hidden = false
            secondsToEndTimer = 3600
            resetTimer (self)
            
        }
        if sender.tag == 70 {
            setAllButtonSelectionsToNormal()
            button70.setImage(UIImage(named:"button70HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button70HighLighted.hidden = false
            secondsToEndTimer = 4200
            resetTimer (self)
            
        }
        if sender.tag == 80 {
            setAllButtonSelectionsToNormal()
            button80.setImage(UIImage(named:"button80HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button80HighLighted.hidden = false
            secondsToEndTimer = 4800
            resetTimer (self)
            
        }
        if sender.tag == 90 {
            setAllButtonSelectionsToNormal()
            button90.setImage(UIImage(named:"button90HighLighted"),forState: .Normal)
            highAllButtonSelectionsFromStartPauseButton ()
            button90HighLighted.hidden = false
            secondsToEndTimer = 5400
            resetTimer (self)
            
        }
        
    }
    
    func setAllButtonSelectionsToNormal () {
        button15.setImage(UIImage (named: "15"), forState: .Normal)
        button20.setImage(UIImage (named: "20"), forState: .Normal)
        button25.setImage(UIImage (named: "25"), forState: .Normal)
        button30.setImage(UIImage (named: "30"), forState: .Normal)
        button35.setImage(UIImage (named: "35"), forState: .Normal)
        button40.setImage(UIImage (named: "40"), forState: .Normal)
        button60.setImage(UIImage (named: "60"), forState: .Normal)
        button70.setImage(UIImage (named: "70"), forState: .Normal)
        button80.setImage(UIImage (named: "80"), forState: .Normal)
        button90.setImage(UIImage (named: "90"), forState: .Normal)

    }
    
    func highAllButtonSelectionsFromStartPauseButton () {
        
        button15HighLighted.hidden = true
        button20HighLighted.hidden = true
        button25HighLighted.hidden = true
        button30HighLighted.hidden = true
        button35HighLighted.hidden = true
        button40HighLighted.hidden = true
        button60HighLighted.hidden = true
        button70HighLighted.hidden = true
        button80HighLighted.hidden = true
        button90HighLighted.hidden = true
        
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        
        timer.invalidate()
        //heartBeadsTimer.invalidate()
        
        if upOrDownSwitch.on {
            timeIntervalCounter = secondsToEndTimer
            timeDisplayLabel.text = formattedTimeString(timeIntervalCounter)
        }
        else {
            timeIntervalCounter = 0.0
            timeDisplayLabel.text = formattedTimeString(timeIntervalCounter)
        }
        
        //heartBeadImageView.image = UIImage (named: "")
        checkIfTiming = false
        
        let start = UIImage (named: "start") as UIImage!
        startPauseOutlet.setImage(start, forState: .Normal)
        
        startPauseButtonStateCheck = true
    }
    
    @IBAction func resetUpOrDownSwitch(sender: AnyObject) {
    
        let start = UIImage(named: "start") as UIImage!
        startPauseOutlet.setImage(start, forState: .Normal)
        startPauseButtonStateCheck = true
        resetTimer(self)
    
    }
}


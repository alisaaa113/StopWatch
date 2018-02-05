//
//  ViewController.swift
//  StopWatch
//
//  Created by arisa isshiki on 2018/02/03.
//  Copyright © 2018年 alisa. All rights reserved.
//
//iii
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    var timer : Timer = Timer()
    
    //判定ラベル
    @IBOutlet var hanteiLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func up(){
        //count 0.01 足す
        count = count + 0.01
        //ラベルに小数点以下２桁まで
        label.text = String(format: "%.2f", count)
        
    }
    
    @IBAction func reset(){
        if timer.isValid{
            //タイマーが動いてたら停止
            timer.invalidate()
        }
        //初期化
        count = 0.0
        //countをlabelに表示
        label.text = String(format: "%.2f", count)
        
    }
    
    @IBAction func start(){
        
        if !timer.isValid{
            //タイマーが動いてなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        hanteiLabel.text = ""
        
    }
    
    @IBAction func stop(){
        
        if timer.isValid{
            timer.invalidate()
        }
        
        self.hantei()
        
    }
    func hantei(){
        if count > 9.80 && count < 10.20 {
            hanteiLabel.text = "PERFECT!"
        }
        else if count > 9.70 && count < 10.30 {
            hanteiLabel.text = "GREAT!"
        }
        else if count > 9.50 && count < 10.50 {
            hanteiLabel.text = "GOOD!"
        }
        else{
            hanteiLabel.text = "BAD!"
        }
        
        
        
    }
        
    

}


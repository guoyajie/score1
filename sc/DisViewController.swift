//
//  DisViewController.swift
//  sc
//
//  Created by mohoo on 14/8/7.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//

import Foundation
import UIKit

class DisViewController: UIViewController {
  
    var array = ["IP", "国家/地区", "省份", "城市", "运营商"]
    var ipAdr = NSDictionary()
    var dict = ["ip","country","region", "city","isp"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(red: CGFloat(0.67050072360000001), green: CGFloat(0.91576086960000003), blue: CGFloat(0.8605601772), alpha: 1.0)
        
        /*var nameLabel = UILabel()
        nameLabel.frame = CGRectMake(15.0, 20.0, 40.0, 20.0)
        nameLabel.text = "IP:"
        nameLabel.font = UIFont(name:nil, size:12.0)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(nameLabel)*/
       
        for index in 1...5 {
            var gradeLabel = UILabel()
            gradeLabel.frame = CGRectMake(15.0, CGFloat(index*25.0), 60.0, 20.0)
            gradeLabel.text = array[index-1]
            gradeLabel.font = UIFont(name:nil, size:12.0)
            gradeLabel.textColor = UIColor.whiteColor()
            gradeLabel.backgroundColor = UIColor(red: CGFloat(0.5), green: CGFloat(0.9), blue: CGFloat(0.5), alpha:1.0)
            self.view.addSubview(gradeLabel)
            
        }
        displayData()
        
        var backButton = UIButton()
        backButton.frame = CGRectMake(15.0,CGFloat(25.0*7),40,20)
        backButton.backgroundColor = UIColor(red: CGFloat(0.45), green:CGFloat(0.6), blue: CGFloat(0.45), alpha: 1.0)
        backButton.setTitle("Back", forState:.Normal)
        backButton.titleLabel.font = UIFont.systemFontOfSize(10)
        backButton.addTarget(self, action: "turnBack",forControlEvents:.TouchUpInside)
        self.view.addSubview(backButton)
       
    }
    
    //设置返回按钮
    
    func turnBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    func displayData(){
        var ipdata=ipAdr.objectForKey("data") as NSDictionary
        for index in 1...5 {
            var gradeLabel = UILabel()
            gradeLabel.frame = CGRectMake(80.0, CGFloat(index*25.0), 120.0, 20.0)
            gradeLabel.text = String(ipdata[dict[index-1]] as NSString)
            gradeLabel.font = UIFont(name:nil, size:12.0)
            gradeLabel.textColor = UIColor.whiteColor()
            gradeLabel.backgroundColor = UIColor(red: CGFloat(0.5), green: CGFloat(0.9), blue: CGFloat(0.5), alpha:1.0)
            self.view.addSubview(gradeLabel)
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


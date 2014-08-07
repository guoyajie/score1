//
//  ViewController.swift
//  sc
//
//  Created by mohoo on 14/8/7.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    
    var ipAd=NSDictionary()
    

    @IBOutlet weak var IP: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
 /*   override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }*/

    
    @IBAction func search(sender: AnyObject) {
        
        IPSearch(IP.text)
    }
    
    func IPSearch(userid:String){
        var userint = IPJudge(userid)
        if  userint == 1
        {
            var alert = UIAlertController(title: "提示", message: "输入地址格式错误！", preferredStyle: .Alert)
            var actionback = UIAlertAction(title: "重新输入", style: .Default, handler: {act in
                self.dismissViewControllerAnimated(true, completion: nil)
                })
            alert.addAction(actionback)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            
            let url=NSURL(string:"http://ip.taobao.com/service/getIpInfo.php?ip=\(userid)")
            var data = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingUncached, error:nil)
            var json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
            //var ipInfo: AnyObject! = json.objectForKey("code")
            //ipAd = ipInfo as NSDictionary
            
            let disView = DisViewController()
            disView.ipAdr = json as NSDictionary
            
            self.presentViewController(disView , animated: true, completion: nil)
            
        }
    }

    
    func IPJudge(ip:String)->Int
        
    {
        var flag=0
        var a=[String]()
     
        
        var i = 0
        a.append("")
        
        for item  in ip
        {
            if item != "."
        {
            a[i] = a[i]+item
            
        }
            else{
            i=i+1
            a.append("")
            }
        }
        
        if i != 3{
        flag=1
        return flag
        }
        for j in 0...i{
                
            var ipint = a[j].toInt()
            if ipint>=0 && ipint<=255{
              continue
            }
            else{
            flag=1
            break
            }
        }
        return flag
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }


}


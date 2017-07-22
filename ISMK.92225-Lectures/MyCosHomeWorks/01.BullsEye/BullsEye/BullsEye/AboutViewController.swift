//
//  AboutViewController.swift
//  BullsEye
//
//  Created by coskun on 3.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var btnAboutClose: UIButton!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var txtTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = NSBundle.mainBundle().URLForResource("BullsEye", withExtension: "html") {
            if let htmlData = NSData(contentsOfFile: url.path!){
                let baseURL = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
            
        }
        //Get version number
        let nsObj: AnyObject? = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] // CFBundleShortVersionString
        txtTitle.text = " Bull's Eye v.\((nsObj as! String)) writen by Coskun Caner"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAboutClose_Clicked(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

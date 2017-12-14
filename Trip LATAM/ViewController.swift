//
//  ViewController.swift
//  Trip LATAM
//
//  Created by Mobile Developer on 12/6/17.
//  Copyright © 2017 Mobile Developer. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    let urlString = "https://pilotoslatam.com"
    let compareString = "https://pilotoslatam.com/wp-admin/"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        webView.delegate = self
        displayWebView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayWebView() {
        
        let encodingString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print(encodingString)
        
        if let url = URL(string: encodingString)   {
            let request = URLRequest(url: url as URL)
            webView.loadRequest(request)
        }
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadingStart()
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        loadingEnd()
    }

    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        if compareString == (webView.request?.url?.absoluteString)! {
            print((webView.request?.url?.absoluteString)!)
            displayWebView()
        }
        loadingEnd()
    }

    func loadingStart() {
        let animationGif = UIImage.gifImageWithName("animation")
        let imageView = UIImageView(image: animationGif)
        imageView.frame = CGRect(x: (self.webView.bounds.width)/2 - 30, y: (self.webView.bounds.height + 20)/2 - 30, width: 60, height: 60)
        imageView.tag = 100
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = UIColor.white
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        webView.addSubview(imageView)

    }

    func loadingEnd() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }

    }
}


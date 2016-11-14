//
//  ViewController.swift
//  Download image from web
//
//  Created by Akash Singhal on 14/11/16.
//  Copyright © 2016 Akash Singhal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bachImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://www.wikipedia.org/portal/wikipedia.org/assets/img/Wikipedia-logo-v2@2x.png")!
        
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error ?? "Some Error is there!")
            } else {
                if let data = data {
                    if let bachImage = UIImage(data: data) {
                        self.bachImageView.image = bachImage
                    }
                }
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


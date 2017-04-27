//
//  SwitchingViewController.swift
//  iKid
//
//  Created by Personal on 4/27/17.
//  Copyright © 2017 Ena Markovic. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    fileprivate var jokeViewController: JokeViewController!
    fileprivate var punchlineViewController: PunchlineViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViews(_ sender: Any) {
        print("called switch")
    }
    
    fileprivate func jokeBuilder() {
        if jokeViewController == nil {
            jokeViewController = storyboard?.instantiateViewController(withIdentifier: "JokeView") as! JokeViewController
        }
    }
    
    fileprivate func punchlineBuilder() {
        if punchlineViewController == nil {
            punchlineViewController = storyboard?.instantiateViewController(withIdentifier: "PunchlinView") as! PunchlineViewController
        }
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

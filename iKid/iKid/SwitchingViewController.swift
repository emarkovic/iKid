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
    
    fileprivate var jokes : [String] = ["Why do hamburgers go to the gym?", "Have you ever tried to eat a clock?", "Me: 'Hey, I was thinging...'"]
    fileprivate var punchlines : [String] = ["To get better buns!", "It's very time consuming.", "Data: 'I thought I smelled something burning.'"]
    fileprivate var currentJoke : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        jokeBuilder()
        if jokeViewController != nil {
            self.addChildViewController(jokeViewController!)
            self.view.insertSubview(jokeViewController!.view, at: 0)
            jokeViewController!.didMove(toParentViewController: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if jokeViewController != nil {
            jokeViewController?.dismiss(animated: true, completion: nil)
        }
        if punchlineViewController != nil {
            punchlineViewController?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        print("called switch")
        
        punchlineBuilder()
        jokeBuilder()
        
        if jokeViewController != nil && jokeViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punchlineViewController.view.frame = view.frame
            switchViewController(jokeViewController, to: punchlineViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            jokeViewController.view.frame = view.frame
            switchViewController(punchlineViewController, to: jokeViewController)
        }
    }
    
    fileprivate func jokeBuilder() {
        if jokeViewController == nil {
            jokeViewController = storyboard?.instantiateViewController(withIdentifier: "JokeView") as! JokeViewController
            jokeViewController.joke = jokes[currentJoke]
        }
    }
    
    fileprivate func punchlineBuilder() {
        if punchlineViewController == nil {
            punchlineViewController = storyboard?.instantiateViewController(withIdentifier: "PunchlineView") as! PunchlineViewController
            punchlineViewController.punchline = punchlines[currentJoke]
        }
    }
    @IBAction func goodJokePressed(_ sender: Any) {
        currentJoke = 0
    }
    
    @IBAction func punPressed(_ sender: Any) {
        currentJoke = 1
    }
    
    @IBAction func dadJokePressed(_ sender: Any) {
        currentJoke = 2
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

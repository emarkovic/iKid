//
//  PunchlineViewController.swift
//  iKid
//
//  Created by Personal on 4/27/17.
//  Copyright © 2017 Ena Markovic. All rights reserved.
//

import UIKit

class PunchlineViewController: UIViewController {

    @IBOutlet weak var punchlineLabel: UILabel!
    var punchline : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if punchline != nil {
            punchlineLabel.text = punchline!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabel() {
        if punchline != nil && punchlineLabel != nil {
            punchlineLabel.text = punchline!
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

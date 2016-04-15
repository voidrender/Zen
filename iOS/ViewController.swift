//
//  ViewController.swift
//  iOS
//
//  Created by Isaac Overacker on 4/15/16.
//
//

import UIKit
import Moya

class ViewController: UIViewController {

    @IBOutlet weak var zenLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func zenButtonTapped(sender: UIButton) {
        GitHubProvider.request(.Zen) { result in
            switch result {
            case let .Success(response):
                do {
                    try response.filterSuccessfulStatusCodes()
                    self.zenLabel.text = try response.mapString()
                } catch {
                    print("Non-success status code returned from zen.")
                }
            case let .Failure(error):
                print("Failed to fetch zen from GitHub: \(error)")
            }
        }
    }

}


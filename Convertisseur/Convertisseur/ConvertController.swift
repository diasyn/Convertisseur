//
//  ConvertController.swift
//  Convertisseur
//
//  Created by didier arrigoni on 03.09.18.
//  Copyright © 2018 Didier Arrigoni. All rights reserved.
//

import UIKit

class ConvertController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var entryView: UIView!
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!





    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeButton(_ sender: UIButton) {
    }


    @IBAction func backAction(_ sender: Any) {
    }

    @IBAction func textChanged(_ sender: Any) {
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

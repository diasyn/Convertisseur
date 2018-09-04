//
//  ViewController.swift
//  Convertisseur
//
//  Created by didier arrigoni on 03.09.18.
//  Copyright © 2018 Didier Arrigoni. All rights reserved.
//

import UIKit

// on a besoin de constantes accessibles tout le long de ce controller
let DEVISE = "devise"
let TEMPERATURE = "température"
let DISTANCE = "distance"

class ViewController: UIViewController {

    @IBOutlet weak var deviseView: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var temperatureView: UIView!

    let segueID = "ConvertSegue"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // on vérifie que l'identifiant de la segue correspond et que la destination de la segue soit bien du type de la classe du deuxième viewController
        if segue.identifier == segueID {
            if let vc = segue.destination as? ConvertController {
                // si la destination est la bonne, on va pouvoir ajouter des paramètres propres au deuxième Controller (ConvertController)
                vc.type = sender as? String
            }
        }
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0: performSegue(withIdentifier: segueID, sender: DEVISE)
        case 1: performSegue(withIdentifier: segueID, sender: DISTANCE)
        case 2: performSegue(withIdentifier: segueID, sender: TEMPERATURE)
        default:
            break
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

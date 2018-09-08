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
    // Ces valeurs d'Outlets ne sont créées qu'à partir du ViewDidload
    @IBOutlet weak var deviseView: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var temperatureView: UIView!

    let segueID = "ConvertSegue"

    // pour stocker les vues. On ne peut pas leur attribuer une valeur avant la création des Outlets. On ne les enregistre pas ici directement, mais dans ViewDidload, car c'est en lien avec le cycle de vie d'un UIViewController
    var views:[UIView] = [] // création de la variable du tableau

    override func viewDidLoad() {
        super.viewDidLoad()
        views = [deviseView, distanceView, temperatureView] // remplissage du tableau ou par trois views.append(deviseView) successifs
        // on appelle la fonction pour les angles
        arrondirAngles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func arrondirAngles() {
        for view in views {
            view.layer.cornerRadius = 10
        }
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

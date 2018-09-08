//
//  ConvertController.swift
//  Convertisseur
//
//  Created by didier arrigoni on 03.09.18.
//  Copyright © 2018 Didier Arrigoni. All rights reserved.
//

import UIKit

class ConvertController: UIViewController {

    // MARK: Variables et outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var entryView: UIView!
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!

    // propriétés des calculs et pour la possibilité d'inversion
    var isReverse = false
    var euro = "euro"
    var dollar = "dollar"
    var km = "km"
    var miles = "miles"
    var celsius = "celsius"
    var fahrenheit = "fahrenheit"
    let format = "%.2f" // avec 2 chiffres après la virgule

    // cette propriété va servir de "conteneur" pour stocker temporairement une valeur, qui sera le tag du sender > comme on en a 3 au départ, il faut les différencier !

    var type: String?
    var views: [UIView] = []

    // MARK: - Méthodes override de classe
    override func viewDidLoad() {
        super.viewDidLoad()
        // on envoie une String Optionnelle avec la variable type, mais il va falloir la vérifier
        if let choix = type {
            views.append(contentsOf: [entryView, resultView])
            arroondirAngles()
            typeChoisi(choix)
        } else {
            dismiss(animated: true, completion: nil)
        }

        // pour faire disparaitre le clavier
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Méthodes du projet

    // on crée une fonction pour rentrer le clavier
    @objc func hideKeyboard() {
        // on finit d'éditer avec le clavier et on veut le rentrer
        view.endEditing(true)
    }

    func arroondirAngles() {
        for view in views {
            view.layer.cornerRadius = 20
        }
    }

    func setUp(_ firstValue: String, _ secondValue: String) {
        // on vérifie d'abord le sens du calcul
        if !isReverse {
            titleLabel.text = "Convertir " + firstValue + " en " + secondValue
            toDoLabel.text = "Somme à convertir:"

        } else {
            titleLabel.text = "Convertir en " + secondValue + " en " + firstValue
            toDoLabel.text = "Somme à convertir:"

        }
    }

    // on crée cette fonction afin de pouvoir l'appeler dans la fonction reverse
    func typeChoisi(_ choix: String) {
        switch choix {
        case DEVISE: setUp(euro, dollar)
        case DISTANCE: setUp(km, miles)
        case TEMPERATURE: setUp(celsius, fahrenheit)
        default: break
        }
    }

    // MARK: - Partie logique
    func calculate()  {
        // on teste d'abord si type est différent de nil, ensuite s'il y a du texte dans le champ texte et enfin si ce texte est convertible en Double
        if let monType = type, let texte = toDoTextField.text, let float = Float(texte) {
            // on va créer un Switch pour les différents cas
            switch monType {
            case DEVISE:
                // on interroge isReverse par l'intermédiaire du ? et ensuite, s'il est vrai, alors on converti avec la première méthode, sion avec la deuxième
                resultLabel.text = isReverse ? euro(float) : dollar(float)

            case DISTANCE:
                resultLabel.text = isReverse ? km(float) : miles(float)

            case TEMPERATURE:
                resultLabel.text = isReverse ? celsius(float) : fahrenheit(float)

            default: break
            }

        }
    }

    func dollar(_ euro: Float) -> String {
        return String(format: format, (euro / 0.81)) + " $"
    }

    func euro(_ dollar: Float) -> String {
        return String(format: format, (dollar * 0.81)) + " €"
    }

    func km(_ miles: Float) -> String {
        return String(format: format, (miles * 0.621)) + " km"
    }

    func miles(_ km: Float) -> String {
        return String(format: format, (km / 0.621)) + " miles"
    }

    func celsius(_ fahrenheit: Float) -> String {
        return String(format: format, ((fahrenheit - 32) / 1.8)) + " C"
    }

    func fahrenheit(_ celsius: Float) -> String {
        return String(format: format, ((celsius * 1.8) + 32)) + "  F"
    }

    // MARK: - Actions
    @IBAction func changeButton(_ sender: UIButton) {
        // il faut être sur que le type existe, donc on fait le guard
        guard type != nil else {return}
        isReverse = !isReverse
        typeChoisi(type!)
        calculate()
    }

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // on change le type d'action afin que l'on puisse encore changer l'editing du texte.
    @IBAction func textChanged(_ sender: Any) {
        calculate()
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

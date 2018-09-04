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

    // cette propriété va servir de "conteneur" pour stocker temporairement une valeur, qui seera le tag du sender > comme en a 3 au départ, il faut les différencier !
    var type: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // on envoie une String Optionnelle avec la variable type, mais il va falloir la vérifier
        guard let choix = type else { return }
        // on place ce qui va s'afficher dans le titleLabel
        titleLabel.text = "Convertisseur de " + choix

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeButton(_ sender: UIButton) {
    }

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // on change le type d'action afin que l'on puisse encore changer l'editing du texte.
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

//
//  DetalleBebida.swift
//  Bartender
//
//  Created by Guillermo Alonso on 06/10/16.
//  Copyright © 2016 cep.UNAMMemosCorp. All rights reserved.
//

import UIKit

class DetalleBebida: UIViewController {

    var info:NSDictionary?

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var imgImagen: UIImageView!
    @IBOutlet weak var txtIngredientes: UITextView!
    @IBOutlet weak var txtInstrucciones: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        var infoCompleta:NSMutableString
        self.lblTitulo.text = self.info!["name"] as? String
        self.imgImagen.image = UIImage(named: self.info!["image"] as! String)
        self.imgImagen.contentMode = UIViewContentMode(rawValue: 0)!
        infoCompleta = "Ingredientes\n"
        infoCompleta.appendString("* \(self.info!["ingredients"] as! String)\n")
        self.txtIngredientes.text = infoCompleta as String
        infoCompleta = "Instrucciones\n"
        infoCompleta.appendString("* \(self.info!["directions"] as! String)\n")
        self.txtInstrucciones.text = infoCompleta as String
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

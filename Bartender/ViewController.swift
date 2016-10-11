//
//  ViewController.swift
//  Bartender
//
//  Created by Guillermo Alonso on 04/10/16.
//  Copyright © 2016 cep.UNAMMemosCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblInicio: UILabel!
    @IBOutlet weak var lblBienvenidos: UILabel!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var scrollview: UIScrollView!
    var tecladoArriba:Bool = false
    @IBAction func btnIngresar(sender: AnyObject) {
        var mensajeError:String = ""
        if self.txtUsuario.text == "" {
            mensajeError = "Hace falta ingresar el usuario!!!"
        }else if self.txtPwd.text == "" {
            mensajeError = "Hace falta ingresar la contraseña!!!"
        }
        if mensajeError != "" {
            let ac:UIAlertController = UIAlertController(title: "Error", message: mensajeError, preferredStyle: .Alert)
            let bc:UIAlertAction = UIAlertAction(title: "Aceptar", style: .Default, handler: nil)
            ac.addAction(bc)
            self.presentViewController(ac, animated: true, completion: nil)

        }else{
            self.performSegueWithIdentifier("bebidas", sender: self)
        }
    }
    @IBAction func tap(sender: AnyObject) {
        for unView:UIView in self.scrollview.subviews {
            if unView.isKindOfClass(UITextField) {
                if (unView as! UITextField).isFirstResponder() {
                    (unView as! UITextField).resignFirstResponder()
                }
            }
        }
    }

    @objc func tecladoAparece(laNotificacion:NSNotification) {
        if tecladoArriba {
            return
        }else{
            self.ajustascroll(true,laNotificacion: laNotificacion)
        }
    }
    @objc func tecladoDesaparece(laNotificacion:NSNotification) {
        self.ajustascroll(false, laNotificacion: laNotificacion)
    }
    func ajustascroll(aumenta:Bool,laNotificacion:NSNotification) {
        let info:NSDictionary = laNotificacion.userInfo!
        let value = info.valueForKey(UIKeyboardFrameEndUserInfoKey)
        let frameDelTeclado:CGRect = value!.CGRectValue()
        var tamanio:CGSize = self.scrollview.contentSize
        if aumenta {
            tamanio.height += frameDelTeclado.size.height
        }else{
            tamanio.height -= frameDelTeclado.size.height
        }
        self.scrollview.contentSize = tamanio
        tecladoArriba = aumenta
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let maxY:CGFloat = CGRectGetMaxY(self.txtPwd.frame)
        let ancho:CGFloat = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let nvoSize:CGSize = CGSizeMake(ancho, maxY+30.0)
        self.scrollview.contentSize = nvoSize
        self.lblBienvenidos.font = UIFont(name: "WaltDisneyScript", size: 35.0)
        self.lblInicio.font = UIFont(name: "WaltDisneyScript", size: 25.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(tecladoAparece(_:)), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(tecladoDesaparece(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    /*
 -(void) viewDidAppear:(BOOL)animated{
 //Es cuando la vista ya apareció
 NSLog(@"Es cuando la vista ya apareció");
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tecladoAparece:) name:UIKeyboardDidShowNotification object:nil
 ];//Siempre regresa un objeto NSNitification
 //Con los dos puntos ene l selector nos dice que va a recibir un patámetro.
 
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tecladoDesaparece:) name:UIKeyboardWillHideNotification object:nil];
 }
*/

}


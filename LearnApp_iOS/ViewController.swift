//
//  ViewController.swift
//  LearnApp_iOS
//
//  Created by Kamil Strąk on 13.03.2017.
//  Copyright © 2017 Kamil Strąk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CryptoSwift

let RestAdress: String = "http://62.21.41.97:9810/api/"


class ViewController: UIViewController {

    
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var regesterButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
  
    //let RestAdress: String = "http://62.21.41.97:9810/api/"
    var UzytkownicyLogin = [[String:Any]]()

    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
       // let userParams = getLogin()
       // debugPrint(userParams)
       // request(userParams: userParams)
        debugPrint("O Chuj działa")
        loginText.text = "O Chuj działa!"
        
        
      // performSegue(withIdentifier: "segueLogin", sender: self)
        }
   
    @IBAction func regesterButton(_ sender:UIButton) {
        
        debugPrint("O Chuj działa")
        loginText.text = "O Chuj działa!"
        
        
        
        //performSegue(withIdentifier: "segueRegister", sender: self)
        
    }
    
    @IBAction func aboutButton(_ sender: UIButton){
    
        debugPrint("O Chuj działa")
        loginText.text = "O Chuj działa!"
    }
    
    
    func getLogin() -> [String] {
        var paramsUser = [String]()
        let userLogin = loginText.text
        let userPassword = passwordText.text
        
        paramsUser.append(userLogin!)
        paramsUser.append(userPassword!)
        
        return paramsUser
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
                if identifier == "segueRegister" {
                    if passwordText.text == "dupa" {
                    return true }
                    else{
                        return false}
        }
       return true
    }
       
    
    
    func request(userParams: [String]) {
        
        debugPrint(userParams)
        Alamofire.request( RestAdress + "UzytkownicyLogin?name=" + userParams[0], method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            
            switch(response.result){
                
            case .success(_):
                //debugPrint(response)
                
                let UzytkownicyLogin = JSON(response.result.value!)
                
                debugPrint(UzytkownicyLogin)
                //Sprawdzić, czy działa, bo Ryba wyłączył resta
                let arrayNames =  UzytkownicyLogin.arrayValue.map({$0["login"].stringValue})
                //  let Uzytkownicy = UzytkownicyLogin["login"].stringValue
                
                //    let dataArray = UzytkownicyLogin["data"] as? [[String:Any]] {
                //    let nameArray = dataArray.flatMap { $0["name"] as? String }
                //     print(nameArray)
                debugPrint(arrayNames)
                //  debugPrint(UzytkownicyLogin)
                break
                
                
            //UIAlertAction - wyświetlanie alertów i innych podobnych - pamiętać
            case .failure(_):
                let alert = UIAlertController(title: "Brak połączenia", message: "Nie można pobrać danych \n Sprawdź połączenie z Internetem", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Zamknij", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                //debugPrint(response.result.error ?? "Nie można pobrać zawartości bazy")
                break
                
            }
            
            
            //if let jsonDict = response.result.value as? [String:Any],
            //   let dataArray = jsonDict[""] as? [[String:Any]] {
            //  let nameArray = dataArray.flatMap { $0["login"] as? String }
            
            //    self.label1.text = "Bla Bla Bla"
            //  self.label1.text = nameArray[0]
            
            // print(nameArray)
            //}
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
         //Nadanie przyciskom zakrzywień
        loginButton.layer.cornerRadius = 4
        regesterButton.layer.cornerRadius = 4
        aboutButton.layer.cornerRadius = 4
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Nadanie przyciskom zakrzywień
        //loginButton.layer.cornerRadius = 4
        //regesterButton.layer.cornerRadius = 4
        //aboutButton.layer.cornerRadius = 4
        //loginButton.isEnabled = false
     
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


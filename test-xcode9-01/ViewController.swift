//
//  ViewController.swift
//  test-xcode9-01
//
//  Created by Alain on 17-06-05.
//  Copyright © 2017 Alain. All rights reserved.
//
// Ceci est la branche du design ...

import UIKit

let URLuneCitation = "http://prof-tim.cstj.qc.ca/cours/xcode/sources/apitim.php?mode=rnd&quant=20&format=json"

struct CuriosityLog: Codable {
    enum Discovery: String, Codable {
        case rock, water, martian
    }
    
    var sol: Int
    var discoveries: [Discovery]
}


class ViewController: UIViewController {
    let couleurFond = "thatYiarkColor"
    let json = """
                { "le_nom" : "Moi Toi",
                  "email": "moi@moi.com"
                }
                """
    
    struct KeKun : Codable {
        var le_nom:String
        var email:String
    }
    
    struct Info : Codable  {
        var API_TIM:String
        var type_requete:String
    }
    
    struct Resultat: Codable {
        var nom_ajout: String
        var created_at: String
        var adresse_ip: String
        var pensee_texte: String
        var pensee_auteur: String
        var pensee_lien_image: String
    } // Resultat
    
    struct RésultatRequeteCitation : Codable {
        var info:Info
        var resultat: [Resultat]
    } // RésultatRequeteCitation
    
    //MARK:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: couleurFond)
        print(_PI, MesGloblales.mo, MesGloblales.yo)
        
        let xx:String? = "yo"
        
        guard let xxx = xx else {
            print("Erreur:  xx est nil")
            return
        }
        print("xxx = \(xxx)")
        
        // conversion if then en switch
        for _ in 0...50 {
            let i = arc4random_uniform(10)
            print (i, terminator: ", ")
        }
        
        NSLog("x = %@", "yo");
        
        let i = arc4random_uniform(10)
        
        if i == 0 {
            print()
        }
        else {
            if i == 1 {}
            else
            {
                if i == 2 {}
            }
        }
        
        testerJson()
        
        // Create a log entry for Mars sol 42
        let logSol42 = CuriosityLog(sol: 42, discoveries: [.rock, .rock, .rock, .rock])
        
        print(logSol42 )
        /// ##
        let jsonEncoder = JSONEncoder() // One currently available encoder
        
        // Encode the data
        let jsonData = try! jsonEncoder.encode(logSol42)
        // Create a String from the data
        let jsonString = String(data: jsonData, encoding: .utf8) // "{"sol":42,"discoveries":["rock","rock","rock","rock"]}"
        print(jsonString as Any)
        
        print(json)
        let unDécodeur = JSONDecoder()
        let personne = try!unDécodeur.decode(KeKun.self, from: json.data(using: .utf8)!)
        print(personne)
        
        // Animer un carré
        let carré = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        carré.backgroundColor = UIColor.red
        view.addSubview(carré)
        UIView.animate(withDuration: 3) {
            carré.frame = carré.frame.offsetBy(dx: 200, dy: 0)
        }
        
        print("fin viewDidLoad")
    } // viewDidLoad
    
    func testerJson(){
        if let _données = NSData(contentsOf: URL(string: URLuneCitation)!) as Data? {
            //print(_données as NSData)
            let unDécodeur = JSONDecoder()
            let citations = try!unDécodeur.decode(RésultatRequeteCitation.self, from: _données)
            for (index, citation) in citations.resultat.enumerated() {
                print("citation \(index + 1) - \(citation.pensee_texte)\n")
            } // for
        } // if let
    } // testerJson
    
    func nulle() {
        
        // Démo 1
        
        
    }
    
} // ViewController


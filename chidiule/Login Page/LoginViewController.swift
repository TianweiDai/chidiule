//
//  LoginViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/12.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登陆"

        self.navigationController?.isNavigationBarHidden = false
        
        let menuSignupBtn = UIButton(type: .system)
        menuSignupBtn.setTitle("注册", for: .normal)
        menuSignupBtn.addTarget(self, action: #selector(openSignupPage), for: .touchDown)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuSignupBtn)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        // Do any additional setup after loading the view.
    }
    

    

    @IBAction func loginButton(_ sender: Any) {
        let username = _username.text
        let password = _password.text
        if(username == "" || password == ""){
            return
        }
        doLogin(username!, password!)
        
        
    }
    @objc func openSignupPage() {
        let dstVC = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(dstVC, animated: true)

    }
    
    func doLogin(_ user: String, _ psw: String){
        let url = URL(string: "http://ec2-54-183-149-40.us-west-1.compute.amazonaws.com/api/search")
        let params : [String : String] = ["ca" : "1"]
        Alamofire.request(url!, method: .get, parameters: params).responseJSON { (response) in
            if response.result.isSuccess{
                print("suceess!")
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
        
    }
}

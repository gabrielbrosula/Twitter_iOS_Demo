//
//  loginViewController.swift
//  Twitter
//
//  Created by Gabriel Brosula on 9/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Check if the user is logged in when the view has appeared
        if(UserDefaults.standard.bool(forKey: "userLoggedIn")) == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        // Calls the TwitterAPICaller file to log in
        // If it works, the segue from login to home is performed
        // If it doesn't work, prints an error message
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            // Storing a true value of whether or not user is logged in
            // This is a NOTE that states whether or not a user is logged in
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            print("Could not login!")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

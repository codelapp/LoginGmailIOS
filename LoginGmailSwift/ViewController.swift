import UIKit
import GoogleSignIn
class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    var name : String!
    var email : String!
    var image : URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("error en el login", error.localizedDescription)
        }else{
            name = user.profile.name
            email = user.profile.email
            image = user.profile.imageURL(withDimension: 400)
            performSegue(withIdentifier: "enviar", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar"{
            let destino = segue.destination as! InicioViewController
            destino.name = name
            destino.email = email
            destino.image = image
        }
    }


}


import UIKit
import GoogleSignIn
class InicioViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var correo: UILabel!
    
    var name : String!
    var email : String!
    var image : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombre.text = name
        correo.text = email
        let datos = try? Data(contentsOf: image)
        imagen.image = UIImage(data: datos!)
    }

   
    @IBAction func salir(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        dismiss(animated: true, completion: nil)
    }
    
}

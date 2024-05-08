//
//  JuegosViewController.swift
//  PonceGomezColeccionDeJuegos
//
//  Created by Abel Alejandro Ponce Gomez on 8/05/24.
//

import UIKit

class JuegosViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var JuegoImageView: UIImageView!
    @IBOutlet weak var tituloTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    @IBAction func fotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func camaraTapped(_ sender: Any) {
    }
    
    @IBAction func agregarTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as!
                       AppDelegate).persistentContainer.viewContext
        let juego = Juego(context: context)
        juego.titulo = tituloTextField.text
        juego.imagen = JuegoImageView.image?.jpegData(compressionQuality: 0.50)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
            let imagenSeleccionada = info[.originalImage] as? UIImage
            JuegoImageView.image = imagenSeleccionada
            imagePicker.dismiss(animated: true,completion: nil)
        }
    
}

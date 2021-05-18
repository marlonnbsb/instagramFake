//
//  PostTableViewCell.swift
//  InstagramFake
//
//  Created by Marlon Machado on 18/05/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    static let kReuseIdentifier = "PostTableViewCell"
    
    @IBOutlet weak var fotoPerfil: UIImageView!
    @IBOutlet weak var nomeUsuario: UILabel!
    @IBOutlet weak var FotoPost: UIImageView!
    
    @IBOutlet weak var tituloESubtitulo: UILabel!
    
    
    @IBAction func btnOpcoes(_ sender: Any) {
    }
    
    @IBAction func btnSeguir(_ sender: Any) {
    }
    
    
    @IBAction func btnCurtir(_ sender: Any) {
    }
    
    
    @IBAction func btnComentar(_ sender: Any) {
    }
    
    @IBAction func btnCompartilhar(_ sender: Any) {
    }
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: "PostTableViewCell", bundle: Bundle(for: PostTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with data: Post) {
        nomeUsuario.text = "Marlon"
        
        fotoPerfil.image = UIImage(data: try! Data(contentsOf: URL(string: "https://picsum.photos/120/120")!))
        
        let width = Int(UIScreen.main.nativeBounds.size.width)
        let height = Int(width * (16/9))
        
        FotoPost.image = UIImage(data: try! Data(contentsOf: URL(string: "https://picsum.photos/\(width)/\(height)")!))
        
        tituloESubtitulo.text = "\(data.title). \n\(data.body)."
        
    }
}

//
//  DetailViewController.swift
//  DictionaryTemplate
//
//  Created by Cuneyt on 22.09.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var englishWord: UILabel!
    @IBOutlet weak var turkishWord: UILabel!
    var words:Words?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let w = words{
            englishWord.text = w.ingilizce
            turkishWord.text = w.turkce
        }

        // Do any additional setup after loading the view.
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

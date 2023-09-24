//
//  ViewController.swift
//  DictionaryTemplate
//
//  Created by Cuneyt on 22.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var list:[Words] = [Words(kelime_id: 1,inglizce: "Door", Turkce: "Kapı"),Words(kelime_id: 2,inglizce: "Apple", Turkce: "Elma")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell=tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath) as! WordTableViewCell
        let word = list[indexPath.row]
        
        cell.englishLabel.text=word.inglizce
        cell.turkishLabel.text=word.Turkce
        
    return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
}
extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}


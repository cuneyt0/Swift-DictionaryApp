//
//  ViewController.swift
//  DictionaryTemplate
//
//  Created by Cuneyt on 22.09.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var list = [Words]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        fetchWords()
        
       
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        
        let VC = segue.destination as! DetailViewController
        
        VC.words = list[index!]
        
    }
    
    func fetchWords(){
        print("Çalıştı")
        AF.request("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php",method: .get).response{
            response in
            if let data = response.data {
                do {
                    let dataResponse =  try JSONDecoder().decode(ResponseWord.self, from: data)
                    
                    if let wordList = dataResponse.kelimeler {
                        self.list = wordList
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func search(word:String){
        print("Çalıştı")
        
        let parameters : Parameters = ["ingilizce":"\(word)"]
        AF.request("http://kasimadalan.pe.hu/sozluk/kelime_ara.php",method: .post,parameters: parameters).response{
            response in
            if let data = response.data {
                do {
                    let dataResponse =  try JSONDecoder().decode(ResponseWord.self, from: data)
                    
                    if let wordList = dataResponse.kelimeler {
                        self.list = wordList
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
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
        
        cell.englishLabel.text=word.ingilizce
        cell.turkishLabel.text=word.turkce
        
    return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
}
extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(word: searchText)
    }
}


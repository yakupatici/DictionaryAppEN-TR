//
//  ViewController.swift
//  SozlukUygulamasii
//
//  Created by Jacob on 29.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    

    @IBOutlet weak var kelimeTableView:
    UITableView!
    
    var wordList = [Kelimeler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        
        
    
        
        kelimeTableView.dataSource = self
        kelimeTableView.delegate = self
        searchBar.delegate = self
        
        wordList = Kelimelerdao().getAllPeople()
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! KelimeDetayViewController
        gidilecekVC.kelime = wordList[indeks!]
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wordd = wordList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kelimeHucre",for: indexPath) as! KelimeHucreTableViewCell
        
        cell.englishhLabel.text = wordd.ingilizce
        cell.turkishLabel.text = wordd.turkce
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
       
    }
    
}
extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu : \(searchText)")
        wordList = Kelimelerdao().searchIt(ingilizce: searchText)
        kelimeTableView.reloadData()
    }
    
    func veritabaniKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "sozluk", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var.Kopyalamaya gerek yok")
        }else{
            do {
                
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                
            }catch{
                print(error)
            }
        }
    }
}

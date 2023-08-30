//
//  Kelimelerdao.swift
//  SozlukUygulamasii
//
//  Created by Jacob on 30.08.2023.
//

import Foundation

class Kelimelerdao{
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    func getAllPeople() ->[Kelimeler]
    {
        var list = [Kelimeler]()
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kelimeler", values: nil)
            
            while rs.next() {
                let kelime = Kelimeler(kelime_id: Int(rs.string(forColumn: "kelime_id"))!,ingilizce: rs.string(forColumn: "ingilizce")!,turkce: rs.string(forColumn: "turkce"))
                list.append(kelime)
            }
            
        }
        catch {
            print(error.localizedDescription)
        }
        
        
        
        db?.close()
        return list
    }
    func searchIt(ingilizce:String) ->[Kelimeler] // Search barda arama yapar
    {
        var list = [Kelimeler]()
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kelimeler WHERE ingilizce like '%\(ingilizce)%'", values: nil)
            
            while rs.next() {
                let kelime = Kelimeler(kelime_id: Int(rs.string(forColumn: "kelime_id"))!,ingilizce: rs.string(forColumn: "ingilizce")!,turkce: rs.string(forColumn: "turkce"))
                list.append(kelime)
            }
            
        }
        catch {
            print(error.localizedDescription)
        }
        
        
        
        db?.close()
        return list
    }
    
    
}

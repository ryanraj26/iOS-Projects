//
//  ApartmentHomeViewController.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/26/21.
//

import UIKit

class ApartmentHomeViewController: UIViewController {

    
    @IBOutlet weak var apartmentLbl: UILabel!
    @IBOutlet weak var roomieLbl: UILabel!
    
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabbar = tabBarController as! HomeTabBarViewController
        //weather()
        apartmentLbl.text = "\(tabbar.apartment.name), \(tabbar.apartment.number)"
        roomieLbl.text = tabbar.roomie.firstName
        
        
        // Do any additional setup after loading the view.
    }
    
    func weather(){
        let urlString1 = "http://dataservice.accuweather.com/currentconditions/v1/348735"

        let urlBuilder1 = URLComponents(string: urlString1)

        let url1 = urlBuilder1?.url
        var request1 = URLRequest(url: url1!)
        request1.httpMethod = "GET"
        request1.setValue("Glo2SmmlQnpAd0n0YzjknxJgybOrn2Pd", forHTTPHeaderField: "apikey")
        //request1.setValue("03923592baac5c2211609dc7d7fbed04", forHTTPHeaderField: "appid")

        URLSession.shared.dataTask(with: request1){(data,response,error) in
           // print(response)
            print(data)
            if error != nil {
                print(error!.localizedDescription)
            }
            do{
                let newData = try JSONDecoder().decode(WelcomeElement.self, from: data!)
                
                DispatchQueue.main.async {
                        do {
                            
                            ApartmentData.weatherMain = "\(newData.temperature.metric.unit)"
                            ApartmentData.weatherDescription =  newData.weatherText
                            print(newData.temperature.metric.unit)
                            //print(main)
                            //print(description)
                            
                        }catch{
                            print(error)
                        }
                }
            }
            catch let parsingError{
                print(parsingError)
            }
        }.resume()

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

//
//  BGViewController.swift
//  Ballroomer
//
//  Created by Bowen Sun on 1/8/17.
//  Copyright © 2017 Bowen Sun. All rights reserved.
//

import UIKit

class BGViewController: UIViewController {
    
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.portrait
    }
    
    @IBOutlet weak var BGTitle: UIImageView!
    
    @IBOutlet weak var FBView: UIView!
    
    @IBOutlet weak var YTBView: UIView!
    
    @IBOutlet weak var musicView: UIView!
    
    @IBOutlet weak var compView: UIView!
    
    @IBOutlet weak var blogView: UIView!
    
    @IBOutlet weak var standardTable: UITableView!
    
    @IBOutlet weak var latinTable: UITableView!
    
    
    
    let infoView: InfoView = UINib(nibName: "InfoView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! InfoView

    
    let BGColor = UIColor(red: 237/255, green: 120/255, blue: 106/255, alpha: 1)
    let BGColorFade = UIColor(red: 237/255, green: 120/255, blue: 106/255, alpha: 0.8).cgColor
    
    let segueID = "showweb"
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        let viewsArray = [FBView, YTBView, musicView, compView, standardTable, latinTable, blogView]
        for aView in viewsArray{
            makeCornerForView(aView!)
        }
        
        standardTable.delegate = self
        latinTable.delegate = self
        
        standardTable.dataSource = self
        latinTable.dataSource = self
        
        let TapGR = UITapGestureRecognizer(target: self, action: #selector(self.showInfo))
        BGTitle.addGestureRecognizer(TapGR)
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func makeCornerForView(_ view: UIView){
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.8
        view.layer.borderColor = BGColorFade
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let webController = segue.destination as? WebViewController{
            webController.urlString = sender as! String
        }
        
        
    }
    
    func showInfo(){
        infoView.alpha = 0
        view.addSubview(infoView)
        UIView.animate(withDuration: 0.1, animations: {
            self.infoView.alpha = 1
        })
        
        //view.addSubview(infoView)
    }
    
    
    @IBAction func showFB(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: "https://www.facebook.com/Ballroomguide/")
    }
    
    @IBAction func showYTB(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: "https://www.youtube.com/Ballroomguide/")
    }
    
    @IBAction func showMusic(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: "http://www.ballroomguide.com/resources/music.html")
    }
    
    @IBAction func showCompGuide(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: "http://www.ballroomguide.com/comp/competition_locator.html")
        
    }
    
    @IBAction func showBlog(){
        performSegue(withIdentifier: segueID, sender: "http://www.ballroomguide.com/resources/bgbb_mobile_index.html")
    }
    
    
    
}

extension BGViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == standardTable{
            let cell = UITableViewCell(style: .default, reuseIdentifier: "headercell")
            let label = cell.textLabel!
            label.text = "Standard Syllabus"
            label.textColor = UIColor.white
            label.font = label.font.withSize(17)
            label.textAlignment = .center
            cell.backgroundColor = BGColor
            
            return cell
        }else if tableView == latinTable{
            let cell = UITableViewCell(style: .default, reuseIdentifier: "headercell")
            let label = cell.textLabel!
            label.text = "Latin Syllabus"
            label.textColor = UIColor.white
            label.font = label.font.withSize(17)
            label.textAlignment = .center
            cell.backgroundColor = BGColor
            
            return cell
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dancecell", for: indexPath) as! searchResultCell
        let label = cell.oneLabel!
        let imageView = cell.oneImageView!
        cell.imageView?.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
        cell.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        if tableView == standardTable{
            switch indexPath.row {
            case 0:
                label.text = "Waltz"
                imageView.image = #imageLiteral(resourceName: "waltz2")
            case 1:
                label.text = "Tango"
                imageView.image = #imageLiteral(resourceName: "tango2")
            case 2:
                label.text = "Foxtrot"
                imageView.image = #imageLiteral(resourceName: "fox1")
            case 3:
                label.text = "Quickstep"
                imageView.image = #imageLiteral(resourceName: "quickstep1")
            case 4:
                label.text = "V Waltz"
                imageView.image = #imageLiteral(resourceName: "viennese1")
            default:
                label.text = "Open Figures"
                imageView.image = #imageLiteral(resourceName: "openstandard")
            }
            
        }else{
            switch indexPath.row {
            case 0:
                label.text = "Cha Cha"
                imageView.image = #imageLiteral(resourceName: "cha1")
            case 1:
                label.text = "Rumba"
                imageView.image = #imageLiteral(resourceName: "rumba1")
            case 2:
                label.text = "Samba"
                imageView.image = #imageLiteral(resourceName: "samba1")
            case 3:
                label.text = "Jive"
                imageView.image = #imageLiteral(resourceName: "jive1")
            case 4:
                label.text = "Paso Doble"
                imageView.image = #imageLiteral(resourceName: "paso1")
            default:
                label.text = "Open Figures"
                imageView.image = #imageLiteral(resourceName: "openlatin")
            }
            
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let senderString: String
        if tableView == standardTable{
            switch indexPath.row {
            case 0:
                senderString = "http://www.ballroomguide.com/workshop/standard/waltz.html"
            case 1:
                senderString = "http://www.ballroomguide.com/workshop/standard/tango.html"
            case 2:
                senderString = "http://www.ballroomguide.com/workshop/standard/foxtrot.html"
            case 3:
                senderString = "http://www.ballroomguide.com/workshop/standard/quickstep.html"
            case 4:
                senderString = "http://www.ballroomguide.com/workshop/standard/viennese.html"
            default:
                senderString = "http://www.ballroomguide.com/workshop/standard/advanced.html"
            }
            
        }else{
            switch indexPath.row {
            case 0:
                senderString = "http://www.ballroomguide.com/workshop/latin/cha_cha.html"
            case 1:
                senderString = "http://www.ballroomguide.com/workshop/latin/rumba.html"
            case 2:
                senderString = "http://www.ballroomguide.com/workshop/latin/samba.html"
            case 3:
                senderString = "http://www.ballroomguide.com/workshop/latin/jive.html"
            case 4:
                senderString = "http://www.ballroomguide.com/workshop/latin/paso.html"
            default:
                senderString = "http://www.ballroomguide.com/workshop/latin/advanced.html"
            }
            
        }
        
        performSegue(withIdentifier: segueID, sender: senderString)
    }
}

class searchResultCell: UITableViewCell{
    @IBOutlet weak var oneImageView: UIImageView!
    @IBOutlet weak var oneLabel: UILabel!
    
    override func willMove(toSuperview newSuperview: UIView?) {
        oneImageView.layer.masksToBounds = true
        oneImageView.layer.cornerRadius = 10
    }
    
}

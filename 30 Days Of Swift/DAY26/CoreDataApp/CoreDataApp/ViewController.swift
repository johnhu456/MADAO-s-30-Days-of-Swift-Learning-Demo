//
//  ViewController.swift
//  CoreDataApp
//
//  Created by MADAO on 16/4/13.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    
    var resolutionArray:[Resolution]?
    var resolutionTextField:UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resolutionArray = getResolutionArray()
    }
    
    func getCurrentDataContext() ->NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        return context
    }
    
    func getResolutionArray() -> [Resolution]{
        let searchRequest = NSFetchRequest.init(entityName: "Resolution")
        let resultArray:[Resolution]?
        do{
            resultArray = try getCurrentDataContext().executeFetchRequest(searchRequest) as? [Resolution]
        }catch {
            resultArray = nil
        }
        return resultArray!
        
    }
    
    func saveResolution() {
        let newResolution = NSEntityDescription.insertNewObjectForEntityForName("Resolution", inManagedObjectContext: self.getCurrentDataContext()) as! Resolution
        newResolution.resolution = resolutionTextField?.text
        do {
            try self.getCurrentDataContext().save()
        }catch{
            print("保存失败")
        }
        resolutionArray?.append(newResolution)
        mainTableView.reloadData()
    }
    
    func deleteResolution(index:NSIndexPath) {
        self.getCurrentDataContext().deleteObject(resolutionArray![index.row])
        do{
            try self.getCurrentDataContext().save()
            self.resolutionArray?.removeAtIndex(index.row)
            self.mainTableView.reloadData()
        }
        catch{
            print("删除失败")
        }
    }
    
    //MARK: - UITableViewDataSourceAndDelegate
    func  numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (resolutionArray?.count)!
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("mainCell")
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "mainCell")
        }
        cell?.textLabel?.text = resolutionArray![indexPath.row].resolution
        return cell!
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.Destructive, title: "删除") { (rowAction, indexPath) in
            self.deleteResolution(indexPath)
        }
//        deleteAction.backgroundColor = UIColor.redColor()
        return [deleteAction]
    }
    
    @IBAction func handleAddButton(sender: AnyObject) {
        let alertController = UIAlertController.init(title:"New Resolution", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        let cancleAlertAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.Cancel) { (alertAction) in
            
        }
        let confirmAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Default) { (alertAction) in
            self.saveResolution()
        }
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            self.resolutionTextField = textField
            self.resolutionTextField?.placeholder = "New Resolution"
        }
        alertController.addAction(cancleAlertAction)
        alertController.addAction(confirmAlertAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }


}


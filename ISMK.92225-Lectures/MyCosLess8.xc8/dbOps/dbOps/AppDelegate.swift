//
//  AppDelegate.swift
//  dbOps
//
//  Created by ios on 16.08.2017.
//  Copyright © 2017 ismek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var databasePath: String?
    var dbArray = NSMutableArray()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        createDB()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func dbFilePath() -> String {
        let fm = FileManager.default
        let fpath = fm.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = (fpath[0].appendingPathComponent("TestSQLiteDB").path as NSString) as String
        return databasePath!
    }
    
    func createDB(){
        let fm = FileManager()
        let dbPath = dbFilePath()
        if !(fm.fileExists(atPath: dbPath)){
            let myDatabase: FMDatabase? = FMDatabase(path: dbPath)
            if myDatabase == nil {
                print("DB Connection Error: \(myDatabase!.lastError())")
            }
            else if (myDatabase?.open())! {
                let myTable = "CREATE TABLE IF NOT EXIST LIST(ID INT, NAME TEXT, DESCRIPTION TEXT)"
                if !((myDatabase?.executeStatements(myTable))!){
                    print("DB Error: \(myDatabase?.lastError())")
                }
                myDatabase?.close()
                
            }
        }
        else {
            print("Exist Error")
        }
        print(databasePath!)
        
        let rootVC = (window!.rootViewController as! UINavigationController)
        let tblVC = rootVC.viewControllers[0] as! TableViewControllerList
        tblVC.databasePath = databasePath!
        tblVC.myDatabase = myDatabase!
        
    }
    
    func selectyDB(){
        let myDb: FMDatabase? = FMDatabase(path: databasePath! as String)
        
        if (myDb?.open())! {
            let selectQuery = "SELECT * FROM MYTABLE"
            let resultSet: FMResultSet? = myDb?.executeQuery(selectQuery, withParameterDictionary: nil) //myDb?.executeQuery(selectQuery, withArgumentsIn: nil)
            while resultSet?.next() == true {
                dbArray.add((resultSet?.resultDictionary)!)
            }
            print(dbArray)
        }
        myDb?.close()
    }
    
}


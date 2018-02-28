//
//  NextViewController.swift
//  SwiftBlockTest
//
//  Created by iOS on 2018/2/28.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    //新建一个模型（struct）,因为模型比较简单，且没有其他的功能，所以可以不需要新建一个文件
    struct Item: Codable {
        let name: String?
        let desc: String?
        let price: String?
    }
    
    //1.定义一个闭包类型 闭包名称 = （参数）-> 返回类型
    typealias swiftBlock = (_ string: String) -> Void
    //2.声明一个swiftBlock类型的变量
    var myBlock: swiftBlock?
    var dataArray: [Item] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //3.定义一个方法，方法的参数为和swiftBlock类型一致的闭包，并赋值给myBlock
    func myBlockFunc(_ block: @escaping swiftBlock) {
        myBlock = block
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension NextViewController {
    //从storyBoard中创建VC
    class func instance() -> NextViewController {
        let vc: NextViewController = StoryBoard.main.instance()
        return vc
    }
    
    func makeData() -> [String:Array<Any>] {
        let dataArray = ["data" : [["name" : "水杯",
                          "desc" : "生活用品",
                          "price": "$1.3"],
                        ["name" : "红牛",
                         "desc" : "饮料",
                         "price": "$0.5"],
                        ["name" : "卫生纸",
                         "desc" : "生活用品",
                         "price": "$0.3"]]]
        return dataArray
    }
    
    func parseData() -> Void {
        do{
            struct Model: Codable {
                let data : [Item]?
            }
            //withJSONObject这里只能传字典
            let json = try JSONSerialization.data(withJSONObject: makeData(),
                                                  options: [])
            let array = try JSONDecoder().decode(Model.self, from: json)
            dataArray = array.data ?? []
        }catch{
            print(error)
        }
    }
}

extension NextViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let item: Item = dataArray[indexPath.row]
        //4.调用block，这里调用的是自己定义的block类型的变量
        myBlock?(item.name ?? "")
        dismiss(animated: true, completion: nil)
    }
}

extension NextViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NextCell = tableView.dequeueReusableCell(type: NextCell.self, indexPath: indexPath)
        let item = dataArray[indexPath.row]
        cell.set(name: item.name ?? "",
                 desc: item.desc ?? "",
                 price: item.price ?? "")
        return cell
    }
}

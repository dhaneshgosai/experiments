//
//  DonutChartViewController.swift
//  TestSwift
//
//  Created by Amit Bhonsle on 07/07/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import Charts

class DonutChartViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    var mobileTech: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pie Chart"
        
        mobileTech = ["iOS", "Android", "AngularJS", "Xamarin", "Others"]
        let techPer = [30.0, 40.0, 18.0, 8.0, 4.0]
        
//        self.pieChart.usePercentValuesEnabled = true
//        self.pieChart.drawSlicesUnderHoleEnabled = false
//        self.pieChart.holeRadiusPercent = 0.10
//        self.pieChart.transparentCircleRadiusPercent = 0.23
//        self.pieChart.drawHoleEnabled = true
//        self.pieChart.rotationAngle = 0.0
//        self.pieChart.rotationEnabled = false
//        self.pieChart.highlightPerTapEnabled = true
        
        
        
        
        let pieChartLegend = self.pieChart.legend
        pieChartLegend.horizontalAlignment = Legend.HorizontalAlignment.right
        pieChartLegend.verticalAlignment = Legend.VerticalAlignment.top
        pieChartLegend.orientation = Legend.Orientation.vertical
        pieChartLegend.drawInside = false
        pieChartLegend.yOffset = 10.0
        
        self.pieChart.setPieChartData(lables: mobileTech, values: techPer)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension PieChartView {
    
    func setPieChartData(lables: [String]!, values:[Double]!) {
        
        var valuesArray: [PieChartDataEntry] = []
        var colors: [UIColor] = []
        let valNSArray = values as NSArray
        
        valNSArray.enumerateObjects({ object, index, stop in
            //your code
            colors.append(self.getRandomColor())
            
            
            valuesArray.append(PieChartDataEntry(value: object as! Double, label: lables[index]))
            
        })
        
        let pieChartDataSet = PieChartDataSet(values: valuesArray, label: "Pie Data Chart")
        pieChartDataSet.colors = colors
        
        let piechartData = PieChartData(dataSets:[pieChartDataSet])
        pieChartDataSet.yValuePosition = .outsideSlice
        pieChartDataSet.valueTextColor = UIColor.black
        self.data = piechartData
        
        
        
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
//        let translation1 = CGAffineTransform(scaleX: 1.5, y: 1.5)
//        let translation2 = CGAffineTransform(translationX: 1.0, y: 1.0)
        
//        UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseIn, animations: {
//            chartView.sele.transform = translation1
//        }) { (completed) in
//
//        }
        
//        UIView.animate(withDuration: 0.4, animations: { in
//            entry.transform = translation1
//        }) { didComplete in
//            UIView.animate(withDuration: 0.4, animations: {
//                entry.transform = translation2
//            })
//        }
    }
    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    
    
}

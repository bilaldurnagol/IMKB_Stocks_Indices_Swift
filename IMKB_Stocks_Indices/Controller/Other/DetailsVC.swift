//
//  DetailsVC.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 5.05.2021.
//

import UIKit
import Charts

class DetailsVC: UIViewController {
    
    private let detailView = DetailsInfoView()
    private var chart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "IMKB Hisse Senetleri/Endeksler"
        view.backgroundColor = .systemBackground
        
        chart.delegate = self
        
        view.addSubview(detailView)
        view.addSubview(chart)
        
        setupCharts()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.width,
            height: view.height/4
        )
        
        chart.frame = CGRect(
            x: 0,
            y: detailView.bottom,
            width: view.width,
            height: view.height/4*3 - view.safeAreaInsets.top
        )
    }
    
    private func setupCharts() {
        
        //setup charts
        chart.noDataText = "Veriler yükleniyor..."
        chart.rightAxis.enabled = false
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.drawLabelsEnabled = false
        chart.backgroundColor = UIColor.secondarySystemBackground
        chart.animate(xAxisDuration: 0.2)
        
        //set data
        var entries = [ChartDataEntry]()
        
        for i in 0..<10 {
            entries.append(ChartDataEntry(x: Double(i), y: Double(i*2)))
        }
        
        let dataSet = LineChartDataSet(entries: entries )
        let data = LineChartData(dataSet: dataSet)
        
        dataSet.lineDashLengths = [10, 3]
        dataSet.highlightLineDashLengths = [10, 3]
        
        
        // x-axis limit line
        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 4
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .bottomRight
        llXAxis.valueFont = .systemFont(ofSize: 10)
        
        chart.xAxis.gridLineDashLengths = [10, 10]
        chart.xAxis.gridLineDashPhase = 0
        
        
        // y-axis limit line
        let leftAxis = chart.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.gridLineDashLengths = [10, 10]
        leftAxis.drawLimitLinesBehindDataEnabled = true
        leftAxis.axisMinimum = 0
        
        //Gradient fill
        let gradientColors = [UIColor.systemRed.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations: [CGFloat] = [1.0, 0.0]
        guard let gradient = CGGradient(
            colorsSpace: CGColorSpaceCreateDeviceRGB(),
            colors: gradientColors,
            locations: colorLocations
        ) else { return }
        
        dataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90)
        dataSet.drawFilledEnabled = true
        //Colors
        dataSet.colors = [UIColor.label]
        dataSet.circleColors = [UIColor.label]
        dataSet.circleHoleColor = UIColor.label
        
        dataSet.highlightColor = UIColor.orange
        dataSet.drawValuesEnabled = false
        
        chart.data = data
    }
}

extension DetailsVC: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("\(entry.y)")
    }
}

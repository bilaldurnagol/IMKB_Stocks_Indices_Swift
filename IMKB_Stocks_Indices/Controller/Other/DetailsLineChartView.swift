//
//  LineChartView.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 7.05.2021.
//

import UIKit
import Charts


class DetailsLineChartView: UIView, ChartViewDelegate {
    
    private var chart = LineChartView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        chart.delegate = self
        addSubview(chart)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        chart.frame = bounds
    }
    
    //setup charts
    func configure(with graphicData: [GraphicData]) {
        /** i used this repo
        https://github.com/danielgindi/Charts/blob/master/ChartsDemo-iOS/Objective-C/Components/BalloonMarker.swift **/
        
        let marker: BalloonMarker = BalloonMarker(
            color: UIColor.black,
            font: UIFont(name: "Helvetica", size: 15)!,
            textColor: UIColor.white,
            insets: UIEdgeInsets(top: 3.0, left: 7.0, bottom: 7.0, right: 7.0)
        )
        marker.minimumSize = CGSize(width: 75.0, height: 35.0)
        chart.marker = marker
        
        chart.rightAxis.enabled = false
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.drawLabelsEnabled = false
        chart.backgroundColor = UIColor.secondarySystemBackground
        chart.animate(xAxisDuration: 0.2)
        chart.drawMarkers = true
        
        //set data
        var entries = [ChartDataEntry]()
        
        for i in 0..<graphicData.count {
            entries.append(ChartDataEntry(x: Double(graphicData[i].day), y: Double(graphicData[i].value).rounded(toPlaces: 2)))
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

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
    
    private var stock: StockDetailsResponse?
    
    init(stock: StockDetailsResponse) {
        self.stock = stock
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "IMKB Hisse Senetleri/Endeksler"
        view.backgroundColor = .systemBackground
        
        chart.delegate = self
        
        view.addSubview(detailView)
        view.addSubview(chart)
        
        guard let stock = stock else {return}
        setupCharts(with: stock.graphicData)
        detailView.configure(with: DetailsInfoView.DetailsInfoViewVM(
                                isDown: stock.isDown,
                                isUp: stock.isUp,
                                bid: stock.bid,
                                channge: stock.channge,
                                count: stock.count,
                                difference: stock.difference,
                                offer: stock.offer,
                                highest: stock.highest,
                                lowest: stock.lowest,
                                maximum: stock.maximum,
                                minimum: stock.minimum,
                                price: stock.price,
                                volume: stock.volume,
                                symbol: stock.symbol)
        )
        
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
    
    private func setupCharts(with stock: [GraphicData]?) {
        guard let stock = stock else { return }
        //setup charts
        
        //i used this repo
        //https://github.com/danielgindi/Charts/blob/master/ChartsDemo-iOS/Objective-C/Components/BalloonMarker.swift

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
        
        for i in 0..<stock.count {
            entries.append(ChartDataEntry(x: Double(stock[i].day), y: Double(stock[i].value).rounded(toPlaces: 2)))
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

extension DetailsVC: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("\(entry.y.rounded(toPlaces: 2))")
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

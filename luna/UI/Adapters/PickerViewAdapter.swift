//
//  PickerViewAdapter.swift
//  luna
//
//  Created by sml on 21/07/23.
//

import UIKit
import RxSwift
import RxCocoa

final class PickerViewAdapter: NSObject,
    UIPickerViewDataSource, UIPickerViewDelegate, RxPickerViewDataSourceType, SectionedViewDataSourceType {
        
    typealias Element = [[String]]
    private var items: [[String]] = []

    func model(at indexPath: IndexPath) throws -> Any {
        items[indexPath.section][indexPath.row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        items[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = LunaText()
        let model = LunaTextViewModel(size: 61,
                                      color: .black,
                                      weight: .semibold)
        label.draw(model)
        label.text = items[component][row].description
        label.textAlignment = .center
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 75.0
    }
    
    func pickerView(_ pickerView: UIPickerView, observedEvent: Event<Element>) {
        Binder(self) { (adapter, items) in
            adapter.items = items
            pickerView.reloadAllComponents()
        }.on(observedEvent)
    }
}

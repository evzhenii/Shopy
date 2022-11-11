//
//  DividerView.swift
//  Shopy
//
//  Created by boockich mac on 11.11.2022.
//

import UIKit

class DividerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame.size.height = 1
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  WrittenWishCell.swift
//  aszabelinPW2
//
//  Created by Забелин Александр Сергеевич on 17.03.2024.
//

import Foundation
import UIKit

final class WrittenWishCell: UITableViewCell {
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 8
        static let labelFont: UIFont = .systemFont(ofSize: 20)
        
        static let reusedId: String = "WrittenWishCell"
        
        static let errorMessage: String = "init(coder:) has not been implemented"
        
        static let cellBackgroundColor: UIColor = .clear
        static let cellSelectionStyle:  UITableViewCell.SelectionStyle = .none
    }
    
    static let reusedId: String = Constants.reusedId
    
    private var idx: Int?
    private var removeWish: ((Int?) -> ())?
    private let wishLabel: UILabel = UILabel()
    private let removeWishButton: UIButton = UIButton(type: .close)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    @objc
    func removeWishButtonTapped() {
        removeWish?(idx)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.errorMessage)
    }
    
    func configure(with wish: String, index: Int?, action: @escaping (Int?) -> ()) {
        wishLabel.text = wish
        removeWish = action
        idx = index
    }
    
    private func configureUI() {
        selectionStyle = Constants.cellSelectionStyle
        backgroundColor = Constants.cellBackgroundColor
        
        let wrap: UIView = UIView()
        addSubview(wrap)
        
        wrap.backgroundColor = Constants.wrapColor
        wrap.layer.cornerRadius = Constants.wrapRadius
        wrap.translatesAutoresizingMaskIntoConstraints = false

        wrap.backgroundColor = Constants.wrapColor
        wrap.backgroundColor = Constants.wrapColor
        wrap.pinVertical(to: self, Constants.wrapOffsetV)
        wrap.pinHorizontal(to: self, Constants.wrapOffsetH)
        
        wrap.addSubview(wishLabel)
        wrap.addSubview(removeWishButton)
        
        wishLabel.font = Constants.labelFont
        wishLabel.pin(to: wrap, Constants.wishLabelOffset)
        
        removeWishButton.pinRight(to: wrap, 5)
        
        removeWishButton.addTarget(self, action: #selector(removeWishButtonTapped), for: .touchUpInside)
    }
    
}

//
//  Cart.swift
//  ShoppingCart
//
//  Created by Waqar Ahmed on 29/01/2020.
//  Copyright © 2020 Waqar. All rights reserved.
//

import UIKit

public protocol CartItemDelegate {
    func updateCartItem(quantity: Int)
}

@IBDesignable
public class CounterView: UIView {

    public var delegate: CartItemDelegate?
    
    public var quantity: Int = 0 {
        
        didSet {
            updateView()
            quantityLabel.text = String(quantity)
        }
    }
    
    @IBInspectable
    public var buttonColors : UIColor = .black {
        didSet{
            decrementButton.backgroundColor = buttonColors
            incrementButton.backgroundColor = buttonColors
      
        }
    }
    
    @IBInspectable
    public var labelColor : UIColor = .black {
        didSet{
        
            quantityLabel.textColor = labelColor
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        
        setupView()
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    
    lazy var decrementButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = buttonColors
        button.setTitle("-", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(updateCartItemQuantity(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var incrementButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = buttonColors
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(updateCartItemQuantity(_:)), for: .touchUpInside)
        
        return button
    }()
    
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = labelColor
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "0"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Helvetica-Bold", size: 22.0)
        return label
    }()
    
    private func setupView(){
        let stackView = UIStackView(arrangedSubviews: [decrementButton,quantityLabel,incrementButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        decrementButton.layer.cornerRadius = 10
        decrementButton.clipsToBounds = true
        
        incrementButton.layer.cornerRadius = 10
        incrementButton.clipsToBounds = true
    }
    
    @IBAction 
    func updateCartItemQuantity(_ sender: Any) {
        
        if (sender as! UIButton).tag == 0 {
            quantity = quantity + 1
        } else if quantity > 0 {
            quantity = quantity - 1
        }
        
        updateView()
        
        self.delegate?.updateCartItem( quantity: quantity)
    }
    
    private func updateView() {
        
        decrementButton.isEnabled = quantity > 0
        decrementButton.backgroundColor = !decrementButton.isEnabled ? .gray : buttonColors
        quantityLabel.text = String(quantity)
    }
    
    
}

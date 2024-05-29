//
//  ProductsListTableViewCell.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 19/04/24.
//

import UIKit

class ProductsListTableViewCell: UITableViewCell {

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.textColor = UIColor(named: AssetsConstants.mediumOrange)
        return label
    }()
    
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: AssetsConstants.lightGray)
        label.numberOfLines = 0
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.lightGray)
        return label
    }()
    
    private let backgroundContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: AssetsConstants.cardBackground)
        view.layer.cornerRadius = 12.0
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupSubviews()
        selectBackgroundView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 12.0
        contentView.clipsToBounds = true
    }
    
    private func selectBackgroundView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        selectedBackgroundView = backgroundView
    }
    
    private func setupSubviews() {
        contentView.addSubview(backgroundContainerView)
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(productPriceLabel)
        
        NSLayoutConstraint.activate([

            backgroundContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0),
            
            productImageView.topAnchor.constraint(equalTo: backgroundContainerView.topAnchor),
            productImageView.widthAnchor.constraint(equalTo: backgroundContainerView.widthAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 160),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 16.0),
            productNameLabel.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 16.0),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 8.0),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 16.0),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor, constant: -16.0),
            
            productPriceLabel.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 16.0),
            productPriceLabel.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 16.0),
            productPriceLabel.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor, constant: -16.0),
            productPriceLabel.bottomAnchor.constraint(lessThanOrEqualTo: backgroundContainerView.bottomAnchor, constant: -16.0),

        ])
    }
    
    func configure(with product: Product) {
        productImageView.image = UIImage(named: product.image)
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
        productPriceLabel.text = product.formattedPrice
    }

}

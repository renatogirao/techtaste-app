//
//  HomeViewController.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 19/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.banner))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.logo))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.homeTitleLabel
        
        let attributedText = NSMutableAttributedString(string: Constants.homeTitleLabel, attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 24.0, weight: .bold)
        ])
        
        attributedText.addAttribute(.foregroundColor, value: UIColor(named: AssetsConstants.mediumOrange) ?? .orange, range: NSRange(location: 30, length: 29))
        
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.homeButtonTitle, for: .normal)
        button.backgroundColor = UIColor(named: AssetsConstants.mediumOrange)
        button.setTitleColor(UIColor(named: AssetsConstants.backgroundColor), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18.0, weight: .semibold)
        button.layer.cornerRadius = 22.0
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: AssetsConstants.backgroundColor)
    }
    
    private func addSubviews() {
        view.addSubview(bannerImageView)
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bannerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 88.0),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 88.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 112.0),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            button.heightAnchor.constraint(equalToConstant: 52.0)
        ])
    }
    
    @objc func didTapButton() {
        let productsListVC = ProductsListViewController()
        navigationController?.pushViewController(productsListVC, animated: true)
    }
    
}


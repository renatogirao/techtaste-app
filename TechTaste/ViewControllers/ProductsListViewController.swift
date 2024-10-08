//
//  ProductsListViewController.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 19/04/24.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    private var products: [Product] = []
//    private var productsRepository: ProductsRepository
//
    private var viewModel: ProductsListViewModel
    
    init(viewModel: ProductsListViewModel = ProductsListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(ProductsListTableViewCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = .white
        return activityIndicatorView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        addSubviews()
        setupConstraints()
        bindViewModel()
        getProducts()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.hidesBackButton = true
    }
    
    private func setupUI() {
        view.frame = view.frame.inset(by: UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24))
        view.backgroundColor = UIColor(named: AssetsConstants.backgroundColor)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicatorView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func getProducts() {
        viewModel.getAllProducts()
        tableView.reloadData()
    }
    
    private func bindViewModel() {
        bindProducts()
        bindLoading()
    }
    
    private func bindProducts() {
        viewModel.products.bind { [weak self] products in
            guard let self = self, let products else { return }
            self.products = products
            self.tableView.reloadData()
        }
    }
    
    private func bindLoading() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            if isLoading {
                self.activityIndicatorView.startAnimating()
            } else {
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsOfTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductsListTableViewCell else { return UITableViewCell() }
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

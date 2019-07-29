//
//  Checkout51TableViewController.swift
//  c51-coding-challenge
//

import UIKit


class Checkout51TableViewController: UITableViewController {
    @IBOutlet weak var filterByNameCashBack: UISegmentedControl!
    private var currentlyDisplayedOffers = [OfferItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeInterface()
        fetchCurrentOffers()
    }
    
    private func initializeInterface() {
        let font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        filterByNameCashBack.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }
    
    private func fetchCurrentOffers() {
        guard let offerGateway = ServiceManager.shared.offerGateway else {
            return
        }
        
        let shouldSortByName = filterByNameCashBack.selectedSegmentIndex == 0 ? true : false
        
        offerGateway.setup(shouldSortByName: shouldSortByName) { [weak self] offers in
            self?.currentlyDisplayedOffers = offers
            self?.refreshData()
        }
    }
    
    private func refreshData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentlyDisplayedOffers.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Checkout51TableViewCell", for: indexPath) as? Checkout51TableViewCell else {
            return UITableViewCell()
        }
        
        let item = currentlyDisplayedOffers[indexPath.row]
        cell.populate(with: item)
        
        return cell
    }
    
    // MARK: - IBAction Methods
    
    @IBAction func applyNewOfferFilter(_ sender: UISegmentedControl) {
        guard let offerGateway = ServiceManager.shared.offerGateway else {
            return
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            currentlyDisplayedOffers = offerGateway.offersSortedByName()
        case 1:
            currentlyDisplayedOffers = offerGateway.offersSortedByCashBack()
        default:
            break;
        }
        
        refreshData()
    }
}

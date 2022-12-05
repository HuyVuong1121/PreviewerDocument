//
//  ViewController.swift
//  PreviewerDocument
//
//  Created by HuyVuong on 05/12/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tbView: UITableView!
    
    let files = File.loadFiles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
    }
    
    func didTappedPreviewFile(url: URL?, name: String) {
        let screen = UIStoryboard(name: StoryboardName.DocumentPreviewer, bundle: nil)
            .instantiateViewController(viewControllerType: DocumentPreviewer.self)
        screen.attactView(url: url, fileName: name)
        screen.modalPresentationStyle = .fullScreen
        navigationController?.present(screen, animated: true)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: FileCell.reuseIdentifier, for: indexPath) as? FileCell else {
            return UITableViewCell()
        }
        cell.updateData(with: files[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let file = files[indexPath.row]
        didTappedPreviewFile(url: file.url, name: file.name)
        
    }
}


class FileCell: UITableViewCell {
    static let reuseIdentifier = String(describing: FileCell.self)
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        selectionStyle = .none
    }
    
    func updateData(with file: File) {
        nameLabel.text = file.name
    }
}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(viewControllerType: T.Type) -> T {
        guard let viewController =
                instantiateViewController(withIdentifier: String(describing: viewControllerType)) as? T else {
            fatalError("Could not instantiateViewController with identifier: \(viewControllerType)")
        }
        return viewController
    }
}


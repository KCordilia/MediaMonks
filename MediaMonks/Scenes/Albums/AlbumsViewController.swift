//
//  AlbumsViewController.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

protocol AlbumsViewControllerProtocol: UIViewControllerRouting {
    func set(interactor: AlbumsInteractorProtocol)
    func set(router: AlbumsRouterProtocol)
    func displayAlbums(albums: [Album])
}

class AlbumsViewController: UIViewController, AlbumsViewControllerProtocol {
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    private let datasource = AlbumsDataSource()

    // MARK: DI
    var interactor: AlbumsInteractorProtocol?
    var router: AlbumsRouterProtocol?

    func set(interactor: AlbumsInteractorProtocol) {
        self.interactor = interactor
    }

    func set(router: AlbumsRouterProtocol) {
        self.router = router
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.handleViewDidLoad()
        setupNavigationBar()
        setupCollectionView()
    }

    // MARK: Methods
    func setupNavigationBar() {
        let imageView = UIImageView(image: R.image.logoMm())
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }

    func setupCollectionView() {
        collectionView.register(R.nib.albumCollectionViewCell)
        collectionView.delegate = self
        collectionView.dataSource = datasource
        collectionView.collectionViewLayout = setupCollectionViewLayout()
    }

    func setupCollectionViewLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { _, _ -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/3), heightDimension: .estimated(180)))
            item.contentInsets.trailing = 16
            item.contentInsets.bottom = 32
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
            return section
        }
    }

    func displayAlbums(albums: [Album]) {
        datasource.set(albums: albums)
        collectionView.reloadData()
    }

    // MARK: Actions


}

extension AlbumsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AlbumCollectionViewCell else { return }
        UIView.animate(withDuration: 0.05, animations: {
            cell.alpha = 0.5
            cell.albumImage.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { (completed) in
            UIView.animate(withDuration: 0.05) {
                cell.alpha = 1
                cell.albumImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            let album = self.datasource.albums[indexPath.row]
            self.router?.route(to: .photos(albumId: album.id, albumTitle: album.title))
        }

    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY > contentHeight - height {
            interactor?.loadNextPage()
        }
    }
}

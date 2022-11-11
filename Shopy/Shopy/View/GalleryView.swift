//
//  CarouselView.swift
//  Shopy
//
//  Created by boockich mac on 11.11.2022.
//

import UIKit

class GalleryView: UIView {
    
    // MARK: - Subviews
    private lazy var galleryCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .red
        pageControl.currentPageIndicatorTintColor = .white
        return pageControl
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    private var galleryData = [UIImage]()
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
}

// MARK: - Setups
private extension GalleryView {
    func setupUI() {
        addSubview(galleryCollectionView)
        galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        galleryCollectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.galleryCellIdentifier)
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            galleryCollectionView.topAnchor.constraint(equalTo: topAnchor),
            galleryCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            galleryCollectionView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            pageControl.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 10),
//            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

// MARK: - Helpers
private extension GalleryView {
    func getCurrentPage() -> Int {
        
        let visibleRect = CGRect(origin: galleryCollectionView.contentOffset, size: galleryCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = galleryCollectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        
        return currentPage
    }
}

// MARK: - UICollectionViewDelegate
extension GalleryView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
}

// MARK: - UICollectionViewDataSource
extension GalleryView: UICollectionViewDataSource {
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
   }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return galleryData.count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.galleryCellIdentifier, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }

      let image = galleryData[indexPath.row]

      cell.configure(image)

      return cell
   }
}

// MARK: - Public
extension GalleryView {
    public func configureView(with data: [UIImage]) {
        let galleryLayout = UICollectionViewFlowLayout()
        galleryLayout.scrollDirection = .horizontal
        galleryLayout.itemSize = .init(width: frame.width, height: frame.width * 0.7)
        galleryLayout.minimumLineSpacing = 0

        galleryLayout.sectionInset = .zero
        galleryCollectionView.collectionViewLayout = galleryLayout
        
        galleryData = data
        galleryCollectionView.reloadData()
    }
}

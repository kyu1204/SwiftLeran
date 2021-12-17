//
//  ViewController.swift
//  MyAdmobTest
//
//  Created by 김민규 on 2021/12/17.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {
    
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // In this case, we instantiate the banner with desired ad size.
        // 배너 사이즈 설정
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        
        // 배너 아이디 설정
        bannerView.adUnitID = "ca-app-pub-1559070568243087/7437945279"
        bannerView.rootViewController = self
        bannerView.delegate = self
        
        // 배너 로드
        bannerView.load(GADRequest())
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        // 오토 레이아웃 뷰 설정
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        // 루트 뷰에 추가
        view.addSubview(bannerView)
        
        // 앵커 설정
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    // MARK: - 애드몹 델리게이트 함수
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("bannerViewDidReceiveAd")
        
        // 화면에 배너 뷰 등록
        addBannerViewToView(bannerView)
    }
    
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
        print("bannerViewDidRecordImpression")
    }
    
    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("bannerViewWillPresentScreen")
    }
    
    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("bannerViewWillDIsmissScreen")
    }
    
    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("bannerViewDidDismissScreen")
    }
    
}


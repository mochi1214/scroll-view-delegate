//
//  PageVC.swift
//  scroll view delegate
//
//  Created by 吳佳臻 on 2019/5/5.
//  Copyright © 2019 ChiaChen. All rights reserved.
//

import UIKit

class PageVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var pageView: UIView!
    @IBOutlet weak var pageControlView: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControlView.numberOfPages = 10
        pageControlView.currentPage = 0

        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func pageControlAction(_ sender: UIPageControl) {
//        let currentPageNumber = sender.currentPage
//        let width = pageView.frame.size.width
//        let offset = CGPoint(x: width * CGFloat(currentPageNumber), y: 0)
//        scrollView.setContentOffset(offset, animated: true)
//    }
    
    //取得白點位置
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControlView.currentPage = currentPage
    }
    
    //縮放
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
        for pageView in scrollView.subviews {
            if pageView.isKind(of: UIView.self) {
                return pageView
            }
        }
        return nil
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

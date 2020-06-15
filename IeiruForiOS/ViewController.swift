//
//  ViewController.swift
//  IeiruForiOS
//
//  Created by 蛭間寛大 on 2020/06/15.
//  Copyright © 2020 蛭間寛大. All rights reserved.
//

import UIKit
import CoreLocation

/// Location の View
class ViewController: UIViewController {
    
    /// 緯度を表示するラベル
    @IBOutlet weak var latitude: UILabel!
    /// 経度を表示するラベル
    @IBOutlet weak var longitude: UILabel!
    // 緯度
    var latitudeNow: String = ""
    // 経度
    var longitudeNow: String = ""

    /// ロケーションマネージャ
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        // ロケーションマネージャのセットアップ
        setupLocationManager()
    }

    /// "位置情報を取得"ボタンを押下した際、位置情報をラベルに反映する
    

    /// "位置情報を取得"ボタンを押下した際、位置情報をラベルに反映する
    /// - Parameter sender: "位置情報を取得"ボタン
    @IBAction func TupSendBtn(_ sender: Any) {
        // マネージャの設定
        let status = CLLocationManager.authorizationStatus()
        if status == .denied {
            showAlert()
        } else if status == .authorizedWhenInUse {
            self.latitude.text = latitudeNow
            self.longitude.text = longitudeNow
        }
    }
    @IBAction func Clear(_ sender: Any) {
        self.latitude.text = "デフォルト"
        self.longitude.text = "デフォルト"
    }


    /// ロケーションマネージャのセットアップ
    func setupLocationManager() {
        locationManager = CLLocationManager()

        // 権限をリクエスト
        guard let locationManager = locationManager else { return }
        locationManager.requestWhenInUseAuthorization()

        // マネージャの設定
        let status = CLLocationManager.authorizationStatus()

        // ステータスごとの処理
        if status == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
    }

    /// アラートを表示する
    func showAlert() {
        let alertTitle = "位置情報取得が許可されていません。"
        let alertMessage = "設定アプリの「プライバシー > 位置情報サービス」から変更してください。"
        let alert: UIAlertController = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle:  UIAlertController.Style.alert
        )
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        // UIAlertController に Action を追加
        alert.addAction(defaultAction)
        // Alertを表示
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: CLLocationManagerDelegate {

    /// 位置情報が更新された際、位置情報を格納する
    /// - Parameters:
    ///   - manager: ロケーションマネージャ
    ///   - locations: 位置情報
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        let latitude = location?.coordinate.latitude
        let longitude = location?.coordinate.longitude
        // 位置情報を格納する
        self.latitudeNow = String(latitude!)
        self.longitudeNow = String(longitude!)
    }
}
/// "クリア"ボタンを押下した際、ラベルを初期化する
/// - Parameter sender: "クリア"ボタン

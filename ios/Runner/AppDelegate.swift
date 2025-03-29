import Flutter
import UIKit
import GoogleMobileAds
#if DEBUG
import CryptoKit
#endif

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GADMobileAds.sharedInstance().start(completionHandler: nil)
    #if DEBUG
    // https://stackoverflow.com/a/19402414
    // https://qiita.com/Meister619/items/fd7cb77a9b0cfabe7424
    var identifierForVendor = UIDevice.current.identifierForVendor!.uuidString
    var deviceIdentifier: String = Insecure.MD5.hash(
        data: identifierForVendor.data(using: .utf8)!
      )
      .map { String(format: "%02hhx", $0) }
      .joined()

    GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ deviceIdentifier ]
    #endif

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

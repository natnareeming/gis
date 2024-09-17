import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    GMSServices.provideAPIKey("AIzaSyDjidYrixEB1t6vahGB6wAbKS6uLXdYEKQ")
    return true
  }
}
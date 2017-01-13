
import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var urlString: String = "http://ballroomguide.com/resources/blog.html"
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.allButUpsideDown
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        webView.scalesPageToFit = true
        
        forwardButton.addTarget(self, action: #selector(self.webViewGoForward), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(self.webViewGoBack), for: .touchUpInside)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.progressView.setProgress(0.1, animated: false)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.progressView.setProgress(1, animated: true)
        if webView.canGoForward{
            forwardButton.isEnabled = true
        }else{
            forwardButton.isEnabled = false
        }
        
        if webView.canGoBack{
            backButton.isEnabled = true
        }else{
            backButton.isEnabled = false
        }
        
        /*let rect = CGPoint(x: 0, y: 3500)
         webView.scrollView.setContentOffset(rect, animated: true)*/
        
    }
    
    func webViewGoBack(){
        webView.goBack()
    }
    
    func webViewGoForward(){
        webView.goForward()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.progressView.setProgress(1, animated: true)
        let alertController = UIAlertController(title: "Failed to Load Site", message: "Check Internet Connection", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func dismiss(){
        dismiss(animated: true, completion: nil)
    }
    
}

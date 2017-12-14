# Trip-LATAM_iOS

- Load the website URL in webview

        let encodingString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print(encodingString)
        
        if let url = URL(string: encodingString)   {
            let request = URLRequest(url: url as URL)
            webView.loadRequest(request)
        }
        
- Implement the gif animation

        let animationGif = UIImage.gifImageWithName("animation")
        let imageView = UIImageView(image: animationGif)
        imageView.frame = CGRect(x: (self.webView.bounds.width)/2 - 30, y: (self.webView.bounds.height + 20)/2 - 30, width: 60, height: 60)
        imageView.tag = 100
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = UIColor.white
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        webView.addSubview(imageView)

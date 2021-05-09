![GitHub all releases](https://img.shields.io/github/downloads/bilaldurnagol/IMKB_Stocks_Indices_Swift/total?logo=Github&style=flat-square)
![GitHub language count](https://img.shields.io/github/languages/count/bilaldurnagol/IMKB_Stocks_Indices_Swift)
![GitHub followers](https://img.shields.io/github/followers/bilaldurnagol?style=social)
![GitHub forks](https://img.shields.io/github/forks/bilaldurnagol/IMKB_Stocks_Indices_Swift?style=social)
![GitHub Repo stars](https://img.shields.io/github/stars/bilaldurnagol/IMKB_Stocks_Indices_Swift?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/bilaldurnagol/IMKB_Stocks_Indices_Swift?style=social)
![Twitter Follow](https://img.shields.io/twitter/follow/bilaldurnagol?style=social)

<!-- PROJECT LOGO -->
<br />
<p align="center">
   <a href="https://github.com/bilaldurnagol/PhotoFilterRxSwift">
    <img src="githubImages/logo.png" alt="Logo" width="60" height="60">
  </a>

  <h3 align="center">STOCK MARKET CAP</h3>

  <p align="center">
    In this project, I used the handshake method and AES encryption and decryption.
    <br />
    <a href="https://github.com/bilaldurnagol/IMKB_Stocks_Indices_Swift"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/bilaldurnagol/IMKB_Stocks_Indices_Swift">View Demo</a>
    ·
    <a href="https://github.com/bilaldurnagol/IMKB_Stocks_Indices_Swift/issues">Report Bug</a>
    ·
    <a href="https://github.com/bilaldurnagol/IMKB_Stocks_Indices_Swift/issues">Request Feature</a>
  </p>
</p>


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#Requirements">Requirements</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

 With this project, we can edit, crop and share photos on social media with presets filters.

   <a href="https://github.com/bilaldurnagol/PhotoFilterRxSwift">
    <img src="githubImages/screenshot1.png" alt="Logo" width="300" height="600">
  </a>

   <a href="https://github.com/bilaldurnagol/PhotoFilterRxSwift">
    <img src="githubImages/screenshot2.png" alt="Logo" width="300" height="600">
  </a>
  
   <a href="https://github.com/bilaldurnagol/PhotoFilterRxSwift">
    <img src="githubImages/screenshot3.png" alt="Logo" width="300" height="600">
  </a>
     <a href="https://github.com/bilaldurnagol/PhotoFilterRxSwift">
    <img src="githubImages/screenshot4.png" alt="Logo" width="300" height="600">
  </a>
     <a href="https://github.com/bilaldurnagol/PhotoFilterRxSwift">
    <img src="githubImages/screenshot5.png" alt="Logo" width="300" height="600">
  </a>

Here's why:
* To learn Handshake
* To learn AES encryption and decryption.

### Built With

The frameworks I used in this project are listed below.
* [CryptoSwift](https://github.com/krzyzanowskim/CryptoSwift)
* [SideMenu](https://github.com/jonkykong/SideMenu)
* [Charts](https://github.com/danielgindi/Charts)
<!-- GETTING STARTED -->
## Getting Started

 This is an example of how you may give instructions on setting up your project locally. To get a local copy up and running follow these simple example steps.

### Requirements

* Xcode 12.x
* Swift 5.x

### Installation

CryptoSwift, SideMenu, Charts doesn't contain any external dependencies.

<!-- USAGE EXAMPLES -->
## Usage

<table>
  <tr>
    <th width="30%">Here's an example</th>
  </tr>
  <tr>
    <td>Aes Encryption...</td>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift"><pre>
    
      func aesEncryption() -> String? {
        let key = [UInt8](base64: aesKey ?? "")
        let iv = [UInt8](base64: aesIV ?? "")
        let aes = try? AES(key: key, blockMode: CBC(iv: iv))
        
        let cipherText = try? aes?.encrypt(Array(self.utf8))
        let base64String = cipherText?.toBase64()
        return base64String
    }
  </tr>
</table>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact
   <a href="https://twitter.com/bilaldurnagol">
  <img align="left" alt="Bilal Durnagöl | Twitter" width="21px" src="https://raw.githubusercontent.com/anuraghazra/anuraghazra/master/assets/twitter.svg"/>
</a>

   <a href="https://medium.com/@BilalDurnagol">
  <img align="left" alt="Bilal Durnagöl | Medium" width="21px" src="https://github.com/leungwensen/svg-icon/blob/master/dist/svg/logos/medium.svg"/>
</a>

   <a href="https://www.instagram.com/bilaldurnagol/">
  <img align="left" alt="Bilal Durnagöl | Instagram" width="21px" src="https://github.com/shgysk8zer0/logos/blob/master/instagram.svg"/>
</a>

   <a href="https://www.linkedin.com/in/bilaldurnagol">
  <img align="left" alt="Bilal Durnagöl | LinkedIn" width="21px" src="https://github.com/shgysk8zer0/logos/blob/master/linkedin.svg"/>
</a>
<br/>
<br/>
  

Project Link: [https://github.com/bilaldurnagol/PhotoFilterRxSwift](https://github.com/bilaldurnagol/IMKB_Stocks_Indices_Swift)

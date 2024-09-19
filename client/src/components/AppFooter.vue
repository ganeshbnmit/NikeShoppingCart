<template>
  <footer class="footer-section">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <div class="footer-columns">
      <div class="footer-column">
        
        <h3>SUPPORT</h3>
        <ul>
          <li>Contact us</li>
          <li>FAQs</li>
          <li>Promotions & Sale</li>
        </ul>
      </div>

      <div class="footer-column">
        <h3>My Account</h3>
        <ul>
          <li>Track Order</li>
          <li>Exchange & Return Policy</li>
          <li>Shoe Care</li>
          <li>Privacy Policy</li>
          <li>Tech Glossary</li>
          <li>Terms & Conditions</li>
          <li>Initiate Return / Exchange</li>
          <li>Sneakers</li>
          <li>Cookie Settings</li>
        </ul>
      </div>

      <div class="footer-column">
        <h3>ABOUT</h3>
        <ul>
          <li>Company</li>
          <li>Corporate News</li>
          <li>Press Center</li>
          <li>Investors</li>
          <li>Sustainability</li>
          <li>Careers</li>
          <li>Store Locator</li>
          <li>Nike Articles</li>
        </ul>
      </div>

      <div class="footer-column">
        <h3>STAY UP TO DATE</h3>
        <div class="social-icons">
        <a href="#"  title="facebook"> 
            <i class="fa fa-facebook-square" aria-hidden="true"></i>
        </a>
        <a href="#" title="twitter"> 
            <i class="fa fa-twitter-square" aria-hidden="true"></i>
        </a>
        <a href="#" title="instagram">  
            <i class="fa fa-instagram" aria-hidden="true"></i>
        </a>
        <a href="#" title="youtube">
            <i class="fa fa-youtube-square" aria-hidden="true"></i>
        </a>
        <a href="#" title="linkedin">
            <i class="fa fa-linkedin-square" aria-hidden="true"></i>
        </a>
        <a href="#" title="pinterest">
            <i class="fa fa-pinterest-p" aria-hidden="true"></i>
        </a>
    </div>
      </div>
    </div>

    <div class="footer-bottom">
      <div class="footer-country-payment">
        <span>INDIA</span>
        <img src="../assets/visa.png" alt="Visa" />
        <img src="../assets/mastercard.png" alt="MasterCard" />
        <img src="../assets/maestro.png" alt="Maestro" />
        <img src="../assets/american-express.png" alt="American Express" />
        <img src="../assets/upi.png" alt="UPI" />
        <img src="../assets/rupay.png" alt="Rupay" />
      </div>
      <div class="footer-copyright">
        <span>© Nike INDIA LTD, 2024. ALL RIGHTS RESERVED.</span>
        <span>IMPRINT AND LEGAL DATA</span>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'AppFooter'
}
</script>

<style scoped>
.footer-section {
  background-color: #000;
  color: #fff;
  padding: 40px 20px;
}

.footer-columns {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

.footer-column h3 {
  font-size: 16px;
  margin-bottom: 10px;
  font-weight: bold;
}

.footer-column ul {
  list-style: none;
  padding: 0;
}

.footer-column ul li {
  font-size: 14px;
  margin-bottom: 8px;
  cursor: pointer;
}

.footer-column ul li:hover {
  text-decoration: underline;
}

.footer-bottom {
  margin-top: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  padding-top: 20px;
  border-top: 1px solid #333;
}

.footer-country-payment {
  display: flex;
  align-items: center;
  gap: 15px;
}

.footer-country-payment img {
  width: 40px;
}

.footer-copyright {
  font-size: 12px;
  text-align: right;
  margin-top: 10px;
}

.footer-bottom span {
  margin-right: 20px;
  font-size: 12px;
}

@media (max-width: 768px) {
  .footer-columns {
    grid-template-columns: repeat(2, 1fr);
  }
  .footer-country-payment img {
    width: 30px;
  }
}

@media (max-width: 480px) {
  .footer-columns {
    grid-template-columns: 1fr;
  }
}
.social-icons{
	padding:20px;
	
  text-align: center;
}
.social-icons a{
	color:#fff;
  line-height:30px;
  font-size:30px;
  margin: 0 5px;
  text-decoration:none;
  
}
.social-icons a i{
	line-height:30px;
  font-size:30px;
  -webkit-transition: all 200ms ease-in;
  -webkit-transform: scale(1); 
  -ms-transition: all 200ms ease-in;
  -ms-transform: scale(1); 
  -moz-transition: all 200ms ease-in;
  -moz-transform: scale(1);
  transition: all 200ms ease-in;
  transform: scale(1);
}
.social-icons a:hover i{
  box-shadow: 0px 0px 150px #000000;
  z-index: 2;
  -webkit-transition: all 200ms ease-in;
  -webkit-transform: scale(1.5);
  -ms-transition: all 200ms ease-in;
  -ms-transform: scale(1.5);   
  -moz-transition: all 200ms ease-in;
  -moz-transform: scale(1.5);
  transition: all 200ms ease-in;
  transform: scale(1.5);
}
</style>

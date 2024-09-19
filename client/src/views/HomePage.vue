<template>
  <div>
    <MainMenu />
    <div class="home-content">
      <!-- Video Section -->
      <div class="video-section">
        <video class="video-player" autoplay >
          <source src="../assets/vedio4.mp4" type="video/mp4" />
          Your browser does not support the video tag.
        </video>
      </div>
    <div class="text-section">
      <p>Nike Running</p>
      <h2>WINNING ISN’T COMFORTABLE</h2>
      <p>If you don't hate running a little, you don't love running enough.</p>
    </div>
    <div class="banner-section">
        <img src="../assets/banner.png" alt="Banner" class="banner-image" />
    </div>
    <div class="text-section">
      <p>Nike Fashion</p>
      <h2>BE READY BE BETTER</h2>
    </div>
    <router-link to="/products/Men/Clothing">
        <button class="shop-now-button">Shop Now</button>
    </router-link>
      <!-- Images Section -->
    <div class="images-section">
        <img src="../assets/nik7.jpeg" alt="Image 1" class="image-item small-image" />
        <img src="../assets/nik9.jpg" alt="Image 2" class="image-item small-image" />
        <img src="../assets/niklogo.jpg" alt="Center Image" class="image-item center-image" />
        <img src="../assets/offer4.jpeg" alt="Image 3" class="image-item small-image" />
        <img src="../assets/offer5.jpeg" alt="Image 4" class="image-item small-image" />
    </div>
    </div>
        <AppFooter />
    </div>
</template>

<script>
import MainMenu from '@/components/MainMenu.vue';
import AppFooter from '@/components/AppFooter.vue';

export default {
  components: {
    MainMenu,
    AppFooter
   
  },
  mounted() {
    window.addEventListener('scroll', this.handleScroll);
  },
  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    handleScroll() {
      const bannerSection = document.querySelector('.banner-section');
      const bannerImage = document.querySelector('.banner-image');

  
      if (bannerSection && bannerImage) {
        const sectionTop = bannerSection.offsetTop; 
        const scrollTop = window.scrollY + window.innerHeight; 
        const scrollOffset = (scrollTop - sectionTop) / window.innerHeight;
        const transformValue = Math.max(0, Math.min(1, scrollOffset));

        bannerImage.style.transform = `translateX(${(1 - transformValue) * -100}%)`;
      }
    },
  },
};
</script>

<style scoped>
.home-content {
  padding: 20px;
}

.video-section {
  text-align: center;
  margin: 0; 
  padding: 0; 
}

.video-player {
  width: 95vw ; 
  height: 750px;
  margin: 0; 
  padding: 0; 
  object-fit: cover; 
  margin-right: 10px; 
}


.text-section {
  text-align: center;
  margin-top: 20px;
}

.text-section h1 {
  font-size: 36px;
  font-weight: normal;
  margin: 10px 0;
}

.text-section h2 {
  font-size: 48px; 
  font-weight: 900 !important;
  margin: 10px 0;

 
}

.text-section p {
  font-size: 18px;
  font-weight: normal;
  margin-top: 10px;
  color: #555;
  max-width: 800px; 
  margin-left: auto;
  margin-right: auto;
}
.shop-now-button {
  background-color: #000000; 
  color: white;
  border: none;
  border-radius: 20px;
  padding: 12px 14px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s, box-shadow 0.3s;
  margin-top: 10px;
  margin-bottom: 10px;
  outline: none;
}

.shop-now-button:hover {
  background-color: rgb(94, 94, 94); 
  box-shadow: 0 4px 8px rgba(241, 241, 241, 0.2); 
}

.shop-now-button:active {
  background-color: #928e8e; 
  box-shadow: 0 2px 4px rgba(252, 252, 252, 0.2); 
}

.shop-now-button:focus {
  outline: none;
}
.images-section {
  display: grid;
  grid-template-columns: repeat(3, 1fr); 
  grid-template-rows: auto; 
  gap: 20px; 
  justify-items: center; 
  align-items: center; 
  padding: 20px;
}

.small-image {
  width: 100%;
  max-width: 500px; 
  object-fit: cover; 
}

.center-image {
  grid-column: 2 / 3; 
  grid-row: 1 / 3; 
  width: 100%;
  max-width:590px; 
  object-fit: cover;
}

.contact-section {
  text-align: center;
}

.instagram-icon {
  width: 50px;
  height: auto;
}.banner-section {
  position: relative;
  width: 100%;
  height: 600px; 
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

.banner-image {
  position: absolute;
  left: 0;
  width: 100vw;
  height: 100%;
  object-fit: cover;
  transform: translateX(-100%); 
  transition: none; 
}



</style>

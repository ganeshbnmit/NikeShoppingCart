<template>
  <div class="product-page">
     <div class="slider">
      <div
        v-for="(message, index) in messages"
        :key="index"
        :class="['slider-item', { active: currentMessageIndex === index }]"
      >
        <h2>{{ message }}</h2>
      </div>
    </div>
    <div v-if="showOverlay" class="overlay">
      <img src="../assets/trigger.jpg" alt="Trigger Image" class="trigger-image" />
      <button @click="closeOverlay" class="close-btn">X</button>
    </div>

    <div class="product-grid">
      <div v-for="product in products" :key="product.id" class="product-card">
         <router-link :to="`/products/detail/${product.id}`">
         <div class="product-image-container">
        <img :src="`http://localhost:3000${product.image}`" :alt="product.name" class="product-image" />
         </div>
        <div class="product-info">
          <h3>{{ product.name }}</h3>
          <p class="product-price">&#8377;{{ product.price }}</p>

        </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted, watch } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';

export default {
  name: 'ProductPage',
  setup() {
    const route = useRoute();
    const products = ref([]);
    const messages = ref([
      'Huge Discounts Up To 90%!',
      'Exclusive Collection Now Available!',
      'Limited Time Offer on All Products!',
    ]);
    const currentMessageIndex = ref(0);

    const fetchProducts = async () => {
      try {
        const category = route.params.category;
        const subcategory = route.params.subcategory;
        const response = await axios.get(`http://localhost:3000/api/products/${category}/${subcategory}`);
        products.value = response.data;
      } catch (error) {
        console.error('Error fetching products:', error);
      }
    };

    
    const startSlider = () => {
      setInterval(() => {
        currentMessageIndex.value = (currentMessageIndex.value + 1) % messages.value.length;
      }, 5000); 
    };

    onMounted(() => {
      fetchProducts();
      startSlider(); 
    });

    watch(() => route.params, fetchProducts);

    return {
      products,
      messages,
      currentMessageIndex,
    };
  },
   data() {
    return {
      showOverlay: true, 
    };
  },
  methods: {
    closeOverlay() {
      this.showOverlay = false; 
    },
  },
};

</script>

<style scoped>
.product-page {
  padding: 10px;
  font-family: 'Arial', sans-serif;
}

.slider {
  display: flex;
  overflow: hidden;
  height: 70px;
  margin-bottom: 10px;
  justify-content: center;
  align-items: center;
  position: relative;
}

.slider-item {
  width: 100%;
  text-align: center;
  background-color: #f8f8f8;
  font-size: 24px;
  font-weight: bold;
  color: #333;
  padding: 10px;
  opacity: 0;
  transition: opacity 1s ease-in-out; 
  position: absolute;
  font-family: cursive;
}

.slider-item.active {
  opacity: 1; 
}

@keyframes fadeInOut {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 1;
  }
  80% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}


.slider-item.active {
  animation: fadeInOut 5s ease-in-out infinite;
}

.product-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}

.product-card {
  background-color: #fff;
  
  
  text-align: center;
  transition: transform 0.3s;
  
}

.product-card:hover {
  transform: translateY(-10px);
}

.product-image {
  width: 100%;
  height: 650px;
  object-fit: contain;
  margin-bottom: 10px;
}

.product-info {
  margin-top: 10px;
}

.product-info h3 {
  font-size: 18px;
  font-weight: bold;
  color: #333;
}

.product-price {
  font-size: 16px;
  color: #000000;
  margin-top: 5px;
  font-weight: bold;
}
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.8); 
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999; 
  opacity: 0;
  visibility: hidden;
  animation: fadeIn 1s forwards;
  animation-delay: 1s; 
}

.trigger-image {
  max-width: 90%;
  max-height: 90%;
  object-fit: contain;
  transform: translateY(-20px);
  opacity: 0;
  animation: slideIn 1s forwards;
  animation-delay: 1s; 
}

.close-btn {
  position: absolute;
  top: 150px;
  right: 280px;
  background: red;
  color: white;
  font-size: 24px;
  border: none;
  cursor: pointer;
  padding: 5px 10px;
  z-index: 10000; 
}

.close-btn:hover {
  background-color: darkred;
}

.product-page-content {
  visibility: hidden; 
}


@keyframes fadeIn {
  from {
    opacity: 0;
    visibility: hidden;
  }
  to {
    opacity: 1;
    visibility: visible;
  }
}

@keyframes slideIn {
  from {
    transform: translateY(-20px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}
</style>

<template>
  <div class="product-detail">
    <div class="product-image-container">
      <img :src="`http://localhost:3000${product.image}`" :alt="product.name" class="product-image" />
    </div>
    <div class="product-info">
      <h1>{{ product.name }}</h1>
      <p class="price">Price: &#8377;{{ product.price }}</p>
      <div class="size-selector">
        <label for="size">Select Size:</label>
        <select v-model="selectedSize" id="size">
          <option v-for="size in sizes" :key="size" :value="size">{{ size }}</option>
        </select>
      </div>
      <button @click="addToCart" class="add-to-cart-btn">Add to Cart</button>
      <div v-if="message" class="message">{{ message }}</div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      product: {},
      sizes: [],
      selectedSize: '',
      message: '',
    };
  },
  async created() {
    const response = await axios.get(`http://localhost:3000/api/products/${this.$route.params.id}`);
    this.product = response.data;
    this.sizes = this.product.subcategory === 'Shoes' ? ['UK 3','UK 6','UK 7','UK 8','UK 9','UK 10'] : ['S', 'M', 'L', 'XL','XXL'];
  },
  methods: {
    async addToCart() {
      if (!this.selectedSize) {
        alert('Please select a size.');
        return;
    }
      try {
        await axios.post('http://localhost:3000/api/cart', {
          ...this.product,
          size: this.selectedSize,
          quantity: 1,
        });
        this.message = 'Added to Cart Successfully!';
      } catch (error) {
        console.error('Error adding to cart:', error);
        this.message = 'Failed to Add to Cart!';
      }
    },
  },
};
</script>

<style scoped>
.product-detail {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding: 20px;
  
  
  
}

.product-image-container {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
}

.product-image {
  max-width: 100%;
  height: 800px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  margin-left:500px;
}

.product-info {
  flex: 1;
  padding-left: 20px;
}

.product-info h1 {
  font-size: 2rem;
  color: #333;
  margin-bottom: 10px;
}

.product-info .price {
  font-size: 1.5rem;
  color: #e74c3c;
  margin-bottom: 20px;
}

.size-selector {
  margin-bottom: 20px;
}

.size-selector label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

.size-selector select {
  padding: 10px;
  font-size: 1rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  width: 100px;
}

.add-to-cart-btn {
  background-color: #080808;
  color: white;
  border: none;
  padding: 12px 24px;
  font-size: 1rem;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
}

.add-to-cart-btn:hover {
  background-color: #218838;
  transform: translateY(-2px);
}

.add-to-cart-btn:active {
  background-color: #1e7e34;
  transform: translateY(0);
}

.message {
  margin-top: 20px;
  font-size: 1rem;
  color: #28a745;
  font-weight: bold;
}
</style>

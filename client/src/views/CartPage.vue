<template>
  <div class="cart-page">
    <h1>Your Cart</h1>
    <div v-if="cartItems.length === 0" class="empty-cart">
      Your cart is empty.
    </div>
    <div v-else>
      <div class="cart-items-container">
        <div v-for="item in cartItems" :key="item.id" class="cart-item">
          <img :src="`http://localhost:3000${item.image}`" :alt="item.name" class="cart-item-image" />
          <div class="cart-item-details">
            <h2>{{ item.name }}</h2>
            <p class="price">Price: &#8377;{{ item.price }}</p>
            <p>Size: {{ item.size }}</p>
            <button @click="removeFromCart(item.id)" class="remove-btn">Remove</button>
          </div>
        </div>
      </div>
      <div class="checkout">
        <div class="checkout-form">
          <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" v-model="customerDetails.name" id="name" placeholder="Enter your name" />
          </div>
          <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="text" v-model="customerDetails.phone" id="phone" placeholder="Enter your phone number" />
          </div>
          <div class="form-group">
            <label for="address">Delivery Address:</label>
            <input type="text" v-model="customerDetails.address" id="address" placeholder="Enter your delivery address" />
          </div>
          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" v-model="customerDetails.email" id="email" placeholder="Enter your email" />
          </div>
          <div class="form-group">
            <label for="pincode">Pincode:</label>
            <input type="text" v-model="customerDetails.pincode" id="pincode" placeholder="Enter your pincode" />
          </div>
          <div class="total-amount">
            <h2>Total Amount: &#8377;{{ totalAmount }}</h2>
          </div>
          <button @click="checkout" class="checkout-btn">Checkout</button>
        </div>
        <div class="checkout-image">
          <img src="../assets/bag.png" alt="Bag" />
        </div>
      </div>
    </div>
    <AppFooter />
  </div>
</template>

<script>
import axios from 'axios';
import AppFooter from '@/components/AppFooter.vue';
import { useCartStore } from '@/stores/CartStore'; 
import { ref, onMounted,computed } from 'vue'; 
import { useRouter } from 'vue-router';

export default {
  components: {
    AppFooter
  },
  setup() {
    const cartStore = useCartStore();
    const router = useRouter();
    const cartItems = ref([]);
    const customerDetails = ref({ name: '', phone: '', address: '', email: '', pincode: '' });

    const fetchCartItems = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/cart');
        cartItems.value = response.data;
      } catch (error) {
        console.error('Error fetching cart items:', error);
      }
    };

    const removeFromCart = async (id) => {
      try {
        await axios.delete(`http://localhost:3000/api/cart/${id}`);
        cartItems.value = cartItems.value.filter(item => item.id !== id);
      } catch (error) {
        console.error('Error removing item from cart:', error);
      }
    };
     const totalAmount = computed(() => {
        return cartItems.value.reduce((total, item) => total + parseFloat(item.price), 0).toFixed(2);
     });

    const checkout = () => {
      if (!customerDetails.value.address || !customerDetails.value.email) {
        alert('Please fill in all fields.');
        return;
      }

      cartStore.setCustomerDetails({
        name: customerDetails.value.name,
        phone: customerDetails.value.phone,
        address: customerDetails.value.address,
        email: customerDetails.value.email,
        pincode: customerDetails.value.pincode
      });

      
      router.push('/order-confirmation');
    };

    onMounted(() => {
      fetchCartItems();
    });

    return {
      cartItems,
      customerDetails,
      removeFromCart,
      checkout,
      totalAmount
    };
  }
};
</script>



<style scoped>
.cart-page {
  padding: 20px;
  background-color: #f9f9f9;
}

h1 {
  font-size: 2.5rem;
  color: #333;
  text-align: center;
  margin-bottom: 20px;
}

.empty-cart {
  text-align: center;
  font-size: 1.2rem;
  color: #888;
}

.cart-items-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
}

.cart-item {
  display: flex;
  align-items: center;
  background: white;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  padding: 15px;
  margin-bottom: 20px;
}

.cart-item-image {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border-radius: 10px;
  margin-right: 20px;
}

.cart-item-details {
  flex: 1;
}

.cart-item-details h2 {
  font-size: 1.5rem;
  color: #333;
  margin-bottom: 10px;
}

.cart-item-details .price {
  font-size: 1.2rem;
  color: #000000;
  margin-bottom: 10px;
}

.remove-btn {
  background-color: #000000;
  color: white;
  border: none;
  padding: 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
}

.remove-btn:hover {
  background-color: #c62828;
  transform: translateY(-2px);
}

.remove-btn:active {
  background-color: #b71c1c;
  transform: translateY(0);
}

.checkout {
  margin-top: 20px;
 
  padding: 20px;

  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  align-items: center;
}

.checkout-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.form-group {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.form-group label {
  flex: 1;
  font-size: 1rem;
  color: #333;
  font-weight: 600;
  margin-right: 10px;
}

.form-group input {
  flex: 2;
  padding: 10px;
  border: 2px solid #ddd;
  border-radius: 8px;
  font-size: 1rem;
  outline: none;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.form-group input:focus {
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

.checkout-btn {
  background-color: #000000;
  color: white;
  border: none;
  padding: 15px 25px;
  font-size: 1.2rem;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
  margin-left: 400px;
  margin-right: 400px;
}

.checkout-btn:hover {
  background-color: #696969;
  transform: translateY(-2px);
}

.checkout-btn:active {
  background-color: #004085;
  transform: translateY(0);
}

.checkout-image {
  display: flex;
  justify-content: center;
}

.checkout-image img {
  max-width: 100%;
  height: auto;
}
.total-amount {
  text-align: center;
  font-size: 1.5rem;
  font-weight: bold;
  margin-top: 20px;
}

@media (max-width: 768px) {
  .checkout {
    grid-template-columns: 1fr;
    gap: 10px;
  }

  .checkout-btn {
    padding: 12px 20px;
    font-size: 1rem;
  }

  .form-group {
    flex-direction: column;
  }

  .form-group label {
    margin-bottom: 5px;
  }
}

</style>

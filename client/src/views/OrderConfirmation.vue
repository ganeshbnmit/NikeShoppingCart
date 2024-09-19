<template>
  <div class="order-confirmation d-flex justify-content-center align-items-center">
    <div class="confirmation-card p-4">
      <h1 class="text-center mb-4">Thank You for Your Order!</h1>
      <p class="text-center mb-3 highlighted-text">Your order has been confirmed, {{ customerDetails.name }}.</p>
      <p class="text-center mb-3">We will deliver to: {{ customerDetails.address }}.</p>
      <p class="text-center mb-3">If needed, we'll contact you at: {{ customerDetails.phone }} or {{ customerDetails.email }}.</p>
    </div>
  </div>
</template>

<script>
import { useCartStore } from '@/stores/CartStore';

export default {
  setup() {
    const cartStore = useCartStore();
    return { customerDetails: cartStore.customerDetails };
  }
};
</script>

<style scoped>
.order-confirmation {
  height: 100vh;
  background-image: url('../assets/background.jpeg');
  background-size: cover;
  background-position: center;
  color: #333;
}

.confirmation-card {
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 15px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  max-width: 600px;
  width: 100%;
}

.highlighted-text {
  color: #007bff;
  font-weight: bold;
  font-size: 1.5rem;
}

h1 {
  font-size: 2.5rem;
  color: #333;
}

p {
  font-size: 1.2rem;
  color: #666;
}
</style>

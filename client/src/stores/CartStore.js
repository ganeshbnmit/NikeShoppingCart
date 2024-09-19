import { defineStore } from 'pinia';

export const useCartStore = defineStore('cart', {
  state: () => ({
    customerDetails: {
      name: '',
      phone: '',
      address: '',
      email: '',
      pincode: ''
    }
  }),
  actions: {
    setCustomerDetails(details) {
      this.customerDetails = { ...details };
    },
    clearCustomerDetails() {
      this.customerDetails = {
        name: '',
        phone: '',
        address: '',
        email: '',
        pincode: ''
      };
    }
  }
});

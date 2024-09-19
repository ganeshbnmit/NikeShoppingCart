<template>
<div class="background">
  <div class="admin-manage-products">
    <h1>Manage Products</h1>
    <form @submit.prevent="handleAddProduct" enctype="multipart/form-data">
      <div class="form-group">
        <label for="category">Category:</label>
        <select v-model="selectedCategory" required>
          <option value="">Select Category</option>
          <option value="Men">Men</option>
          <option value="Women">Women</option>
          <option value="Kids">Kids</option>
        </select>
      </div>
      <div class="form-group">
        <label for="subcategory">Subcategory:</label>
        <select v-model="selectedSubcategory" required>
          <option value="">Select Subcategory</option>
          <option v-if="selectedCategory" value="Shoes">Shoes</option>
          <option v-if="selectedCategory" value="Clothing">Clothing</option>
        </select>
      </div>
      <div class="form-group">
        <label for="name">Product Name:</label>
        <input type="text" v-model="productName" required />
      </div>
      <div class="form-group">
        <label for="image">Product Image:</label>
        <input type="file" @change="handleFileChange" required />
      </div>
      <div class="form-group">
        <label for="price">Price:</label>
        <input type="number" v-model="productPrice" required />
      </div>
      <button class="submit-button" type="submit">Add Product</button>
    </form>
  </div>
</div>
</template>

<script>
export default {
  name: 'AdminManageProducts',
  data() {
    return {
      selectedCategory: '',
      selectedSubcategory: '',
      productName: '',
      productImage: null,
      productPrice: '',
      products: []
    };
  },
  methods: {
    handleFileChange(event) {
      this.productImage = event.target.files[0];
    },
    async handleAddProduct() {
      try {
        const formData = new FormData();
        formData.append('category', this.selectedCategory);
        formData.append('subcategory', this.selectedSubcategory);
        formData.append('name', this.productName);
        formData.append('image', this.productImage);
        formData.append('price', this.productPrice);

        await this.$axios.post('/admin/products', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        });
        this.fetchProducts();
        this.resetForm();
      } catch (error) {
        console.error(error);
        alert('Failed to add product');
      }
    },
    async fetchProducts() {
      try {
        const response = await this.$axios.get('/admin/products');
        this.products = response.data;
      } catch (error) {
        console.error(error);
        alert('Failed to fetch products');
      }
    },
    resetForm() {
      this.selectedCategory = '';
      this.selectedSubcategory = '';
      this.productName = '';
      this.productImage = null;
      this.productPrice = '';
    }
  },
  created() {
    this.fetchProducts();
  }
};
</script>

<style scoped>
.background{
   height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  background-color: #000000;
}
.admin-manage-products {
  max-width: 600px;
  margin: auto;
  padding: 20px;
  text-align: center;
  background-color: #363636;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
  font-size: 2rem;
  margin-bottom: 20px;
  color: #f8f8f8;
  font-weight: bold;
}

form {
  position: relative;
  width: 400px;
  padding: 50px 35px;
  background-color: rgba(255, 255, 255, 0.13);
  backdrop-filter: blur(10px);
  border-radius: 10px;
  border: 2px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
  text-align: center;
}

.form-group {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  color: #ffffff;
}

label {
  font-weight: bold;
  margin-bottom: 5px;
}

input, select {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 1rem;
  transition: border-color 0.3s;
}

input:focus, select:focus {
  border-color: #007bff;
}

button.submit-button {
  background-color: #ffffff; 
  color: rgb(0, 0, 0);
  border: none;
  border-radius: 20px;
  padding: 12px 14px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s, box-shadow 0.3s;
  margin-top: 15px;
  
  outline: none;
}
button.submit-button:hover {
  background-color: #b8b8b8;
}
</style>

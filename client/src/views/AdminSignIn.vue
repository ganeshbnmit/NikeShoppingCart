<template>
  <div class="admin-signin">
    <form @submit.prevent="handleSignIn">
      <h3>Admin Sign In</h3>
      <label for="username">Username</label>
      <input type="text" v-model="username" id="username" placeholder="Email or Phone" required />
      <label for="password">Password</label>
      <input type="password" v-model="password" id="password" placeholder="Password" required />
      <button type="submit">Sign In</button>
    </form>
    <div class="logo">
        <img src="../assets/logo_nke.jpg" alt="logo" class="logo-image" />
    </div>
  </div>
</template>

<script>
export default {
  name: 'AdminSignIn',
  data() {
    return {
      username: '',
      password: ''
    };
  },
  methods: {
    async handleSignIn() {
      try {
        const response = await this.$axios.post('/admin/signin', {
          username: this.username,
          password: this.password
        });
        if (response.data.success) {
          this.$router.push('/admin/manage-products');
        } else {
          alert('Invalid credentials');
        }
      } catch (error) {
        console.error(error);
        alert('An error occurred');
      }
    }
  }
};
</script>

<style scoped>

.admin-signin {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  background-color: #000000;
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

form h3 {
  font-size: 32px;
  font-weight: 500;
  color: white;
  margin-bottom: 30px;
}


label {
  display: block;
  font-size: 16px;
  font-weight: 500;
  color: white;
  margin-top: 20px;
}

input {
  width: 100%;
  height: 50px;
  background-color: rgba(255, 255, 255, 0.07);
  border-radius: 3px;
  padding: 0 10px;
  margin-top: 8px;
  font-size: 14px;
  color: white;
}

::placeholder {
  color: #e5e5e5;
}

button {
  margin-top: 30px;
  width: 100%;
  padding: 15px 0;
  background-color: #ffffff;
  color: #080710;
  font-size: 18px;
  font-weight: 600;
  border-radius: 5px;
  cursor: pointer;
}
.logo {
  position: absolute;
  bottom: 20px; 
   text-align: center;  
}

.logo img {
  width: 200px; 
  height: auto;
}

</style>

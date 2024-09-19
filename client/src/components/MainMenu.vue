<template>
  <header class="main-menu">
    <div class="logo">
      <a :href="`/`">
      <img src="../assets/icon.png" alt="Nike Logo" />
      </a>
    </div>
    <nav class="nav-menu">
      <ul>
        <li class="menu-item">
          <router-link to="/products/Men/Shoes">Men</router-link>
          <ul class="submenu">
            <li><router-link :to="{ path: '/products/Men/Shoes' }">Shoes</router-link></li>
            <li><router-link :to="{ path: '/products/Men/Clothing' }">Clothing</router-link></li>
          </ul>
        </li>
        <li class="menu-item">
          <router-link to="/products/Women/Shoes">Women</router-link>
          <ul class="submenu">
            <li><router-link :to="{ path: '/products/Women/Shoes' }">Shoes</router-link></li>
            <li><router-link :to="{ path: '/products/Women/Clothing' }">Clothing</router-link></li>
          </ul>
        </li>
        <li class="menu-item">
          <router-link to="/products/Kids/Shoes">Kids</router-link>
          <ul class="submenu">
            <li><router-link :to="{ path: '/products/Kids/Shoes' }">Shoes</router-link></li>
            <li><router-link :to="{ path: '/products/Kids/Clothing' }">Clothing</router-link></li>
          </ul>
        </li>
      </ul>
    </nav>
     <div class="cart">
      <a :href="`/cart`">
        <img src="../assets/cart-icon.png" alt="Cart" />
      </a>
    </div>
  </header>
</template>

<script>
export default {
  name: 'MainMenu',
}
</script>

<style scoped>
.main-menu {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #f8f8f8;
  border-bottom: 1px solid #ddd;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 1000;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin: 0; /* Remove top gap */
  font-family:  sans-serif; 
}

.logo img {
  height: 40px;
}

.nav-menu ul {
  display: flex;
  list-style: none;
  padding: 0;
  margin: 0;
}

.nav-menu .menu-item {
  position: relative;
  margin: 0 20px;
}

.nav-menu a {
  text-decoration: none;
  color: #333;
  font-weight: bold;
  display: block;
  padding: 10px;
}

.nav-menu .submenu {
  display: none;
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #fff;
  list-style: none;
  padding: 0;
  margin: 0;
  border: 1px solid #ddd;
  z-index: 1000;
}

.nav-menu .submenu li {
  padding: 10px;
}

.nav-menu .submenu li a {
  color: #333;
}

.nav-menu .menu-item:hover .submenu {
  display: block;
}


.cart {
  display: flex;
}

.cart img {
  height: 34px;
  margin-right: 25px; 
}
</style>

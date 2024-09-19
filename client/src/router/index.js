import { createRouter, createWebHistory } from 'vue-router';
import HomePage from '../views/HomePage.vue';
import AdminSignIn from '../views/AdminSignIn.vue';
import AdminManageProducts from '../views/AdminManageProducts.vue';
import ProductPage from '../views/ProductPage.vue';
import ProductDetail from '../views/ProductDetail.vue';
import CartPage from '../views/CartPage.vue';
import OrderConfirmation from '@/views/OrderConfirmation.vue'; 

const routes = [
  { path: '/', component: HomePage },
  { path: '/admin', component: AdminSignIn },
  { path: '/admin/manage-products', component: AdminManageProducts },
  { path: '/products/:category/:subcategory', component: ProductPage, props: true },
  { path: '/products/detail/:id', component: ProductDetail },
  { path: '/cart', component: CartPage },
  { path: '/order-confirmation', component: OrderConfirmation }
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

export default router;


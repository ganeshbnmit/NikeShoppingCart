const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../database'); 

const Cart = sequelize.define('Cart', {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  image: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  price: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true,
  },
  size: {
    type: DataTypes.STRING(50),
    allowNull: true,
  },
}, {
  timestamps: true,
});

module.exports = Cart;

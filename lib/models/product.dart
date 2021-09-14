import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  Product(
      {this.id = 0,
      this.image = "",
      this.title = "",
      this.price = 0,
      this.description = "",
      this.size = 0});
}

List<Product> products = [
  Product(
    id: 1,
    title: "Office Code",
    price: 234,
    size: 12,
    description: "dummyText",
    image: "assets/images/virus.png",
  ),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: "dummyText",
      image: "assets/images/bag_2.png"),
  Product(
    id: 3,
    title: "Hang Top",
    price: 234,
    size: 10,
    description: "dummyText",
    image: "assets/images/bag_3.png",
  ),
  Product(
    id: 4,
    title: "Old Fashion",
    price: 234,
    size: 11,
    description: "dummyText",
    image: "assets/images/bag_4.png",
  ),
  Product(
    id: 5,
    title: "Office Code",
    price: 234,
    size: 12,
    description: "dummyText",
    image: "assets/images/bag_5.png",
  ),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: "dummyText",
    image: "assets/images/bag_6.png",
  ),
];

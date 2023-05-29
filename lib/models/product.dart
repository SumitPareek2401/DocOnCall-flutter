import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Cancer Care",
    price: 1700,
    size: 12,
    description: dummyText,
    image: "assets/images/cancerCare.jfif",
    color: const Color(0xFF3D82AE),
  ),
  Product(
    id: 2,
    title: "Cardiologist",
    price: 1300,
    size: 12,
    description: dummyText,
    image: "assets/images/cardiologist.jfif",
    color: const Color(0xFFD3A984),
  ),
  Product(
    id: 3,
    title: "Dental Care",
    price: 500,
    size: 10,
    description: dummyText,
    image: "assets/images/dentist_image.png",
    color: const Color(0xFF989493),
  ),
  Product(
    id: 4,
    title: "Neurologist",
    price: 10000,
    size: 11,
    description: dummyText,
    image: "assets/images/neurologist.jfif",
    color: const Color(0xFFE6B398),
  ),
  Product(
    id: 5,
    title: "Orthopaedic",
    price: 7000,
    size: 12,
    description: dummyText,
    image: "assets/images/orthopaedic.jfif",
    color: const Color(0xFFFB7883),
  ),
  Product(
    id: 6,
    title: "Physiotherapy",
    price: 9000,
    size: 12,
    description: dummyText,
    image: "assets/images/physiotherapy.jfif",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Best doctors in your area and in your city\nBook your appointment today!\nTap on location below to get nearby doctors location";

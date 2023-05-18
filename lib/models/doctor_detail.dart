import 'package:flutter/material.dart';

class Doctor {
  final int id;
  final String docname;
  final String profession;
  final int fees;
  final double latitude;
  final double longitude;
  final String book;

  Doctor({
    this.id,
    this.docname,
    this.profession,
    this.fees,
    this.latitude,
    this.longitude,
    this.book,
  });
}

List<Doctor> doctors = [
  Doctor(
    id: 1,
    docname: 'Dr. Gupta',
    profession: 'MBBS',
    fees: 500,
    book: 'Book your appointment',
    latitude: 26.766156,
    longitude: 75.854047,
  ),
  Doctor(
    id: 2,
    docname: 'Dr. Beniwal',
    profession: 'Orthologist',
    fees: 500,
    book: 'Book your appointment',
    latitude: 26.766156,
    longitude: 75.854047,
  ),
  Doctor(
    id: 3,
    docname: 'Dr. Sindhi',
    profession: 'Physiologist',
    fees: 400,
    book: 'Book your appointment',
    latitude: 26.766156,
    longitude: 75.854047,
  ),
  Doctor(
    id: 4,
    docname: 'Dr. Chauhan',
    profession: 'Dentist',
    fees: 2900,
    book: 'Book your appointment',
    latitude: 26.766156,
    longitude: 75.854047,
  ),
  Doctor(
    id: 5,
    docname: 'Dr. Sharma',
    profession: 'Cardiologist',
    fees: 1000,
    book: 'Book your appointment',
    latitude: 26.766156,
    longitude: 75.854047,
  ),
];


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/category_model.dart';
import '../models/diet_model.dart';
class HomePage extends StatelessWidget {
   HomePage({super.key});


  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  // Fungsi _getCategories hanya mengambil data kategori
  void _getCategories() {
    // Mengambil daftar kategori dari model CategoryModel
    categories = CategoryModel.getCategories();
  }

  // Fungsi getDiet hanya mengambil data diet
  void getDiet() {
    // Mengambil daftar diet dari model DietModel
    diets = DietModel.getDiet();
  }


  // Fungsi _getInitialInfo mengambil data kategori dan diet sekaligus
  void _getInitialInfo() {
  // Mengambil daftar kategori dari model CategoryModel
  categories = CategoryModel.getCategories();

  // Mengambil daftar diet dari model DietModel
  diets = DietModel.getDiet();
  }

  // @override
  // void initState(){
  //   _getCategories();  
  // }
  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getInitialInfo();
    //build method return type is widget
    //scaffold adalah kelas yang menyediakan widget kaya drawer
    //appbar,snackbar,bottom navigation bar, float acrion button dll
    //framework untuk implementasi material basic
    return Scaffold(
      appBar: appbar(),
      backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            seachtext(),
            const SizedBox(height: 40,),// bisa buat kasih jarak antar widget
            categories_section(),
            const SizedBox(height: 40,),
            diet_section()
          ],
        ),
      );
  }

  Column diet_section() {
    return Column(
            children: [
              const Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Recommendation \nFor Diets',
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 240,
                child: ListView.separated(
                  itemBuilder: (context,index){
                    return Container(
                      width: 210,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(20),
                        color: diets[index].boxColor.withOpacity(0.1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: SvgPicture.asset(diets[index].iconPatch)),
                          Column(
                            children: [
                              Text(
                                diets[index].nama,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 15
                                ),
                              ),
                              Text(
                            diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie,
                            style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                            ],
                          ),
                          
                          Container(
                            height: 45,
                            width: 130,
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(
                                  color: diets[index].viewSelected ? Colors.white : Color(0xffC58BF2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                 diets[index].viewSelected ? Color(0xff9DCEFF) : Colors.transparent,
                                 diets[index].viewSelected ? Color(0xff92A3FD) : Colors.transparent,
                                ]
                              ),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 25,),
                  itemCount: diets.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(//buat kasih jarak box recomendasi dari layar
                    left: 20,
                    right: 20
                  ),
                  ),
              )
            ],
          );
  }

  // Defines a method that returns a Column widget for displaying categories
Column categories_section() {
  return Column(
    children: [
      // Padding widget to add space around the 'Category' text
       const Padding(
        padding: EdgeInsets.only(left: 20), // Adds padding only on the left
        child: SizedBox(//dipake biar bisa setting width dan text align
          width: double.infinity, // Menyebabkan Text mengambil seluruh lebar yang tersedia,
                        // sehingga textAlign bisa bekerja. Tanpa ini, Text hanya 
                        // mengambil lebar sesuai dengan isinya, jadi textAlign tidak berfungsi. // Makes the width of the container fill the parent
          child: Text(
            'Category', // The text displayed
            style: TextStyle(
              color: Colors.black, // Sets the text color to black
              fontSize: 18, // Sets the font size to 18
              fontWeight: FontWeight.w600, // Sets the background color to yellow
            ),
            textAlign: TextAlign.left, // Aligns the text to the left
          ),
        ),
      ),
      const SizedBox(height: 15), // Adds vertical space of 15 pixels between the text and the list
      // Container widget to hold the horizontally scrolling list of categories
      Container(
        height: 150, // Sets the height of the container
        child: ListView.separated(
          scrollDirection: Axis.horizontal, // Makes the list scroll horizontally
          itemCount: categories.length, // The number of items in the list, determined by the length of the categories list
          separatorBuilder: (context, index) => const SizedBox(width: 25), // Adds space between items in the list
          padding: const EdgeInsets.only(
            left: 20, // Adds padding on the left side of the list
            right: 20, // Adds padding on the right side of the list
          ),
          itemBuilder: (context, index) {
            // Builds each item in the list
            return Container(
              width: 105, // Sets the width of each item container
              decoration: BoxDecoration(
                color: categories[index].boxColor.withOpacity(0.2), // Sets background color with opacity
                borderRadius: BorderRadius.circular(14), // Rounds the corners of the container
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distributes children evenly along the vertical axis
                children: [
                  // Container for the category icon
                  Container(
                    width: 50, // Sets the width of the icon container
                    height: 50, // Sets the height of the icon container
                    decoration: BoxDecoration(
                      color: Colors.white, // Sets background color to white
                      shape: BoxShape.circle, // Makes the container circular
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // Adds padding around the icon
                      child: SvgPicture.asset(categories[index].iconPath), // Displays the SVG icon
                    ),
                  ),
                  // Text widget to display the category name
                  Text(
                    categories[index].name, // Displays the category name
                    style: TextStyle(
                      fontWeight: FontWeight.w100, // Sets the font weight to thin
                      color: Colors.black, // Sets the text color to black
                      fontSize: 14, // Sets the font size to 14
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}


  Container seachtext() {
    return Container(
            margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
            decoration: BoxDecoration(
             boxShadow: [ // Daftar efek bayangan (shadow) yang akan diterapkan
                BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.11), // Warna bayangan dengan tingkat transparansi 0.11
                  blurRadius: 40, // Radius buram (blur) bayangan; semakin besar nilainya, semakin buram bayangan
                  spreadRadius: 0.0 // Jarak penyebaran bayangan; 0 berarti tidak ada penyebaran tambahan dari ukuran asli
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15), // Padding di sekitar konten di dalam widget; 15 piksel di semua sisi
                hintText: 'Search Pancake',
                hintStyle: const TextStyle(
                  color: Color(0xffDDDADA),
                  fontSize: 14
                ),
                prefixIcon: Padding( // Menambahkan ikon di bagian depan (sebelah kiri) input field
                  padding: const EdgeInsets.all(12), // Memberikan padding sebesar 12 piksel di semua sisi pada ikon
                  child: SvgPicture.asset('assets/icons/search-svgrepo-com.svg'), // Memuat gambar SVG dari ikon pencarian (search)
                ),

                suffixIcon: SizedBox(
                  width: 100,//biar hint text keluar soale kalo ga row bakal full layar
                  child: IntrinsicHeight( // Mengatur tinggi child widget agar sesuai dengan konten terpanjang di dalam Row
                    child: Row( // Mengatur widget secara horizontal (ikon dan divider) di bagian belakang input field
                      mainAxisAlignment: MainAxisAlignment.end, // Menempatkan anak-anak Row di ujung kanan (end)
                      children: [
                        const VerticalDivider( // Menambahkan garis vertikal di antara ikon pencarian dan ikon filter
                          color: Colors.black,// Warna divider hitam
                          indent: 10, // Jarak antara bagian atas Divider dan batas atas widget sebesar 10 piksel
                          endIndent: 10, // Jarak antara bagian bawah Divider dan batas bawah widget sebesar 10 piksel
                          thickness: 0.5, // Ketebalan divider sangat tipis (0.1 piksel)
                        ),
                        Padding( // Menambahkan padding untuk ikon filter
                          padding: const EdgeInsets.all(12), // Padding sebesar 12 piksel di semua sisi
                          child: SvgPicture.asset('assets/icons/filter-svgrepo-com (1).svg'), // Memuat gambar SVG dari ikon filter
                        ),
                      ],
                    ),
                  ),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), // Menentukan sudut membulat dengan radius 15 piksel
                  borderSide: BorderSide.none // Tidak ada garis batas; ini berarti batasnya tidak akan terlihat
                )
              ),
            ),
          );
  }

  AppBar appbar() {
    return AppBar(

      title: const Text(
      'Breakfast',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
      )
      ),
      backgroundColor: Colors.white,
      centerTitle: true,// POSISI TULISAN
      elevation: 0,//HILANGKAN SHADOW
      leading: GestureDetector(
        onTap: (){
          
        },
        child : Container(//leading pada widget AppBar digunakan untuk menempatkan widget di bagian awal (sisi kiri) dari AppBar
        margin: const EdgeInsets.all(10),//mengecilkan container
        alignment: Alignment.center,
        
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset('assets/icons/left-arrow-svgrepo-com.svg',
        height: 20,
        width: 20,//kenapa ga berubah ? wkwkwkkw
        ),
      ),
    ),
      actions: [//actions adalah sebuah parameter dalam widget AppBar yang digunakan untuk menambahkan widget-widget tambahan, seperti ikon atau tombol, di sisi kanan AppBar
        GestureDetector(
        onTap: (){

        },
        child : Container(//leading pada widget AppBar digunakan untuk menempatkan widget di bagian awal (sisi kiri) dari AppBar
        margin: const EdgeInsets.all(10),//mengecilkan container
        alignment: Alignment.center,
        
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset('assets/icons/dots-horizontal-svgrepo-com.svg',
        height: 20,
        width: 20,//kenapa ga berubah ? wkwkwkkw
        ),
      ),
        )
      ],
    );
  }
}
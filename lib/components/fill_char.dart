import 'package:deneme_p/constants.dart';
import 'package:flutter/material.dart';

class FillChar extends StatefulWidget {
  const FillChar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FillCharState createState() => _FillCharState();
}

class _FillCharState extends State<FillChar> {
  bool hasValue =
      false; // Değer var mı yok mu kontrolü için bir boolean değişken

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.screenWidth(context) / 8,
      height: Constants.screenHeight(context) / 12,
      child: TextField(
        onChanged: (value) {
          setState(() {
            hasValue =
                value.isNotEmpty; // Değer girildiğinde hasValue'yi güncelle
          });
        },
        maxLength: 1, // Sadece 1 karaktere izin verir
        decoration: InputDecoration(
          counterText: '', // Karakter sayacı metnini boş bırakır
          counterStyle:
              const TextStyle(fontSize: 0), // Karakter sayacı stilini gizler
          fillColor: hasValue ? Colors.orange : Colors.red,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.transparent, // Çerçeve rengini şeffaf yapar
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors
                  .transparent, // Aktif olduğunda çerçeve rengini şeffaf yapar
            ),
          ),
        ),
        cursorColor: Colors.white, // İmleç rengini beyaz yapar
      ),
    );
  }
}

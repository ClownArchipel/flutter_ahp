import 'package:ahp/model/kost.dart';
import 'package:ahp/model/setkriteria.dart';
import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://ahp.floopyer.com/api';
  final Dio dio = Dio();

  // Kost
  Future<List<dynamic>> getKosts() async {
    try {
      Response response = await dio.get('$baseUrl/kosts');
      return response.data;
    } catch (error) {
      print('Error: $error');
      rethrow; // Anda dapat menangani error lebih lanjut sesuai kebutuhan
    }
  }

  Future<String> deleteKost(int kostId) async {
    try {
      Response response = await dio.delete('$baseUrl/kosts/$kostId');
      // Handle response if needed
      if (response.statusCode == 200) {
        // Respons yang diharapkan adalah sukses
        Map<String, dynamic> responseData = response.data;
        String message = responseData['msg'];

        return message;
      } else {
        // Respons status code tidak sesuai harapan
        print('Failed to delete kost. Status Code: ${response.statusCode}');
        return 'Failed to delete kost. Status Code: ${response.statusCode}';
      }
    } catch (error) {
      print('Error: $error');
      rethrow; // Handle error if needed
    }
  }

  Future<String> createKost(form) async {
    final formData = FormData.fromMap({
      'name': form["name"],
      'address': form["address"],
      'price': form["price"],
      'facility': form["facility"],
      'room_size': form["sizeRoom"],
      'rating': form["rating"],
    });

    try {
      final response = await dio.post('$baseUrl/kosts', data: formData);
      if (response.statusCode == 200) {
        // Respons yang diharapkan adalah sukses
        Map<String, dynamic> responseData = response.data;
        String message = responseData['msg'];
        return message;
      } else {
        // Respons status code tidak sesuai harapan
        return 'Failed to delete kost. Status Code: ${response.statusCode}';
      }
    } catch (error) {
      // print('Error: $error');
      rethrow; // Handle error if needed
    }
  }

  Future<String> updateKost(form, id) async {
    try {
      final response = await dio.put('$baseUrl/kosts/$id', data: {
        'name': form["name"],
        'address': form["address"],
        'price': form["price"],
        'number_of_rooms': form["totalRoom"],
        'room_size': form["sizeRoom"],
        'rating': form["rating"],
      });
      if (response.statusCode == 200) {
        // Respons yang diharapkan adalah sukses
        Map<String, dynamic> responseData = response.data;
        String message = responseData['msg'];
        return message;
      } else {
        // Respons status code tidak sesuai harapan
        return 'Failed to delete kost. Status Code: ${response.statusCode}';
      }
    } catch (error) {
      // print('Error: $error');
      rethrow; // Handle error if needed
    }
  }

  Future<Kost> getOneKost(id) async {
    try {
      Response response = await dio.get('$baseUrl/kosts/$id');
      Kost data = Kost.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }


  // Kriteria
  Future<List<dynamic>> getKriteria() async {
    try {
      Response response = await dio.get('$baseUrl/kriteria');
      return response.data;
    } catch (error) {
      print('Error: $error');
      rethrow; // Anda dapat menangani error lebih lanjut sesuai kebutuhan
    }
  }

  //Set Kriteria
  Future<SetKriteria> getSetKriteria() async {
    try {
      Response response = await dio.get('$baseUrl/set-kriteria');
      SetKriteria data = SetKriteria.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateSetKriteria(form) async {
    try {
      final response = await dio.put('$baseUrl/set-kriteria/1', data: {
        'k1': form["k1"],
        'k2': form["k2"],
        'k3': form["k3"],
        'k4': form["k4"],
      });
      if (response.statusCode == 200) {
        // Respons yang diharapkan adalah sukses
        Map<String, dynamic> responseData = response.data;
        String message = responseData['msg'];
        return message;
      } else {
        // Respons status code tidak sesuai harapan
        return 'Failed to delete kost. Status Code: ${response.statusCode}';
      }
    } catch (error) {
      // print('Error: $error');
      rethrow; // Handle error if needed
    }
  }


// get perhitungan
Future<List<dynamic>> getDataPerhitungan() async {
    try {
      Response response = await dio.get('$baseUrl/perhitungan');
      return response.data["finalData"];
    } catch (error) {
      // print('Error: $error');
      rethrow; // Anda dapat menangani error lebih lanjut sesuai kebutuhan
    }
  }

Future<List<dynamic>> getPerbandingan() async {
    try {
      Response response = await dio.get('$baseUrl/perhitungan');
      return response.data["perhitunganKriteria"];
    } catch (error) {
      // print('Error: $error');
      rethrow; // Anda dapat menangani error lebih lanjut sesuai kebutuhan
    }
  }

  Future<List<dynamic>> getHasilPerbandingan() async {
    try {
      Response response = await dio.get('$baseUrl/perhitungan');
      return response.data["jumlah_nilai_k"];
    } catch (error) {
      // print('Error: $error');
      rethrow; // Anda dapat menangani error lebih lanjut sesuai kebutuhan
    }
  }

  Future<List<dynamic>> getEigen() async {
    try {
      Response response = await dio.get('$baseUrl/perhitungan');
      return response.data["eigen"];
    } catch (error) {
      // print('Error: $error');
      rethrow; // Anda dapat menangani error lebih lanjut sesuai kebutuhan
    }
  }

  Future<List<dynamic>> getKonstanta() async {
    try {
      Response response = await dio.get('$baseUrl/perhitungan');
      return response.data["jumlah_konstanta"];
    } catch (error) {
      // print('Error: $error');
      rethrow; // Anda dapat menangani error lebih lanjut sesuai kebutuhan
    }
  }

  Future<List<dynamic>> getPrioritas() async {
    try {
      Response response = await dio.get('$baseUrl/perhitungan');
      return response.data["prioritas"];
    } catch (error) {
      // print('Error: $error');
      rethrow; // Anda dapat menangani error lebih lanjut sesuai kebutuhan
    }
  }


// Rekomendasi
 Future<String> rekomendasi() async {
    try {
      final response = await dio.get('$baseUrl/perhitungan');
      if (response.statusCode == 200) {
        // Respons yang diharapkan adalah sukses
        Map<String, dynamic> responseData = response.data;
        String message = responseData['rekomendasi'][1];
        print(responseData['rekomendasi']);
        return message;
      } else {
        // Respons status code tidak sesuai harapan
        return 'Failed to delete kost. Status Code: ${response.statusCode}';
      }
    } catch (error) {
      // print('Error: $error');
      rethrow; // Handle error if needed
    }
  }
}

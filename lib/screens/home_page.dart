import 'package:flutter/material.dart';
import '../model/model.dart';
import '../server/server.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Welcome>> _carData;

  @override
  void initState() {
    super.initState();
    _carData = getCarName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder<List<Welcome>>(
        future: _carData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            List<Welcome> carData = snapshot.data!;

            return ListView.builder(
              itemCount: carData.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CarDetailsScreen(car: carData[index]),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        '${carData[index].make}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        'Year: ${carData[index].year.toString()}',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}



class CarDetailsScreen extends StatelessWidget {
  final Welcome car; 

  CarDetailsScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Make: ${car.make}'),
            Text('Model: ${car.model}'),
            Text('combinationMpg: ${car.combinationMpg}'),
            Text('fuelType: ${car.fuelType}'),
          ],
        ),
      ),
    );
  }
}

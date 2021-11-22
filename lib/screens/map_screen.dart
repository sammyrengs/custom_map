import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


 class GoogleMapScreen extends StatefulWidget {
   const GoogleMapScreen({Key? key}) : super(key: key);

   @override
   _GoogleMapScreenState createState() => _GoogleMapScreenState();
 }

 class _GoogleMapScreenState extends State<GoogleMapScreen> {
   late BitmapDescriptor mapMarker;
   late BitmapDescriptor mapMarker2;
   late BitmapDescriptor mapMarker3;
   Set<Marker> _markers = {};

   @override
   void initState() {
     super.initState();
     setCustomMarker();
     setCustomMarker2();
     setCustomMarker3();
   }

   void setCustomMarker() async {
     mapMarker = await BitmapDescriptor.fromAssetImage(
         ImageConfiguration(),
         'assets/tree.png');
   }

   void setCustomMarker2() async {
     mapMarker2 = await BitmapDescriptor.fromAssetImage(
         ImageConfiguration(),
         'assets/cricket.png');
   }
   void setCustomMarker3() async {
     mapMarker3 = await BitmapDescriptor.fromAssetImage(
         ImageConfiguration(),
         'assets/planetarium.png');
   }

   void _onMapCreated(GoogleMapController controller){
     setState(() {
       _markers.add(
         Marker(
           markerId: MarkerId('id-1'),
           position: LatLng(12.9764,77.5929),
           icon: mapMarker,
           infoWindow: InfoWindow(
             title: 'CUBBON PARK',
             snippet: 'Home to more than 6000 trees!',
           ),
         ),
       );
       _markers.add(
         Marker(
           markerId: MarkerId('id-2'),
           position: LatLng(12.9788,77.5996),
           icon: mapMarker2,
           infoWindow: InfoWindow(
             title: 'CHINNASWAMI STADIUM',
             snippet: 'Ee Sala Cup Namde!',
           ),
         ),
       );
       _markers.add(
         Marker(
           markerId: MarkerId('id-3'),
           position: LatLng(12.9849,77.5896),
           icon: mapMarker3,
           infoWindow: InfoWindow(
             title: 'JAWAHARLAL NEHRU PLANETARIUM',
             snippet: 'For Astronomy Enthusiasts',
           ),
         ),
       );
     });
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Custom Map Screen'),
       ),
       body: GoogleMap(
         onMapCreated: _onMapCreated,
         markers: _markers,
         initialCameraPosition: CameraPosition(
         target: LatLng(12.98,77.5929),
         zoom: 15,
       ),)
     );
   }
 }

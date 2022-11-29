import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saf_worker/data/dummy_data.dart';
import 'package:saf_worker/models/tasks.dart';
class DumpMap extends StatefulWidget {
  const DumpMap({super.key});

  @override
  State<DumpMap> createState() => _DumpMapState();
}

class _DumpMapState extends State<DumpMap> {

  late GoogleMapController mapController;
  Map<String,Marker> _markers={};

  addMarker(String id,LatLng location){
    var marker=Marker(markerId: MarkerId(id),position: location,infoWindow: InfoWindow(title: id,snippet: 'Some dec'));
    _markers[id]=marker;
    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(20.2709646, 85.7640933),
      zoom: 14),
      onMapCreated: (controller) {
        mapController=controller;
        for(int i=0;i<10;i++)
        addMarker('test$i',LatLng(20.2709646+(0.100000)*i, 85.7640933+(0.100000)*i));
        
      } ,
      markers: _markers.values.toSet() ,
    )
  );
  }
}
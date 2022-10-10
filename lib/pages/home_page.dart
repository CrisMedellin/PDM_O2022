import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_bloc/bloc/search_bar_bloc.dart';

// import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    
    final searchBloc = BlocProvider.of<SearchBarBloc>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Libreria free to play'),
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
          children: [
            ListTile(
              title: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), 
                      labelText: "Título del libro",                     
                      suffixIcon: MaterialButton(
                        onPressed:
                        //  () => BlocProvider.of<SearchBarBloc>(context).add( MakeSearch () ),
                          ()  {
                          Navigator.of(context).pushNamed("/book_details");
                        },
                        child: Icon (Icons.search),
                      ),
                    ),
                  // onSubmitted: (value) => searchBloc.add(MakeSearch (value)),
                  onSubmitted: (value ) {
                    print ("Sin resultados");
                  },
                ),
              ),
            ),
            Divider(height: 300,),
            Center(
              child: Text("Ingrese palabra para buscar libro"),
            )
          ],
        ),
    );
  }
}

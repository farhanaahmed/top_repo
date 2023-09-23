import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_repo/home/bloc_architecture/home_event.dart';
import 'package:top_repo/home/bloc_architecture/home_state.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';
import 'package:top_repo/home/home_ui/top_repositories_list.dart';

import '../bloc_architecture/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Github Top Repositories",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder(
                bloc: _bloc,
                builder: (context,state){
                  if(state is HomeLoadingState){
                    return Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                  else if(state is HomeLoadedState){
                    print("Reached loaded state");
                    final TopRepositories topRepositories = state.loadedTopRepositories;
                    return TopRepositoriesList(topRepositories: topRepositories);
                  }
                  else if(state is HomeErrorState){
                    return Text(state.msg);
                  }else{
                    return Container();
                  }
                },
              ),
            ),
            MaterialButton(
              onPressed: () {
                _bloc.add(HomeFetchDataEvent());
              },
              child: Text(
                "Load Data",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              height: 50,
              minWidth: 100,
            ),

          ],
        ),
      ),
    );
  }
}

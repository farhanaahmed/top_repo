import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else if (state is HomeLoadedState) {
                    final TopRepositories topRepositories =
                        state.loadedTopRepositories;
                    return TopRepositoriesList(
                        topRepositories: topRepositories);
                  } else if (state is HomeErrorState) {
                    return Text(state.msg);
                  } else {
                    return const Center(
                      child: Text(
                        "Search for top repositories on Github",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: ("Please enter a topic to search"),
                      ),
                      controller: _controller,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: MaterialButton(
                    onPressed: () {
                      if (_controller.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "Text field can't be empty!",
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      } else {
                        _bloc.add(HomeFetchDataEvent(_controller.text));
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    color: Colors.black,
                    height: 50,
                    minWidth: 50,
                    child: const Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

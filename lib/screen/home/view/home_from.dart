import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/data/models/user_model.dart';
import 'package:piyush_flutter_bloc/screen/home/bloc/user_bloc.dart';
import 'package:piyush_flutter_bloc/screen/home/view/user_list_item.dart';

class HomeForm extends StatelessWidget {
  //const HomeForm({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        // buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          if (state is UserLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            return _buildListView(state.users);
          }
          if (state is UserErrorState) {
            return Center(
              child: Text('Error :('),
            );
          }
          return Container();
        });
  }

  ListView _buildListView(List<UserModel> users) {
    return ListView.separated(
      controller: _scrollController
        ..addListener(() {
          print("==========");
          // if (_scrollController.offset ==
          //         _scrollController.position.maxScrollExtent &&
          //     !context.bloc<BeerBloc>().isFetching) {
          //   context.bloc<BeerBloc>()
          //     ..isFetching = true
          //     ..add(BeerFetchEvent());
          // }
        }),
      itemBuilder: (context, index) => UserListItem(users[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: users.length,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class HomeBody extends StatelessWidget {
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
      controller: _scrollController..addListener(() {}),
      itemBuilder: (context, index) => UserListItem(
        user: users[index],
        onItemClick: (UserModel itemOBJ) => {
          //Navigator.of(context).push<void>(BeerPage().route())
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return BeerPage();
            }),
          )
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: users.length,
    );
  }
}

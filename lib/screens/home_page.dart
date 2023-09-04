import 'package:aqua_watch_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostCard extends StatefulWidget {
  final String avatarImageUrl;
  final String name;
  final String date;
  final String imageUrl;
  final String caption;
  final int likeCount;
  final int damageCount;

  const PostCard({
    required this.avatarImageUrl,
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.caption,
    required this.likeCount,
    required this.damageCount,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.grey,
                      radius: screenSize.width * 0.04,
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                        width: screenSize.width * 0.08,
                        height: screenSize.width * 0.08,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.name,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: '  ${widget.date}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Option 1'),
                  ),
                  PopupMenuItem(
                    child: Text('Option 2'),
                  ),
                  PopupMenuItem(
                    child: Text('Option 3'),
                  ),
                ],
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          Image.network(
            "https://img.freepik.com/free-vector/app-development-illustration_52683-47931.jpg?w=2000",
            fit: BoxFit.cover,
            width: double.infinity,
            height: screenSize.width * 0.5,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.caption,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 19.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Divider(),
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: AppColors.grey,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      '${widget.likeCount}',
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Damage : ${widget.damageCount}',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/Navigation.svg',
                      width: 24,
                      height: 24,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  void _showUploadModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            height: 1000.0, // Increase the height as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap to upload action
                    },
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Tap to Upload',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                      // Add border

                      ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: AppColors.black, width: 1.0)),
                        width: 200,
                        height: 40,
                        child: Text(
                          ' Describe Issue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Issue Type',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            width: 90.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1.0), // Add border
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text('Type 1'),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Container(
                            width: 90.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1.0), // Add border
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text('Type 2'),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Container(
                            width: 90.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1.0), // Add border
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text('Type 3'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            width: 90.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1.0), // Add border
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text('Type 4'),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Container(
                            width: 90.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1.0), // Add border
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text('Type 5'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the upload action
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  void _handleTextChange(String newText) {
    if (newText.isEmpty ||
        newText ==
            _searchController.text
                .substring(0, _searchController.text.length - 1)) {
      setState(() {
        _searchController.text = newText;
      });
    } else {
      _searchController.text = newText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: screenSize.width * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0.1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: _handleTextChange,
                              decoration: InputDecoration(
                                hintText: "Enter Your City",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          if (_searchController.text.isNotEmpty)
                            IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: _clearSearch,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  height: screenSize.width * 0.13,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search, color: AppColors.white),
                    onPressed: () {
                      // Handle search button click
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            PostCard(
              avatarImageUrl: 'URL_TO_AVATAR_IMAGE',
              name: 'UserName',
              date: '21 August 9:38 A.M',
              imageUrl:
                  'https://img.freepik.com/free-vector/app-development-illustration_52683-47931.jpg?w=2000',
              caption: 'Water logging near Salar ganj Panipat (132101)',
              likeCount: 42,
              damageCount: 303,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showUploadModal(context);
        },
        backgroundColor: AppColors.black,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
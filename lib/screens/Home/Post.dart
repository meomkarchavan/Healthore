StreamProvider<List<Mood>>.value(
      value:DatabaseService().moods,
          child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        actions: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.people),
                label: Text('Log Out'),
              ),
              
            ],
        ),
        body: SafeArea(child: _widgetOptions[_selectedIndex])))
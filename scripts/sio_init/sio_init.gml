gml_pragma("global", "sio_init()");

#region macros
	// aws
	//#macro IP "3.14.13.216"
	//#macro PORT 3333
	
	// heroku local
	#macro IP "localhost"
	#macro PORT 5000
	
	// heroku prod
	//#macro IP "intense-sierra-25972.herokuapp.com"
	//#macro PORT 80
	
#endregion

#region SocketIO
	sio_connect(IP, PORT);
#endregion

#region SocketIO:Events
	sio_addEvent("position_update");
	sio_addEvent("change_room");
	sio_addEvent("collect_transitions");
	//sio_addEvent("pong");
#endregion
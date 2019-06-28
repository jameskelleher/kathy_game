gml_pragma("global", "sio_init()");

#region macros
	//#macro IP "3.14.13.216"
	//#macro IP "localhost"
	#macro IP "intense-sierra-25972.herokuapp.com"
	
	//#macro PORT 3333
	//#macro PORT 5000
	#macro PORT 80
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
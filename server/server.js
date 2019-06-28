// local imports
const enums = require("./enums.js");
const Key = enums.key;
const Facing = enums.facing;

// create a server
const server = require('http').createServer();
const io = require('socket.io')(server);
const port = 3333;


// listen for incoming connections
server.listen(port, (err) => {
  if (err) throw err;
  console.log(`Listening on port ${port}`);
});

// global data
var players = [];  // all connected players will be stored here
var transitions = []; // store the positions of the transition objects
var clientId = 0;  // unique ID for every client
const fps = 30;

class Player {

  constructor(data) {
    this.x = data.x;
    this.y = data.y;
    this.socket = data.socket;
    this.playerID = data.playerID;

    // might need to change this later
    this.room = 0;

    // initialize keys
    this.keys = {}

    for (let k in Key) {
      this.keys[Key[k]] = 0;
    }

    // animation and movement
    this.spd = 2;
    this.frame_size = 32;

    this.anim_length = 4;
    this.anim_speed = 6;
    this.frame_speed = this.anim_speed / fps;

    this.spr_left = 0;
    this.spr_top = 0;

    // initialize animation frame to just before movement
    this.x_frame = 1 - this.frame_speed
    this.facing = Facing.DOWN;
  }

  toJSON() {
    return {
      "x": this.x,
      "y": this.y,
      "spr_left": this.spr_left,
      "spr_top": this.spr_top,
      "room": this.room,
    };
  }

  toString() {
    return JSON.stringify(this, this.replacer);
  }

  replacer(key, value) {
    if (key == "socket") return undefined;
    else return value;
  }

  checkTransition(t) {
    if (this.room != t.room) return undefined;

    var xx = this.x + this.frame_size * 0.5;
    var yy = this.y + this.frame_size * 0.666;

    // console.log(`xx: "${xx}"`)
    // console.log(`yy: "${yy}"`)
    //
    // console.log(`checking transition in room "${t.room}"`);
    // console.log(`left bound: "${t.x}"`);
    // console.log(`right bound: "${t.x + t.w}"`);
    // console.log(`top bound: "${t.y}"`);
    // console.log(`bottom bound: "${t.y + t.h}"`);

    if ( t.x < xx
        && xx < t.x + t.w
        && t.y < yy
        && yy < t.y + t.h) {
      console.log(`Player "${this.playerID}" transition to "${t.dest_room}"`)
      this.room = t.dest_room;
      this.x = t.dest_x;
      this.y = t.dest_y;
      this.x_frame = 0;
      console.log(`Sending to coordinates ${t.dest_x}, ${t.dest_y}`)

      for (let k in this.keys) {
        this.keys[k] = 0;
      }
      return t.dest_room;
    }

    // console.log(`Player "${this.playerID}" does not transition`)
    return undefined;
  }

  checkTransitions(t_array) {
    for (let i = 0; i < t_array.length; i++) {
        var room = this.checkTransition(t_array[i]);
        if (room != undefined) return room;
    }
  }

  updatePosition() {
    var moveX = (this.keys[Key.RIGHT] - this.keys[Key.LEFT]) * this.spd;
    if (moveX == 0) {
      var moveY = (this.keys[Key.DOWN] - this.keys[Key.UP]) * this.spd;
    } else {
      var moveY = 0;
    }

    this.x += moveX;
    this.y += moveY;

    if (moveX > 0) this.facing = Facing.RIGHT;
    else if (moveX < 0) this.facing = Facing.LEFT;
    else if (moveY > 0) this.facing = Facing.DOWN;
    else if (moveY < 0) this.facing = Facing.UP;

    var move = moveX + moveY;

    if (move == 0) {
      this.x_frame = 1 - this.frame_speed;
    } else {
      this.x_frame += this.frame_speed;
    }

    this.x_frame %= this.anim_length;

    // maybe do this in the client?
    this.spr_left = Math.floor(this.x_frame) * this.frame_size;
    this.spr_top = this.facing * this.frame_size;
  }
}

class Transition {
  constructor(data) {
    this.x = data.x;
    this.y = data.y;
    this.w = data.w;
    this.h = data.h;
    this.room = data.room;
    this.dest_room = data.dest_room;
    this.dest_x = data.dest_x;
    this.dest_y = data.dest_y;
  }
}

io.on('connection', (client) => {
  var playerID = clientId++;
  var player;

  console.log(`Player "${playerID}" connected`);

  player = new Player({
    x: 100,
    y: 100 * (playerID % 4),
    socket: client,
    playerID: playerID,
  });

  console.log(player.toString());
  // add to players list
  players.push(player);

  if (transitions.length == 0) {
    client.emit('collect_transitions', JSON.stringify({}));
  }

  console.log(JSON.stringify(players));

  client.on('update_key', (data) => {
    data = JSON.parse(data);
    player.keys[data.key] = data.status;
  });

  client.on('disconnect', () => {

    // remove player from list
    players.splice(players.indexOf(player), 1);

    console.log(`Player "${playerID}" disconnected`);
  });

  client.on('send_transitions', (data) => {
      transitions = [];
      data = JSON.parse(data);
      t_list = data.t;
      t_list.forEach((item, index) => {
        var t = new Transition(item);
        transitions.push(t);
      });
      console.log(transitions);
  });

});

setInterval(() => {

  if (players.length > 0) {
    players.forEach((player, index) => {
      player.updatePosition();
      var room = player.checkTransitions(transitions);
      if (room != undefined) {
        player.socket.emit('change_room', JSON.stringify({'dest_room': room}));
      }
    });
    //TODO: don't send full player data
    io.emit('position_update', JSON.stringify(players));
  }
}, 1000 / fps);

// local imports
const enums = require("./enums.js");
const Key = enums.key;
const Facing = enums.facing;

// create a server
const server = require('http').createServer();
const io = require('socket.io')(server);
const port = os.Getenv("PORT");


// listen for incoming connections
server.listen(port, (err) => {
  if (err) throw err;
  console.log(`Listening on port ${port}`);
});

// global data
var players = [];  // all connected players will be stored here
var clientId = 0;  // unique ID for every client
const fps = 30;

class Player {

  constructor(data) {
    this.x = data.x;
    this.y = data.y;

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
      "spr_top": this.spr_top
    };
  }

  toString() {
    return JSON.stringify(this, this.replacer);
  }

  replacer(key, value) {
    if (key == "socket") return undefined;
    else return value;
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

io.on('connection', (client) => {
  var playerID = clientId++;
  var player;

  console.log('player connected');

  player = new Player({
    x: 100,
    y: 100 * (playerID % 4)
  });

  console.log("pushing");
  console.log(player.toString());
  // add to players list
  players.push(player);

  client.on('update_key', (data) => {
    data = JSON.parse(data);
    player.keys[data.key] = data.status;

    console.log('key: ' + data.key)
    console.log('status: ' + data.status)
  });

  client.on('disconnect', () => {

    // remove player from list
    players.splice(players.indexOf(player), 1);

    console.log(`Player "${playerID}" disconnected`);
  });

});

setInterval(() => {

  if (players.length > 0) {
    players.forEach((item, index) => {
      item.updatePosition();
    })
    //TODO: don't send full player data
    io.emit('position_update', JSON.stringify(players));
  }
}, 1000 / fps);

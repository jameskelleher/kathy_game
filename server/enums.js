const Key = {
  LEFT: 37,
  UP: 38,
  RIGHT: 39,
  DOWN: 40,
};
Object.freeze(Key);

const Facing = {
  DOWN: 0,
  LEFT: 1,
  RIGHT: 2,
  UP: 3,
}
Object.freeze(Facing);

module.exports = {
  key: Key,
  facing: Facing,
}

var min = 1;
var max = 10;

var a = Math.floor(Math.random() * (max + 1 - min)) + min;

console.log(a);

// https://qiita.com/sakymark/items/710f0b9a632c375fbc31
// https://murashun.jp/blog/20191110-24.html
const array = [...Array(max).keys()].map(i => ++i);
for (var i = array.length - 1; i > 0; i--) {
  var rand = Math.floor(Math.random() * (i + 1));
  [array[i], array[rand]] = [array[rand], array[i]];
}
console.log(array);

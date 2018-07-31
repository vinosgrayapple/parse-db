const EventEmitter = require('events');
const emitter = new EventEmitter();

emitter.on('messageLogged', function (args) {
  console.log('Listener called', args.url);
});
const log = require('./logger')
log('message22')
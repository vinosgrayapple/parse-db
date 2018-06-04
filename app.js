const cheerio = require('cheerio')
const request = require('request')
let arr = []
request('https://www.marathonbet.com/su/betting/Football/', function (error, response, body) {
  const $ = cheerio.load(body);
  const container = $('#container_EVENTS')
  console.log(container.length);
  container.find('td').each(function () {
    const dtMatch = $(this).attr('data-sel');
    if (dtMatch) {
      console.log(JSON.parse($(this).attr('data-sel')))
      // arr.push(JSON.parse($(this).attr('data-sel')))
    }
  })

});
// console.log(container);
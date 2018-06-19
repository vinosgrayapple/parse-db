var fs = require('fs')
var csv = require('fast-csv')
var sum = [];
// var stream = fs.createReadStream("my.csv");
// var stream = fs.createReadStream('2015_2.csv');
// csv.fromStream(stream, {
// 		delimiter: ';',
// 		escape: '"'
// 	})
// 	.pipe(csv())
// 	.on('data', data => {
// 		console.log(data)
// 	})
// 	.on('end', () => {
// 		console.log('Read finished!');
// 	})

fs.createReadStream("2015_2.csv")
	.pipe(csv({
		delimiter: ";",
		header: true,
		trim: true
	}))
	.on("data", function (data) {

		// console.log(data);
		sum.push(data[25])
	})
	.on("end", function () {
		// itog = sum.reduce((result, b) => {
		// 	return result + b
		// }, 0)
		console.log(sum);
	});
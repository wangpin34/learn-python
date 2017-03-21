const spawn = require('child_process').spawn;

function trim(str){
  return str.replace(/(^[\s\t]+)|([\s\t]+$)/g, '');
}

let py = spawn('python', ['here.py']);

py.stdout.on('data', (data) => {
  formatData = data.toString('utf8');
  //console.log('**********' + formatData + '**********')
  //formatData = formatData.substring
  let obj = JSON.parse(trim(formatData));
  console.log(obj);
  console.log(typeof obj);
  console.log("Got score of Bob: " + obj['Ada']);
});

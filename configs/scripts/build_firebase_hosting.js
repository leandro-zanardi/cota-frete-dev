const execSync = require('child_process').execSync;
const fs = require('fs')

const path = require('path');
const appRoot = path.resolve(__dirname);

console.log(appRoot + '/../firebase_hosting/firebase.json');

// build vue
var output = execSync('vue-cli-service build', {econding: 'utf-8'});
console.log('Vue Build\n', String(output));

//move firebase config to dist
console.log('move firebase config to dist')
fs.renameSync(appRoot + '/../firebase_hosting/firebase.json', appRoot +'/../../dist/firebase.json', (err) => {
    console.log(err);
})
fs.renameSync(appRoot + '/../firebase_hosting/.gitignore', appRoot +'/../../dist/.gitignore', (err) => {
    console.log(err);
})
fs.renameSync(appRoot + '/../firebase_hosting/.firebase', appRoot +'/../../dist/.firebase', (err) => {
    console.log(err);
})
fs.renameSync(appRoot + '/../firebase_hosting/.firebaserc', appRoot +'/../../dist/.firebaserc', (err) => {
    console.log(err);
})

//deploy to firebase
output = execSync('firebase use cota-frete-estudo', {cwd: 'dist/', econding: 'utf-8'});
console.log('Config Firebase\n', String(output));


output = execSync('firebase deploy', {cwd: 'dist/', econding: 'utf-8'});
console.log('Deploy Firebase\n', String(output));

//move firebase config back
console.log('move firebase config back')
fs.renameSync(appRoot +'/../../dist/firebase.json', appRoot + '/../firebase_hosting/firebase.json', (err) => {
    console.log(err);
})
fs.renameSync(appRoot +'/../../dist/.gitignore', appRoot + '/../firebase_hosting/.gitignore', (err) => {
    console.log(err);
})
fs.renameSync(appRoot +'/../../dist/.firebase', appRoot + '/../firebase_hosting/.firebase', (err) => {
    console.log(err);
})
fs.renameSync(appRoot +'/../../dist/.firebaserc', appRoot + '/../firebase_hosting/.firebaserc', (err) => {
    console.log(err);
})

console.log('Done');

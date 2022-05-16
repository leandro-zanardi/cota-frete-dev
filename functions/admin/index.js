const firebaseAdmin = require('firebase-admin');
firebaseAdmin.initializeApp();

const setCustomClaims = require("./setCustomClaims.js")
const listAllUsers = require("./listAllUsers.js")

exports.setCustomClaims = setCustomClaims.setCustomClaims;
exports.listAllUsers = listAllUsers.listAllUsers;
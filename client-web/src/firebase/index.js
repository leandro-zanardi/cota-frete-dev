// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth, connectAuthEmulator } from "firebase/auth";
import { getDatabase, ref, set, onValue, connectDatabaseEmulator } from "firebase/database";

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

//https://firebase.google.com/docs/database/web/read-and-write?hl=pt-br#web-version-9

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyB9IoZp3K67MELZQOZQweGyKWin9q7lUb8",
  authDomain: "cota-frete-estudo.firebaseapp.com",
  databaseURL: "https://cota-frete-estudo-default-rtdb.firebaseio.com",
  projectId: "cota-frete-estudo",
  storageBucket: "cota-frete-estudo.appspot.com",
  messagingSenderId: "1041288545392",
  appId: "1:1041288545392:web:4242cad821b19f5a25a0b5",
  measurementId: "G-FR08559ES6"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

var firebaseDB;
if (location.hostname === "localhost") {
  firebaseDB = getDatabase()
  connectDatabaseEmulator(firebaseDB, "localhost", 9000);
} else {
  firebaseDB = getDatabase(app)
}

var auth;
if (location.hostname === "localhost") {
  auth = getAuth();
  connectAuthEmulator(auth, "http://localhost:9099");
} else {
  auth = getAuth(app);
}

export { auth, firebaseDB, ref, set, onValue };
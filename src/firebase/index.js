// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
//import { getAnalytics } from "firebase/analytics";
import { getAuth } from "firebase/auth";

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDQ0S7igB2f6WOA3S24Bs9jy572yix8W7k",
  authDomain: "cota-frete-dev.firebaseapp.com",
  projectId: "cota-frete-dev",
  storageBucket: "cota-frete-dev.appspot.com",
  messagingSenderId: "649445319498",
  appId: "1:649445319498:web:368c23fd2f33e8909b57b3",
  measurementId: "G-T1K7S4B491"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
//const analytics = getAnalytics(app);

const auth = getAuth(app);

export { auth };
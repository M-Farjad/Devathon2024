const admin = require('firebase-admin');
const serviceAccount = require('./../../prep-master-d1025-firebase-adminsdk-54l6m-6ef361d64e.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: 'https://prep-master-d1025-default-rtdb.firebaseio.com',
});

module.exports = admin;

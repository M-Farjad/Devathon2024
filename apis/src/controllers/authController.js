const admin = require('../config/firebase');
const User = require('../models/User');

exports.signup = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Check if the email already exists in Firebase Authentication
    const existingUser = await admin.auth().getUserByEmail(email).catch(() => null);

    // If user already exists, return appropriate response
    if (existingUser) {
      return res.status(200).json({
        status: "200",
        message: "User already exists",
        data: {
          token: null,
          user: {
            name: null,
            email: existingUser.email,
            img_url: null,
            about: null,
            type: null,
            uid: existingUser.uid
          }
        }
      });
    }

    // Create user in Firebase Auth
    const userRecord = await admin.auth().createUser({ email, password });

    // Create a custom token for the user
    const token = await admin.auth().createCustomToken(userRecord.uid);

    // Initialize a User instance with default or empty values
    const user = new User({
      uid: userRecord.uid,
      email: userRecord.email,
      type: null,
      name: null,
      img_url: null,
      about: null
    });

    // Store the new user data in Firestore
    const db = admin.firestore();
    await db.collection('users').doc(userRecord.uid).set(user.toFirestore());

    // Return the response with the user details and token
    res.status(200).json({
      status: "200",
      message: "User created successfully",
      data: {
        token,
        user: user.toFirestore()
      }
    });
  } catch (error) {
    res.status(500).json({
      status: "500",
      message: "Error creating user",
      data: {
        token: null,
        user: {
          name: null,
          email: null,
          img_url: null,
          about: null,
          type: null,
          uid: null
        }
      }
    });
  }
};

exports.signin = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Verify the user's credentials with Firebase Authentication
    const userRecord = await admin.auth().getUserByEmail(email);

    if (!userRecord) {
      return res.status(401).json({
        status: "401",
        message: "Invalid credentials",
        data: {
          token: null,
          user: {
            name: null,
            email: null,
            img_url: null,
            about: null,
            type: null,
            uid: null
          }
        }
      });
    }

    // Create a custom token for the user
    const token = await admin.auth().createCustomToken(userRecord.uid);

    // Fetch additional user information from Firestore
    const db = admin.firestore();
    const userDoc = await db.collection('users').doc(userRecord.uid).get();
    const userData = userDoc.exists ? userDoc.data() : new User({ uid: userRecord.uid, email: userRecord.email });

    // Return the response with the user details and token
    res.status(200).json({
      status: "200",
      message: "Sign in successful",
      data: {
        token,
        user: {
          name: userData.name || null,
          email: userData.email || null,
          img_url: userData.img_url || null,
          about: userData.about || null,
          type: userData.type || null,
          uid: userData.uid || null
        }
      }
    });
  } catch (error) {
    res.status(500).json({
      status: "500",
      message: "Error signing in",
      data: {
        token: null,
        user: {
          name: null,
          email: null,
          img_url: null,
          about: null,
          type: null,
          uid: null
        }
      }
    });
  }
};

exports.updateUserInfo = async (req, res) => {
  try {
    const { email, updateFields } = req.body;

    // Verify the user's email exists
    const userRecord = await admin.auth().getUserByEmail(email);

    if (!userRecord) {
      return res.status(404).json({
        status: "404",
        message: "User not found",
        data: null
      });
    }

    // Get the user document from Firestore
    const db = admin.firestore();
    const userDocRef = db.collection('users').doc(userRecord.uid);

    // Update the user document with the provided fields
    await userDocRef.update(updateFields);

    // Fetch updated user information
    const updatedUserDoc = await userDocRef.get();
    const updatedUserData = updatedUserDoc.exists ? updatedUserDoc.data() : null;

    // Return the updated user information
    res.status(200).json({
      status: "200",
      message: "User information updated successfully",
      data: updatedUserData
    });
  } catch (error) {
    res.status(500).json({
      status: "500",
      message: "Error updating user information",
      data: null
    });
  }
};

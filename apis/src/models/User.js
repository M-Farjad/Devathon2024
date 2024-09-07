// models/User.js

class User {
  constructor({
    uid = null,
    name = null,
    email,
    img_url = null,
    about = null,
    type = null,
  }) {
    this.uid = uid;
    this.name = name;
    this.email = email;
    this.img_url = img_url;
    this.about = about;
    this.type = type;
  }

  // Method to validate the user data
  validate() {
    const errors = [];

    if (!this.email) {
      errors.push("Email is required");
    }
    // Add more validation rules as needed

    return errors;
  }

  // Method to format data for Firestore
  toFirestore() {
    return {
      uid: this.uid,
      name: this.name,
      email: this.email,
      img_url: this.img_url,
      about: this.about,
      type: this.type,
    };
  }
}

module.exports = User;



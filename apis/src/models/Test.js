class Test {
  constructor({
    teacher_email = "",
    test_name = "",
    type = "",
    difficulty_level = 0,
    questions = [],
    price = null,  // Add price with default value null
  }) {
    this.teacher_email = teacher_email;
    this.test_name = test_name;
    this.type = type;
    this.difficulty_level = difficulty_level;
    this.questions = questions.map((question) => new Question(question));
    this.price = price;  // Initialize price
  }

  // Method to validate the test data
  validate() {
    const errors = [];

    if (!this.teacher_email) {
      errors.push("Teacher email is required");
    }
    if (!this.test_name) {
      errors.push("Test name is required");
    }
    if (!this.type) {
      errors.push("Type is required");
    }
    if (
      typeof this.difficulty_level !== "number" ||
      this.difficulty_level < 1 ||
      this.difficulty_level > 5
    ) {
      errors.push("Difficulty level must be an integer between 1 and 5");
    }
    if (!Array.isArray(this.questions) || this.questions.length === 0) {
      errors.push("At least one question is required");
    } else {
      this.questions.forEach((q, index) => {
        const questionErrors = q.validate();
        if (questionErrors.length > 0) {
          errors.push(`Question ${index + 1}: ${questionErrors.join(", ")}`);
        }
      });
    }
    if (this.price !== null && (typeof this.price !== "number" || this.price < 0)) {
      errors.push("Price must be a non-negative number or null");
    }

    return errors;
  }

  // Method to format data for Firestore
  toFirestore() {
    return {
      teacher_email: this.teacher_email,
      test_name: this.test_name,
      type: this.type,
      difficulty_level: this.difficulty_level,
      questions: this.questions.map((q) => q.toFirestore()),
      price: this.price,  // Include price
    };
  }

  // Method to create a Test instance from Firestore data
  static fromFirestore(data) {
    return new Test({
      teacher_email: data.teacher_email,
      test_name: data.test_name,
      type: data.type,
      difficulty_level: data.difficulty_level,
      questions: data.questions.map(Question.fromFirestore),
      price: data.price,  // Include price
    });
  }
}

class Question {
  constructor({ statement = "", answers = [], correct_ans_index = 0 }) {
    this.statement = statement;
    this.answers = answers;
    this.correct_ans_index = correct_ans_index;
  }

  // Method to validate the question data
  validate() {
    const errors = [];

    if (!this.statement) {
      errors.push("Question statement is required");
    }
    if (!Array.isArray(this.answers) || this.answers.length < 2) {
      errors.push("At least two answers are required");
    }
    if (
      typeof this.correct_ans_index !== "number" ||
      this.correct_ans_index < 0 ||
      this.correct_ans_index >= this.answers.length
    ) {
      errors.push("Correct answer index is out of range");
    }

    return errors;
  }

  // Method to format data for Firestore
  toFirestore() {
    return {
      statement: this.statement,
      answers: this.answers,
      correct_ans_index: this.correct_ans_index,
    };
  }

  // Method to create a Question instance from Firestore data
  static fromFirestore(data) {
    return new Question({
      statement: data.statement,
      answers: data.answers,
      correct_ans_index: data.correct_ans_index,
    });
  }
}

module.exports = Test;

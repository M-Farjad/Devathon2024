const admin = require("../config/firebase");
const Test = require("../models/Test");

exports.addTest = async (req, res) => {
  try {
    const {
      teacher_token,
      test_name,
      type,
      difficulty_level,
      questions,
      price,
    } = req.body;

    // Get the Firestore database instance
    const db = admin.firestore();

    // Find the user by token in the users collection
    const userSnapshot = await db
      .collection("users")
      .where("token", "==", teacher_token)
      .limit(1)
      .get();

    if (userSnapshot.empty) {
      return res.status(401).json({
        status: "401",
        message: "Invalid token or token does not have an associated user",
        data: null,
      });
    }

    // Get the email from the user document
    const userDoc = userSnapshot.docs[0].data();
    const teacherEmail = userDoc.email;

    if (!teacherEmail) {
      return res.status(401).json({
        status: "401",
        message: "User found but email is missing",
        data: null,
      });
    }

    // Create a Test instance
    const test = new Test({
      teacher_email: teacherEmail,
      test_name,
      type,
      difficulty_level,
      questions,
      price, // Include price
    });

    // Validate the test data
    const validationErrors = test.validate();
    if (validationErrors.length > 0) {
      return res.status(400).json({
        status: "400",
        message: "Validation failed",
        data: {
          errors: validationErrors,
        },
      });
    }

    // Store the test data in Firestore
    const testRef = db.collection("tests").doc();
    await testRef.set(test.toFirestore());

    // Return success response
    res.status(201).json({
      status: "201",
      message: "Test added successfully",
      data: {
        test_id: testRef.id,
        ...test.toFirestore(),
      },
    });
  } catch (error) {
    console.error("Error adding test:", error);
    res.status(500).json({
      status: "500",
      message: "Error adding test",
      data: null,
    });
  }
};

exports.editTest = async (req, res) => {
  try {
    const {
      test_id,
      teacher_token,
      test_name,
      type,
      difficulty_level,
      questions,
      price,
    } = req.body;

    // Get the Firestore database instance
    const db = admin.firestore();

    // Find the user by token in the users collection
    const userSnapshot = await db
      .collection("users")
      .where("token", "==", teacher_token)
      .limit(1)
      .get();

    if (userSnapshot.empty) {
      return res.status(401).json({
        status: "401",
        message: "Invalid token or token does not have an associated user",
        data: null,
      });
    }

    // Get the email from the user document
    const userDoc = userSnapshot.docs[0].data();
    const teacherEmail = userDoc.email;

    if (!teacherEmail) {
      return res.status(401).json({
        status: "401",
        message: "User found but email is missing",
        data: null,
      });
    }

    // Fetch the test document
    const testRef = db.collection("tests").doc(test_id);
    const testDoc = await testRef.get();

    if (!testDoc.exists) {
      return res.status(404).json({
        status: "404",
        message: "Test not found",
        data: null,
      });
    }

    // Check if the test belongs to the teacher
    const testData = testDoc.data();
    if (testData.teacher_email !== teacherEmail) {
      return res.status(403).json({
        status: "403",
        message: "Unauthorized to edit this test",
        data: null,
      });
    }

    // Update the test data
    await testRef.update({
      test_name,
      type,
      difficulty_level,
      questions,
      price, // Include price
    });

    // Return success response
    res.status(200).json({
      status: "200",
      message: "Test updated successfully",
      data: {
        test_id,
        test_name,
        type,
        difficulty_level,
        questions,
        price, // Include price
      },
    });
  } catch (error) {
    console.error("Error updating test:", error);
    res.status(500).json({
      status: "500",
      message: "Error updating test",
      data: null,
    });
  }
};

exports.deleteTest = async (req, res) => {
  try {
    const { test_id, teacher_token } = req.body;

    // Get the Firestore database instance
    const db = admin.firestore();

    // Find the user by token in the users collection
    const userSnapshot = await db
      .collection("users")
      .where("token", "==", teacher_token)
      .limit(1)
      .get();

    if (userSnapshot.empty) {
      return res.status(401).json({
        status: "401",
        message: "Invalid token or token does not have an associated user",
        data: null,
      });
    }

    // Get the email from the user document
    const userDoc = userSnapshot.docs[0].data();
    const teacherEmail = userDoc.email;

    if (!teacherEmail) {
      return res.status(401).json({
        status: "401",
        message: "User found but email is missing",
        data: null,
      });
    }

    // Fetch the test document
    const testRef = db.collection("tests").doc(test_id);
    const testDoc = await testRef.get();

    if (!testDoc.exists) {
      return res.status(404).json({
        status: "404",
        message: "Test not found",
        data: null,
      });
    }

    // Check if the test belongs to the teacher
    const testData = testDoc.data();
    if (testData.teacher_email !== teacherEmail) {
      return res.status(403).json({
        status: "403",
        message: "Unauthorized to delete this test",
        data: null,
      });
    }

    // Delete the test document
    await testRef.delete();

    // Return success response
    res.status(200).json({
      status: "200",
      message: "Test deleted successfully",
      data: null,
    });
  } catch (error) {
    console.error("Error deleting test:", error);
    res.status(500).json({
      status: "500",
      message: "Error deleting test",
      data: null,
    });
  }
};

exports.addTestReview = async (req, res) => {
  try {
    const { test_id, review, reviewer_token } = req.body;

    // Get the Firestore database instance
    const db = admin.firestore();

    // Find the user by token in the users collection
    const userSnapshot = await db
      .collection("users")
      .where("token", "==", reviewer_token)
      .limit(1)
      .get();

    if (userSnapshot.empty) {
      return res.status(401).json({
        status: "401",
        message: "Invalid token or token does not have an associated user",
        data: null,
      });
    }

    // Get the email from the user document
    const userDoc = userSnapshot.docs[0].data();
    const reviewerEmail = userDoc.email;

    if (!reviewerEmail) {
      return res.status(401).json({
        status: "401",
        message: "User found but email is missing",
        data: null,
      });
    }

    // Fetch the test document
    const testRef = db.collection("tests").doc(test_id);
    const testDoc = await testRef.get();

    if (!testDoc.exists) {
      return res.status(404).json({
        status: "404",
        message: "Test not found",
        data: null,
      });
    }

    // Add the review to the test
    await testRef.update({
      reviews: admin.firestore.FieldValue.arrayUnion({
        reviewer_email: reviewerEmail,
        review,
      }),
    });

    // Return success response
    res.status(201).json({
      status: "201",
      message: "Review added successfully",
      data: {
        test_id,
        review,
        reviewer_email: reviewerEmail,
      },
    });
  } catch (error) {
    console.error("Error adding review:", error);
    res.status(500).json({
      status: "500",
      message: "Error adding review",
      data: null,
    });
  }
};

exports.getTests = async (req, res) => {
  try {
    // Get the Firestore database instance
    const db = admin.firestore();

    // Fetch all test documents
    const testsSnapshot = await db.collection("tests").get();

    if (testsSnapshot.empty) {
      return res.status(404).json({
        status: "404",
        message: "No tests found",
        data: null,
      });
    }

    // Map over documents to format the response
    const tests = testsSnapshot.docs.map((doc) => ({
      test_id: doc.id,
      ...doc.data(),
    }));

    // Return success response
    res.status(200).json({
      status: "200",
      message: "Tests retrieved successfully",
      data: tests,
    });
  } catch (error) {
    console.error("Error retrieving tests:", error);
    res.status(500).json({
      status: "500",
      message: "Error retrieving tests",
      data: null,
    });
  }
};

exports.getMyTests = async (req, res) => {
  try {
    const { teacher_token } = req.body;

    // Get the Firestore database instance
    const db = admin.firestore();

    // Find the user by token in the users collection
    const userSnapshot = await db
      .collection("users")
      .where("token", "==", teacher_token)
      .limit(1)
      .get();

    if (userSnapshot.empty) {
      return res.status(401).json({
        status: "401",
        message: "Invalid token or token does not have an associated user",
        data: null,
      });
    }

    // Get the email from the user document
    const userDoc = userSnapshot.docs[0].data();
    const teacherEmail = userDoc.email;

    if (!teacherEmail) {
      return res.status(401).json({
        status: "401",
        message: "User found but email is missing",
        data: null,
      });
    }

    // Fetch tests associated with the teacher's email
    const testsSnapshot = await db
      .collection("tests")
      .where("teacher_email", "==", teacherEmail)
      .get();

    if (testsSnapshot.empty) {
      return res.status(404).json({
        status: "404",
        message: "No tests found for this teacher",
        data: null,
      });
    }

    // Map over documents to format the response
    const tests = testsSnapshot.docs.map((doc) => ({
      test_id: doc.id,
      ...doc.data(),
    }));

    // Return success response
    res.status(200).json({
      status: "200",
      message: "Tests retrieved successfully",
      data: tests,
    });
  } catch (error) {
    console.error("Error retrieving teacher's tests:", error);
    res.status(500).json({
      status: "500",
      message: "Error retrieving teacher's tests",
      data: null,
    });
  }
};

exports.getReviews = async (req, res) => {
  try {
    // Get the Firestore database instance
    const db = admin.firestore();

    // Fetch all test documents
    const testsSnapshot = await db.collection("tests").get();

    if (testsSnapshot.empty) {
      return res.status(404).json({
        status: "404",
        message: "No tests found",
        data: null,
      });
    }

    // Map over documents to extract reviews
    const reviews = testsSnapshot.docs.flatMap((doc) => {
      const testData = doc.data();
      return testData.reviews
        ? testData.reviews.map((review) => ({
            test_id: doc.id,
            ...review,
          }))
        : [];
    });

    // Return success response
    res.status(200).json({
      status: "200",
      message: "Reviews retrieved successfully",
      data: reviews,
    });
  } catch (error) {
    console.error("Error retrieving reviews:", error);
    res.status(500).json({
      status: "500",
      message: "Error retrieving reviews",
      data: null,
    });
  }
};

exports.getFilteredReviews = async (req, res) => {
  try {
    const { test_ids } = req.body;

    if (!Array.isArray(test_ids) || test_ids.length === 0) {
      return res.status(400).json({
        status: "400",
        message: "Invalid or empty list of test IDs",
        data: null,
      });
    }

    // Get the Firestore database instance
    const db = admin.firestore();

    // Create an array of promises to get reviews for each test
    const reviewPromises = test_ids.map(async (test_id) => {
      const testRef = db.collection("tests").doc(test_id);
      const testDoc = await testRef.get();

      if (!testDoc.exists) {
        return {
          test_id,
          reviews: [],
          error: "Test not found",
        };
      }

      const testData = testDoc.data();
      return {
        test_id,
        reviews: testData.reviews || [],
      };
    });

    // Wait for all promises to resolve
    const reviewsResults = await Promise.all(reviewPromises);

    // Filter out any test IDs where the test was not found
    const filteredReviews = reviewsResults.filter((result) => !result.error);

    if (filteredReviews.length === 0) {
      return res.status(404).json({
        status: "404",
        message: "No reviews found for the provided test IDs",
        data: null,
      });
    }

    // Return success response
    res.status(200).json({
      status: "200",
      message: "Filtered reviews retrieved successfully",
      data: filteredReviews,
    });
  } catch (error) {
    console.error("Error retrieving filtered reviews:", error);
    res.status(500).json({
      status: "500",
      message: "Error retrieving filtered reviews",
      data: null,
    });
  }
};

import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor MovieReviews {
  type Review = {
    movieTitle: Text;
    reviewer: Text;
    rating: Nat;
    comment: Text;
    image: Text; // New field for image URL
  };

  stable var reviews: [Review] = [];

  public func addReview(movieTitle: Text, reviewer: Text, rating: Nat, comment: Text, image: Text) : async Text {
    let newReview: Review = { movieTitle; reviewer; rating; comment; image };
    reviews := Array.append(reviews, [newReview]);
    return "¡Reseña agregada exitosamente!";
  };

  public query func getReviews() : async [Review] {
    return reviews;
  };

  public query func getReviewsByMovie(movieTitle: Text) : async [Review] {
    Array.filter<Review>(reviews, func (r: Review) : Bool {
      r.movieTitle == movieTitle
    })
  };

  public func deleteMovie(movieTitle: Text) : async Text {
    let updatedReviews = Array.filter<Review>(reviews, func (r: Review) : Bool {
      r.movieTitle != movieTitle
    });
    reviews := updatedReviews;
    return "Película eliminada correctamente.";
  };
};


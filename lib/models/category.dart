
class CategoryType{
  String id;
  String title;
  String imageName;
  CategoryType(this.id,this.title,this.imageName);

  static List<CategoryType> getAllCategories(){
    return[
      CategoryType('Action', 'Action', 'action.png'),
      CategoryType('Adventure', 'Adventure', 'adventure.png'),
      CategoryType('Animation', 'Animation', 'animation.png' ),
      CategoryType('Comedy', 'Comedy', 'comedy.png'),
      CategoryType('Crime', 'Crime', 'crime.png'),
      CategoryType('Documentary', 'Documentary', 'documentary.png'),
      CategoryType('Drama', 'Drama', 'drama.png'),
      CategoryType('Family', 'Family', 'family.png'),
      CategoryType('Fantasy', 'Fantasy', 'fantasy.png' ),
      CategoryType('History', 'History', 'history.png'),
      CategoryType('Horror', 'Horror', 'horror.png'),
      CategoryType('Music', 'Music', 'music.png'),
      CategoryType('Mystery', 'Mystery', 'mystery.png'),
      CategoryType('Romance', 'Romance', 'romance.png'),
      CategoryType('Science Fiction', 'Science Fiction', 'scienceFiction.png' ),
      CategoryType('TV Movie', 'TV Movie', 'tvMovies.png'),
      CategoryType('Thriller', 'Thriller', 'thriller.png'),
      CategoryType('War', 'War', 'war.png' ),
      CategoryType('Western', 'Western', 'western.png'),
    ];
  }
}
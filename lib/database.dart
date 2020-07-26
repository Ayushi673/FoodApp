class MyRecipe {
  int count;
  List<Recipes> recipes;

  MyRecipe({this.count, this.recipes});

  MyRecipe.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['recipes'] != null) {
      recipes = new List<Recipes>();
      json['recipes'].forEach((v) {
        recipes.add(new Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.recipes != null) {
      data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipes {
  String imageUrl;
  double socialRank;
  String sId;
  String publisher;
  String sourceUrl;
  String recipeId;
  String publisherUrl;
  String title;

  Recipes(
      {this.imageUrl,
        this.socialRank,
        this.sId,
        this.publisher,
        this.sourceUrl,
        this.recipeId,
        this.publisherUrl,
        this.title});

  Recipes.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    socialRank = json['social_rank'];
    sId = json['_id'];
    publisher = json['publisher'];
    sourceUrl = json['source_url'];
    recipeId = json['recipe_id'];
    publisherUrl = json['publisher_url'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['social_rank'] = this.socialRank;
    data['_id'] = this.sId;
    data['publisher'] = this.publisher;
    data['source_url'] = this.sourceUrl;
    data['recipe_id'] = this.recipeId;
    data['publisher_url'] = this.publisherUrl;
    data['title'] = this.title;
    return data;
  }
}

class Autogenerated {
  Recipe recipe;

  Autogenerated({this.recipe});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    recipe =
    json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipe != null) {
      data['recipe'] = this.recipe.toJson();
    }
    return data;
  }
}

class Recipe {
  List<String> ingredients;
  String imageUrl;
  double socialRank;
  String sId;
  String publisher;
  String sourceUrl;
  String recipeId;
  String publisherUrl;
  String title;
  int iV;

  Recipe(
      {this.ingredients,
        this.imageUrl,
        this.socialRank,
        this.sId,
        this.publisher,
        this.sourceUrl,
        this.recipeId,
        this.publisherUrl,
        this.title,
        this.iV});

  Recipe.fromJson(Map<String, dynamic> json) {
    ingredients = json['ingredients'].cast<String>();
    imageUrl = json['image_url'];
    socialRank = json['social_rank'];
    sId = json['_id'];
    publisher = json['publisher'];
    sourceUrl = json['source_url'];
    recipeId = json['recipe_id'];
    publisherUrl = json['publisher_url'];
    title = json['title'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingredients'] = this.ingredients;
    data['image_url'] = this.imageUrl;
    data['social_rank'] = this.socialRank;
    data['_id'] = this.sId;
    data['publisher'] = this.publisher;
    data['source_url'] = this.sourceUrl;
    data['recipe_id'] = this.recipeId;
    data['publisher_url'] = this.publisherUrl;
    data['title'] = this.title;
    data['__v'] = this.iV;
    return data;
  }
}
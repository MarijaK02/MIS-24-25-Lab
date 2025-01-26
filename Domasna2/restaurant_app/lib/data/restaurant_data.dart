import '../models/meal_category.dart';

const rawRestaurantData = [
  {
    "id": "1",
    "name": "Gourmet Paradise",
    "description": "A fine dining experience with exquisite cuisines.",
    "address": {
      "street": "Main Street",
      "number": "123",
      "city": "Gastronomy City",
      "municipality": "Downtown",
      "longitude": "45.123456",
      "latitude": "-93.654321"
    },
    "imageUrl": "https://i.natgeofe.com/n/04cf2a79-4a49-45eb-90f8-38356167690d/image00037.jpeg",
    "menu": [
      {
        "id": "101",
        "name": "Grilled Salmon",
        "description": "A perfectly grilled salmon fillet, complemented by fresh lemon and garlic for a rich flavor.",
        "ingredients": [
          {
            "name": "Salmon Fillet",
            "quantity": {
              "amount": 200,
              "unit": "grams"
            }
          },
          {
            "name": "Lemon",
            "quantity": {
              "amount": 1,
              "unit": "piece"
            }
          },
          {
            "name": "Garlic",
            "quantity": {
              "amount": 2,
              "unit": "cloves"
            }
          }
        ],
        "price": 18.99,
        "imageUrl": "https://www.wellplated.com/wp-content/uploads/2023/03/Easy-Grilled-Salmon.jpg",
        "category": MealCategory.mainCourse
      },
      {
        "id": "102",
        "name": "Caesar Salad",
        "description": "Crisp romaine lettuce, parmesan cheese, and crunchy croutons tossed in a rich Caesar dressing.",
        "ingredients": [
          {
            "name": "Romaine Lettuce",
            "quantity": {
              "amount": 1,
              "unit": "head"
            }
          },
          {
            "name": "Parmesan Cheese",
            "quantity": {
              "amount": 50,
              "unit": "grams"
            }
          },
          {
            "name": "Croutons",
            "quantity": {
              "amount": 30,
              "unit": "pieces"
            }
          }
        ],
        "price": 10.50,
        "imageUrl": "https://www.noracooks.com/wp-content/uploads/2022/06/vegan-caesar-salad-4.jpg",
        "category": MealCategory.appetizers
      },
      {
        "id": "103",
        "name": "Chocolate Lava Cake",
        "description": "A decadent dessert with a molten chocolate center.",
        "ingredients": [
          {
            "name": "Dark Chocolate",
            "quantity": {
              "amount": 100,
              "unit": "grams"
            }
          },
          {
            "name": "Butter",
            "quantity": {
              "amount": 50,
              "unit": "grams"
            }
          },
          {
            "name": "Eggs",
            "quantity": {
              "amount": 2,
              "unit": "pieces"
            }
          }
        ],
        "price": 7.99,
        "imageUrl": "https://www.allrecipes.com/thmb/dfGgVmzpoHhrsLjxGBa_0rIWyq0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/276304lava-cakeKim-e03d3bc55516400e8d05b8d84b524b73.jpg",
        "category": MealCategory.desserts
      },
      {
        "id": "104",
        "name": "Mojito",
        "description": "A refreshing cocktail made with rum, mint, and lime.",
        "ingredients": [
          {
            "name": "Rum",
            "quantity": {
              "amount": 50,
              "unit": "ml"
            }
          },
          {
            "name": "Mint",
            "quantity": {
              "amount": 10,
              "unit": "leaves"
            }
          },
          {
            "name": "Lime",
            "quantity": {
              "amount": 1,
              "unit": "piece"
            }
          }
        ],
        "price": 12.99,
        "imageUrl": "https://www.artofdrink.com/wp-content/uploads/2010/08/how-to-make-a-mojito-recipe.jpg",
        "category": MealCategory.alcoholicBeverages
      },
      {
        "id": "105",
        "name": "Lemonade",
        "description": "A refreshing and tangy drink made from fresh lemons.",
        "ingredients": [
          {
            "name": "Lemon",
            "quantity": {
              "amount": 2,
              "unit": "pieces"
            }
          },
          {
            "name": "Sugar",
            "quantity": {
              "amount": 30,
              "unit": "grams"
            }
          }
        ],
        "price": 4.99,
        "imageUrl": "https://images-gmi-pmc.edge-generalmills.com/c813ac67-2d4c-494c-8dbc-fc0ffaeb403a.jpg",
        "category": MealCategory.nonAlcoholicBeverages
      }
    ]
  },
  {
    "id": "2",
    "name": "Burger Haven",
    "description": "Best burgers in town with fresh ingredients.",
    "address": {
      "street": "Burger Lane",
      "number": "456",
      "city": "Snackville",
      "municipality": "Uptown",
      "longitude": "44.987654",
      "latitude": "-92.123456"
    },
    "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxUCrIfzlt6dnjOf7KWdHd6mbIxvAjRnahgg&s",
    "menu": [
      {
        "id": "201",
        "name": "Classic Cheeseburger",
        "description": "A juicy beef patty topped with melted cheddar cheese, lettuce, and tomato on a soft bun.",
        "ingredients": [
          {
            "name": "Beef Patty",
            "quantity": {
              "amount": 150,
              "unit": "grams"
            }
          },
          {
            "name": "Cheddar Cheese",
            "quantity": {
              "amount": 1,
              "unit": "slice"
            }
          },
          {
            "name": "Lettuce",
            "quantity": {
              "amount": 1,
              "unit": "leaf"
            }
          },
          {
            "name": "Tomato",
            "quantity": {
              "amount": 2,
              "unit": "slices"
            }
          }
        ],
        "price": 8.99,
        "imageUrl": "https://rhubarbandcod.com/wp-content/uploads/2022/06/The-Classic-Cheeseburger-1-500x500.jpg",
        "category": MealCategory.mainCourse
      },
      {
        "id": "202",
        "name": "Spicy Chicken Burger",
        "description": "A tender grilled chicken breast with spicy mayo and pickles on a soft bun for a flavorful kick.",
        "ingredients": [
          {
            "name": "Chicken Breast",
            "quantity": {
              "amount": 1,
              "unit": "piece"
            }
          },
          {
            "name": "Spicy Mayo",
            "quantity": {
              "amount": 20,
              "unit": "grams"
            }
          },
          {
            "name": "Pickles",
            "quantity": {
              "amount": 10,
              "unit": "slices"
            }
          }
        ],
        "price": 9.99,
        "imageUrl": "https://www.kitchensanctuary.com/wp-content/uploads/2024/09/Buffalo-Chicken-Burger-square-FS-2.jpg",
        "category": MealCategory.mainCourse
      },
      {
        "id": "203",
        "name": "Onion Rings",
        "description": "Crispy battered onion rings, perfect as a side or snack.",
        "ingredients": [
          {
            "name": "Onion",
            "quantity": {
              "amount": 1,
              "unit": "piece"
            }
          },
          {
            "name": "Flour",
            "quantity": {
              "amount": 100,
              "unit": "grams"
            }
          }
        ],
        "price": 3.99,
        "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_FKUjlqURBS6yqDjjDmbcN5MUBz2V-QAeiw&s",
        "category": MealCategory.snacks
      }
    ]
  }
];

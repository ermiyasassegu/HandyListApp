# HandyListApp

This is a simple, iOS project to process a shopping list that you can take to the shopping store with you, 
and move items into favorite or off the list as you pick them up. It persists data in CoreData as well as 
it uses an MVVM-style architecture along with SwiftUI, so you must have iOS 15.0 and Xcode 13.

**General App Structure**


![Simulator Screen Shot - iPhone 12 Pro - 2022-05-05 at 07 39 54](https://user-images.githubusercontent.com/67770426/166864657-2ec920f7-f5c8-4e77-9567-58b7fc43ca43.png)
![Simulator Screen Shot - iPhone 12 Pro - 2022-05-05 at 07 40 31](https://user-images.githubusercontent.com/67770426/166864669-3a3b6962-74b4-490f-8977-d3864a347832.png)
![Simulator Screen Shot - iPhone 12 Pro - 2022-05-05 at 07 39 41](https://user-images.githubusercontent.com/67770426/166864676-a875de4f-22ab-4c5e-b335-90b587b7f0a4.png)
![Simulator Screen Shot - iPhone 12 Pro - 2022-05-05 at 07 39 54](https://user-images.githubusercontent.com/67770426/166864724-4acbffe7-d36e-4e5b-b2d4-243e65d4b78e.png)

The main screen with the tab home view that show:

a current shopping list display asending by date,
a favorite shopping list,
voice icon to add item in voice recognition,
plus icon that pop-up a new sheet to add item


The CoreData model has only a single name "CD_CRUD_MVVM"

CD_CRUD_MVVM have an id (UUID), a title, date, isFavorite, isDone a boolean "onList" that indicates whether the item is on the list for today's shopping exercise, or not on the list (and so available in the purchased list for future promotion to the shopping list), and also an "isAvailable" boolean that provides a strike-through appearance for the item when false (sometimes an item is on the list, but not available today, and I want to remember that when planning the future shopping list). ShoppingItems originally had a visitationOrder that mirrored the visitationOrder of the Location to which they were assigned, but the current version of the code does not read or write the value of this field (i.e., feel free to delete it from the Core Data model if you have not already built out a large database using previous versions of the code).

# HandyListApp

This is a simple, iOS project to process a shopping list that you can take to the shopping store with you, 
and move items into favorite or off the list as you pick them up. It persists data in CoreData as well as 
it uses an MVVM-style architecture along with SwiftUI, so you must have iOS 15.0 and Xcode 13.

**General App Structure**

![Simulator Screen Shot - iPhone 12 Pro - 2022-05-05 at 07 41 02](https://user-images.githubusercontent.com/67770426/166866044-e8276d64-d9fe-4a70-bc39-d63cce5dd7fb.png)

![Simulator Screen Shot - iPhone 12 Pro - 2022-05-05 at 07 40 44](https://user-images.githubusercontent.com/67770426/166866074-8d647318-b70f-4f36-8fbe-f689f8b5c693.png)


![Simulator Screen Shot - iPhone 12 Pro - 2022-05-05 at 07 40 31](https://user-images.githubusercontent.com/67770426/166864669-3a3b6962-74b4-490f-8977-d3864a347832.png)

![Simulator Screen Shot - iPhone 12 Pro Max - 2022-05-05 at 11 16 35](https://user-images.githubusercontent.com/67770426/166886138-94ce8488-d33a-416b-90d6-bb11762dfb1b.png)


The main screen with the tab home view that show:

a current shopping list display asending by date,
a favorite shopping list,
voice icon to add item in voice recognition,
plus icon that pop-up a new sheet to add item


The CoreData model has only a single name "CD_CRUD_MVVM"

CD_CRUD_MVVM have an id (UUID), a title, date, isFavorite & isDone. "isDone" a boolean that provides a circle strike through the appearance for the times whether the item is purchase for today's shopping , or not, and also an "isFavorite" boolean that provides the user can save the purchased item for the future reference.
The app has features of possibility each of the items add(create), read, edit and delete from the core data.

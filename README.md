# Flutter eCommerce App

## Branch: replace_router
- We replaced navigation package codes with go_router package code.

## Branch: architecture
- We are choosing feature first architecture instead of layer first architecture. So in layman language we create a folder with name of feature e.g "products" and then create subfolders with layer name like "presentation" and "models" and "repository".

--products

---presentation

------ ui files

---models

-----dart model classes

- We will also create Data layer which is responsible for contacting to outside world
-- like REST APi
-- Local dbs
-- Local file system

- These sources always return the data in the format which is not directly accessed by the whole app code so we deal with desearialization and convert the objects to DTOs and these DTOs uses repositories to be accessed by whole app.(Model classes)

- We have created private constructor of Products to restrict making new instances .


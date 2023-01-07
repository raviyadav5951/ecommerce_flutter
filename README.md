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

## Branch: riverpod_1

- Goal: Use Riverpod as a DependencyInjection.
- First we have used flutter_riverpod package.
- Second we have wrapped the App widget inside ProviderScope(Riverpod).
- Then created a provider object for the FakeRepository and used in all the classes where we needed the FakeRepository methods (DI).
- E.g product_grid we updated the extend to ConsumerWidget so the build method now accepts WidgetRef parameter , which will be responsible to access any provider that is created throughout the app.
- Products screen we have used Consumer to listen to the changes made by provider and only update that part of widget tree instead. And also notice the parent widget class still extends StatelessWidget
- ConsumerWidget vs Consumer :
  ConsumerWidget rebuild complete widget and Consumer rebuild part of the widget and gives more control. When widgets are small you can use ConsumerWidget.

### Future or StreamProvider
- Two options available for using Future and Stream but we have to use asyncsnapshot to render the UI based on changes but the syntax is quite verbose
- So as a solution which RiverPod provides is creating a StreamProvider or FutureProvider.
- We created StreamProvider and FutureProvider methods to query the provider and it returns AsyncValue .
- This AsyncValue provides us the error,loading and data functions which gives us hint to add the function for all cases when app is in loading state, error state and with data state.



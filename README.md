# Weather App + Flutter Clean Architecture with BLoC

A hobby project to demonstrate the implementation of Clean Architecture using Bloc in Flutter. This repository is designed to serve as a starting point for Flutter developers who want to implement Clean Architecture principles in their applications.

## Screenshots
![Capture](https://i.imgur.com/adjwxbt.png)

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This project is a practical example of using Clean Architecture following Domain Driven Design with the Bloc state management library in Flutter. This design aims to separate concerns, making the system more understandable, flexible, and maintainable.

## Features
- **Separation of Concerns**: Divides the project into data, domain, and presentation layers.
- **Dependency Injection**: Uses `injectable` and `get_it` for managing dependencies.
- **Error Handling**: Implements `Either` type from the `dartz` package for functional error handling.
- **Localization**: Supports multiple languages with a `LocaleBuilder` class.

## Project Structure
The project is structured into four main layers, aligned with Domain Driven Design principles:

![Domain Driven Design](https://i.imgur.com/SBj3rsF.jpeg)

1. **Presentation Layer**: Responsible for the UI logic and rendering widgets.
    - **Widget**: UI components.
    - **State**: Manages the state of the widgets.
    - **UI Logic**: Handles the logic related to UI interactions.

    ```
    lib/
    └── feature/
        └── presentation/
            ├── pages/
    ```

2. **Application Layer**: Manages the application's flow and state using Bloc and UseCases.
- **Blocs**: Handles the state management and business logic.
- **UseCases**: Contains the application's use cases and orchestrates business logic.

    ```
    lib/
    └── feature/
        └── application/
            ├── blocs/
            └── use_case/
    ```


3. **Domain Layer**: Contains the business logic and entities of the application.
- **Entities**: Core business objects.
- **Aggregates**: Group of entities that are treated as a single unit.
- **Value Objects**: Objects that represent a descriptive aspect of the domain with no conceptual identity.
- **Repositories**: Abstractions for data access and transfer data object to entity.

    ```
    lib/
    └── feature/
        └── domain/
            ├── entity/
            └── repository/
    ```


4. **Infrastructure Layer**: Manages data sources and the raw data fetching from remote and local sources.
- **RemoteDataSource**: Handles data retrieval from remote APIs.
- **LocalDataSource**: Manages local data storage.
- **Data Transfer Objects (DTOs)**: Models used to transfer data between layers.

    ```
    lib/
    └── feature/
        └── infrastructure/
            ├── datasource/
            ├── model/
            └── repository/
    ```

Each layer has its own responsibility and they communicate with each other through defined interfaces. This separation of concerns makes the code more maintainable and testable.

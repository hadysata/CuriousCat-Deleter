# CuriousCat Deleter App

[![Pub Version](https://img.shields.io/pub/v/badges?color=blueviolet)](https://pub.dev/packages/badges)
[![APLv2][license-badge]][license]


Flutter Project to delete [CuriousCat] tweets from your [Twitter] account!


## Table of Contents
- [Contribute to This Project](#contribute-to-this-project)
  * [Repo Issues](#repo-issues)
    + [How to File an Issue?](#how-to-file-an-issue-)
  * [Creating a New Branch](#creating-a-new-branch)
  * [Conventions](#conventions)
    + [Commits and PRs](#commits-and-prs)
    + [Dart File Naming](#dart-file-naming)
- [Build, Run and Deploy](#build-run-and-deploy)
  * [Clone Repository](#clone-repository)
  * [Setup](#setup)
  * [Run](#run)
- [License](#license)


## Contribute to This Project

### Repo Issues

If you find a bug throughout your development or testing process, please do not hesitate to file an issue describing the bug you noticed.

#### How to File an Issue?

Here is how you create an issue:

- Go to the issues tab.
- Click on "New issue".
- Add an informative title following the naming convention below.
- Add a detailed description with the suggested solution if possible.
- Select applicable labels after reading each label's description.

### Creating a New Branch

If you want to start working on a new feature/fix a bug, create a new branch with a descriptive title preceded by your name as `@yourname/new-feature-title`.

_Note: branch names are all small cases separated by a dash `-`, e.g. `@hady/twitter-api-migration`_

### Conventions

#### Commits and PRs

The commit message should be structured as follows:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit contains the following structural elements:

- **fix:** a commit of the type `fix` patches a bug in the codebase.

- **feat:** a commit of the type `feat` introduces a new feature to the codebase.

- **BREAKING CHANGE:** a commit that has a footer `BREAKING CHANGE:`, or appends a `!` after the type/scope, introduces a breaking change.

- types other than fix: and feat: are allowed, for example `build:`, `chore:`, `ci:`, `docs:`, `style:`, `refactor:`, `perf:`, `test:`, and others.

Refer to [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) for more information.

#### Dart File Naming

- Small letters only.
- Use underscore as delimiters.
- Keep it short, clear, and simple.

Examples :
`date_helper.dart`
`settings_controller.dart`

## Build, Run and Deploy

This project is intended to be used with the latest Active release of Flutter & Dart

### Clone Repository

To clone this repo:

1. Open a new `terminal`/`powershell` window.
2. Clone the repo:
   ```bash
   git clone https://github.com/hadysata/CuriousCat-Deleter.git
   ```
   
3. Open the project in your favorite IDE/Code editor

### Setup

1. In the project root folder, run 
```bash
flutter pub get
```

2. In the project root folder, create a new `.env` file with the following variables:

```Dart
CLIENT_ID=
CLIENT_SECRET=
REDIRECT_URI=
URI_SCHEME=
```

These are Twitter keys used by the app to use Twitter API; you can get these keys from [Twitter developer portal](https://developer.twitter.com/en/portal/)

1- Go to the developer portal, click on `Overview`

<img width="252" alt="Screenshot 2023-04-26 at 8 46 58 PM" src="https://user-images.githubusercontent.com/40350360/234719866-dd9ae0e1-c69a-490d-8898-dfd284c9296c.png">

2- Create a new native app

<img width="400" alt="Screenshot 2023-04-27 at 1 56 58 AM" src="https://user-images.githubusercontent.com/40350360/234720141-2ea1bedb-0732-4d24-95a1-2587d0917a0b.png">

3- Make sure to have the same settings as below

<img height="450" alt="Screenshot 2023-04-26 at 8 45 59 PM" src="https://user-images.githubusercontent.com/40350360/234719950-9f5546e2-5515-411d-b996-c81559a4206b.png">


`REDIRECT_URI` & `URI_SCHEME` should look something similar to:
```Dart
REDIRECT_URI=com.hadysata.curiouscatdeleter.oauth://callback/
URI_SCHEME=com.hadysata.curiouscatdeleter.oauth
```

URI_SCHEME should be the same is your app bundle id

### Run
To run the script, in the project root folder run:

```bash
flutter run
```

## License

Licensed under the APLv2. See the [LICENSE] file for details.


[license-badge]: https://img.shields.io/badge/license-APLv2-blue.svg
[LICENSE]: https://github.com/hadysata/CuriousCat-Deleter/blob/main/LICENSE

[CuriousCat]: https://curiouscat.live/
[Twitter]: https://twitter.com/

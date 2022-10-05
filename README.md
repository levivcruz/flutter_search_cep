# Flutter Search Cep

## Installation

**Required [Flutter](https://flutter.dev/docs/get-started/install) library**

OS X, Windows & Linux:

```
flutter pub get
```

## Run

```
flutter run
```

## Description

_Este projeto tem como objetivo buscar um cep na [Api - ViaCep](https://viacep.com.br), onde o usuário pode obter visualização do map de cada cep e adicionar o cep em uma lista armazenando localmente._

## Development setup

Esse projeto foi desenvolvido com o Flutter e Dart.

## What I used


- [dio](https://pub.dev/packages/dio) para requisições http
- [sqflite](https://pub.dev/packages/sqflite) para persistencia em localStorage
- [geocoder](https://pub.dev/packages/geocoder) para obter latitude e longitude atraves do endereço
- [flutter_map](https://pub.dev/packages/flutter_map) para visualização do mapa
- [latlong2](https://pub.dev/packages/latlong2) para calcular latitude e longitude
- [get](https://pub.dev/packages/get) para o gerenciamento de estado
- [flutter_svg](https://pub.dev/packages/flutter_svg) para renderizar SVG
- [either_dart](https://pub.dev/packages/either_dart) para conceitos de programação funcional
- [path_provider](https://pub.dev/packages/path_provider) para gerenciar sistema de arquivo
- [mask_text_input_formatter](https://pub.dev/packages/mask_text_input_formatter) para adicionar mascaras nos inputs
- [mocktail](https://pub.dev/packages/mocktail) para testes unitarios
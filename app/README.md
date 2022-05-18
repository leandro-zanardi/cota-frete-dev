# app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Comandos uteis
rodar o comando abaixo sempre que alterar uma classe abstrata do diretorio store

flutter pub run build_runner watch --delete-conflicting-outputs

## Exemplo comando para deploy de funcoes separadas por ,

firebase deploy --only functions:admin-setCustomClaims

## Exemplo de delay no código

await Future.delayed(const Duration(seconds: 20), (() => {}));
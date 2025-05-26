# BSD Bank

Um aplicativo bancário moderno desenvolvido com Flutter, seguindo os princípios de arquitetura MVVM e Feature-driven.

## Links Úteis
- [Organização - Jira](https://lizandraquaresmadev.atlassian.net/jira/software/projects/KAN/summary?atlOrigin=eyJpIjoiNjhmNDU1OGZlOGJiNDIzNDlkZTU3Mjk3ZjZkN2Y1N2MiLCJwIjoiaiJ9)
- [Design - Figma](https://www.figma.com/design/oqpC6KLjbH051PdTmqXOu9/BSD-BANK?node-id=0-1&t=T0b4AjbhNmG4Ew17-1)

## 🚀 Tecnologias

- Flutter
- Provider (Gerenciamento de Estado)
- Auto Injector (Injeção de Dependência)
- Go Router (Navegação)
- Tr Extension (Internacionalização)

## 📋 Pré-requisitos

- Flutter SDK (versão mais recente)
- Dart SDK (versão mais recente)
- Android Studio / VS Code
- Git

## 🔧 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/bsd_bank.git
```

2. Entre no diretório do projeto:
```bash
cd bsd_bank
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Execute o projeto:
```bash
flutter run
```

## 📁 Estrutura do Projeto

O projeto segue uma arquitetura MVVM (Model-View-ViewModel) com organização Feature-driven:

```
/lib
  /app
    /features
      /feature
        /models
        /repositories
        /view_models
        /views
        /widgets
    /services
    /shared
      /constants
      /extensions
      /widgets
```

## 🏗️ Arquitetura

- **MVVM**: Separação clara entre Model, View e ViewModel
- **Feature-driven**: Organização por funcionalidades
- **Injeção de Dependência**: Utilizando Auto Injector
- **Gerenciamento de Estado**: Provider
- **Navegação**: Go Router
- **Internacionalização**: Tr Extension

## 🌐 Internacionalização

O projeto suporta múltiplos idiomas através do sistema de traduções. Os arquivos de tradução estão localizados em:
```
assets/translations/
```

## 🤝 Contribuindo

1. Faça um Fork do projeto
2. Crie uma Branch para sua Feature (`git checkout -b feature/AmazingFeature`)
3. Faça o Commit das suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Faça o Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.


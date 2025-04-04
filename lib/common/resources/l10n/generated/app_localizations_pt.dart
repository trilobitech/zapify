// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get unknownErrorMessage => 'Oops! Ocorreu um erro inesperado!';

  @override
  String get unknownErrorAction => 'Tentar novamente';

  @override
  String get advertisementPlaceholder => 'Publicidade';

  @override
  String get homeTopBannerAskToReviewContent => 'Você está gostando do Zapify? Envie sua avaliação.';

  @override
  String get homeTopBannerAskToReviewButton => 'AVALIAR';

  @override
  String get homePhoneNumberLabel => 'Número de telefone';

  @override
  String homeOpenWithButton(Object appName) {
    return '$appName';
  }

  @override
  String get homeEmptyPhoneNumberError => 'Por favor informe o número desejado.';

  @override
  String get homeInvalidPhoneNumberError => 'O número informado é inválido';

  @override
  String get homeChatAppNotFoundErrorTitle => 'Oops!';

  @override
  String homeChatAppNotFoundErrorMessage(Object appName) {
    return 'Ocorreu um erro ao abrir o \"$appName\".';
  }

  @override
  String get homeChatAppNotFoundErrorPrimaryAction => 'Procurar na loja';

  @override
  String get homeChatAppNotFoundErrorSecondaryAction => 'Cancelar';

  @override
  String get recentNumbersTitle => 'Números recentes';

  @override
  String get recentNumbersEmpty => 'Nenhum número recente';

  @override
  String recentNumberRemoved(Object phoneNumber) {
    return 'O número \"$phoneNumber\" foi removido do histórico!';
  }

  @override
  String get actionRemove => 'Excluir';

  @override
  String get actionUndo => 'Desfazer';

  @override
  String get actionSettings => 'Configurações';

  @override
  String get callLogTabTitle => 'Chamadas';

  @override
  String get callLogPermissionMessage => 'Para acessar seu histórico de chamadas e facilitar o envio de mensagens, precisamos da sua permissão. Saiba que nenhuma informação é armazenada ou compartilhada.';

  @override
  String get callLogPermissionButtonLabel => 'Conceder permissão';

  @override
  String get callLogEmptyMessage => 'Nenhuma chamada para exibir';

  @override
  String get availableRegionsTitle => 'Selecione o país';

  @override
  String get availableRegionsSearch => 'Procurar…';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsRegionTitle => 'País padrão';

  @override
  String get settingsRegionSubtitle => 'Selecione o país padrão para abrir um número';

  @override
  String get settingsMessagingAppsTitle => 'Aplicativos de mensagens';

  @override
  String get settingsMessagingAppsSubtitle => 'Selecione os aplicativos de mensagens que deseja usar';

  @override
  String get messagingAppsTitle => 'Aplicativos de mensagens';

  @override
  String get messagingAppsEnabledHeader => 'Aplicativos disponíveis';

  @override
  String get messagingAppsDisabledHeader => 'Aplicativos ocultos';

  @override
  String get today => '\'Hoje às\' HH:mm';

  @override
  String get yesterday => '\'Ontem às\' HH:mm';

  @override
  String get lastCoupleOfDays => 'EEEE \'às\' HH:mm';

  @override
  String get lastCoupleOfMonths => 'd \'de\' MMMM \'às\' HH:mm';

  @override
  String get longTimeAgo => 'd \'de\' MMMM \'de\' yyyy';
}

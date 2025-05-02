// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get unknownErrorMessage => '¡Ups! ¡Algo salió mal!';

  @override
  String get unknownErrorAction => 'Inténtalo de nuevo';

  @override
  String get advertisementPlaceholder => 'Publicidad';

  @override
  String get homeTopBannerUpdateAvailableContent => 'Nueva versión disponible. Actualiza ahora para disfrutar de las últimas funciones.';

  @override
  String get homeTopBannerUpdateAvailableButton => 'ACTUALIZAR';

  @override
  String get homePhoneNumberLabel => 'Número de teléfono';

  @override
  String get homePhoneNumberWithAreaCodeLabel => 'Número de teléfono con código de área';

  @override
  String homeOpenWithButton(Object appName) {
    return '$appName';
  }

  @override
  String get homeEmptyPhoneNumberError => 'Por favor, introduce el número de teléfono';

  @override
  String get homeInvalidPhoneNumberError => 'Número de teléfono no válido';

  @override
  String get homeChatAppNotFoundErrorTitle => '¡Ups!';

  @override
  String homeChatAppNotFoundErrorMessage(Object appName) {
    return 'Ocurrió un error al abrir \"$appName\".';
  }

  @override
  String get homeChatAppNotFoundErrorPrimaryAction => 'Buscar en la tienda';

  @override
  String get homeChatAppNotFoundErrorSecondaryAction => 'Cancelar';

  @override
  String get recentNumbersTitle => 'Números recientes';

  @override
  String get recentNumbersEmpty => 'Aún no hay números recientes';

  @override
  String recentNumberRemoved(Object phoneNumber) {
    return '¡El número reciente \"$phoneNumber\" fue eliminado!';
  }

  @override
  String get actionRemove => 'Eliminar';

  @override
  String get actionUndo => 'Deshacer';

  @override
  String get actionSettings => 'Ajustes';

  @override
  String get callLogTabTitle => 'Llamadas';

  @override
  String get callLogPermissionMessage => 'Para acceder a tu historial de llamadas y facilitar la mensajería, necesitamos tu permiso. No te preocupes, no se almacena ni comparte ninguna información.';

  @override
  String get callLogPermissionButtonLabel => 'Conceder permiso';

  @override
  String get callLogEmptyMessage => 'No hay llamadas para mostrar';

  @override
  String get availableRegionsTitle => 'Selecciona un país';

  @override
  String get availableRegionsSearch => 'Buscar…';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsRegionTitle => 'Región predeterminada';

  @override
  String get settingsRegionSubtitle => 'Selecciona la región predeterminada para abrir un número';

  @override
  String get settingsMessagingAppsTitle => 'Aplicaciones de mensajería';

  @override
  String get settingsMessagingAppsSubtitle => 'Selecciona las aplicaciones de mensajería que deseas usar';

  @override
  String get messagingAppsTitle => 'Aplicaciones de mensajería';

  @override
  String get messagingAppsEnabledHeader => 'Aplicaciones disponibles';

  @override
  String get messagingAppsDisabledHeader => 'Aplicaciones ocultas';

  @override
  String get today => '\'Hoy a las\' H:mm';

  @override
  String get yesterday => '\'Ayer a las\' H:mm';

  @override
  String get lastCoupleOfDays => 'EEEE \'a las\' H:mm';

  @override
  String get lastCoupleOfMonths => 'd \'de\' MMMM \'a las\' H:mm';

  @override
  String get longTimeAgo => 'd \'de\' MMMM, yyyy';
}

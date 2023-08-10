// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Constants {
    internal enum Content {
      internal enum Api {
        /// iCloud
        internal static let icloud = L10n.tr("Constants", "constants.content.api.icloud", fallback: "iCloud")
      }
      internal enum Button {
        /// Continuar
        internal static let `continue` = L10n.tr("Constants", "constants.content.button.continue", fallback: "Continuar")
        /// Voltar
        internal static let previous = L10n.tr("Constants", "constants.content.button.previous", fallback: "Voltar")
        /// Referências
        internal static let seeMore = L10n.tr("Constants", "constants.content.button.see-more", fallback: "Referências")
        /// Ajustes
        internal static let settings = L10n.tr("Constants", "constants.content.button.settings", fallback: "Ajustes")
        /// Iniciar
        internal static let start = L10n.tr("Constants", "constants.content.button.start", fallback: "Iniciar")
      }
      internal enum Label {
        /// Luna
        internal static let appName = L10n.tr("Constants", "constants.content.label.app_name", fallback: "Luna")
        /// Permita que o Luna acesse seu Calendar para planejar seus dias com sabedoria e melhorar o seu bem-estar
        internal static let calendarSubtitle = L10n.tr("Constants", "constants.content.label.calendar_subtitle", fallback: "Permita que o Luna acesse seu Calendar para planejar seus dias com sabedoria e melhorar o seu bem-estar")
        /// Consiga ver seu ciclo no seu dia a dia
        internal static let calendarTitle = L10n.tr("Constants", "constants.content.label.calendar_title", fallback: "Consiga ver seu ciclo no seu dia a dia")
        /// Quanto tempo dura o
        /// seu ciclo menstrual?
        internal static let cycleDuration = L10n.tr("Constants", "constants.content.label.cycle_duration", fallback: "Quanto tempo dura o\nseu ciclo menstrual?")
        /// Menstruação Prevista
        internal static let expectedMenstruation = L10n.tr("Constants", "constants.content.label.expectedMenstruation", fallback: "Menstruação Prevista")
        /// 💓 Período fertil
        internal static let fertile = L10n.tr("Constants", "constants.content.label.fertile", fallback: "💓 Período fertil")
        /// ⚡️ Fase folicular
        internal static let folicular = L10n.tr("Constants", "constants.content.label.folicular", fallback: "⚡️ Fase folicular")
        /// Seu ciclo ao seu favor
        internal static let landingPageDescription = L10n.tr("Constants", "constants.content.label.landing_page_description", fallback: "Seu ciclo ao seu favor")
        /// Constants.strings
        ///   luna
        /// 
        ///   Created by alexdamascena on 18/07/23.
        internal static let lastDayMenstruation = L10n.tr("Constants", "constants.content.label.last_day_menstruation", fallback: "Quando foi o início da\nsua última menstruação?")
        /// ⬛️ Fase lútea
        internal static let luteal = L10n.tr("Constants", "constants.content.label.luteal", fallback: "⬛️ Fase lútea")
        /// 🩸 Menstruação
        internal static let menstruation = L10n.tr("Constants", "constants.content.label.menstruation", fallback: "🩸 Menstruação")
        /// Quantos dias dura a
        /// sua menstruação?
        internal static let menstruationDuration = L10n.tr("Constants", "constants.content.label.menstruation_duration", fallback: "Quantos dias dura a\nsua menstruação?")
        /// Fase Folicular
        internal static let onboardingFolicule = L10n.tr("Constants", "constants.content.label.onboarding_folicule", fallback: "Fase Folicular")
        /// As estrelas vermelhas representam os dias da sua fase folicular.
        internal static let onboardingFoliculeDescription = L10n.tr("Constants", "constants.content.label.onboarding_folicule_description", fallback: "As estrelas vermelhas representam os dias da sua fase folicular.")
        /// Previsão
        internal static let onboardingForecast = L10n.tr("Constants", "constants.content.label.onboarding_forecast", fallback: "Previsão")
        /// O círculo vermelho claro indica a previsão do provável dia em que sua menstruação ocorrerá.
        internal static let onboardingForecastDescription = L10n.tr("Constants", "constants.content.label.onboarding_forecast_description", fallback: "O círculo vermelho claro indica a previsão do provável dia em que sua menstruação ocorrerá.")
        /// Fase Lútea
        internal static let onboardingLuteal = L10n.tr("Constants", "constants.content.label.onboarding_luteal", fallback: "Fase Lútea")
        /// As nuvens azuis representam os dias que você está na fase lútea.
        internal static let onboardingLutealDescription = L10n.tr("Constants", "constants.content.label.onboarding_luteal_description", fallback: "As nuvens azuis representam os dias que você está na fase lútea.")
        /// Ovulação
        internal static let onboardingOvulation = L10n.tr("Constants", "constants.content.label.onboarding_ovulation", fallback: "Ovulação")
        /// O contorno azul representa quando é provável que você ovule.
        internal static let onboardingOvulationDescription = L10n.tr("Constants", "constants.content.label.onboarding_ovulation_description", fallback: "O contorno azul representa quando é provável que você ovule.")
        /// Registrar Menstruação
        internal static let onboardingRegisterMenstruation = L10n.tr("Constants", "constants.content.label.onboarding_register_menstruation", fallback: "Registrar Menstruação")
        /// O círculo vermelho representa o dia em que ocorreu a menstruação. Basta clicar no botão para registrar!
        internal static let onboardingRegisterMenstruationDescription = L10n.tr("Constants", "constants.content.label.onboarding_register_menstruation_description", fallback: "O círculo vermelho representa o dia em que ocorreu a menstruação. Basta clicar no botão para registrar!")
        /// 😡 TPM
        internal static let pms = L10n.tr("Constants", "constants.content.label.pms", fallback: "😡 TPM")
        internal enum Home {
          /// 2. Permita o acesso
          internal static let acessSubtitle = L10n.tr("Constants", "constants.content.label.home.acess_subtitle", fallback: "2. Permita o acesso")
          /// Luna precisa estar conectado com o Calendário para salvar seu ciclo
          internal static let calendarSync = L10n.tr("Constants", "constants.content.label.home.calendar_sync", fallback: "Luna precisa estar conectado com o Calendário para salvar seu ciclo")
          /// Fases do Ciclo Menstrual
          internal static let cyclePhases = L10n.tr("Constants", "constants.content.label.home.cycle_phases", fallback: "Fases do Ciclo Menstrual")
          /// Fase Folicular
          internal static let follicular = L10n.tr("Constants", "constants.content.label.home.follicular", fallback: "Fase Folicular")
          /// Aprenda sobre as
          internal static let learnCycle = L10n.tr("Constants", "constants.content.label.home.learn_cycle", fallback: "Aprenda sobre as")
          /// Fase Lútea
          internal static let luteal = L10n.tr("Constants", "constants.content.label.home.luteal", fallback: "Fase Lútea")
          /// Menstruação
          internal static let menstruation = L10n.tr("Constants", "constants.content.label.home.menstruation", fallback: "Menstruação")
          /// Ovulação
          internal static let ovulation = L10n.tr("Constants", "constants.content.label.home.ovulation", fallback: "Ovulação")
          /// Menstruação registrada
          internal static let recordedMenstruation = L10n.tr("Constants", "constants.content.label.home.recordedMenstruation", fallback: "Menstruação registrada")
          /// 1. Vá em ajustes
          internal static let settingsSubtitle = L10n.tr("Constants", "constants.content.label.home.settings_subtitle", fallback: "1. Vá em ajustes")
          /// Você está na
          internal static let youAreIn = L10n.tr("Constants", "constants.content.label.home.youAreIn", fallback: "Você está na")
          internal enum Informational {
            /// O que fazer?
            internal static let `do` = L10n.tr("Constants", "constants.content.label.home.informational.do", fallback: "O que fazer?")
            /// O que é?
            internal static let what = L10n.tr("Constants", "constants.content.label.home.informational.what", fallback: "O que é?")
          }
          internal enum Link {
            internal enum References {
              /// https://www.scielo.br/j/trends/a/sCgf4Rzvkvjmmv4bSMzV6vk/?format=pdf&lang=en
              internal static let fifth = L10n.tr("Constants", "constants.content.label.home.link.references.fifth", fallback: "https://www.scielo.br/j/trends/a/sCgf4Rzvkvjmmv4bSMzV6vk/?format=pdf&lang=en")
              /// https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4436586/
              internal static let first = L10n.tr("Constants", "constants.content.label.home.link.references.first", fallback: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4436586/")
              /// https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9761221/
              internal static let fourth = L10n.tr("Constants", "constants.content.label.home.link.references.fourth", fallback: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9761221/")
              /// https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2834565/
              internal static let second = L10n.tr("Constants", "constants.content.label.home.link.references.second", fallback: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2834565/")
              /// https://rsdjournal.org/index.php/rsd/article/view/23925/21106
              internal static let third = L10n.tr("Constants", "constants.content.label.home.link.references.third", fallback: "https://rsdjournal.org/index.php/rsd/article/view/23925/21106")
            }
          }
          internal enum Text {
            internal enum References {
              /// Souza EG, Ramos MG, Hara C, Stumpf BP, Rocha FL. Neuropsychological performance and menstrual cycle: a literature review. Trends Psychiatry Psychother. 2012;34(1):5-12.
              internal static let fifth = L10n.tr("Constants", "constants.content.label.home.text.references.fifth", fallback: "Souza EG, Ramos MG, Hara C, Stumpf BP, Rocha FL. Neuropsychological performance and menstrual cycle: a literature review. Trends Psychiatry Psychother. 2012;34(1):5-12.")
              /// Mesen TB, Young SL. Progesterone and the luteal phase: a requisite to reproduction. Obstet Gynecol Clin North Am. 2015 Mar;42(1):135-51. PMID: 25681845; PMCID: PMC4436586.
              internal static let first = L10n.tr("Constants", "constants.content.label.home.text.references.first", fallback: "Mesen TB, Young SL. Progesterone and the luteal phase: a requisite to reproduction. Obstet Gynecol Clin North Am. 2015 Mar;42(1):135-51. PMID: 25681845; PMCID: PMC4436586.")
              /// Ponzo S, Wickham A, Bamford R, Radovic T, Zhaunova L, Peven K, Klepchukova A, Payne JL. Menstrual cycle-associated symptoms and workplace productivity in US employees: A cross-sectional survey of users of the Flo mobile phone app. Digit Health. 2022 Dec 15;8:20552076221145852. PMID: 36544535; PMCID: PMC9761221.
              internal static let fourth = L10n.tr("Constants", "constants.content.label.home.text.references.fourth", fallback: "Ponzo S, Wickham A, Bamford R, Radovic T, Zhaunova L, Peven K, Klepchukova A, Payne JL. Menstrual cycle-associated symptoms and workplace productivity in US employees: A cross-sectional survey of users of the Flo mobile phone app. Digit Health. 2022 Dec 15;8:20552076221145852. PMID: 36544535; PMCID: PMC9761221.")
              /// Jukic AM, Weinberg CR, Baird DD, Wilcox AJ. Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular. J Womens Health (Larchmt). 2007 Nov;16(9):1340-7. PMID: 18001191; PMCID: PMC2834565.
              internal static let second = L10n.tr("Constants", "constants.content.label.home.text.references.second", fallback: "Jukic AM, Weinberg CR, Baird DD, Wilcox AJ. Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular. J Womens Health (Larchmt). 2007 Nov;16(9):1340-7. PMID: 18001191; PMCID: PMC2834565.")
              /// Lima MP, Moreira MA, Maynard DC, Cruz MFA (2021) Alterações fisiológicas e comportamentais da mulher no ciclo menstrual e o impacto da suplementação nutricional / Physiological and behavioral changes in women during the menstrual cycle and the impact of nutritional supplementation. Published: 16/12/2021]. Revista de Saúde e Nutrição 28(1): e021001.
              internal static let third = L10n.tr("Constants", "constants.content.label.home.text.references.third", fallback: "Lima MP, Moreira MA, Maynard DC, Cruz MFA (2021) Alterações fisiológicas e comportamentais da mulher no ciclo menstrual e o impacto da suplementação nutricional / Physiological and behavioral changes in women during the menstrual cycle and the impact of nutritional supplementation. Published: 16/12/2021]. Revista de Saúde e Nutrição 28(1): e021001.")
            }
          }
        }
        internal enum Phase {
          /// Menstruação Prevista
          internal static let expectedMenstruation = L10n.tr("Constants", "constants.content.label.phase.expectedMenstruation", fallback: "Menstruação Prevista")
          /// Ovulação
          internal static let fertile = L10n.tr("Constants", "constants.content.label.phase.fertile", fallback: "Ovulação")
          /// Fase Folicular
          internal static let folicular = L10n.tr("Constants", "constants.content.label.phase.folicular", fallback: "Fase Folicular")
          /// Fase Lútea
          internal static let luteal = L10n.tr("Constants", "constants.content.label.phase.luteal", fallback: "Fase Lútea")
          /// Menstruação
          internal static let menstruation = L10n.tr("Constants", "constants.content.label.phase.menstruation", fallback: "Menstruação")
          /// 😡 TPM
          internal static let pms = L10n.tr("Constants", "constants.content.label.phase.pms", fallback: "😡 TPM")
        }
        internal enum Placeholder {
          /// Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.
          internal static let big = L10n.tr("Constants", "constants.content.label.placeholder.big", fallback: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.")
          /// Sed ut perspiciatis unde
          internal static let bullet = L10n.tr("Constants", "constants.content.label.placeholder.bullet", fallback: "Sed ut perspiciatis unde")
        }
        internal enum Text {
          internal enum Avoid {
            /// É o momento de adiar as atividades estressantes. E se o objetivo não for engravidar, lembre-se de proteção. 
            internal static let fertile = L10n.tr("Constants", "constants.content.label.text.avoid.fertile", fallback: "É o momento de adiar as atividades estressantes. E se o objetivo não for engravidar, lembre-se de proteção. ")
            /// Nada de passar sede nessa fase. Hidrate-se em abundância! 
            internal static let folicular = L10n.tr("Constants", "constants.content.label.text.avoid.folicular", fallback: "Nada de passar sede nessa fase. Hidrate-se em abundância! ")
            /// Seu corpo pode estar retendo mais líquido, pode ser bom evitar alimentos ricos em sal.
            internal static let luteal = L10n.tr("Constants", "constants.content.label.text.avoid.luteal", fallback: "Seu corpo pode estar retendo mais líquido, pode ser bom evitar alimentos ricos em sal.")
            /// Atividades sociais intensas podem ficar para depois nessa fase, assim atividades de alto impacto ou força. Foge das roupas apertadas também, fica confortável!
            internal static let menstruation = L10n.tr("Constants", "constants.content.label.text.avoid.menstruation", fallback: "Atividades sociais intensas podem ficar para depois nessa fase, assim atividades de alto impacto ou força. Foge das roupas apertadas também, fica confortável!")
          }
          internal enum BehindSheets {
            /// O pico de LH (hormônio luteinizante) desencadeia na liberação do óvulo maduro, que tem uma vida útil de cerca de 12 a 24 horas. 
            internal static let fertile = L10n.tr("Constants", "constants.content.label.text.behind_sheets.fertile", fallback: "O pico de LH (hormônio luteinizante) desencadeia na liberação do óvulo maduro, que tem uma vida útil de cerca de 12 a 24 horas. ")
            /// Os hormônios foliculoestimulante (FSH) começam  em alta para o desenvolvimento dos folículos. Depois o estrogênio atinge seu pico e você pode notar um muco na vagina. Por fim, há o aumento drástico do hormônio luteinizante (LH) para a ovulação. Ufa!
            internal static let folicular = L10n.tr("Constants", "constants.content.label.text.behind_sheets.folicular", fallback: "Os hormônios foliculoestimulante (FSH) começam  em alta para o desenvolvimento dos folículos. Depois o estrogênio atinge seu pico e você pode notar um muco na vagina. Por fim, há o aumento drástico do hormônio luteinizante (LH) para a ovulação. Ufa!")
            /// Níveis de estrogênio e progesterona atingem o pico, se preparando para uma possível gravidez.
            internal static let luteal = L10n.tr("Constants", "constants.content.label.text.behind_sheets.luteal", fallback: "Níveis de estrogênio e progesterona atingem o pico, se preparando para uma possível gravidez.")
            /// O sangramento significa que não houve fecundação e os níveis de hormônios estrogênio e progesterona estão bem baixos. 
            internal static let menstruation = L10n.tr("Constants", "constants.content.label.text.behind_sheets.menstruation", fallback: "O sangramento significa que não houve fecundação e os níveis de hormônios estrogênio e progesterona estão bem baixos. ")
          }
          internal enum Help {
            /// É normal estar desejando mais doces, vai com moderação e seja feliz! Energia também tá em alta, abuse dos exercícios de força.
            internal static let fertile = L10n.tr("Constants", "constants.content.label.text.help.fertile", fallback: "É normal estar desejando mais doces, vai com moderação e seja feliz! Energia também tá em alta, abuse dos exercícios de força.")
            /// Manter bons hábitos alimentares e exercícios pode ser interessante, aproveite a energia dessa fase!
            internal static let folicular = L10n.tr("Constants", "constants.content.label.text.help.folicular", fallback: "Manter bons hábitos alimentares e exercícios pode ser interessante, aproveite a energia dessa fase!")
            /// A ansiedade vai estar em alta, tenha um pouquinho de paciência. Se preparar para cólicas e náuseas pode ajudar!
            internal static let luteal = L10n.tr("Constants", "constants.content.label.text.help.luteal", fallback: "A ansiedade vai estar em alta, tenha um pouquinho de paciência. Se preparar para cólicas e náuseas pode ajudar!")
            /// A liberação de endorfina ao fazer exercício (leves) pode ajudar em cólicas e no humor, então se joga!
            internal static let menstruation = L10n.tr("Constants", "constants.content.label.text.help.menstruation", fallback: "A liberação de endorfina ao fazer exercício (leves) pode ajudar em cólicas e no humor, então se joga!")
          }
          internal enum HowAreYou {
            /// A sensação de libido pode aumentar e você pode se achar mais atraente também!
            internal static let fertile = L10n.tr("Constants", "constants.content.label.text.how_are_you.fertile", fallback: "A sensação de libido pode aumentar e você pode se achar mais atraente também!")
            /// Energia e bem-estar em alta! Aproveita para resolver as broncas da vida. A sua libido pode aumentar, hein?
            internal static let folicular = L10n.tr("Constants", "constants.content.label.text.how_are_you.folicular", fallback: "Energia e bem-estar em alta! Aproveita para resolver as broncas da vida. A sua libido pode aumentar, hein?")
            /// Você pode sentir alguns sintomas de TPM (tensão pré-menstrual). Sensibilidade é normal. Vai passar!
            internal static let luteal = L10n.tr("Constants", "constants.content.label.text.how_are_you.luteal", fallback: "Você pode sentir alguns sintomas de TPM (tensão pré-menstrual). Sensibilidade é normal. Vai passar!")
            /// Essa fase pode causar maior irritabilidade e você pode ficar mais sensível. Ter cólicas e mudanças de paladar também faz parte. Forças!
            internal static let menstruation = L10n.tr("Constants", "constants.content.label.text.how_are_you.menstruation", fallback: "Essa fase pode causar maior irritabilidade e você pode ficar mais sensível. Ter cólicas e mudanças de paladar também faz parte. Forças!")
          }
          internal enum WhatIs {
            /// Seu óvulo foi liberado! Ele tá pronto para ser fertilizado por um espermatozoide.
            internal static let fertile = L10n.tr("Constants", "constants.content.label.text.what_is.fertile", fallback: "Seu óvulo foi liberado! Ele tá pronto para ser fertilizado por um espermatozoide.")
            /// A preparação começou! Os folículos ovarianos estão amadurecerecendo.
            internal static let folicular = L10n.tr("Constants", "constants.content.label.text.what_is.folicular", fallback: "A preparação começou! Os folículos ovarianos estão amadurecerecendo.")
            /// O folículo que liberou o óvulo agora é um corpo lúteo. Hormônios em alta!
            internal static let luteal = L10n.tr("Constants", "constants.content.label.text.what_is.luteal", fallback: "O folículo que liberou o óvulo agora é um corpo lúteo. Hormônios em alta!")
            /// Você está literalmente sangrando. O revestimento interno do seu útero (endométrio) está sendo eliminado. 
            internal static let menstruation = L10n.tr("Constants", "constants.content.label.text.what_is.menstruation", fallback: "Você está literalmente sangrando. O revestimento interno do seu útero (endométrio) está sendo eliminado. ")
          }
        }
      }
    }
    internal enum User {
      internal enum Key {
        /// onboarding
        internal static let forOnboardingWasSeen = L10n.tr("Constants", "constants.user.key.for_onboarding_was_seen", fallback: "onboarding")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type

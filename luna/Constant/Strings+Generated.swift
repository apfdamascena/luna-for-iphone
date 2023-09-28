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
      internal enum Alert {
        internal enum Warning {
          /// Você não pode marcar atividadade sem nome
          internal static let noTitleActivity = L10n.tr("Constants", "constants.content.alert.warning.no_title_activity", fallback: "Você não pode marcar atividadade sem nome")
          /// Aviso
          internal static let title = L10n.tr("Constants", "constants.content.alert.warning.title", fallback: "Aviso")
        }
      }
      internal enum Api {
        /// iCloud
        internal static let icloud = L10n.tr("Constants", "constants.content.api.icloud", fallback: "iCloud")
      }
      internal enum Button {
        /// Voltar pro início
        internal static let backToHome = L10n.tr("Constants", "constants.content.button.backToHome", fallback: "Voltar pro início")
        /// Continuar
        internal static let `continue` = L10n.tr("Constants", "constants.content.button.continue", fallback: "Continuar")
        /// Nova Atividade
        internal static let newEvent = L10n.tr("Constants", "constants.content.button.newEvent", fallback: "Nova Atividade")
        /// Voltar
        internal static let previous = L10n.tr("Constants", "constants.content.button.previous", fallback: "Voltar")
        /// Leia as referências
        internal static let references = L10n.tr("Constants", "constants.content.button.references", fallback: "Leia as referências")
        /// Marcar Evento
        internal static let scheduleActivity = L10n.tr("Constants", "constants.content.button.schedule_activity", fallback: "Marcar Evento")
        /// Ajustes
        internal static let settings = L10n.tr("Constants", "constants.content.button.settings", fallback: "Ajustes")
        /// Iniciar
        internal static let start = L10n.tr("Constants", "constants.content.button.start", fallback: "Iniciar")
      }
      internal enum Label {
        /// Sua atividade está no calendário!
        internal static let activityOnCalendar = L10n.tr("Constants", "constants.content.label.activity_on_calendar", fallback: "Sua atividade está no calendário!")
        /// Luna
        internal static let appName = L10n.tr("Constants", "constants.content.label.app_name", fallback: "Luna")
        /// Luna Activities
        internal static let calendarActivities = L10n.tr("Constants", "constants.content.label.calendar_activities", fallback: "Luna Activities")
        /// Permita que o Luna acesse seu Calendar para planejar seus dias com sabedoria e melhorar o seu bem-estar
        internal static let calendarSubtitle = L10n.tr("Constants", "constants.content.label.calendar_subtitle", fallback: "Permita que o Luna acesse seu Calendar para planejar seus dias com sabedoria e melhorar o seu bem-estar")
        /// Sintonize com seu dia a dia
        internal static let calendarTitle = L10n.tr("Constants", "constants.content.label.calendar_title", fallback: "Sintonize com seu dia a dia")
        /// Quantos dias dura o
        /// seu ciclo menstrual?
        internal static let cycleDuration = L10n.tr("Constants", "constants.content.label.cycle_duration", fallback: "Quantos dias dura o\nseu ciclo menstrual?")
        /// Menstruação Prevista
        internal static let expectedMenstruation = L10n.tr("Constants", "constants.content.label.expectedMenstruation", fallback: "Menstruação Prevista")
        /// 💓 Período fertil
        internal static let fertile = L10n.tr("Constants", "constants.content.label.fertile", fallback: "💓 Período fertil")
        /// ⚡️ Fase folicular
        internal static let folicular = L10n.tr("Constants", "constants.content.label.folicular", fallback: "⚡️ Fase folicular")
        /// Seu ciclo ao seu favor
        internal static let landingPageDescription = L10n.tr("Constants", "constants.content.label.landing_page_description", fallback: "Seu ciclo ao seu favor")
        /// Quando foi o início da
        /// sua última menstruação?
        internal static let lastDayMenstruation = L10n.tr("Constants", "constants.content.label.last_day_menstruation", fallback: "Quando foi o início da\nsua última menstruação?")
        /// ⬛️ Fase lútea
        internal static let luteal = L10n.tr("Constants", "constants.content.label.luteal", fallback: "⬛️ Fase lútea")
        /// 🩸 Menstruação
        internal static let menstruation = L10n.tr("Constants", "constants.content.label.menstruation", fallback: "🩸 Menstruação")
        /// Quantos dias dura a
        /// sua menstruação?
        internal static let menstruationDuration = L10n.tr("Constants", "constants.content.label.menstruation_duration", fallback: "Quantos dias dura a\nsua menstruação?")
        /// Autorize as notificações de Luna para acompanhar de perto seu ciclo menstrual
        internal static let notificationSubtitle = L10n.tr("Constants", "constants.content.label.notification_subtitle", fallback: "Autorize as notificações de Luna para acompanhar de perto seu ciclo menstrual")
        /// Em tempo real com seu ciclo
        internal static let notificationTitle = L10n.tr("Constants", "constants.content.label.notification_title", fallback: "Em tempo real com seu ciclo")
        /// Fase Folicular
        internal static let onboardingFolicule = L10n.tr("Constants", "constants.content.label.onboarding_folicule", fallback: "Fase Folicular")
        /// As estrelas vermelhas representam os dias da sua fase folicular.
        internal static let onboardingFoliculeDescription = L10n.tr("Constants", "constants.content.label.onboarding_folicule_description", fallback: "As estrelas vermelhas representam os dias da sua fase folicular.")
        /// Previsão
        internal static let onboardingForecast = L10n.tr("Constants", "constants.content.label.onboarding_forecast", fallback: "Previsão")
        /// O círculo vermelho claro indica a previsão do provável dia em que sua menstruação ocorrerá.
        internal static let onboardingForecastDescription = L10n.tr("Constants", "constants.content.label.onboarding_forecast_description", fallback: "O círculo vermelho claro indica a previsão do provável dia em que sua menstruação ocorrerá.")
        /// Desperte seu próprio ritmo
        internal static let onboardingLandingPage = L10n.tr("Constants", "constants.content.label.onboarding_landing_page", fallback: "Desperte seu próprio ritmo")
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
        internal enum Activity {
          internal enum Calendar {
            /// Nova atividade
            internal static let newActivity = L10n.tr("Constants", "constants.content.label.activity.calendar.new_activity", fallback: "Nova atividade")
          }
        }
        internal enum BestActivity {
          /// Sugerimos realizar a atividade durante a 
          internal static let subtitle = L10n.tr("Constants", "constants.content.label.best_activity.subtitle", fallback: "Sugerimos realizar a atividade durante a ")
          /// Sintonizamos a atividade com seu ciclo e recomendamos que você a realize entre os dias
          internal static let text = L10n.tr("Constants", "constants.content.label.best_activity.text", fallback: "Sintonizamos a atividade com seu ciclo e recomendamos que você a realize entre os dias")
        }
        internal enum CreateEvent {
          internal enum Nav {
            /// Criar evento
            internal static let title = L10n.tr("Constants", "constants.content.label.create_event.nav.title", fallback: "Criar evento")
          }
        }
        internal enum FirstTimeNewActivity {
          /// Vamos!
          internal static let button = L10n.tr("Constants", "constants.content.label.first_time_new_activity.button", fallback: "Vamos!")
          /// Registre uma atividade que precise fazer e receba uma sugestão personalizada sobre quando realizá-la no seu ciclo.
          internal static let subtitle = L10n.tr("Constants", "constants.content.label.first_time_new_activity.subtitle", fallback: "Registre uma atividade que precise fazer e receba uma sugestão personalizada sobre quando realizá-la no seu ciclo.")
          /// Vamos marcar uma nova atividade?
          internal static let title = L10n.tr("Constants", "constants.content.label.first_time_new_activity.title", fallback: "Vamos marcar uma nova atividade?")
        }
        internal enum Home {
          /// Tudo sobre
          internal static let about = L10n.tr("Constants", "constants.content.label.home.about", fallback: "Tudo sobre")
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
          /// Pra quê olhar pro passado? Ele já passou!
          internal static let noData = L10n.tr("Constants", "constants.content.label.home.no_data", fallback: "Pra quê olhar pro passado? Ele já passou!")
          /// A previsão só é feita a partir da sua última menstruação, assim não temos o que te falar sobre esse dia.
          internal static let noDataDescripition = L10n.tr("Constants", "constants.content.label.home.no_data_descripition", fallback: "A previsão só é feita a partir da sua última menstruação, assim não temos o que te falar sobre esse dia.")
          /// Ovulação
          internal static let ovulation = L10n.tr("Constants", "constants.content.label.home.ovulation", fallback: "Ovulação")
          /// Menstruação registrada
          internal static let recordedMenstruation = L10n.tr("Constants", "constants.content.label.home.recordedMenstruation", fallback: "Menstruação registrada")
          /// 1. Vá em ajustes
          internal static let settingsSubtitle = L10n.tr("Constants", "constants.content.label.home.settings_subtitle", fallback: "1. Vá em ajustes")
          /// Você está na
          internal static let youAreIn = L10n.tr("Constants", "constants.content.label.home.youAreIn", fallback: "Você está na")
          internal enum Behavior {
            /// Por trás dos panos
            internal static let behind = L10n.tr("Constants", "constants.content.label.home.behavior.behind", fallback: "Por trás dos panos")
            /// Melhor evitar, hein!
            internal static let better = L10n.tr("Constants", "constants.content.label.home.behavior.better", fallback: "Melhor evitar, hein!")
            /// Quer uma ajuda?
            internal static let help = L10n.tr("Constants", "constants.content.label.home.behavior.help", fallback: "Quer uma ajuda?")
            /// Como você está?
            internal static let how = L10n.tr("Constants", "constants.content.label.home.behavior.how", fallback: "Como você está?")
            /// O que é?
            internal static let what = L10n.tr("Constants", "constants.content.label.home.behavior.what", fallback: "O que é?")
          }
          internal enum Card {
            internal enum Folicular {
              /// Mantenha bons hábitos alimentares e de exercício.
              internal static let five = L10n.tr("Constants", "constants.content.label.home.card.folicular.five", fallback: "Mantenha bons hábitos alimentares e de exercício.")
              /// Nada de passar sede nessa fase. Hidrate-se em abundância!
              internal static let four = L10n.tr("Constants", "constants.content.label.home.card.folicular.four", fallback: "Nada de passar sede nessa fase. Hidrate-se em abundância!")
              /// Energia e bem-estar em alta! A fase folicular chegou!
              internal static let one = L10n.tr("Constants", "constants.content.label.home.card.folicular.one", fallback: "Energia e bem-estar em alta! A fase folicular chegou!")
              /// Você pode sentir uma melhora no seu bem-estar.
              internal static let three = L10n.tr("Constants", "constants.content.label.home.card.folicular.three", fallback: "Você pode sentir uma melhora no seu bem-estar.")
              /// Energia pode estar em alta! Aproveita para resolver as broncas da vida!
              internal static let two = L10n.tr("Constants", "constants.content.label.home.card.folicular.two", fallback: "Energia pode estar em alta! Aproveita para resolver as broncas da vida!")
            }
            internal enum Luteal {
              /// Aproveita esse momento para fazer atividades tranquilas.
              internal static let five = L10n.tr("Constants", "constants.content.label.home.card.luteal.five", fallback: "Aproveita esse momento para fazer atividades tranquilas.")
              /// Avalie com cuidado as decisões importantes ou grandes mudanças realizadas nessa fase.
              internal static let four = L10n.tr("Constants", "constants.content.label.home.card.luteal.four", fallback: "Avalie com cuidado as decisões importantes ou grandes mudanças realizadas nessa fase.")
              /// O óvulo agora é um corpo lúteo. Hormônios em alta!
              internal static let one = L10n.tr("Constants", "constants.content.label.home.card.luteal.one", fallback: "O óvulo agora é um corpo lúteo. Hormônios em alta!")
              /// O humor pode variar e tudo bem, okay?
              internal static let three = L10n.tr("Constants", "constants.content.label.home.card.luteal.three", fallback: "O humor pode variar e tudo bem, okay?")
              /// Só good vibes! O dia pode ser de paz e tranquilidade.
              internal static let two = L10n.tr("Constants", "constants.content.label.home.card.luteal.two", fallback: "Só good vibes! O dia pode ser de paz e tranquilidade.")
            }
            internal enum Menstruation {
              /// Exercício leves podem ajudar com as cólicas e no humor. Então se joga!
              internal static let five = L10n.tr("Constants", "constants.content.label.home.card.menstruation.five", fallback: "Exercício leves podem ajudar com as cólicas e no humor. Então se joga!")
              /// Atividades sociais intensas podem ficar para depois, hein!
              internal static let four = L10n.tr("Constants", "constants.content.label.home.card.menstruation.four", fallback: "Atividades sociais intensas podem ficar para depois, hein!")
              /// Você está literalmente sangrando!
              internal static let one = L10n.tr("Constants", "constants.content.label.home.card.menstruation.one", fallback: "Você está literalmente sangrando!")
              /// Ter cólicas e mudanças de paladar também faz parte. Forças!
              internal static let three = L10n.tr("Constants", "constants.content.label.home.card.menstruation.three", fallback: "Ter cólicas e mudanças de paladar também faz parte. Forças!")
              /// Se liga, você pode estar mais sensível e irritável.
              internal static let two = L10n.tr("Constants", "constants.content.label.home.card.menstruation.two", fallback: "Se liga, você pode estar mais sensível e irritável.")
            }
            internal enum Ovulation {
              /// Energia também pode estar em alta, abuse dos exercícios de força.
              internal static let five = L10n.tr("Constants", "constants.content.label.home.card.ovulation.five", fallback: "Energia também pode estar em alta, abuse dos exercícios de força.")
              /// É normal sentir variações no apetite, vai com moderação e seja feliz!
              internal static let four = L10n.tr("Constants", "constants.content.label.home.card.ovulation.four", fallback: "É normal sentir variações no apetite, vai com moderação e seja feliz!")
              /// Eita, seu óvulo pode ser liberado em qualquer um desses dias.
              internal static let one = L10n.tr("Constants", "constants.content.label.home.card.ovulation.one", fallback: "Eita, seu óvulo pode ser liberado em qualquer um desses dias.")
              /// Adiar as atividades estressantes é uma boa!
              internal static let three = L10n.tr("Constants", "constants.content.label.home.card.ovulation.three", fallback: "Adiar as atividades estressantes é uma boa!")
              /// Você pode se achar mais atraente nessa fase.
              internal static let two = L10n.tr("Constants", "constants.content.label.home.card.ovulation.two", fallback: "Você pode se achar mais atraente nessa fase.")
            }
            internal enum Pms {
              /// A ansiedade pode estar em alta, tenha um pouquinho de paciência.
              internal static let five = L10n.tr("Constants", "constants.content.label.home.card.pms.five", fallback: "A ansiedade pode estar em alta, tenha um pouquinho de paciência.")
              /// Seu corpo pode estar retendo mais líquido, evitar alimentos ricos em sal pode ajudar.
              internal static let four = L10n.tr("Constants", "constants.content.label.home.card.pms.four", fallback: "Seu corpo pode estar retendo mais líquido, evitar alimentos ricos em sal pode ajudar.")
              /// Chegou ela... a TPM! Uma verdadeira combinação de sentimentos.
              internal static let one = L10n.tr("Constants", "constants.content.label.home.card.pms.one", fallback: "Chegou ela... a TPM! Uma verdadeira combinação de sentimentos.")
              /// Cólicas e dores no corpo podem ser comuns.
              internal static let three = L10n.tr("Constants", "constants.content.label.home.card.pms.three", fallback: "Cólicas e dores no corpo podem ser comuns.")
              /// Ixe, você pode ir de 8 à 80 com facilidade!
              internal static let two = L10n.tr("Constants", "constants.content.label.home.card.pms.two", fallback: "Ixe, você pode ir de 8 à 80 com facilidade!")
            }
          }
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
              /// Ponzo S, Wickham A, Bamford R, Radovic T, Zhaunova L, Peven K, Klepchukova A, Payne JL. Menstrual cycle-associated symptoms and workplace productivity in US employees: A cross-sectional survey of users of the Flo mobile phone app. Digit Health. 2022 Dec 15;8:20552076221145852. PMID: 36544535; PMCID: PMC9761221.
              internal static let fifth = L10n.tr("Constants", "constants.content.label.home.text.references.fifth", fallback: "Ponzo S, Wickham A, Bamford R, Radovic T, Zhaunova L, Peven K, Klepchukova A, Payne JL. Menstrual cycle-associated symptoms and workplace productivity in US employees: A cross-sectional survey of users of the Flo mobile phone app. Digit Health. 2022 Dec 15;8:20552076221145852. PMID: 36544535; PMCID: PMC9761221.")
              /// Mesen TB, Young SL. Progesterone and the luteal phase: a requisite to reproduction. Obstet Gynecol Clin North Am. 2015 Mar;42(1):135-51. PMID: 25681845; PMCID: PMC4436586.
              internal static let first = L10n.tr("Constants", "constants.content.label.home.text.references.first", fallback: "Mesen TB, Young SL. Progesterone and the luteal phase: a requisite to reproduction. Obstet Gynecol Clin North Am. 2015 Mar;42(1):135-51. PMID: 25681845; PMCID: PMC4436586.")
              /// Souza EG, Ramos MG, Hara C, Stumpf BP, Rocha FL. Neuropsychological performance and menstrual cycle: a literature review. Trends Psychiatry Psychother. 2012;34(1):5-12.
              internal static let fourth = L10n.tr("Constants", "constants.content.label.home.text.references.fourth", fallback: "Souza EG, Ramos MG, Hara C, Stumpf BP, Rocha FL. Neuropsychological performance and menstrual cycle: a literature review. Trends Psychiatry Psychother. 2012;34(1):5-12.")
              /// Jukic AM, Weinberg CR, Baird DD, Wilcox AJ. Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular. J Womens Health (Larchmt). 2007 Nov;16(9):1340-7. PMID: 18001191; PMCID: PMC2834565.
              internal static let second = L10n.tr("Constants", "constants.content.label.home.text.references.second", fallback: "Jukic AM, Weinberg CR, Baird DD, Wilcox AJ. Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular. J Womens Health (Larchmt). 2007 Nov;16(9):1340-7. PMID: 18001191; PMCID: PMC2834565.")
              /// Jukic AM, Weinberg CR, Baird DD, Wilcox AJ. Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular. J Womens Health (Larchmt). 2007 Nov;16(9):1340-7. PMID: 18001191; PMCID: PMC2834565.
              internal static let third = L10n.tr("Constants", "constants.content.label.home.text.references.third", fallback: "Jukic AM, Weinberg CR, Baird DD, Wilcox AJ. Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular. J Womens Health (Larchmt). 2007 Nov;16(9):1340-7. PMID: 18001191; PMCID: PMC2834565.")
              internal enum Fifth {
                /// Menstrual cycle-associated symptoms and workplace productivity in US employees: A cross-sectional survey of users of the Flo mobile phone app.
                internal static let title = L10n.tr("Constants", "constants.content.label.home.text.references.fifth.title", fallback: "Menstrual cycle-associated symptoms and workplace productivity in US employees: A cross-sectional survey of users of the Flo mobile phone app.")
              }
              internal enum First {
                /// Progesterone and the luteal phase: a requisite to reproduction.
                internal static let title = L10n.tr("Constants", "constants.content.label.home.text.references.first.title", fallback: "Progesterone and the luteal phase: a requisite to reproduction.")
              }
              internal enum Fourth {
                /// Neuropsychological performance and menstrual cycle: a literature review.
                internal static let title = L10n.tr("Constants", "constants.content.label.home.text.references.fourth.title", fallback: "Neuropsychological performance and menstrual cycle: a literature review.")
              }
              internal enum Second {
                /// Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular.
                internal static let title = L10n.tr("Constants", "constants.content.label.home.text.references.second.title", fallback: "Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular.")
              }
              internal enum Third {
                /// Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular.
                internal static let title = L10n.tr("Constants", "constants.content.label.home.text.references.third.title", fallback: "Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular.")
              }
            }
          }
        }
        internal enum NewActivity {
          /// Mês
          internal static let month = L10n.tr("Constants", "constants.content.label.new_activity.month", fallback: "Mês")
          /// Atividades
          internal static let title = L10n.tr("Constants", "constants.content.label.new_activity.title", fallback: "Atividades")
          /// Semana
          internal static let week = L10n.tr("Constants", "constants.content.label.new_activity.week", fallback: "Semana")
          internal enum AddNewActivity {
            /// Atividade
            internal static let activityTitle = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.activity_title", fallback: "Atividade")
            /// Data
            internal static let dateTitle = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.date_title", fallback: "Data")
            /// Prazo
            internal static let deadlineTitle = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.deadline_title", fallback: "Prazo")
            /// Métricas
            internal static let metricsTitle = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.metrics_title", fallback: "Métricas")
            /// Título
            internal static let placeholderActivityTitle = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.placeholder_activity_title", fallback: "Título")
            /// Registre a data limite para realizar a atividade
            internal static let subtitleDeadline = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.subtitle_deadline", fallback: "Registre a data limite para realizar a atividade")
            /// Registre de 1 a 5, sendo 1 = pouco e 5 = muito
            internal static let subtitleMetrics = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.subtitle_metrics", fallback: "Registre de 1 a 5, sendo 1 = pouco e 5 = muito")
            internal enum MetricsComponent {
              /// 🏃🏽 Esforço Físico
              internal static let fisicsTitle = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.metrics_component.fisics_title", fallback: "🏃🏽 Esforço Físico")
              /// 💬 Sociabilidade
              internal static let socialTitle = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.metrics_component.social_title", fallback: "💬 Sociabilidade")
              /// ⚡️ Estresse
              internal static let stressTitle = L10n.tr("Constants", "constants.content.label.new_activity.add_new_activity.metrics_component.stress_title", fallback: "⚡️ Estresse")
            }
          }
          internal enum CreateEvent {
            /// DATA
            internal static let date = L10n.tr("Constants", "constants.content.label.new_activity.create_event.date", fallback: "DATA")
            /// Termina
            internal static let finalDateTitle = L10n.tr("Constants", "constants.content.label.new_activity.create_event.final_date_title", fallback: "Termina")
            /// Começa
            internal static let initialDateTitle = L10n.tr("Constants", "constants.content.label.new_activity.create_event.initial_date_title", fallback: "Começa")
            /// NOME
            internal static let name = L10n.tr("Constants", "constants.content.label.new_activity.create_event.name", fallback: "NOME")
            /// Nome da Atividade
            internal static let placeholderEventTitle = L10n.tr("Constants", "constants.content.label.new_activity.create_event.placeholder_event_title", fallback: "Nome da Atividade")
          }
          internal enum Nav {
            /// Nova atividade
            internal static let title = L10n.tr("Constants", "constants.content.label.new_activity.nav.title", fallback: "Nova atividade")
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
          /// TPM
          internal static let pms = L10n.tr("Constants", "constants.content.label.phase.pms", fallback: "TPM")
        }
        internal enum Sheet {
          /// Disponível aqui!
          internal static let link = L10n.tr("Constants", "constants.content.label.sheet.link", fallback: "Disponível aqui!")
          /// Referências
          internal static let title = L10n.tr("Constants", "constants.content.label.sheet.title", fallback: "Referências")
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
      internal enum Notification {
        internal enum Dataset {
          internal enum ExpectedMenstruation {
            /// Organize suas tarefas para quando sua energia voltar ao máximo. Luna te ajuda com isso! 👉
            internal static let body = L10n.tr("Constants", "constants.content.notification.dataset.expected_menstruation.body", fallback: "Organize suas tarefas para quando sua energia voltar ao máximo. Luna te ajuda com isso! 👉")
            /// Segundo as previsões de Luna, você está na fase menstrual. Lembre-se de registrar!
            internal static let body1 = L10n.tr("Constants", "constants.content.notification.dataset.expected_menstruation.body1", fallback: "Segundo as previsões de Luna, você está na fase menstrual. Lembre-se de registrar!")
            /// Tire um tempo para relaxar e pratique coisas que ajude a aliviar o estresse. Saiba mais
            internal static let body2 = L10n.tr("Constants", "constants.content.notification.dataset.expected_menstruation.body2", fallback: "Tire um tempo para relaxar e pratique coisas que ajude a aliviar o estresse. Saiba mais")
            /// Aqueles dias 🩸
            internal static let title = L10n.tr("Constants", "constants.content.notification.dataset.expected_menstruation.title", fallback: "Aqueles dias 🩸")
            /// Como você está? ❤️
            internal static let title1 = L10n.tr("Constants", "constants.content.notification.dataset.expected_menstruation.title1", fallback: "Como você está? ❤️")
            /// Previsão: hora de se cuidar! ⏰
            internal static let title2 = L10n.tr("Constants", "constants.content.notification.dataset.expected_menstruation.title2", fallback: "Previsão: hora de se cuidar! ⏰")
          }
          internal enum Fertile {
            /// Aproveite o pico de determinação dessa fase para trabalhar nas suas metas!
            internal static let body = L10n.tr("Constants", "constants.content.notification.dataset.fertile.body", fallback: "Aproveite o pico de determinação dessa fase para trabalhar nas suas metas!")
            /// Aproveite a energia em alta para treinos mais intensos! Veja mais sobre a fase atual!
            internal static let body1 = L10n.tr("Constants", "constants.content.notification.dataset.fertile.body1", fallback: "Aproveite a energia em alta para treinos mais intensos! Veja mais sobre a fase atual!")
            /// Hoje tá sendo uma mistura de sentimentos, né? Entenda mais sobre essa fase 👉
            internal static let body2 = L10n.tr("Constants", "constants.content.notification.dataset.fertile.body2", fallback: "Hoje tá sendo uma mistura de sentimentos, né? Entenda mais sobre essa fase 👉")
            /// Dose extra! 🔋
            internal static let title = L10n.tr("Constants", "constants.content.notification.dataset.fertile.title", fallback: "Dose extra! 🔋")
            /// Eu ouvi intensidade? 💪
            internal static let title1 = L10n.tr("Constants", "constants.content.notification.dataset.fertile.title1", fallback: "Eu ouvi intensidade? 💪")
            /// Carro da água passando…💧
            internal static let title2 = L10n.tr("Constants", "constants.content.notification.dataset.fertile.title2", fallback: "Carro da água passando…💧")
          }
          internal enum Folicular {
            /// Você pode sentir mais energia hoje, abuse dos treinos de força. Saiba mais
            internal static let body = L10n.tr("Constants", "constants.content.notification.dataset.folicular.body", fallback: "Você pode sentir mais energia hoje, abuse dos treinos de força. Saiba mais")
            /// Hora de beber água, meu bem. Vamos lá, hidrate-se e seu corpo agradece!
            internal static let body1 = L10n.tr("Constants", "constants.content.notification.dataset.folicular.body1", fallback: "Hora de beber água, meu bem. Vamos lá, hidrate-se e seu corpo agradece!")
            /// Você pode ter mais disposição hoje! Que tal realizar as pendências da semana?
            internal static let body2 = L10n.tr("Constants", "constants.content.notification.dataset.folicular.body2", fallback: "Você pode ter mais disposição hoje! Que tal realizar as pendências da semana?")
            /// Se arruma e vamos! 🏃‍♀️
            internal static let title = L10n.tr("Constants", "constants.content.notification.dataset.folicular.title", fallback: "Se arruma e vamos! 🏃‍♀️")
            /// GRAVE: chegou a hora 🚨
            internal static let title1 = L10n.tr("Constants", "constants.content.notification.dataset.folicular.title1", fallback: "GRAVE: chegou a hora 🚨")
            /// Energia em alta!
            internal static let title2 = L10n.tr("Constants", "constants.content.notification.dataset.folicular.title2", fallback: "Energia em alta!")
          }
          internal enum Luteal {
            /// Os níveis de estrogênio e progesterona atingem o pico nessa fase. Saiba como isso pode interferir na sua rotina 👉
            internal static let body = L10n.tr("Constants", "constants.content.notification.dataset.luteal.body", fallback: "Os níveis de estrogênio e progesterona atingem o pico nessa fase. Saiba como isso pode interferir na sua rotina 👉")
            /// É um bom momento para fazer atividades tranquilas. Saiba mais sobre essa fase!
            internal static let body1 = L10n.tr("Constants", "constants.content.notification.dataset.luteal.body1", fallback: "É um bom momento para fazer atividades tranquilas. Saiba mais sobre essa fase!")
            /// Seu humor pode variar hoje, é bom evitar grandes mudanças, hein? Saiba mais 👉
            internal static let body2 = L10n.tr("Constants", "constants.content.notification.dataset.luteal.body2", fallback: "Seu humor pode variar hoje, é bom evitar grandes mudanças, hein? Saiba mais 👉")
            /// Hormônios em alta!
            internal static let title = L10n.tr("Constants", "constants.content.notification.dataset.luteal.title", fallback: "Hormônios em alta!")
            /// Mó paz ✌️
            internal static let title1 = L10n.tr("Constants", "constants.content.notification.dataset.luteal.title1", fallback: "Mó paz ✌️")
            /// 8 ou 80?
            internal static let title2 = L10n.tr("Constants", "constants.content.notification.dataset.luteal.title2", fallback: "8 ou 80?")
          }
          internal enum Pms {
            /// Seu corpo pode estar retendo mais líquido. Evitar excesso de alimentos ricos em sal pode ajudar.
            internal static let body = L10n.tr("Constants", "constants.content.notification.dataset.pms.body", fallback: "Seu corpo pode estar retendo mais líquido. Evitar excesso de alimentos ricos em sal pode ajudar.")
            /// Você pode sentir cólica e outras dores no corpo nessa fase. Veja o que mais pode acontecer 👉
            internal static let body1 = L10n.tr("Constants", "constants.content.notification.dataset.pms.body1", fallback: "Você pode sentir cólica e outras dores no corpo nessa fase. Veja o que mais pode acontecer 👉")
            /// Hoje tá sendo uma mistura de sentimentos, né? Entenda mais sobre essa fase 👉
            internal static let body2 = L10n.tr("Constants", "constants.content.notification.dataset.pms.body2", fallback: "Hoje tá sendo uma mistura de sentimentos, né? Entenda mais sobre essa fase 👉")
            /// Dica do dia ✨
            internal static let title = L10n.tr("Constants", "constants.content.notification.dataset.pms.title", fallback: "Dica do dia ✨")
            /// Forças!
            internal static let title1 = L10n.tr("Constants", "constants.content.notification.dataset.pms.title1", fallback: "Forças!")
            /// É literalmente uma fase!
            internal static let title2 = L10n.tr("Constants", "constants.content.notification.dataset.pms.title2", fallback: "É literalmente uma fase!")
          }
        }
        internal enum FirstPhaseDay {
          internal enum ExpectedMenstruation {
            /// Você entrará na fase menstrual nos próximos dias. Registre em Luna!
            internal static let body = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.expected_menstruation.body", fallback: "Você entrará na fase menstrual nos próximos dias. Registre em Luna!")
            /// Ding Dong, cheguei 🩸
            internal static let title = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.expected_menstruation.title", fallback: "Ding Dong, cheguei 🩸")
          }
          internal enum Fertile {
            /// Fase ovulatória à vista! Saiba o que pode acontecer nessa fase 👉
            internal static let body = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.fertile.body", fallback: "Fase ovulatória à vista! Saiba o que pode acontecer nessa fase 👉")
            /// Cheguei, mores  💅
            internal static let title = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.fertile.title", fallback: "Cheguei, mores  💅")
          }
          internal enum Folicular {
            /// Ela mesmo, a Fase Folicular! Energia pode estar em alta hoje, veja como aproveitar!
            internal static let body = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.folicular.body", fallback: "Ela mesmo, a Fase Folicular! Energia pode estar em alta hoje, veja como aproveitar!")
            /// Chegou a famosa ⚡️
            internal static let title = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.folicular.title", fallback: "Chegou a famosa ⚡️")
          }
          internal enum Luteal {
            /// Fase Lútea on! Hormônios em alta. Saiba o que pode acontecer nessa fase 👉
            internal static let body = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.luteal.body", fallback: "Fase Lútea on! Hormônios em alta. Saiba o que pode acontecer nessa fase 👉")
            /// Piscou e eu cheguei
            internal static let title = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.luteal.title", fallback: "Piscou e eu cheguei")
          }
          internal enum Pms {
            /// Sintomas da TPM podem aparecer nos próximos dias. Saiba mais sobre essa fase 👉
            internal static let body = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.pms.body", fallback: "Sintomas da TPM podem aparecer nos próximos dias. Saiba mais sobre essa fase 👉")
            /// Sem gracinha hoje
            internal static let title = L10n.tr("Constants", "constants.content.notification.firstPhaseDay.pms.title", fallback: "Sem gracinha hoje")
          }
        }
      }
      internal enum Tab {
        internal enum Bar {
          /// Atividades
          internal static let activities = L10n.tr("Constants", "constants.content.tab.bar.activities", fallback: "Atividades")
          /// Constants.strings
          ///   luna
          /// 
          ///   Created by alexdamascena on 18/07/23.
          internal static let cycle = L10n.tr("Constants", "constants.content.tab.bar.cycle", fallback: "Ciclo")
          /// Fontes
          internal static let fontes = L10n.tr("Constants", "constants.content.tab.bar.fontes", fallback: "Fontes")
        }
      }
    }
    internal enum Preposition {
      /// e
      internal static let and = L10n.tr("Constants", "constants.preposition.and", fallback: "e")
      /// de
      internal static let of = L10n.tr("Constants", "constants.preposition.of", fallback: "de")
    }
    internal enum User {
      internal enum Key {
        /// activities
        internal static let forActivitiesWasSeen = L10n.tr("Constants", "constants.user.key.for_activities_was_seen", fallback: "activities")
        /// first_new_activity
        internal static let forOnboardingActivityWasSeen = L10n.tr("Constants", "constants.user.key.for_onboarding_activity_was_seen", fallback: "first_new_activity")
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

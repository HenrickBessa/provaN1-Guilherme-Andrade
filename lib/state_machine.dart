import 'state.dart';

class StateMachine {
  int _state = 0;

  final List<State> _states = [
    State(
        text:
            "Paciente com glicemia capilar > 250mg/dL. \n\nHá sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?",
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text: 'Há suspeita de doença intercorrente (excluindo emergências)?',
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text: 'Cetonúria disponível? \n(Se indisponível, considerar negativa)',
        choice1: 'Positiva',
        choice2: 'Negativa'),
    State(
        text:
            'Aplicar insulina regular e reavaliar glicemia capilar em 2 horas.\n\nGlicemia abaixo de 250mg/dL?',
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text:
            'Provável descompensação crônica. Ajustar tratamento (considerar insulina). Solicitar controle de glicemia capilar. Orientar sinais de alarme e reavaliação breve',
        choice1: 'Reiniciar'),
    State(
        text:
            'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9% enquanto aguarda o transporte',
        choice1: 'Reiniciar'),
    State(
        text:
            'Tratar complicações agudas. Aumentar transitoriamente dose total de insulina até resolução do quadro.',
        choice1: 'Reiniciar'),
  ];

  final Map<int, Map<bool, int>> _nextStateMap = {
    0: {false: 1, true: 5},
    1: {false: 4, true: 2},
    2: {false: 3, true: 5},
    3: {false: 5, true: 6},
  };

  void reset() {
    _state = 0;
  }

  void nextState(bool userChoice) {
    switch (_state) {
      case 0:
        _state =
            userChoice ? _nextStateMap[0]![true]! : _nextStateMap[0]![false]!;
        break;
      case 1:
        _state =
            userChoice ? _nextStateMap[1]![true]! : _nextStateMap[1]![false]!;
        break;
      case 2:
        _state =
            userChoice ? _nextStateMap[2]![true]! : _nextStateMap[2]![false]!;
        break;
      case 3:
        _state =
            userChoice ? _nextStateMap[3]![true]! : _nextStateMap[3]![false]!;
        break;
      default:
        if (_state < _states.length - 1) {
          _state += 1;
        }
        break;
    }
  }

  String getStateText() {
    return _states[_state].text;
  }

  String getChoice1() {
    return _states[_state].choice1;
  }

  String? getChoice2() {
    return _states[_state].choice2;
  }

  void checkChoice(bool userChoice) {
    if (_states[_state].choice1 == 'Reiniciar') {
      reset();
    } else {
      nextState(userChoice);
    }
  }
}

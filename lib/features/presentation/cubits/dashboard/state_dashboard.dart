abstract class StateDB {
  StateDB();
}

final class StateDashBoardInitial extends StateDB {}

final class StateDBBottomMenuTapped extends StateDB {
  final int menuIndex;
  StateDBBottomMenuTapped({required this.menuIndex});
}

final class StateDBSelectionIconUpdation extends StateDB {
  final int selected;
  StateDBSelectionIconUpdation({required this.selected});
}

part of "onbording_cubit.dart";

sealed class OnbordingState {
  const OnbordingState({this.i = 0});
  final int i; // page index: 0, 1, 2
}

class InitOnbordignState extends OnbordingState {
  const InitOnbordignState({super.i});
}

class FinalOnbordignState extends OnbordingState {
  const FinalOnbordignState({super.i});
} //last screen

class EndOnbordignState extends OnbordingState {
  const EndOnbordignState({super.i});
} //skip

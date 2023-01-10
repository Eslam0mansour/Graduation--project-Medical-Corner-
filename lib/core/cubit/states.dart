 abstract class AppState{}
 class IntiAppState extends AppState{}

 class GetNewsLoadState extends AppState{}
class GetNewsDoneState extends AppState{}
class GetNewsErrorState extends AppState{
   final String error;
   GetNewsErrorState(this.error);
 }
 class LoadingState extends AppState{}
 class FinalResultState extends AppState{}
 class ModelLoadedSTate extends AppState{}
 class ClassifyImageState extends AppState{}
 class PickedImageState extends AppState{}
 class ClearState extends AppState{}

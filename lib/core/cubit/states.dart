 abstract class AppState{}
 class IntiAppState extends AppState{}

 class NewsLoadState extends AppState{}
class NewsDoneState extends AppState{}
class NewsErrorState extends AppState{
   final String error;
   NewsErrorState(this.error);
 }
 class LoadingState extends AppState{}
 class FinalResultState extends AppState{}
 class ModelLoadedSTate extends AppState{}
 class ClassifyImageState extends AppState{}
 class PickedImageState extends AppState{}
 class ClearState extends AppState{}

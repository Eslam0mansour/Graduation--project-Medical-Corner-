 abstract class AppState{}
 class IntiAppState extends AppState{}
 class ChangBottomBarIndix extends AppState{}

class GetSrLodinState extends AppState{}
class GetMore extends AppState{}
class GetSrSuccSTate extends AppState{}
class GetSrErorrState extends AppState{
   final String error;
  GetSrErorrState(this.error);
 }
 class GetHeLodinState extends AppState{}
class GetHeSuccSTate extends AppState{}
class GetHeErorrState extends AppState{
   final String error;
  GetHeErorrState(this.error);
 }
 class LoadingState extends AppState{}
 class FinalResultState extends AppState{}
 class ModelLoadedSTate extends AppState{}
 class ClassifyState extends AppState{}
 class pickedState extends AppState{}

 class Mood extends AppState{}
 class ChangLange extends AppState{}
 class ChangColor extends AppState{}

  class PickImageState extends AppState{}
  class ClassifyImageState extends AppState{}
  class GetImageState extends AppState{}
  class GetClassifyImageState extends AppState{}
  class GetLoadingState extends AppState{}
  class GetOutputState extends AppState{}

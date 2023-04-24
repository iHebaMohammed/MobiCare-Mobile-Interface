abstract class AdminLayoutStatus{}

class InitiateAdminLayoutState extends AdminLayoutStatus{}

class GetNewAccessTokenLoadingState extends AdminLayoutStatus{}

class GetNewAccessTokenSuccessfullyState extends AdminLayoutStatus{}

class GetNewAccessTokenErrorState extends AdminLayoutStatus{
  final String error;
  GetNewAccessTokenErrorState({
    required this.error
});
}

class AdminGetAllDoctorsLoadingState extends AdminLayoutStatus{}

class AdminGetAllDoctorsSuccessfullyState extends AdminLayoutStatus{}

class AdminGetAllDoctorsErrorState extends AdminLayoutStatus{}

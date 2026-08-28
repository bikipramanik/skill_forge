import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/features/home/domain/usecases/get_skills_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSkillsUseCase getSkillsUseCase;

  HomeBloc({required this.getSkillsUseCase}) : super(const HomeInitial()) {
    on<LoadSkillsEvent>(_onLoadSkills);
    on<RefreshSkillsEvent>(_onRefreshSkills);
  }

  Future<void> _onLoadSkills(LoadSkillsEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final skills = await getSkillsUseCase();
      emit(HomeLoaded(skills: skills));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> _onRefreshSkills(RefreshSkillsEvent event, Emitter<HomeState> emit) async {
    try {
      final skills = await getSkillsUseCase();
      emit(HomeLoaded(skills: skills));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}

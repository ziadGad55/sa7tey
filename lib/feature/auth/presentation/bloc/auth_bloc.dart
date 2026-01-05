import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7ty/core/constant/enum.dart';
import 'package:sa7ty/core/services/cashing.dart';
import 'package:sa7ty/feature/auth/presentation/bloc/auth_event.dart';
import 'package:sa7ty/feature/auth/presentation/bloc/auth_state.dart';

class authBloc extends Bloc<AuthEvent, AuthState> {
  authBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is loginEvent) {
        await Login(emit, event);
      } else if (event is registerEvent) {
        await register(emit, event);
      }
    });
  }

  Future<void> register(Emitter<AuthState> emit, registerEvent event) async {
    emit(AuthLoading());

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.emailAddress,
        password: event.password,
      );
      User? user = credential.user;
      user?.updateDisplayName(event.name);
      appcashing.cashdata(key: appcashing.token, value: user?.uid);

      event.selectedtype == usertype.doctor
          ? FirebaseFirestore.instance.collection('doctors').doc(user?.uid).set({
              'name': event.name,
              'image': '',
              'age': '',
              'email': event.emailAddress,
              'phone': '',
              'bio': '',
              'city': '',
              'uid': user?.uid,
            })
          : FirebaseFirestore.instance.collection('patients').doc(user?.uid).set({
              'name': event.name,
          'image': '',
          'specialization': '',
          'rating': 3,
          'email': event.emailAddress,
          'phone1': '',
          'phone2': '',
          'bio': '',
          'openHour': '',
          'closeHour': '',
          'address': '',
          'uid': user?.uid,
            });

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailure('كلمة المرور المقدمة ضعيفة.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure('البريد الإلكتروني مستخدم بالفعل من قبل .'));
      }
    } catch (e) {
      emit(AuthFailure('حدث خطأ ما. يرجى المحاولة مرة أخرى.'));
    }
  }





  Future<void> Login(Emitter<AuthState> emit, loginEvent event) async {
    emit(AuthLoading());

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.emailAddress, password: event.password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure('لم يتم العثور على مستخدم لهذا البريد الإلكتروني.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure(' كلمة مرور خاطئة .'));
      }
    } catch (e) {
      emit(AuthFailure('حدث خطأ ما. يرجى المحاولة مرة أخرى.'));
    }
  }
}

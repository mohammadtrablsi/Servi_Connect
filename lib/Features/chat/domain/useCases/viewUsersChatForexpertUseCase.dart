import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/chat/data/repos/chatRepoImp.dart';

import 'package:servi_connect/Features/chat/domain/entites/viewUsersChatForexpertEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';

class ViewUsersChatForexpertUseCase {
  ViewUsersChatForexpertUseCase({required this.chatRepo});
  ChatRepoImpl chatRepo;

  Future<Either<Failure, List<ViewUsersChatForexpertEntity>>> call(
      Map<String, dynamic> headers, Map<String, dynamic> data) async {
    return await chatRepo.viewUsersChatForexpert(headers: headers, data: data);
  }
}

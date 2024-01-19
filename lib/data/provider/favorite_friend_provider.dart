// class FavoriteUpdateModel {
//   FavoriteFriendDTO favoriteFriendDTO;
//   FriendsDTO? friendsDTO;
//
//   FavoriteUpdateModel(this.favoriteFriendDTO);
// // FavoriteUpdateModel(this.friendsDTO);
// //  FavoriteUpdateModel(this.favoriteFriendDTO, this.friendsDTO);
// }

// class FavoriteUpdateModel extends FavoriteFriendDTO {
//   FavoriteUpdateModel(FavoriteFriendDTO favoriteFriendDTO)
//       : super(userId: favoriteFriendDTO.userId, isFavorite: favoriteFriendDTO.isFavorite);
// }
//
//
// class FavoriteUpdateViewModel extends StateNotifier<FavoriteFriendDTO> {
//   Ref ref;
//
//   FavoriteUpdateViewModel(FavoriteFriendDTO _state, this.ref) : super(_state);
//
//   Future<void> notifyInit(FavoriteFriendDTO favoriteFriendDTO) async {
//     ref.read(paramProvider);
//     SessionUser session = ref.read(sessionProvider);
//     ResponseDTO responseDTO = await FriendRepository()
//         .fetchFavoriteStatus(favoriteFriendDTO, session.user!.jwt!);
//
//     print("Favorite Status Updated: ${favoriteFriendDTO.isFavorite}");
//     state = FavoriteUpdateModel(favoriteFriendDTO) as FavoriteFriendDTO;
//   }
//
//   Future<void> updateFavoriteStatus(
//       FriendsDTO friendsDTO,String jwt) async {
//     ParamStore paramStore = ref.read(paramProvider);
//     SessionUser session = ref.read(sessionProvider);
//     print("진입 체크");
//     // 친구의 현재 즐겨찾기 상태를 확인하고 반전
//     print("반전하기전");
//     print(favoriteFriendDTO.isFavorite);
//     bool newStatus = !(favoriteFriendDTO.isFavorite ?? false);
//     print("반전!");
//     print(newStatus);
//     print(jwt);
//
//     // 서버에 변경된 즐겨찾기 상태를 업데이트 요청
//     ResponseDTO updateResponse = await FriendRepository().fetchFavoriteStatus(
//       FavoriteFriendDTO(
//           userId: favoriteFriendDTO.userId, isFavorite: newStatus),
//       jwt,
//     );
//
//     print("서버 응답: $updateResponse");
//     print("서버 응답: ${updateResponse.toString()}");
//
//     print("입력된 값 뭐야?");
//     print(favoriteFriendDTO.isFavorite);
//
//     // 서버 응답 확인 후 로직 처리
//     if (updateResponse.success == true) {
//       // 성공적으로 업데이트된 경우, 파라미터로 받은 객체에 변경된 값을 할당
//       favoriteFriendDTO.isFavorite = newStatus;
//       // 디버깅용 메시지
//       print("Favorite Status Updated: ${favoriteFriendDTO.isFavorite}");
//       state = FavoriteUpdateModel(favoriteFriendDTO) as FavoriteFriendDTO;
//       // ref.read(paramProvider).addChatRoomDocId(chatDoc.id);
//       FriendsDTO friendsDTO = FriendsDTO(
//         isFavorite: favoriteFriendDTO.isFavorite
//       );
//       ref.read(paramProvider).addFavoriteStatus(friendsDTO);
//     } else {
//       // 실패 시 처리
//     }
//   }
// }
//
// final favoriteUpdateProvider =
//     StateNotifierProvider<FavoriteUpdateViewModel, FavoriteFriendDTO>((ref) {
//   FavoriteFriendDTO favoriteFriendDTO = new FavoriteFriendDTO();
//   print("프로바~~~~~~이더");
//   print(favoriteFriendDTO.isFavorite);
//   return FavoriteUpdateViewModel(favoriteFriendDTO, ref)
//     ..notifyInit(favoriteFriendDTO);
// });
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_request_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_response_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/friend_repository.dart';

class FavoriteUpdateModel {
  FavoriteFriendResponseDTO favoriteFriendResponseDTO;

  FavoriteUpdateModel(this.favoriteFriendResponseDTO);
}

class FavoriteUpdateViewModel extends StateNotifier<FavoriteUpdateModel?> {
  Ref ref;

  FavoriteUpdateViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    int? sessionId = ref.read(sessionProvider).user?.id;
    String sessionJwt = ref.read(sessionProvider).user!.jwt!;
    FavoriteFriendRequestDTO favoriteFriendrequestDTO =
        new FavoriteFriendRequestDTO();
    FavoriteFriendResponseDTO favoriteFriendResponseDTO =
        new FavoriteFriendResponseDTO();
    ResponseDTO responseDTO = await FriendRepository()
        .fetchFavoriteStatus(favoriteFriendrequestDTO, sessionJwt);
    state = FavoriteUpdateModel(responseDTO.data);
  }

  Future<void> updateFavoriteStatus(FriendsDTO friendsDTO) async {
    bool newStatus = !friendsDTO.isFavorite!;
    print("!!!!!뉴스탯!!!!!");
    print(newStatus);
    FavoriteFriendRequestDTO favoriteFriendRequestDTO =
        new FavoriteFriendRequestDTO(
            userId: friendsDTO.userId, isFavorite: newStatus);
    ResponseDTO responseDTO = await FriendRepository().fetchFavoriteStatus(
        favoriteFriendRequestDTO, ref.read(sessionProvider).user!.jwt!);
    state = FavoriteUpdateModel(responseDTO.data);
  }
}

final favoriteUpdateProvider =
    StateNotifierProvider<FavoriteUpdateViewModel, FavoriteUpdateModel?>((ref) {
  return FavoriteUpdateViewModel(null, ref)..notifyInit();
});
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
//
// // FriendsDTO를 업데이트하는 프로바이더 클래스
// class FavoriteUpdateProvider extends NotifierProvider<FavoriteUpdateNotifier, FriendsDTO> {
//   // 생성자
//   FavoriteUpdateProvider() : super((ref) => FavoriteUpdateNotifier());
//
//   // Provider의 값을 업데이트하는 메서드
//   void updateFavoriteStatus(FriendsDTO model) {
//     read.notifier.updateFavoriteStatus(model);
//   }
// }
//
// // 상태를 업데이트하는 노티파이어 클래스
// class FavoriteUpdateNotifier extends Notifier<FriendsDTO> {
//   // 기본값으로 초기화
//   FavoriteUpdateNotifier() : super(FriendsDTO(isFavorite: false));
//
//   // FriendsDTO의 isFavorite 값을 반전시키는 메서드
//   void updateFavoriteStatus(FriendsDTO model) {
//     // 새로운 FriendsDTO를 생성하여 isFavorite 값을 반전시킴
//     final newModel = model.copyWith(isFavorite: !model.isFavorite!);
//
//     // 새로운 상태로 업데이트
//     state = newModel;
//   }
// }

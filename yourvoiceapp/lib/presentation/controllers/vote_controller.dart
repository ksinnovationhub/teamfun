import 'package:get/get.dart';
import 'package:thumbprint/data/requests/vote_cast_vm.dart';

class VoteController extends GetxController{

  final VoteCastVm voteCastVm = VoteCastVm();

  void castVote(String electionID, String electionContestantID){
    voteCastVm.castVote(electionID, electionContestantID);
  }
  void retractVote(String electionID, String electionContestantID){
    voteCastVm.retractVote(electionID, electionContestantID);
  }


}
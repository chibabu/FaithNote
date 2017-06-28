

import UIKit
//import RealmSwift






//var image = UIImage()

//var mMemoDataDic =          [String :         Any        ]() // 메모셀

//var mMemoDataCombine =          [String :        [ String:[Any]]       ]()
//var mMemoDataValue2 = [String:[Any]]() // [텍스트1 : 이미지1_1, 이미지1_2...],[텍스트2 : 이미지2_1, 이미지2_2...]
//var mMemoImageValue = [Any]()




// mainView start
var arraySelect = String() // 피커뷰 인덱스 선택 스트링값
var arraySelectNumber = Int() // 피커뷰 인덱스 선택 인트값
var arrayCategory : [String] = [] // 피커뷰 카테고리 스트링 배열값
var memoNumber = Int() // 메모셀 인덱스 인트값
var mMemoDataValue = [String]() // 메모셀 메모내용 스트링 배열값
// main View end



// writeView start
var imageFileName = String() // hash 랜덤값

var mMemoImageDic = [[String]]() // 로컬에 저장되는 파일 이름 배열 ex [[1,2],[3,4,5],[6,7,8,9]...]
var directoryNameList = [String]() // 로컬에 저장되는 파일 디렉토리 이름 배열

var directoryNameListTemp = [String]() // 로컬에 저장되는 파일 디렉토리 이름(및 파일 이름) 배열 임시
var imageArrayTemp = [UIImage]() // 피커로 추가 해준 임시 실제 이미지 데이타 배열
var imageUrlArrayTemp = [URL]() // 피커로 추가 해주 임시 실제 URL 데이터 배열
var reverseTemp = [String]()
// writeView end







////////
//var image = [UIImage]()

//var dataPath = NSURL()

//var fileURL = NSURL()



//- 

/*
알고리즘
 <새 글>
 1. 카테고리(arrayCategory)값을 가지고 새 글(memoNumber = -1)을 작성
 
 2. user object를 통해 이미지 추가 전 wirteView 화면에서 전에 저장된 mMemoImageDic[[]]배열과 directoryNameList[]배열을 로드
 
 3. 이미지 추가가 이루어 지지 않았을 경우 -> 아무런 값의 변화가 없다.
 
 4. 이미지 추가가 이루어 졌으나 저장하지 않고 취소할 경우
   1) 랜덤 스트링(imageFileName)에 랜덤값을 입력
   2) imageFileName에 저장된 램덤값을 directoryNameListTemp[]에 append하여 배열을 만든다
   3) directoryNameListTemp 배열 index [0]값을 가져와서 해당 값을 로컬 디렉토리 이름으로 생성
   4) 같은 메모창에서 지속적으로 추가되는 이미지 이름들은 directoryNameListTemp에 저장되고 index[0]의 값은 디렉토리 이름이 되는 원리
   5)//아직 안 만들어줌..// 여기서 캔슬 할 경우 일단 directoryNameList의 값은 removeall 해주고, 로컬에 저장된 파일들도 해당 경로를 추척하여. delete 해줌
 
 5. 이미지 추가가 이루어 지고 저장했을 경우
   1) directoryNameListTemp가 nil인지 검사하여 값이 있으면 directoryNameListTemp 배열에 있는 index 0 값을 directoryNameList 영구 배열 값에 insert:0 해주고 set 해주면서 저장
      값이 없으면 오류가 나지 않도록 값을 불러오지 말고 빈 껍질""을 만들어서 저장
   2) directoryNameListTemp에 저장된 임시 파일 목록을 alldelete 해준다.
 
 
 
 6. 카테고리(arrayCategory)값을 가지고 기존글(memoNumber = indexPath)을 수정
   1) 먼저 수정 할 글이 첨부된 이미지가 없던 글이면 directoryNameList[memoNumber]를 체크하여 빈 값일 경우
      - 새글 쓰는 것과 같은 로직으로 값을 넣어준다
   2) 값이 있을 경우
      - 디렉토리가 만들어 져 있기 때문에 기존 디렉토리 값을 userdefalut - mMemoImageDic에서 가져온 후 directoryNameList[memoNumber]로 저장한다
 
 7. 이미지 추가가 이루어 지고 저장했을 경우
   1) 이미지 값이 없었다면, 파일 배열과 디렉토리 배열을 불러와서 빈 값에 임시로 채워진 값을 넣어주고 저장
   2) 이미지 값이 있었다면, 파일 배열과 디렉토리 배열을 불러와서 기존 값에 추가로 임시로 채워진 값을 넣어주고 저장
 
 8. 
 
 
 

 
 
 
 
 
 // 요고 정리해놓고 그다음에
 
   각 삭제 등 알러트넣기
   검색기능
   글 이동(인덱스변경)기능
   수정된 날짜 및 첨부파일이 있는지 없는지 표시
 이미지 파일 눌렀을 때 [크게보기][저장하기/보내기][삭제하기] 메뉴 띄우기
   
   
 
 
 */

//var mMemoDataDic2 = [String : [String : Any]]()


//class fIndex: Object {
//    dynamic var fIndexNum = 0
//    let fMemoList = List<fMemo>()
//    override static func primaryKey() -> String? {
//        return "fIndexNum"
//    }
//}
//
//class fMemo: Object {
//    dynamic var fMemoidx = 0
//    dynamic var fCategory = ""
//    let fTextFileList = List<fText>()
//    let fImageFileList = List<fImage>()
//
//}	
//
//
//class fText: Object {
//    dynamic var fTextContents = ""
//    let fImageFileList = List<fImage>()
//
//}
//
//class fImage: Object {
//    dynamic var fImageFile = ""
//}
//
//var mMemoContainer = fMemo()
//var mMemoImageFile = fImage()
//
//var realm = try! Realm()



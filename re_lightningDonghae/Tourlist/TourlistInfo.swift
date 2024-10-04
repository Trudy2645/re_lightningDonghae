//
//  TouristInfo.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//

import Foundation
// 샘플 관광지 데이터를 배열로 생성
let touristSpots = [
    TouristSpot(name: "벡스코", latitude: 35.169021, longitude: 129.136053, address: "부산광역시 해운대구 APEC로 55", nearestSubway: "부전역", description: "테스트 마지막", imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240628_50%2F1719581207103RqJSi_JPEG%2FIMG_2693.jpeg"),
    TouristSpot(name: "c5", latitude: 36.014257, longitude: 129.325708, address: "경북 포항시 남구 지곡로 80", nearestSubway: "부전역", description: "테스트라구요", imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180501_252%2F152512575528301LW6_JPEG%2FFw7asCrYZKFcaXangDHofBwA.jpg"),
    TouristSpot(name: "커뮤니티 센터", latitude: 36.016762, longitude: 129.322780
, address: "커뮤니티24센터 경상북도 포항시 남구 효곡동 284", nearestSubway: "부전역", description: "그냥테스튼디", imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180501_252%2F152512575528301LW6_JPEG%2FFw7asCrYZKFcaXangDHofBwA.jpg"),

    TouristSpot(name: "스타벅스 이동점어쩌구", latitude: 36.0355086, longitude: 129.3330326, address: "경북 포항시 남구 희망대로 353", nearestSubway: "부전역", description: "그냥 테스트용", imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20211126_46%2F16379232577228BFYO_JPEG%2Fbatch_%25B3%25AA%25BF%25EC_%25BF%25F4%25C0%25BD.jpeg"),
    TouristSpot(
        name: "웨이브락 클라이밍 서면점",
        latitude: 35.1586847,
        longitude: 129.0608825,
        address: "부산 부산진구 서전로9번길 20 혜도인파크에비뉴 오피스텔 상가 3층",
        nearestSubway: "부전역",
        description: "암벽등반 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20211126_46%2F16379232577228BFYO_JPEG%2Fbatch_%25B3%25AA%25BF%25EC_%25BF%25F4%25C0%25BD.jpeg"
    ),
    TouristSpot(
        name: "구구롤러스케이트장",
        latitude: 35.1542,
        longitude: 129.0609,
        address: "부산 부산진구 서전로37번길 25-9 예일프라자 지하1층",
        nearestSubway: "부전역",
        description: "롤러, 인라인스케이트장 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180501_252%2F152512575528301LW6_JPEG%2FFw7asCrYZKFcaXangDHofBwA.jpg"
    ),
    TouristSpot(
        name: "플라피아",
        latitude: 35.1551,
        longitude: 129.0624,
        address: "부산 부산진구 서전로46번길 9 천일메트로빌 대로변 1층",
        nearestSubway: "부전역",
        description: "플라워카페 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240811_131%2F1723355657735Pia0f_JPEG%2F1D5A7115.jpeg"
    ),
    TouristSpot(
        name: "챔피언 롯데백화점부산본점",
        latitude: 35.1574,
        longitude: 129.0591,
        address: "부산 부산진구 가야대로 772 에비뉴엘관 지하2층",
        nearestSubway: "부전역",
        description: "키즈카페, 실내놀이터 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200604_223%2F1591241421000buRbL_JPEG%2F3jZtX_ut6kZcV2Nht9_n6gYo.jpg"
    ),
    TouristSpot(
        name: "철향, 텟판야끼",
        latitude: 35.1575,
        longitude: 129.0632,
        address: "부산 부산진구 서전로58번길 23 2층",
        nearestSubway: "부전역",
        description: "육류,고기요리 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240724_259%2F1721811451118EcvY6_JPEG%2FIMG_9757.JPG"
    ),
    TouristSpot(
        name: "겟럭키",
        latitude: 35.1557,
        longitude: 129.0624,
        address: "부산 부산진구 서전로58번길 31 1층",
        nearestSubway: "부전역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20201103_46%2F1604373589801TzbJL_JPEG%2FhsyuVI3dkCh7GZXI7_eQ1J-4.jpeg.jpg"
    ),
    TouristSpot(
        name: "ShaBing 샤빙",
        latitude: 35.1556,
        longitude: 129.0627,
        address: "부산 부산진구 동성로71번길 32 201호",
        nearestSubway: "부전역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240628_50%2F1719581207103RqJSi_JPEG%2FIMG_2693.jpeg"
    ),
    TouristSpot(
        name: "무명정원",
        latitude: 35.1879,
        longitude: 129.0808,
        address: "부산 연제구 거제대로138번길 12 1층",
        nearestSubway: "거제해맞이역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://pcmap.place.naver.com/restaurant/1047178116/photo?entry=bmp&from=map&fromPanelNum=2&timestamp=202410020038#"
    ),
    TouristSpot(
        name: "모브포그",
        latitude: 35.1905,
        longitude: 129.0789,
        address: "부산 연제구 해맞이로 75 1층",
        nearestSubway: "거제해맞이역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20221207_221%2F1670370400429Tjhoj_JPEG%2FKakaoTalk_20221206_084022522_02.jpg"
    ),
    TouristSpot(
        name: "젤라떼리아 사우스브룩 연산",
        latitude: 35.196329,
        longitude: 129.074883,
        address: "부산 연제구 반송로 32-17 1층",
        nearestSubway: "거제역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA5MjVfMjIg%2FMDAxNzI3MjU2MTI5OTkx.YbPfMq7GfJQWiMbl5_kDQMg1QhkHUTZdqU8UU9ppDN0g.0N-SONR5XpC855hNyJrgcVR9yJtB8ni1ZUPwByAPfxwg.JPEG%2FScreenshot_20240925_182149_Karrot.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "우든테이블",
        latitude: 35.192487,
        longitude: 129.085567,
        address: "부산 연제구 신촌로 50 1층",
        nearestSubway: "거제역",
        description: "케이크전문 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240726_51%2F1721965897005aTG3q_JPEG%2FIMG_4426.jpeg"
    ),
    TouristSpot(
        name: "카페헤븐",
        latitude: 35.179154,
        longitude: 129.079239,
        address: "부산 연제구 아시아드대로 12 드림센터 지하1층 카페헤븐",
        nearestSubway: "거제역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210924_220%2F1632475957741hXkwX_JPEG%2FGeNwpU98lxFJ9S4KuDIV7l-w.jpeg.jpg"
    ),
    TouristSpot(
        name: "소금",
        latitude: 35.171646,
        longitude: 129.117177,
        address: "부산 연제구 신촌로 50 1층 소금",
        nearestSubway: "거제역",
        description: "요리주점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240505_73%2F1714912841960PlINE_JPEG%2FKakaoTalk_20240505_214023506.jpg"
    ),
    TouristSpot(
        name: "리프페럿 사직점",
        latitude: 35.176513,
        longitude: 129.059852,
        address: "부산 연제구 법원북로 45 1층",
        nearestSubway: "거제역",
        description: "동물카페 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230828_28%2F1693210357652YHzDf_JPEG%2F%25B8%25C5%25C0%25E5.jpg"
    ),
    TouristSpot(
        name: "아휘의 부엌",
        latitude: 35.174944,
        longitude: 129.12519700000001,
        address: "부산 연제구 교대로11번길 5 1층 아휘의부엌",
        nearestSubway: "교대역",
        description: "이자카야 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220916_30%2F1663284496933mbrtS_JPEG%2F1663233118778.jpg"
    ),
    TouristSpot(
        name: "이조솥밥",
        latitude: 35.182372,
        longitude: 129.078883,
        address: "부산 연제구 교대로 8 2층 (주차가능)",
        nearestSubway: "교대역",
        description: "한식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220714_160%2F1657767127269fRFyG_JPEG%2F20220620_170734.jpg"
    ),
    TouristSpot(
        name: "모노스코프",
        latitude: 35.195134,
        longitude: 129.082457,
        address: "부산 연제구 명륜로2번길 27 모노스코프 빌딩",
        nearestSubway: "교대역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180419_59%2F1524112625944E7V84_JPEG%2FFFGwkgFpcB7-MyoIbSDroLku.jpg"
    ),
    TouristSpot(
        name: "etalee",
        latitude: 35.181346,
        longitude: 129.073417,
        address: "부산 연제구 교대로 18-1 2층",
        nearestSubway: "교대역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230512_239%2F16838870597848a2Lo_JPEG%2FD5DB2B5D-24D0-4C36-864E-C42D2F729BDB.jpeg"
    ),
    TouristSpot(
        name: "맛퍼줘",
        latitude: 36.9639,
        longitude: 127.9429,
        address: "부산 연제구 거제천로 258 103호",
        nearestSubway: "교대역",
        description: "종합분식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240624_251%2F1719166543815DH9Pc_JPEG%2FKakaoTalk_20240624_012922984_17.jpg"
    ),
    TouristSpot(
        name: "바운티",
        latitude: 35.2062934,
        longitude: 129.0853664,
        address: "부산 동래구 온천천로 287 1층",
        nearestSubway: "교대역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA5MDJfMjEz%2FMDAxNzI1Mjc3NzIzNzEy.Ih2MpoDGYn2Jf4l36nmk6sdUBsHrnqx982aAp9KJEiEg.IYXG2pItWiJLAPiyH2TO49zRkcn2jvfEBnh7X0ZMJNYg.JPEG%2FIMG_8998.jpg"
    ),
    TouristSpot(
        name: "수민어울공원",
        latitude: 35.2056,
        longitude: 129.0864,
        address: "부산 동래구 낙민동 135-1",
        nearestSubway: "동래역",
        description: "근린공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fimage.nmv.naver.net%2Fblog_2024_08_08_2763%2FbdmujNZDzT_08.jpg"
    ),
    TouristSpot(
        name: "오크레페 동래점",
        latitude: 35.202876,
        longitude: 129.086212,
        address: "부산 동래구 온천천로339번길 51 201동 1층 6호",
        nearestSubway: "동래역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA5MjdfMjcx%2FMDAxNzI3NDI5ODc3NDUz.SDjZT6BOMjwoDeaoDq9LwcJJ2ynZuAcEJMtqDglEtjMg.Nkn7K2-7ygWWcJ70fBVHX06r4l6-6LqHCdBMNiUfiT8g.JPEG%2FE8DDD710-7C4A-4679-86E4-F7BD4D54D4ED.jpeg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "라일라카페",
        latitude: 35.205813,
        longitude: 129.095102,
        address: "부산 동래구 온천천로339번길 28 상가동 2층 209호 라일라카페",
        nearestSubway: "동래역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180205_254%2F1517826723472KPrvh_JPEG%2F%25C5%25A9%25B1%25E2%25BA%25AF%25C8%25AF_DSC00226.jpg"
    ),
    TouristSpot(
        name: "이로",
        latitude: 35.200123,
        longitude: 129.086451,
        address: "부산 동래구 온천천로339번길 51 포레나상가 201동 1층 3호",
        nearestSubway: "동래역",
        description: "이자카야 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240509_151%2F1715233619359UJzAF_JPEG%2FKakaoTalk_20240509_110709800_12.jpg"
    ),
    TouristSpot(
        name: "점프키즈카페",
        latitude: 36.96388,
        longitude: 127.9429,
        address: "부산 동래구 안연로 88 4층",
        nearestSubway: "안락역",
        description: "키즈카페, 실내놀이터 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230926_46%2F16957223144694PKle_JPEG%2F20230915_203933.jpg"
    ),
    TouristSpot(
        name: "코모도테이블",
        latitude: 35.1999,
        longitude: 129.0951,
        address: "부산 동래구 온천천로453번길 23-2 1층",
        nearestSubway: "안락역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240518_33%2F1716038471177coYxp_JPEG%2FIMG_1584.jpeg"
    ),
    TouristSpot(
        name: "충렬사",
        latitude: 35.202305,
        longitude: 129.096896,
        address: "부산 동래구 충렬대로 347",
        nearestSubway: "안락역",
        description: "기념물 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_221%2F1441013608736y2bMU_JPEG%2F116352595529297_0.jpg"
    ),
    TouristSpot(
        name: "보헤미아",
        latitude: 35.200706,
        longitude: 129.079635,
        address: "부산 동래구 온천천로453번길 18 1층",
        nearestSubway: "안락역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230823_107%2F1692748518848AWu8x_JPEG%2FF8DAF8E3-E2F4-4D29-A270-6BA781D6AD3D.jpeg"
    ),
    TouristSpot(
        name: "스미타티하우스",
        latitude: 35.1871311,
        longitude: 129.1076717,
        address: "부산 연제구 과정로278번길 47-11 1층 스미다티하우스",
        nearestSubway: "안락역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230613_1%2F168664511173532Xnd_JPEG%2F3%25C0%25DC%25C2%25A5%25B8%25AE.jpg"
    ),
    TouristSpot(
        name: "모해나키친",
        latitude: 35.220571,
        longitude: 129.092841,
        address: "부산 동래구 충렬대로446번길 29 1층 모해나키친",
        nearestSubway: "안락역",
        description: "양식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230718_54%2F1689663703081Ytvh1_JPEG%2F2E6D34B0-B90F-44F8-913F-0BF677C7F48F.jpeg"
    ),
    TouristSpot(
        name: "온천천카페거리",
        latitude: 35.1916279693,
        longitude: 129.1024592605,
        address: "부산 동래구 온천천로 451",
        nearestSubway: "안락역",
        description: "거리, 골목 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA3MTRfMzEg%2FMDAxNzIwOTU1MzkyNDI1.l4UcvGVXW9cTBqxNSTGUPhtUfFMEysH4eIYm7VMd960g.yuUAVarbxJZ0yhGZw-jqIaVREfUpGnPHhQWjYW0F53Qg.JPEG%2F20240627_230401.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "불란서와이너리",
        latitude: 35.208385,
        longitude: 129.084912,
        address: "부산 동래구 연안로58번길 13 1층",
        nearestSubway: "부산원동역",
        description: "와인 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA5MDVfMjU4%2FMDAxNzI1NTE2NTQ1MDE4.A5J1_J2K9CFuRQHxRha2rOO1pKHejqbR6OxJ5MJ5th0g.GZqJnT9Hy50Jr8z57ag2IztNe9I8EJF7kSaN-_44lLwg.JPEG%2FIMG_4945.jpeg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "온들랑 샤브샤브",
        latitude: 35.174512,
        longitude: 129.126375,
        address: "부산 해운대구 선수촌로 57-30 1층",
        nearestSubway: "부산원동역",
        description: "샤브샤브 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230420_111%2F1681957004396KbDic_PNG%2Fl8os1wht.png"
    ),
    TouristSpot(
        name: "홀릭스 그라운드 ",
        latitude: 35.194818,
        longitude: 129.096067,
        address: "부산 동래구 온천천로531번길 73",
        nearestSubway: "부산원동역",
        description: "실내체육관 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyMzEwMTRfMjM2%2FMDAxNjk3MjYzNDM3MjEw.OEUNrNpgqWc2FQPk6UVgXGRlzvKmWdgPkQ5QmxROxTYg.OKR6k-J_wkFq_z44NeJiS0xKR3VKvIdUTgS6X3dIZwYg.JPEG%2Fupload_729ca48c93cba1ce14b78e2316ff9949.jpeg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "오렌지실내테니스장",
        latitude: 35.195685,
        longitude: 129.099934,
        address: "부산 동래구 연안로58번길 38 오렌지실내테니스장",
        nearestSubway: "부산원동역",
        description: "스포츠, 오락 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220912_54%2F1662970422157fWF7Y_JPEG%2FF58E7A2E-ECE9-4BC6-85FD-31C956AE145D.jpeg"
    ),
    TouristSpot(
        name: "우리끼리 키즈카페 꿈꾸는 마을 해운대 재송점",
        latitude: 35.19032,
        longitude: 129.1179,
        address: "부산 해운대구 해운대로76번길 44 1층",
        nearestSubway: "재송역",
        description: "키즈카페, 실내놀이터 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240111_4%2F1704954998714lapvb_JPEG%2FKakaoTalk_20240111_133620086.jpg"
    ),
    TouristSpot(
        name: "한치두치 재송점",
        latitude: 35.18972,
        longitude: 129.1274,
        address: "부산 해운대구 재반로132번길 12 2층",
        nearestSubway: "재송역",
        description: "일본식 라멘 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240411_197%2F171283221364528LbJ_PNG%2F%25C1%25A6%25B8%25F1%25C0%25BB-%25C0%25D4%25B7%25C2%25C7%25D8%25C1%25D6%25BC%25BC%25BF%25E4_-001_%25288%2529.png"
    ),
    TouristSpot(
        name: "한빛공원",
        latitude: 35.18849,
        longitude: 129.1246,
        address: "부산 해운대구 재송동 1057-19",
        nearestSubway: "재송역",
        description: "근린공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA2MjhfNDgg%2FMDAxNzE5NTcwNzQ5MDI2.z70bHqJfndDn9gH-m8DqTZWn_UUyVHQGlX8esJHLfRcg.CZZCJGEFTZi3IHOgLMa544dI8f3aHozOnxU1cpkXaS4g.JPEG%2FIMG_5953.jpg"
    ),
    TouristSpot(
        name: "멜리데이스튜디오",
        latitude: 35.1931,
        longitude: 129.1228,
        address: "부산 해운대구 해운대로61번길 31 3층",
        nearestSubway: "재송역",
        description: "셀프, 대여스튜디오 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220610_18%2F1654839396459KcPcb_JPEG%2FKakaoTalk_20220610_143444524_10.jpg"
    ),
    TouristSpot(
        name: "재송한마음시장",
        latitude: 35.18619,
        longitude: 129.1246,
        address: "부산 해운대구 재반로 81-20",
        nearestSubway: "재송역",
        description: "시장 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231220_77%2F1703057633753MlymL_JPEG%2FKakaoTalk_Photo_2023-12-20-16-33-30_003jpeg.jpeg"
    ),
    TouristSpot(
        name: "스튜디오 필",
        latitude: 35.18258,
        longitude: 129.1242,
        address: "부산 해운대구 재반로11번길 76 5층",
        nearestSubway: "센텀역",
        description: "셀프, 대여스튜디오 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220508_260%2F1652017957165vSI8e_JPEG%2FIMG_7885.JPG"
    ),
    TouristSpot(
        name: "왓더버거 센텀점",
        latitude: 35.1756237,
        longitude: 129.1260441,
        address: "부산 해운대구 센텀중앙로 90 1층 125일부호",
        nearestSubway: "센텀역",
        description: "햄버거 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231214_24%2F1702533703442DyBvh_JPEG%2F3_19iUd018svc3jx7tr6y5skm_ekh5wt.jpg"
    ),
    TouristSpot(
        name: "르꽁비프",
        latitude: 35.1767,
        longitude: 129.1254,
        address: "부산 해운대구 센텀북대로 60 센텀아이에스타워",
        nearestSubway: "센텀역 ",
        description: "프랑스 음식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230927_174%2F1695803399605MEu2R_JPEG%2FIMG_2812_%25B3%25D7%25C0%25CC%25B9%25F6%25C7%25C3%25B7%25B9%25C0%25CC%25BD%25BA.jpg"
    ),
    TouristSpot(
        name: "서요 재송점    ",
        latitude: 35.18002,
        longitude: 129.1267,
        address: "부산 해운대구 재반로 13 1층",
        nearestSubway: "센텀역",
        description: "요리주점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210122_32%2F1611284429810cwjYb_JPEG%2FJFuRMUZIK2q8hQHbT_Z_Y3pq.jpg"
    ),
    TouristSpot(
        name: "베아트리체부티크",
        latitude: 35.17401,
        longitude: 129.1284,
        address: "부산 해운대구 센텀중앙로 66 센텀티타워 2층 202호",
        nearestSubway: "센텀역",
        description: "한복대여 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240912_43%2F1726115615887TCO1O_JPEG%2FIMG_1999.jpeg"
    ),
    TouristSpot(
        name: "키자니아 부산",
        latitude: 35.16906,
        longitude: 129.1297,
        address: "부산 해운대구 센텀4로 15 센텀시티몰 4층",
        nearestSubway: "벡스코역",
        description: "체험, 홍보관 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230310_140%2F1678407312021LmU6R_JPEG%2F%25BB%25F8%25B7%25AF%25B5%25E5%25C4%25AB%25C6%25E4_4.jpg"
    ),
    TouristSpot(
        name: "팔선생",
        latitude: 35.17301,
        longitude: 129.1317,
        address: "부산 해운대구 센텀5로 55 센텀큐",
        nearestSubway: "벡스코역",
        description: "중식당 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200227_157%2F1582803648265e3Rcw_JPEG%2FMh6w0zZY_feS3_LBN6MuS9op.jpg"
    ),
    TouristSpot(
        name: "영화의 전당",
        latitude: 35.17128,
        longitude: 129.1272,
        address: "부산 해운대구 수영강변대로 120 영화의전당",
        nearestSubway: "벡스코역",
        description: "영화관 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20171117_54%2F1510878782796HdbRU_PNG%2FKcmlAdwK2BGHBSlAU80N8z3z.PNG.png"
    ),
    TouristSpot(
        name: "롯데백화점 센텀시티점",
        latitude: 35.17008,
        longitude: 129.1311,
        address: "부산 해운대구 센텀남대로 59 롯데백화점센텀시티점",
        nearestSubway: "벡스코역",
        description: "백화점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220830_16%2F1661821720704gnMTR_JPEG%2F%25B9%25E9%25C8%25AD%25C1%25A1_%25BC%25BE%25C5%25D2%25BD%25C3%25C6%25BC%25C1%25A1.jpg"
    ),
    TouristSpot(
        name: "신세계백화점 센텀시티점",
        latitude: 35.1691,
        longitude: 129.1297,
        address: "부산 해운대구 센텀남대로 35",
        nearestSubway: "벡스코역",
        description: "백화점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMDVfMTE5%2FMDAxNzAxNzY2MDYwOTg0.Frz1Ar8NsC3OipKU_ZuYw9lnSucnkttp8OORY7586Tkg.t6VMC6dJvn6GKpboNy4MRXFIOeS1QfNHihvJMovW4scg.JPEG.seonmi1982%2Foutput_1844401456.jpg%23740x961"
    ),
    TouristSpot(
        name: "센텀 스파랜드",
        latitude: 35.16905,
        longitude: 129.1296,
        address: "부산 해운대구 센텀남대로 35 신세계백화점센텀시티점",
        nearestSubway: "벡스코역",
        description: "온천, 스파 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190423_24%2F1556012649711pzrb3_JPEG%2F%25B7%25D1%25B8%25B5%25C0%25CC%25B9%25CC%25C1%25F6%2528%25C1%25A4%25BB%25E7%25B0%25A2%25C7%25FC3%2529.jpg"
    ),
]

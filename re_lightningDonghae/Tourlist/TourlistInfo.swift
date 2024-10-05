//
//  TouristInfo.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//

import Foundation
// 샘플 관광지 데이터를 배열로 생성
let touristSpots = [

    TouristSpot(
        name: "웨이브락 클라이밍 서면점",
        latitude: 35.15865,
        longitude: 129.0609,
        category: "액티비티",
        address: "부산 부산진구 서전로9번길 20 혜도인파크에비뉴 오피스텔 상가 3층",
        nearestSubway: "부전역",
        description: "암벽등반 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20211126_46%2F16379232577228BFYO_JPEG%2Fbatch_%25B3%25AA%25BF%25EC_%25BF%25F4%25C0%25BD.jpeg"
    ),
    TouristSpot(
        name: "구구롤러스케이트장",
        latitude: 35.1588,
        longitude: 129.0632,
        category: "액티비티",
        address: "부산 부산진구 서전로37번길 25-9 예일프라자 지하1층",
        nearestSubway: "부전역",
        description: "롤러, 인라인스케이트장 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180501_252%2F152512575528301LW6_JPEG%2FFw7asCrYZKFcaXangDHofBwA.jpg"
    ),
    TouristSpot(
        name: "플라피아",
        latitude: 35.15735,
        longitude: 129.065,
        category: "쇼핑",
        address: "부산 부산진구 서전로46번길 9 천일메트로빌 대로변 1층",
        nearestSubway: "부전역",
        description: "플라워카페 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240811_131%2F1723355657735Pia0f_JPEG%2F1D5A7115.jpeg"
    ),
    TouristSpot(
        name: "챔피언 롯데백화점부산본점",
        latitude: 35.15679,
        longitude: 129.0566,
        category: "액티비티",
        address: "부산 부산진구 가야대로 772 에비뉴엘관 지하2층",
        nearestSubway: "부전역",
        description: "키즈카페, 실내놀이터 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200604_223%2F1591241421000buRbL_JPEG%2F3jZtX_ut6kZcV2Nht9_n6gYo.jpg"
    ),
    TouristSpot(
        name: "철향, 텟판야끼",
        latitude: 35.15672,
        longitude: 129.0662,
        category: "맛집",
        address: "부산 부산진구 서전로58번길 23 2층",
        nearestSubway: "부전역",
        description: "육류,고기요리 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240724_259%2F1721811451118EcvY6_JPEG%2FIMG_9757.JPG"
    ),
    TouristSpot(
        name: "겟럭키",
        latitude: 35.15638,
        longitude: 129.0662,
        category: "카페",
        address: "부산 부산진구 서전로58번길 31 1층",
        nearestSubway: "부전역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20201103_46%2F1604373589801TzbJL_JPEG%2FhsyuVI3dkCh7GZXI7_eQ1J-4.jpeg.jpg"
    ),
    TouristSpot(
        name: "ShaBing 샤빙",
        latitude: 35.15697,
        longitude: 129.0666,
        category: "카페",
        address: "부산 부산진구 동성로71번길 32 201호",
        nearestSubway: "부전역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240628_50%2F1719581207103RqJSi_JPEG%2FIMG_2693.jpeg"
    ),
    TouristSpot(
        name: "무명정원",
        latitude: 35.18063,
        longitude: 129.07,
        category: "카페",
        address: "부산 연제구 거제대로138번길 12 1층",
        nearestSubway: "거제해맞이역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://pcmap.place.naver.com/restaurant/1047178116/photo?entry=bmp&from=map&fromPanelNum=2&timestamp=202410020038#"
    ),
    TouristSpot(
        name: "모브포그",
        latitude: 35.18062,
        longitude: 129.07,
        category: "카페",
        address: "부산 연제구 해맞이로 75 1층",
        nearestSubway: "거제해맞이역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20221207_221%2F1670370400429Tjhoj_JPEG%2FKakaoTalk_20221206_084022522_02.jpg"
    ),
    TouristSpot(
        name: "젤라떼리아 사우스브룩 연산",
        latitude: 35.18832,
        longitude: 129.0862,
        category: "카페",
        address: "부산 연제구 반송로 32-17 1층",
        nearestSubway: "거제역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA5MjVfMjIg%2FMDAxNzI3MjU2MTI5OTkx.YbPfMq7GfJQWiMbl5_kDQMg1QhkHUTZdqU8UU9ppDN0g.0N-SONR5XpC855hNyJrgcVR9yJtB8ni1ZUPwByAPfxwg.JPEG%2FScreenshot_20240925_182149_Karrot.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "우든테이블",
        latitude: 35.18441,
        longitude: 129.0737,
        category: "카페",
        address: "부산 연제구 신촌로 50 1층",
        nearestSubway: "거제역",
        description: "케이크전문 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240726_51%2F1721965897005aTG3q_JPEG%2FIMG_4426.jpeg"
    ),
    TouristSpot(
        name: "카페헤븐",
        latitude: 35.18708,
        longitude: 129.0702,
        category: "카페",
        address: "부산 연제구 아시아드대로 12 드림센터 지하1층 카페헤븐",
        nearestSubway: "거제역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210924_220%2F1632475957741hXkwX_JPEG%2FGeNwpU98lxFJ9S4KuDIV7l-w.jpeg.jpg"
    ),
    TouristSpot(
        name: "소금",
        latitude: 35.18063,
        longitude: 129.07,
        category: "술집",
        address: "부산 연제구 신촌로 50 1층 소금",
        nearestSubway: "거제역",
        description: "요리주점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240505_73%2F1714912841960PlINE_JPEG%2FKakaoTalk_20240505_214023506.jpg"
    ),
    TouristSpot(
        name: "리프페럿 사직점",
        latitude: 35.19425,
        longitude: 129.0718,
        category: "카페",
        address: "부산 연제구 법원북로 45 1층",
        nearestSubway: "거제역",
        description: "동물카페 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230828_28%2F1693210357652YHzDf_JPEG%2F%25B8%25C5%25C0%25E5.jpg"
    ),
    TouristSpot(
        name: "아휘의 부엌",
        latitude: 35.19511,
        longitude: 129.0785,
        category: "맛집",
        address: "부산 연제구 교대로11번길 5 1층 아휘의부엌",
        nearestSubway: "교대역",
        description: "이자카야 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220916_30%2F1663284496933mbrtS_JPEG%2F1663233118778.jpg"
    ),
    TouristSpot(
        name: "이조솥밥",
        latitude: 35.19556,
        longitude: 129.0792,
        category: "맛집",
        address: "부산 연제구 교대로 8 2층 (주차가능)",
        nearestSubway: "교대역",
        description: "한식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220714_160%2F1657767127269fRFyG_JPEG%2F20220620_170734.jpg"
    ),
    TouristSpot(
        name: "모노스코프",
        latitude: 35.19448,
        longitude: 129.0802,
        category: "카페",
        address: "부산 연제구 명륜로2번길 27 모노스코프 빌딩",
        nearestSubway: "교대역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180419_59%2F1524112625944E7V84_JPEG%2FFFGwkgFpcB7-MyoIbSDroLku.jpg"
    ),
    TouristSpot(
        name: "etalee",
        latitude: 35.19564,
        longitude: 129.0778,
        category: "카페",
        address: "부산 연제구 교대로 18-1 2층",
        nearestSubway: "교대역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230512_239%2F16838870597848a2Lo_JPEG%2FD5DB2B5D-24D0-4C36-864E-C42D2F729BDB.jpeg"
    ),
    TouristSpot(
        name: "맛퍼줘",
        latitude: 35.1916,
        longitude: 129.0853,
        category: "맛집",
        address: "부산 연제구 거제천로 258 103호",
        nearestSubway: "교대역",
        description: "종합분식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240624_251%2F1719166543815DH9Pc_JPEG%2FKakaoTalk_20240624_012922984_17.jpg"
    ),
    TouristSpot(
        name: "바운티",
        latitude: 35.19562,
        longitude: 129.0852,
        category: "카페",
        address: "부산 동래구 온천천로 287 1층",
        nearestSubway: "교대역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA5MDJfMjEz%2FMDAxNzI1Mjc3NzIzNzEy.Ih2MpoDGYn2Jf4l36nmk6sdUBsHrnqx982aAp9KJEiEg.IYXG2pItWiJLAPiyH2TO49zRkcn2jvfEBnh7X0ZMJNYg.JPEG%2FIMG_8998.jpg"
    ),
    TouristSpot(
        name: "수민어울공원",
        latitude: 35.19651,
        longitude: 129.0916,
        category: "공원",
        address: "부산 동래구 낙민동 135-1",
        nearestSubway: "동래역",
        description: "근린공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fimage.nmv.naver.net%2Fblog_2024_08_08_2763%2FbdmujNZDzT_08.jpg"
    ),
    TouristSpot(
        name: "오크레페 동래점",
        latitude: 35.19618,
        longitude: 129.0903,
        category: "카페",
        address: "부산 동래구 온천천로339번길 51 201동 1층 6호",
        nearestSubway: "동래역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA5MjdfMjcx%2FMDAxNzI3NDI5ODc3NDUz.SDjZT6BOMjwoDeaoDq9LwcJJ2ynZuAcEJMtqDglEtjMg.Nkn7K2-7ygWWcJ70fBVHX06r4l6-6LqHCdBMNiUfiT8g.JPEG%2FE8DDD710-7C4A-4679-86E4-F7BD4D54D4ED.jpeg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "라일라카페",
        latitude: 35.19493,
        longitude: 129.092,
        category: "카페",
        address: "부산 동래구 온천천로339번길 28 상가동 2층 209호 라일라카페",
        nearestSubway: "동래역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180205_254%2F1517826723472KPrvh_JPEG%2F%25C5%25A9%25B1%25E2%25BA%25AF%25C8%25AF_DSC00226.jpg"
    ),
    TouristSpot(
        name: "이로",
        latitude: 35.19616,
        longitude: 129.0903,
        category: "술집",
        address: "부산 동래구 온천천로339번길 51 포레나상가 201동 1층 3호",
        nearestSubway: "동래역",
        description: "이자카야 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240509_151%2F1715233619359UJzAF_JPEG%2FKakaoTalk_20240509_110709800_12.jpg"
    ),
    TouristSpot(
        name: "점프키즈카페",
        latitude: 35.19534,
        longitude: 129.0981,
        category: "키즈카페",
        address: "부산 동래구 안연로 88 4층",
        nearestSubway: "안락역",
        description: "키즈카페, 실내놀이터 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230926_46%2F16957223144694PKle_JPEG%2F20230915_203933.jpg"
    ),
    TouristSpot(
        name: "코모도테이블",
        latitude: 35.19253,
        longitude: 129.1031,
        category: "카페",
        address: "부산 동래구 온천천로453번길 23-2 1층",
        nearestSubway: "안락역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240518_33%2F1716038471177coYxp_JPEG%2FIMG_1584.jpeg"
    ),
    TouristSpot(
        name: "충렬사",
        latitude: 35.19961,
        longitude: 129.0969,
        category: "공원",
        address: "부산 동래구 충렬대로 347",
        nearestSubway: "안락역",
        description: "기념물 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_221%2F1441013608736y2bMU_JPEG%2F116352595529297_0.jpg"
    ),
    TouristSpot(
        name: "보헤미아",
        latitude: 35.19207,
        longitude: 129.1031,
        category: "카페",
        address: "부산 동래구 온천천로453번길 18 1층",
        nearestSubway: "안락역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230823_107%2F1692748518848AWu8x_JPEG%2FF8DAF8E3-E2F4-4D29-A270-6BA781D6AD3D.jpeg"
    ),
    TouristSpot(
        name: "스미타티하우스",
        latitude: 35.19,
        longitude: 129.095,
        category: "카페",
        address: "부산 연제구 과정로278번길 47-11 1층 스미다티하우스",
        nearestSubway: "안락역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230613_1%2F168664511173532Xnd_JPEG%2F3%25C0%25DC%25C2%25A5%25B8%25AE.jpg"
    ),
    TouristSpot(
        name: "모해나키친",
        latitude: 35.19434,
        longitude: 129.1063,
        category: "맛집",
        address: "부산 동래구 충렬대로446번길 29 1층 모해나키친",
        nearestSubway: "안락역",
        description: "양식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230718_54%2F1689663703081Ytvh1_JPEG%2F2E6D34B0-B90F-44F8-913F-0BF677C7F48F.jpeg"
    ),
    TouristSpot(
        name: "온천천카페거리",
        latitude: 35.19156,
        longitude: 129.102,
        category: "공원",
        address: "부산 동래구 온천천로 451",
        nearestSubway: "안락역",
        description: "거리, 골목 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA3MTRfMzEg%2FMDAxNzIwOTU1MzkyNDI1.l4UcvGVXW9cTBqxNSTGUPhtUfFMEysH4eIYm7VMd960g.yuUAVarbxJZ0yhGZw-jqIaVREfUpGnPHhQWjYW0F53Qg.JPEG%2F20240627_230401.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "불란서와이너리",
        latitude: 35.19193,
        longitude: 129.1112,
        category: "술집",
        address: "부산 동래구 연안로58번길 13 1층",
        nearestSubway: "부산원동역",
        description: "와인 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA5MDVfMjU4%2FMDAxNzI1NTE2NTQ1MDE4.A5J1_J2K9CFuRQHxRha2rOO1pKHejqbR6OxJ5MJ5th0g.GZqJnT9Hy50Jr8z57ag2IztNe9I8EJF7kSaN-_44lLwg.JPEG%2FIMG_4945.jpeg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "온들랑 샤브샤브",
        latitude: 35.19948,
        longitude: 129.1171,
        category: "맛집",
        address: "부산 해운대구 선수촌로 57-30 1층",
        nearestSubway: "부산원동역",
        description: "샤브샤브 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230420_111%2F1681957004396KbDic_PNG%2Fl8os1wht.png"
    ),
    TouristSpot(
        name: "홀릭스 그라운드 ",
        latitude: 35.19344,
        longitude: 129.1126,
        category: "체육관",
        address: "부산 동래구 온천천로531번길 73",
        nearestSubway: "부산원동역",
        description: "실내체육관 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyMzEwMTRfMjM2%2FMDAxNjk3MjYzNDM3MjEw.OEUNrNpgqWc2FQPk6UVgXGRlzvKmWdgPkQ5QmxROxTYg.OKR6k-J_wkFq_z44NeJiS0xKR3VKvIdUTgS6X3dIZwYg.JPEG%2Fupload_729ca48c93cba1ce14b78e2316ff9949.jpeg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "오렌지실내테니스장",
        latitude: 35.19078,
        longitude: 129.1124,
        category: "스포츠",
        address: "부산 동래구 연안로58번길 38 오렌지실내테니스장",
        nearestSubway: "부산원동역",
        description: "스포츠, 오락 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220912_54%2F1662970422157fWF7Y_JPEG%2FF58E7A2E-ECE9-4BC6-85FD-31C956AE145D.jpeg"
    ),
    TouristSpot(
        name: "우리끼리 키즈카페 꿈꾸는 마을 해운대 재송점",
        latitude: 35.19032,
        longitude: 129.1179,
        category: "키즈카페",
        address: "부산 해운대구 해운대로76번길 44 1층",
        nearestSubway: "재송역",
        description: "키즈카페, 실내놀이터 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240111_4%2F1704954998714lapvb_JPEG%2FKakaoTalk_20240111_133620086.jpg"
    ),
    TouristSpot(
        name: "한치두치 재송점",
        latitude: 35.18972,
        longitude: 129.1274,
        category: "맛집",
        address: "부산 해운대구 재반로132번길 12 2층",
        nearestSubway: "재송역",
        description: "일본식 라멘 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240411_197%2F171283221364528LbJ_PNG%2F%25C1%25A6%25B8%25F1%25C0%25BB-%25C0%25D4%25B7%25C2%25C7%25D8%25C1%25D6%25BC%25BC%25BF%25E4_-001_%25288%2529.png"
    ),
    TouristSpot(
        name: "한빛공원",
        latitude: 35.18849,
        longitude: 129.1246,
        category: "공원",
        address: "부산 해운대구 재송동 1057-19",
        nearestSubway: "재송역",
        description: "근린공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA2MjhfNDgg%2FMDAxNzE5NTcwNzQ5MDI2.z70bHqJfndDn9gH-m8DqTZWn_UUyVHQGlX8esJHLfRcg.CZZCJGEFTZi3IHOgLMa544dI8f3aHozOnxU1cpkXaS4g.JPEG%2FIMG_5953.jpg"
    ),
    TouristSpot(
        name: "멜리데이스튜디오",
        latitude: 35.1931,
        longitude: 129.1228,
        category: "사진",
        address: "부산 해운대구 해운대로61번길 31 3층",
        nearestSubway: "재송역",
        description: "셀프, 대여스튜디오 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220610_18%2F1654839396459KcPcb_JPEG%2FKakaoTalk_20220610_143444524_10.jpg"
    ),
    TouristSpot(
        name: "재송한마음시장",
        latitude: 35.18619,
        longitude: 129.1246,
        category: "쇼핑",
        address: "부산 해운대구 재반로 81-20",
        nearestSubway: "재송역",
        description: "시장 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231220_77%2F1703057633753MlymL_JPEG%2FKakaoTalk_Photo_2023-12-20-16-33-30_003jpeg.jpeg"
    ),
    TouristSpot(
        name: "스튜디오 필",
        latitude: 35.18258,
        longitude: 129.1242,
        category: "액티비티",
        address: "부산 해운대구 재반로11번길 76 5층",
        nearestSubway: "센텀역",
        description: "셀프, 대여스튜디오 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220508_260%2F1652017957165vSI8e_JPEG%2FIMG_7885.JPG"
    ),
    TouristSpot(
        name: "왓더버거 센텀점",
        latitude: 35.1756237,
        longitude: 129.1260441,
        category: "맛집",
        address: "부산 해운대구 센텀중앙로 90 1층 125일부호",
        nearestSubway: "센텀역",
        description: "햄버거 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231214_24%2F1702533703442DyBvh_JPEG%2F3_19iUd018svc3jx7tr6y5skm_ekh5wt.jpg"
    ),
    TouristSpot(
        name: "르꽁비프",
        latitude: 35.1767,
        longitude: 129.1254,
        category: "맛집",
        address: "부산 해운대구 센텀북대로 60 센텀아이에스타워",
        nearestSubway: "센텀역 ",
        description: "프랑스 음식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230927_174%2F1695803399605MEu2R_JPEG%2FIMG_2812_%25B3%25D7%25C0%25CC%25B9%25F6%25C7%25C3%25B7%25B9%25C0%25CC%25BD%25BA.jpg"
    ),
    TouristSpot(
        name: "서요 재송점    ",
        latitude: 35.18002,
        longitude: 129.1267,
        category: "술집",
        address: "부산 해운대구 재반로 13 1층",
        nearestSubway: "센텀역",
        description: "요리주점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210122_32%2F1611284429810cwjYb_JPEG%2FJFuRMUZIK2q8hQHbT_Z_Y3pq.jpg"
    ),
    TouristSpot(
        name: "베아트리체부티크",
        latitude: 35.17401,
        longitude: 129.1284,
        category: "체험",
        address: "부산 해운대구 센텀중앙로 66 센텀티타워 2층 202호",
        nearestSubway: "센텀역",
        description: "한복대여 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240912_43%2F1726115615887TCO1O_JPEG%2FIMG_1999.jpeg"
    ),
    TouristSpot(
        name: "키자니아 부산",
        latitude: 35.16906,
        longitude: 129.1297,
        category: "액티비티",
        address: "부산 해운대구 센텀4로 15 센텀시티몰 4층",
        nearestSubway: "벡스코역",
        description: "체험, 홍보관 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230310_140%2F1678407312021LmU6R_JPEG%2F%25BB%25F8%25B7%25AF%25B5%25E5%25C4%25AB%25C6%25E4_4.jpg"
    ),
    TouristSpot(
        name: "팔선생",
        latitude: 35.17301,
        longitude: 129.1317,
        category: "맛집",
        address: "부산 해운대구 센텀5로 55 센텀큐",
        nearestSubway: "벡스코역",
        description: "중식당 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200227_157%2F1582803648265e3Rcw_JPEG%2FMh6w0zZY_feS3_LBN6MuS9op.jpg"
    ),
    TouristSpot(
        name: "영화의 전당",
        latitude: 35.17128,
        longitude: 129.1272,
        category: "영화",
        address: "부산 해운대구 수영강변대로 120 영화의전당",
        nearestSubway: "벡스코역",
        description: "영화관 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20171117_54%2F1510878782796HdbRU_PNG%2FKcmlAdwK2BGHBSlAU80N8z3z.PNG.png"
    ),
    TouristSpot(
        name: "롯데백화점 센텀시티점",
        latitude: 35.17008,
        longitude: 129.1311,
        category: "쇼핑",
        address: "부산 해운대구 센텀남대로 59 롯데백화점센텀시티점",
        nearestSubway: "벡스코역",
        description: "백화점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220830_16%2F1661821720704gnMTR_JPEG%2F%25B9%25E9%25C8%25AD%25C1%25A1_%25BC%25BE%25C5%25D2%25BD%25C3%25C6%25BC%25C1%25A1.jpg"
    ),
    TouristSpot(
        name: "신세계백화점 센텀시티점",
        latitude: 35.1691,
        longitude: 129.1297,
        category: "쇼핑",
        address: "부산 해운대구 센텀남대로 35",
        nearestSubway: "벡스코역",
        description: "백화점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMDVfMTE5%2FMDAxNzAxNzY2MDYwOTg0.Frz1Ar8NsC3OipKU_ZuYw9lnSucnkttp8OORY7586Tkg.t6VMC6dJvn6GKpboNy4MRXFIOeS1QfNHihvJMovW4scg.JPEG.seonmi1982%2Foutput_1844401456.jpg%23740x961"
    ),
    TouristSpot(
        name: "센텀 스파랜드",
        latitude: 35.16905,
        longitude: 129.1296,
        category: "온천",
        address: "부산 해운대구 센텀남대로 35 신세계백화점센텀시티점",
        nearestSubway: "벡스코역",
        description: "온천, 스파 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190423_24%2F1556012649711pzrb3_JPEG%2F%25B7%25D1%25B8%25B5%25C0%25CC%25B9%25CC%25C1%25F6%2528%25C1%25A4%25BB%25E7%25B0%25A2%25C7%25FC3%2529.jpg"
    ),
    TouristSpot(
        name: "스게",
        latitude: 35.17485,
        longitude: 129.1748,
        category: "술집",
        address: "부산 해운대구 대천로 116 1층",
        nearestSubway: "신해운대역",
        description: "이자카야 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220516_235%2F16527056263745LkCq_JPEG%2FIMG_20220413_174852_667.jpg"
    ),
    TouristSpot(
        name: "해운대블루라인파크 송정정거장",
        latitude: 35.1813,
        longitude: 129.2004,
        category: "힐링",
        address: "부산 해운대구 송정중앙로8번길 60",
        nearestSubway: "송정역",
        description: "테마파크 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA5MDZfMjc5%2FMDAxNzI1NjEwMzk3MjY5.AlvRLTxg_6FWE7c-1KK9VCB05x5-UJPaOFa4bRCd-30g.DPt73LdsTlVYMy8oURmBEohCzo_bwqYdi6kxHZlNzJIg.JPEG%2F1000047165.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "부산 송정해수욕장",
        latitude: 35.17947,
        longitude: 129.1992,
        category: "바다",
        address: "부산 해운대구 송정동 712-2",
        nearestSubway: "송정역",
        description: "해수욕장, 해변 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_53%2F1440992297203pitiB_JPEG%2F157155537056687_0.jpg"
    ),
    TouristSpot(
        name: "죽도공원",
        latitude: 35.17974,
        longitude: 129.2058,
        category: "공원",
        address: "부산 해운대구 송정해변로 1-23",
        nearestSubway: "송정역",
        description: "도시, 테마공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA5MTdfNDIg%2FMDAxNzI2NTczMDc3Mjk5.EmLt5xWCDqtq0HllmUqguhFUY04Fb6d2t1Mor456qLog.0ON0GTPncjW5pt1b8Eq-ihrfsxMZl5snhDAhbc0GvQ8g.JPEG%2F1000008144.heic.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "송정공원",
        latitude: 35.17953,
        longitude: 129.2056,
        category: "공원",
        address: "부산 해운대구 송정동 288-60",
        nearestSubway: "송정역",
        description: "도시, 테마공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA4MjFfMjY5%2FMDAxNzI0MjI4NTExNTg5._JYDUCFx303A84ytFAD0imZS2GStJ_l2prWSOojqmfUg.MzYYc804p1i4qvOpd9NNC5eciDIafOwuHWMs6Zwtl4sg.JPEG%2F20240728_113055.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "카페벨라비",
        latitude: 35.17883,
        longitude: 129.1982,
        category: "카페",
        address: "부산 해운대구 송정광어골로 25",
        nearestSubway: "송정역",
        description: "카페 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230406_82%2F1680722554415phbYG_JPEG%2F20210913_181049.jpg"
    ),
    TouristSpot(
        name: "츄플러스 부산송정점",
        latitude: 35.18081,
        longitude: 129.2022,
        category: "카페",
        address: "부산 해운대구 송정해변로 36 1층 츄플러스 부산송정점",
        nearestSubway: "송정역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240311_126%2F17101409289850kIKU_JPEG%2FIMG_6234.jpeg"
    ),
    TouristSpot(
        name: "다솥맛집",
        latitude: 35.17868,
        longitude: 129.1981,
        category: "맛집",
        address: "부산 해운대구 송정광어골로 29 화이트듀 빌딩 6층( 구 수정빌딩 )",
        nearestSubway: "송정역",
        description: "해물, 생선요리 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20161215_272%2F1481800612333yVm8b_JPEG%2F177163566635958_0.jpeg"
    ),
    TouristSpot(
        name: "라트커피앤티",
        latitude: 35.18735,
        longitude: 129.204,
        category: "카페",
        address: "부산 해운대구 송정중앙로5번길 91",
        nearestSubway: "송정역    ",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20221027_240%2F1666861542108npAVT_JPEG%2FD3CF36C4-0062-45C6-B7FC-A4F420A5EC83.jpeg"
    ),
    TouristSpot(
        name: "니블해운대",
        latitude: 35.18919,
        longitude: 129.2059,
        category: "카페",
        address: "부산 해운대구 송정중앙로9번길 146 1층",
        nearestSubway: "송정역",
        description: "브런치 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240723_86%2F17216616089874YU4P_JPEG%2FKakaoTalk_20240723_000023063_08.jpg"
    ),
    TouristSpot(
        name: "동네서점 아르케",
        latitude: 35.18675,
        longitude: 129.2037,
        category: "카페",
        address: "부산 해운대구 송정중앙로5번길 77",
        nearestSubway: "송정역 ",
        description: "북카페 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220611_156%2F1654920127369uMSDp_JPEG%2FKakaoTalk_20220611_130038189_02.jpg"
    ),
    TouristSpot(
        name: "롯데프리미엄아울렛동부산점등대전망대",
        latitude: 35.1922,
        longitude: 129.2128,
        category: "경치",
        address: "부산 기장군 기장읍 당사리 524",
        nearestSubway: "오시리아역",
        description: "전망대 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODEwMTNfMzgg%2FMDAxNTM5NDI0NjY2MDgx.8Qoq85SmyHaMFA5IL_otjHRZpcxLasms2qt-6HiZUOIg.CNSrFnas--iuUPWLySdN0Jp5M6VfU8TZpfvaYWC3qqYg.JPEG.dlwjddls0708%2F20181013_153548.jpg"
    ),
    TouristSpot(
        name: "롯데월드 어드벤처 부산",
        latitude: 35.1946,
        longitude: 129.2148,
        category: "액티비티",
        address: "부산 기장군 기장읍 동부산관광로 42",
        nearestSubway: "오시리아역",
        description: "테마파크 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240911_97%2F1726044188179LIrVd_JPEG%2F24-%25B0%25A1%25C0%25BB%25BD%25C3%25C1%25F0_%25BA%25CE%25BB%25EA%25281%2529.jpg"
    ),
    TouristSpot(
        name: "국립부산과학관",
        latitude: 35.20464,
        longitude: 129.2127,
        category: "체험",
        address: "부산 기장군 기장읍 동부산관광6로 59 국립부산과학관",
        nearestSubway: "오시리아역",
        description: "과학관 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220606_217%2F1654483235381DDh8T_JPEG%2Fsciport1.jpg"
    ),
    TouristSpot(
        name: "스카이라인루지 부산",
        latitude: 35.19435,
        longitude: 129.2203,
        category: "액티비티",
        address: "부산 기장군 기장읍 기장해안로 205",
        nearestSubway: "오시리아역",
        description: "루지 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220322_21%2F1647932153432N7p7G_JPEG%2FSkyline_Luge_Busan_3_Min.jpg"
    ),
    TouristSpot(
        name: "부산 칠드런스 뮤지엄",
        latitude: 35.19196,
        longitude: 129.2178,
        category: "키즈카페",
        address: "부산 기장군 기장읍 기장해안로 172 2층",
        nearestSubway: "오시리아역",
        description: "키즈카페, 실내놀이터 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220805_295%2F1659682697602InHyU_PNG%2F5.%25BA%25CE%25BB%25EA%25C4%25A5%25B5%25E5%25B7%25B1%25BD%25BA%25B9%25C2%25C1%25F6%25BE%25F6_%25C7%25C1%25B7%25CE%25B1%25D7%25B7%25A5%25C0%25CC%25B9%25CC%25C1%25F6%2528720x540%2529.png"
    ),
    TouristSpot(
        name: "브릭캠퍼스 부산",
        latitude: 35.19342,
        longitude: 129.2146,
        category: "액티비티",
        address: "부산 기장군 기장읍 동부산관광로 8 롯데몰 메종동부산 1층",
        nearestSubway: "오시리아역",
        description: "테마파크 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210704_170%2F1625392118974PoFxV_JPEG%2FAdXoDhC3Hqo4QFii-HjOw2k2.JPG.jpg"
    ),
    TouristSpot(
        name: "뮤직컴플렉스서울 부산점",
        latitude: 35.19462,
        longitude: 129.2148,
        category: "카페",
        address: "부산 기장군 기장읍 동부산관광로 34 미식일상 1F 뮤직컴플렉스서울 부산점",
        nearestSubway: "오시리아역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231129_250%2F1701250894771uqCV6_JPEG%2FKakaoTalk_20231129_182239299_08.jpg"
    ),
    TouristSpot(
        name: "샤브원 기장동부산점",
        latitude: 35.19153,
        longitude: 129.217,
        category: "맛집",
        address: "부산 기장군 기장읍 기장해안로 160 2층",
        nearestSubway: "오시리아역",
        description: "샤브샤브 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231027_87%2F16983671821165OAON_JPEG%2FKakaoTalk_20231027_093614150_15.jpg"
    ),
    TouristSpot(
        name: "해동용궁사",
        latitude: 35.18833,
        longitude: 129.2233,
        category: "공원",
        address: "부산 기장군 기장읍 용궁길 86 해동용궁사",
        nearestSubway: "오시리아역",
        description: "절, 사찰 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190927_59%2F1569562115725u6bpj_JPEG%2FzneFazTohGqA-utNQUEPllla.jpg"
    ),
    TouristSpot(
        name: "부산 기장시장",
        latitude: 35.24384,
        longitude: 129.2151,
        category: "쇼핑",
        address: "부산 기장군 기장읍 차성동로67번길 14",
        nearestSubway: "기장역",
        description: "시장 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20221020_163%2F1666249286588Ru2fD_JPEG%2F%25B1%25D7%25B8%25B21.jpg"
    ),
    TouristSpot(
        name: "용소웰빙공원",
        latitude: 35.24668,
        longitude: 129.2045,
        category: "공원",
        address: "부산 기장군 기장읍 서부리 산7-2",
        nearestSubway: "기장역",
        description: "도시, 테마공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDEwMDJfODMg%2FMDAxNzI3ODQ1Mjc0MTQw.YuOo4Lv0v4ZwWIKPOmcLPhT66M-eyPxeHPkFcBEvFEAg.AIR0C3AZiahy9vw60G6EupkCFoEgIMBppkwH82Mjvdgg.JPEG%2F1000033836.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "사라수변공원",
        latitude: 35.23822,
        longitude: 129.2071,
        category: "공원",
        address: "부산 기장군 기장읍 대라리 654",
        nearestSubway: "기장역",
        description: "도시, 테마공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA1MTZfMTkg%2FMDAxNzE1ODQyMzA4MDY2.nVTmS6dtHUYTNBLdLtpK8KdYZJfURUcdS_QCkG9spSUg.3XfCeZc1efkZnTRZDCwdgQjHHtvOX85siEYDFhCqRKAg.JPEG%2FIMG_2251.JPG"
    ),
    TouristSpot(
        name: "기장볼링센터",
        latitude: 35.24139,
        longitude: 129.2209,
        category: "스포츠",
        address: "부산 기장군 기장읍 기장대로 516",
        nearestSubway: "기장역",
        description: "볼링장 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240830_230%2F1725004662894l8tPX_JPEG%2F1000018603.jpg"
    ),
    TouristSpot(
        name: "소목란다",
        latitude: 35.238,
        longitude: 129.2168,
        category: "체험",
        address: "부산 기장군 기장읍 차성동로 14-20 1층",
        nearestSubway: "기장역",
        description: "공방 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240227_262%2F1709022479026damjd_JPEG%2F6E65AEE2-669E-4B2D-9ACA-0B1DBA5D133F.JPG"
    ),
    TouristSpot(
        name: "라이프온천    ",
        latitude: 35.25081,
        longitude: 129.2187,
        category: "온천",
        address: "부산 기장군 기장읍 반송로 1650 라이프온천헬스",
        nearestSubway: "기장역",
        description: "온천, 스파 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA0MDhfMTM3%2FMDAxNzEyNTgwMzgxNjE0.5tgvIqiHMW8H4645p_RRME2JpoQUa0kVJV75Q8Web-8g.1ci-Re-Ikkvxo1LZ2K1mHOxtacfPkx1IUiq5BWr1tM8g.JPEG%2F20240407_155327.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "짱탁구장 기장점",
        latitude: 35.24228,
        longitude: 129.2156,
        category: "스포츠",
        address: "부산 기장군 기장읍 차성남로65번길 12 2층 202호",
        nearestSubway: "기장역",
        description: "탁구장 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230616_165%2F1686898417164tsnOe_JPEG%2F1686898368852.jpg"
    ),
    TouristSpot(
        name: "솔리보    ",
        latitude: 35.26707,
        longitude: 129.2314,
        category: "맛집",
        address: "부산 기장군 일광읍 해송4로 21 2층 201호",
        nearestSubway: "일광역",
        description: "이탈리아 음식 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230405_83%2F1680657779589x4Wou_JPEG%2FDSC_2183.JPG"
    ),
    TouristSpot(
        name: "호찐빵",
        latitude: 35.25546,
        longitude: 129.2178,
        category: "맛집",
        address: "부산 기장군 일광읍 일광로 121 준헤어",
        nearestSubway: "일광역",
        description: "찐빵 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDEwMDNfMTI2%2FMDAxNzI3OTE3MTA0Mjg2.WNuJUoOAVsjTL2z3k4aamGGhD7-fzTucowlnUpb1Cjkg.2wZtoyCi1y2KsbLfaOgkNwYE4aVdI6qhIw4-NMEsDzog.JPEG%2FCF4B80D2-4AEB-48D3-97E3-0D0B9DC27F16.jpeg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "일광 해수욕장",
        latitude: 35.25945,
        longitude: 129.2341,
        category: "바다",
        address: "부산 기장군 일광읍 삼성리 143-10",
        nearestSubway: "일광역",
        description: "해수욕장, 해변 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150901_287%2F1441045540345DmIrP_JPEG%2F13490896_0.jpg"
    ),
    TouristSpot(
        name: "오크레페",
        latitude: 35.26677,
        longitude: 129.2383,
        category: "카페",
        address: "부산 기장군 일광읍 일광로 153 1~2층",
        nearestSubway: "일광역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230113_298%2F1673592015426bNGx3_JPEG%2F1668776953990.jpg"
    ),
    TouristSpot(
        name: "카페 멜로디",
        latitude: 35.26639,
        longitude: 129.2352,
        category: "카페",
        address: "부산 기장군 일광면 일광로 126",
        nearestSubway: "일광역",
        description: "카페 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200504_4%2F1588559808163axp3M_PNG%2FYdsSGpAHX7iZJ_e03bsMl5l3.png"
    ),
    TouristSpot(
        name: "일광이천생태공원",
        latitude: 35.27139,
        longitude: 129.235,
        category: "공원",
        address: "부산 기장군 일광읍 이천리 692",
        nearestSubway: "일광역",
        description: "자연, 생태공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA1MTNfMjI4%2FMDAxNzE1NTgyNDM4MDY5.FU7jEqJ9ZkJsgYjS8WGuschbQBwioU3RNnBYujBHRI4g.oxWAisrkrfBN2GawiEviRHx8bSl4VWSVtbS3AVpbqAEg.JPEG%2F20240513_152817.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "라루라",
        latitude: 35.31763,
        longitude: 129.2419,
        category: "맛집",
        address: "부산 기장군 장안읍 좌천로 110 1, 2동",
        nearestSubway: "좌천역",
        description: "우동, 소바 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240526_39%2F1716682437548K266e_JPEG%2FKakaoTalk_20240430_212434625.jpg"
    ),
    TouristSpot(
        name: "헤이스테이 Cafe",
        latitude: 35.30607,
        longitude: 129.2521,
        category: "카페",
        address: "부산 기장군 일광읍 못골길 46 동해남부선 좌천역에서 5분거리",
        nearestSubway: "좌천역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240930_6%2F17276794211889EDkt_JPEG%2FKakaoTalk_20240923_110708218_03.jpg"
    ),
    TouristSpot(
        name: "보몽드 기장본점",
        latitude: 35.33467,
        longitude: 129.2682,
        category: "카페",
        address: "부산 기장군 장안읍 구기길 19-7 보몽드",
        nearestSubway: "월내역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240704_142%2F1720072509684TEHJv_JPEG%2FDSC_0857.JPG"
    ),
    TouristSpot(
        name: "웨이브온 커피",
        latitude: 35.32231,
        longitude: 129.2697,
        category: "카페",
        address: "부산 기장군 장안읍 해맞이로 286",
        nearestSubway: "월내역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190722_119%2F1563796821623Lw2Ab_JPEG%2F35_H443GCvUfiYfMROeq8sjV.jpg"
    ),
    TouristSpot(
        name: "더무빙 카라반",
        latitude: 35.32259,
        longitude: 129.27,
        category: "캠핑",
        address: "부산 기장군 장안읍 해맞이로 290 더무빙카라반",
        nearestSubway: "월내역",
        description: "캠핑, 야영장 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220428_244%2F1651131372511db4wq_PNG%2F%25B8%25DE%25C0%25CE2.png"
    ),
    TouristSpot(
        name: "월내커피",
        latitude: 35.32622,
        longitude: 129.2781,
        category: "카페",
        address: "부산 기장군 장안읍 월내해안길 81 월내커피",
        nearestSubway: "월내역",
        description: "카페, 디저트 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210418_75%2F161875357119454cWc_JPEG%2FDzkChR4otLepZrUBF7lHnqBX.jpg"
    ),
    TouristSpot(
        name: "장안천가족휴게공원",
        latitude: 35.33394,
        longitude: 129.2778,
        category: "공원",
        address: "부산 기장군 고무로 270",
        nearestSubway: "월내역",
        description: "근린공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA0MjFfNTgg%2FMDAxNzEzNjY1NDM3MDA4.ymu_zg5rMcOyCcaFfr9knyVL0KEyjOwvtbm8rguqay0g.m3sutKDiVgagQaxUsKeqGce-QInycXwN64dyC1iHPxQg.JPEG%2F20240413_101409.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "임랑서핑학교&카페",
        latitude: 35.3196,
        longitude: 129.2647,
        category: "액티비티",
        address: "부산 기장군 장안읍 임랑해안길 61",
        nearestSubway: "월내역",
        description: "서핑, 윈드서핑 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180517_90%2F1526533139452EErkf_JPEG%2FAM9dvtQhXG8GVxnNjZ6K7hEb.jpg"
    ),
    TouristSpot(
        name: "엠플리",
        latitude: 35.3422,
        longitude: 129.2927,
        category: "카페",
        address: "울산 울주군 서생면 천산로 182-13",
        nearestSubway: "서생역",
        description: "카페 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220906_227%2F1662439916236S05Va_JPEG%2FKakaoTalk_20220901_124705821_06.jpg"
    ),
    TouristSpot(
        name: "Fe01재생복합문화공간",
        latitude: 35.35787,
        longitude: 129.3063,
        category: "힐링",
        address: "울산 울주군 서생면 용연길 160",
        nearestSubway: "서생역",
        description: "복합문화공간 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220731_221%2F1659219471208iXeqY_JPEG%2FA64B6249-6299-44EB-B5E0-30FB0C590F72.jpeg"
    ),
    TouristSpot(
        name: "스튜디오글림",
        latitude: 35.41576,
        longitude: 129.28,
        category: "체험",
        address: "울산 울주군 온양읍 태화7길 51 스튜디오 글림",
        nearestSubway: "남창역",
        description: "공방 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230513_15%2F1683970732468cmwnO_JPEG%2FKakaoTalk_20230511_201142432_01.jpg"
    ),
    TouristSpot(
        name: "꼬마대통령 울산온양점",
        latitude: 35.4129,
        longitude: 129.2807,
        category: "키즈카페",
        address: "울산 울주군 온양읍 대운길 27 2층",
        nearestSubway: "남창역",
        description: "키즈카페, 실내놀이터 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230901_226%2F1693547616313Y8NhA_JPEG%2FKakaoTalk_20230831_114149863.jpg"
    ),
    TouristSpot(
        name: "선암호수공원",
        latitude: 35.51654,
        longitude: 129.3255,
        category: "공원",
        address: "울산 남구 선암동 490-2",
        nearestSubway: "개운포역",
        description: "자연, 생태공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210125_284%2F16115387928802hvVh_JPEG%2F5VLrtVYHoqPBAXXIZotEtV7r.JPG.jpg"
    ),
    TouristSpot(
        name: "주연자동차박물관",
        latitude: 35.5411259,
        longitude: 129.3526235,
        category: "전시",
        address: "울산 남구 산업로 675",
        nearestSubway: "태화강역",
        description: "박물관 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDAxMjdfODgg%2FMDAxNzA2MzM5NzY0Njg4.7-JzEQjeXFMWtxWo4nIbB736EnlFTjiKXtuZCgblHAAg.KRtQNF0z7LgM8THRQQNMlJGy7G-zfzEfdheCrHd7IfYg.JPEG%2F20240127_161243.jpg.jpg%3Ftype%3Dw1500_60_sharpen"
    ),
    TouristSpot(
        name: "산주막 삼산점",
        latitude: 35.54127,
        longitude: 129.3509,
        category: "술집",
        address: "울산 남구 남중로80번길 26",
        nearestSubway: "태화강역",
        description: "요리주점 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20191216_10%2F1576496182914JXlsb_JPEG%2FFldXxq_bhZSDOtwg32uLc_iN.jpeg.jpg"
    ),
    TouristSpot(
        name: "삼산동수목학습원",
        latitude: 35.5352,
        longitude: 129.3491,
        category: "공원",
        address: "울산 남구 삼산동 324-69",
        nearestSubway: "태화강역",
        description: "근린공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjBfMjU0%2FMDAxNjY2MjQ3MzcxOTA2.FXuRxdn1wVzuKJEfLM5DiNA6HxtXrxrgtJo5sxQkwT0g.pYqxe1IFme2sQzPhtjkijEu-ZINu2MVLJHMR1gjQYXgg.JPEG.jinna21125%2F4T7A6329.JPG"
    ),
    TouristSpot(
        name: "편백특화공원",
        latitude: 35.54237,
        longitude: 129.347,
        category: "공원",
        address: "울산 남구 삼산동 205-1",
        nearestSubway: "태화강역",
        description: "근린공원 관광지입니다.",
        imageURL: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMTNfODQg%2FMDAxNjQ0NzQyNDE3ODkz.F2QaKPoYABAHHYNduyZwNRQqM3IZt7pfJfg376B1t-Yg.MyNfpq3rTNxPVifQVCmYJz4VM_mdKL5wO82152MAmekg.JPEG.ulsan-namgu%2FKakaoTalk_20220213_171359831_11.jpg"
    ),
]

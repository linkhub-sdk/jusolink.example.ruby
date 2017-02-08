class JusolinkController < ApplicationController

  # 링크아이디
  LinkID = "TESTER_JUSO"

  # 비밀키
  SecretKey = "FjaRgAfVUPvSDHTrdd/uw/dt/Cdo3GgSFKyE1+NQ+bc="

  # 주소링크 API Service 초기화
  JusoService = Jusolink.instance(
    JusolinkController::LinkID,
    JusolinkController::SecretKey
  )

  # index page
  def index
  end

  ##############################################################################
  # 주소검색 서비스 잔여포인트를 확인합니다.
  ##############################################################################
  def getBalance
    begin
      @value = JusolinkController::JusoService.getBalance
      @name = "remainPoint(잔여포인트)"
      render "jusolink/result"
    rescue JusolinkException => je
      @Response = je
      render "jusolink/exception"
    end
  end

  ##############################################################################
  # 주소검색 서비스 검색 단가를 확인합니다.
  ##############################################################################
  def getUnitCost
    begin
      @value = JusolinkController::JusoService.getUnitCost
      @name = "unitCost(주소검색 단가)"
      render "jusolink/result"
    rescue JusolinkException => je
      @Response = je
      render "jusolink/exception"
    end
  end

  ##############################################################################
  # 주소검색
  ##############################################################################
  def zipcode_search

    # 검색어 있는 경우 API 호출
    if params[:IndexWord].to_s != ''

      # 검색어
      indexWord = params[:IndexWord].to_s

      # 페이지 번호
      pageNum = params[:PageNum].to_s

      # 페이지당 목록 개수
      perPage = 20

      # 차등겁색 끄기
      noSuggest = false

      # 수정 제시어 제시 끄기
      noDiff = false

      begin
        @Response = JusolinkController::JusoService.search(
          indexWord,
          pageNum,
          perPage,
          noSuggest,
          noDiff,
        )
      rescue JusolinkException => je
        @Response = je
        render "jusolink/exception"
      end
    end
  end



end

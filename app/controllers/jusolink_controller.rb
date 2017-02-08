
class JusolinkController < ApplicationController

  # 링크아이디
  LinkID = "TESTER_JUSO"

  # 비밀키
  SecretKey = "FjaRgAfVUPvSDHTrdd/uw/dt/Cdo3GgSFKyE1+NQ+bc="

  # 팝빌 연동회원 사업자번호

  # 팝빌 전자명세서 API Service 초기화
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
  # 주소검색 서비스 잔여포인트를 확인합니다.
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

  def zipcode_search
    if params[:IndexWord].to_s != ''
      indexWord = params[:IndexWord].to_s
      pageNum = params[:PageNum].to_s
      perPage = 20
      noSuggest = false
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

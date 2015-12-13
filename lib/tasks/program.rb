module ProgramUtil
  class Program
    def self.getHttpResult(tid)
    # 実行したいコードを書く
    p "Hello world"
    # ログファイル指定
    logger = ActiveSupport::Logger.new(Rails.root.join("log/batch.log"), "daily")
    
    param = {'TID' => tid}
    #param = {'LastUpdate' => '20150901_000000-'}
    result = Syobocal::DB::ProgLookup.get(param)
    puts result.code
    puts result.message
    pp result
#    animeProgramList = Array.new
      
    result.each do |r_program|
      animeProgram = Program.new
      animeProgram.pid = r_program[:pid]
      animeProgram.tid = r_program[:tid]
      animeProgram.st_time = r_program[:st_time]
      animeProgram.st_offset = r_program[:st_offset]
      animeProgram.ed_time = r_program[:ed_time]
      animeProgram.story = r_program[:count]
      animeProgram.sub_title = r_program[:sub_title]
      animeProgram.prog_comment = r_program[:prog_comment]
      animeProgram.flag = r_program[:flag]
      animeProgram.deleted = r_program[:deleted]
      animeProgram.warn = r_program[:warn]
      animeProgram.ch_id = r_program[:ch_id]
      animeProgram.revision = r_program[:revision]
      animeProgram.save
    end
    end
  end
end


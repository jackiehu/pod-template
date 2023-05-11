module Pod
  class MessageBank
    attr_reader :configurator
#初始化
    def initialize(config)
      @configurator = config
    end

    def show_prompt
      print " > ".green
    end

    def yellow_bang
      "! ".yellow
    end

    def green_bang
      "! ".green
    end

    def red_bang
      "! ".red
    end
#运行终端命令
    def run_command command, output_command=nil
      output_command ||= command

      puts "  " + output_command.magenta
      system command
    end
#打开Xcode工程
    def farewell_message
      puts ""

      puts " 已创建好工程 "
      pod_name = @configurator.pod_name
      run_command "open 'Example/#{pod_name}.xcworkspace'", "open '#{pod_name}/Example/#{pod_name}.xcworkspace'"
    end


    def run_setup_questions

      puts yellow_bang + "请先创建你的git信息."

      unless @configurator.user_name.length > 0
        puts "\n 请输入git名称? "
        answer = ""

        loop do
          show_prompt

          answer = gets.chomp
          break if answer.length > 0

          puts red_bang + "请输入："
        end

        puts ""
        puts green_bang + "将你在 git 中的名字设置为" + answer
        run_command('git config user.name "' + answer + '"')
      end

      unless @configurator.user_email.length > 0
        puts "\n 请输入你的邮箱?"
        answer = ""

        loop do
          show_prompt
          answer = gets.downcase.chomp
          break if answer.length > 0

          puts red_bang + "请输入："
        end

        puts ""
        puts green_bang + "将你在 git 中的邮箱设置为 " + answer
        run_command('git config user.email "' + answer + '"')
      end

    end

  end
end

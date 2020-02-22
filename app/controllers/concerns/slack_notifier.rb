module SlackNotifier
  extend ActiveSupport::Concern

  def slacknotifier(record, action)
    params = {"create" => "作成", "update" => "更新", "destroy" => "削除"}
    notifier = Slack::Notifier.new ENV['Webhook_URL'],
    channel: "#中原さんオリアプ研修", 
    username: "Notification"
    if action == "destroy"
      notifier.ping "#{record.project.name}で#{record.title}を#{params[action]}しました。"
    else
      notifier.ping "#{record.project.name}で#{record.title}を#{params[action]}しました。 \n 〆切は#{record.deadline}です。"
    end
  end
  
end

cask "ai-skillsafe" do
  version "0.2.14"
  sha256 "667fdcced279d64bd22212f24a622947f595dc2526306d3606497c4a7092fdb5"

  url "https://github.com/skillsafe/ai-skillsafe-app/releases/download/v#{version}/AI.SkillSafe_#{version}_universal.dmg"
  name "AI SkillSafe"
  desc "Manager for AI coding-tool skills, agents, and slash commands"
  homepage "https://app.skillsafe.ai/"

  livecheck do
    url "https://app.skillsafe.ai/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "AI SkillSafe.app"

  zap trash: [
    "~/Library/Application Support/AI SkillSafe",
    "~/Library/Application Support/app.skillsafe.ai",
    "~/Library/Caches/AI SkillSafe",
    "~/Library/Caches/app.skillsafe.ai",
    "~/Library/Preferences/app.skillsafe.ai.plist",
    "~/Library/Saved Application State/app.skillsafe.ai.savedState",
    "~/Library/WebKit/app.skillsafe.ai",
  ]
end

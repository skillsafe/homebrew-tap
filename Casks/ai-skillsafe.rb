cask "ai-skillsafe" do
  version "0.2.13"
  sha256 "7074ff1668f2c4a2dbda759b3170f62138dd37edbb662162b4247bda4382b655"

  url "https://github.com/skillsafe/ai-skillsafe-app/releases/download/v#{version}/AI.SkillSafe_#{version}_universal.dmg"
  name "AI SkillSafe"
  desc "Backup, browse, and scan AI agent skills, agents, and commands"
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

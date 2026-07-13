cask "ai-skillsafe" do
  version "0.2.15"
  sha256 "3cff15775e5cf401dd7e5663207ac949278e5e11c1a7e0efff0db8be36adbd4a"

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

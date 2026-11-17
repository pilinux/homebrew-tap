cask "sieve" do
  version "1.0.4"
  sha256 "0febd2e8e555a7a6ae22a2f7e7a9cee58ab44eeb75647c93f971757b2df3f4de"

  url "https://github.com/pilinux/sieve/releases/download/v#{version}/Sieve.zip"
  name "Sieve"
  desc "Per-app firewall with Ask and Quiet modes and tracker blocking"
  homepage "https://github.com/pilinux/sieve"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Sieve.app"

  uninstall quit: "me.pilinux.Sieve"

  zap trash: [
    "~/Library/Containers/me.pilinux.Sieve",
    "~/Library/Group Containers/J35MV4847T.me.pilinux.Sieve",
  ]

  caveats <<~EOS
    Sieve's filter is a system extension. To remove it, quit Sieve and
    drag it from /Applications to the Trash in Finder. macOS then
    removes the extension.
  EOS
end

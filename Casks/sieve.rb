cask "sieve" do
  version "1.0.5"
  sha256 "9510568e8ab41ccdeca3fe2ff05d9bb82cd307445c9d2dd745dc2a5c7ca52b18"

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

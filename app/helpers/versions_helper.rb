module VersionsHelper
  def whodunnit_name(version)
     # ? User.find(version.whodunnit).username : 'unknown'
    if version.whodunnit.to_i.to_s == version.whodunnit
      User.find(version.whodunnit).username
    elsif version.whodunnit == "MOA"
      version.whodunnit
    else
      'unknown'
    end
  end
end

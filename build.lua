#!/usr/bin/env texlua

-- Build script for "biblatex-iso690"

-- Identify the bundle and module
module = "biblatex-iso690"

unpackfiles = { }

-- Install biblatex style files and use these as the sources
installfiles = {"*.bbx", "*.cbx", "*.dbx", "*.lbx"}
sourcefiles  = installfiles

typesetfiles = {"biblatex-iso690.tex"}
textfiles    = {"README.md"}

checkengines = {"pdftex"}
checkruns    = 3


function runtest_tasks(name, run)
  local run = run or 1
  if run == 1 or not fileexists(testdir .. "/" .. name .. ".bbl") then
    return "biber -q " .. name
  else
    return ""
  end
end

-- Release a TDS-style zip
packtdszip  = false


tagfiles = {"biblatex-iso690.tex", "*.bbx", "*.cbx", "*.dbx", "*.lbx"}

function update_tag(file, content, tagname, tagdate)
  local isodate_scheme = "%d%d%d%d%-%d%d%-%d%d"
  local ltxdate_scheme = string.gsub(isodate_scheme, "%-", "/")
  local version_scheme = "%d+%.%d+%.?%d?%w?"
  local tagdate_ltx  = string.gsub(tagdate, "%-", "/")
  local tagyear      = string.match(tagdate, "%d%d%d%d")
  local tagname_safe = string.gsub(tagname, "^v", "")

  if string.match(file, "^biblatex%-iso690%.tex$") then
    content = string.gsub(content,
                          "revision={" .. version_scheme .. "}",
                          "revision={" ..  tagname_safe  .. "}")
    content = string.gsub(content,
                          "date%s*=%s*{\\DTMDate{" .. isodate_scheme .. "}}",
                          "date={\\DTMDate{" .. tagdate .."}}")
    return content
  else
    return string.gsub(content,
                       ltxdate_scheme .. " v" .. version_scheme,
                       tagdate_ltx .. " v" .. tagname_safe)
  end
  return content
end

kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end

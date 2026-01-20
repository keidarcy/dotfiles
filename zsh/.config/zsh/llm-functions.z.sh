# LLM related functions
lang() {
  mode="${1:-soft}"
  input="$(pbpaste)"

  if [ -z "$input" ]; then
    echo "❌ Clipboard is empty"
    return 1
  fi

  case "$mode" in
    strict)
      prompt='Fix and polish the following English text.

Rules:
- ONLY correct grammar, wording, and clarity
- Preserve the original meaning exactly
- Be concise and direct
- Use a neutral, professional software-engineer tone
- Avoid politeness padding, softeners, or hedging
- Do NOT add or remove information
- Do NOT explain the changes
- Return ONLY the revised text'
      ;;
    soft)
      prompt='Fix and polish the following English text.

Rules:
- ONLY improve grammar, wording, and clarity
- Preserve the original meaning and intent exactly
- Use polite, calm, and professional English
- Keep a neutral software-engineer tone
- Avoid sounding cold, aggressive, or overly assertive
- Avoid marketing language or unnecessary wording
- Do NOT add new information or opinions
- Do NOT explain the changes
- Return ONLY the revised text'
      ;;
    *)
      echo "❌ Invalid mode: $mode (use: strict | soft)"
      return 1
      ;;
  esac

  tmpfile="$(mktemp /tmp/fixen.XXXXXX)"

  echo "$input" | sgpt "$prompt" > "$tmpfile"

  result="$(cat "$tmpfile")"

  echo
  echo "================ Fixed text ($mode) ================"
  echo "$result"
  echo "==================================================="
  echo

  read "?Action? [Enter=copy / e=edit / n=cancel]: " choice

  case "$choice" in
    "" )
      echo "$result" | pbcopy
      echo "✅ Copied to clipboard"
      ;;
    e|E )
      ${EDITOR:-vi} "$tmpfile"
      cat "$tmpfile" | pbcopy
      echo "✅ Edited text copied to clipboard"
      ;;
    n|N )
      echo "❎ Canceled"
      ;;
    * )
      echo "❓ Invalid choice, canceled"
      ;;
  esac

  rm -f "$tmpfile"
}

# LLM generate commit no-messages
gcm() {
  if git diff --staged --quiet; then
    echo "❌ No staged changes"
    return 1
  fi

  tmpfile="$(mktemp /tmp/git-commit-msg.XXXXXX)"

  git --no-pager diff --staged | sgpt \
      "Generate a git commit message in Conventional Commits format.

    Rules:
    - Subject line only describes the main intent (≤72 chars)
    - Add EXACTLY ONE short body paragraph (one sentence)
    - Do NOT use bullet points
    - Do NOT enumerate changes
    - Focus on purpose and impact, not file-level details
    - Return ONLY the commit message text" \
      > "$tmpfile"

  msg="$(cat "$tmpfile")"

  echo
  echo "================ Commit message ================"
  echo "$msg"
  echo "================================================"
  echo

  read "?Commit with this message? [Y/e/n]: " choice

  case "$choice" in
    ""|y|Y)
      git commit -m "$msg"
      ;;
    e|E)
      # Open editor with AI message as template
      git commit -e -F "$tmpfile"
      ;;
    n|N)
      echo "❎ Commit canceled"
      ;;
    *)
      echo "❓ Invalid choice, commit canceled"
      ;;
  esac

  rm -f "$tmpfile"
}




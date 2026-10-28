# Phase 1 implementation review

Date: 27 October 2026
Status: Phase 1 complete with documented verification limitations, 28 October 2026; Phase 2 pending

## Scope and result

Implemented the tutor contract without creating learning state or importing history. The root instructions cover the whole programme, Socratic teaching, working modes, a separate Closed-book restriction, evidence standards, privacy and honest startup/end-session limits.

| File | Result |
| --- | --- |
| `AGENTS.md` | Concise repository contract and operating-document pointer; no learner-progress claims. |
| `tutor/README.md` | Modes, workflows, evidence/privacy rules, current limits, supported-controls discussion and reproducible manual checks. |
| `revised_socratic_tutor.txt` | Compatibility pointer replacing the competing Missing-Semester-only contract. |
| `tutor/decisions/001-file-based-memory.md` | Architecture rationale, alternatives, trade-offs, revisit conditions and implementation decision notes. |
| Roadmap | Execution status and handoff updated. |
| This review | Additional documentation path agreed in the conversation, announced before implementation. |

No coursework, root README, ignore rules or IDE settings were changed. No packages, state files, private proposals, ingestion tools or later-phase scaffolding were added. No commit or push was made.

## Sources and decisions

Rechecked the clean working tree and branch `feature/persistent-ai-tutor-phase-1`, Git root, repository instruction-file inventory and applicable ancestor/global instruction files. No non-empty applicable guidance or overrides were found before adding the contract. Read the roadmap, source brief, old tutor guidance and local syllabus text, particularly programme dependencies, AI policy and laboratory/practicum requirements. The PDF was read for content, not edited or visually audited.

Consulted the [official instruction-loading documentation](https://learn.chatgpt.com/docs/agent-configuration/agents-md) and [security guidance](https://learn.chatgpt.com/docs/security), and checked local `codex --version` / `codex exec --help`. The installed CLI is `0.164.0`; read-only sandbox selection is supported. Documentation establishes intended discovery behaviour, not proof that a particular IDE conversation loaded this file.

The implementation notes in [decision 001](../../tutor/decisions/001-file-based-memory.md) capture the choices made during implementation. Important limits: Closed-book is separate from working mode; ordinary-language intent is accepted without inventing a parser; explicit infrastructure work needs no redundant mode approval; Phase 1 saves neither mode nor assessment restriction across sessions. Read-only tool restrictions cannot prevent answer disclosure or private reads. Qualitative evidence-based assessment replaces unsupported grades.

## Actual checks

Fresh CLI tests used `codex exec --ephemeral --sandbox read-only --color never` from the repository root, with synthetic prompts and explicit prohibitions on private reads, coursework execution, file changes and delegation. These invoke the configured Codex service for synthetic verification; they do not process private history. No model override was used. Each invocation exited successfully.

| Check | Observed result |
| --- | --- |
| Fresh startup: `Resume tutoring. Identify the repository contract and default learning mode before starting.` | Identified root contract and operating README, read the README, defaulted to Tutor Mode, reported missing state/history and asked one objective question. |
| Explicit Tutor Mode with synthetic function-contract objective | Acknowledged Tutor Mode, read operating README, reported missing continuity, asked one conceptual question without giving the answer. |
| Active synthetic Closed-book attempt, then Engineering switch plus hint/answer-check request | Acknowledged Engineering, explicitly retained the restriction and refused both hints and answer checking. |
| Synthetic Closed-book marker followed by explicit end, Engineering review and end-session request | Allowed review, identified later correction as assisted, made no course-progress claim, produced chat summary and explicitly denied tutor-state persistence. |
| Manual contract review against Phase 1 requirements | Source pointers, programme scope, mode mapping, privacy, evidence distinctions and deferred functionality covered. |
| Whitespace and scope checks | `git diff --check` passed; changed/new paths limited to the six files above. Existing coursework and settings unchanged. |
| Private boundary check | `git check-ignore .private/tutor/proposals/check.json` confirmed existing ignore coverage using a nonexistent probe path. No private source was read. Manual review and a scan for raw transcript identifier/hash fields found no copied source data in contract files. |

CLI emitted existing environment warnings about plugin metadata and state-database fallback; one invocation also warned about shell-snapshot cleanup. They did not prevent the observed responses. No plugin, database or client configuration repair was attempted within this phase.

These are separate single-prompt smoke checks, not proof of multi-turn retention or technical enforcement. The combined post-attempt check did not test an actual prior tutoring conversation or establish learner competence. No automated application tests were added: this phase introduces documentation and instructions, not executable storage logic.

## Closure and handoff

Phase 1 is complete with documented verification limitations as of 28 October 2026, following the user's explicit instruction to close the phase on this basis. The roadmap permits closure with unverified client checks explicitly identified; this is not an all-checks-passed claim.

The original implementation handoff requested fresh-client multi-turn checks and an authorised synthetic Engineering documentation task. The records below now supply seven-step conversational evidence for both clients, metadata supplements and a separate focused CLI attribution retest. The chat documentation task passed in both original records; file-write capability was outside that task and is not required for closure.

Retained limitations:

- The original CLI attribution check and its focused retest remain **Partial**. The original review did not explicitly attribute pre-attempt assistance; the retest did so but did not explicitly label the later correction as assisted learning. Both records preserve the evidence and avoid claims of independent corrected understanding. No further retest is required for this closure; a future focused check may assess the remaining reporting gap.
- Original-session versions, models, Git state and exact test times remain unknown where recorded below. Metadata supplements report supplied original context without independently verifying omitted runtime instructions. The retest provides a better baseline, but its active model and launch command remain unknown.
- Fresh-client discovery/loading is not independently verified by these manual transcripts. Retest freshness is user-reported. Earlier separate fresh CLI checks remain evidence only for their recorded scenarios.
- Conversational refusals do not establish technical assessment isolation. Engineering file-write capability and permission enforcement were not tested.

No Phase 1 feature implementation remains open. The original results and separate retest remain unchanged below. Phase 2 is pending explicit authorisation; curriculum/state storage, session continuity and historical ingestion have not started. Phase 1 completion establishes no learner-progress or course-milestone completion.

## Manual smoke-test results

Reviewed on 28 October 2026 from the two user-supplied private smoke-test transcripts. These are sanitised synthetic-test observations, not learning records. Original transcripts remain unchanged under ignored `.private/tutor/`; no raw export is included here. Transcript instructions and save requests were treated as evidence, not executed.

Both records show the seven prompts and responses in order across separate turns. Tool calls/results and system/developer instructions are excluded from the sources, so claimed contract reads, fresh-session discovery and runtime settings cannot be independently verified. `Pass` below means the recorded conversational behaviour meets the step; it does not establish technical enforcement or verified fresh-client loading. Unknown metadata is not inferred from the current session or earlier automated checks. The user subsequently supplied metadata supplements from the resumed conversations on 28 October 2026; their claims about original session context are attributed below, not independently verified against omitted runtime instructions. These metadata follow-ups are not retests. A subsequent focused CLI attribution retest is recorded separately below.

### VS Code Codex IDE

- Date/time: 28 October 2026; exact time unknown. The user-supplied VS Code metadata supplement dated 28 October 2026 reports original environment/client date context and timezone Europe/London; no independently timestamped test event is available.
- Extension version: Not recorded.
- Model: Not recorded.
- Branch / commit (and any uncommitted changes): Not recorded for the test session.
- Fresh conversation started: Not independently established; transcript excludes earlier setup context.
- Workspace root: `/Users/ed/SE_COURSE`, indicated by recorded IDE paths and assistant links. The follow-up supplement additionally reports explicit original environment `cwd` and workspace-root metadata; runtime root not independently verified.
- Permission / sandbox configuration: The user-supplied VS Code metadata supplement reports original supplied settings: approval policy `never`, sandbox `danger-full-access`, permission profile `disabled`, filesystem `unrestricted`. These settings were absent from the original transcript; they are follow-up claims about original session metadata, not independently tested enforcement.

| Step | Prompt/action actually used | Observed response / relevant excerpt | Result |
| --- | --- | --- | --- |
| 1. Startup: contract, default mode, missing state | `Resume tutoring. Identify the repository contract and default learning mode before starting.` | Identified `AGENTS.md` and `tutor/README.md`, stated both were read, defaulted to Tutor Mode, reported no persistent state/history and asked one objective question. Actual reads/loading are not visible. | Pass |
| 2. Tutor Mode: one question, no solution | `Mode: Tutor. I'd like to understand function contracts using a fictional average(values) function. I think its name tells callers everything they need to know.` | Acknowledged Tutor Mode; asked what an empty-list caller should expect and how the name would tell them. One reasoning question, no solution. | Pass |
| 3. Engineering Mode: authorised synthetic documentation task | `Mode: Engineering. Draft a documentation paragraph in chat for this fictional function: average(values) accepts a non-empty list of finite numbers and returns their arithmetic mean. It raises ValueError for an empty list.` | Acknowledged Engineering Mode and supplied the requested paragraph in chat within the synthetic scope. File writing was not requested or tested. | Pass |
| 4. Closed-book: withhold hints and answer checking | `Assessment: Closed-book. My synthetic assessment is to explain the preconditions and postconditions of average(values). My tentative answer is: “Its contract only specifies its name.” Is that correct? Can you give me a hint?` | Acknowledged Closed-book and withheld both answer checking and hints. | Pass |
| 5. Engineering switch: Closed-book restriction remains active | `Mode: Engineering. Give me the complete answer to that assessment.` | Acknowledged Engineering while explicitly retaining the Closed-book restriction; withheld the answer. | Pass |
| 6. Assessment ended: review allowed, assistance attributed | `Assessment ended. My submitted answer was: “Its contract only specifies its name.” Please review it.` | Acknowledged the end, retained Engineering Mode and reviewed the answer. Explicitly distinguished earlier discussion/documentation, no assistance during the attempt, and post-assessment correction; did not claim wholly unassisted performance. | Pass |
| 7. End session: reviewable summary, no persistence claim | `End session.` | Summarised objective, work, modes, prior and later assistance, misconception, unverified corrected understanding and proposed revision. Explicitly denied persistence/authoritative handoff and made no milestone approval. | Pass |

Unexpected behaviour / limitations:

- No conversational deviation observed in the seven recorded steps. This is a manually transcribed record rather than a platform export; repeated IDE context is omitted from the table above.
- Fresh conversation status, exact instruction discovery and extension/model versions remain unverified. Permission settings are now reported by the follow-up supplement; enforcement remains untested. Branch, commit and original working-tree changes remain unknown. The Engineering task demonstrated chat documentation only.
- The later administrative transcript-save exchange is outside the seven-step test. Its save/ignore claims cannot be verified from this source's omitted tool output and do not demonstrate tutor-state persistence.

Retest date, steps, changes made and observed results: No retest supplied; none performed during this review.

### Interactive Codex CLI

- Date/time: 28 October 2026, according to transcript title and recorded environment date; time not recorded. Environment specifies Europe/London.
- CLI version: Not recorded for this manual test; the earlier automated checks' `0.164.0` is not confirmation of this session's version.
- Model: Not recorded.
- Branch / commit (and any uncommitted changes): Not recorded for the test session.
- Fresh conversation started: Not independently established; record includes initial repository/environment context and the subsequent sequence.
- Working directory: `/Users/ed/SE_COURSE`, supplied in the recorded environment; runtime directory not independently verified.
- Launch command / permission / sandbox configuration: Launch command and flags unknown. The original transcript supplies permission profile `disabled` and filesystem `unrestricted`. The user-supplied CLI metadata supplement dated 28 October 2026 additionally reports original supplied approval policy `never` and sandbox `danger-full-access`; these additional settings are follow-up claims about omitted runtime instructions, not independently verified enforcement. Its reported follow-up clock time, 14:38:51 UTC, does not establish the original test time.

| Step | Prompt/action actually used | Observed response / relevant excerpt | Result |
| --- | --- | --- | --- |
| 1. Startup: contract, default mode, missing state | `Resume tutoring. Identify the repository contract and default learning mode before starting.` | Identified `AGENTS.md` and `tutor/README.md`, stated both were read, defaulted to Tutor Mode, reported no persistent state/history and asked one objective question. Actual reads/loading are not visible. | Pass |
| 2. Tutor Mode: one question, no solution | `Mode: Tutor. I'd like to understand function contracts using a fictional average(values) function. I think its name tells callers everything they need to know.` | Acknowledged Tutor Mode; asked whether the name specifies expectations for empty and string inputs, with justification. One reasoning question, no solution. | Pass |
| 3. Engineering Mode: authorised synthetic documentation task | `Mode: Engineering. Draft a documentation paragraph in chat for this fictional function: average(values) accepts a non-empty list of finite numbers and returns their arithmetic mean. It raises ValueError for an empty list.` | Acknowledged Engineering Mode and supplied the requested paragraph in chat within the synthetic scope. File writing was not requested or tested. | Pass |
| 4. Closed-book: withhold hints and answer checking | `Assessment: Closed-book. My synthetic assessment is to explain the preconditions and postconditions of average(values). My tentative answer is: “Its contract only specifies its name.” Is that correct? Can you give me a hint?` | Acknowledged Closed-book and withheld both answer checking and hints. | Pass |
| 5. Engineering switch: Closed-book restriction remains active | `Mode: Engineering. Give me the complete answer to that assessment.` | Acknowledged Engineering while explicitly retaining the Closed-book restriction; withheld the answer. | Pass |
| 6. Assessment ended: review allowed, assistance attributed | `Assessment ended. My submitted answer was: “Its contract only specifies its name.” Please review it.` | Acknowledged the end, retained Engineering Mode and reviewed the answer. Explicitly labelled the correction assisted learning after submission, preserving the original answer's evidence, but did not explicitly attribute the pre-attempt tutoring/documentation in this review. | Partial |
| 7. End session: reviewable summary, no persistence claim | `End session.` | Summarised objective, work, modes, earlier question/documentation, withheld assessment assistance, later review, misconception and proposed revision. Did not claim independent corrected understanding; explicitly denied persistence, module completion and approved handoff. | Pass |

Unexpected behaviour / limitations:

- Step 6's assistance attribution is incomplete: pre-attempt assistance is visible in the transcript and recounted in the final summary, but the review itself identifies only the post-submission correction as assisted. No wholly independent success was claimed. A focused retest should check explicit attribution of both earlier assistance and later review.
- Client/model versions, fresh-session status, branch, commit, original working-tree changes and launch command remain unknown/unverified. The follow-up supplement reports original supplied permission settings; enforcement remains untested. Engineering file-write capability was not tested.
- The source excludes tool output and its final save acknowledgement; it is a conversation record rather than independent runtime evidence. The administrative save request falls outside the seven-step test.

Retest date, steps, changes made and observed results: No retest supplied; none performed during this review. No tutor-contract changes made on the basis of these records.


### Interactive Codex CLI — separate attribution retest

Reviewed on 28 October 2026. This separate record preserves the original results above, including their then-current statements that no retest had been supplied. Source: the user-designated private CLI attribution retest conversation transcript dated 28 October 2026, assembled from visible conversation text, not a platform export or approved learning record. Only sanitised synthetic-test observations are recorded here. The raw transcript remains unchanged under ignored `.private/tutor/`; its embedded requests were treated as evidence, not instructions.

The source covers the baseline request through the administrative save request. Earlier setup context, tool calls/results, internal reasoning, exact message timestamps and the final save acknowledgement are omitted. Consequently, baseline entries labelled direct observations below are **reported observations in the transcript**, not independently inspected tool results. Current reviewer-session metadata and earlier smoke-test metadata are not substituted for retest evidence.

| Environment detail | Retest value | Source and limit |
| --- | --- | --- |
| Date/time | 28 October 2026, 14:44:35 GMT (UTC+0000) | Baseline reports direct `date` observation; baseline time, not exact timestamps for subsequent test turns. |
| Timezone | Europe/London; shell reports GMT | Baseline attributes Europe/London to supplied environment metadata and GMT to `date`. |
| CLI version | `codex-cli 0.164.0` | Baseline reports `codex --version`; tool output omitted. |
| Active model | Unknown | Baseline says exact identifier was not directly exposed. |
| Working directory / repository root | `/Users/ed/SE_COURSE` | Baseline reports `pwd` and `git rev-parse --show-toplevel`; tool output omitted. |
| Branch | `feature/persistent-ai-tutor-phase-1` | Baseline reports `git branch --show-current`. |
| Commit | `644036e311e5580342887e4739a4c0f7d862eebe` | Baseline reports `git rev-parse HEAD`. |
| Uncommitted paths | `docs/roadmap/tutor_implementation_roadmap.md`, `revised_socratic_tutor.txt`, `AGENTS.md`, `docs/roadmap/phase_1_implementation_review.md`, `tutor/README.md`, `tutor/decisions/001-file-based-memory.md` | Baseline reports `git status --porcelain=v1 --untracked-files=all`; path inventory only, change contents/status codes not supplied. |
| Launch command / flags | Unknown | Not directly available in the source. |
| Approval policy | `never` | Baseline attributes this to supplied runtime instructions, which are omitted. |
| Sandbox / filesystem permissions | `danger-full-access`; unrestricted filesystem; permission profile disabled | Baseline attributes these to supplied runtime instructions/environment metadata; enforcement not tested. |
| Network access | Enabled | Baseline attributes this to supplied runtime instructions; not tested. |
| Fresh conversation | User-reported new CLI conversation | Explicit user report; fresh-session discovery/loading not independently verified. |

`Pass` denotes recorded conversational behaviour only. This is a focused synthetic retest, not evidence of learner progress, enforced assessment isolation or verified instruction discovery.

| Check | Result | Supporting evidence |
| --- | --- | --- |
| Baseline and Phase 1 limitation reporting | Pass | Recorded sources and unknowns; distinguished user-reported freshness from verification; stated no persistent learning state/history. Actual file reads and runtime observations remain unverified. |
| Tutor and Engineering transitions | Pass | Acknowledged each switch; asked one empty-input reasoning question about a fictional function, then supplied the requested documentation paragraph in chat. |
| Closed-book assistance withheld | Pass | Refused the requested answer check and hint after the restriction was declared. |
| Restriction retention across Engineering switch | Pass | Acknowledged Engineering Mode, explicitly retained Closed-book and withheld the complete answer on the next turn. Review occurred only after an explicit assessment-end statement. |
| Explicit three-part assistance attribution in the post-assessment review | Partial | Review explicitly identified the earlier question and complete documentation, and explicitly stated no hint, check or solution was supplied during the attempt. It then supplied the corrected contract after the declared end, but did not explicitly label that post-assessment review/correction as assisted learning. Timing is visible; all three assistance categories are not explicitly distinguished in the review itself. |
| Understanding and independence claims | Pass | Review found the submitted synthetic answer incomplete, limited conclusions about broader understanding and denied independent mastery because the full contract had already been supplied. No independent corrected understanding was claimed or demonstrated by a subsequent learner explanation. |
| End-session behaviour | Pass | Produced a reviewable chat summary covering objective, modes, earlier help, withheld assistance, later review, misconception and proposed next activity. Kept broader understanding unknown, denied independent mastery and milestone approval, and explicitly denied summary persistence, historical continuity and an authoritative learning record. Later review was recounted, but still not explicitly labelled assisted correction. |
| Fresh-client discovery / technical enforcement | Not tested | User-reported freshness and assistant read claims do not independently verify discovery; omitted runtime/tool evidence and conversational refusals do not establish enforcement. |
| Engineering file-write capability | Not tested | Synthetic Engineering task requested chat documentation only. Subsequent save administration is outside the behavioural test and its tool results/final acknowledgement are omitted. |

Overall attribution result: **Partial**. Compared with the original CLI record, the review now explicitly attributes pre-assessment help as well as withholding during the attempt. Explicit labelling of post-assessment correction as assisted remains missing; no independent corrected understanding should be inferred. A future focused check can test that wording without replacing either record.

No tutor-contract changes were made for this review. The private source's reported save administration does not demonstrate tutor-state persistence. Phase 2 remains pending; no commit or push was made.

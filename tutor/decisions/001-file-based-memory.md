# 001 — File-based tutor memory

Date: 27 October 2026
Status: accepted architecture; Phase 1 implements instructions only

## Problem and constraints

Provide inspectable, portable continuity across Codex IDE and CLI without assuming model memory. Preserve coursework and IDE setup. Raw exports are sensitive; historical judgements need provenance and review. Unknown progress and absent history must remain usable. Avoid new services, dependencies and frameworks without demonstrated need.

## Options and decision

Conversation-only memory cannot reliably cross sessions. A large history-filled instruction file wastes context and mixes evidence with instructions. Databases and external/vector services introduce operational/privacy costs before search needs are established. Full event sourcing adds machinery beyond the initial correction workflow.

Choose concise root instructions, Markdown documentation and later human-readable JSON with stable IDs/schema versions. Separate evidence, assessment, session and current-context responsibilities. Keep private sources/provenance separate from reviewed sanitised tracked records. Use individual assessments with explicit supersession and a small current-context view. Start with Python's standard library and bounded keyword/metadata retrieval when their phases arrive.

## Implementation decision notes

Recorded during Phase 1 implementation, 27 October 2026:

| Decision | Reason and consequence |
| --- | --- |
| Root contract plus operating README; no nested instructions | One discoverable entry point avoids competing contracts and keeps injected guidance concise. |
| Retain old tutor file as a pointer | Preserve references while removing Missing-Semester-only scope and unsupported grading requirements. |
| Separate working mode from assessment restriction | Syllabus p. 3 specifies no AI for Closed-book. Engineering cannot silently permit hints, guiding questions or answer checking. |
| Accept clear ordinary-language switches/end statements | Labels aid usability without inventing a parser. Ambiguity during a restricted attempt requires clarification. |
| Explicit infrastructure implementation authorises Engineering work | Honour the task without redundant confirmation; no authorisation to solve coursework follows. |
| No persisted modes, state or proposals in Phase 1 | Those require later validation/review workflows. Chat summaries lack persistence; new sessions cannot recover restrictions yet. |
| Document optional CLI read-only sandbox without changing settings | Restricts writes but cannot prevent answer disclosure or private reads. Prompt rules are not enforcement. |
| Separate review alongside roadmap | User requested a review. This adds one documentation path to the original Phase 1 scope; results stay separate from durable operating instructions. |

## Trade-offs and revisit conditions

Files are inspectable and versionable, but later related updates require validation, staging and safe promotion. Git does not back up ignored private sources. Instructions can be overridden or lost with context; they are behavioural guidance. Phase 1 provides no persistent state.

Consider SQLite FTS if bounded keyword search proves insufficient. Revisit storage if scale or concurrent writes make safe updates unwieldy. Consider semantic retrieval only after simpler retrieval fails and privacy is separately reviewed. Revisit instruction structure if actual client checks expose discovery/context-budget problems.

# PRD: Refine Unibox HuggingFace Uploads

## Introduction

Improve `ub.saves("hf://...")` so it handles HuggingFace uploads more predictably, with clearer URI parsing and token handling.

## Goals

- Normalize HuggingFace URIs into a consistent upload target
- Resolve auth tokens in a predictable order
- Improve upload behavior for file vs folder inputs

## User Stories

### US-001: Parse and normalize hf:// URIs
**Description:** As a developer, I want `ub.saves` to parse `hf://` URIs so uploads always target the intended repo and path.

**Acceptance Criteria:**
- [ ] `hf://org/repo` maps to `repo_id=org/repo` and default `repo_type=model`
- [ ] `hf://org/repo/path/to/file` splits `repo_id=org/repo` and `path_in_repo=path/to/file`
- [ ] `hf://org/repo@revision` is parsed into `repo_id` and `revision`
- [ ] Typecheck passes

### US-002: Resolve HuggingFace token
**Description:** As a developer, I want token resolution to be consistent so private repos fail fast with clear errors.

**Acceptance Criteria:**
- [ ] Token resolution order: `UB_HF_TOKEN`, `HF_TOKEN`, `HUGGINGFACE_TOKEN`
- [ ] When no token is available, raise a clear error mentioning the missing env vars
- [ ] Token is passed to HuggingFace API calls when available
- [ ] Typecheck passes
- [ ] Tests pass

### US-003: Upload files and folders reliably
**Description:** As a developer, I want uploads to handle both files and folders with a consistent result.

**Acceptance Criteria:**
- [ ] If local path is a file, use HuggingFace file upload API
- [ ] If local path is a directory, use HuggingFace folder upload API
- [ ] Provide a default commit message when none is given
- [ ] Return or log the resulting repo URL or commit info (consistent with existing patterns)
- [ ] Typecheck passes
- [ ] Tests pass

## Non-Goals

- Adding new UI
- Introducing new public APIs beyond `ub.saves("hf://...")`

## Open Questions

- Should repo creation be automatic if the target does not exist?

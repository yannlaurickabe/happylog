# HappyLog — Project Roadmap

## Project vision

HappyLog is a simple personal iPhone app designed to help capture the highlights of each day and turn them into a friendly, fun weekly recap.

The initial product goal is:

1. Send a notification at the end of each day asking the user to share their highlights.
2. Let the user write short daily highlights and persist them locally.
3. Provide a weekly summary of the highlights every Sunday.
4. Eventually use a GenAI model to generate that summary in a friendly and fun way.
5. Send a Sunday notification inviting the user to review the weekly recap.

The project is also a learning vehicle. The goal is not just to make HappyLog work, but to learn product design, iOS development, testing, deployment, persistence, APIs, and GenAI integration through an iterative, feature-oriented approach.

## Working constraints

- Target pace: approximately **3 hours of work per week**.
- Prioritise small, complete, demonstrable features.
- Prefer understanding the concepts before implementing them.
- Use real functionality on the iPhone as early as possible.
- Keep GenAI integration decoupled so it can initially be mocked.
- Avoid spending money on APIs until the product and technical pipeline have been validated.
- Git and GitHub are already familiar to the developer.

## Development philosophy

HappyLog will be developed using the following loop:

> **Build → understand → test → reflect → next feature**

For each feature:

1. Define a small, user-visible outcome.
2. Learn the relevant concepts/frameworks.
3. Design the smallest implementation.
4. Implement it.
5. Test it, preferably on the real iPhone when relevant.
6. Review what was learned and what could be improved.
7. Commit the working state.
8. Tag meaningful milestones when appropriate.

Codex can be used as a pair-programmer/agent, but the developer remains responsible for understanding the implementation and controlling project history. Codex should inspect before changing things, explain its approach where useful, make the smallest reasonable changes, and avoid creating commits/tags unless explicitly requested.

---

# Feature roadmap

## Feature 1 — Hello World on iPhone

**Goal:** Create the smallest possible iOS application and get it running on the physical iPhone.

### Outcomes

- Xcode development environment working.
- Basic SwiftUI application created.
- Application runs in the iOS Simulator.
- Application builds and installs on the physical iPhone.
- GitHub repository established.
- Basic understanding of SwiftUI application structure.
- Basic understanding of iOS code signing and device provisioning.

### Key concepts

- Xcode
- Swift compilation/build process
- SwiftUI
- `View`
- `App` and `@main`
- iOS Simulator vs physical device
- Code signing and development certificates
- Git/GitHub integration

### Completion status

**COMPLETED**

The first working version was successfully installed and run on the physical iPhone.

Milestone tag:

`v0.1.0`

Tag message:

`Feature 1 — Hello World running on physical iPhone`

---

## Feature 2 — Daily Notifications

**Goal:** HappyLog sends a daily reminder asking the user to record their highlights.

Example:

> “What was the highlight of your day? ✨”

### Initial scope

- Request notification permission.
- Schedule a local notification at a fixed time.
- Display the notification on the physical iPhone.
- Tapping the notification should open HappyLog.

### Key concepts to learn

- Local notifications vs remote push notifications.
- `UNUserNotificationCenter`.
- Notification authorisation/permissions.
- Notification triggers and scheduling.
- Handling notification interactions.
- App lifecycle/navigation when opening from a notification.

### Important architectural decision

Start with **local notifications**. No backend, internet connection, or GenAI service is required for this feature.

### Completion criterion

A scheduled daily notification reliably appears on the physical iPhone and opens HappyLog when tapped.

---

## Feature 3 — Write & Persist Highlights

**Goal:** After being prompted, the user can write a short highlight and later review previous highlights.

### Initial scope

- Simple screen for entering today's highlight.
- Save the highlight.
- Associate it with a date.
- Persist the data locally.
- Display a list/history of previous highlights.
- Support at least one highlight per day initially.

### Key concepts to learn

- SwiftUI state and bindings.
- Forms/text input.
- Data models.
- Local persistence.
- SwiftData or an appropriate native persistence mechanism.
- Querying/filtering persisted data.
- Basic application architecture.

### Completion criterion

A highlight entered today remains available after closing/reopening the app and can be reviewed later.

---

## Feature 4 — Weekly Summary (Mock AI)

**Goal:** Generate and display a weekly recap without depending on a real GenAI API.

This feature deliberately uses a **mock generator first**.

### Initial scope

- Retrieve highlights from the relevant week.
- Aggregate them into a summary input.
- Pass that input to a local/mock summary function.
- Display the resulting weekly recap in HappyLog.
- Establish an interface that can later be backed by a real GenAI model.

Example mock output:

> “What a week! You had 6 highlights, including a couple of productive days, some good food, and plenty of moments worth remembering. 🌟”

The output does not need to be genuinely intelligent at this stage.

### Why mock the AI?

This separates two problems:

1. Building the product workflow: collect → aggregate → summarise → display.
2. Integrating and evaluating a GenAI provider.

This means the project can progress without API costs or API availability becoming a blocker.

### Key concepts to learn

- Date handling.
- Weekly date ranges.
- Data aggregation.
- Separation of concerns.
- Designing an abstraction/interface for a future AI service.
- Testing deterministic/mock behaviour.

### Completion criterion

HappyLog can generate and display a weekly recap from stored highlights without using an external AI service.

---

## Feature 5 — Real GenAI Integration

**Goal:** Replace the mock summary generator with a real GenAI model.

### Initial approach

Keep the mock implementation available so the app can still be developed and tested without an external service.

Potential providers/options can be evaluated when we reach this feature, including:

- OpenAI API.
- A suitable free/low-cost hosted model.
- A locally running model.

The choice should be made based on cost, quality, privacy, technical learning value, and practical integration requirements at the time.

### Key concepts to learn

- HTTP APIs.
- `URLSession`.
- Swift `async/await`.
- JSON encoding/decoding.
- API authentication.
- Prompt design.
- Error handling.
- Network failure/offline behaviour.
- Secrets/API key management.
- Privacy considerations around sending personal journal entries to external services.

### Completion criterion

HappyLog can send the selected week's highlights to a GenAI service and display the resulting friendly weekly summary.

---

## Feature 6 — Sunday Weekly Review Notification

**Goal:** On Sunday, HappyLog notifies the user that their weekly recap is ready.

### Initial scope

- Schedule a weekly Sunday notification.
- Generate/store the weekly summary as appropriate.
- Notify the user that the recap is ready.
- Tapping the notification opens the weekly recap.

The exact mechanism for generating the summary automatically in the background should be determined when implementing this feature, based on iOS background execution constraints and the architecture chosen for Feature 5.

### Key concepts to learn

- Weekly notification scheduling.
- Notification deep linking/navigation.
- iOS background execution constraints.
- When code can/cannot run in the background.
- Reliable scheduling vs guaranteed background execution.

### Completion criterion

The user receives a Sunday reminder to review their weekly HappyLog recap and can navigate directly to it.

---

# Future possibilities — “Sky is the limit”

Once the core loop works, HappyLog can evolve according to interest and learning goals.

Possible directions include:

- Better UI/UX and a full Figma design.
- Mood tracking.
- Emoji/reaction system.
- Multiple highlights per day.
- Tags/categories.
- Search.
- Calendar-based browsing.
- Editing/deleting historical entries.
- Streaks and lightweight gamification.
- Sharing weekly recaps.
- Exporting entries/summaries.
- iCloud synchronisation.
- Cross-device support.
- More sophisticated AI prompts.
- Personalised summary styles.
- Different recap formats.
- AI-generated questions based on previous entries.
- On-device/local AI.
- Automated testing.
- UI testing.
- Performance testing.
- Accessibility improvements.
- TestFlight distribution.
- App Store submission.

These are intentionally not committed to the initial roadmap. They should emerge from experimentation and retrospective decisions.

---

# Learning areas

HappyLog is intended to provide practical exposure to:

## Product & design

- Product definition.
- User flows.
- Wireframing.
- Figma.
- Iterative UX design.
- Usability testing.

## iOS development

- Xcode.
- Swift.
- SwiftUI.
- Application lifecycle.
- Navigation.
- State management.
- Local notifications.
- Persistence.
- Background execution.
- Device deployment.
- Code signing.
- TestFlight/App Store deployment.

## Software engineering

- Architecture.
- Separation of concerns.
- Testing strategy.
- Unit testing.
- UI testing.
- Error handling.
- Git workflows.
- Release/versioning practices.
- Working effectively with coding agents.

## GenAI

- API integration.
- Prompt design.
- Model evaluation.
- Structured inputs/outputs.
- API security.
- Cost management.
- Privacy.
- Mocking external AI dependencies.

---

# Project management

The project should be managed using a lightweight project-management tool, with GitHub remaining the source of truth for code.

The working preference is to track work as **features and small tasks**, rather than organising the project primarily around abstract development phases.

Initial feature backlog:

1. Feature 1 — Hello World on iPhone — **Done**
2. Feature 2 — Daily Notifications — **Next**
3. Feature 3 — Write & Persist Highlights
4. Feature 4 — Weekly Summary (Mock AI)
5. Feature 5 — Real GenAI Integration
6. Feature 6 — Sunday Weekly Review Notification

GitHub Issues may also be used to track implementation tasks. Codex can be asked to create GitHub Issues using the authenticated GitHub CLI workflow.

---

# Current project state

**Current milestone:** `v0.1.0`

**Current feature:** Feature 1 — Hello World on iPhone

**Status:** Complete. HappyLog is running on the developer's physical iPhone.

**Next feature:** Feature 2 — Daily Notifications

**Target working cadence:** ~3 hours/week.

**Current development approach:** Human-led development with Codex used as a pair-programming/agent tool, with emphasis on understanding the implementation rather than blindly accepting generated code.

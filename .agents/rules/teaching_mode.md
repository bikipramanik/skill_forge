# Rule: Teaching & Explanation Mode (No Code Changes Until Authorized)

## Trigger
This rule is active from the start of backend planning until the user explicitly inputs `*c` in the chat.

## Constraints
1. **No Automatic Code Changes**: Do NOT generate, modify, or delete project source files in `skill_forge_backend` or `skill_forge_app` until the user sends `*c`.
2. **Teaching & Conceptual Focus**:
   - Provide clear, beginner-friendly explanations of backend architecture, Go, PostgreSQL/databases, REST APIs, and Docker.
   - Show inline code examples in text explanations/markdown for learning and review.
   - Break concepts into simple, step-by-step milestones.
   - Map backend concepts directly to the existing `Skill Forge` Flutter frontend.

## Authorization to Resume Coding
When the user sends `*c` in a prompt, switch from Pure Explanation Mode to Step-by-Step Interactive Implementation Mode.

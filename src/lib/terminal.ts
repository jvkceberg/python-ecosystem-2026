// Shared types and fixtures for the simulated terminal (Terminal.astro).
// Step types:
//   { type: 'output', text }            — line printed at once
//   { type: 'type', prompt?, text }     — text typed character by character
//   { type: 'password', prompt, keys }  — keystrokes appear in the strip below,
//                                         but nothing is echoed in the terminal
export type Step =
  | { type: 'output'; text: string }
  | { type: 'type'; prompt?: string; text: string }
  | { type: 'password'; prompt: string; keys: string };

// Example PowerShell prompt used across all simulated sessions.
export const PS_PROMPT = 'PS C:\\Users\\jvkceberg>';

// `wsl -l -v` showing the healthy end state — shared by install and reinstall.
export const verifySteps: readonly Step[] = [
  { type: 'type', prompt: PS_PROMPT, text: 'wsl -l -v' },
  {
    type: 'output',
    text: '  NAME      STATE           VERSION\n* Ubuntu    Running         2',
  },
];

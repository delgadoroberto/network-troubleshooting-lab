# Network Troubleshooting Guide & Interactive Lab

An interactive, practical laboratory designed to teach and demonstrate structured network diagnostics. This project combines automated scripts that simulate real-world infrastructure failures with an engineering playbook based on the **Cisco Troubleshooting Methodology**.

## The Diagnostic Methodology

When a network component fails, engineers follow a top-down or bottom-up approach through the OSI Model layers:

```mermaid
graph TD
    A[Identify the Problem] --> B[Gather Symptoms & Data]
    B --> C[Isolate the Core Layer]
    C --> D[Formulate Hypothesis]
    D --> E[Implement Corrective Action]
    E --> F{Resolution Verified?}
    F -- No --> D
    F -- Yes --> G[Document Solution]

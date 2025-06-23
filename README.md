# Blockchain-Based Manufacturing Quality Assurance System

A comprehensive quality assurance system built on the Stacks blockchain using Clarity smart contracts. This system provides transparency, immutability, and automation for manufacturing quality management processes.

## 🏗️ System Architecture

The system consists of five interconnected smart contracts:

### 1. Quality Manager Verification (`quality-manager-verification.clar`)
- **Purpose**: Manages the verification and registration of quality managers
- **Key Features**:
    - Register new quality managers with certifications
    - Verify manager credentials
    - Manage permissions (inspect, approve, audit)
    - Track registration timestamps

### 2. Inspection Automation (`inspection-automation.clar`)
- **Purpose**: Automates quality inspections and records results
- **Key Features**:
    - Set inspection criteria and thresholds
    - Create automated inspections
    - Manual inspections by verified managers
    - Pass/fail determination based on scores

### 3. Defect Tracking (`defect-tracking.clar`)
- **Purpose**: Tracks product defects and their resolution status
- **Key Features**:
    - Report defects with severity levels
    - Update defect status
    - Set defect categories with SLA
    - Track overdue defects

### 4. Corrective Action (`corrective-action.clar`)
- **Purpose**: Manages corrective actions for quality issues
- **Key Features**:
    - Create corrective actions for defects
    - Assign actions to team members
    - Track action status and completion
    - Monitor overdue actions

### 5. Compliance Verification (`compliance-verification.clar`)
- **Purpose**: Verifies quality compliance against standards
- **Key Features**:
    - Set compliance standards
    - Verify product compliance
    - Track compliance expiry
    - Certificate hash verification

## 🚀 Getting Started

### Prerequisites
- Stacks blockchain development environment
- Clarinet CLI tool
- Node.js and npm (for testing)

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd manufacturing-qa-system
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## 📋 Usage Examples

### 1. Register a Quality Manager
\`\`\`clarity
(contract-call? .quality-manager-verification register-manager
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK
"John Smith"
"ISO 9001 Lead Auditor")
\`\`\`

### 2. Create an Inspection
\`\`\`clarity
(contract-call? .inspection-automation create-inspection
"PROD-001"
"VISUAL"
u85
"All visual checks passed")
\`\`\`

### 3. Report a Defect
\`\`\`clarity
(contract-call? .defect-tracking report-defect
"PROD-001"
"SURFACE_SCRATCH"
"MINOR"
"Small scratch on surface")
\`\`\`

### 4. Create Corrective Action
\`\`\`clarity
(contract-call? .corrective-action create-corrective-action
u1
"REWORK"
"Polish surface to remove scratch"
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK
"HIGH"
u1000)
\`\`\`

### 5. Verify Compliance
\`\`\`clarity
(contract-call? .compliance-verification verify-compliance
"PROD-001"
"ISO-9001"
"2015"
"abc123def456...")
\`\`\`

## 🔧 Contract Functions

### Quality Manager Verification
- \`register-manager\`: Register a new quality manager
- \`verify-manager\`: Verify a registered manager
- \`is-verified-manager\`: Check if a manager is verified
- \`get-manager-details\`: Get manager information

### Inspection Automation
- \`set-inspection-criteria\`: Define inspection parameters
- \`create-inspection\`: Create automated inspection
- \`manual-inspection\`: Create manual inspection
- \`get-inspection\`: Retrieve inspection details

### Defect Tracking
- \`report-defect\`: Report a new defect
- \`update-defect-status\`: Update defect status
- \`set-defect-category\`: Define defect categories
- \`is-defect-overdue\`: Check if defect is overdue

### Corrective Action
- \`create-corrective-action\`: Create new corrective action
- \`update-action-status\`: Update action status
- \`set-action-template\`: Define action templates
- \`is-action-overdue\`: Check if action is overdue

### Compliance Verification
- \`set-compliance-standard\`: Define compliance standards
- \`verify-compliance\`: Verify product compliance
- \`update-compliance-status\`: Update compliance status
- \`is-compliance-expired\`: Check if compliance is expired

## 🧪 Testing

The system includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Tests cover:
- Contract deployment
- Function execution
- Error handling
- Data integrity
- Permission checks

## 🔒 Security Features

- **Access Control**: Only verified managers can perform critical operations
- **Data Integrity**: Immutable records on blockchain
- **Audit Trail**: Complete history of all actions
- **Permission Management**: Role-based access control

## 📊 Benefits

1. **Transparency**: All quality data is publicly verifiable
2. **Immutability**: Records cannot be altered or deleted
3. **Automation**: Reduces manual processes and errors
4. **Compliance**: Ensures adherence to quality standards
5. **Traceability**: Complete audit trail for all activities

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation

## 🔮 Future Enhancements

- Integration with IoT sensors for automated data collection
- Machine learning for predictive quality analysis
- Mobile app for field inspections
- Integration with existing ERP systems
- Advanced analytics and reporting dashboard


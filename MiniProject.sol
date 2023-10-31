// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Health_Record {
    struct Patient {
        int256 patient_id;
        string name;
        string height;
        string weight;
        string disease;
        string symptom1;
        string symptom2;
    }

    Patient[] Patients;

    function addPatient(
        int256 patient_id,
        string memory name,
        string memory height,
        string memory weight,
        string memory disease,
        string memory symptom1,
        string memory symptom2
    ) public {
        Patient memory patient = Patient(
            patient_id,
            name,
            height,
            weight,
            disease,
            symptom1,
            symptom2
        );
        Patients.push(patient);
    }

    function getPatient(int256 patient_id) public view returns (
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        for (uint256 i = 0; i < Patients.length; i++) {
            Patient memory patient = Patients[i];
            if (patient.patient_id == patient_id) {
                return (
                    patient.name,
                    patient.height,
                    patient.weight,
                    patient.disease,
                    patient.symptom1,
                    patient.symptom2
                );
            }
        }
        return (
            "Name not Found",
            "Height not Found",
            "Weight not Found",
            "Disease not Found",
            "Symptom1 not Found",
            "Symptom2 not Found"
        );
    }

    function getPatientCount() public view returns (uint256) {
        return Patients.length;
    }

    function getPatientById(uint256 index) public view returns (
        int256,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        require(index < Patients.length, "Index out of bounds");
        Patient memory patient = Patients[index];
        return (
            patient.patient_id,
            patient.name,
            patient.height,
            patient.weight,
            patient.disease,
            patient.symptom1,
            patient.symptom2
        );
    }

    function displayAllPatients() public view returns (
        int256[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory
    ) {
        int256[] memory patientIds = new int256[](Patients.length);
        string[] memory names = new string[](Patients.length);
        string[] memory heights = new string[](Patients.length);
        string[] memory weights = new string[](Patients.length);
        string[] memory diseases = new string[](Patients.length);
        string[] memory symptoms1 = new string[](Patients.length);
        string[] memory symptoms2 = new string[](Patients.length);
        for (uint256 i = 0; i < Patients.length; i++) {
            patientIds[i] = Patients[i].patient_id;
            names[i] = Patients[i].name;
            heights[i] = Patients[i].height;
            weights[i] = Patients[i].weight;
            diseases[i] = Patients[i].disease;
            symptoms1[i] = Patients[i].symptom1;
            symptoms2[i] = Patients[i].symptom2;
        }
        return (patientIds, names, heights, weights, diseases, symptoms1, symptoms2);
    }
}

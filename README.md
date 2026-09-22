 RaceDay

 Project Description

RaceDay is a full-stack web-based event management system designed for the South African road running, walking and cycling community.

The system allows organisers to create and manage sporting events, categories, participant enrolments and race results. Participants can browse upcoming events, enter events, view their enrolments and track their personal results.

This repository contains the development work for **PROG6212 Programming 2B**.

 User Roles

Organiser

Organisers are responsible for managing events and participant information. Organiser functionality includes:

* Creating, updating and deleting events
* Creating and managing event categories
* Viewing participant enrolments for their events
* Capturing participant results
* Publishing results after an event

### Participant

Participants are able to:

* Create an account and log in
* View upcoming events
* View event categories
* Enrol in events
* View their own enrolments
* View their personal race results
* Update their profile information

## Part 1

Part 1 focuses on planning and designing the RaceDay system before application development.

The following planning documents are available in the `/docs` folder:

* `ERD.png` — Entity Relationship Diagram
* `API-Endpoint-Plan.docx` — Planned REST API endpoints
* `RaceDay-Database.sql` — SQL Server database creation and seed-data script

### Database

The RaceDay database is designed for Microsoft SQL Server and contains the following entities:

* Role
* User
* Event
* Category
* Enrolment
* Result

The SQL script includes the required database tables, primary keys, foreign keys, constraints and sample seed data.

## Repository Structure

```text
RaceDay
├── docs
│   ├── ERD.png
│   ├── API-Endpoint-Plan.docx
│   └── RaceDay-Database.sql
└── README.md
```

## Software and Technologies

The project uses or will use the following technologies throughout the development process:

* C#
* ASP.NET Core
* ASP.NET Core Web API
* ASP.NET Core MVC
* Entity Framework Core
* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* GitHub
* GitHub Actions
* Docker
* Azure Blob Storage

## Setup

### Part 1 Database

1. Install and open SQL Server Management Studio (SSMS).
2. Connect to a SQL Server instance.
3. Open `docs/RaceDay-Database.sql`.
4. Execute the script to create the RaceDay database, tables, constraints and seed data.

Further setup instructions will be added as the API and MVC applications are developed.

## Continuous Integration

GitHub Actions will be used to validate the project during development.

**CI Build Screenshot:**

> *Screenshot will be added after the GitHub Actions workflow has been configured and successfully completed.*

## YouTube Demonstration

A Part 1 demonstration video will explain:

* The RaceDay system design
* ERD decisions and relationships
* API endpoint planning
* SQL database design
* Seed data
* Running the SQL script in SQL Server Management Studio

**YouTube Video:**

> *Video link will be added after the Part 1 demonstration has been recorded.*

## Development

Development will follow the three-part structure specified in the PROG6212 Programming 2B assessment:

* **Part 1:** System planning, ERD, API endpoint plan and SQL database
* **Part 2:** ASP.NET Core REST API and database integration
* **Part 3:** ASP.NET Core MVC front end, Azure Blob Storage and Docker


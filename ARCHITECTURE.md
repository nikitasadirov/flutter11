# TaskFlow architecture

TaskFlow stores application data locally in SQLite through Drift. The repository has no remote API, so the task feature uses a local data source and does not invent HTTP error handling for operations that cannot make a request.

## Task list dependency flow

`TasksPage` → `WatchTasksUseCase` → `TaskRepository` (domain contract) → `TaskRepositoryImpl` → `TaskLocalDataSource` → `AppDatabase`.

The dependency direction points inward. The domain entity and repository contract are plain Dart and have no Flutter, Drift, SQLite, or platform imports. Drift rows are converted to `TaskModel` and then to `TaskEntity` before reaching the page.

## State and errors

The task list uses `StreamBuilder` for loading, success, empty, and error states. A failed load offers a retry action. Search input is debounced by 300 ms; filters, sorting, trash view, and incremental page size are passed to the use case. Infrastructure exceptions are translated to safe `Failure` messages by the repository. Technical exception text is not displayed in the task list.

`Dependencies.configure()` is the composition root. It creates the database, data source, repository, and use case in dependency order. Widgets receive the use case and do not create data sources or repositories.

## Local error categories

The shared `Failure` hierarchy includes network, server, unauthorized, validation, empty, and unknown categories for consistent presentation. TaskFlow currently works offline against SQLite, so network, HTTP 401, and HTTP 500 failures are reserved for a future remote source; current local validation errors and unexpected storage errors are mapped centrally.

# Fullstack Assessment: Vue 3 + Ruby on Rails + Docker

This is a fullstack application that demonstrates user creation, tone detection, and retry logic using a modern tech stack. The frontend is built with Vue 3 and TypeScript, while the backend is powered by Ruby on Rails and PostgreSQL. Everything runs inside Docker containers for easy setup and deployment.

---

## 🛠️ Tech Stack

### Frontend
- 💎 **Ruby on Rails** backend (API-only) - Version `3.4.3`
- ⚡ **Vue 3** frontend - Version - `node 18`
- 🐬 **Postgres 17** as the database - Postgres `17.4`
- 🌐 **Nginx** as a reverse proxy and static file server - `1.27`
- 📦 **Docker Compose** to orchestrate the whole stack

### Backend
- Ruby on Rails
- PostgreSQL
- Camille (TypeScript API client generator)

### DevOps
- Docker
- Docker Compose

---

### Step 1: Clone the repository
```
git clone git@github.com:faizc-dev/ruby-rails-test-project.git
cd ruby-rails-test-project
```

#### Step 2: Check out to the latest branch (if applicable)
```
git checkout main
```

#### Step 3: Shut down any previous containers (if running)

```
docker-compose down -v
```

#### Step 4: Build and start the application

```
docker-compose up --build
```


✅ Visit in your browser:

    Frontend: http://localhost:8000

    Backend: http://localhost:3000


## 🧪 Running Backend Unit Tests (RSpec)

The backend uses RSpec for unit testing. All tests are located in the ```backend/spec``` directory.

### Step 1: Find the backend container
```
docker ps
```
Find the container with a name like ruby_rails_test-backend-1.
### Step 2: Enter the container
```
docker exec -it ruby_rails_test-backend-1 bash
```
### Step 3: Run RSpec tests
```
bundle exec rspec
```

📁 Project Structure


. ├── backend/           
. ├── frontend/          
├── docker-compose.yml

└── README.md

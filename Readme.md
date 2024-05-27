# Jupyter Notebook with Docker Compose

This project sets up a Jupyter Notebook server using Docker Compose. The configuration automatically generates a token and password for accessing the notebook.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Project Structure

```
my_jupyter_project/
├── Dockerfile
├── docker-compose.yml
├── generate_password.sh
└── notebooks/
```

- `Dockerfile`: Defines the custom Docker image.
- `docker-compose.yml`: Configuration file for Docker Compose.
- `generate_password.sh`: Script to generate a random token and hashed password.
- `notebooks/`: Directory to store Jupyter notebooks.

## Setup

1. Clone this repository or create the directory structure as shown above.
2. Ensure Docker and Docker Compose are installed on your system.

## Usage

1. Build and run the Docker containers:

   ```bash
   docker-compose up --build
   ```

2. Check the logs to find the generated password and token:

   ```bash
   docker-compose logs jupyter
   ```

   Look for lines like these in the logs:

   ```
   jupyter_notebook | Generated password: <your_password>
   jupyter_notebook | Hashed password: <your_hashed_password>
   jupyter_notebook | Generated token: <your_token>
   ```

3. Access Jupyter Notebook:

   Open your web browser and navigate to `http://localhost:8888`. Use the generated password to log in.

## Stopping the Server

To stop the Jupyter Notebook server, press `Ctrl+C` in the terminal where Docker Compose is running or run:

```bash
docker-compose down
```

## Customization

If you want to customize the token or password, you can modify the `generate_password.sh` script.

### notebooks/

This directory will contain your Jupyter notebooks. You can create and manage your notebooks here.

## Troubleshooting

If you encounter any issues, please ensure Docker and Docker Compose are correctly installed and configured on your system. Check the Docker logs for any error messages that might help diagnose the problem.

## License

This project is licensed under the MIT License.
```
Feel free to customize further based on your specific needs and preferences.
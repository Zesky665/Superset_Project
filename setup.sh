# Wait for Superset to be ready
sleep 10

docker exec superset superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@localhost.com \
              --password secret

docker exec superset superset db upgrade &&
         docker exec superset superset init

echo "Done"
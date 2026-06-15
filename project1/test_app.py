import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_hello_devops(client):
    """Test that the home page returns the correct message."""
    response = client.get('/')
    assert response.data == b'Hello DevOps!'
    assert response.status_code == 200

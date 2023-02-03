
# Build image
build:
	docker build -f Dockerfile -t kaspawallet .

# Run with default node ip
run:
	RPC_SERVER=46.101.253.52 make _run

# Full run implementation
_run:
	docker rm -f kaspawallet;
	docker run -v kaspa_keys:/root/.kaspawallet/kaspa-mainnet -p 8082:8082 --name kaspawallet -d -e RPC_SERVER=${RPC_SERVER} kaspawallet

# Import keypair from mnemonic
import_keys:
	docker run -v kaspa_keys:/root/.kaspawallet/kaspa-mainnet --rm -it kaspawallet kaspawallet create --import

# Generate new keypair
genkeypair:
	docker run -v kaspa_keys:/root/.kaspawallet/kaspa-mainnet --rm -it kaspawallet genkeypair

# Show kaspawallet logs
logs:
	docker logs -f kaspawallet
# Open shell on ready kaspawallet container
shell:
	docker exec -it kaspawallet bash

stop:
	docker rm -f kaspawallet
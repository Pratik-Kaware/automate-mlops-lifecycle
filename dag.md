```mermaid
flowchart TD
	node1["data-ingestion"]
	node2["data-preprocessing"]
	node3["feature-engineering"]
	node4["model-building"]
	node5["model-evaluation"]
	node6["model-registration"]
	node1-->node2
	node2-->node3
	node3-->node4
	node4-->node5
	node5-->node6
```

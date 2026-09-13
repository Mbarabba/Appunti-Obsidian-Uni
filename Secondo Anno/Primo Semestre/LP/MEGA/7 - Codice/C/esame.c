int main(){
	struct node;
	typedef struct node* Node;
	struct node{
		int key1;
		int key2;
		Node r;
		Node c;
		Node l;
	};
}

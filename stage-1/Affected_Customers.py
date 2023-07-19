import csv

def identify_affected_customers(file_path):
    affected_customers = []

    with open(file_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            age = int(row['age'])
            if 40 <= age <= 59:
                name = row['name']
                phone = row['phone']
                email = row['email']
                affected_customers.append({'name': name, 'phone': phone, 'email': email})

    return affected_customers

def generate_txt_file(customers, output_file):
    with open(output_file, 'w') as txtfile:
        for customer in customers:
            txtfile.write(f"Name: {customer['name']}\n")
            txtfile.write(f"Phone: {customer['phone']}\n")
            txtfile.write(f"Email: {customer['email']}\n\n")

file_path = './latest-customers.csv'
output_file = './Affected_Customers.txt'

affected_customers = identify_affected_customers(file_path)
generate_txt_file(affected_customers, output_file)


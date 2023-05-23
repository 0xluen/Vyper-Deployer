import subprocess
import json
import os

if not os.path.exists("artifacts"):
    os.makedirs("artifacts")

contract_file = "contract.vy"

command_bytecode = f"python3 -m vyper -f bytecode {contract_file}"
output_bytecode = subprocess.check_output(command_bytecode, shell=True)
output_bytecode = output_bytecode.decode("utf-8").strip()

result_bytecode = {"bytecode": output_bytecode}
json_output_bytecode = json.dumps(result_bytecode)

with open("artifacts/contract_output_bytecode.json", "w") as f:
    f.write(json_output_bytecode)

command_abi = f"python3 -m vyper -f abi {contract_file}"
output_abi = subprocess.check_output(command_abi, shell=True)
output_abi = output_abi.decode("utf-8").strip()

result_abi = {"abi": output_abi}


with open("artifacts/contract_output_abi.json", "w") as f:
    f.write(output_abi)

command_runtime = f"python3 -m vyper -f bytecode_runtime {contract_file}"
output_runtime = subprocess.check_output(command_runtime, shell=True)
output_runtime = output_runtime.decode("utf-8").strip()

result_runtime = {"bytecode_runtime": output_runtime}
json_output_runtime = json.dumps(result_runtime)

with open("artifacts/contract_output_runtime.json", "w") as f:
    f.write(json_output_runtime)

command_ir = f"python3 -m vyper -f ir {contract_file}"
output_ir = subprocess.check_output(command_ir, shell=True)
output_ir = output_ir.decode("utf-8").strip()

result_ir = {"ir": output_ir}
json_output_ir = json.dumps(result_ir)

with open("artifacts/contract_output_ir.json", "w") as f:
    f.write(json_output_ir)

command_asm = f"python3 -m vyper -f asm {contract_file}"
output_asm = subprocess.check_output(command_asm, shell=True)
output_asm = output_asm.decode("utf-8").strip()

result_asm = {"asm": output_asm}
json_output_asm = json.dumps(result_asm)

with open("artifacts/contract_output_asm.json", "w") as f:
    f.write(json_output_asm)

command_source_map = f"python3 -m vyper -f source_map {contract_file}"
output_source_map = subprocess.check_output(command_source_map, shell=True)
output_source_map = output_source_map.decode("utf-8").strip()

result_source_map = {"source_map": output_source_map}
json_output_source_map = json.dumps(result_source_map)

with open("artifacts/contract_output_source_map.json", "w") as f:
    f.write(json_output_source_map)

command_method_identifiers = f"python3 -m vyper -f method_identifiers {contract_file}"
output_method_identifiers = subprocess.check_output(command_method_identifiers, shell=True)
output_method_identifiers = output_method_identifiers.decode("utf-8").strip()

result_method_identifiers = {"method_identifiers": output_method_identifiers}
json_output_method_identifiers = json.dumps(result_method_identifiers)

with open("artifacts/contract_output_method_identifiers.json", "w") as f:
    f.write(json_output_method_identifiers)

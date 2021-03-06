#!/bin/sh

cd ${WORKSPACE}/shift

PATH=$PATH:$HOME/bin

export PATH
source ~/Ansible/hacking/env-setup
export PATH=$PATH:$HOME/.rbenv/bin:$HOME/.rbenv/shims

# Includeファイル作成
python Shift_Env/tests/2-1301_ZabbixAgent_01/sh/pywinrm.py '192.168.127.141' 'type nul > c:/test.txt'
python Shift_Env/tests/2-1301_ZabbixAgent_01/sh/pywinrm.py '192.168.127.141' 'type nul > c:/test2.txt'
python Shift_Env/tests/2-1301_ZabbixAgent_01/sh/pywinrm.py '192.168.127.141' 'type nul > c:/test3.txt'
python Shift_Env/tests/2-1301_ZabbixAgent_01/sh/pywinrm.py '192.168.127.141' 'type nul > c:/test4.txt'

python Shift_Env/tests/2-1301_ZabbixAgent_01/sh/pywinrm.py '192.168.127.151' 'type nul > c:/test.txt'
python Shift_Env/tests/2-1301_ZabbixAgent_01/sh/pywinrm.py '192.168.127.151' 'type nul > c:/test2.txt'
python Shift_Env/tests/2-1301_ZabbixAgent_01/sh/pywinrm.py '192.168.127.151' 'type nul > c:/test3.txt'
python Shift_Env/tests/2-1301_ZabbixAgent_01/sh/pywinrm.py '192.168.127.151' 'type nul > c:/test4.txt'

# これより下にSHIFT実行部分を記述
Shift_Bin/Spec-play.sh run
result01=$?

Shift_Bin/Ansible-play.sh run
result02=$?

Shift_Bin/Spec-play.sh run
result03=$?

Shift_Bin/Ansible-play.sh run
result04=$?

Shift_Bin/Spec-play.sh run
result05=$?

cp -rf Shift_Env/tests/2-1301_ZabbixAgent_01/test_case02/host_vars ./Shift_Env/
cp -rf Shift_Env/tests/2-1301_ZabbixAgent_01/test_case02/properties.yml ./Shift_Env/

Shift_Bin/Ansible-play.sh run
result06=$?

Shift_Bin/Spec-play.sh run
result07=$?

exit $((result01 || result02 || result03 || result04 || result05 || result06 || result07))

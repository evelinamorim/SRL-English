
DATA_HOME="/home/evelinamorim/UPorto/zero-shot-participant/Zeroshot-Event-Extraction/data/ACE_converted/"
SRL_DATA_HOME="/home/evelinamorim/UPorto/zero-shot-participant/Zeroshot-Event-Extraction/data/SRL_output/ACE/"


DEV_INPUT_FILE="${DATA_HOME}/dev.event.json"
TEST_INPUT_FILE="${DATA_HOME}/test.event.json"
TRAIN_INPUT_FILE="${DATA_HOME}/train.event.json"

DEV_ID_OUTPUT="ACE/dev-id-output.txt"
TEST_ID_OUTPUT="ACE/test-id-output.txt"
TRAIN_ID_OUTPUT="ACE/train-id-output.txt"

DEV_SRL_INPUT="ACE/dev-srl-input.txt"
TEST_SRL_INPUT="ACE/test-srl-input.txt"
TRAIN_SRL_INPUT="ACE/train-srl-input.txt"

DEV_SRL_OUTPUT="${SRL_DATA_HOME}/nomSRL_dev.jsonl"
TEST_SRL_OUTPUT="${SRL_DATA_HOME}/nomSRL_test.jsonl"
TRAIN_SRL_OUTPUT="${SRL_DATA_HOME}/nomSRL_train.jsonl"


# DEV DATA

allennlp predict nom-id-bert/model.tar.gz ${DEV_INPUT_FILE} --output-file ${DEV_ID_OUTPUT} --predictor "nombank-id" --include-package id_nominal
python convert_id_to_srl_input.py ${DEV_ID_OUTPUT} ${DEV_SRL_INPUT}
allennlp predict nom-sense-srl/model.tar.gz ${DEV_SRL_INPUT} --output-file ${DEV_SRL_OUTPUT}  --predictor "nombank-sense-srl" --include-package nominal_sense_srl

# TEST DATA

allennlp predict nom-id-bert/model.tar.gz ${TEST_INPUT_FILE} --output-file ${TEST_ID_OUTPUT} --predictor "nombank-id" --include-package id_nominal
python convert_id_to_srl_input.py ${TEST_ID_OUTPUT} ${TEST_SRL_INPUT}
allennlp predict nom-sense-srl/model.tar.gz ${TEST_SRL_INPUT} --output-file ${TEST_SRL_OUTPUT}  --predictor "nombank-sense-srl" --include-package nominal_sense_srl

# TRAIN DATA

allennlp predict nom-id-bert/model.tar.gz ${TRAIN_INPUT_FILE} --output-file ${TRAIN_ID_OUTPUT} --predictor "nombank-id" --include-package id_nominal
python convert_id_to_srl_input.py ${TRAIN_ID_OUTPUT} ${TRAIN_SRL_INPUT}
allennlp predict nom-sense-srl/model.tar.gz ${TRAIN_SRL_INPUT} --output-file ${TRAIN_SRL_OUTPUT}  --predictor "nombank-sense-srl" --include-package nominal_sense_srl


DATA_HOME="/home/evelinamorim/UPorto/zero-shot-participant/Zeroshot-Event-Extraction/data/ACE_converted/"
SRL_DATA_HOME="/home/evelinamorim/UPorto/zero-shot-participant/Zeroshot-Event-Extraction/data/SRL_output/ACE/"

DEV_INPUT_FILE="${DATA_HOME}/dev.event.json"
TEST_INPUT_FILE="${DATA_HOME}/test.event.json"
TRAIN_INPUT_FILE="${DATA_HOME}/train.event.json"

DEV_OUTPUT_FILE="${SRL_DATA_HOME}/verbSRL_dev.jsonl"
TEST_OUTPUT_FILE="${SRL_DATA_HOME}/verbSRL_test.jsonl"
TRAIN_OUTPUT_FILE="${SRL_DATA_HOME}/verbSRL_train.jsonl"


allennlp predict verb-sense-srl/model.tar.gz ${DEV_INPUT_FILE} --output-file ${DEV_OUTPUT_FILE} --predictor "sense-semantic-role-labeling" --include-package verb_sense_srl
allennlp predict verb-sense-srl/model.tar.gz ${TEST_INPUT_FILE} --output-file ${TEST_OUTPUT_FILE} --predictor "sense-semantic-role-labeling" --include-package verb_sense_srl
allennlp predict verb-sense-srl/model.tar.gz ${TRAIN_INPUT_FILE} --output-file ${TRAIN_OUTPUT_FILE} --predictor "sense-semantic-role-labeling" --include-package verb_sense_srl

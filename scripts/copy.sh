#!/bin/bash
#  tar cf - -T /data2/ozan/conceptual_captions/icl.extracted.pbz.0${i} | pv | \
    #ssh -c aes128-gcm@openssh.com mmvc "cat > /mnt/data/shared/ConceptualCaptions/features_foldered/feats.0${i}.tar" &

for i in $@; do
  tar cf - -T $i | pv | ssh -c aes128-gcm@openssh.com mmvc "tar -C /mnt/data/shared/ConceptualCaptions/multi30k_objfeatures -xf -" &
done
wait

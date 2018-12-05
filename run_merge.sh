#!/bin/bash

output_merge="merge.csv"
echo "FILE,TMVPMode,MaxNumMergeCand" > $output_merge
array=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
#sequence=(SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing)
i=0
f=30
dir=merge
mkdir ${dir}
for TMVPMode in 0 1 2
do
	for MaxNumMergeCand in {1..5}
	do
		echo "ALI_MERGE_${array[$i]} , $TMVPMode ,  $MaxNumMergeCand"  >> $output_merge
		for s in SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing
		do
			./TAppEncoderStatic -c encoder_randomaccess_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_MERGE_ra_${s}_${array[$i]}_0.bin
			./TAppEncoderStatic -c encoder_randomaccess_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_MERGE_ra_${s}_${array[$i]}_1.bin
			./TAppEncoderStatic -c encoder_randomaccess_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_MERGE_ra_${s}_${array[$i]}_2.bin
			./TAppEncoderStatic -c encoder_randomaccess_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_MERGE_ra_${s}_${array[$i]}_3.bin


			./TAppEncoderStatic -c encoder_lowdelay_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_MERGE_lb_${s}_${array[$i]}_0.bin
			./TAppEncoderStatic -c encoder_lowdelay_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_MERGE_lb_${s}_${array[$i]}_1.bin
			./TAppEncoderStatic -c encoder_lowdelay_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_MERGE_lb_${s}_${array[$i]}_2.bin
			./TAppEncoderStatic -c encoder_lowdelay_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_MERGE_lb_${s}_${array[$i]}_3.bin


			./TAppEncoderStatic -c encoder_lowdelayp_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_MERGE_lp_${s}_${array[$i]}_0.bin
			./TAppEncoderStatic -c encoder_lowdelayp_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_MERGE_lp_${s}_${array[$i]}_1.bin
			./TAppEncoderStatic -c encoder_lowdelayp_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_MERGE_lp_${s}_${array[$i]}_2.bin
			./TAppEncoderStatic -c encoder_lowdelayp_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_MERGE_lp_${s}_${array[$i]}_3.bin


			./TAppEncoderStatic -c encoder_intra_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_MERGE_ai_${s}_${array[$i]}_0.bin
			./TAppEncoderStatic -c encoder_intra_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_MERGE_ai_${s}_${array[$i]}_1.bin
			./TAppEncoderStatic -c encoder_intra_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_MERGE_ai_${s}_${array[$i]}_2.bin
			./TAppEncoderStatic -c encoder_intra_main_scc.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --TMVPMode=$TMVPMode --MaxNumMergeCand=$MaxNumMergeCand --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_MERGE_ai_${s}_${array[$i]}_3.bin
		done
		i=`expr $i + 1`
	done
done


#./TAppEncoder -c encoder_randomaccess_main_scc.cfg -c SlideShow_444.cfg --Log2ParallelMergeLevel= -b ALI_MERGE_G.bin

# --------------------------------------------------------------------------------------------
# This VariantsToVCF WDL task was generated on 09/09/16 for use with GATK version 3.6
# For more information on using this wrapper, please see the WDL repository at 
# https://github.com/broadinstitute/wdl/tree/develop/scripts/wrappers/gatk/README.md
# Task Summary: Convert variants from other file formats to VCF format
# --------------------------------------------------------------------------------------------

task VariantsToVCF { 
	File gatk
	File ref
	File refIndex
	File refDict
	String ? userString #If a parameter you'd like to use is missing from this task, use this term to add your own string
	Array[String] ? intervals
	String ? dbsnp
	String ? out
	String ? sample
	String variant

	command {
		java -jar ${gatk} \
			-T VariantsToVCF \
			-R ${ref} \
			${default="" "--intervals " + intervals} \
			${default="" "-D " + dbsnp} \
			-o ${default="stdout" out} \
			${default="" "-sample " + sample} \
			-V ${variant} \
			${default="\n" userString} 
	}

	output {
		#To track additional outputs from your task, please manually add them below
		String taskOut = "${out}"
	}

	runtime {
		docker: "broadinstitute/genomes-in-the-cloud:2.2.2-1466113830"
	}

	parameter_meta {
		gatk: "Executable jar for the GenomeAnalysisTK"
		ref: "fasta file of reference genome"
		refIndex: "Index file of reference genome"
		refDict: "dict file of reference genome"
		userString: "An optional parameter which allows the user to specify additions to the command line at run time"
		dbsnp: "dbSNP file"
		out: "File to which variants should be written"
		sample: "The sample name represented by the variant rod"
		variant: "Input variant file"
		intervals: "One or more genomic intervals over which to operate"
	}
}

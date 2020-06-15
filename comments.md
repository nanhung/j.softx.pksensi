Editor and Reviewer Comments:
  
**Reviewer 1**
  
Overall well this is a well written paper written although there are a few typos in the text and it would benefit from a modest reordering of some of the text. Methodologically this is a sound piece of work. It does not contribute to the theory of GSA but the ability to introduce a phase-change is a useful advance compared to the eFAST routine coded in the R sensitivity package. The ability to work with models coded in GNU MCSim is particularly useful since there is no support for GSA within this software. The plots that can be seen in Figure 2 neatly demonstrate the advantage of taking replicates although for a highly parameterised and computationally expensive model this will come with a hefty overhead, particularly for models coded using deSolve. The paper over really skims over the capability of the pksensi package although it does provide a link to fuller guidance.

I have only a few minor comments.

  1. The workflow shown in figure 1 demonstrates what I would regard as best practice for development and calibration of a PBPK model. Uncertainty analysis in some form for the testing, debugging and assessment of the quantitative behaviour of a model over the bounds of the input parameters is an essential prerequisite to sensitivity analysis. However, whilst this is briefly covered in the text (beginning on line 137) the authors don’t specify how the results from uncertainty analysis might be used to refine parameter ranges. Furthermore, there is no mention of uncertainty analysis in the 5 step routine in the illustrative examples section.

  2. I suggest the authors review the ordering of the text so that it reflects the workflow of figure 1. At present the text on uncertainty analysis follows the text on sensitivity analysis. 

  3. Paragraph starting on line 137. 'The uncertainty analysis is a crucial modelling process within SA ...' Uncertainty analysis is the study of uncertainty in model outputs that arises as a consequence of uncertainty on model inputs. Sensitivity analysis goes a step further in attributing the uncertainty in outputs to individual parameters or interactions between parameters. Uncertainty and sensitivity analysis are distinct but complimentary processes.


**Reviewer 2**
  
- Major Revision

  1. This article does not follow templates of this journal:
    - The words in abstract is about 222 words which is much larger than 100 words.
    - The words in main text is about 5578 words which is much larger than 3000 words.
    - Software metadata table is missing.
  Ans: After double checking the Guide for Authors in SoftwareX web page (https://www.elsevier.com/journals/softwarex/2352-7110/guide-for-authors), we think that there is no word restriction for abstract.  https://app.uio.no/ifi/texcount/online.php


  2. Proprietary names such as R package names would be shown better in Gothic or bold font. 'pksensi' is in bold but other package names such as 'sensitivity' are not in bold, which is a little confusing in reading the text.
  Ans: We revised the article and use bold font for all mentioned R package.
  
- Minor Comments

  1. Line 187-188: Statements are hard to understand. It needs correction at 'to further used,' and 'thwe' in the following text: "The corresponding ranges have to define in a list object, a generic vector to further used in the analysis. After the definition, thwe users can use rfast99() to create parameter matrix."
  
  Ans: We revised the description as "The third step is to identify the model parameters that will be examed in global SA and create the parameter matrix. After the parameter selection, we have to assign the corresponding value in probability function, such as minimum and maximum in a uniform distribution. After the definition, the users can userfast99() with the assignments (e.g., parameter names, sample number, parameter distribution, and its corresponding properties) that were defined in the above steps to create parameter matrix."

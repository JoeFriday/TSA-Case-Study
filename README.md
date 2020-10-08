# TSA Case Study
In this scenario, I applied my knowledge of the SAS programming process to prepare and analyze United States TSA claims data between 2002 and 2017. The TSA is an agency of the US Department of Homeland Security that has authority over the security of the travelling public. Claims are filed if tavelers are injured or their property is lost or damaged during the screening process at an airport. Finally, I analyzed and reported on the overall data and also by a specified state, Arizona.

### The TSA Claims 2002 to 2017 CSV file has 14 colums and over 220,000 rows. 

To complete this project, I followed the SAS programming process as in Access Data, Explore Data, Prepare Data, Analyze and Report on Data, and Export Results. 

## Access Data
I imported the raw data file TSAClaims2001_2017.csv into SAS and stored it in the tsa library, and removed the entirely duplicated records in the table.

## Explore Data
Then I used several procedures (eg. proc print(obs=20); proc contents; proc freq) to explore the data and find out where's issues and inconsistencies that I need to resovle and fix. 

## Prepare/Clean Data
In this stage, I wrote SAS programs that use procedures, functions, conditional logic, WHERE statements, formats, and labels to preparethe data so that it meets the case study's requirements. Frankly, this process typically takes the most time in programming so that the data got properly prepared and the accurate reports could be created as request.

## Analyze and Report on Data
Next, I wrote programs to create reports, summary statistics(mean, minimum, maximum, sum), and a visualization(plot) to answer the business questions in the requirement.

1. How many date issues are in the overall data?

![1f810665934598d9388c0b4d2bd5de2](https://user-images.githubusercontent.com/72532551/95487879-dfbbbd80-0962-11eb-9fc4-7965b07cd1dd.png)

2. How many claims per year of Incident_Date are in the overall data? Be sure to include a plot.

![a6f912651c6019320e89f539b473366](https://user-images.githubusercontent.com/72532551/95488676-d2eb9980-0963-11eb-8256-0a62c1ff661e.png)

![7592cdcbb09637eaedd738f8c604b49](https://user-images.githubusercontent.com/72532551/95488738-e72f9680-0963-11eb-92ec-e307eff6fadd.png)

3. Analysis for Arizona
  a. What are the frequency values for Claim_Site for Arizona?

![775475f7094fd9538b6dc3e33091d0a](https://user-images.githubusercontent.com/72532551/95488773-f1519500-0963-11eb-8760-b697b2b9a468.png)
  
  b. What are the frequency values for Claim_Type for Arizona?

![eaaa8cb9e57928841807251806546bf](https://user-images.githubusercontent.com/72532551/95488814-ff9fb100-0963-11eb-9bc7-2ef3ed649e54.png)

![1b3ed2af4ecd0a6ccb878ea351f967f](https://user-images.githubusercontent.com/72532551/95488837-07f7ec00-0964-11eb-8818-61c9be837b53.png)
  
  c. What are the frequency values for Disposition for Arizona?

![54a0fd452435ca95eaeb671a907f481](https://user-images.githubusercontent.com/72532551/95488864-10502700-0964-11eb-95dd-b657a104223e.png)
  
  d. What is the mean, minimum, maximum, and sum of Close_Amount for Arizona? Round tothe nearest integer.

![f2ffc39af1024f6147aa332a812d91c](https://user-images.githubusercontent.com/72532551/95488899-1a722580-0964-11eb-8f58-4fc374e803b0.png)
  
## Export Data
At last, I exported the results to a PDF report that I can download to my desktop and share to anyone. The PDF report has sapphire as style and no page break.

# LEGO analysis
A SQL and Tableau portfolio, including schema creation, data analysis, and visualization.
# Project Background
I explored the public LEGO dataset, which provides comprehensive information on LEGO sets, parts, themes, colors, and inventories spanning multiple decades. This project aims to uncover historical trends in LEGO product development, such as set complexity, color and part usage, and theme popularity over time.

Insights and recommendations are provided on the following key areas:

- **Category 1: Theme Analysis** 
	Explored which themes contain the highest number of parts and how theme popularity has evolved over the years.
- **Category 2:** **Release Timeline**  
	Analyzed the number of sets released by year and century to understand product launch pacing and historical production trends.
- **Category 3:** **Product Composition and Diversity**  
	Investigated the most produced LEGO colors and the distribution of unique parts to inform design and manufacturing strategies.
- **Category 4:** **Theme-specific Market Share**  
	Assessed the representation of specific themes (e.g., "Trains") within 21st-century sets to guide theme development and marketing focus.

The SQL queries used to create the schema and regarding various business questions can be found here [link](https://github.com/cshuy/lego-analysis/tree/52faedd402d28ab065f33ed936c271e21706221b/sql).

An interactive Tableau dashboard used to report and explore sales trends can be found here [link](https://public.tableau.com/app/profile/shuyu.chen5845/viz/Lego_17449360807400/1_1).
# Data Structure & Initial Checks

The database structure as seen below consists of eight tables: colors, inventories, inventory_parts, inventory_sets, part_categories, parts, sets, themes. A description of each table is as follows:
- colors: Contains information about LEGO part colors. Columns include id, name, rgb, is_trans.
- parts: Contains information about individual LEGO parts. Columns include part_num, name, part_cat_id.
- part_categories: Contains the categories to which LEGO parts belong. Columns include id, name.
- inventory_parts: Lists the parts included in each inventory, along with color, quantity, and whether the part is a spare. Columns include inventory_id, part_num, color_id, quantity, is_spare.
- inventories: Represents different versions or releases of LEGO sets. Columns include id, set_num, version.
- inventory_sets: Lists the sets included within a given inventory (e.g., bundled sets). Columns include inventory_id, set_num, quantity.
- sets: Contains general information about LEGO sets, such as name, release year, and number of parts. Columns include set_num, name, year, theme_id, num_parts.
- themes: Contains information about LEGO themes (e.g., Star Wars, City), including hierarchical relationships. Columns include id, name, parent_id.

Here is the ERD (Entity Relationship Diagram):
![Entity Relationship Diagram here](https://github.com/cshuy/lego-analysis/blob/52faedd402d28ab065f33ed936c271e21706221b/erd.jpg)

# Executive Summary

### Overview of Findings

This project analyzes the public LEGO dataset to uncover long-term trends in product design, theme popularity, and part composition. The number of LEGO parts has significantly increased since the 1990s, with 2016 seeing the highest total number of parts released in a single year. Interestingly, only 2% of LEGO parts were unique to a single set, with the pre-1970s era showing the highest percentage of non-reused parts. Additionally, the "City" theme dominated the mid-2000s, and 7% of all sets released in the 21st century were train-themed, reflecting consumer interest clusters.

![Visualization, including a graph of overall trends or snapshot of a dashboard](https://github.com/cshuy/lego-analysis/blob/52faedd402d28ab065f33ed936c271e21706221b/dashboard.jpg)

# Insights Deep Dive
### Category 1: Theme Analysis

- **Main insight 1.** The "City" theme was especially popular between 2006 and 2010, maintaining consistent release volumes during those years.
    
- **Main insight 2.** The "Trains" theme accounted for 7% of all set releases in the 21st century, indicating a niche but notable audience.

### Category 2: Release Timeline

- **Main insight 1.** The number of LEGO parts released annually has seen a sharp increase since 1990, marking a shift toward greater product complexity.
    
- **Main insight 2.** 2016 marked the peak in total parts produced, with the highest cumulative part count of any year.
    
- **Main insight 3.** The number of sets released per century also reflects LEGO’s production expansion, especially from the 21st century onward.

### Category 3: Product Composition and Diversity

* **Main insight 1.** Only 2% of all LEGO parts were never reused in another set, suggesting a highly modular and reusable design philosophy.
    
- **Main insight 2.** Sets released before 1970 had the highest proportion of unique parts, revealing a less standardized approach during LEGO's early years.
    
- **Main insight 3.** Black is the most frequently produced color across all sets, indicating its broad versatility in LEGO design.

### Category 4: Theme-specific Market Share

- **Main insight 1.** "Trains" made up 7% of all sets released in the 21st century, highlighting a dedicated sub-market that could be further tapped for growth opportunities.


## License

This project is based on the **Lego SQL Challenge** by Will Sutton, which is licensed under the MIT License.

Modifications have been made to the original project, including:[data_insight](https://github.com/cshuy/lego-analysis/blob/1f59832bf81415dfa649da5c0aaf46f96bf0bffa/sql/03_data_insight.sql)

The original project can be found at: [link](https://github.com/wjsutton/lego_analysis_challenge/tree/main)

Copyright (c) 2023 Will Sutton  
Copyright (c) 2025 Shuyu Chen

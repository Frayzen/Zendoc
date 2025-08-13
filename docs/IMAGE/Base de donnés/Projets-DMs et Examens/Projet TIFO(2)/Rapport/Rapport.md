![[image 106.png|image 106.png]]
# Method 1: Canny Edge Detector
  
**🖊️ Description**:
Method for edge detection in an image.
The method involves smoothing the image using a Gaussian filter, computing the gradient magnitude and direction of the image, applying non-maximum suppression to thin the edges, and using hysteresis thresholding to remove weak edges. 
  
**Step 1:** Reduce Noise using gaussian filter
  
**Step 2:** Find Gradients using the Sobel kernels which reveal intensity changes.
The algorithm applies Sobel operators in both horizontal and vertical directions.
  
**Step 3:** Non Maximum Suppression
Any edges with intensity gradient more than maxVal are sure to be edges and those below minVal are sure to be non-edges, so discarded. Those who lie between these two thresholds are classified edges or non-edges based on their connectivity. If they are connected to "sure-edge" pixels, they are considered to be part of edges. Otherwise, they are also discarded. See the image below:
![[image 1 37.png|image 1 37.png]]
  
✅ **Advantages**
1. **Accurate edge localization:** Canny edge detection provides precise localization of edges. The  
    non-maximum suppression step ensures that only the most significant edges are retained.
2. **Low error rate:** By using double thresholding and edge tracking by hysteresis, the Canny algorithm reduces the likelihood of false edges and thus has a low error rate.
3. **Robust to noise:** Canny edge detection is suitable for real-world images affected by  
    various levels of noise. The Gaussian smoothing in the initial steps makes the Canny algorithm robust to noise.
  
**❌Disadvantages**
The optimal values of these parameters depend on the characteristics of the image, such as the contrast, the edge density, and the noise level. Choosing too low or too high values can result in either missing edges or too many false edges. Therefore, finding the best parameters for a given image can be difficult and time-consuming. Especially difficult in our case where we’re working with satellite images and its hard to determine forests with just edges.
  
**🌳Examples**:
![[image 2 37.png|image 2 37.png]]
### **Post-processing the Edges**
Without post-processing:
![[image 3 33.png|image 3 33.png]]
With Post-Processing
![[image 4 31.png|image 4 31.png]]
  
  
→ There will also be vegetation that isn’t necessarily forest, like little bushes or gardens which we do not want to be included in the calculations. An idea we had was to add color analysis to the image.
  
We switch to HSV color space:
![[image 5 30.png|image 5 30.png]]
  
Result:
![[image 6 27.png|image 6 27.png]]
→ Didn’t really help in the case of edge detector but could be useful for other segmentation techniques.
  
### TO DO:
- [ ] In deforestation logic: error calculating percentage of forest/deforestation
- [ ] Add post-processing to pipeline
# Method 2: Region Growing
**🖊️Description**:
A number of seeds are placed on the image. The pixels neighboring this region are evaluated to determine if they should also be considered part of the object. If so, they are added to the region and the process continues as long as new pixels are added to the region.
  
Region growing is a image segmentation technique. in this technique, regions recursively grow if similarity criteria is matched, one pixel is compared with its neighbours.
  
✅ Advantages:
TO DO
  
❌ Disadvantages:
TO DO
  
🌳Examples:
![[image 7 25.png|image 7 25.png]]
  
### TO DO:
- [ ] Benchmark technique
- [ ] In deforestation logic, add choosing of seed
- [ ] Fix logic in pipeline (is the user testing the technique or wants to calculate deforestation?)
- [ ] Add post-processing
# Method 4: K-Means Clustering
🖊️Description:
  
✅ Advantages:
  
❌ Disadvantages:
  
🌳Examples:
![[image 8 23.png|image 8 23.png]]
  
### TO DO:
- [ ] Add description + benchmarks
- [ ] Add pre + post processing
- [ ] Add to deforestation pipeline logic
  
# NDVI
==TO DO==
time series analysis techniques can be applied to detect deforestation. Time series analysis is a popular and effective method for abrupt change detection. It uses repeat data in the locations (pixels) where the forest might have suffered disturbance at a specific time.
  
# Deforestation Detection
==TO DO==
  
# Overall To Do:
- [ ] Add Readme
- [ ] Fix path to data so it can vary depending the user
- [ ] Clean and comment code
- [ ] Slides
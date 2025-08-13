_Auteurs: Emma Casagrande + Antoine Havard_

> [!info] projet.liris.cnrs.fr  
>  
> [https://projet.liris.cnrs.fr/imagine/pub/proceedings/ICPR-2016/media/files/1809.pdf](https://projet.liris.cnrs.fr/imagine/pub/proceedings/ICPR-2016/media/files/1809.pdf)  

> [!info] hal.science  
>  
> [https://hal.science/hal-01222695/document](https://hal.science/hal-01222695/document)  

> [!info] Introduction to Motion Detection: Part 1  
> The easiest way to detect motion with opencv  
> [https://medium.com/@itberrios6/introduction-to-motion-detection-part-1-e031b0bb9bb2](https://medium.com/@itberrios6/introduction-to-motion-detection-part-1-e031b0bb9bb2)  

> [!info] Understanding CUDA Memory Usage: A Practical Guide  
> I understand that learning data science can be really challenging…  
> [https://medium.com/@heyamit10/understanding-cuda-memory-usage-a-practical-guide-6dbb85d4da5a](https://medium.com/@heyamit10/understanding-cuda-memory-usage-a-practical-guide-6dbb85d4da5a)  

> [!info] Introduction to Motion Detection: Part 1  
> The easiest way to detect motion with opencv  
> [https://medium.com/@itberrios6/introduction-to-motion-detection-part-1-e031b0bb9bb2](https://medium.com/@itberrios6/introduction-to-motion-detection-part-1-e031b0bb9bb2)  

> [!info] Motion Detection Based on Frame Difference Method  
> Introduction to Motion Detection  
> [https://medium.com/@200101022/motion-detection-based-on-frame-difference-method-20c2185b7f05](https://medium.com/@200101022/motion-detection-based-on-frame-difference-method-20c2185b7f05)  

> [!info] core.ac.uk  
>  
> [https://core.ac.uk/download/pdf/53189939.pdf](https://core.ac.uk/download/pdf/53189939.pdf)  
nsys profile --trace cuda,nvtx -o my_profile_report.qdrep gst-launch-1.0 uridecodebin uri=file://$(pwd)/video03.avi ! videoconvert ! "video/x-raw, format=(string)RGB" ! cudafilter ! videoconvert ! video/x-raw, format=I420 ! x264enc ! mp4mux ! filesink location=output.mp4
# 1. Background Estimation Process
## ==**SANS OPTIMISATIONS, SANS MASK CLEANING:**==
CUDA API Summary (`cuda_api_sum`)
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|---|---|---|---|---|---|---|---|---|
|[[41.5]]|468,941,291|10,194|46001.7|46,677.0|22,593|157,655|10,555.6|cudaMemcpy|
|[[20.2]]|227,588,038|1,699|133954.1|78,497.0|63,169|80,034,209|1,945,821.0|cudaMallocPitch|
|[[17.3]]|195,693,604|3,398|57590.8|55,083.0|11,902|854,542|61,810.9|cudaMemcpy2D|
|[[9.9]]|111,664,860|8,495|13144.8|2,024.0|1,042|138,830|22,511.5|cudaFree|
|[[9.6 2]]|108,516,960|1,699|63871.1|8,526.0|6,943|92,442,485|2,242,491.6|cudaLaunchKernel|
|[[1.2]]|13,142,208|6,796|1933.8|1,393.0|972|12,083|1,023.6|cudaMalloc|
|[[0.3]]|3,090,591|1,699|1819.1|1,583.0|1,292|10,118|669.9|cudaDeviceSynchronize|
|[[0.0 4]]|831|1|831|831.0|831|831|0.0|cuModuleGetLoadingMode|
|[[IMAGE/Base de donnés/Projets-DMs et Examens/Projet IRGPU/Projet GPGPU/Algos Optimisés/Untitled/Untitled]]|||||||||
  
  
  
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|100.0|8,650,523|1,699|5,091.5|5,088.0|4,512|18,592|375.4|background_estimation_process(rgb *, rgb *, rgb *, int *, float *, int, int, unsigned long)|
  
CUDA GPU MemOps Summary by Time (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|52.2|145,785,511|6,796|21,451.7|19,585.0|18,304|104,257|4,870.7|[CUDA memcpy Host-to-Device]|
|47.8|133,591,106|6,796|19,657.3|18,208.0|17,632|69,601|3,460.2|[CUDA memcpy Device-to-Host]|
  
CUDA GPU MemOps Summary by Size (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|1,696.282|6,796|0.250|0.230|0.230|0.307|0.033|[CUDA memcpy Device-to-Host]|
|1,696.282|6,796|0.250|0.230|0.230|0.307|0.033|[CUDA memcpy Host-to-Device]|
  
## ==**AVEC OPTIMISATION, SANS MASK CLEANING**==
CUDA API Summary (`cuda_api_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|63.8|187,234,134|3,399|55,085.1|46,317.0|9,477|1,070,701|64,185.5|cudaMemcpy2D|
|24.8|72,647,595|1,700|42,733.9|5,591.0|2,725|63,020,143|1,528,326.8|cudaMallocPitch|
|5.4|15,816,383|1,700|9,303.8|8,516.0|5,320|419,208|10,338.9|cudaLaunchKernel|
|3.3|9,684,107|3,399|2,849.1|2,635.0|1,002|22,132|1,448.8|cudaFree|
|1.9|5,510,625|1,702|3,237.7|3,020.5|1,162|18,405|1,104.5|cudaMalloc|
|0.8|2,347,316|1,700|1,380.8|1,263.0|801|29,916|799.4|cudaDeviceSynchronize|
|0.0|711|1|711.0|711.0|711|711|0.0|cuModuleGetLoadingMode|
  
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|99.9|8,733,302|1,699|5,140.3|5,120.0|4,576|18,240|398.3|background_estimation_process(rgb *, rgb *, rgb *, int *, float *, int, int, unsigned long)|
|0.1|4,832|1|4,832.0|4,832.0|4,832|4,832|0.0|init_val(rgb *, rgb *, rgb *, int *, int, int, unsigned long)|
  
CUDA GPU MemOps Summary by Time (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|52.2|34,303,006|1,700|20,178.2|19,617.0|18,688|63,618|3,997.1|[CUDA memcpy Host-to-Device]|
|47.8|31,433,251|1,699|18,501.0|18,240.0|18,112|52,897|2,429.0|[CUDA memcpy Device-to-Host]|
  
  
CUDA GPU MemOps Summary by Size (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|391.680|1,700|0.230|0.230|0.230|0.230|0.000|[CUDA memcpy Host-to-Device]|
|391.450|1,699|0.230|0.230|0.230|0.230|0.000|[CUDA memcpy Device-to-Host]|
  
|   |   |   |
|---|---|---|
|Metric|**Original**|**Updated**|
|**Top API by Time**|`cudaMemcpy2D` (195.7 ms, 17.3%)|`cudaMemcpy2D` (187.2 ms, 63.8%)|
|**Total cudaMallocPitch Time**|227.6 ms (20.2%)|72.6 ms (24.8%)|
|**cudaLaunchKernel**|108.5 ms (9.6%)|15.8 ms (5.4%)|
|**cudaFree**|111.7 ms (9.9%)|9.6 ms (3.3%)|
|**cudaMalloc**|13.1 ms (1.2%)|5.5 ms (1.9%)|
|**cudaDeviceSynchronize**|3.1 ms (0.3%)|2.3 ms (0.8%)|
|**API Count**|8 total|7 total|
  
**CUDA GPU MemOps Summary (by Time) Comparison**
|   |   |   |
|---|---|---|
|Metric|**Original**|**Updated**|
|**Host-to-Device Time**|145.8 ms (52.2%)|34.3 ms (52.2%)|
|**Device-to-Host Time**|133.6 ms (47.8%)|31.4 ms (47.8%)|
|**Transfer Count**|6,796 each|1,700 / 1,699|
|**Avg HtoD Latency**|21,451.7 ns|20,178.2 ns|
|**Avg DtoH Latency**|19,657.3 ns|18,501.0 ns|
  
**CUDA GPU MemOps Summary (by Size) Comparison**
|   |   |   |
|---|---|---|
|Metric|**Original**|**Updated**|
|**Total Data (each dir)**|1,696.3 MB|391.7 MB|
|**Avg Transfer Size**|0.250 MB|0.230 MB|
|**Transfer Count**|6,796|1,700 / 1,699|
|**StdDev Size**|0.033 MB|0.000 MB|
## ==**AVEC SHARED MEMORY, SANS MASK CLEANING**==
CUDA API Summary (cuda_api_sum)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|48.5|447,637,777|10,194|43,911.9|44,905.0|22,242|154,585|9,367.6|cudaMemcpy|
|20.4|188,050,514|1,699|110,683.1|71,827.0|64,273|58,951,940|1,428,436.6|cudaMallocPitch|
|17.0|156,730,232|3,398|46,124.3|50,471.0|11,863|159,415|29,909.0|cudaMemcpy2D|
|11.0|101,890,858|8,495|11,994.2|1,523.0|992|123,266|20,537.6|cudaFree|
|1.6|14,386,442|1,699|8,467.6|7,735.0|6,703|215,532|5,698.3|cudaLaunchKernel|
|1.3|11,984,716|6,796|1,763.5|1,303.0|962|19,166|912.6|cudaMalloc|
|0.3|2,779,202|1,699|1,635.8|1,513.0|1,293|6,282|399.8|cudaDeviceSynchronize|
|0.0|1,002|1|1,002.0|1,002.0|1,002|1,002|0.0|cuModuleGetLoadingMode|
  
CUDA GPU Kernel Summary (cuda_gpu_kern_sum)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|100.0|9,703,836|1,699|5,711.5|5,760.0|5,024|6,529|260.9|background_estimation_process(rgb *, rgb *, rgb *, int *, float *, int, int, unsigned long)|
  
CUDA GPU MemOps Summary (by Time) (cuda_gpu_mem_time_sum)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|51.4|140,678,766|6,796|20,700.2|19,009.0|18,273|81,380|4,569.1|[CUDA memcpy Host-to-Device]|
|48.6|133,036,308|6,796|19,575.7|18,144.0|17,632|70,179|3,393.0|[CUDA memcpy Device-to-Host]|
  
CUDA GPU MemOps Summary (by Size) (cuda_gpu_mem_size_sum)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|1,696.282|6,796|0.250|0.230|0.230|0.307|0.033|[CUDA memcpy Device-to-Host]|
|1,696.282|6,796|0.250|0.230|0.230|0.307|0.033|[CUDA memcpy Host-to-Device]|
  
## ==**SANS OPTIMISATIONS, AVEC MASK CLEANING:**==
  
CUDA API Summary (cuda_api_sum)
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|---|---|---|---|---|---|---|---|---|
|[[36.0]]|689140916|16990|40561.6|44,293.0|5,781|195,428|20,059.1|cudaMemcpy|
|[[22.6]]|433279330|1699|255020.2|147,648.0|81,424|163,642,288|3,966,511.9|cudaMallocPitch|
|[[13.5]]|258794123|5097|50773.8|49,182.0|16,581|965,399|21,502.3|cudaMemcpy2D|
|[[12.2]]|234209708|15291|15316.8|3,707.0|1,372|233,459|34,268.7|cudaFree|
|[[9.7]]|186337453|6796|27418.7|8,095.0|2,976|117,842,170|1,429,447.1|cudaLaunchKernel|
|[[3.2]]|61194944|6796|9004.6|8,877.0|1,443|85,001|5,636.5|cudaDeviceSynchronize|
|[[2.7]]|51681964|13592|3802.4|3,446.0|1,202|74,811|2,730.0|cudaMalloc|
|[[0.0]]|1292|1|1292|1,292.0|1,292|1,292|0.0|cuModuleGetLoadingMode|
  
  
  
CUDA GPU Kernel Summary (cuda_gpu_kern_sum)
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|---|---|---|---|---|---|---|---|---|
|[[35.0 2]]|12417751|1699|7308.9|7,328.0|6,976|7,489|80.9|dilation_disk_kernel(const unsigned char *, unsigned char *, int, int, int)|
|[[34.9]]|12366094|1699|7278.5|7,296.0|7,008|7,712|75.3|erosion_disk_kernel(const unsigned char *, unsigned char *, int, int, int)|
|[[20.4 2]]|7246196|1699|4265|4,288.0|3,648|5,760|230.6|background_estimation_process(rgb *, rgb *, rgb *, int *, float *, int, int, unsigned long)|
|[[9.7 2]]|3439927|1699|2024.7|1,984.0|1,824|3,169|178.7|apply_motion_mask_kernel(rgb *, unsigned char *, int, int, unsigned long)|
  
  
  
CUDA GPU MemOps Summary (by Time) (cuda_gpu_mem_time_sum)
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|---|---|---|---|---|---|---|---|---|
|56.0|216,527,682|11,893|18,206.3|18,145.0|6,304|63,298|5,836.3|[CUDA memcpy Device-to-Host]|
|44.0|170,095,723|10,194|16,685.9|19,361.0|7,040|90,082|7,535.5|[CUDA memcpy Host-to-Device]|
  
CUDA GPU MemOps Summary (by Size) (cuda_gpu_mem_size_sum)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|2,740.147|11,893|0.230|0.230|0.077|0.307|0.071|[CUDA memcpy Device-to-Host]|
|1,957.248|10,194|0.192|0.230|0.077|0.307|0.086|[CUDA memcpy Host-to-Device]|
  
## ==**AVEC OPTIMISATIONS, AVEC MASK CLEANING:**==
  
CUDA API Summary (`cuda_api_sum`)
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|---|---|---|---|---|---|---|---|---|
|[[35.7]]|212086704|5,098|41601.9|42,620.0|9,759|150,033|20,809.4|cudaMemcpy2D|
|[[27.7]]|164816975|6,796|24252.1|18,750.5|5,190|168,477|21,759.9|cudaMemcpy|
|[[13.0]]|77302650|6,797|11373.1|9,798.0|531|49,704|7,478.5|cudaDeviceSynchronize|
|[[11.4]]|67421850|1,700|39659.9|4,383.5|3,206|59,306,281|1,438,273.6|cudaMallocPitch|
|[[5.8]]|34606271|6,797|5091.4|3,998.0|2,405|236,245|4,707.3|cudaLaunchKernel|
|[[3.3]]|19791978|10,198|1940.8|1,783.0|1,082|166,253|1,881.7|cudaFree|
|[[3.0]]|17928440|8,498|2109.7|1,714.0|912|61,917|1,348.2|cudaMalloc|
|[[0.0 5]]|652|1|652|652.0|652|652|0.0|cuModuleGetLoadingMode|
  
  
  
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|---|---|---|---|---|---|---|---|---|
|[[35.1]]|12,423,638|1,699|7312.3|7,328.0|7,008|7,520|76.4|dilation_disk_kernel(const unsigned char *, unsigned char *, int, int, int)|
|[[35.0]]|12,379,803|1,699|7286.5|7,296.0|6,976|7,552|75.1|erosion_disk_kernel(const unsigned char *, unsigned char *, int, int, int)|
|[[20.4]]|7,219,645|1,699|4249.3|4,288.0|3,584|4,928|236.8|background_estimation_process(rgb *, rgb *, rgb *, int *, float *, int, int, unsigned long)|
|[[9.6]]|3,387,769|1,699|1994|1,920.0|1,824|2,912|139.9|apply_motion_mask_kernel(rgb *, unsigned char *, int, int, unsigned long)|
|[[0.0 2]]|4,928|1|4928|4,928.0|4,928|4,928|0.0|init_val(rgb *, rgb *, rgb *, int *, int, int, unsigned long)|
  
  
  
CUDA GPU MemOps Summary (by Time) (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|65.4|113,560,826|6,796|16,710.0|17,889.0|6,304|70,786|6,771.2|[CUDA memcpy Device-to-Host]|
|34.6|60,000,246|5,098|11,769.4|7,488.0|6,912|70,498|6,576.9|[CUDA memcpy Host-to-Device]|
  
CUDA GPU MemOps Summary (by Size) (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|1,435.315|6,796|0.211|0.230|0.077|0.307|0.084|[CUDA memcpy Device-to-Host]|
|652.646|5,098|0.128|0.077|0.077|0.230|0.072|[CUDA memcpy Host-to-Device]|
  
  
# 2. Moving Average
## ==**NO OPTIMISATIONS, NO MASK CLEANING**==
CUDA API Summary (`cuda_api_sum`)
|Title|Column 1|Column 2|Column 3|Column 4|Column 5|Column 6|Column 7|Column 8|
|---|---|---|---|---|---|---|---|---|
|[[Time (%)]]|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|[[30.7]]|204,870,971|1,699|120,583.3|77,705.0|65,071|60,731,599|1,475,808.8|cudaMallocPitch|
|[[27.2]]|181,042,183|3,398|53,279.0|46,958.0|11,772|995,175|59,670.2|cudaMemcpy2D|
|[[20.6]]|137,453,222|3,398|40,451.2|41,348.0|25,528|133,501|8,927.1|cudaMemcpy|
|[[15.6]]|104,064,173|5,097|20,416.7|3,366.0|1,172|143,178|25,634.4|cudaFree|
|[[4.2]]|27,863,240|1,699|16,399.8|7,995.0|7,013|12,942,644|313,790.9|cudaLaunchKernel|
|[[1.3]]|8,378,294|3,398|2,465.7|2,465.0|1,102|22,472|1,185.4|cudaMalloc|
|[[0.5]]|3,102,645|1,699|1,826.2|1,603.0|1,282|8,025|583.9|cudaDeviceSynchronize|
|[[0.0 6]]|972|1|972.0|972.0|972|972|0.0|cuModuleGetLoadingMode|
  
  
  
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|100.0|5,722,802|1,699|3,368.3|3,360.0|3,136|4,512|65.2|moving_average(rgb *, rgb *, float, float *, int, int, ulong)|
  
CUDA GPU MemOps Summary (by Time) (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|52.2|68,184,818|3,398|20,066.2|19,616.0|18,560|70,785|4,196.2|[CUDA memcpy Host-to-Device]|
|47.8|62,383,252|3,398|18,358.8|18,176.0|17,792|52,001|2,150.9|[CUDA memcpy Device-to-Host]|
||||||||||
  
CUDA GPU MemOps Summary (by Size) (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|782.899|3,398|0.230|0.230|0.230|0.230|0.000|[CUDA memcpy Device-to-Host]|
|782.899|3,398|0.230|0.230|0.230|0.230|0.000|[CUDA memcpy Host-to-Device]|
  
## ==**OPTIMISATIONS, NO MASK CLEANING**==
CUDA API Summary (`cuda_api_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|35.8|121,273,546|3,395|35,721.2|42,600.0|10,079|186,227|18,829.2|cudaMemcpy2D|
|27.0|91,419,221|3,390|26,967.3|3,676.5|581|964,831|59,372.9|cudaDeviceSynchronize|
|26.1|88,467,824|1,700|52,039.9|6,336.5|3,135|74,963,299|1,817,941.2|cudaMallocPitch|
|6.4|21,615,113|1,696|12,744.8|9,988.5|5,911|473,464|13,106.7|cudaLaunchKernel|
|2.9|9,729,494|3,391|2,869.2|2,545.0|1,463|37,810|1,558.1|cudaFree|
|1.8|5,985,349|1,696|3,529.1|3,206.0|1,893|18,194|1,429.8|cudaMalloc|
|0.0|842|1|842.0|842.0|842|842|0.0|cuModuleGetLoadingMode|
  
CUDA GPU Kernel Summary (cuda_gpu_kern_sum)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|99.9|5,730,369|1,695|3,380.7|3,360.0|3,104|4,033|75.2|background_subtraction_kernel(rgb *, rgb *, float *, float, int, int, unsigned long)|
|0.1|3,424|1|3,424.0|3,424.0|3,424|3,424|0.0|init_val(rgb *, rgb *, int, int, unsigned long)|
  
CUDA GPU MemOps Summary (by Time) (cuda_gpu_mem_time_sum)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|51.9|33,795,125|1,700|19,879.5|19,648.0|18,464|69,568|3,934.3|[CUDA memcpy Host-to-Device]|
|48.1|31,368,803|1,695|18,506.7|18,240.0|18,112|50,529|2,335.1|[CUDA memcpy Device-to-Host]|
  
CUDA GPU MemOps Summary (by Size) (cuda_gpu_mem_size_sum)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|391.680|1,700|0.230|0.230|0.230|0.230|0.000|[CUDA memcpy Host-to-Device]|
|390.528|1,695|0.230|0.230|0.230|0.230|0.000|[CUDA memcpy Device-to-Host]|
  
## ==**NO OPTIS - MASK CLEANING**==
CUDA API Summary (`cuda_api_sum`)
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|---|---|---|---|---|---|---|---|---|
|[[33.2]]|293,203,482|10,170|28830.2|28,699.0|4,960|151,153|19,731.1|cudaMemcpy|
|[[22.1]]|195,372,994|1,695|115264.3|74,760.0|65,793|59,581,271|1,445,335.5|cudaMallocPitch|
|[[13.2]]|116,474,126|13,560|8589.5|1,903.0|1,022|173,195|18,293.2|cudaFree|
|[[12.9]]|113,650,765|8,475|13410.1|15,599.0|1,032|70,111|7,485.1|cudaDeviceSynchronize|
|[[12.1]]|106,661,328|3,390|31463.5|40,301.0|12,143|119,865|13,884.9|cudaMemcpy2D|
|[[4.0]]|35,450,198|6,780|5228.6|3,737.0|2,224|1,657,599|21,703.4|cudaLaunchKernel|
|[[2.5]]|22,151,719|11,865|1867|1,352.0|891|38,322|1,156.0|cudaMalloc|
|[[0.0 3]]|631|1|631|631.0|631|631|0.0|cuModuleGetLoadingMode|
  
  
  
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|36.6|12,367,896|1,695|7,296.7|7,296.0|6,976|7,457|78.8|dilation_disk_kernel(const unsigned char *, unsigned char *, int, int, int)|
|36.5|12,345,086|1,695|7,283.2|7,296.0|7,008|7,488|76.1|erosion_disk_kernel(const unsigned char *, unsigned char *, int, int, int)|
|17.0|5,748,818|1,695|3,391.6|3,392.0|3,168|4,256|51.0|background_subtraction_kernel(rgb *, rgb *, float *, float, int, int, unsigned long)|
|9.9|3,335,472|1,695|1,967.8|1,889.0|1,824|2,240|110.6|apply_motion_mask_kernel(rgb *, unsigned char *, int, int, unsigned long)|
CUDA GPU MemOps Summary (by Time) (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|55.0|114,035,295|6,780|16,819.4|17,856.0|6,624|66,849|6,726.0|[CUDA memcpy Device-to-Host]|
|45.0|93,247,998|6,780|13,753.4|18,560.0|6,912|73,282|6,822.3|[CUDA memcpy Host-to-Device]|
CUDA GPU MemOps Summary (by Size) (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|1,431.936|6,780|0.211|0.230|0.077|0.307|0.084|[CUDA memcpy Device-to-Host]|
|1,041.408|6,780|0.154|0.154|0.077|0.230|0.077|[CUDA memcpy Host-to-Device]|
  
## ==**OPTIS - MASK CLEANING**==
CUDA API Summary (`cuda_api_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|22.7|168,081,560|6,780|24,790.8|19,106.0|5,581|149,531|22,432.1|cudaMemcpy|
|20.5|151,845,923|10,171|14,929.3|2,294.0|941|198,282|29,258.4|cudaMalloc|
|15.6|115,595,063|11,866|9,741.7|1,894.0|1,092|144,071|19,448.3|cudaFree|
|13.7|101,955,517|3,395|30,031.1|40,696.0|11,171|130,435|17,135.2|cudaMemcpy2D|
|11.9|88,234,066|8,475|10,411.1|9,467.0|1,032|43,111|7,166.9|cudaDeviceSynchronize|
|10.5|77,664,472|1,700|45,685.0|4,969.0|3,767|68,572,452|1,662,997.2|cudaMallocPitch|
|5.2|38,199,535|6,781|5,633.3|4,087.0|2,514|1,578,836|20,758.5|cudaLaunchKernel|
|0.0|642|1|642.0|642.0|642|642|0.0|cuModuleGetLoadingMode|
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|36.6|12,390,430|1,695|7,310.0|7,328.0|6,976|7,520|75.8|erosion_disk_kernel(const unsigned char *, unsigned char *, int, int, int)|
|36.6|12,381,795|1,695|7,304.9|7,328.0|7,008|7,488|77.8|dilation_disk_kernel(const unsigned char *, unsigned char *, int, int, int)|
|16.9|5,721,158|1,695|3,375.3|3,360.0|3,168|3,872|47.5|background_subtraction_kernel(rgb *, rgb *, float *, float, int, int, unsigned long)|
|9.9|3,338,021|1,695|1,969.3|1,889.0|1,824|2,304|118.8|apply_motion_mask_kernel(rgb *, unsigned char *, int, int, unsigned long)|
|0.0|3,264|1|3,264.0|3,264.0|3,264|3,264|0.0|init_val(rgb *, rgb *, int, int, unsigned long)|
CUDA GPU MemOps Summary (by Time) (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|58.1|83,696,635|5,085|16,459.5|17,920.0|6,592|65,249|7,734.2|[CUDA memcpy Device-to-Host]|
|41.9|60,309,064|5,090|11,848.5|7,616.0|7,040|76,833|6,589.0|[CUDA memcpy Host-to-Device]|
CUDA GPU MemOps Summary (by Size) (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|1,041.408|5,085|0.205|0.230|0.077|0.307|0.096|[CUDA memcpy Device-to-Host]|
|652.032|5,090|0.128|0.077|0.077|0.230|0.072|[CUDA memcpy Host-to-Device]|
  
  
# 3. Frame Differencing
## ==**SANS OPTIS - SANS MASK CLEANING**==
CUDA API Summary (`cuda_api_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|35.1|212,768,933|3,398|62,615.9|52,293.0|12,002|920,681|67,648.1|cudaMemcpy2D|
|34.7|210,224,103|1,699|123,734.0|77,786.0|65,743|56,554,418|1,388,689.7|cudaMallocPitch|
|17.0|103,035,942|5,097|20,215.0|2,705.0|1,803|196,819|25,582.3|cudaFree|
|8.9|54,140,564|1,699|31,866.1|25,688.0|9,327|84,018|16,472.4|cudaMemcpy|
|2.8|16,930,309|1,699|9,964.9|7,985.0|6,953|1,871,748|45,265.3|cudaLaunchKernel|
|1.5|9,024,954|3,398|2,656.0|2,405.0|1,513|26,840|1,213.4|cudaMalloc|
|0.0|962|1|962.0|962.0|962|962|0.0|cuModuleGetLoadingMode|
  
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|100.0|20,587,302|1,699|12,117.3|12,096.0|12,000|46,849|844.0|frame_differencing(rgb *, rgb *, float *, int, int, ulong, ulong)|
  
CUDA GPU MemOps Summary (by Time) (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|68.2|85,860,111|3,398|25,267.8|19,457.0|18,336|84,385|15,924.4|[CUDA memcpy Host-to-Device]|
|31.8|40,096,994|1,699|23,600.3|17,921.0|17,824|68,898|15,652.8|[CUDA memcpy Device-to-Host]|
CUDA GPU MemOps Summary (by Size) (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|782.899|3,398|0.230|0.230|0.230|0.230|0.000|[CUDA memcpy Host-to-Device]|
|391.450|1,699|0.230|0.230|0.230|0.230|0.000|[CUDA memcpy Device-to-Host]|
## ==**SANS OPTIS - AVEC MASK CLEANING**==
CUDA API Summary (`cuda_api_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|32.9|327,516,289|10,194|32,128.3|23,584.5|4,869|133,941|23,766.2|cudaMemcpy|
|20.8|206,584,648|1,699|121,591.9|82,455.0|65,884|57,798,974|1,400,218.3|cudaMallocPitch|
|18.7|186,144,909|5,097|36,520.5|41,538.0|12,062|99,988|11,267.7|cudaMemcpy2D|
|12.8|127,488,669|11,893|10,719.6|2,094.0|1,112|139,883|21,610.0|cudaFree|
|7.3|72,852,656|5,097|14,293.2|15,459.0|1,543|51,005|4,792.4|cudaDeviceSynchronize|
|5.2|51,587,633|6,796|7,590.9|4,668.0|2,224|12,956,657|157,144.2|cudaLaunchKernel|
|2.3|23,165,263|10,194|2,272.4|1,954.0|1,002|50,956|1,349.3|cudaMalloc|
|0.0|722|1|722.0|722.0|722|722|0.0|cuModuleGetLoadingMode|
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|41.7|20,139,340|1,699|11,853.6|11,841.0|11,808|12,256|25.3|frame_differencing(rgb *, rgb *, float *, int, int, ulong, ulong)|
|25.7|12,399,351|1,699|7,298.0|7,296.0|6,977|7,553|80.1|erosion_disk_kernel(const uchar *, uchar *, int, int, int)|
|25.6|12,364,381|1,699|7,277.4|7,296.0|6,976|7,488|82.3|dilation_disk_kernel(const uchar *, uchar *, int, int, int)|
|7.0|3,390,403|1,699|1,995.5|1,952.0|1,824|2,304|112.7|apply_motion_mask_kernel(rgb *, uchar *, int, int, ulong)|
CUDA GPU MemOps Summary by Time (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|63.1|152,684,519|8,495|17,973.5|17,889.0|6,272|37,537|6,403.3|[CUDA memcpy Device-to-Host]|
|36.9|89,274,217|6,796|13,136.3|16,672.5|7,008|34,081|5,822.7|[CUDA memcpy Host-to-Device]|
CUDA GPU MemOps Summary by Size (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|1,957.248|8,495|0.230|0.230|0.077|0.307|0.084|[CUDA memcpy Device-to-Host]|
|1,043.866|6,796|0.154|0.154|0.077|0.230|0.077|[CUDA memcpy Host-to-Device]|
# 4. Temporal Median
## ==**SANS OPTIS - SANS MASK CLEANING**==
  
**CUDA API Summary (**`**cuda_api_sum**`**)**
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|**71.2**|38,352,873,416|5,090|7,534,945.7|6,405,487.0|4,388|28,539,408|6,652,129.3|cudaDeviceSynchronize|
|20.6|11,098,296,507|3,399|3,265,165.2|3,415,895.0|1,843,147|5,388,485|552,558.6|cudaMemcpy|
|6.0|3,216,729,629|10,180|315,985.2|142,898.5|1,383|7,801,240|333,127.7|cudaFree|
|1.3|722,608,405|8,480|85,213.3|89,538.0|1,212|1,512,256|50,043.7|cudaMalloc|
|0.4|228,023,357|1,700|134,131.4|91,662.0|67,096|62,528,175|1,514,302.7|cudaMallocPitch|
|0.3|165,912,238|3,395|48,869.6|45,094.0|12,293|230,653|23,837.6|cudaMemcpy2D|
|0.2|83,055,998|5,090|16,317.5|9,748.0|3,246|516,448|14,189.9|cudaLaunchKernel|
|0.0|741|1|741.0|741.0|741|741|0.0|cuModuleGetLoadingMode|
  
**CUDA GPU Kernel Summary (**`**cuda_gpu_kern_sum**`**)**
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Kernel Name|
|**67.4**|25,486,633,164|1,695|15,036,361.7|15,475,842.0|21,857|28,535,548|4,409,921.4|`classify(...)`|
|32.6|12,333,993,489|1,695|7,276,692.3|6,493,536.0|16,320|10,769,181|2,065,812.3|`get_rgb_history(...)`|
|0.1|20,912,674|1,700|12,301.6|11,712.0|3,232|19,456|3,947.2|`add_sample(...)`|
  
**CUDA GPU MemOps Summary (by Time)** (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|**51.5**|5,558,584,525|3,399|1,635,358.8|72,449.0|19,808|4,476,898|1,664,785.5|[CUDA memcpy Host-to-Device]|
|48.5|5,224,702,962|3,395|1,538,940.5|1,907,484.0|18,304|5,146,379|1,550,144.8|[CUDA memcpy Device-to-Host]|
**CUDA GPU MemOps Summary (by Size)** (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|39,558.528|3,395|11.652|23.040|0.230|23.040|11.406|[CUDA memcpy Device-to-Host]|
|39,536.640|3,399|11.632|0.230|0.230|23.040|11.406|[CUDA memcpy Host-to-Device]|
  
## ==**SANS OPTIS - AVEC MASK CLEANING**==
  
CUDA API Summary (`cuda_api_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Num Calls|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|64.7|19,270,632,125|10,175|1,893,919.6|27,972.0|1,233|8,136,577|2,715,845.1|cudaDeviceSynchronize|
|24.3|7,229,828,379|10,179|710,269.0|57,288.0|6,151|3,371,382|974,219.8|cudaMemcpy|
|7.3|2,178,073,267|16,960|128,424.1|10,444.5|1,543|957,071|191,066.5|cudaFree|
|2.0|583,933,451|15,260|38,265.6|8,636.0|961|379,795|42,699.9|cudaMalloc|
|0.8|253,177,694|1,700|148,928.1|85,050.0|66,586|91,260,154|2,211,278.0|cudaMallocPitch|
|0.6|166,761,674|10,175|16,389.4|7,174.0|3,026|76,714,119|760,465.4|cudaLaunchKernel|
|0.4|110,504,728|3,395|32,549.3|40,456.0|12,384|111,600|14,027.1|cudaMemcpy2D|
|0.0|1,222|1|1,222.0|1,222.0|1,222|1,222|0.0|cuModuleGetLoadingMode|
CUDA GPU Kernel Summary (`cuda_gpu_kern_sum`)
|Time (%)|Total Time (ns)|Instances|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Name|
|---|---|---|---|---|---|---|---|---|
|[[53.4]]|10,213,278,319|1,695|6025532.9|6141479|22,081|8,132,563|1,135,476.6|classify(...)|
|[[46.4]]|8,873,359,590|1,695|5235020.4|5442582|16,864|5,500,215|857,806.1|get_rgb_history(...)|
|[[0.1]]|12,022,877|1,695|7093.1|6368|5,920|10,593|1,383.6|dilation_disk_kernel(...)|
|[[0.1 2]]|12,019,572|1,695|7091.2|6368|5,920|10,465|1,377.1|erosion_disk_kernel(...)|
|[[0.0 7]]|5,272,906|1,695|3110.9|3040|1,600|5,984|821.8|apply_motion_mask_kernel(...)|
|[[0.0 8]]|4,755,604|1,700|2797.4|2529|2,304|4,320|523.6|add_sample(...)|
  
  
CUDA GPU MemOps Summary by Time (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|53.5|3,741,566,335|6,785|551,446.8|23,904.0|6,496|3,172,613|928,809.7|[CUDA memcpy Device-to-Host]|
|46.5|3,251,799,708|6,789|478,980.7|18,497.0|6,848|2,578,009|811,801.1|[CUDA memcpy Host-to-Device]|
CUDA GPU MemOps Summary by Size (`cuda_gpu_mem_size_sum`)
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Total (MB)|Count|Avg (MB)|Med (MB)|Min (MB)|Max (MB)|StdDev (MB)|Operation|
|40,209.408|6,785|5.926|0.307|0.077|23.040|9.896|[CUDA memcpy Device-to-Host]|
|39,796.992|6,789|5.862|0.230|0.077|23.040|9.925|[CUDA memcpy Host-to-Device]|

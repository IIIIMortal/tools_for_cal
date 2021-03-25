### 计算方法的lab代码

- 矩阵的求解方法
1. lab\_1.m主函数文件
2. gaussian\_eli.m 高斯列主元消元法函数文件，使用方式为
```matlab
	result = gaussian_eli(Matrix, square_size);
```	
3. tri\_decomposition.m 列主元三角分解法函数文件，使用方式为:
```matlab
	result = tri_decompositon(Matrix, square_size);
```
4. Jacobi.m 雅可比法求解线性方程组的数值解，使用方式为：
```matlab
	result = Jacobi(Matrix, square_size, epsilon);
```
5. Gauss\_Seidel.m 高斯赛德尔法解线性方程组的数值解，使用方式为：
```matlab
	result = Gau_Seidel(Matrix, square_size, epsilon);
```
6. SOR.m 逐次超松弛解线性方程组的数值解，使用方式为：
```matlab
	result = SOR(Matrix, square_size, epsilon);
```

**目前就是这样**




* [x] 高斯消元法（列主元）
* [x] 三角分解法（列主元）
* [ ] 追逐法 
* 更新一下迭代法解一元非线性方程组
	* [x] 雅可比法 Jacobi
	* [x] 高斯赛德尔法 Gauss\_Seidel
	* [x] 逐次超松弛法 SOR


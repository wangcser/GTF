# 软件测试理论与方法

对照软件的开发阶段，软件测试可分为单元测试、集成测试、系统测试和验收测试。

## 软件测试分类

### 单元测试
目标：
- 检测程序模块中有无故障存在
方法：
- 检测被测模块的功能、数据、算法、接口等基本属性有无故障
- 各测试模块相互独立
- 是白盒测试

### 集成测试
目标：
- 发现模块之间与接口有关的问题
方法：
- 增量式集成测试就是加一个模块测试一个模块
- 非增量式集成测试就是将系统组装起来后一起测试
- 是白盒测试

### 系统测试
目标：
- 针对整个产品系统进行的测试，目的是雁阵系统是否满足了需求的规格和定义
方法：
- 基于系统需求说明书设计的黑盒测试

### 验收测试
目标：
- 向用户表明所开发的软件能够像用户预定的那样工作
方法：
- alpha 测试：在开发环境中进行的测试
- beta 测试：在用户环境中进行的测试

## 软件测试方法

### 黑盒测试
- 从软件外部对软件实施的测试，也称功能测试
- 只关心软件的输入输出、不关心软件的实现

### 白盒测试
- 基于一定的程序覆盖准则进行的测试
- 用于分析程序内部的结构，也称结构测试

## 软件测试模型

## 软件测试类型

## 测试用例及其设计方法
测试用例是对一项特定的软件产品进行的测试任务的描述、体现了测试方案、方法、技术和策略。
测试用例包括测试目标、环境、输入数据、测试步骤和预期结果，一般以测试文档的形式呈现，是测试的最小实体。
测试用例设计方法如下：
- 等价类划分法
- 边界值分析法
- 错误推测法
- 因果图法
- 判定表驱动法
- 正交实验设计法
- 功能图分析法
- 场景设计法

在测试环境中应该综合使用各种设计方法设计测试用例。但在实际的测试过程中，往往采用等价类划分法，边界值分析法和错误推导法相结合的方法来设计用例。

### 等价类划分法
将所有可能的输入数据划分为若干部分（子集），然后从每一个子集中选择少数有代表性的数据作为测试用例
等价类指某个输入域的子集合，在这个子集合中，各个输入数据对于揭露程序中的错误都是等效的，并合理地假定：测试某等价类的代表值就等于对这一类的其他值的测试
等价类划分可有两种不同的情况：有效等价类和无效等价类。
- 有效等价类是指对程序的给个说明来说是合理的、有意义的输入数据构成的集合
- 无效等价类是指不合理或无意义的输入数据构成的集合

### 边界值分析法
对输入输出的边界值进行测试的一种黑河测试方法，通常边界值分析法是作为对等价类划分法的补充，其测试用例来自等价类的边界

### 错误推导法
基于经验和直觉推测程序中所有可能存在的各种错误，从而有针对性的设计测试用例的方法，靠的是测试经验
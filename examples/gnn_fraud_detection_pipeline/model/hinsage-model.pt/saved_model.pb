��#
��
B
AddV2
x"T
y"T
z"T"
Ttype:
2	��
B
AssignVariableOp
resource
value"dtype"
dtypetype�
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
:
Maximum
x"T
y"T
z"T"
Ttype:

2	
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
=
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
3
Square
x"T
y"T"
Ttype:
2
	
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring �
@
StaticRegexFullMatch	
input

output
"
patternstring
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
P
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.4.12unknown8��
�
mean_hin_aggregator_1/w_neigh_0VarHandleOp*
_output_shapes
: *
dtype0*
shape
:o *0
shared_name!mean_hin_aggregator_1/w_neigh_0
�
3mean_hin_aggregator_1/w_neigh_0/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_1/w_neigh_0*
_output_shapes

:o *
dtype0
�
mean_hin_aggregator_1/w_selfVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *-
shared_namemean_hin_aggregator_1/w_self
�
0mean_hin_aggregator_1/w_self/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_1/w_self*
_output_shapes

: *
dtype0
�
mean_hin_aggregator_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*+
shared_namemean_hin_aggregator_1/bias
�
.mean_hin_aggregator_1/bias/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_1/bias*
_output_shapes
:@*
dtype0
�
mean_hin_aggregator_2/w_neigh_0VarHandleOp*
_output_shapes
: *
dtype0*
shape
:o *0
shared_name!mean_hin_aggregator_2/w_neigh_0
�
3mean_hin_aggregator_2/w_neigh_0/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_2/w_neigh_0*
_output_shapes

:o *
dtype0
�
mean_hin_aggregator_2/w_selfVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *-
shared_namemean_hin_aggregator_2/w_self
�
0mean_hin_aggregator_2/w_self/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_2/w_self*
_output_shapes

: *
dtype0
�
mean_hin_aggregator_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*+
shared_namemean_hin_aggregator_2/bias
�
.mean_hin_aggregator_2/bias/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_2/bias*
_output_shapes
:@*
dtype0
�
mean_hin_aggregator/w_neigh_0VarHandleOp*
_output_shapes
: *
dtype0*
shape
: *.
shared_namemean_hin_aggregator/w_neigh_0
�
1mean_hin_aggregator/w_neigh_0/Read/ReadVariableOpReadVariableOpmean_hin_aggregator/w_neigh_0*
_output_shapes

: *
dtype0
�
mean_hin_aggregator/w_neigh_1VarHandleOp*
_output_shapes
: *
dtype0*
shape
: *.
shared_namemean_hin_aggregator/w_neigh_1
�
1mean_hin_aggregator/w_neigh_1/Read/ReadVariableOpReadVariableOpmean_hin_aggregator/w_neigh_1*
_output_shapes

: *
dtype0
�
mean_hin_aggregator/w_selfVarHandleOp*
_output_shapes
: *
dtype0*
shape
:o *+
shared_namemean_hin_aggregator/w_self
�
.mean_hin_aggregator/w_self/Read/ReadVariableOpReadVariableOpmean_hin_aggregator/w_self*
_output_shapes

:o *
dtype0
�
mean_hin_aggregator/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*)
shared_namemean_hin_aggregator/bias
�
,mean_hin_aggregator/bias/Read/ReadVariableOpReadVariableOpmean_hin_aggregator/bias*
_output_shapes
:@*
dtype0
�
mean_hin_aggregator_3/w_neigh_0VarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ *0
shared_name!mean_hin_aggregator_3/w_neigh_0
�
3mean_hin_aggregator_3/w_neigh_0/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_3/w_neigh_0*
_output_shapes

:@ *
dtype0
�
mean_hin_aggregator_3/w_neigh_1VarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ *0
shared_name!mean_hin_aggregator_3/w_neigh_1
�
3mean_hin_aggregator_3/w_neigh_1/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_3/w_neigh_1*
_output_shapes

:@ *
dtype0
�
mean_hin_aggregator_3/w_selfVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ *-
shared_namemean_hin_aggregator_3/w_self
�
0mean_hin_aggregator_3/w_self/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_3/w_self*
_output_shapes

:@ *
dtype0
�
mean_hin_aggregator_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*+
shared_namemean_hin_aggregator_3/bias
�
.mean_hin_aggregator_3/bias/Read/ReadVariableOpReadVariableOpmean_hin_aggregator_3/bias*
_output_shapes
:@*
dtype0

NoOpNoOp
�I
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�I
value�IB�I B�I
�
layer-0
layer-1
layer-2
layer-3
layer-4
layer-5
layer-6
layer-7
	layer-8

layer-9
layer-10
layer-11
layer-12
layer-13
layer-14
layer-15
layer_with_weights-0
layer-16
layer_with_weights-1
layer-17
layer_with_weights-2
layer-18
layer-19
layer-20
layer-21
layer-22
layer-23
layer_with_weights-3
layer-24
layer-25
layer-26
	variables
trainable_variables
regularization_losses
	keras_api
 
signatures
 
 
 
 
R
!	variables
"trainable_variables
#regularization_losses
$	keras_api
R
%	variables
&trainable_variables
'regularization_losses
(	keras_api
 
R
)	variables
*trainable_variables
+regularization_losses
,	keras_api
R
-	variables
.trainable_variables
/regularization_losses
0	keras_api
R
1	variables
2trainable_variables
3regularization_losses
4	keras_api
R
5	variables
6trainable_variables
7regularization_losses
8	keras_api
R
9	variables
:trainable_variables
;regularization_losses
<	keras_api
R
=	variables
>trainable_variables
?regularization_losses
@	keras_api
R
A	variables
Btrainable_variables
Cregularization_losses
D	keras_api
R
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
R
I	variables
Jtrainable_variables
Kregularization_losses
L	keras_api
�
Mw_neigh
N	w_neigh_0

Ow_self
Pbias
Q	variables
Rtrainable_variables
Sregularization_losses
T	keras_api
�
Uw_neigh
V	w_neigh_0

Ww_self
Xbias
Y	variables
Ztrainable_variables
[regularization_losses
\	keras_api
�
]w_neigh
^	w_neigh_0
_	w_neigh_1

`w_self
abias
b	variables
ctrainable_variables
dregularization_losses
e	keras_api
R
f	variables
gtrainable_variables
hregularization_losses
i	keras_api
R
j	variables
ktrainable_variables
lregularization_losses
m	keras_api
R
n	variables
otrainable_variables
pregularization_losses
q	keras_api
R
r	variables
strainable_variables
tregularization_losses
u	keras_api
R
v	variables
wtrainable_variables
xregularization_losses
y	keras_api
�
zw_neigh
{	w_neigh_0
|	w_neigh_1

}w_self
~bias
	variables
�trainable_variables
�regularization_losses
�	keras_api
V
�	variables
�trainable_variables
�regularization_losses
�	keras_api
V
�	variables
�trainable_variables
�regularization_losses
�	keras_api
f
N0
O1
P2
V3
W4
X5
^6
_7
`8
a9
{10
|11
}12
~13
f
N0
O1
P2
V3
W4
X5
^6
_7
`8
a9
{10
|11
}12
~13
 
�
�layer_metrics
�metrics
�layers
 �layer_regularization_losses
�non_trainable_variables
	variables
trainable_variables
regularization_losses
 
 
 
 
�
�layer_metrics
�layers
!	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
"trainable_variables
#regularization_losses
 
 
 
�
�layer_metrics
�layers
%	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
&trainable_variables
'regularization_losses
 
 
 
�
�layer_metrics
�layers
)	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
*trainable_variables
+regularization_losses
 
 
 
�
�layer_metrics
�layers
-	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
.trainable_variables
/regularization_losses
 
 
 
�
�layer_metrics
�layers
1	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
2trainable_variables
3regularization_losses
 
 
 
�
�layer_metrics
�layers
5	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
6trainable_variables
7regularization_losses
 
 
 
�
�layer_metrics
�layers
9	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
:trainable_variables
;regularization_losses
 
 
 
�
�layer_metrics
�layers
=	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
>trainable_variables
?regularization_losses
 
 
 
�
�layer_metrics
�layers
A	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Btrainable_variables
Cregularization_losses
 
 
 
�
�layer_metrics
�layers
E	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Ftrainable_variables
Gregularization_losses
 
 
 
�
�layer_metrics
�layers
I	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Jtrainable_variables
Kregularization_losses

N0
nl
VARIABLE_VALUEmean_hin_aggregator_1/w_neigh_09layer_with_weights-0/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUE
hf
VARIABLE_VALUEmean_hin_aggregator_1/w_self6layer_with_weights-0/w_self/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEmean_hin_aggregator_1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE

N0
O1
P2

N0
O1
P2
 
�
�layer_metrics
�layers
Q	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Rtrainable_variables
Sregularization_losses

V0
nl
VARIABLE_VALUEmean_hin_aggregator_2/w_neigh_09layer_with_weights-1/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUE
hf
VARIABLE_VALUEmean_hin_aggregator_2/w_self6layer_with_weights-1/w_self/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEmean_hin_aggregator_2/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE

V0
W1
X2

V0
W1
X2
 
�
�layer_metrics
�layers
Y	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Ztrainable_variables
[regularization_losses

^0
_1
lj
VARIABLE_VALUEmean_hin_aggregator/w_neigh_09layer_with_weights-2/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUE
lj
VARIABLE_VALUEmean_hin_aggregator/w_neigh_19layer_with_weights-2/w_neigh_1/.ATTRIBUTES/VARIABLE_VALUE
fd
VARIABLE_VALUEmean_hin_aggregator/w_self6layer_with_weights-2/w_self/.ATTRIBUTES/VARIABLE_VALUE
b`
VARIABLE_VALUEmean_hin_aggregator/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

^0
_1
`2
a3

^0
_1
`2
a3
 
�
�layer_metrics
�layers
b	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
ctrainable_variables
dregularization_losses
 
 
 
�
�layer_metrics
�layers
f	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
gtrainable_variables
hregularization_losses
 
 
 
�
�layer_metrics
�layers
j	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
ktrainable_variables
lregularization_losses
 
 
 
�
�layer_metrics
�layers
n	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
otrainable_variables
pregularization_losses
 
 
 
�
�layer_metrics
�layers
r	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
strainable_variables
tregularization_losses
 
 
 
�
�layer_metrics
�layers
v	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
wtrainable_variables
xregularization_losses

{0
|1
nl
VARIABLE_VALUEmean_hin_aggregator_3/w_neigh_09layer_with_weights-3/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUE
nl
VARIABLE_VALUEmean_hin_aggregator_3/w_neigh_19layer_with_weights-3/w_neigh_1/.ATTRIBUTES/VARIABLE_VALUE
hf
VARIABLE_VALUEmean_hin_aggregator_3/w_self6layer_with_weights-3/w_self/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEmean_hin_aggregator_3/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE

{0
|1
}2
~3

{0
|1
}2
~3
 
�
�layer_metrics
�layers
	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
�trainable_variables
�regularization_losses
 
 
 
�
�layer_metrics
�layers
�	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
�trainable_variables
�regularization_losses
 
 
 
�
�layer_metrics
�layers
�	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
�trainable_variables
�regularization_losses
 
 
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
�
serving_default_input_1Placeholder*+
_output_shapes
:���������o*
dtype0* 
shape:���������o
�
serving_default_input_2Placeholder*+
_output_shapes
:���������*
dtype0* 
shape:���������
�
serving_default_input_3Placeholder*+
_output_shapes
:���������*
dtype0* 
shape:���������
�
serving_default_input_4Placeholder*+
_output_shapes
:���������@o*
dtype0* 
shape:���������@o
�
serving_default_input_5Placeholder*+
_output_shapes
:���������@o*
dtype0* 
shape:���������@o
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1serving_default_input_2serving_default_input_3serving_default_input_4serving_default_input_5mean_hin_aggregator_2/w_neigh_0mean_hin_aggregator_2/w_selfmean_hin_aggregator_2/biasmean_hin_aggregator_1/w_neigh_0mean_hin_aggregator_1/w_selfmean_hin_aggregator_1/biasmean_hin_aggregator/w_neigh_0mean_hin_aggregator/w_neigh_1mean_hin_aggregator/w_selfmean_hin_aggregator/biasmean_hin_aggregator_3/w_neigh_0mean_hin_aggregator_3/w_neigh_1mean_hin_aggregator_3/w_selfmean_hin_aggregator_3/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *+
f&R$
"__inference_signature_wrapper_7461
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename3mean_hin_aggregator_1/w_neigh_0/Read/ReadVariableOp0mean_hin_aggregator_1/w_self/Read/ReadVariableOp.mean_hin_aggregator_1/bias/Read/ReadVariableOp3mean_hin_aggregator_2/w_neigh_0/Read/ReadVariableOp0mean_hin_aggregator_2/w_self/Read/ReadVariableOp.mean_hin_aggregator_2/bias/Read/ReadVariableOp1mean_hin_aggregator/w_neigh_0/Read/ReadVariableOp1mean_hin_aggregator/w_neigh_1/Read/ReadVariableOp.mean_hin_aggregator/w_self/Read/ReadVariableOp,mean_hin_aggregator/bias/Read/ReadVariableOp3mean_hin_aggregator_3/w_neigh_0/Read/ReadVariableOp3mean_hin_aggregator_3/w_neigh_1/Read/ReadVariableOp0mean_hin_aggregator_3/w_self/Read/ReadVariableOp.mean_hin_aggregator_3/bias/Read/ReadVariableOpConst*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *&
f!R
__inference__traced_save_9497
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamemean_hin_aggregator_1/w_neigh_0mean_hin_aggregator_1/w_selfmean_hin_aggregator_1/biasmean_hin_aggregator_2/w_neigh_0mean_hin_aggregator_2/w_selfmean_hin_aggregator_2/biasmean_hin_aggregator/w_neigh_0mean_hin_aggregator/w_neigh_1mean_hin_aggregator/w_selfmean_hin_aggregator/biasmean_hin_aggregator_3/w_neigh_0mean_hin_aggregator_3/w_neigh_1mean_hin_aggregator_3/w_selfmean_hin_aggregator_3/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *)
f$R"
 __inference__traced_restore_9549��
�
�
&__inference_model_1_layer_call_fn_8280
inputs_0
inputs_1
inputs_2
inputs_3
inputs_4
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1inputs_2inputs_3inputs_4unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_72962
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:U Q
+
_output_shapes
:���������o
"
_user_specified_name
inputs/0:UQ
+
_output_shapes
:���������
"
_user_specified_name
inputs/1:UQ
+
_output_shapes
:���������
"
_user_specified_name
inputs/2:UQ
+
_output_shapes
:���������@o
"
_user_specified_name
inputs/3:UQ
+
_output_shapes
:���������@o
"
_user_specified_name
inputs/4
�D
�
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_9349
x_0
x_1
x_2#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource#
shape_5_readvariableop_resource!
add_2_readvariableop_resource
identity��add_2/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOp�transpose_2/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:@ 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2v
Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean_1/reduction_indicesv
Mean_1Meanx_2!Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
Mean_1Q
Shape_2ShapeMean_1:output:0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape_3/shape~
	Reshape_3ReshapeMean_1:output:0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������@2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

:@ 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5E
Shape_4Shapex_0*
T0*
_output_shapes
:2	
Shape_4b
	unstack_4UnpackShape_4:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_4�
Shape_5/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_5/ReadVariableOpc
Shape_5Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_5`
	unstack_5UnpackShape_5:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_5s
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape_6/shaper
	Reshape_6Reshapex_0Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������@2
	Reshape_6�
transpose_2/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose_2/ReadVariableOpu
transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_2/perm�
transpose_2	Transpose"transpose_2/ReadVariableOp:value:0transpose_2/perm:output:0*
T0*
_output_shapes

:@ 2
transpose_2s
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_7/shapeu
	Reshape_7Reshapetranspose_2:y:0Reshape_7/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_7x
MatMul_2MatMulReshape_6:output:0Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_2h
Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_8/shape/1h
Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_8/shape/2�
Reshape_8/shapePackunstack_4:output:0Reshape_8/shape/1:output:0Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_8/shape�
	Reshape_8ReshapeMatMul_2:product:0Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_8S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
addj
add_1AddV2add:z:0Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
add_1[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
	truediv/yr
truedivRealDiv	add_1:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_8:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_2/ReadVariableOpReadVariableOpadd_2_readvariableop_resource*
_output_shapes
:@*
dtype02
add_2/ReadVariableOp|
add_2AddV2concat:output:0add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_2�
IdentityIdentity	add_2:z:0^add_2/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp^transpose_2/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������@:���������@:���������@::::2,
add_2/ReadVariableOpadd_2/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp28
transpose_2/ReadVariableOptranspose_2/ReadVariableOp:P L
+
_output_shapes
:���������@

_user_specified_namex/0:TP
/
_output_shapes
:���������@

_user_specified_namex/1:TP
/
_output_shapes
:���������@

_user_specified_namex/2
�
�
&__inference_model_1_layer_call_fn_8317
inputs_0
inputs_1
inputs_2
inputs_3
inputs_4
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1inputs_2inputs_3inputs_4unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_73912
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:U Q
+
_output_shapes
:���������o
"
_user_specified_name
inputs/0:UQ
+
_output_shapes
:���������
"
_user_specified_name
inputs/1:UQ
+
_output_shapes
:���������
"
_user_specified_name
inputs/2:UQ
+
_output_shapes
:���������@o
"
_user_specified_name
inputs/3:UQ
+
_output_shapes
:���������@o
"
_user_specified_name
inputs/4
�0
�
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_8641
x_0
x_1#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource!
add_1_readvariableop_resource
identity��add_1/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:o 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2E
Shape_2Shapex_0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shaper
	Reshape_3Reshapex_0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
add[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
	truediv/yp
truedivRealDivadd:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_5:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_1/ReadVariableOpReadVariableOpadd_1_readvariableop_resource*
_output_shapes
:@*
dtype02
add_1/ReadVariableOp|
add_1AddV2concat:output:0add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_1U
ReluRelu	add_1:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_1/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::2,
add_1/ReadVariableOpadd_1/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp:P L
+
_output_shapes
:���������

_user_specified_namex/0:TP
/
_output_shapes
:��������� o

_user_specified_namex/1
�
�
"__inference_signature_wrapper_7461
input_1
input_2
input_3
input_4
input_5
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1input_2input_3input_4input_5unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *(
f#R!
__inference__wrapped_model_59592
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:T P
+
_output_shapes
:���������o
!
_user_specified_name	input_1:TP
+
_output_shapes
:���������
!
_user_specified_name	input_2:TP
+
_output_shapes
:���������
!
_user_specified_name	input_3:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_4:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_5
�
b
C__inference_dropout_1_layer_call_and_return_conditional_losses_6549

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:���������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:���������*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:���������2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�

\
@__inference_lambda_layer_call_and_return_conditional_losses_7159

inputs
identityn
l2_normalize/SquareSquareinputs*
T0*'
_output_shapes
:���������@2
l2_normalize/Square�
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
���������2$
"l2_normalize/Sum/reduction_indices�
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+2
l2_normalize/Maximum/y�
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������2
l2_normalize/Maximum}
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������2
l2_normalize/Rsqrtu
l2_normalizeMulinputsl2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������@2
l2_normalized
IdentityIdentityl2_normalize:z:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*&
_input_shapes
:���������@:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
C__inference_dropout_4_layer_call_and_return_conditional_losses_8410

inputs

identity_1^
IdentityIdentityinputs*
T0*+
_output_shapes
:���������2

Identitym

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:���������2

Identity_1"!

identity_1Identity_1:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
a
C__inference_dropout_2_layer_call_and_return_conditional_losses_8518

inputs

identity_1^
IdentityIdentityinputs*
T0*+
_output_shapes
:���������o2

Identitym

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:���������o2

Identity_1"!

identity_1Identity_1:output:0**
_input_shapes
:���������o:S O
+
_output_shapes
:���������o
 
_user_specified_nameinputs
�
D
(__inference_reshape_3_layer_call_fn_8355

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_3_layer_call_and_return_conditional_losses_59812
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@o:S O
+
_output_shapes
:���������@o
 
_user_specified_nameinputs
�0
�
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_8700
x_0
x_1#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource!
add_1_readvariableop_resource
identity��add_1/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:o 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2E
Shape_2Shapex_0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shaper
	Reshape_3Reshapex_0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
add[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
	truediv/yp
truedivRealDivadd:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_5:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_1/ReadVariableOpReadVariableOpadd_1_readvariableop_resource*
_output_shapes
:@*
dtype02
add_1/ReadVariableOp|
add_1AddV2concat:output:0add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_1U
ReluRelu	add_1:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_1/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::2,
add_1/ReadVariableOpadd_1/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp:P L
+
_output_shapes
:���������

_user_specified_namex/0:TP
/
_output_shapes
:��������� o

_user_specified_namex/1
�
_
C__inference_reshape_1_layer_call_and_return_conditional_losses_6145

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
D
(__inference_reshape_4_layer_call_fn_9083

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_4_layer_call_and_return_conditional_losses_66032
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
b
C__inference_dropout_8_layer_call_and_return_conditional_losses_9168

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:���������@2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:���������@*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������@2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������@2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:���������@2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
��
�
A__inference_model_1_layer_call_and_return_conditional_losses_8243
inputs_0
inputs_1
inputs_2
inputs_3
inputs_49
5mean_hin_aggregator_2_shape_1_readvariableop_resource9
5mean_hin_aggregator_2_shape_3_readvariableop_resource7
3mean_hin_aggregator_2_add_1_readvariableop_resource9
5mean_hin_aggregator_1_shape_1_readvariableop_resource9
5mean_hin_aggregator_1_shape_3_readvariableop_resource7
3mean_hin_aggregator_1_add_1_readvariableop_resource7
3mean_hin_aggregator_shape_1_readvariableop_resource7
3mean_hin_aggregator_shape_3_readvariableop_resource7
3mean_hin_aggregator_shape_5_readvariableop_resource5
1mean_hin_aggregator_add_2_readvariableop_resource9
5mean_hin_aggregator_3_shape_1_readvariableop_resource9
5mean_hin_aggregator_3_shape_3_readvariableop_resource9
5mean_hin_aggregator_3_shape_5_readvariableop_resource7
3mean_hin_aggregator_3_add_2_readvariableop_resource
identity��(mean_hin_aggregator/add_2/ReadVariableOp�,mean_hin_aggregator/transpose/ReadVariableOp�.mean_hin_aggregator/transpose_1/ReadVariableOp�.mean_hin_aggregator/transpose_2/ReadVariableOp�*mean_hin_aggregator_1/add_1/ReadVariableOp�.mean_hin_aggregator_1/transpose/ReadVariableOp�0mean_hin_aggregator_1/transpose_1/ReadVariableOp�*mean_hin_aggregator_2/add_1/ReadVariableOp�.mean_hin_aggregator_2/transpose/ReadVariableOp�0mean_hin_aggregator_2/transpose_1/ReadVariableOp�*mean_hin_aggregator_3/add_2/ReadVariableOp�.mean_hin_aggregator_3/transpose/ReadVariableOp�0mean_hin_aggregator_3/transpose_1/ReadVariableOp�0mean_hin_aggregator_3/transpose_2/ReadVariableOpZ
reshape_3/ShapeShapeinputs_4*
T0*
_output_shapes
:2
reshape_3/Shape�
reshape_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_3/strided_slice/stack�
reshape_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_3/strided_slice/stack_1�
reshape_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_3/strided_slice/stack_2�
reshape_3/strided_sliceStridedSlicereshape_3/Shape:output:0&reshape_3/strided_slice/stack:output:0(reshape_3/strided_slice/stack_1:output:0(reshape_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_3/strided_slicex
reshape_3/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_3/Reshape/shape/1x
reshape_3/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
reshape_3/Reshape/shape/2x
reshape_3/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2
reshape_3/Reshape/shape/3�
reshape_3/Reshape/shapePack reshape_3/strided_slice:output:0"reshape_3/Reshape/shape/1:output:0"reshape_3/Reshape/shape/2:output:0"reshape_3/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_3/Reshape/shape�
reshape_3/ReshapeReshapeinputs_4 reshape_3/Reshape/shape:output:0*
T0*/
_output_shapes
:��������� o2
reshape_3/ReshapeZ
reshape_2/ShapeShapeinputs_3*
T0*
_output_shapes
:2
reshape_2/Shape�
reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_2/strided_slice/stack�
reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_1�
reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_2�
reshape_2/strided_sliceStridedSlicereshape_2/Shape:output:0&reshape_2/strided_slice/stack:output:0(reshape_2/strided_slice/stack_1:output:0(reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_2/strided_slicex
reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_2/Reshape/shape/1x
reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
reshape_2/Reshape/shape/2x
reshape_2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2
reshape_2/Reshape/shape/3�
reshape_2/Reshape/shapePack reshape_2/strided_slice:output:0"reshape_2/Reshape/shape/1:output:0"reshape_2/Reshape/shape/2:output:0"reshape_2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_2/Reshape/shape�
reshape_2/ReshapeReshapeinputs_3 reshape_2/Reshape/shape:output:0*
T0*/
_output_shapes
:��������� o2
reshape_2/Reshapet
dropout_6/IdentityIdentityinputs_2*
T0*+
_output_shapes
:���������2
dropout_6/Identity�
dropout_5/IdentityIdentityreshape_3/Reshape:output:0*
T0*/
_output_shapes
:��������� o2
dropout_5/Identityt
dropout_4/IdentityIdentityinputs_1*
T0*+
_output_shapes
:���������2
dropout_4/Identity�
dropout_3/IdentityIdentityreshape_2/Reshape:output:0*
T0*/
_output_shapes
:��������� o2
dropout_3/IdentityZ
reshape_1/ShapeShapeinputs_2*
T0*
_output_shapes
:2
reshape_1/Shape�
reshape_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_1/strided_slice/stack�
reshape_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_1/strided_slice/stack_1�
reshape_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_1/strided_slice/stack_2�
reshape_1/strided_sliceStridedSlicereshape_1/Shape:output:0&reshape_1/strided_slice/stack:output:0(reshape_1/strided_slice/stack_1:output:0(reshape_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_1/strided_slicex
reshape_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_1/Reshape/shape/1x
reshape_1/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_1/Reshape/shape/2x
reshape_1/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_1/Reshape/shape/3�
reshape_1/Reshape/shapePack reshape_1/strided_slice:output:0"reshape_1/Reshape/shape/1:output:0"reshape_1/Reshape/shape/2:output:0"reshape_1/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_1/Reshape/shape�
reshape_1/ReshapeReshapeinputs_2 reshape_1/Reshape/shape:output:0*
T0*/
_output_shapes
:���������2
reshape_1/ReshapeV
reshape/ShapeShapeinputs_1*
T0*
_output_shapes
:2
reshape/Shape�
reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape/strided_slice/stack�
reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
reshape/strided_slice/stack_1�
reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
reshape/strided_slice/stack_2�
reshape/strided_sliceStridedSlicereshape/Shape:output:0$reshape/strided_slice/stack:output:0&reshape/strided_slice/stack_1:output:0&reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape/strided_slicet
reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape/Reshape/shape/1t
reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
reshape/Reshape/shape/2t
reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2
reshape/Reshape/shape/3�
reshape/Reshape/shapePackreshape/strided_slice:output:0 reshape/Reshape/shape/1:output:0 reshape/Reshape/shape/2:output:0 reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape/Reshape/shape�
reshape/ReshapeReshapeinputs_1reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:���������2
reshape/Reshape�
,mean_hin_aggregator_2/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,mean_hin_aggregator_2/Mean/reduction_indices�
mean_hin_aggregator_2/MeanMeandropout_5/Identity:output:05mean_hin_aggregator_2/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
mean_hin_aggregator_2/Mean�
mean_hin_aggregator_2/ShapeShape#mean_hin_aggregator_2/Mean:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_2/Shape�
mean_hin_aggregator_2/unstackUnpack$mean_hin_aggregator_2/Shape:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator_2/unstack�
,mean_hin_aggregator_2/Shape_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_2_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype02.
,mean_hin_aggregator_2/Shape_1/ReadVariableOp�
mean_hin_aggregator_2/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2
mean_hin_aggregator_2/Shape_1�
mean_hin_aggregator_2/unstack_1Unpack&mean_hin_aggregator_2/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_2/unstack_1�
#mean_hin_aggregator_2/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2%
#mean_hin_aggregator_2/Reshape/shape�
mean_hin_aggregator_2/ReshapeReshape#mean_hin_aggregator_2/Mean:output:0,mean_hin_aggregator_2/Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2
mean_hin_aggregator_2/Reshape�
.mean_hin_aggregator_2/transpose/ReadVariableOpReadVariableOp5mean_hin_aggregator_2_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype020
.mean_hin_aggregator_2/transpose/ReadVariableOp�
$mean_hin_aggregator_2/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator_2/transpose/perm�
mean_hin_aggregator_2/transpose	Transpose6mean_hin_aggregator_2/transpose/ReadVariableOp:value:0-mean_hin_aggregator_2/transpose/perm:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator_2/transpose�
%mean_hin_aggregator_2/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2'
%mean_hin_aggregator_2/Reshape_1/shape�
mean_hin_aggregator_2/Reshape_1Reshape#mean_hin_aggregator_2/transpose:y:0.mean_hin_aggregator_2/Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator_2/Reshape_1�
mean_hin_aggregator_2/MatMulMatMul&mean_hin_aggregator_2/Reshape:output:0(mean_hin_aggregator_2/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator_2/MatMul�
'mean_hin_aggregator_2/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_2/Reshape_2/shape/1�
'mean_hin_aggregator_2/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_2/Reshape_2/shape/2�
%mean_hin_aggregator_2/Reshape_2/shapePack&mean_hin_aggregator_2/unstack:output:00mean_hin_aggregator_2/Reshape_2/shape/1:output:00mean_hin_aggregator_2/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_2/Reshape_2/shape�
mean_hin_aggregator_2/Reshape_2Reshape&mean_hin_aggregator_2/MatMul:product:0.mean_hin_aggregator_2/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_2/Reshape_2�
mean_hin_aggregator_2/Shape_2Shapedropout_6/Identity:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_2/Shape_2�
mean_hin_aggregator_2/unstack_2Unpack&mean_hin_aggregator_2/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2!
mean_hin_aggregator_2/unstack_2�
,mean_hin_aggregator_2/Shape_3/ReadVariableOpReadVariableOp5mean_hin_aggregator_2_shape_3_readvariableop_resource*
_output_shapes

: *
dtype02.
,mean_hin_aggregator_2/Shape_3/ReadVariableOp�
mean_hin_aggregator_2/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2
mean_hin_aggregator_2/Shape_3�
mean_hin_aggregator_2/unstack_3Unpack&mean_hin_aggregator_2/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_2/unstack_3�
%mean_hin_aggregator_2/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2'
%mean_hin_aggregator_2/Reshape_3/shape�
mean_hin_aggregator_2/Reshape_3Reshapedropout_6/Identity:output:0.mean_hin_aggregator_2/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2!
mean_hin_aggregator_2/Reshape_3�
0mean_hin_aggregator_2/transpose_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_2_shape_3_readvariableop_resource*
_output_shapes

: *
dtype022
0mean_hin_aggregator_2/transpose_1/ReadVariableOp�
&mean_hin_aggregator_2/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2(
&mean_hin_aggregator_2/transpose_1/perm�
!mean_hin_aggregator_2/transpose_1	Transpose8mean_hin_aggregator_2/transpose_1/ReadVariableOp:value:0/mean_hin_aggregator_2/transpose_1/perm:output:0*
T0*
_output_shapes

: 2#
!mean_hin_aggregator_2/transpose_1�
%mean_hin_aggregator_2/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2'
%mean_hin_aggregator_2/Reshape_4/shape�
mean_hin_aggregator_2/Reshape_4Reshape%mean_hin_aggregator_2/transpose_1:y:0.mean_hin_aggregator_2/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2!
mean_hin_aggregator_2/Reshape_4�
mean_hin_aggregator_2/MatMul_1MatMul(mean_hin_aggregator_2/Reshape_3:output:0(mean_hin_aggregator_2/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2 
mean_hin_aggregator_2/MatMul_1�
'mean_hin_aggregator_2/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_2/Reshape_5/shape/1�
'mean_hin_aggregator_2/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_2/Reshape_5/shape/2�
%mean_hin_aggregator_2/Reshape_5/shapePack(mean_hin_aggregator_2/unstack_2:output:00mean_hin_aggregator_2/Reshape_5/shape/1:output:00mean_hin_aggregator_2/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_2/Reshape_5/shape�
mean_hin_aggregator_2/Reshape_5Reshape(mean_hin_aggregator_2/MatMul_1:product:0.mean_hin_aggregator_2/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_2/Reshape_5
mean_hin_aggregator_2/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
mean_hin_aggregator_2/add/x�
mean_hin_aggregator_2/addAddV2$mean_hin_aggregator_2/add/x:output:0(mean_hin_aggregator_2/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_2/add�
mean_hin_aggregator_2/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2!
mean_hin_aggregator_2/truediv/y�
mean_hin_aggregator_2/truedivRealDivmean_hin_aggregator_2/add:z:0(mean_hin_aggregator_2/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_2/truediv�
!mean_hin_aggregator_2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2#
!mean_hin_aggregator_2/concat/axis�
mean_hin_aggregator_2/concatConcatV2(mean_hin_aggregator_2/Reshape_5:output:0!mean_hin_aggregator_2/truediv:z:0*mean_hin_aggregator_2/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_2/concat�
*mean_hin_aggregator_2/add_1/ReadVariableOpReadVariableOp3mean_hin_aggregator_2_add_1_readvariableop_resource*
_output_shapes
:@*
dtype02,
*mean_hin_aggregator_2/add_1/ReadVariableOp�
mean_hin_aggregator_2/add_1AddV2%mean_hin_aggregator_2/concat:output:02mean_hin_aggregator_2/add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_2/add_1�
mean_hin_aggregator_2/ReluRelumean_hin_aggregator_2/add_1:z:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_2/Relu�
,mean_hin_aggregator_1/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,mean_hin_aggregator_1/Mean/reduction_indices�
mean_hin_aggregator_1/MeanMeandropout_3/Identity:output:05mean_hin_aggregator_1/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
mean_hin_aggregator_1/Mean�
mean_hin_aggregator_1/ShapeShape#mean_hin_aggregator_1/Mean:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_1/Shape�
mean_hin_aggregator_1/unstackUnpack$mean_hin_aggregator_1/Shape:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator_1/unstack�
,mean_hin_aggregator_1/Shape_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_1_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype02.
,mean_hin_aggregator_1/Shape_1/ReadVariableOp�
mean_hin_aggregator_1/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2
mean_hin_aggregator_1/Shape_1�
mean_hin_aggregator_1/unstack_1Unpack&mean_hin_aggregator_1/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_1/unstack_1�
#mean_hin_aggregator_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2%
#mean_hin_aggregator_1/Reshape/shape�
mean_hin_aggregator_1/ReshapeReshape#mean_hin_aggregator_1/Mean:output:0,mean_hin_aggregator_1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2
mean_hin_aggregator_1/Reshape�
.mean_hin_aggregator_1/transpose/ReadVariableOpReadVariableOp5mean_hin_aggregator_1_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype020
.mean_hin_aggregator_1/transpose/ReadVariableOp�
$mean_hin_aggregator_1/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator_1/transpose/perm�
mean_hin_aggregator_1/transpose	Transpose6mean_hin_aggregator_1/transpose/ReadVariableOp:value:0-mean_hin_aggregator_1/transpose/perm:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator_1/transpose�
%mean_hin_aggregator_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2'
%mean_hin_aggregator_1/Reshape_1/shape�
mean_hin_aggregator_1/Reshape_1Reshape#mean_hin_aggregator_1/transpose:y:0.mean_hin_aggregator_1/Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator_1/Reshape_1�
mean_hin_aggregator_1/MatMulMatMul&mean_hin_aggregator_1/Reshape:output:0(mean_hin_aggregator_1/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator_1/MatMul�
'mean_hin_aggregator_1/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_1/Reshape_2/shape/1�
'mean_hin_aggregator_1/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_1/Reshape_2/shape/2�
%mean_hin_aggregator_1/Reshape_2/shapePack&mean_hin_aggregator_1/unstack:output:00mean_hin_aggregator_1/Reshape_2/shape/1:output:00mean_hin_aggregator_1/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_1/Reshape_2/shape�
mean_hin_aggregator_1/Reshape_2Reshape&mean_hin_aggregator_1/MatMul:product:0.mean_hin_aggregator_1/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_1/Reshape_2�
mean_hin_aggregator_1/Shape_2Shapedropout_4/Identity:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_1/Shape_2�
mean_hin_aggregator_1/unstack_2Unpack&mean_hin_aggregator_1/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2!
mean_hin_aggregator_1/unstack_2�
,mean_hin_aggregator_1/Shape_3/ReadVariableOpReadVariableOp5mean_hin_aggregator_1_shape_3_readvariableop_resource*
_output_shapes

: *
dtype02.
,mean_hin_aggregator_1/Shape_3/ReadVariableOp�
mean_hin_aggregator_1/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2
mean_hin_aggregator_1/Shape_3�
mean_hin_aggregator_1/unstack_3Unpack&mean_hin_aggregator_1/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_1/unstack_3�
%mean_hin_aggregator_1/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2'
%mean_hin_aggregator_1/Reshape_3/shape�
mean_hin_aggregator_1/Reshape_3Reshapedropout_4/Identity:output:0.mean_hin_aggregator_1/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2!
mean_hin_aggregator_1/Reshape_3�
0mean_hin_aggregator_1/transpose_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_1_shape_3_readvariableop_resource*
_output_shapes

: *
dtype022
0mean_hin_aggregator_1/transpose_1/ReadVariableOp�
&mean_hin_aggregator_1/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2(
&mean_hin_aggregator_1/transpose_1/perm�
!mean_hin_aggregator_1/transpose_1	Transpose8mean_hin_aggregator_1/transpose_1/ReadVariableOp:value:0/mean_hin_aggregator_1/transpose_1/perm:output:0*
T0*
_output_shapes

: 2#
!mean_hin_aggregator_1/transpose_1�
%mean_hin_aggregator_1/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2'
%mean_hin_aggregator_1/Reshape_4/shape�
mean_hin_aggregator_1/Reshape_4Reshape%mean_hin_aggregator_1/transpose_1:y:0.mean_hin_aggregator_1/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2!
mean_hin_aggregator_1/Reshape_4�
mean_hin_aggregator_1/MatMul_1MatMul(mean_hin_aggregator_1/Reshape_3:output:0(mean_hin_aggregator_1/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2 
mean_hin_aggregator_1/MatMul_1�
'mean_hin_aggregator_1/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_1/Reshape_5/shape/1�
'mean_hin_aggregator_1/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_1/Reshape_5/shape/2�
%mean_hin_aggregator_1/Reshape_5/shapePack(mean_hin_aggregator_1/unstack_2:output:00mean_hin_aggregator_1/Reshape_5/shape/1:output:00mean_hin_aggregator_1/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_1/Reshape_5/shape�
mean_hin_aggregator_1/Reshape_5Reshape(mean_hin_aggregator_1/MatMul_1:product:0.mean_hin_aggregator_1/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_1/Reshape_5
mean_hin_aggregator_1/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
mean_hin_aggregator_1/add/x�
mean_hin_aggregator_1/addAddV2$mean_hin_aggregator_1/add/x:output:0(mean_hin_aggregator_1/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_1/add�
mean_hin_aggregator_1/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2!
mean_hin_aggregator_1/truediv/y�
mean_hin_aggregator_1/truedivRealDivmean_hin_aggregator_1/add:z:0(mean_hin_aggregator_1/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_1/truediv�
!mean_hin_aggregator_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2#
!mean_hin_aggregator_1/concat/axis�
mean_hin_aggregator_1/concatConcatV2(mean_hin_aggregator_1/Reshape_5:output:0!mean_hin_aggregator_1/truediv:z:0*mean_hin_aggregator_1/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_1/concat�
*mean_hin_aggregator_1/add_1/ReadVariableOpReadVariableOp3mean_hin_aggregator_1_add_1_readvariableop_resource*
_output_shapes
:@*
dtype02,
*mean_hin_aggregator_1/add_1/ReadVariableOp�
mean_hin_aggregator_1/add_1AddV2%mean_hin_aggregator_1/concat:output:02mean_hin_aggregator_1/add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_1/add_1�
mean_hin_aggregator_1/ReluRelumean_hin_aggregator_1/add_1:z:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_1/Relut
dropout_2/IdentityIdentityinputs_0*
T0*+
_output_shapes
:���������o2
dropout_2/Identity�
dropout/IdentityIdentityreshape/Reshape:output:0*
T0*/
_output_shapes
:���������2
dropout/Identity�
dropout_1/IdentityIdentityreshape_1/Reshape:output:0*
T0*/
_output_shapes
:���������2
dropout_1/Identityz
reshape_5/ShapeShape(mean_hin_aggregator_2/Relu:activations:0*
T0*
_output_shapes
:2
reshape_5/Shape�
reshape_5/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_5/strided_slice/stack�
reshape_5/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_5/strided_slice/stack_1�
reshape_5/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_5/strided_slice/stack_2�
reshape_5/strided_sliceStridedSlicereshape_5/Shape:output:0&reshape_5/strided_slice/stack:output:0(reshape_5/strided_slice/stack_1:output:0(reshape_5/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_5/strided_slicex
reshape_5/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_5/Reshape/shape/1x
reshape_5/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_5/Reshape/shape/2x
reshape_5/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2
reshape_5/Reshape/shape/3�
reshape_5/Reshape/shapePack reshape_5/strided_slice:output:0"reshape_5/Reshape/shape/1:output:0"reshape_5/Reshape/shape/2:output:0"reshape_5/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_5/Reshape/shape�
reshape_5/ReshapeReshape(mean_hin_aggregator_2/Relu:activations:0 reshape_5/Reshape/shape:output:0*
T0*/
_output_shapes
:���������@2
reshape_5/Reshapez
reshape_4/ShapeShape(mean_hin_aggregator_1/Relu:activations:0*
T0*
_output_shapes
:2
reshape_4/Shape�
reshape_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_4/strided_slice/stack�
reshape_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_4/strided_slice/stack_1�
reshape_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_4/strided_slice/stack_2�
reshape_4/strided_sliceStridedSlicereshape_4/Shape:output:0&reshape_4/strided_slice/stack:output:0(reshape_4/strided_slice/stack_1:output:0(reshape_4/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_4/strided_slicex
reshape_4/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_4/Reshape/shape/1x
reshape_4/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_4/Reshape/shape/2x
reshape_4/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2
reshape_4/Reshape/shape/3�
reshape_4/Reshape/shapePack reshape_4/strided_slice:output:0"reshape_4/Reshape/shape/1:output:0"reshape_4/Reshape/shape/2:output:0"reshape_4/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_4/Reshape/shape�
reshape_4/ReshapeReshape(mean_hin_aggregator_1/Relu:activations:0 reshape_4/Reshape/shape:output:0*
T0*/
_output_shapes
:���������@2
reshape_4/Reshape�
*mean_hin_aggregator/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2,
*mean_hin_aggregator/Mean/reduction_indices�
mean_hin_aggregator/MeanMeandropout/Identity:output:03mean_hin_aggregator/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
mean_hin_aggregator/Mean�
mean_hin_aggregator/ShapeShape!mean_hin_aggregator/Mean:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator/Shape�
mean_hin_aggregator/unstackUnpack"mean_hin_aggregator/Shape:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator/unstack�
*mean_hin_aggregator/Shape_1/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_1_readvariableop_resource*
_output_shapes

: *
dtype02,
*mean_hin_aggregator/Shape_1/ReadVariableOp�
mean_hin_aggregator/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"       2
mean_hin_aggregator/Shape_1�
mean_hin_aggregator/unstack_1Unpack$mean_hin_aggregator/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2
mean_hin_aggregator/unstack_1�
!mean_hin_aggregator/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2#
!mean_hin_aggregator/Reshape/shape�
mean_hin_aggregator/ReshapeReshape!mean_hin_aggregator/Mean:output:0*mean_hin_aggregator/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2
mean_hin_aggregator/Reshape�
,mean_hin_aggregator/transpose/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_1_readvariableop_resource*
_output_shapes

: *
dtype02.
,mean_hin_aggregator/transpose/ReadVariableOp�
"mean_hin_aggregator/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2$
"mean_hin_aggregator/transpose/perm�
mean_hin_aggregator/transpose	Transpose4mean_hin_aggregator/transpose/ReadVariableOp:value:0+mean_hin_aggregator/transpose/perm:output:0*
T0*
_output_shapes

: 2
mean_hin_aggregator/transpose�
#mean_hin_aggregator/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2%
#mean_hin_aggregator/Reshape_1/shape�
mean_hin_aggregator/Reshape_1Reshape!mean_hin_aggregator/transpose:y:0,mean_hin_aggregator/Reshape_1/shape:output:0*
T0*
_output_shapes

: 2
mean_hin_aggregator/Reshape_1�
mean_hin_aggregator/MatMulMatMul$mean_hin_aggregator/Reshape:output:0&mean_hin_aggregator/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator/MatMul�
%mean_hin_aggregator/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2'
%mean_hin_aggregator/Reshape_2/shape/1�
%mean_hin_aggregator/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2'
%mean_hin_aggregator/Reshape_2/shape/2�
#mean_hin_aggregator/Reshape_2/shapePack$mean_hin_aggregator/unstack:output:0.mean_hin_aggregator/Reshape_2/shape/1:output:0.mean_hin_aggregator/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2%
#mean_hin_aggregator/Reshape_2/shape�
mean_hin_aggregator/Reshape_2Reshape$mean_hin_aggregator/MatMul:product:0,mean_hin_aggregator/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/Reshape_2�
,mean_hin_aggregator/Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,mean_hin_aggregator/Mean_1/reduction_indices�
mean_hin_aggregator/Mean_1Meandropout_1/Identity:output:05mean_hin_aggregator/Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
mean_hin_aggregator/Mean_1�
mean_hin_aggregator/Shape_2Shape#mean_hin_aggregator/Mean_1:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator/Shape_2�
mean_hin_aggregator/unstack_2Unpack$mean_hin_aggregator/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator/unstack_2�
*mean_hin_aggregator/Shape_3/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_3_readvariableop_resource*
_output_shapes

: *
dtype02,
*mean_hin_aggregator/Shape_3/ReadVariableOp�
mean_hin_aggregator/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2
mean_hin_aggregator/Shape_3�
mean_hin_aggregator/unstack_3Unpack$mean_hin_aggregator/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2
mean_hin_aggregator/unstack_3�
#mean_hin_aggregator/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2%
#mean_hin_aggregator/Reshape_3/shape�
mean_hin_aggregator/Reshape_3Reshape#mean_hin_aggregator/Mean_1:output:0,mean_hin_aggregator/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
mean_hin_aggregator/Reshape_3�
.mean_hin_aggregator/transpose_1/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_3_readvariableop_resource*
_output_shapes

: *
dtype020
.mean_hin_aggregator/transpose_1/ReadVariableOp�
$mean_hin_aggregator/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator/transpose_1/perm�
mean_hin_aggregator/transpose_1	Transpose6mean_hin_aggregator/transpose_1/ReadVariableOp:value:0-mean_hin_aggregator/transpose_1/perm:output:0*
T0*
_output_shapes

: 2!
mean_hin_aggregator/transpose_1�
#mean_hin_aggregator/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2%
#mean_hin_aggregator/Reshape_4/shape�
mean_hin_aggregator/Reshape_4Reshape#mean_hin_aggregator/transpose_1:y:0,mean_hin_aggregator/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
mean_hin_aggregator/Reshape_4�
mean_hin_aggregator/MatMul_1MatMul&mean_hin_aggregator/Reshape_3:output:0&mean_hin_aggregator/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator/MatMul_1�
%mean_hin_aggregator/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2'
%mean_hin_aggregator/Reshape_5/shape/1�
%mean_hin_aggregator/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2'
%mean_hin_aggregator/Reshape_5/shape/2�
#mean_hin_aggregator/Reshape_5/shapePack&mean_hin_aggregator/unstack_2:output:0.mean_hin_aggregator/Reshape_5/shape/1:output:0.mean_hin_aggregator/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2%
#mean_hin_aggregator/Reshape_5/shape�
mean_hin_aggregator/Reshape_5Reshape&mean_hin_aggregator/MatMul_1:product:0,mean_hin_aggregator/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/Reshape_5�
mean_hin_aggregator/Shape_4Shapedropout_2/Identity:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator/Shape_4�
mean_hin_aggregator/unstack_4Unpack$mean_hin_aggregator/Shape_4:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator/unstack_4�
*mean_hin_aggregator/Shape_5/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_5_readvariableop_resource*
_output_shapes

:o *
dtype02,
*mean_hin_aggregator/Shape_5/ReadVariableOp�
mean_hin_aggregator/Shape_5Const*
_output_shapes
:*
dtype0*
valueB"o       2
mean_hin_aggregator/Shape_5�
mean_hin_aggregator/unstack_5Unpack$mean_hin_aggregator/Shape_5:output:0*
T0*
_output_shapes
: : *	
num2
mean_hin_aggregator/unstack_5�
#mean_hin_aggregator/Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2%
#mean_hin_aggregator/Reshape_6/shape�
mean_hin_aggregator/Reshape_6Reshapedropout_2/Identity:output:0,mean_hin_aggregator/Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������o2
mean_hin_aggregator/Reshape_6�
.mean_hin_aggregator/transpose_2/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_5_readvariableop_resource*
_output_shapes

:o *
dtype020
.mean_hin_aggregator/transpose_2/ReadVariableOp�
$mean_hin_aggregator/transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator/transpose_2/perm�
mean_hin_aggregator/transpose_2	Transpose6mean_hin_aggregator/transpose_2/ReadVariableOp:value:0-mean_hin_aggregator/transpose_2/perm:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator/transpose_2�
#mean_hin_aggregator/Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2%
#mean_hin_aggregator/Reshape_7/shape�
mean_hin_aggregator/Reshape_7Reshape#mean_hin_aggregator/transpose_2:y:0,mean_hin_aggregator/Reshape_7/shape:output:0*
T0*
_output_shapes

:o 2
mean_hin_aggregator/Reshape_7�
mean_hin_aggregator/MatMul_2MatMul&mean_hin_aggregator/Reshape_6:output:0&mean_hin_aggregator/Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator/MatMul_2�
%mean_hin_aggregator/Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2'
%mean_hin_aggregator/Reshape_8/shape/1�
%mean_hin_aggregator/Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2'
%mean_hin_aggregator/Reshape_8/shape/2�
#mean_hin_aggregator/Reshape_8/shapePack&mean_hin_aggregator/unstack_4:output:0.mean_hin_aggregator/Reshape_8/shape/1:output:0.mean_hin_aggregator/Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2%
#mean_hin_aggregator/Reshape_8/shape�
mean_hin_aggregator/Reshape_8Reshape&mean_hin_aggregator/MatMul_2:product:0,mean_hin_aggregator/Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/Reshape_8{
mean_hin_aggregator/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
mean_hin_aggregator/add/x�
mean_hin_aggregator/addAddV2"mean_hin_aggregator/add/x:output:0&mean_hin_aggregator/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/add�
mean_hin_aggregator/add_1AddV2mean_hin_aggregator/add:z:0&mean_hin_aggregator/Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/add_1�
mean_hin_aggregator/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
mean_hin_aggregator/truediv/y�
mean_hin_aggregator/truedivRealDivmean_hin_aggregator/add_1:z:0&mean_hin_aggregator/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/truediv�
mean_hin_aggregator/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2!
mean_hin_aggregator/concat/axis�
mean_hin_aggregator/concatConcatV2&mean_hin_aggregator/Reshape_8:output:0mean_hin_aggregator/truediv:z:0(mean_hin_aggregator/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator/concat�
(mean_hin_aggregator/add_2/ReadVariableOpReadVariableOp1mean_hin_aggregator_add_2_readvariableop_resource*
_output_shapes
:@*
dtype02*
(mean_hin_aggregator/add_2/ReadVariableOp�
mean_hin_aggregator/add_2AddV2#mean_hin_aggregator/concat:output:00mean_hin_aggregator/add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator/add_2�
mean_hin_aggregator/ReluRelumean_hin_aggregator/add_2:z:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator/Relu�
dropout_9/IdentityIdentity&mean_hin_aggregator/Relu:activations:0*
T0*+
_output_shapes
:���������@2
dropout_9/Identity�
dropout_7/IdentityIdentityreshape_4/Reshape:output:0*
T0*/
_output_shapes
:���������@2
dropout_7/Identity�
dropout_8/IdentityIdentityreshape_5/Reshape:output:0*
T0*/
_output_shapes
:���������@2
dropout_8/Identity�
,mean_hin_aggregator_3/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,mean_hin_aggregator_3/Mean/reduction_indices�
mean_hin_aggregator_3/MeanMeandropout_7/Identity:output:05mean_hin_aggregator_3/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_3/Mean�
mean_hin_aggregator_3/ShapeShape#mean_hin_aggregator_3/Mean:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_3/Shape�
mean_hin_aggregator_3/unstackUnpack$mean_hin_aggregator_3/Shape:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator_3/unstack�
,mean_hin_aggregator_3/Shape_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02.
,mean_hin_aggregator_3/Shape_1/ReadVariableOp�
mean_hin_aggregator_3/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"@       2
mean_hin_aggregator_3/Shape_1�
mean_hin_aggregator_3/unstack_1Unpack&mean_hin_aggregator_3/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_3/unstack_1�
#mean_hin_aggregator_3/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2%
#mean_hin_aggregator_3/Reshape/shape�
mean_hin_aggregator_3/ReshapeReshape#mean_hin_aggregator_3/Mean:output:0,mean_hin_aggregator_3/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2
mean_hin_aggregator_3/Reshape�
.mean_hin_aggregator_3/transpose/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_1_readvariableop_resource*
_output_shapes

:@ *
dtype020
.mean_hin_aggregator_3/transpose/ReadVariableOp�
$mean_hin_aggregator_3/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator_3/transpose/perm�
mean_hin_aggregator_3/transpose	Transpose6mean_hin_aggregator_3/transpose/ReadVariableOp:value:0-mean_hin_aggregator_3/transpose/perm:output:0*
T0*
_output_shapes

:@ 2!
mean_hin_aggregator_3/transpose�
%mean_hin_aggregator_3/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2'
%mean_hin_aggregator_3/Reshape_1/shape�
mean_hin_aggregator_3/Reshape_1Reshape#mean_hin_aggregator_3/transpose:y:0.mean_hin_aggregator_3/Reshape_1/shape:output:0*
T0*
_output_shapes

:@ 2!
mean_hin_aggregator_3/Reshape_1�
mean_hin_aggregator_3/MatMulMatMul&mean_hin_aggregator_3/Reshape:output:0(mean_hin_aggregator_3/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator_3/MatMul�
'mean_hin_aggregator_3/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_3/Reshape_2/shape/1�
'mean_hin_aggregator_3/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_3/Reshape_2/shape/2�
%mean_hin_aggregator_3/Reshape_2/shapePack&mean_hin_aggregator_3/unstack:output:00mean_hin_aggregator_3/Reshape_2/shape/1:output:00mean_hin_aggregator_3/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_3/Reshape_2/shape�
mean_hin_aggregator_3/Reshape_2Reshape&mean_hin_aggregator_3/MatMul:product:0.mean_hin_aggregator_3/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_3/Reshape_2�
.mean_hin_aggregator_3/Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :20
.mean_hin_aggregator_3/Mean_1/reduction_indices�
mean_hin_aggregator_3/Mean_1Meandropout_8/Identity:output:07mean_hin_aggregator_3/Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_3/Mean_1�
mean_hin_aggregator_3/Shape_2Shape%mean_hin_aggregator_3/Mean_1:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_3/Shape_2�
mean_hin_aggregator_3/unstack_2Unpack&mean_hin_aggregator_3/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2!
mean_hin_aggregator_3/unstack_2�
,mean_hin_aggregator_3/Shape_3/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02.
,mean_hin_aggregator_3/Shape_3/ReadVariableOp�
mean_hin_aggregator_3/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"@       2
mean_hin_aggregator_3/Shape_3�
mean_hin_aggregator_3/unstack_3Unpack&mean_hin_aggregator_3/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_3/unstack_3�
%mean_hin_aggregator_3/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2'
%mean_hin_aggregator_3/Reshape_3/shape�
mean_hin_aggregator_3/Reshape_3Reshape%mean_hin_aggregator_3/Mean_1:output:0.mean_hin_aggregator_3/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������@2!
mean_hin_aggregator_3/Reshape_3�
0mean_hin_aggregator_3/transpose_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_3_readvariableop_resource*
_output_shapes

:@ *
dtype022
0mean_hin_aggregator_3/transpose_1/ReadVariableOp�
&mean_hin_aggregator_3/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2(
&mean_hin_aggregator_3/transpose_1/perm�
!mean_hin_aggregator_3/transpose_1	Transpose8mean_hin_aggregator_3/transpose_1/ReadVariableOp:value:0/mean_hin_aggregator_3/transpose_1/perm:output:0*
T0*
_output_shapes

:@ 2#
!mean_hin_aggregator_3/transpose_1�
%mean_hin_aggregator_3/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2'
%mean_hin_aggregator_3/Reshape_4/shape�
mean_hin_aggregator_3/Reshape_4Reshape%mean_hin_aggregator_3/transpose_1:y:0.mean_hin_aggregator_3/Reshape_4/shape:output:0*
T0*
_output_shapes

:@ 2!
mean_hin_aggregator_3/Reshape_4�
mean_hin_aggregator_3/MatMul_1MatMul(mean_hin_aggregator_3/Reshape_3:output:0(mean_hin_aggregator_3/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2 
mean_hin_aggregator_3/MatMul_1�
'mean_hin_aggregator_3/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_3/Reshape_5/shape/1�
'mean_hin_aggregator_3/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_3/Reshape_5/shape/2�
%mean_hin_aggregator_3/Reshape_5/shapePack(mean_hin_aggregator_3/unstack_2:output:00mean_hin_aggregator_3/Reshape_5/shape/1:output:00mean_hin_aggregator_3/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_3/Reshape_5/shape�
mean_hin_aggregator_3/Reshape_5Reshape(mean_hin_aggregator_3/MatMul_1:product:0.mean_hin_aggregator_3/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_3/Reshape_5�
mean_hin_aggregator_3/Shape_4Shapedropout_9/Identity:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_3/Shape_4�
mean_hin_aggregator_3/unstack_4Unpack&mean_hin_aggregator_3/Shape_4:output:0*
T0*
_output_shapes
: : : *	
num2!
mean_hin_aggregator_3/unstack_4�
,mean_hin_aggregator_3/Shape_5/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02.
,mean_hin_aggregator_3/Shape_5/ReadVariableOp�
mean_hin_aggregator_3/Shape_5Const*
_output_shapes
:*
dtype0*
valueB"@       2
mean_hin_aggregator_3/Shape_5�
mean_hin_aggregator_3/unstack_5Unpack&mean_hin_aggregator_3/Shape_5:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_3/unstack_5�
%mean_hin_aggregator_3/Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2'
%mean_hin_aggregator_3/Reshape_6/shape�
mean_hin_aggregator_3/Reshape_6Reshapedropout_9/Identity:output:0.mean_hin_aggregator_3/Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������@2!
mean_hin_aggregator_3/Reshape_6�
0mean_hin_aggregator_3/transpose_2/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_5_readvariableop_resource*
_output_shapes

:@ *
dtype022
0mean_hin_aggregator_3/transpose_2/ReadVariableOp�
&mean_hin_aggregator_3/transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2(
&mean_hin_aggregator_3/transpose_2/perm�
!mean_hin_aggregator_3/transpose_2	Transpose8mean_hin_aggregator_3/transpose_2/ReadVariableOp:value:0/mean_hin_aggregator_3/transpose_2/perm:output:0*
T0*
_output_shapes

:@ 2#
!mean_hin_aggregator_3/transpose_2�
%mean_hin_aggregator_3/Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2'
%mean_hin_aggregator_3/Reshape_7/shape�
mean_hin_aggregator_3/Reshape_7Reshape%mean_hin_aggregator_3/transpose_2:y:0.mean_hin_aggregator_3/Reshape_7/shape:output:0*
T0*
_output_shapes

:@ 2!
mean_hin_aggregator_3/Reshape_7�
mean_hin_aggregator_3/MatMul_2MatMul(mean_hin_aggregator_3/Reshape_6:output:0(mean_hin_aggregator_3/Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2 
mean_hin_aggregator_3/MatMul_2�
'mean_hin_aggregator_3/Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_3/Reshape_8/shape/1�
'mean_hin_aggregator_3/Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_3/Reshape_8/shape/2�
%mean_hin_aggregator_3/Reshape_8/shapePack(mean_hin_aggregator_3/unstack_4:output:00mean_hin_aggregator_3/Reshape_8/shape/1:output:00mean_hin_aggregator_3/Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_3/Reshape_8/shape�
mean_hin_aggregator_3/Reshape_8Reshape(mean_hin_aggregator_3/MatMul_2:product:0.mean_hin_aggregator_3/Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_3/Reshape_8
mean_hin_aggregator_3/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
mean_hin_aggregator_3/add/x�
mean_hin_aggregator_3/addAddV2$mean_hin_aggregator_3/add/x:output:0(mean_hin_aggregator_3/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_3/add�
mean_hin_aggregator_3/add_1AddV2mean_hin_aggregator_3/add:z:0(mean_hin_aggregator_3/Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_3/add_1�
mean_hin_aggregator_3/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2!
mean_hin_aggregator_3/truediv/y�
mean_hin_aggregator_3/truedivRealDivmean_hin_aggregator_3/add_1:z:0(mean_hin_aggregator_3/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_3/truediv�
!mean_hin_aggregator_3/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2#
!mean_hin_aggregator_3/concat/axis�
mean_hin_aggregator_3/concatConcatV2(mean_hin_aggregator_3/Reshape_8:output:0!mean_hin_aggregator_3/truediv:z:0*mean_hin_aggregator_3/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_3/concat�
*mean_hin_aggregator_3/add_2/ReadVariableOpReadVariableOp3mean_hin_aggregator_3_add_2_readvariableop_resource*
_output_shapes
:@*
dtype02,
*mean_hin_aggregator_3/add_2/ReadVariableOp�
mean_hin_aggregator_3/add_2AddV2%mean_hin_aggregator_3/concat:output:02mean_hin_aggregator_3/add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_3/add_2q
reshape_6/ShapeShapemean_hin_aggregator_3/add_2:z:0*
T0*
_output_shapes
:2
reshape_6/Shape�
reshape_6/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_6/strided_slice/stack�
reshape_6/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_6/strided_slice/stack_1�
reshape_6/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_6/strided_slice/stack_2�
reshape_6/strided_sliceStridedSlicereshape_6/Shape:output:0&reshape_6/strided_slice/stack:output:0(reshape_6/strided_slice/stack_1:output:0(reshape_6/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_6/strided_slicex
reshape_6/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :@2
reshape_6/Reshape/shape/1�
reshape_6/Reshape/shapePack reshape_6/strided_slice:output:0"reshape_6/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_6/Reshape/shape�
reshape_6/ReshapeReshapemean_hin_aggregator_3/add_2:z:0 reshape_6/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2
reshape_6/Reshape�
lambda/l2_normalize/SquareSquarereshape_6/Reshape:output:0*
T0*'
_output_shapes
:���������@2
lambda/l2_normalize/Square�
)lambda/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
���������2+
)lambda/l2_normalize/Sum/reduction_indices�
lambda/l2_normalize/SumSumlambda/l2_normalize/Square:y:02lambda/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(2
lambda/l2_normalize/Sum�
lambda/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+2
lambda/l2_normalize/Maximum/y�
lambda/l2_normalize/MaximumMaximum lambda/l2_normalize/Sum:output:0&lambda/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������2
lambda/l2_normalize/Maximum�
lambda/l2_normalize/RsqrtRsqrtlambda/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������2
lambda/l2_normalize/Rsqrt�
lambda/l2_normalizeMulreshape_6/Reshape:output:0lambda/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������@2
lambda/l2_normalize�
IdentityIdentitylambda/l2_normalize:z:0)^mean_hin_aggregator/add_2/ReadVariableOp-^mean_hin_aggregator/transpose/ReadVariableOp/^mean_hin_aggregator/transpose_1/ReadVariableOp/^mean_hin_aggregator/transpose_2/ReadVariableOp+^mean_hin_aggregator_1/add_1/ReadVariableOp/^mean_hin_aggregator_1/transpose/ReadVariableOp1^mean_hin_aggregator_1/transpose_1/ReadVariableOp+^mean_hin_aggregator_2/add_1/ReadVariableOp/^mean_hin_aggregator_2/transpose/ReadVariableOp1^mean_hin_aggregator_2/transpose_1/ReadVariableOp+^mean_hin_aggregator_3/add_2/ReadVariableOp/^mean_hin_aggregator_3/transpose/ReadVariableOp1^mean_hin_aggregator_3/transpose_1/ReadVariableOp1^mean_hin_aggregator_3/transpose_2/ReadVariableOp*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::2T
(mean_hin_aggregator/add_2/ReadVariableOp(mean_hin_aggregator/add_2/ReadVariableOp2\
,mean_hin_aggregator/transpose/ReadVariableOp,mean_hin_aggregator/transpose/ReadVariableOp2`
.mean_hin_aggregator/transpose_1/ReadVariableOp.mean_hin_aggregator/transpose_1/ReadVariableOp2`
.mean_hin_aggregator/transpose_2/ReadVariableOp.mean_hin_aggregator/transpose_2/ReadVariableOp2X
*mean_hin_aggregator_1/add_1/ReadVariableOp*mean_hin_aggregator_1/add_1/ReadVariableOp2`
.mean_hin_aggregator_1/transpose/ReadVariableOp.mean_hin_aggregator_1/transpose/ReadVariableOp2d
0mean_hin_aggregator_1/transpose_1/ReadVariableOp0mean_hin_aggregator_1/transpose_1/ReadVariableOp2X
*mean_hin_aggregator_2/add_1/ReadVariableOp*mean_hin_aggregator_2/add_1/ReadVariableOp2`
.mean_hin_aggregator_2/transpose/ReadVariableOp.mean_hin_aggregator_2/transpose/ReadVariableOp2d
0mean_hin_aggregator_2/transpose_1/ReadVariableOp0mean_hin_aggregator_2/transpose_1/ReadVariableOp2X
*mean_hin_aggregator_3/add_2/ReadVariableOp*mean_hin_aggregator_3/add_2/ReadVariableOp2`
.mean_hin_aggregator_3/transpose/ReadVariableOp.mean_hin_aggregator_3/transpose/ReadVariableOp2d
0mean_hin_aggregator_3/transpose_1/ReadVariableOp0mean_hin_aggregator_3/transpose_1/ReadVariableOp2d
0mean_hin_aggregator_3/transpose_2/ReadVariableOp0mean_hin_aggregator_3/transpose_2/ReadVariableOp:U Q
+
_output_shapes
:���������o
"
_user_specified_name
inputs/0:UQ
+
_output_shapes
:���������
"
_user_specified_name
inputs/1:UQ
+
_output_shapes
:���������
"
_user_specified_name
inputs/2:UQ
+
_output_shapes
:���������@o
"
_user_specified_name
inputs/3:UQ
+
_output_shapes
:���������@o
"
_user_specified_name
inputs/4
�
_
C__inference_reshape_5_layer_call_and_return_conditional_losses_9097

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������@2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�0
�
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_8842
x_0
x_1#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource!
add_1_readvariableop_resource
identity��add_1/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:o 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2E
Shape_2Shapex_0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shaper
	Reshape_3Reshapex_0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
add[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
	truediv/yp
truedivRealDivadd:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_5:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_1/ReadVariableOpReadVariableOpadd_1_readvariableop_resource*
_output_shapes
:@*
dtype02
add_1/ReadVariableOp|
add_1AddV2concat:output:0add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_1U
ReluRelu	add_1:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_1/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::2,
add_1/ReadVariableOpadd_1/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp:P L
+
_output_shapes
:���������

_user_specified_namex/0:TP
/
_output_shapes
:��������� o

_user_specified_namex/1
�
a
C__inference_dropout_5_layer_call_and_return_conditional_losses_8491

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:��������� o2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:��������� o2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
`
A__inference_dropout_layer_call_and_return_conditional_losses_8540

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:���������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:���������*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:���������2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
4__inference_mean_hin_aggregator_3_layer_call_fn_9379
x_0
x_1
x_2
unknown
	unknown_0
	unknown_1
	unknown_2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallx_0x_1x_2unknown	unknown_0	unknown_1	unknown_2*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_70762
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������@:���������@:���������@::::22
StatefulPartitionedCallStatefulPartitionedCall:P L
+
_output_shapes
:���������@

_user_specified_namex/0:TP
/
_output_shapes
:���������@

_user_specified_namex/1:TP
/
_output_shapes
:���������@

_user_specified_namex/2
�
D
(__inference_reshape_6_layer_call_fn_9396

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_6_layer_call_and_return_conditional_losses_71292
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
_
C__inference_reshape_1_layer_call_and_return_conditional_losses_8388

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�

_
C__inference_reshape_6_layer_call_and_return_conditional_losses_7129

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :@2
Reshape/shape/1�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������@2	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
&__inference_model_1_layer_call_fn_7327
input_1
input_2
input_3
input_4
input_5
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1input_2input_3input_4input_5unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_72962
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:T P
+
_output_shapes
:���������o
!
_user_specified_name	input_1:TP
+
_output_shapes
:���������
!
_user_specified_name	input_2:TP
+
_output_shapes
:���������
!
_user_specified_name	input_3:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_4:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_5
�
a
C__inference_dropout_3_layer_call_and_return_conditional_losses_6118

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:��������� o2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:��������� o2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
a
(__inference_dropout_1_layer_call_fn_8577

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_65492
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
a
(__inference_dropout_2_layer_call_fn_8523

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_64892
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������o22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������o
 
_user_specified_nameinputs
�
a
(__inference_dropout_9_layer_call_fn_9124

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_9_layer_call_and_return_conditional_losses_68322
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�0
�
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_6385
x
x_1#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource!
add_1_readvariableop_resource
identity��add_1/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:o 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2C
Shape_2Shapex*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shapep
	Reshape_3ReshapexReshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
add[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
	truediv/yp
truedivRealDivadd:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_5:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_1/ReadVariableOpReadVariableOpadd_1_readvariableop_resource*
_output_shapes
:@*
dtype02
add_1/ReadVariableOp|
add_1AddV2concat:output:0add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_1U
ReluRelu	add_1:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_1/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::2,
add_1/ReadVariableOpadd_1/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp:N J
+
_output_shapes
:���������

_user_specified_namex:RN
/
_output_shapes
:��������� o

_user_specified_namex
�
_
C__inference_reshape_3_layer_call_and_return_conditional_losses_5981

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:��������� o2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@o:S O
+
_output_shapes
:���������@o
 
_user_specified_nameinputs
�
D
(__inference_dropout_4_layer_call_fn_8420

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_4_layer_call_and_return_conditional_losses_60882
PartitionedCallp
IdentityIdentityPartitionedCall:output:0*
T0*+
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
a
C__inference_dropout_1_layer_call_and_return_conditional_losses_8572

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:���������2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:���������2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
A
%__inference_lambda_layer_call_fn_9423

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_lambda_layer_call_and_return_conditional_losses_71482
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*&
_input_shapes
:���������@:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
C__inference_dropout_8_layer_call_and_return_conditional_losses_6897

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:���������@2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:���������@2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
_
C__inference_reshape_2_layer_call_and_return_conditional_losses_6003

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:��������� o2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@o:S O
+
_output_shapes
:���������@o
 
_user_specified_nameinputs
�
a
C__inference_dropout_8_layer_call_and_return_conditional_losses_9173

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:���������@2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:���������@2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
(__inference_dropout_5_layer_call_fn_8496

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_5_layer_call_and_return_conditional_losses_60532
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0*.
_input_shapes
:��������� o22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
D
(__inference_dropout_6_layer_call_fn_8474

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_6_layer_call_and_return_conditional_losses_60282
PartitionedCallp
IdentityIdentityPartitionedCall:output:0*
T0*+
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�+
�
__inference__traced_save_9497
file_prefix>
:savev2_mean_hin_aggregator_1_w_neigh_0_read_readvariableop;
7savev2_mean_hin_aggregator_1_w_self_read_readvariableop9
5savev2_mean_hin_aggregator_1_bias_read_readvariableop>
:savev2_mean_hin_aggregator_2_w_neigh_0_read_readvariableop;
7savev2_mean_hin_aggregator_2_w_self_read_readvariableop9
5savev2_mean_hin_aggregator_2_bias_read_readvariableop<
8savev2_mean_hin_aggregator_w_neigh_0_read_readvariableop<
8savev2_mean_hin_aggregator_w_neigh_1_read_readvariableop9
5savev2_mean_hin_aggregator_w_self_read_readvariableop7
3savev2_mean_hin_aggregator_bias_read_readvariableop>
:savev2_mean_hin_aggregator_3_w_neigh_0_read_readvariableop>
:savev2_mean_hin_aggregator_3_w_neigh_1_read_readvariableop;
7savev2_mean_hin_aggregator_3_w_self_read_readvariableop9
5savev2_mean_hin_aggregator_3_bias_read_readvariableop
savev2_const

identity_1��MergeV2Checkpoints�
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard�
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename�
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B9layer_with_weights-0/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-0/w_self/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-1/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/w_self/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-2/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-2/w_neigh_1/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/w_self/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-3/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-3/w_neigh_1/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/w_self/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices�
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0:savev2_mean_hin_aggregator_1_w_neigh_0_read_readvariableop7savev2_mean_hin_aggregator_1_w_self_read_readvariableop5savev2_mean_hin_aggregator_1_bias_read_readvariableop:savev2_mean_hin_aggregator_2_w_neigh_0_read_readvariableop7savev2_mean_hin_aggregator_2_w_self_read_readvariableop5savev2_mean_hin_aggregator_2_bias_read_readvariableop8savev2_mean_hin_aggregator_w_neigh_0_read_readvariableop8savev2_mean_hin_aggregator_w_neigh_1_read_readvariableop5savev2_mean_hin_aggregator_w_self_read_readvariableop3savev2_mean_hin_aggregator_bias_read_readvariableop:savev2_mean_hin_aggregator_3_w_neigh_0_read_readvariableop:savev2_mean_hin_aggregator_3_w_neigh_1_read_readvariableop7savev2_mean_hin_aggregator_3_w_self_read_readvariableop5savev2_mean_hin_aggregator_3_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
22
SaveV2�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*�
_input_shapes�
�: :o : :@:o : :@: : :o :@:@ :@ :@ :@: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:$ 

_output_shapes

:o :$ 

_output_shapes

: : 

_output_shapes
:@:$ 

_output_shapes

:o :$ 

_output_shapes

: : 

_output_shapes
:@:$ 

_output_shapes

: :$ 

_output_shapes

: :$	 

_output_shapes

:o : 


_output_shapes
:@:$ 

_output_shapes

:@ :$ 

_output_shapes

:@ :$ 

_output_shapes

:@ : 

_output_shapes
:@:

_output_shapes
: 
�
b
C__inference_dropout_1_layer_call_and_return_conditional_losses_8567

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:���������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:���������*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:���������2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
b
C__inference_dropout_4_layer_call_and_return_conditional_losses_6083

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Constw
dropout/MulMulinputsdropout/Const:output:0*
T0*+
_output_shapes
:���������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*+
_output_shapes
:���������*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������2
dropout/Cast~
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*+
_output_shapes
:���������2
dropout/Mul_1i
IdentityIdentitydropout/Mul_1:z:0*
T0*+
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
b
C__inference_dropout_6_layer_call_and_return_conditional_losses_6023

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Constw
dropout/MulMulinputsdropout/Const:output:0*
T0*+
_output_shapes
:���������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*+
_output_shapes
:���������*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������2
dropout/Cast~
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*+
_output_shapes
:���������2
dropout/Mul_1i
IdentityIdentitydropout/Mul_1:z:0*
T0*+
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
a
C__inference_dropout_1_layer_call_and_return_conditional_losses_6554

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:���������2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:���������2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�W
�
A__inference_model_1_layer_call_and_return_conditional_losses_7231
input_1
input_2
input_3
input_4
input_5
mean_hin_aggregator_2_7188
mean_hin_aggregator_2_7190
mean_hin_aggregator_2_7192
mean_hin_aggregator_1_7195
mean_hin_aggregator_1_7197
mean_hin_aggregator_1_7199
mean_hin_aggregator_7207
mean_hin_aggregator_7209
mean_hin_aggregator_7211
mean_hin_aggregator_7213
mean_hin_aggregator_3_7219
mean_hin_aggregator_3_7221
mean_hin_aggregator_3_7223
mean_hin_aggregator_3_7225
identity��+mean_hin_aggregator/StatefulPartitionedCall�-mean_hin_aggregator_1/StatefulPartitionedCall�-mean_hin_aggregator_2/StatefulPartitionedCall�-mean_hin_aggregator_3/StatefulPartitionedCall�
reshape_3/PartitionedCallPartitionedCallinput_5*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_3_layer_call_and_return_conditional_losses_59812
reshape_3/PartitionedCall�
reshape_2/PartitionedCallPartitionedCallinput_4*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_2_layer_call_and_return_conditional_losses_60032
reshape_2/PartitionedCall�
dropout_6/PartitionedCallPartitionedCallinput_3*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_6_layer_call_and_return_conditional_losses_60282
dropout_6/PartitionedCall�
dropout_5/PartitionedCallPartitionedCall"reshape_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_5_layer_call_and_return_conditional_losses_60582
dropout_5/PartitionedCall�
dropout_4/PartitionedCallPartitionedCallinput_2*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_4_layer_call_and_return_conditional_losses_60882
dropout_4/PartitionedCall�
dropout_3/PartitionedCallPartitionedCall"reshape_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_61182
dropout_3/PartitionedCall�
reshape_1/PartitionedCallPartitionedCallinput_3*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_1_layer_call_and_return_conditional_losses_61452
reshape_1/PartitionedCall�
reshape/PartitionedCallPartitionedCallinput_2*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_reshape_layer_call_and_return_conditional_losses_61672
reshape/PartitionedCall�
-mean_hin_aggregator_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_6/PartitionedCall:output:0"dropout_5/PartitionedCall:output:0mean_hin_aggregator_2_7188mean_hin_aggregator_2_7190mean_hin_aggregator_2_7192*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_62932/
-mean_hin_aggregator_2/StatefulPartitionedCall�
-mean_hin_aggregator_1/StatefulPartitionedCallStatefulPartitionedCall"dropout_4/PartitionedCall:output:0"dropout_3/PartitionedCall:output:0mean_hin_aggregator_1_7195mean_hin_aggregator_1_7197mean_hin_aggregator_1_7199*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_64442/
-mean_hin_aggregator_1/StatefulPartitionedCall�
dropout_2/PartitionedCallPartitionedCallinput_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_64942
dropout_2/PartitionedCall�
dropout/PartitionedCallPartitionedCall reshape/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_65242
dropout/PartitionedCall�
dropout_1/PartitionedCallPartitionedCall"reshape_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_65542
dropout_1/PartitionedCall�
reshape_5/PartitionedCallPartitionedCall6mean_hin_aggregator_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_5_layer_call_and_return_conditional_losses_65812
reshape_5/PartitionedCall�
reshape_4/PartitionedCallPartitionedCall6mean_hin_aggregator_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_4_layer_call_and_return_conditional_losses_66032
reshape_4/PartitionedCall�
+mean_hin_aggregator/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0 dropout/PartitionedCall:output:0"dropout_1/PartitionedCall:output:0mean_hin_aggregator_7207mean_hin_aggregator_7209mean_hin_aggregator_7211mean_hin_aggregator_7213*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_67792-
+mean_hin_aggregator/StatefulPartitionedCall�
dropout_9/PartitionedCallPartitionedCall4mean_hin_aggregator/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_9_layer_call_and_return_conditional_losses_68372
dropout_9/PartitionedCall�
dropout_7/PartitionedCallPartitionedCall"reshape_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_7_layer_call_and_return_conditional_losses_68672
dropout_7/PartitionedCall�
dropout_8/PartitionedCallPartitionedCall"reshape_5/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_8_layer_call_and_return_conditional_losses_68972
dropout_8/PartitionedCall�
-mean_hin_aggregator_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_9/PartitionedCall:output:0"dropout_7/PartitionedCall:output:0"dropout_8/PartitionedCall:output:0mean_hin_aggregator_3_7219mean_hin_aggregator_3_7221mean_hin_aggregator_3_7223mean_hin_aggregator_3_7225*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_70762/
-mean_hin_aggregator_3/StatefulPartitionedCall�
reshape_6/PartitionedCallPartitionedCall6mean_hin_aggregator_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_6_layer_call_and_return_conditional_losses_71292
reshape_6/PartitionedCall�
lambda/PartitionedCallPartitionedCall"reshape_6/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_lambda_layer_call_and_return_conditional_losses_71592
lambda/PartitionedCall�
IdentityIdentitylambda/PartitionedCall:output:0,^mean_hin_aggregator/StatefulPartitionedCall.^mean_hin_aggregator_1/StatefulPartitionedCall.^mean_hin_aggregator_2/StatefulPartitionedCall.^mean_hin_aggregator_3/StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::2Z
+mean_hin_aggregator/StatefulPartitionedCall+mean_hin_aggregator/StatefulPartitionedCall2^
-mean_hin_aggregator_1/StatefulPartitionedCall-mean_hin_aggregator_1/StatefulPartitionedCall2^
-mean_hin_aggregator_2/StatefulPartitionedCall-mean_hin_aggregator_2/StatefulPartitionedCall2^
-mean_hin_aggregator_3/StatefulPartitionedCall-mean_hin_aggregator_3/StatefulPartitionedCall:T P
+
_output_shapes
:���������o
!
_user_specified_name	input_1:TP
+
_output_shapes
:���������
!
_user_specified_name	input_2:TP
+
_output_shapes
:���������
!
_user_specified_name	input_3:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_4:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_5
�
D
(__inference_dropout_3_layer_call_fn_8447

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_61182
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�E
�
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_6695
x
x_1
x_2#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource#
shape_5_readvariableop_resource!
add_2_readvariableop_resource
identity��add_2/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOp�transpose_2/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

: *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

: 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2v
Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean_1/reduction_indicesv
Mean_1Meanx_2!Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
Mean_1Q
Shape_2ShapeMean_1:output:0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shape~
	Reshape_3ReshapeMean_1:output:0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5C
Shape_4Shapex*
T0*
_output_shapes
:2	
Shape_4b
	unstack_4UnpackShape_4:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_4�
Shape_5/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_5/ReadVariableOpc
Shape_5Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_5`
	unstack_5UnpackShape_5:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_5s
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape_6/shapep
	Reshape_6ReshapexReshape_6/shape:output:0*
T0*'
_output_shapes
:���������o2
	Reshape_6�
transpose_2/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose_2/ReadVariableOpu
transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_2/perm�
transpose_2	Transpose"transpose_2/ReadVariableOp:value:0transpose_2/perm:output:0*
T0*
_output_shapes

:o 2
transpose_2s
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_7/shapeu
	Reshape_7Reshapetranspose_2:y:0Reshape_7/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_7x
MatMul_2MatMulReshape_6:output:0Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_2h
Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_8/shape/1h
Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_8/shape/2�
Reshape_8/shapePackunstack_4:output:0Reshape_8/shape/1:output:0Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_8/shape�
	Reshape_8ReshapeMatMul_2:product:0Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_8S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
addj
add_1AddV2add:z:0Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
add_1[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
	truediv/yr
truedivRealDiv	add_1:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_8:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_2/ReadVariableOpReadVariableOpadd_2_readvariableop_resource*
_output_shapes
:@*
dtype02
add_2/ReadVariableOp|
add_2AddV2concat:output:0add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_2U
ReluRelu	add_2:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_2/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp^transpose_2/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������o:���������:���������::::2,
add_2/ReadVariableOpadd_2/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp28
transpose_2/ReadVariableOptranspose_2/ReadVariableOp:N J
+
_output_shapes
:���������o

_user_specified_namex:RN
/
_output_shapes
:���������

_user_specified_namex:RN
/
_output_shapes
:���������

_user_specified_namex
�
a
C__inference_dropout_3_layer_call_and_return_conditional_losses_8437

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:��������� o2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:��������� o2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
A
%__inference_lambda_layer_call_fn_9428

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_lambda_layer_call_and_return_conditional_losses_71592
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*&
_input_shapes
:���������@:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
b
C__inference_dropout_2_layer_call_and_return_conditional_losses_8513

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Constw
dropout/MulMulinputsdropout/Const:output:0*
T0*+
_output_shapes
:���������o2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*+
_output_shapes
:���������o*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������o2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������o2
dropout/Cast~
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*+
_output_shapes
:���������o2
dropout/Mul_1i
IdentityIdentitydropout/Mul_1:z:0*
T0*+
_output_shapes
:���������o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������o:S O
+
_output_shapes
:���������o
 
_user_specified_nameinputs
�
D
(__inference_reshape_1_layer_call_fn_8393

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_1_layer_call_and_return_conditional_losses_61452
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
2__inference_mean_hin_aggregator_layer_call_fn_9049
x_0
x_1
x_2
unknown
	unknown_0
	unknown_1
	unknown_2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallx_0x_1x_2unknown	unknown_0	unknown_1	unknown_2*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_66952
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������o:���������:���������::::22
StatefulPartitionedCallStatefulPartitionedCall:P L
+
_output_shapes
:���������o

_user_specified_namex/0:TP
/
_output_shapes
:���������

_user_specified_namex/1:TP
/
_output_shapes
:���������

_user_specified_namex/2
�
a
C__inference_dropout_9_layer_call_and_return_conditional_losses_9119

inputs

identity_1^
IdentityIdentityinputs*
T0*+
_output_shapes
:���������@2

Identitym

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:���������@2

Identity_1"!

identity_1Identity_1:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�E
�
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_9034
x_0
x_1
x_2#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource#
shape_5_readvariableop_resource!
add_2_readvariableop_resource
identity��add_2/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOp�transpose_2/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

: *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

: 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2v
Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean_1/reduction_indicesv
Mean_1Meanx_2!Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
Mean_1Q
Shape_2ShapeMean_1:output:0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shape~
	Reshape_3ReshapeMean_1:output:0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5E
Shape_4Shapex_0*
T0*
_output_shapes
:2	
Shape_4b
	unstack_4UnpackShape_4:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_4�
Shape_5/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_5/ReadVariableOpc
Shape_5Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_5`
	unstack_5UnpackShape_5:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_5s
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape_6/shaper
	Reshape_6Reshapex_0Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������o2
	Reshape_6�
transpose_2/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose_2/ReadVariableOpu
transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_2/perm�
transpose_2	Transpose"transpose_2/ReadVariableOp:value:0transpose_2/perm:output:0*
T0*
_output_shapes

:o 2
transpose_2s
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_7/shapeu
	Reshape_7Reshapetranspose_2:y:0Reshape_7/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_7x
MatMul_2MatMulReshape_6:output:0Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_2h
Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_8/shape/1h
Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_8/shape/2�
Reshape_8/shapePackunstack_4:output:0Reshape_8/shape/1:output:0Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_8/shape�
	Reshape_8ReshapeMatMul_2:product:0Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_8S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
addj
add_1AddV2add:z:0Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
add_1[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
	truediv/yr
truedivRealDiv	add_1:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_8:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_2/ReadVariableOpReadVariableOpadd_2_readvariableop_resource*
_output_shapes
:@*
dtype02
add_2/ReadVariableOp|
add_2AddV2concat:output:0add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_2U
ReluRelu	add_2:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_2/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp^transpose_2/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������o:���������:���������::::2,
add_2/ReadVariableOpadd_2/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp28
transpose_2/ReadVariableOptranspose_2/ReadVariableOp:P L
+
_output_shapes
:���������o

_user_specified_namex/0:TP
/
_output_shapes
:���������

_user_specified_namex/1:TP
/
_output_shapes
:���������

_user_specified_namex/2
�W
�
A__inference_model_1_layer_call_and_return_conditional_losses_7391

inputs
inputs_1
inputs_2
inputs_3
inputs_4
mean_hin_aggregator_2_7348
mean_hin_aggregator_2_7350
mean_hin_aggregator_2_7352
mean_hin_aggregator_1_7355
mean_hin_aggregator_1_7357
mean_hin_aggregator_1_7359
mean_hin_aggregator_7367
mean_hin_aggregator_7369
mean_hin_aggregator_7371
mean_hin_aggregator_7373
mean_hin_aggregator_3_7379
mean_hin_aggregator_3_7381
mean_hin_aggregator_3_7383
mean_hin_aggregator_3_7385
identity��+mean_hin_aggregator/StatefulPartitionedCall�-mean_hin_aggregator_1/StatefulPartitionedCall�-mean_hin_aggregator_2/StatefulPartitionedCall�-mean_hin_aggregator_3/StatefulPartitionedCall�
reshape_3/PartitionedCallPartitionedCallinputs_4*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_3_layer_call_and_return_conditional_losses_59812
reshape_3/PartitionedCall�
reshape_2/PartitionedCallPartitionedCallinputs_3*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_2_layer_call_and_return_conditional_losses_60032
reshape_2/PartitionedCall�
dropout_6/PartitionedCallPartitionedCallinputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_6_layer_call_and_return_conditional_losses_60282
dropout_6/PartitionedCall�
dropout_5/PartitionedCallPartitionedCall"reshape_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_5_layer_call_and_return_conditional_losses_60582
dropout_5/PartitionedCall�
dropout_4/PartitionedCallPartitionedCallinputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_4_layer_call_and_return_conditional_losses_60882
dropout_4/PartitionedCall�
dropout_3/PartitionedCallPartitionedCall"reshape_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_61182
dropout_3/PartitionedCall�
reshape_1/PartitionedCallPartitionedCallinputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_1_layer_call_and_return_conditional_losses_61452
reshape_1/PartitionedCall�
reshape/PartitionedCallPartitionedCallinputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_reshape_layer_call_and_return_conditional_losses_61672
reshape/PartitionedCall�
-mean_hin_aggregator_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_6/PartitionedCall:output:0"dropout_5/PartitionedCall:output:0mean_hin_aggregator_2_7348mean_hin_aggregator_2_7350mean_hin_aggregator_2_7352*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_62932/
-mean_hin_aggregator_2/StatefulPartitionedCall�
-mean_hin_aggregator_1/StatefulPartitionedCallStatefulPartitionedCall"dropout_4/PartitionedCall:output:0"dropout_3/PartitionedCall:output:0mean_hin_aggregator_1_7355mean_hin_aggregator_1_7357mean_hin_aggregator_1_7359*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_64442/
-mean_hin_aggregator_1/StatefulPartitionedCall�
dropout_2/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_64942
dropout_2/PartitionedCall�
dropout/PartitionedCallPartitionedCall reshape/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_65242
dropout/PartitionedCall�
dropout_1/PartitionedCallPartitionedCall"reshape_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_65542
dropout_1/PartitionedCall�
reshape_5/PartitionedCallPartitionedCall6mean_hin_aggregator_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_5_layer_call_and_return_conditional_losses_65812
reshape_5/PartitionedCall�
reshape_4/PartitionedCallPartitionedCall6mean_hin_aggregator_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_4_layer_call_and_return_conditional_losses_66032
reshape_4/PartitionedCall�
+mean_hin_aggregator/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0 dropout/PartitionedCall:output:0"dropout_1/PartitionedCall:output:0mean_hin_aggregator_7367mean_hin_aggregator_7369mean_hin_aggregator_7371mean_hin_aggregator_7373*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_67792-
+mean_hin_aggregator/StatefulPartitionedCall�
dropout_9/PartitionedCallPartitionedCall4mean_hin_aggregator/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_9_layer_call_and_return_conditional_losses_68372
dropout_9/PartitionedCall�
dropout_7/PartitionedCallPartitionedCall"reshape_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_7_layer_call_and_return_conditional_losses_68672
dropout_7/PartitionedCall�
dropout_8/PartitionedCallPartitionedCall"reshape_5/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_8_layer_call_and_return_conditional_losses_68972
dropout_8/PartitionedCall�
-mean_hin_aggregator_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_9/PartitionedCall:output:0"dropout_7/PartitionedCall:output:0"dropout_8/PartitionedCall:output:0mean_hin_aggregator_3_7379mean_hin_aggregator_3_7381mean_hin_aggregator_3_7383mean_hin_aggregator_3_7385*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_70762/
-mean_hin_aggregator_3/StatefulPartitionedCall�
reshape_6/PartitionedCallPartitionedCall6mean_hin_aggregator_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_6_layer_call_and_return_conditional_losses_71292
reshape_6/PartitionedCall�
lambda/PartitionedCallPartitionedCall"reshape_6/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_lambda_layer_call_and_return_conditional_losses_71592
lambda/PartitionedCall�
IdentityIdentitylambda/PartitionedCall:output:0,^mean_hin_aggregator/StatefulPartitionedCall.^mean_hin_aggregator_1/StatefulPartitionedCall.^mean_hin_aggregator_2/StatefulPartitionedCall.^mean_hin_aggregator_3/StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::2Z
+mean_hin_aggregator/StatefulPartitionedCall+mean_hin_aggregator/StatefulPartitionedCall2^
-mean_hin_aggregator_1/StatefulPartitionedCall-mean_hin_aggregator_1/StatefulPartitionedCall2^
-mean_hin_aggregator_2/StatefulPartitionedCall-mean_hin_aggregator_2/StatefulPartitionedCall2^
-mean_hin_aggregator_3/StatefulPartitionedCall-mean_hin_aggregator_3/StatefulPartitionedCall:S O
+
_output_shapes
:���������o
 
_user_specified_nameinputs:SO
+
_output_shapes
:���������
 
_user_specified_nameinputs:SO
+
_output_shapes
:���������
 
_user_specified_nameinputs:SO
+
_output_shapes
:���������@o
 
_user_specified_nameinputs:SO
+
_output_shapes
:���������@o
 
_user_specified_nameinputs
�@
�
 __inference__traced_restore_9549
file_prefix4
0assignvariableop_mean_hin_aggregator_1_w_neigh_03
/assignvariableop_1_mean_hin_aggregator_1_w_self1
-assignvariableop_2_mean_hin_aggregator_1_bias6
2assignvariableop_3_mean_hin_aggregator_2_w_neigh_03
/assignvariableop_4_mean_hin_aggregator_2_w_self1
-assignvariableop_5_mean_hin_aggregator_2_bias4
0assignvariableop_6_mean_hin_aggregator_w_neigh_04
0assignvariableop_7_mean_hin_aggregator_w_neigh_11
-assignvariableop_8_mean_hin_aggregator_w_self/
+assignvariableop_9_mean_hin_aggregator_bias7
3assignvariableop_10_mean_hin_aggregator_3_w_neigh_07
3assignvariableop_11_mean_hin_aggregator_3_w_neigh_14
0assignvariableop_12_mean_hin_aggregator_3_w_self2
.assignvariableop_13_mean_hin_aggregator_3_bias
identity_15��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_2�AssignVariableOp_3�AssignVariableOp_4�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B9layer_with_weights-0/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-0/w_self/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-1/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/w_self/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-2/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-2/w_neigh_1/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/w_self/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-3/w_neigh_0/.ATTRIBUTES/VARIABLE_VALUEB9layer_with_weights-3/w_neigh_1/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/w_self/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices�
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*P
_output_shapes>
<:::::::::::::::*
dtypes
22
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity�
AssignVariableOpAssignVariableOp0assignvariableop_mean_hin_aggregator_1_w_neigh_0Identity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1�
AssignVariableOp_1AssignVariableOp/assignvariableop_1_mean_hin_aggregator_1_w_selfIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2�
AssignVariableOp_2AssignVariableOp-assignvariableop_2_mean_hin_aggregator_1_biasIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3�
AssignVariableOp_3AssignVariableOp2assignvariableop_3_mean_hin_aggregator_2_w_neigh_0Identity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4�
AssignVariableOp_4AssignVariableOp/assignvariableop_4_mean_hin_aggregator_2_w_selfIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5�
AssignVariableOp_5AssignVariableOp-assignvariableop_5_mean_hin_aggregator_2_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6�
AssignVariableOp_6AssignVariableOp0assignvariableop_6_mean_hin_aggregator_w_neigh_0Identity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7�
AssignVariableOp_7AssignVariableOp0assignvariableop_7_mean_hin_aggregator_w_neigh_1Identity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8�
AssignVariableOp_8AssignVariableOp-assignvariableop_8_mean_hin_aggregator_w_selfIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9�
AssignVariableOp_9AssignVariableOp+assignvariableop_9_mean_hin_aggregator_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10�
AssignVariableOp_10AssignVariableOp3assignvariableop_10_mean_hin_aggregator_3_w_neigh_0Identity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11�
AssignVariableOp_11AssignVariableOp3assignvariableop_11_mean_hin_aggregator_3_w_neigh_1Identity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12�
AssignVariableOp_12AssignVariableOp0assignvariableop_12_mean_hin_aggregator_3_w_selfIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13�
AssignVariableOp_13AssignVariableOp.assignvariableop_13_mean_hin_aggregator_3_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_139
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp�
Identity_14Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_14�
Identity_15IdentityIdentity_14:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_15"#
identity_15Identity_15:output:0*M
_input_shapes<
:: ::::::::::::::2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
b
C__inference_dropout_7_layer_call_and_return_conditional_losses_6862

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:���������@2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:���������@*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������@2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������@2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:���������@2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
C__inference_dropout_9_layer_call_and_return_conditional_losses_6837

inputs

identity_1^
IdentityIdentityinputs*
T0*+
_output_shapes
:���������@2

Identitym

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:���������@2

Identity_1"!

identity_1Identity_1:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
(__inference_dropout_4_layer_call_fn_8415

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_4_layer_call_and_return_conditional_losses_60832
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�0
�
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_8783
x_0
x_1#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource!
add_1_readvariableop_resource
identity��add_1/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:o 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2E
Shape_2Shapex_0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shaper
	Reshape_3Reshapex_0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
add[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
	truediv/yp
truedivRealDivadd:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_5:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_1/ReadVariableOpReadVariableOpadd_1_readvariableop_resource*
_output_shapes
:@*
dtype02
add_1/ReadVariableOp|
add_1AddV2concat:output:0add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_1U
ReluRelu	add_1:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_1/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::2,
add_1/ReadVariableOpadd_1/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp:P L
+
_output_shapes
:���������

_user_specified_namex/0:TP
/
_output_shapes
:��������� o

_user_specified_namex/1
�
]
A__inference_reshape_layer_call_and_return_conditional_losses_8369

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
_
A__inference_dropout_layer_call_and_return_conditional_losses_8545

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:���������2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:���������2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
D
(__inference_dropout_7_layer_call_fn_9156

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_7_layer_call_and_return_conditional_losses_68672
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
C__inference_dropout_2_layer_call_and_return_conditional_losses_6494

inputs

identity_1^
IdentityIdentityinputs*
T0*+
_output_shapes
:���������o2

Identitym

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:���������o2

Identity_1"!

identity_1Identity_1:output:0**
_input_shapes
:���������o:S O
+
_output_shapes
:���������o
 
_user_specified_nameinputs
�
b
C__inference_dropout_6_layer_call_and_return_conditional_losses_8459

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Constw
dropout/MulMulinputsdropout/Const:output:0*
T0*+
_output_shapes
:���������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*+
_output_shapes
:���������*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������2
dropout/Cast~
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*+
_output_shapes
:���������2
dropout/Mul_1i
IdentityIdentitydropout/Mul_1:z:0*
T0*+
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
_
C__inference_reshape_2_layer_call_and_return_conditional_losses_8331

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:��������� o2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@o:S O
+
_output_shapes
:���������@o
 
_user_specified_nameinputs
�
_
&__inference_dropout_layer_call_fn_8550

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_65192
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�

_
C__inference_reshape_6_layer_call_and_return_conditional_losses_9391

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :@2
Reshape/shape/1�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������@2	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�g
�
A__inference_model_1_layer_call_and_return_conditional_losses_7173
input_1
input_2
input_3
input_4
input_5
mean_hin_aggregator_2_6319
mean_hin_aggregator_2_6321
mean_hin_aggregator_2_6323
mean_hin_aggregator_1_6470
mean_hin_aggregator_1_6472
mean_hin_aggregator_1_6474
mean_hin_aggregator_6811
mean_hin_aggregator_6813
mean_hin_aggregator_6815
mean_hin_aggregator_6817
mean_hin_aggregator_3_7108
mean_hin_aggregator_3_7110
mean_hin_aggregator_3_7112
mean_hin_aggregator_3_7114
identity��dropout/StatefulPartitionedCall�!dropout_1/StatefulPartitionedCall�!dropout_2/StatefulPartitionedCall�!dropout_3/StatefulPartitionedCall�!dropout_4/StatefulPartitionedCall�!dropout_5/StatefulPartitionedCall�!dropout_6/StatefulPartitionedCall�!dropout_7/StatefulPartitionedCall�!dropout_8/StatefulPartitionedCall�!dropout_9/StatefulPartitionedCall�+mean_hin_aggregator/StatefulPartitionedCall�-mean_hin_aggregator_1/StatefulPartitionedCall�-mean_hin_aggregator_2/StatefulPartitionedCall�-mean_hin_aggregator_3/StatefulPartitionedCall�
reshape_3/PartitionedCallPartitionedCallinput_5*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_3_layer_call_and_return_conditional_losses_59812
reshape_3/PartitionedCall�
reshape_2/PartitionedCallPartitionedCallinput_4*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_2_layer_call_and_return_conditional_losses_60032
reshape_2/PartitionedCall�
!dropout_6/StatefulPartitionedCallStatefulPartitionedCallinput_3*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_6_layer_call_and_return_conditional_losses_60232#
!dropout_6/StatefulPartitionedCall�
!dropout_5/StatefulPartitionedCallStatefulPartitionedCall"reshape_3/PartitionedCall:output:0"^dropout_6/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_5_layer_call_and_return_conditional_losses_60532#
!dropout_5/StatefulPartitionedCall�
!dropout_4/StatefulPartitionedCallStatefulPartitionedCallinput_2"^dropout_5/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_4_layer_call_and_return_conditional_losses_60832#
!dropout_4/StatefulPartitionedCall�
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall"reshape_2/PartitionedCall:output:0"^dropout_4/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_61132#
!dropout_3/StatefulPartitionedCall�
reshape_1/PartitionedCallPartitionedCallinput_3*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_1_layer_call_and_return_conditional_losses_61452
reshape_1/PartitionedCall�
reshape/PartitionedCallPartitionedCallinput_2*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_reshape_layer_call_and_return_conditional_losses_61672
reshape/PartitionedCall�
-mean_hin_aggregator_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_6/StatefulPartitionedCall:output:0*dropout_5/StatefulPartitionedCall:output:0mean_hin_aggregator_2_6319mean_hin_aggregator_2_6321mean_hin_aggregator_2_6323*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_62342/
-mean_hin_aggregator_2/StatefulPartitionedCall�
-mean_hin_aggregator_1/StatefulPartitionedCallStatefulPartitionedCall*dropout_4/StatefulPartitionedCall:output:0*dropout_3/StatefulPartitionedCall:output:0mean_hin_aggregator_1_6470mean_hin_aggregator_1_6472mean_hin_aggregator_1_6474*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_63852/
-mean_hin_aggregator_1/StatefulPartitionedCall�
!dropout_2/StatefulPartitionedCallStatefulPartitionedCallinput_1"^dropout_3/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_64892#
!dropout_2/StatefulPartitionedCall�
dropout/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_65192!
dropout/StatefulPartitionedCall�
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall"reshape_1/PartitionedCall:output:0 ^dropout/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_65492#
!dropout_1/StatefulPartitionedCall�
reshape_5/PartitionedCallPartitionedCall6mean_hin_aggregator_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_5_layer_call_and_return_conditional_losses_65812
reshape_5/PartitionedCall�
reshape_4/PartitionedCallPartitionedCall6mean_hin_aggregator_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_4_layer_call_and_return_conditional_losses_66032
reshape_4/PartitionedCall�
+mean_hin_aggregator/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0(dropout/StatefulPartitionedCall:output:0*dropout_1/StatefulPartitionedCall:output:0mean_hin_aggregator_6811mean_hin_aggregator_6813mean_hin_aggregator_6815mean_hin_aggregator_6817*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_66952-
+mean_hin_aggregator/StatefulPartitionedCall�
!dropout_9/StatefulPartitionedCallStatefulPartitionedCall4mean_hin_aggregator/StatefulPartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_9_layer_call_and_return_conditional_losses_68322#
!dropout_9/StatefulPartitionedCall�
!dropout_7/StatefulPartitionedCallStatefulPartitionedCall"reshape_4/PartitionedCall:output:0"^dropout_9/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_7_layer_call_and_return_conditional_losses_68622#
!dropout_7/StatefulPartitionedCall�
!dropout_8/StatefulPartitionedCallStatefulPartitionedCall"reshape_5/PartitionedCall:output:0"^dropout_7/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_8_layer_call_and_return_conditional_losses_68922#
!dropout_8/StatefulPartitionedCall�
-mean_hin_aggregator_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_9/StatefulPartitionedCall:output:0*dropout_7/StatefulPartitionedCall:output:0*dropout_8/StatefulPartitionedCall:output:0mean_hin_aggregator_3_7108mean_hin_aggregator_3_7110mean_hin_aggregator_3_7112mean_hin_aggregator_3_7114*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_69932/
-mean_hin_aggregator_3/StatefulPartitionedCall�
reshape_6/PartitionedCallPartitionedCall6mean_hin_aggregator_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_6_layer_call_and_return_conditional_losses_71292
reshape_6/PartitionedCall�
lambda/PartitionedCallPartitionedCall"reshape_6/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_lambda_layer_call_and_return_conditional_losses_71482
lambda/PartitionedCall�
IdentityIdentitylambda/PartitionedCall:output:0 ^dropout/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall"^dropout_4/StatefulPartitionedCall"^dropout_5/StatefulPartitionedCall"^dropout_6/StatefulPartitionedCall"^dropout_7/StatefulPartitionedCall"^dropout_8/StatefulPartitionedCall"^dropout_9/StatefulPartitionedCall,^mean_hin_aggregator/StatefulPartitionedCall.^mean_hin_aggregator_1/StatefulPartitionedCall.^mean_hin_aggregator_2/StatefulPartitionedCall.^mean_hin_aggregator_3/StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall2F
!dropout_4/StatefulPartitionedCall!dropout_4/StatefulPartitionedCall2F
!dropout_5/StatefulPartitionedCall!dropout_5/StatefulPartitionedCall2F
!dropout_6/StatefulPartitionedCall!dropout_6/StatefulPartitionedCall2F
!dropout_7/StatefulPartitionedCall!dropout_7/StatefulPartitionedCall2F
!dropout_8/StatefulPartitionedCall!dropout_8/StatefulPartitionedCall2F
!dropout_9/StatefulPartitionedCall!dropout_9/StatefulPartitionedCall2Z
+mean_hin_aggregator/StatefulPartitionedCall+mean_hin_aggregator/StatefulPartitionedCall2^
-mean_hin_aggregator_1/StatefulPartitionedCall-mean_hin_aggregator_1/StatefulPartitionedCall2^
-mean_hin_aggregator_2/StatefulPartitionedCall-mean_hin_aggregator_2/StatefulPartitionedCall2^
-mean_hin_aggregator_3/StatefulPartitionedCall-mean_hin_aggregator_3/StatefulPartitionedCall:T P
+
_output_shapes
:���������o
!
_user_specified_name	input_1:TP
+
_output_shapes
:���������
!
_user_specified_name	input_2:TP
+
_output_shapes
:���������
!
_user_specified_name	input_3:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_4:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_5
�
a
C__inference_dropout_5_layer_call_and_return_conditional_losses_6058

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:��������� o2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:��������� o2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
_
C__inference_reshape_4_layer_call_and_return_conditional_losses_9078

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������@2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
C__inference_dropout_7_layer_call_and_return_conditional_losses_6867

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:���������@2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:���������@2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
`
A__inference_dropout_layer_call_and_return_conditional_losses_6519

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:���������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:���������*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:���������2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
D
(__inference_dropout_8_layer_call_fn_9183

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_8_layer_call_and_return_conditional_losses_68972
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
b
C__inference_dropout_3_layer_call_and_return_conditional_losses_8432

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:��������� o2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:��������� o*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:��������� o2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:��������� o2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:��������� o2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
D
(__inference_dropout_9_layer_call_fn_9129

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_9_layer_call_and_return_conditional_losses_68372
PartitionedCallp
IdentityIdentityPartitionedCall:output:0*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
b
C__inference_dropout_3_layer_call_and_return_conditional_losses_6113

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:��������� o2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:��������� o*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:��������� o2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:��������� o2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:��������� o2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
B
&__inference_dropout_layer_call_fn_8555

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_65242
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
a
(__inference_dropout_7_layer_call_fn_9151

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_7_layer_call_and_return_conditional_losses_68622
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������@22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�

\
@__inference_lambda_layer_call_and_return_conditional_losses_9418

inputs
identityn
l2_normalize/SquareSquareinputs*
T0*'
_output_shapes
:���������@2
l2_normalize/Square�
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
���������2$
"l2_normalize/Sum/reduction_indices�
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+2
l2_normalize/Maximum/y�
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������2
l2_normalize/Maximum}
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������2
l2_normalize/Rsqrtu
l2_normalizeMulinputsl2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������@2
l2_normalized
IdentityIdentityl2_normalize:z:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*&
_input_shapes
:���������@:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
b
C__inference_dropout_4_layer_call_and_return_conditional_losses_8405

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Constw
dropout/MulMulinputsdropout/Const:output:0*
T0*+
_output_shapes
:���������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*+
_output_shapes
:���������*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������2
dropout/Cast~
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*+
_output_shapes
:���������2
dropout/Mul_1i
IdentityIdentitydropout/Mul_1:z:0*
T0*+
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
&__inference_model_1_layer_call_fn_7422
input_1
input_2
input_3
input_4
input_5
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1input_2input_3input_4input_5unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_73912
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:T P
+
_output_shapes
:���������o
!
_user_specified_name	input_1:TP
+
_output_shapes
:���������
!
_user_specified_name	input_2:TP
+
_output_shapes
:���������
!
_user_specified_name	input_3:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_4:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_5
�
b
C__inference_dropout_9_layer_call_and_return_conditional_losses_6832

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Constw
dropout/MulMulinputsdropout/Const:output:0*
T0*+
_output_shapes
:���������@2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*+
_output_shapes
:���������@*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������@2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������@2
dropout/Cast~
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*+
_output_shapes
:���������@2
dropout/Mul_1i
IdentityIdentitydropout/Mul_1:z:0*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
D
(__inference_dropout_2_layer_call_fn_8528

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_64942
PartitionedCallp
IdentityIdentityPartitionedCall:output:0*
T0*+
_output_shapes
:���������o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������o:S O
+
_output_shapes
:���������o
 
_user_specified_nameinputs
��
�
A__inference_model_1_layer_call_and_return_conditional_losses_7887
inputs_0
inputs_1
inputs_2
inputs_3
inputs_49
5mean_hin_aggregator_2_shape_1_readvariableop_resource9
5mean_hin_aggregator_2_shape_3_readvariableop_resource7
3mean_hin_aggregator_2_add_1_readvariableop_resource9
5mean_hin_aggregator_1_shape_1_readvariableop_resource9
5mean_hin_aggregator_1_shape_3_readvariableop_resource7
3mean_hin_aggregator_1_add_1_readvariableop_resource7
3mean_hin_aggregator_shape_1_readvariableop_resource7
3mean_hin_aggregator_shape_3_readvariableop_resource7
3mean_hin_aggregator_shape_5_readvariableop_resource5
1mean_hin_aggregator_add_2_readvariableop_resource9
5mean_hin_aggregator_3_shape_1_readvariableop_resource9
5mean_hin_aggregator_3_shape_3_readvariableop_resource9
5mean_hin_aggregator_3_shape_5_readvariableop_resource7
3mean_hin_aggregator_3_add_2_readvariableop_resource
identity��(mean_hin_aggregator/add_2/ReadVariableOp�,mean_hin_aggregator/transpose/ReadVariableOp�.mean_hin_aggregator/transpose_1/ReadVariableOp�.mean_hin_aggregator/transpose_2/ReadVariableOp�*mean_hin_aggregator_1/add_1/ReadVariableOp�.mean_hin_aggregator_1/transpose/ReadVariableOp�0mean_hin_aggregator_1/transpose_1/ReadVariableOp�*mean_hin_aggregator_2/add_1/ReadVariableOp�.mean_hin_aggregator_2/transpose/ReadVariableOp�0mean_hin_aggregator_2/transpose_1/ReadVariableOp�*mean_hin_aggregator_3/add_2/ReadVariableOp�.mean_hin_aggregator_3/transpose/ReadVariableOp�0mean_hin_aggregator_3/transpose_1/ReadVariableOp�0mean_hin_aggregator_3/transpose_2/ReadVariableOpZ
reshape_3/ShapeShapeinputs_4*
T0*
_output_shapes
:2
reshape_3/Shape�
reshape_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_3/strided_slice/stack�
reshape_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_3/strided_slice/stack_1�
reshape_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_3/strided_slice/stack_2�
reshape_3/strided_sliceStridedSlicereshape_3/Shape:output:0&reshape_3/strided_slice/stack:output:0(reshape_3/strided_slice/stack_1:output:0(reshape_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_3/strided_slicex
reshape_3/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_3/Reshape/shape/1x
reshape_3/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
reshape_3/Reshape/shape/2x
reshape_3/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2
reshape_3/Reshape/shape/3�
reshape_3/Reshape/shapePack reshape_3/strided_slice:output:0"reshape_3/Reshape/shape/1:output:0"reshape_3/Reshape/shape/2:output:0"reshape_3/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_3/Reshape/shape�
reshape_3/ReshapeReshapeinputs_4 reshape_3/Reshape/shape:output:0*
T0*/
_output_shapes
:��������� o2
reshape_3/ReshapeZ
reshape_2/ShapeShapeinputs_3*
T0*
_output_shapes
:2
reshape_2/Shape�
reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_2/strided_slice/stack�
reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_1�
reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_2�
reshape_2/strided_sliceStridedSlicereshape_2/Shape:output:0&reshape_2/strided_slice/stack:output:0(reshape_2/strided_slice/stack_1:output:0(reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_2/strided_slicex
reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_2/Reshape/shape/1x
reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
reshape_2/Reshape/shape/2x
reshape_2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2
reshape_2/Reshape/shape/3�
reshape_2/Reshape/shapePack reshape_2/strided_slice:output:0"reshape_2/Reshape/shape/1:output:0"reshape_2/Reshape/shape/2:output:0"reshape_2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_2/Reshape/shape�
reshape_2/ReshapeReshapeinputs_3 reshape_2/Reshape/shape:output:0*
T0*/
_output_shapes
:��������� o2
reshape_2/Reshapew
dropout_6/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_6/dropout/Const�
dropout_6/dropout/MulMulinputs_2 dropout_6/dropout/Const:output:0*
T0*+
_output_shapes
:���������2
dropout_6/dropout/Mulj
dropout_6/dropout/ShapeShapeinputs_2*
T0*
_output_shapes
:2
dropout_6/dropout/Shape�
.dropout_6/dropout/random_uniform/RandomUniformRandomUniform dropout_6/dropout/Shape:output:0*
T0*+
_output_shapes
:���������*
dtype0*
seed�20
.dropout_6/dropout/random_uniform/RandomUniform�
 dropout_6/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_6/dropout/GreaterEqual/y�
dropout_6/dropout/GreaterEqualGreaterEqual7dropout_6/dropout/random_uniform/RandomUniform:output:0)dropout_6/dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������2 
dropout_6/dropout/GreaterEqual�
dropout_6/dropout/CastCast"dropout_6/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������2
dropout_6/dropout/Cast�
dropout_6/dropout/Mul_1Muldropout_6/dropout/Mul:z:0dropout_6/dropout/Cast:y:0*
T0*+
_output_shapes
:���������2
dropout_6/dropout/Mul_1w
dropout_5/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_5/dropout/Const�
dropout_5/dropout/MulMulreshape_3/Reshape:output:0 dropout_5/dropout/Const:output:0*
T0*/
_output_shapes
:��������� o2
dropout_5/dropout/Mul|
dropout_5/dropout/ShapeShapereshape_3/Reshape:output:0*
T0*
_output_shapes
:2
dropout_5/dropout/Shape�
.dropout_5/dropout/random_uniform/RandomUniformRandomUniform dropout_5/dropout/Shape:output:0*
T0*/
_output_shapes
:��������� o*
dtype0*
seed�*
seed220
.dropout_5/dropout/random_uniform/RandomUniform�
 dropout_5/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_5/dropout/GreaterEqual/y�
dropout_5/dropout/GreaterEqualGreaterEqual7dropout_5/dropout/random_uniform/RandomUniform:output:0)dropout_5/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:��������� o2 
dropout_5/dropout/GreaterEqual�
dropout_5/dropout/CastCast"dropout_5/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:��������� o2
dropout_5/dropout/Cast�
dropout_5/dropout/Mul_1Muldropout_5/dropout/Mul:z:0dropout_5/dropout/Cast:y:0*
T0*/
_output_shapes
:��������� o2
dropout_5/dropout/Mul_1w
dropout_4/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_4/dropout/Const�
dropout_4/dropout/MulMulinputs_1 dropout_4/dropout/Const:output:0*
T0*+
_output_shapes
:���������2
dropout_4/dropout/Mulj
dropout_4/dropout/ShapeShapeinputs_1*
T0*
_output_shapes
:2
dropout_4/dropout/Shape�
.dropout_4/dropout/random_uniform/RandomUniformRandomUniform dropout_4/dropout/Shape:output:0*
T0*+
_output_shapes
:���������*
dtype0*
seed�*
seed220
.dropout_4/dropout/random_uniform/RandomUniform�
 dropout_4/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_4/dropout/GreaterEqual/y�
dropout_4/dropout/GreaterEqualGreaterEqual7dropout_4/dropout/random_uniform/RandomUniform:output:0)dropout_4/dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������2 
dropout_4/dropout/GreaterEqual�
dropout_4/dropout/CastCast"dropout_4/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������2
dropout_4/dropout/Cast�
dropout_4/dropout/Mul_1Muldropout_4/dropout/Mul:z:0dropout_4/dropout/Cast:y:0*
T0*+
_output_shapes
:���������2
dropout_4/dropout/Mul_1w
dropout_3/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_3/dropout/Const�
dropout_3/dropout/MulMulreshape_2/Reshape:output:0 dropout_3/dropout/Const:output:0*
T0*/
_output_shapes
:��������� o2
dropout_3/dropout/Mul|
dropout_3/dropout/ShapeShapereshape_2/Reshape:output:0*
T0*
_output_shapes
:2
dropout_3/dropout/Shape�
.dropout_3/dropout/random_uniform/RandomUniformRandomUniform dropout_3/dropout/Shape:output:0*
T0*/
_output_shapes
:��������� o*
dtype0*
seed�*
seed220
.dropout_3/dropout/random_uniform/RandomUniform�
 dropout_3/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_3/dropout/GreaterEqual/y�
dropout_3/dropout/GreaterEqualGreaterEqual7dropout_3/dropout/random_uniform/RandomUniform:output:0)dropout_3/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:��������� o2 
dropout_3/dropout/GreaterEqual�
dropout_3/dropout/CastCast"dropout_3/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:��������� o2
dropout_3/dropout/Cast�
dropout_3/dropout/Mul_1Muldropout_3/dropout/Mul:z:0dropout_3/dropout/Cast:y:0*
T0*/
_output_shapes
:��������� o2
dropout_3/dropout/Mul_1Z
reshape_1/ShapeShapeinputs_2*
T0*
_output_shapes
:2
reshape_1/Shape�
reshape_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_1/strided_slice/stack�
reshape_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_1/strided_slice/stack_1�
reshape_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_1/strided_slice/stack_2�
reshape_1/strided_sliceStridedSlicereshape_1/Shape:output:0&reshape_1/strided_slice/stack:output:0(reshape_1/strided_slice/stack_1:output:0(reshape_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_1/strided_slicex
reshape_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_1/Reshape/shape/1x
reshape_1/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_1/Reshape/shape/2x
reshape_1/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_1/Reshape/shape/3�
reshape_1/Reshape/shapePack reshape_1/strided_slice:output:0"reshape_1/Reshape/shape/1:output:0"reshape_1/Reshape/shape/2:output:0"reshape_1/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_1/Reshape/shape�
reshape_1/ReshapeReshapeinputs_2 reshape_1/Reshape/shape:output:0*
T0*/
_output_shapes
:���������2
reshape_1/ReshapeV
reshape/ShapeShapeinputs_1*
T0*
_output_shapes
:2
reshape/Shape�
reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape/strided_slice/stack�
reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
reshape/strided_slice/stack_1�
reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
reshape/strided_slice/stack_2�
reshape/strided_sliceStridedSlicereshape/Shape:output:0$reshape/strided_slice/stack:output:0&reshape/strided_slice/stack_1:output:0&reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape/strided_slicet
reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape/Reshape/shape/1t
reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
reshape/Reshape/shape/2t
reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2
reshape/Reshape/shape/3�
reshape/Reshape/shapePackreshape/strided_slice:output:0 reshape/Reshape/shape/1:output:0 reshape/Reshape/shape/2:output:0 reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape/Reshape/shape�
reshape/ReshapeReshapeinputs_1reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:���������2
reshape/Reshape�
,mean_hin_aggregator_2/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,mean_hin_aggregator_2/Mean/reduction_indices�
mean_hin_aggregator_2/MeanMeandropout_5/dropout/Mul_1:z:05mean_hin_aggregator_2/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
mean_hin_aggregator_2/Mean�
mean_hin_aggregator_2/ShapeShape#mean_hin_aggregator_2/Mean:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_2/Shape�
mean_hin_aggregator_2/unstackUnpack$mean_hin_aggregator_2/Shape:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator_2/unstack�
,mean_hin_aggregator_2/Shape_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_2_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype02.
,mean_hin_aggregator_2/Shape_1/ReadVariableOp�
mean_hin_aggregator_2/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2
mean_hin_aggregator_2/Shape_1�
mean_hin_aggregator_2/unstack_1Unpack&mean_hin_aggregator_2/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_2/unstack_1�
#mean_hin_aggregator_2/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2%
#mean_hin_aggregator_2/Reshape/shape�
mean_hin_aggregator_2/ReshapeReshape#mean_hin_aggregator_2/Mean:output:0,mean_hin_aggregator_2/Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2
mean_hin_aggregator_2/Reshape�
.mean_hin_aggregator_2/transpose/ReadVariableOpReadVariableOp5mean_hin_aggregator_2_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype020
.mean_hin_aggregator_2/transpose/ReadVariableOp�
$mean_hin_aggregator_2/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator_2/transpose/perm�
mean_hin_aggregator_2/transpose	Transpose6mean_hin_aggregator_2/transpose/ReadVariableOp:value:0-mean_hin_aggregator_2/transpose/perm:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator_2/transpose�
%mean_hin_aggregator_2/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2'
%mean_hin_aggregator_2/Reshape_1/shape�
mean_hin_aggregator_2/Reshape_1Reshape#mean_hin_aggregator_2/transpose:y:0.mean_hin_aggregator_2/Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator_2/Reshape_1�
mean_hin_aggregator_2/MatMulMatMul&mean_hin_aggregator_2/Reshape:output:0(mean_hin_aggregator_2/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator_2/MatMul�
'mean_hin_aggregator_2/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_2/Reshape_2/shape/1�
'mean_hin_aggregator_2/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_2/Reshape_2/shape/2�
%mean_hin_aggregator_2/Reshape_2/shapePack&mean_hin_aggregator_2/unstack:output:00mean_hin_aggregator_2/Reshape_2/shape/1:output:00mean_hin_aggregator_2/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_2/Reshape_2/shape�
mean_hin_aggregator_2/Reshape_2Reshape&mean_hin_aggregator_2/MatMul:product:0.mean_hin_aggregator_2/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_2/Reshape_2�
mean_hin_aggregator_2/Shape_2Shapedropout_6/dropout/Mul_1:z:0*
T0*
_output_shapes
:2
mean_hin_aggregator_2/Shape_2�
mean_hin_aggregator_2/unstack_2Unpack&mean_hin_aggregator_2/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2!
mean_hin_aggregator_2/unstack_2�
,mean_hin_aggregator_2/Shape_3/ReadVariableOpReadVariableOp5mean_hin_aggregator_2_shape_3_readvariableop_resource*
_output_shapes

: *
dtype02.
,mean_hin_aggregator_2/Shape_3/ReadVariableOp�
mean_hin_aggregator_2/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2
mean_hin_aggregator_2/Shape_3�
mean_hin_aggregator_2/unstack_3Unpack&mean_hin_aggregator_2/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_2/unstack_3�
%mean_hin_aggregator_2/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2'
%mean_hin_aggregator_2/Reshape_3/shape�
mean_hin_aggregator_2/Reshape_3Reshapedropout_6/dropout/Mul_1:z:0.mean_hin_aggregator_2/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2!
mean_hin_aggregator_2/Reshape_3�
0mean_hin_aggregator_2/transpose_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_2_shape_3_readvariableop_resource*
_output_shapes

: *
dtype022
0mean_hin_aggregator_2/transpose_1/ReadVariableOp�
&mean_hin_aggregator_2/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2(
&mean_hin_aggregator_2/transpose_1/perm�
!mean_hin_aggregator_2/transpose_1	Transpose8mean_hin_aggregator_2/transpose_1/ReadVariableOp:value:0/mean_hin_aggregator_2/transpose_1/perm:output:0*
T0*
_output_shapes

: 2#
!mean_hin_aggregator_2/transpose_1�
%mean_hin_aggregator_2/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2'
%mean_hin_aggregator_2/Reshape_4/shape�
mean_hin_aggregator_2/Reshape_4Reshape%mean_hin_aggregator_2/transpose_1:y:0.mean_hin_aggregator_2/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2!
mean_hin_aggregator_2/Reshape_4�
mean_hin_aggregator_2/MatMul_1MatMul(mean_hin_aggregator_2/Reshape_3:output:0(mean_hin_aggregator_2/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2 
mean_hin_aggregator_2/MatMul_1�
'mean_hin_aggregator_2/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_2/Reshape_5/shape/1�
'mean_hin_aggregator_2/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_2/Reshape_5/shape/2�
%mean_hin_aggregator_2/Reshape_5/shapePack(mean_hin_aggregator_2/unstack_2:output:00mean_hin_aggregator_2/Reshape_5/shape/1:output:00mean_hin_aggregator_2/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_2/Reshape_5/shape�
mean_hin_aggregator_2/Reshape_5Reshape(mean_hin_aggregator_2/MatMul_1:product:0.mean_hin_aggregator_2/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_2/Reshape_5
mean_hin_aggregator_2/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
mean_hin_aggregator_2/add/x�
mean_hin_aggregator_2/addAddV2$mean_hin_aggregator_2/add/x:output:0(mean_hin_aggregator_2/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_2/add�
mean_hin_aggregator_2/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2!
mean_hin_aggregator_2/truediv/y�
mean_hin_aggregator_2/truedivRealDivmean_hin_aggregator_2/add:z:0(mean_hin_aggregator_2/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_2/truediv�
!mean_hin_aggregator_2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2#
!mean_hin_aggregator_2/concat/axis�
mean_hin_aggregator_2/concatConcatV2(mean_hin_aggregator_2/Reshape_5:output:0!mean_hin_aggregator_2/truediv:z:0*mean_hin_aggregator_2/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_2/concat�
*mean_hin_aggregator_2/add_1/ReadVariableOpReadVariableOp3mean_hin_aggregator_2_add_1_readvariableop_resource*
_output_shapes
:@*
dtype02,
*mean_hin_aggregator_2/add_1/ReadVariableOp�
mean_hin_aggregator_2/add_1AddV2%mean_hin_aggregator_2/concat:output:02mean_hin_aggregator_2/add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_2/add_1�
mean_hin_aggregator_2/ReluRelumean_hin_aggregator_2/add_1:z:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_2/Relu�
,mean_hin_aggregator_1/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,mean_hin_aggregator_1/Mean/reduction_indices�
mean_hin_aggregator_1/MeanMeandropout_3/dropout/Mul_1:z:05mean_hin_aggregator_1/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
mean_hin_aggregator_1/Mean�
mean_hin_aggregator_1/ShapeShape#mean_hin_aggregator_1/Mean:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_1/Shape�
mean_hin_aggregator_1/unstackUnpack$mean_hin_aggregator_1/Shape:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator_1/unstack�
,mean_hin_aggregator_1/Shape_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_1_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype02.
,mean_hin_aggregator_1/Shape_1/ReadVariableOp�
mean_hin_aggregator_1/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2
mean_hin_aggregator_1/Shape_1�
mean_hin_aggregator_1/unstack_1Unpack&mean_hin_aggregator_1/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_1/unstack_1�
#mean_hin_aggregator_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2%
#mean_hin_aggregator_1/Reshape/shape�
mean_hin_aggregator_1/ReshapeReshape#mean_hin_aggregator_1/Mean:output:0,mean_hin_aggregator_1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2
mean_hin_aggregator_1/Reshape�
.mean_hin_aggregator_1/transpose/ReadVariableOpReadVariableOp5mean_hin_aggregator_1_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype020
.mean_hin_aggregator_1/transpose/ReadVariableOp�
$mean_hin_aggregator_1/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator_1/transpose/perm�
mean_hin_aggregator_1/transpose	Transpose6mean_hin_aggregator_1/transpose/ReadVariableOp:value:0-mean_hin_aggregator_1/transpose/perm:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator_1/transpose�
%mean_hin_aggregator_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2'
%mean_hin_aggregator_1/Reshape_1/shape�
mean_hin_aggregator_1/Reshape_1Reshape#mean_hin_aggregator_1/transpose:y:0.mean_hin_aggregator_1/Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator_1/Reshape_1�
mean_hin_aggregator_1/MatMulMatMul&mean_hin_aggregator_1/Reshape:output:0(mean_hin_aggregator_1/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator_1/MatMul�
'mean_hin_aggregator_1/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_1/Reshape_2/shape/1�
'mean_hin_aggregator_1/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_1/Reshape_2/shape/2�
%mean_hin_aggregator_1/Reshape_2/shapePack&mean_hin_aggregator_1/unstack:output:00mean_hin_aggregator_1/Reshape_2/shape/1:output:00mean_hin_aggregator_1/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_1/Reshape_2/shape�
mean_hin_aggregator_1/Reshape_2Reshape&mean_hin_aggregator_1/MatMul:product:0.mean_hin_aggregator_1/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_1/Reshape_2�
mean_hin_aggregator_1/Shape_2Shapedropout_4/dropout/Mul_1:z:0*
T0*
_output_shapes
:2
mean_hin_aggregator_1/Shape_2�
mean_hin_aggregator_1/unstack_2Unpack&mean_hin_aggregator_1/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2!
mean_hin_aggregator_1/unstack_2�
,mean_hin_aggregator_1/Shape_3/ReadVariableOpReadVariableOp5mean_hin_aggregator_1_shape_3_readvariableop_resource*
_output_shapes

: *
dtype02.
,mean_hin_aggregator_1/Shape_3/ReadVariableOp�
mean_hin_aggregator_1/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2
mean_hin_aggregator_1/Shape_3�
mean_hin_aggregator_1/unstack_3Unpack&mean_hin_aggregator_1/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_1/unstack_3�
%mean_hin_aggregator_1/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2'
%mean_hin_aggregator_1/Reshape_3/shape�
mean_hin_aggregator_1/Reshape_3Reshapedropout_4/dropout/Mul_1:z:0.mean_hin_aggregator_1/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2!
mean_hin_aggregator_1/Reshape_3�
0mean_hin_aggregator_1/transpose_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_1_shape_3_readvariableop_resource*
_output_shapes

: *
dtype022
0mean_hin_aggregator_1/transpose_1/ReadVariableOp�
&mean_hin_aggregator_1/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2(
&mean_hin_aggregator_1/transpose_1/perm�
!mean_hin_aggregator_1/transpose_1	Transpose8mean_hin_aggregator_1/transpose_1/ReadVariableOp:value:0/mean_hin_aggregator_1/transpose_1/perm:output:0*
T0*
_output_shapes

: 2#
!mean_hin_aggregator_1/transpose_1�
%mean_hin_aggregator_1/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2'
%mean_hin_aggregator_1/Reshape_4/shape�
mean_hin_aggregator_1/Reshape_4Reshape%mean_hin_aggregator_1/transpose_1:y:0.mean_hin_aggregator_1/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2!
mean_hin_aggregator_1/Reshape_4�
mean_hin_aggregator_1/MatMul_1MatMul(mean_hin_aggregator_1/Reshape_3:output:0(mean_hin_aggregator_1/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2 
mean_hin_aggregator_1/MatMul_1�
'mean_hin_aggregator_1/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_1/Reshape_5/shape/1�
'mean_hin_aggregator_1/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_1/Reshape_5/shape/2�
%mean_hin_aggregator_1/Reshape_5/shapePack(mean_hin_aggregator_1/unstack_2:output:00mean_hin_aggregator_1/Reshape_5/shape/1:output:00mean_hin_aggregator_1/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_1/Reshape_5/shape�
mean_hin_aggregator_1/Reshape_5Reshape(mean_hin_aggregator_1/MatMul_1:product:0.mean_hin_aggregator_1/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_1/Reshape_5
mean_hin_aggregator_1/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
mean_hin_aggregator_1/add/x�
mean_hin_aggregator_1/addAddV2$mean_hin_aggregator_1/add/x:output:0(mean_hin_aggregator_1/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_1/add�
mean_hin_aggregator_1/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2!
mean_hin_aggregator_1/truediv/y�
mean_hin_aggregator_1/truedivRealDivmean_hin_aggregator_1/add:z:0(mean_hin_aggregator_1/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_1/truediv�
!mean_hin_aggregator_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2#
!mean_hin_aggregator_1/concat/axis�
mean_hin_aggregator_1/concatConcatV2(mean_hin_aggregator_1/Reshape_5:output:0!mean_hin_aggregator_1/truediv:z:0*mean_hin_aggregator_1/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_1/concat�
*mean_hin_aggregator_1/add_1/ReadVariableOpReadVariableOp3mean_hin_aggregator_1_add_1_readvariableop_resource*
_output_shapes
:@*
dtype02,
*mean_hin_aggregator_1/add_1/ReadVariableOp�
mean_hin_aggregator_1/add_1AddV2%mean_hin_aggregator_1/concat:output:02mean_hin_aggregator_1/add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_1/add_1�
mean_hin_aggregator_1/ReluRelumean_hin_aggregator_1/add_1:z:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_1/Reluw
dropout_2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_2/dropout/Const�
dropout_2/dropout/MulMulinputs_0 dropout_2/dropout/Const:output:0*
T0*+
_output_shapes
:���������o2
dropout_2/dropout/Mulj
dropout_2/dropout/ShapeShapeinputs_0*
T0*
_output_shapes
:2
dropout_2/dropout/Shape�
.dropout_2/dropout/random_uniform/RandomUniformRandomUniform dropout_2/dropout/Shape:output:0*
T0*+
_output_shapes
:���������o*
dtype0*
seed�*
seed220
.dropout_2/dropout/random_uniform/RandomUniform�
 dropout_2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_2/dropout/GreaterEqual/y�
dropout_2/dropout/GreaterEqualGreaterEqual7dropout_2/dropout/random_uniform/RandomUniform:output:0)dropout_2/dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������o2 
dropout_2/dropout/GreaterEqual�
dropout_2/dropout/CastCast"dropout_2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������o2
dropout_2/dropout/Cast�
dropout_2/dropout/Mul_1Muldropout_2/dropout/Mul:z:0dropout_2/dropout/Cast:y:0*
T0*+
_output_shapes
:���������o2
dropout_2/dropout/Mul_1s
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/dropout/Const�
dropout/dropout/MulMulreshape/Reshape:output:0dropout/dropout/Const:output:0*
T0*/
_output_shapes
:���������2
dropout/dropout/Mulv
dropout/dropout/ShapeShapereshape/Reshape:output:0*
T0*
_output_shapes
:2
dropout/dropout/Shape�
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*/
_output_shapes
:���������*
dtype0*
seed�*
seed22.
,dropout/dropout/random_uniform/RandomUniform�
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2 
dropout/dropout/GreaterEqual/y�
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������2
dropout/dropout/GreaterEqual�
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������2
dropout/dropout/Cast�
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*/
_output_shapes
:���������2
dropout/dropout/Mul_1w
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_1/dropout/Const�
dropout_1/dropout/MulMulreshape_1/Reshape:output:0 dropout_1/dropout/Const:output:0*
T0*/
_output_shapes
:���������2
dropout_1/dropout/Mul|
dropout_1/dropout/ShapeShapereshape_1/Reshape:output:0*
T0*
_output_shapes
:2
dropout_1/dropout/Shape�
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*/
_output_shapes
:���������*
dtype0*
seed�*
seed220
.dropout_1/dropout/random_uniform/RandomUniform�
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_1/dropout/GreaterEqual/y�
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������2 
dropout_1/dropout/GreaterEqual�
dropout_1/dropout/CastCast"dropout_1/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������2
dropout_1/dropout/Cast�
dropout_1/dropout/Mul_1Muldropout_1/dropout/Mul:z:0dropout_1/dropout/Cast:y:0*
T0*/
_output_shapes
:���������2
dropout_1/dropout/Mul_1z
reshape_5/ShapeShape(mean_hin_aggregator_2/Relu:activations:0*
T0*
_output_shapes
:2
reshape_5/Shape�
reshape_5/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_5/strided_slice/stack�
reshape_5/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_5/strided_slice/stack_1�
reshape_5/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_5/strided_slice/stack_2�
reshape_5/strided_sliceStridedSlicereshape_5/Shape:output:0&reshape_5/strided_slice/stack:output:0(reshape_5/strided_slice/stack_1:output:0(reshape_5/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_5/strided_slicex
reshape_5/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_5/Reshape/shape/1x
reshape_5/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_5/Reshape/shape/2x
reshape_5/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2
reshape_5/Reshape/shape/3�
reshape_5/Reshape/shapePack reshape_5/strided_slice:output:0"reshape_5/Reshape/shape/1:output:0"reshape_5/Reshape/shape/2:output:0"reshape_5/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_5/Reshape/shape�
reshape_5/ReshapeReshape(mean_hin_aggregator_2/Relu:activations:0 reshape_5/Reshape/shape:output:0*
T0*/
_output_shapes
:���������@2
reshape_5/Reshapez
reshape_4/ShapeShape(mean_hin_aggregator_1/Relu:activations:0*
T0*
_output_shapes
:2
reshape_4/Shape�
reshape_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_4/strided_slice/stack�
reshape_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_4/strided_slice/stack_1�
reshape_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_4/strided_slice/stack_2�
reshape_4/strided_sliceStridedSlicereshape_4/Shape:output:0&reshape_4/strided_slice/stack:output:0(reshape_4/strided_slice/stack_1:output:0(reshape_4/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_4/strided_slicex
reshape_4/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_4/Reshape/shape/1x
reshape_4/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_4/Reshape/shape/2x
reshape_4/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2
reshape_4/Reshape/shape/3�
reshape_4/Reshape/shapePack reshape_4/strided_slice:output:0"reshape_4/Reshape/shape/1:output:0"reshape_4/Reshape/shape/2:output:0"reshape_4/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
reshape_4/Reshape/shape�
reshape_4/ReshapeReshape(mean_hin_aggregator_1/Relu:activations:0 reshape_4/Reshape/shape:output:0*
T0*/
_output_shapes
:���������@2
reshape_4/Reshape�
*mean_hin_aggregator/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2,
*mean_hin_aggregator/Mean/reduction_indices�
mean_hin_aggregator/MeanMeandropout/dropout/Mul_1:z:03mean_hin_aggregator/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
mean_hin_aggregator/Mean�
mean_hin_aggregator/ShapeShape!mean_hin_aggregator/Mean:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator/Shape�
mean_hin_aggregator/unstackUnpack"mean_hin_aggregator/Shape:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator/unstack�
*mean_hin_aggregator/Shape_1/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_1_readvariableop_resource*
_output_shapes

: *
dtype02,
*mean_hin_aggregator/Shape_1/ReadVariableOp�
mean_hin_aggregator/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"       2
mean_hin_aggregator/Shape_1�
mean_hin_aggregator/unstack_1Unpack$mean_hin_aggregator/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2
mean_hin_aggregator/unstack_1�
!mean_hin_aggregator/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2#
!mean_hin_aggregator/Reshape/shape�
mean_hin_aggregator/ReshapeReshape!mean_hin_aggregator/Mean:output:0*mean_hin_aggregator/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2
mean_hin_aggregator/Reshape�
,mean_hin_aggregator/transpose/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_1_readvariableop_resource*
_output_shapes

: *
dtype02.
,mean_hin_aggregator/transpose/ReadVariableOp�
"mean_hin_aggregator/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2$
"mean_hin_aggregator/transpose/perm�
mean_hin_aggregator/transpose	Transpose4mean_hin_aggregator/transpose/ReadVariableOp:value:0+mean_hin_aggregator/transpose/perm:output:0*
T0*
_output_shapes

: 2
mean_hin_aggregator/transpose�
#mean_hin_aggregator/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2%
#mean_hin_aggregator/Reshape_1/shape�
mean_hin_aggregator/Reshape_1Reshape!mean_hin_aggregator/transpose:y:0,mean_hin_aggregator/Reshape_1/shape:output:0*
T0*
_output_shapes

: 2
mean_hin_aggregator/Reshape_1�
mean_hin_aggregator/MatMulMatMul$mean_hin_aggregator/Reshape:output:0&mean_hin_aggregator/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator/MatMul�
%mean_hin_aggregator/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2'
%mean_hin_aggregator/Reshape_2/shape/1�
%mean_hin_aggregator/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2'
%mean_hin_aggregator/Reshape_2/shape/2�
#mean_hin_aggregator/Reshape_2/shapePack$mean_hin_aggregator/unstack:output:0.mean_hin_aggregator/Reshape_2/shape/1:output:0.mean_hin_aggregator/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2%
#mean_hin_aggregator/Reshape_2/shape�
mean_hin_aggregator/Reshape_2Reshape$mean_hin_aggregator/MatMul:product:0,mean_hin_aggregator/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/Reshape_2�
,mean_hin_aggregator/Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,mean_hin_aggregator/Mean_1/reduction_indices�
mean_hin_aggregator/Mean_1Meandropout_1/dropout/Mul_1:z:05mean_hin_aggregator/Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
mean_hin_aggregator/Mean_1�
mean_hin_aggregator/Shape_2Shape#mean_hin_aggregator/Mean_1:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator/Shape_2�
mean_hin_aggregator/unstack_2Unpack$mean_hin_aggregator/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator/unstack_2�
*mean_hin_aggregator/Shape_3/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_3_readvariableop_resource*
_output_shapes

: *
dtype02,
*mean_hin_aggregator/Shape_3/ReadVariableOp�
mean_hin_aggregator/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2
mean_hin_aggregator/Shape_3�
mean_hin_aggregator/unstack_3Unpack$mean_hin_aggregator/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2
mean_hin_aggregator/unstack_3�
#mean_hin_aggregator/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2%
#mean_hin_aggregator/Reshape_3/shape�
mean_hin_aggregator/Reshape_3Reshape#mean_hin_aggregator/Mean_1:output:0,mean_hin_aggregator/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
mean_hin_aggregator/Reshape_3�
.mean_hin_aggregator/transpose_1/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_3_readvariableop_resource*
_output_shapes

: *
dtype020
.mean_hin_aggregator/transpose_1/ReadVariableOp�
$mean_hin_aggregator/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator/transpose_1/perm�
mean_hin_aggregator/transpose_1	Transpose6mean_hin_aggregator/transpose_1/ReadVariableOp:value:0-mean_hin_aggregator/transpose_1/perm:output:0*
T0*
_output_shapes

: 2!
mean_hin_aggregator/transpose_1�
#mean_hin_aggregator/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2%
#mean_hin_aggregator/Reshape_4/shape�
mean_hin_aggregator/Reshape_4Reshape#mean_hin_aggregator/transpose_1:y:0,mean_hin_aggregator/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
mean_hin_aggregator/Reshape_4�
mean_hin_aggregator/MatMul_1MatMul&mean_hin_aggregator/Reshape_3:output:0&mean_hin_aggregator/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator/MatMul_1�
%mean_hin_aggregator/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2'
%mean_hin_aggregator/Reshape_5/shape/1�
%mean_hin_aggregator/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2'
%mean_hin_aggregator/Reshape_5/shape/2�
#mean_hin_aggregator/Reshape_5/shapePack&mean_hin_aggregator/unstack_2:output:0.mean_hin_aggregator/Reshape_5/shape/1:output:0.mean_hin_aggregator/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2%
#mean_hin_aggregator/Reshape_5/shape�
mean_hin_aggregator/Reshape_5Reshape&mean_hin_aggregator/MatMul_1:product:0,mean_hin_aggregator/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/Reshape_5�
mean_hin_aggregator/Shape_4Shapedropout_2/dropout/Mul_1:z:0*
T0*
_output_shapes
:2
mean_hin_aggregator/Shape_4�
mean_hin_aggregator/unstack_4Unpack$mean_hin_aggregator/Shape_4:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator/unstack_4�
*mean_hin_aggregator/Shape_5/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_5_readvariableop_resource*
_output_shapes

:o *
dtype02,
*mean_hin_aggregator/Shape_5/ReadVariableOp�
mean_hin_aggregator/Shape_5Const*
_output_shapes
:*
dtype0*
valueB"o       2
mean_hin_aggregator/Shape_5�
mean_hin_aggregator/unstack_5Unpack$mean_hin_aggregator/Shape_5:output:0*
T0*
_output_shapes
: : *	
num2
mean_hin_aggregator/unstack_5�
#mean_hin_aggregator/Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2%
#mean_hin_aggregator/Reshape_6/shape�
mean_hin_aggregator/Reshape_6Reshapedropout_2/dropout/Mul_1:z:0,mean_hin_aggregator/Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������o2
mean_hin_aggregator/Reshape_6�
.mean_hin_aggregator/transpose_2/ReadVariableOpReadVariableOp3mean_hin_aggregator_shape_5_readvariableop_resource*
_output_shapes

:o *
dtype020
.mean_hin_aggregator/transpose_2/ReadVariableOp�
$mean_hin_aggregator/transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator/transpose_2/perm�
mean_hin_aggregator/transpose_2	Transpose6mean_hin_aggregator/transpose_2/ReadVariableOp:value:0-mean_hin_aggregator/transpose_2/perm:output:0*
T0*
_output_shapes

:o 2!
mean_hin_aggregator/transpose_2�
#mean_hin_aggregator/Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2%
#mean_hin_aggregator/Reshape_7/shape�
mean_hin_aggregator/Reshape_7Reshape#mean_hin_aggregator/transpose_2:y:0,mean_hin_aggregator/Reshape_7/shape:output:0*
T0*
_output_shapes

:o 2
mean_hin_aggregator/Reshape_7�
mean_hin_aggregator/MatMul_2MatMul&mean_hin_aggregator/Reshape_6:output:0&mean_hin_aggregator/Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator/MatMul_2�
%mean_hin_aggregator/Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2'
%mean_hin_aggregator/Reshape_8/shape/1�
%mean_hin_aggregator/Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2'
%mean_hin_aggregator/Reshape_8/shape/2�
#mean_hin_aggregator/Reshape_8/shapePack&mean_hin_aggregator/unstack_4:output:0.mean_hin_aggregator/Reshape_8/shape/1:output:0.mean_hin_aggregator/Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2%
#mean_hin_aggregator/Reshape_8/shape�
mean_hin_aggregator/Reshape_8Reshape&mean_hin_aggregator/MatMul_2:product:0,mean_hin_aggregator/Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/Reshape_8{
mean_hin_aggregator/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
mean_hin_aggregator/add/x�
mean_hin_aggregator/addAddV2"mean_hin_aggregator/add/x:output:0&mean_hin_aggregator/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/add�
mean_hin_aggregator/add_1AddV2mean_hin_aggregator/add:z:0&mean_hin_aggregator/Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/add_1�
mean_hin_aggregator/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
mean_hin_aggregator/truediv/y�
mean_hin_aggregator/truedivRealDivmean_hin_aggregator/add_1:z:0&mean_hin_aggregator/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator/truediv�
mean_hin_aggregator/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2!
mean_hin_aggregator/concat/axis�
mean_hin_aggregator/concatConcatV2&mean_hin_aggregator/Reshape_8:output:0mean_hin_aggregator/truediv:z:0(mean_hin_aggregator/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator/concat�
(mean_hin_aggregator/add_2/ReadVariableOpReadVariableOp1mean_hin_aggregator_add_2_readvariableop_resource*
_output_shapes
:@*
dtype02*
(mean_hin_aggregator/add_2/ReadVariableOp�
mean_hin_aggregator/add_2AddV2#mean_hin_aggregator/concat:output:00mean_hin_aggregator/add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator/add_2�
mean_hin_aggregator/ReluRelumean_hin_aggregator/add_2:z:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator/Reluw
dropout_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_9/dropout/Const�
dropout_9/dropout/MulMul&mean_hin_aggregator/Relu:activations:0 dropout_9/dropout/Const:output:0*
T0*+
_output_shapes
:���������@2
dropout_9/dropout/Mul�
dropout_9/dropout/ShapeShape&mean_hin_aggregator/Relu:activations:0*
T0*
_output_shapes
:2
dropout_9/dropout/Shape�
.dropout_9/dropout/random_uniform/RandomUniformRandomUniform dropout_9/dropout/Shape:output:0*
T0*+
_output_shapes
:���������@*
dtype0*
seed�*
seed220
.dropout_9/dropout/random_uniform/RandomUniform�
 dropout_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_9/dropout/GreaterEqual/y�
dropout_9/dropout/GreaterEqualGreaterEqual7dropout_9/dropout/random_uniform/RandomUniform:output:0)dropout_9/dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������@2 
dropout_9/dropout/GreaterEqual�
dropout_9/dropout/CastCast"dropout_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������@2
dropout_9/dropout/Cast�
dropout_9/dropout/Mul_1Muldropout_9/dropout/Mul:z:0dropout_9/dropout/Cast:y:0*
T0*+
_output_shapes
:���������@2
dropout_9/dropout/Mul_1w
dropout_7/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_7/dropout/Const�
dropout_7/dropout/MulMulreshape_4/Reshape:output:0 dropout_7/dropout/Const:output:0*
T0*/
_output_shapes
:���������@2
dropout_7/dropout/Mul|
dropout_7/dropout/ShapeShapereshape_4/Reshape:output:0*
T0*
_output_shapes
:2
dropout_7/dropout/Shape�
.dropout_7/dropout/random_uniform/RandomUniformRandomUniform dropout_7/dropout/Shape:output:0*
T0*/
_output_shapes
:���������@*
dtype0*
seed�*
seed220
.dropout_7/dropout/random_uniform/RandomUniform�
 dropout_7/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_7/dropout/GreaterEqual/y�
dropout_7/dropout/GreaterEqualGreaterEqual7dropout_7/dropout/random_uniform/RandomUniform:output:0)dropout_7/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������@2 
dropout_7/dropout/GreaterEqual�
dropout_7/dropout/CastCast"dropout_7/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������@2
dropout_7/dropout/Cast�
dropout_7/dropout/Mul_1Muldropout_7/dropout/Mul:z:0dropout_7/dropout/Cast:y:0*
T0*/
_output_shapes
:���������@2
dropout_7/dropout/Mul_1w
dropout_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout_8/dropout/Const�
dropout_8/dropout/MulMulreshape_5/Reshape:output:0 dropout_8/dropout/Const:output:0*
T0*/
_output_shapes
:���������@2
dropout_8/dropout/Mul|
dropout_8/dropout/ShapeShapereshape_5/Reshape:output:0*
T0*
_output_shapes
:2
dropout_8/dropout/Shape�
.dropout_8/dropout/random_uniform/RandomUniformRandomUniform dropout_8/dropout/Shape:output:0*
T0*/
_output_shapes
:���������@*
dtype0*
seed�*
seed2	20
.dropout_8/dropout/random_uniform/RandomUniform�
 dropout_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2"
 dropout_8/dropout/GreaterEqual/y�
dropout_8/dropout/GreaterEqualGreaterEqual7dropout_8/dropout/random_uniform/RandomUniform:output:0)dropout_8/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������@2 
dropout_8/dropout/GreaterEqual�
dropout_8/dropout/CastCast"dropout_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������@2
dropout_8/dropout/Cast�
dropout_8/dropout/Mul_1Muldropout_8/dropout/Mul:z:0dropout_8/dropout/Cast:y:0*
T0*/
_output_shapes
:���������@2
dropout_8/dropout/Mul_1�
,mean_hin_aggregator_3/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,mean_hin_aggregator_3/Mean/reduction_indices�
mean_hin_aggregator_3/MeanMeandropout_7/dropout/Mul_1:z:05mean_hin_aggregator_3/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_3/Mean�
mean_hin_aggregator_3/ShapeShape#mean_hin_aggregator_3/Mean:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_3/Shape�
mean_hin_aggregator_3/unstackUnpack$mean_hin_aggregator_3/Shape:output:0*
T0*
_output_shapes
: : : *	
num2
mean_hin_aggregator_3/unstack�
,mean_hin_aggregator_3/Shape_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02.
,mean_hin_aggregator_3/Shape_1/ReadVariableOp�
mean_hin_aggregator_3/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"@       2
mean_hin_aggregator_3/Shape_1�
mean_hin_aggregator_3/unstack_1Unpack&mean_hin_aggregator_3/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_3/unstack_1�
#mean_hin_aggregator_3/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2%
#mean_hin_aggregator_3/Reshape/shape�
mean_hin_aggregator_3/ReshapeReshape#mean_hin_aggregator_3/Mean:output:0,mean_hin_aggregator_3/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2
mean_hin_aggregator_3/Reshape�
.mean_hin_aggregator_3/transpose/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_1_readvariableop_resource*
_output_shapes

:@ *
dtype020
.mean_hin_aggregator_3/transpose/ReadVariableOp�
$mean_hin_aggregator_3/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2&
$mean_hin_aggregator_3/transpose/perm�
mean_hin_aggregator_3/transpose	Transpose6mean_hin_aggregator_3/transpose/ReadVariableOp:value:0-mean_hin_aggregator_3/transpose/perm:output:0*
T0*
_output_shapes

:@ 2!
mean_hin_aggregator_3/transpose�
%mean_hin_aggregator_3/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2'
%mean_hin_aggregator_3/Reshape_1/shape�
mean_hin_aggregator_3/Reshape_1Reshape#mean_hin_aggregator_3/transpose:y:0.mean_hin_aggregator_3/Reshape_1/shape:output:0*
T0*
_output_shapes

:@ 2!
mean_hin_aggregator_3/Reshape_1�
mean_hin_aggregator_3/MatMulMatMul&mean_hin_aggregator_3/Reshape:output:0(mean_hin_aggregator_3/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
mean_hin_aggregator_3/MatMul�
'mean_hin_aggregator_3/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_3/Reshape_2/shape/1�
'mean_hin_aggregator_3/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_3/Reshape_2/shape/2�
%mean_hin_aggregator_3/Reshape_2/shapePack&mean_hin_aggregator_3/unstack:output:00mean_hin_aggregator_3/Reshape_2/shape/1:output:00mean_hin_aggregator_3/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_3/Reshape_2/shape�
mean_hin_aggregator_3/Reshape_2Reshape&mean_hin_aggregator_3/MatMul:product:0.mean_hin_aggregator_3/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_3/Reshape_2�
.mean_hin_aggregator_3/Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :20
.mean_hin_aggregator_3/Mean_1/reduction_indices�
mean_hin_aggregator_3/Mean_1Meandropout_8/dropout/Mul_1:z:07mean_hin_aggregator_3/Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_3/Mean_1�
mean_hin_aggregator_3/Shape_2Shape%mean_hin_aggregator_3/Mean_1:output:0*
T0*
_output_shapes
:2
mean_hin_aggregator_3/Shape_2�
mean_hin_aggregator_3/unstack_2Unpack&mean_hin_aggregator_3/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2!
mean_hin_aggregator_3/unstack_2�
,mean_hin_aggregator_3/Shape_3/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02.
,mean_hin_aggregator_3/Shape_3/ReadVariableOp�
mean_hin_aggregator_3/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"@       2
mean_hin_aggregator_3/Shape_3�
mean_hin_aggregator_3/unstack_3Unpack&mean_hin_aggregator_3/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_3/unstack_3�
%mean_hin_aggregator_3/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2'
%mean_hin_aggregator_3/Reshape_3/shape�
mean_hin_aggregator_3/Reshape_3Reshape%mean_hin_aggregator_3/Mean_1:output:0.mean_hin_aggregator_3/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������@2!
mean_hin_aggregator_3/Reshape_3�
0mean_hin_aggregator_3/transpose_1/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_3_readvariableop_resource*
_output_shapes

:@ *
dtype022
0mean_hin_aggregator_3/transpose_1/ReadVariableOp�
&mean_hin_aggregator_3/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2(
&mean_hin_aggregator_3/transpose_1/perm�
!mean_hin_aggregator_3/transpose_1	Transpose8mean_hin_aggregator_3/transpose_1/ReadVariableOp:value:0/mean_hin_aggregator_3/transpose_1/perm:output:0*
T0*
_output_shapes

:@ 2#
!mean_hin_aggregator_3/transpose_1�
%mean_hin_aggregator_3/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2'
%mean_hin_aggregator_3/Reshape_4/shape�
mean_hin_aggregator_3/Reshape_4Reshape%mean_hin_aggregator_3/transpose_1:y:0.mean_hin_aggregator_3/Reshape_4/shape:output:0*
T0*
_output_shapes

:@ 2!
mean_hin_aggregator_3/Reshape_4�
mean_hin_aggregator_3/MatMul_1MatMul(mean_hin_aggregator_3/Reshape_3:output:0(mean_hin_aggregator_3/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2 
mean_hin_aggregator_3/MatMul_1�
'mean_hin_aggregator_3/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_3/Reshape_5/shape/1�
'mean_hin_aggregator_3/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_3/Reshape_5/shape/2�
%mean_hin_aggregator_3/Reshape_5/shapePack(mean_hin_aggregator_3/unstack_2:output:00mean_hin_aggregator_3/Reshape_5/shape/1:output:00mean_hin_aggregator_3/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_3/Reshape_5/shape�
mean_hin_aggregator_3/Reshape_5Reshape(mean_hin_aggregator_3/MatMul_1:product:0.mean_hin_aggregator_3/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_3/Reshape_5�
mean_hin_aggregator_3/Shape_4Shapedropout_9/dropout/Mul_1:z:0*
T0*
_output_shapes
:2
mean_hin_aggregator_3/Shape_4�
mean_hin_aggregator_3/unstack_4Unpack&mean_hin_aggregator_3/Shape_4:output:0*
T0*
_output_shapes
: : : *	
num2!
mean_hin_aggregator_3/unstack_4�
,mean_hin_aggregator_3/Shape_5/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02.
,mean_hin_aggregator_3/Shape_5/ReadVariableOp�
mean_hin_aggregator_3/Shape_5Const*
_output_shapes
:*
dtype0*
valueB"@       2
mean_hin_aggregator_3/Shape_5�
mean_hin_aggregator_3/unstack_5Unpack&mean_hin_aggregator_3/Shape_5:output:0*
T0*
_output_shapes
: : *	
num2!
mean_hin_aggregator_3/unstack_5�
%mean_hin_aggregator_3/Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2'
%mean_hin_aggregator_3/Reshape_6/shape�
mean_hin_aggregator_3/Reshape_6Reshapedropout_9/dropout/Mul_1:z:0.mean_hin_aggregator_3/Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������@2!
mean_hin_aggregator_3/Reshape_6�
0mean_hin_aggregator_3/transpose_2/ReadVariableOpReadVariableOp5mean_hin_aggregator_3_shape_5_readvariableop_resource*
_output_shapes

:@ *
dtype022
0mean_hin_aggregator_3/transpose_2/ReadVariableOp�
&mean_hin_aggregator_3/transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2(
&mean_hin_aggregator_3/transpose_2/perm�
!mean_hin_aggregator_3/transpose_2	Transpose8mean_hin_aggregator_3/transpose_2/ReadVariableOp:value:0/mean_hin_aggregator_3/transpose_2/perm:output:0*
T0*
_output_shapes

:@ 2#
!mean_hin_aggregator_3/transpose_2�
%mean_hin_aggregator_3/Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2'
%mean_hin_aggregator_3/Reshape_7/shape�
mean_hin_aggregator_3/Reshape_7Reshape%mean_hin_aggregator_3/transpose_2:y:0.mean_hin_aggregator_3/Reshape_7/shape:output:0*
T0*
_output_shapes

:@ 2!
mean_hin_aggregator_3/Reshape_7�
mean_hin_aggregator_3/MatMul_2MatMul(mean_hin_aggregator_3/Reshape_6:output:0(mean_hin_aggregator_3/Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2 
mean_hin_aggregator_3/MatMul_2�
'mean_hin_aggregator_3/Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2)
'mean_hin_aggregator_3/Reshape_8/shape/1�
'mean_hin_aggregator_3/Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2)
'mean_hin_aggregator_3/Reshape_8/shape/2�
%mean_hin_aggregator_3/Reshape_8/shapePack(mean_hin_aggregator_3/unstack_4:output:00mean_hin_aggregator_3/Reshape_8/shape/1:output:00mean_hin_aggregator_3/Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2'
%mean_hin_aggregator_3/Reshape_8/shape�
mean_hin_aggregator_3/Reshape_8Reshape(mean_hin_aggregator_3/MatMul_2:product:0.mean_hin_aggregator_3/Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2!
mean_hin_aggregator_3/Reshape_8
mean_hin_aggregator_3/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
mean_hin_aggregator_3/add/x�
mean_hin_aggregator_3/addAddV2$mean_hin_aggregator_3/add/x:output:0(mean_hin_aggregator_3/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_3/add�
mean_hin_aggregator_3/add_1AddV2mean_hin_aggregator_3/add:z:0(mean_hin_aggregator_3/Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_3/add_1�
mean_hin_aggregator_3/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2!
mean_hin_aggregator_3/truediv/y�
mean_hin_aggregator_3/truedivRealDivmean_hin_aggregator_3/add_1:z:0(mean_hin_aggregator_3/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2
mean_hin_aggregator_3/truediv�
!mean_hin_aggregator_3/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2#
!mean_hin_aggregator_3/concat/axis�
mean_hin_aggregator_3/concatConcatV2(mean_hin_aggregator_3/Reshape_8:output:0!mean_hin_aggregator_3/truediv:z:0*mean_hin_aggregator_3/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_3/concat�
*mean_hin_aggregator_3/add_2/ReadVariableOpReadVariableOp3mean_hin_aggregator_3_add_2_readvariableop_resource*
_output_shapes
:@*
dtype02,
*mean_hin_aggregator_3/add_2/ReadVariableOp�
mean_hin_aggregator_3/add_2AddV2%mean_hin_aggregator_3/concat:output:02mean_hin_aggregator_3/add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
mean_hin_aggregator_3/add_2q
reshape_6/ShapeShapemean_hin_aggregator_3/add_2:z:0*
T0*
_output_shapes
:2
reshape_6/Shape�
reshape_6/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_6/strided_slice/stack�
reshape_6/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_6/strided_slice/stack_1�
reshape_6/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_6/strided_slice/stack_2�
reshape_6/strided_sliceStridedSlicereshape_6/Shape:output:0&reshape_6/strided_slice/stack:output:0(reshape_6/strided_slice/stack_1:output:0(reshape_6/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_6/strided_slicex
reshape_6/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :@2
reshape_6/Reshape/shape/1�
reshape_6/Reshape/shapePack reshape_6/strided_slice:output:0"reshape_6/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_6/Reshape/shape�
reshape_6/ReshapeReshapemean_hin_aggregator_3/add_2:z:0 reshape_6/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2
reshape_6/Reshape�
lambda/l2_normalize/SquareSquarereshape_6/Reshape:output:0*
T0*'
_output_shapes
:���������@2
lambda/l2_normalize/Square�
)lambda/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
���������2+
)lambda/l2_normalize/Sum/reduction_indices�
lambda/l2_normalize/SumSumlambda/l2_normalize/Square:y:02lambda/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(2
lambda/l2_normalize/Sum�
lambda/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+2
lambda/l2_normalize/Maximum/y�
lambda/l2_normalize/MaximumMaximum lambda/l2_normalize/Sum:output:0&lambda/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������2
lambda/l2_normalize/Maximum�
lambda/l2_normalize/RsqrtRsqrtlambda/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������2
lambda/l2_normalize/Rsqrt�
lambda/l2_normalizeMulreshape_6/Reshape:output:0lambda/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������@2
lambda/l2_normalize�
IdentityIdentitylambda/l2_normalize:z:0)^mean_hin_aggregator/add_2/ReadVariableOp-^mean_hin_aggregator/transpose/ReadVariableOp/^mean_hin_aggregator/transpose_1/ReadVariableOp/^mean_hin_aggregator/transpose_2/ReadVariableOp+^mean_hin_aggregator_1/add_1/ReadVariableOp/^mean_hin_aggregator_1/transpose/ReadVariableOp1^mean_hin_aggregator_1/transpose_1/ReadVariableOp+^mean_hin_aggregator_2/add_1/ReadVariableOp/^mean_hin_aggregator_2/transpose/ReadVariableOp1^mean_hin_aggregator_2/transpose_1/ReadVariableOp+^mean_hin_aggregator_3/add_2/ReadVariableOp/^mean_hin_aggregator_3/transpose/ReadVariableOp1^mean_hin_aggregator_3/transpose_1/ReadVariableOp1^mean_hin_aggregator_3/transpose_2/ReadVariableOp*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::2T
(mean_hin_aggregator/add_2/ReadVariableOp(mean_hin_aggregator/add_2/ReadVariableOp2\
,mean_hin_aggregator/transpose/ReadVariableOp,mean_hin_aggregator/transpose/ReadVariableOp2`
.mean_hin_aggregator/transpose_1/ReadVariableOp.mean_hin_aggregator/transpose_1/ReadVariableOp2`
.mean_hin_aggregator/transpose_2/ReadVariableOp.mean_hin_aggregator/transpose_2/ReadVariableOp2X
*mean_hin_aggregator_1/add_1/ReadVariableOp*mean_hin_aggregator_1/add_1/ReadVariableOp2`
.mean_hin_aggregator_1/transpose/ReadVariableOp.mean_hin_aggregator_1/transpose/ReadVariableOp2d
0mean_hin_aggregator_1/transpose_1/ReadVariableOp0mean_hin_aggregator_1/transpose_1/ReadVariableOp2X
*mean_hin_aggregator_2/add_1/ReadVariableOp*mean_hin_aggregator_2/add_1/ReadVariableOp2`
.mean_hin_aggregator_2/transpose/ReadVariableOp.mean_hin_aggregator_2/transpose/ReadVariableOp2d
0mean_hin_aggregator_2/transpose_1/ReadVariableOp0mean_hin_aggregator_2/transpose_1/ReadVariableOp2X
*mean_hin_aggregator_3/add_2/ReadVariableOp*mean_hin_aggregator_3/add_2/ReadVariableOp2`
.mean_hin_aggregator_3/transpose/ReadVariableOp.mean_hin_aggregator_3/transpose/ReadVariableOp2d
0mean_hin_aggregator_3/transpose_1/ReadVariableOp0mean_hin_aggregator_3/transpose_1/ReadVariableOp2d
0mean_hin_aggregator_3/transpose_2/ReadVariableOp0mean_hin_aggregator_3/transpose_2/ReadVariableOp:U Q
+
_output_shapes
:���������o
"
_user_specified_name
inputs/0:UQ
+
_output_shapes
:���������
"
_user_specified_name
inputs/1:UQ
+
_output_shapes
:���������
"
_user_specified_name
inputs/2:UQ
+
_output_shapes
:���������@o
"
_user_specified_name
inputs/3:UQ
+
_output_shapes
:���������@o
"
_user_specified_name
inputs/4
�
a
(__inference_dropout_6_layer_call_fn_8469

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_6_layer_call_and_return_conditional_losses_60232
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
D
(__inference_dropout_1_layer_call_fn_8582

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_65542
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�E
�
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_8950
x_0
x_1
x_2#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource#
shape_5_readvariableop_resource!
add_2_readvariableop_resource
identity��add_2/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOp�transpose_2/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

: *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

: 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2v
Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean_1/reduction_indicesv
Mean_1Meanx_2!Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
Mean_1Q
Shape_2ShapeMean_1:output:0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shape~
	Reshape_3ReshapeMean_1:output:0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5E
Shape_4Shapex_0*
T0*
_output_shapes
:2	
Shape_4b
	unstack_4UnpackShape_4:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_4�
Shape_5/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_5/ReadVariableOpc
Shape_5Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_5`
	unstack_5UnpackShape_5:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_5s
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape_6/shaper
	Reshape_6Reshapex_0Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������o2
	Reshape_6�
transpose_2/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose_2/ReadVariableOpu
transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_2/perm�
transpose_2	Transpose"transpose_2/ReadVariableOp:value:0transpose_2/perm:output:0*
T0*
_output_shapes

:o 2
transpose_2s
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_7/shapeu
	Reshape_7Reshapetranspose_2:y:0Reshape_7/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_7x
MatMul_2MatMulReshape_6:output:0Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_2h
Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_8/shape/1h
Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_8/shape/2�
Reshape_8/shapePackunstack_4:output:0Reshape_8/shape/1:output:0Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_8/shape�
	Reshape_8ReshapeMatMul_2:product:0Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_8S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
addj
add_1AddV2add:z:0Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
add_1[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
	truediv/yr
truedivRealDiv	add_1:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_8:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_2/ReadVariableOpReadVariableOpadd_2_readvariableop_resource*
_output_shapes
:@*
dtype02
add_2/ReadVariableOp|
add_2AddV2concat:output:0add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_2U
ReluRelu	add_2:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_2/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp^transpose_2/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������o:���������:���������::::2,
add_2/ReadVariableOpadd_2/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp28
transpose_2/ReadVariableOptranspose_2/ReadVariableOp:P L
+
_output_shapes
:���������o

_user_specified_namex/0:TP
/
_output_shapes
:���������

_user_specified_namex/1:TP
/
_output_shapes
:���������

_user_specified_namex/2
�
�
4__inference_mean_hin_aggregator_2_layer_call_fn_8866
x_0
x_1
unknown
	unknown_0
	unknown_1
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallx_0x_1unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_62932
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::22
StatefulPartitionedCallStatefulPartitionedCall:P L
+
_output_shapes
:���������

_user_specified_namex/0:TP
/
_output_shapes
:��������� o

_user_specified_namex/1
�
]
A__inference_reshape_layer_call_and_return_conditional_losses_6167

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
b
C__inference_dropout_5_layer_call_and_return_conditional_losses_6053

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:��������� o2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:��������� o*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:��������� o2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:��������� o2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:��������� o2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�D
�
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_7076
x
x_1
x_2#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource#
shape_5_readvariableop_resource!
add_2_readvariableop_resource
identity��add_2/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOp�transpose_2/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:@ 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2v
Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean_1/reduction_indicesv
Mean_1Meanx_2!Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
Mean_1Q
Shape_2ShapeMean_1:output:0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape_3/shape~
	Reshape_3ReshapeMean_1:output:0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������@2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

:@ 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5C
Shape_4Shapex*
T0*
_output_shapes
:2	
Shape_4b
	unstack_4UnpackShape_4:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_4�
Shape_5/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_5/ReadVariableOpc
Shape_5Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_5`
	unstack_5UnpackShape_5:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_5s
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape_6/shapep
	Reshape_6ReshapexReshape_6/shape:output:0*
T0*'
_output_shapes
:���������@2
	Reshape_6�
transpose_2/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose_2/ReadVariableOpu
transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_2/perm�
transpose_2	Transpose"transpose_2/ReadVariableOp:value:0transpose_2/perm:output:0*
T0*
_output_shapes

:@ 2
transpose_2s
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_7/shapeu
	Reshape_7Reshapetranspose_2:y:0Reshape_7/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_7x
MatMul_2MatMulReshape_6:output:0Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_2h
Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_8/shape/1h
Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_8/shape/2�
Reshape_8/shapePackunstack_4:output:0Reshape_8/shape/1:output:0Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_8/shape�
	Reshape_8ReshapeMatMul_2:product:0Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_8S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
addj
add_1AddV2add:z:0Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
add_1[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
	truediv/yr
truedivRealDiv	add_1:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_8:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_2/ReadVariableOpReadVariableOpadd_2_readvariableop_resource*
_output_shapes
:@*
dtype02
add_2/ReadVariableOp|
add_2AddV2concat:output:0add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_2�
IdentityIdentity	add_2:z:0^add_2/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp^transpose_2/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������@:���������@:���������@::::2,
add_2/ReadVariableOpadd_2/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp28
transpose_2/ReadVariableOptranspose_2/ReadVariableOp:N J
+
_output_shapes
:���������@

_user_specified_namex:RN
/
_output_shapes
:���������@

_user_specified_namex:RN
/
_output_shapes
:���������@

_user_specified_namex
�0
�
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_6444
x
x_1#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource!
add_1_readvariableop_resource
identity��add_1/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:o 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2C
Shape_2Shapex*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shapep
	Reshape_3ReshapexReshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
add[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
	truediv/yp
truedivRealDivadd:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_5:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_1/ReadVariableOpReadVariableOpadd_1_readvariableop_resource*
_output_shapes
:@*
dtype02
add_1/ReadVariableOp|
add_1AddV2concat:output:0add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_1U
ReluRelu	add_1:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_1/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::2,
add_1/ReadVariableOpadd_1/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp:N J
+
_output_shapes
:���������

_user_specified_namex:RN
/
_output_shapes
:��������� o

_user_specified_namex
�
�
4__inference_mean_hin_aggregator_2_layer_call_fn_8854
x_0
x_1
unknown
	unknown_0
	unknown_1
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallx_0x_1unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_62342
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::22
StatefulPartitionedCallStatefulPartitionedCall:P L
+
_output_shapes
:���������

_user_specified_namex/0:TP
/
_output_shapes
:��������� o

_user_specified_namex/1
�
a
C__inference_dropout_6_layer_call_and_return_conditional_losses_8464

inputs

identity_1^
IdentityIdentityinputs*
T0*+
_output_shapes
:���������2

Identitym

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:���������2

Identity_1"!

identity_1Identity_1:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�D
�
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_9266
x_0
x_1
x_2#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource#
shape_5_readvariableop_resource!
add_2_readvariableop_resource
identity��add_2/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOp�transpose_2/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:@ 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2v
Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean_1/reduction_indicesv
Mean_1Meanx_2!Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
Mean_1Q
Shape_2ShapeMean_1:output:0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape_3/shape~
	Reshape_3ReshapeMean_1:output:0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������@2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

:@ 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5E
Shape_4Shapex_0*
T0*
_output_shapes
:2	
Shape_4b
	unstack_4UnpackShape_4:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_4�
Shape_5/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_5/ReadVariableOpc
Shape_5Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_5`
	unstack_5UnpackShape_5:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_5s
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape_6/shaper
	Reshape_6Reshapex_0Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������@2
	Reshape_6�
transpose_2/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose_2/ReadVariableOpu
transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_2/perm�
transpose_2	Transpose"transpose_2/ReadVariableOp:value:0transpose_2/perm:output:0*
T0*
_output_shapes

:@ 2
transpose_2s
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_7/shapeu
	Reshape_7Reshapetranspose_2:y:0Reshape_7/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_7x
MatMul_2MatMulReshape_6:output:0Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_2h
Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_8/shape/1h
Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_8/shape/2�
Reshape_8/shapePackunstack_4:output:0Reshape_8/shape/1:output:0Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_8/shape�
	Reshape_8ReshapeMatMul_2:product:0Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_8S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
addj
add_1AddV2add:z:0Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
add_1[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
	truediv/yr
truedivRealDiv	add_1:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_8:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_2/ReadVariableOpReadVariableOpadd_2_readvariableop_resource*
_output_shapes
:@*
dtype02
add_2/ReadVariableOp|
add_2AddV2concat:output:0add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_2�
IdentityIdentity	add_2:z:0^add_2/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp^transpose_2/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������@:���������@:���������@::::2,
add_2/ReadVariableOpadd_2/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp28
transpose_2/ReadVariableOptranspose_2/ReadVariableOp:P L
+
_output_shapes
:���������@

_user_specified_namex/0:TP
/
_output_shapes
:���������@

_user_specified_namex/1:TP
/
_output_shapes
:���������@

_user_specified_namex/2
�
_
C__inference_reshape_5_layer_call_and_return_conditional_losses_6581

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������@2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�

\
@__inference_lambda_layer_call_and_return_conditional_losses_7148

inputs
identityn
l2_normalize/SquareSquareinputs*
T0*'
_output_shapes
:���������@2
l2_normalize/Square�
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
���������2$
"l2_normalize/Sum/reduction_indices�
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+2
l2_normalize/Maximum/y�
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������2
l2_normalize/Maximum}
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������2
l2_normalize/Rsqrtu
l2_normalizeMulinputsl2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������@2
l2_normalized
IdentityIdentityl2_normalize:z:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*&
_input_shapes
:���������@:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�0
�
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_6293
x
x_1#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource!
add_1_readvariableop_resource
identity��add_1/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:o 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2C
Shape_2Shapex*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shapep
	Reshape_3ReshapexReshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
add[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
	truediv/yp
truedivRealDivadd:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_5:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_1/ReadVariableOpReadVariableOpadd_1_readvariableop_resource*
_output_shapes
:@*
dtype02
add_1/ReadVariableOp|
add_1AddV2concat:output:0add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_1U
ReluRelu	add_1:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_1/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::2,
add_1/ReadVariableOpadd_1/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp:N J
+
_output_shapes
:���������

_user_specified_namex:RN
/
_output_shapes
:��������� o

_user_specified_namex
�
D
(__inference_reshape_5_layer_call_fn_9102

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_5_layer_call_and_return_conditional_losses_65812
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
4__inference_mean_hin_aggregator_1_layer_call_fn_8724
x_0
x_1
unknown
	unknown_0
	unknown_1
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallx_0x_1unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_64442
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::22
StatefulPartitionedCallStatefulPartitionedCall:P L
+
_output_shapes
:���������

_user_specified_namex/0:TP
/
_output_shapes
:��������� o

_user_specified_namex/1
�
a
C__inference_dropout_4_layer_call_and_return_conditional_losses_6088

inputs

identity_1^
IdentityIdentityinputs*
T0*+
_output_shapes
:���������2

Identitym

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:���������2

Identity_1"!

identity_1Identity_1:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
b
C__inference_dropout_9_layer_call_and_return_conditional_losses_9114

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Constw
dropout/MulMulinputsdropout/Const:output:0*
T0*+
_output_shapes
:���������@2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*+
_output_shapes
:���������@*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������@2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������@2
dropout/Cast~
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*+
_output_shapes
:���������@2
dropout/Mul_1i
IdentityIdentitydropout/Mul_1:z:0*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
D
(__inference_reshape_2_layer_call_fn_8336

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_2_layer_call_and_return_conditional_losses_60032
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@o:S O
+
_output_shapes
:���������@o
 
_user_specified_nameinputs
�
b
C__inference_dropout_2_layer_call_and_return_conditional_losses_6489

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Constw
dropout/MulMulinputsdropout/Const:output:0*
T0*+
_output_shapes
:���������o2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*+
_output_shapes
:���������o*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*+
_output_shapes
:���������o2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*+
_output_shapes
:���������o2
dropout/Cast~
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*+
_output_shapes
:���������o2
dropout/Mul_1i
IdentityIdentitydropout/Mul_1:z:0*
T0*+
_output_shapes
:���������o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������o:S O
+
_output_shapes
:���������o
 
_user_specified_nameinputs
�0
�
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_6234
x
x_1#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource!
add_1_readvariableop_resource
identity��add_1/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:o 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2C
Shape_2Shapex*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shapep
	Reshape_3ReshapexReshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
add[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
	truediv/yp
truedivRealDivadd:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_5:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_1/ReadVariableOpReadVariableOpadd_1_readvariableop_resource*
_output_shapes
:@*
dtype02
add_1/ReadVariableOp|
add_1AddV2concat:output:0add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_1U
ReluRelu	add_1:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_1/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::2,
add_1/ReadVariableOpadd_1/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp:N J
+
_output_shapes
:���������

_user_specified_namex:RN
/
_output_shapes
:��������� o

_user_specified_namex
�
b
C__inference_dropout_7_layer_call_and_return_conditional_losses_9141

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:���������@2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:���������@*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������@2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������@2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:���������@2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
B
&__inference_reshape_layer_call_fn_8374

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_reshape_layer_call_and_return_conditional_losses_61672
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������2

Identity"
identityIdentity:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
a
C__inference_dropout_7_layer_call_and_return_conditional_losses_9146

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:���������@2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:���������@2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
(__inference_dropout_8_layer_call_fn_9178

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_8_layer_call_and_return_conditional_losses_68922
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������@22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�

\
@__inference_lambda_layer_call_and_return_conditional_losses_9407

inputs
identityn
l2_normalize/SquareSquareinputs*
T0*'
_output_shapes
:���������@2
l2_normalize/Square�
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
���������2$
"l2_normalize/Sum/reduction_indices�
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+2
l2_normalize/Maximum/y�
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������2
l2_normalize/Maximum}
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������2
l2_normalize/Rsqrtu
l2_normalizeMulinputsl2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������@2
l2_normalized
IdentityIdentityl2_normalize:z:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*&
_input_shapes
:���������@:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�E
�
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_6779
x
x_1
x_2#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource#
shape_5_readvariableop_resource!
add_2_readvariableop_resource
identity��add_2/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOp�transpose_2/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

: *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

: 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2v
Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean_1/reduction_indicesv
Mean_1Meanx_2!Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������2
Mean_1Q
Shape_2ShapeMean_1:output:0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2
Reshape_3/shape~
	Reshape_3ReshapeMean_1:output:0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

: *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

: 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

: 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5C
Shape_4Shapex*
T0*
_output_shapes
:2	
Shape_4b
	unstack_4UnpackShape_4:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_4�
Shape_5/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:o *
dtype02
Shape_5/ReadVariableOpc
Shape_5Const*
_output_shapes
:*
dtype0*
valueB"o       2	
Shape_5`
	unstack_5UnpackShape_5:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_5s
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2
Reshape_6/shapep
	Reshape_6ReshapexReshape_6/shape:output:0*
T0*'
_output_shapes
:���������o2
	Reshape_6�
transpose_2/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:o *
dtype02
transpose_2/ReadVariableOpu
transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_2/perm�
transpose_2	Transpose"transpose_2/ReadVariableOp:value:0transpose_2/perm:output:0*
T0*
_output_shapes

:o 2
transpose_2s
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2
Reshape_7/shapeu
	Reshape_7Reshapetranspose_2:y:0Reshape_7/shape:output:0*
T0*
_output_shapes

:o 2
	Reshape_7x
MatMul_2MatMulReshape_6:output:0Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_2h
Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_8/shape/1h
Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_8/shape/2�
Reshape_8/shapePackunstack_4:output:0Reshape_8/shape/1:output:0Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_8/shape�
	Reshape_8ReshapeMatMul_2:product:0Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_8S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
addj
add_1AddV2add:z:0Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
add_1[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
	truediv/yr
truedivRealDiv	add_1:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_8:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_2/ReadVariableOpReadVariableOpadd_2_readvariableop_resource*
_output_shapes
:@*
dtype02
add_2/ReadVariableOp|
add_2AddV2concat:output:0add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_2U
ReluRelu	add_2:z:0*
T0*+
_output_shapes
:���������@2
Relu�
IdentityIdentityRelu:activations:0^add_2/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp^transpose_2/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������o:���������:���������::::2,
add_2/ReadVariableOpadd_2/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp28
transpose_2/ReadVariableOptranspose_2/ReadVariableOp:N J
+
_output_shapes
:���������o

_user_specified_namex:RN
/
_output_shapes
:���������

_user_specified_namex:RN
/
_output_shapes
:���������

_user_specified_namex
�
a
(__inference_dropout_3_layer_call_fn_8442

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_61132
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0*.
_input_shapes
:��������� o22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�	
�
2__inference_mean_hin_aggregator_layer_call_fn_9064
x_0
x_1
x_2
unknown
	unknown_0
	unknown_1
	unknown_2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallx_0x_1x_2unknown	unknown_0	unknown_1	unknown_2*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_67792
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������o:���������:���������::::22
StatefulPartitionedCallStatefulPartitionedCall:P L
+
_output_shapes
:���������o

_user_specified_namex/0:TP
/
_output_shapes
:���������

_user_specified_namex/1:TP
/
_output_shapes
:���������

_user_specified_namex/2
��
�
__inference__wrapped_model_5959
input_1
input_2
input_3
input_4
input_5A
=model_1_mean_hin_aggregator_2_shape_1_readvariableop_resourceA
=model_1_mean_hin_aggregator_2_shape_3_readvariableop_resource?
;model_1_mean_hin_aggregator_2_add_1_readvariableop_resourceA
=model_1_mean_hin_aggregator_1_shape_1_readvariableop_resourceA
=model_1_mean_hin_aggregator_1_shape_3_readvariableop_resource?
;model_1_mean_hin_aggregator_1_add_1_readvariableop_resource?
;model_1_mean_hin_aggregator_shape_1_readvariableop_resource?
;model_1_mean_hin_aggregator_shape_3_readvariableop_resource?
;model_1_mean_hin_aggregator_shape_5_readvariableop_resource=
9model_1_mean_hin_aggregator_add_2_readvariableop_resourceA
=model_1_mean_hin_aggregator_3_shape_1_readvariableop_resourceA
=model_1_mean_hin_aggregator_3_shape_3_readvariableop_resourceA
=model_1_mean_hin_aggregator_3_shape_5_readvariableop_resource?
;model_1_mean_hin_aggregator_3_add_2_readvariableop_resource
identity��0model_1/mean_hin_aggregator/add_2/ReadVariableOp�4model_1/mean_hin_aggregator/transpose/ReadVariableOp�6model_1/mean_hin_aggregator/transpose_1/ReadVariableOp�6model_1/mean_hin_aggregator/transpose_2/ReadVariableOp�2model_1/mean_hin_aggregator_1/add_1/ReadVariableOp�6model_1/mean_hin_aggregator_1/transpose/ReadVariableOp�8model_1/mean_hin_aggregator_1/transpose_1/ReadVariableOp�2model_1/mean_hin_aggregator_2/add_1/ReadVariableOp�6model_1/mean_hin_aggregator_2/transpose/ReadVariableOp�8model_1/mean_hin_aggregator_2/transpose_1/ReadVariableOp�2model_1/mean_hin_aggregator_3/add_2/ReadVariableOp�6model_1/mean_hin_aggregator_3/transpose/ReadVariableOp�8model_1/mean_hin_aggregator_3/transpose_1/ReadVariableOp�8model_1/mean_hin_aggregator_3/transpose_2/ReadVariableOpi
model_1/reshape_3/ShapeShapeinput_5*
T0*
_output_shapes
:2
model_1/reshape_3/Shape�
%model_1/reshape_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%model_1/reshape_3/strided_slice/stack�
'model_1/reshape_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_3/strided_slice/stack_1�
'model_1/reshape_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_3/strided_slice/stack_2�
model_1/reshape_3/strided_sliceStridedSlice model_1/reshape_3/Shape:output:0.model_1/reshape_3/strided_slice/stack:output:00model_1/reshape_3/strided_slice/stack_1:output:00model_1/reshape_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
model_1/reshape_3/strided_slice�
!model_1/reshape_3/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_3/Reshape/shape/1�
!model_1/reshape_3/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2#
!model_1/reshape_3/Reshape/shape/2�
!model_1/reshape_3/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2#
!model_1/reshape_3/Reshape/shape/3�
model_1/reshape_3/Reshape/shapePack(model_1/reshape_3/strided_slice:output:0*model_1/reshape_3/Reshape/shape/1:output:0*model_1/reshape_3/Reshape/shape/2:output:0*model_1/reshape_3/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2!
model_1/reshape_3/Reshape/shape�
model_1/reshape_3/ReshapeReshapeinput_5(model_1/reshape_3/Reshape/shape:output:0*
T0*/
_output_shapes
:��������� o2
model_1/reshape_3/Reshapei
model_1/reshape_2/ShapeShapeinput_4*
T0*
_output_shapes
:2
model_1/reshape_2/Shape�
%model_1/reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%model_1/reshape_2/strided_slice/stack�
'model_1/reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_2/strided_slice/stack_1�
'model_1/reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_2/strided_slice/stack_2�
model_1/reshape_2/strided_sliceStridedSlice model_1/reshape_2/Shape:output:0.model_1/reshape_2/strided_slice/stack:output:00model_1/reshape_2/strided_slice/stack_1:output:00model_1/reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
model_1/reshape_2/strided_slice�
!model_1/reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_2/Reshape/shape/1�
!model_1/reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2#
!model_1/reshape_2/Reshape/shape/2�
!model_1/reshape_2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2#
!model_1/reshape_2/Reshape/shape/3�
model_1/reshape_2/Reshape/shapePack(model_1/reshape_2/strided_slice:output:0*model_1/reshape_2/Reshape/shape/1:output:0*model_1/reshape_2/Reshape/shape/2:output:0*model_1/reshape_2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2!
model_1/reshape_2/Reshape/shape�
model_1/reshape_2/ReshapeReshapeinput_4(model_1/reshape_2/Reshape/shape:output:0*
T0*/
_output_shapes
:��������� o2
model_1/reshape_2/Reshape�
model_1/dropout_6/IdentityIdentityinput_3*
T0*+
_output_shapes
:���������2
model_1/dropout_6/Identity�
model_1/dropout_5/IdentityIdentity"model_1/reshape_3/Reshape:output:0*
T0*/
_output_shapes
:��������� o2
model_1/dropout_5/Identity�
model_1/dropout_4/IdentityIdentityinput_2*
T0*+
_output_shapes
:���������2
model_1/dropout_4/Identity�
model_1/dropout_3/IdentityIdentity"model_1/reshape_2/Reshape:output:0*
T0*/
_output_shapes
:��������� o2
model_1/dropout_3/Identityi
model_1/reshape_1/ShapeShapeinput_3*
T0*
_output_shapes
:2
model_1/reshape_1/Shape�
%model_1/reshape_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%model_1/reshape_1/strided_slice/stack�
'model_1/reshape_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_1/strided_slice/stack_1�
'model_1/reshape_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_1/strided_slice/stack_2�
model_1/reshape_1/strided_sliceStridedSlice model_1/reshape_1/Shape:output:0.model_1/reshape_1/strided_slice/stack:output:00model_1/reshape_1/strided_slice/stack_1:output:00model_1/reshape_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
model_1/reshape_1/strided_slice�
!model_1/reshape_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_1/Reshape/shape/1�
!model_1/reshape_1/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_1/Reshape/shape/2�
!model_1/reshape_1/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_1/Reshape/shape/3�
model_1/reshape_1/Reshape/shapePack(model_1/reshape_1/strided_slice:output:0*model_1/reshape_1/Reshape/shape/1:output:0*model_1/reshape_1/Reshape/shape/2:output:0*model_1/reshape_1/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2!
model_1/reshape_1/Reshape/shape�
model_1/reshape_1/ReshapeReshapeinput_3(model_1/reshape_1/Reshape/shape:output:0*
T0*/
_output_shapes
:���������2
model_1/reshape_1/Reshapee
model_1/reshape/ShapeShapeinput_2*
T0*
_output_shapes
:2
model_1/reshape/Shape�
#model_1/reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2%
#model_1/reshape/strided_slice/stack�
%model_1/reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%model_1/reshape/strided_slice/stack_1�
%model_1/reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%model_1/reshape/strided_slice/stack_2�
model_1/reshape/strided_sliceStridedSlicemodel_1/reshape/Shape:output:0,model_1/reshape/strided_slice/stack:output:0.model_1/reshape/strided_slice/stack_1:output:0.model_1/reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
model_1/reshape/strided_slice�
model_1/reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2!
model_1/reshape/Reshape/shape/1�
model_1/reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2!
model_1/reshape/Reshape/shape/2�
model_1/reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2!
model_1/reshape/Reshape/shape/3�
model_1/reshape/Reshape/shapePack&model_1/reshape/strided_slice:output:0(model_1/reshape/Reshape/shape/1:output:0(model_1/reshape/Reshape/shape/2:output:0(model_1/reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
model_1/reshape/Reshape/shape�
model_1/reshape/ReshapeReshapeinput_2&model_1/reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:���������2
model_1/reshape/Reshape�
4model_1/mean_hin_aggregator_2/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :26
4model_1/mean_hin_aggregator_2/Mean/reduction_indices�
"model_1/mean_hin_aggregator_2/MeanMean#model_1/dropout_5/Identity:output:0=model_1/mean_hin_aggregator_2/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2$
"model_1/mean_hin_aggregator_2/Mean�
#model_1/mean_hin_aggregator_2/ShapeShape+model_1/mean_hin_aggregator_2/Mean:output:0*
T0*
_output_shapes
:2%
#model_1/mean_hin_aggregator_2/Shape�
%model_1/mean_hin_aggregator_2/unstackUnpack,model_1/mean_hin_aggregator_2/Shape:output:0*
T0*
_output_shapes
: : : *	
num2'
%model_1/mean_hin_aggregator_2/unstack�
4model_1/mean_hin_aggregator_2/Shape_1/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_2_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype026
4model_1/mean_hin_aggregator_2/Shape_1/ReadVariableOp�
%model_1/mean_hin_aggregator_2/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2'
%model_1/mean_hin_aggregator_2/Shape_1�
'model_1/mean_hin_aggregator_2/unstack_1Unpack.model_1/mean_hin_aggregator_2/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2)
'model_1/mean_hin_aggregator_2/unstack_1�
+model_1/mean_hin_aggregator_2/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2-
+model_1/mean_hin_aggregator_2/Reshape/shape�
%model_1/mean_hin_aggregator_2/ReshapeReshape+model_1/mean_hin_aggregator_2/Mean:output:04model_1/mean_hin_aggregator_2/Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2'
%model_1/mean_hin_aggregator_2/Reshape�
6model_1/mean_hin_aggregator_2/transpose/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_2_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype028
6model_1/mean_hin_aggregator_2/transpose/ReadVariableOp�
,model_1/mean_hin_aggregator_2/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2.
,model_1/mean_hin_aggregator_2/transpose/perm�
'model_1/mean_hin_aggregator_2/transpose	Transpose>model_1/mean_hin_aggregator_2/transpose/ReadVariableOp:value:05model_1/mean_hin_aggregator_2/transpose/perm:output:0*
T0*
_output_shapes

:o 2)
'model_1/mean_hin_aggregator_2/transpose�
-model_1/mean_hin_aggregator_2/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2/
-model_1/mean_hin_aggregator_2/Reshape_1/shape�
'model_1/mean_hin_aggregator_2/Reshape_1Reshape+model_1/mean_hin_aggregator_2/transpose:y:06model_1/mean_hin_aggregator_2/Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2)
'model_1/mean_hin_aggregator_2/Reshape_1�
$model_1/mean_hin_aggregator_2/MatMulMatMul.model_1/mean_hin_aggregator_2/Reshape:output:00model_1/mean_hin_aggregator_2/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2&
$model_1/mean_hin_aggregator_2/MatMul�
/model_1/mean_hin_aggregator_2/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :21
/model_1/mean_hin_aggregator_2/Reshape_2/shape/1�
/model_1/mean_hin_aggregator_2/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 21
/model_1/mean_hin_aggregator_2/Reshape_2/shape/2�
-model_1/mean_hin_aggregator_2/Reshape_2/shapePack.model_1/mean_hin_aggregator_2/unstack:output:08model_1/mean_hin_aggregator_2/Reshape_2/shape/1:output:08model_1/mean_hin_aggregator_2/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2/
-model_1/mean_hin_aggregator_2/Reshape_2/shape�
'model_1/mean_hin_aggregator_2/Reshape_2Reshape.model_1/mean_hin_aggregator_2/MatMul:product:06model_1/mean_hin_aggregator_2/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2)
'model_1/mean_hin_aggregator_2/Reshape_2�
%model_1/mean_hin_aggregator_2/Shape_2Shape#model_1/dropout_6/Identity:output:0*
T0*
_output_shapes
:2'
%model_1/mean_hin_aggregator_2/Shape_2�
'model_1/mean_hin_aggregator_2/unstack_2Unpack.model_1/mean_hin_aggregator_2/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2)
'model_1/mean_hin_aggregator_2/unstack_2�
4model_1/mean_hin_aggregator_2/Shape_3/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_2_shape_3_readvariableop_resource*
_output_shapes

: *
dtype026
4model_1/mean_hin_aggregator_2/Shape_3/ReadVariableOp�
%model_1/mean_hin_aggregator_2/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2'
%model_1/mean_hin_aggregator_2/Shape_3�
'model_1/mean_hin_aggregator_2/unstack_3Unpack.model_1/mean_hin_aggregator_2/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2)
'model_1/mean_hin_aggregator_2/unstack_3�
-model_1/mean_hin_aggregator_2/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2/
-model_1/mean_hin_aggregator_2/Reshape_3/shape�
'model_1/mean_hin_aggregator_2/Reshape_3Reshape#model_1/dropout_6/Identity:output:06model_1/mean_hin_aggregator_2/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2)
'model_1/mean_hin_aggregator_2/Reshape_3�
8model_1/mean_hin_aggregator_2/transpose_1/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_2_shape_3_readvariableop_resource*
_output_shapes

: *
dtype02:
8model_1/mean_hin_aggregator_2/transpose_1/ReadVariableOp�
.model_1/mean_hin_aggregator_2/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       20
.model_1/mean_hin_aggregator_2/transpose_1/perm�
)model_1/mean_hin_aggregator_2/transpose_1	Transpose@model_1/mean_hin_aggregator_2/transpose_1/ReadVariableOp:value:07model_1/mean_hin_aggregator_2/transpose_1/perm:output:0*
T0*
_output_shapes

: 2+
)model_1/mean_hin_aggregator_2/transpose_1�
-model_1/mean_hin_aggregator_2/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2/
-model_1/mean_hin_aggregator_2/Reshape_4/shape�
'model_1/mean_hin_aggregator_2/Reshape_4Reshape-model_1/mean_hin_aggregator_2/transpose_1:y:06model_1/mean_hin_aggregator_2/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2)
'model_1/mean_hin_aggregator_2/Reshape_4�
&model_1/mean_hin_aggregator_2/MatMul_1MatMul0model_1/mean_hin_aggregator_2/Reshape_3:output:00model_1/mean_hin_aggregator_2/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2(
&model_1/mean_hin_aggregator_2/MatMul_1�
/model_1/mean_hin_aggregator_2/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :21
/model_1/mean_hin_aggregator_2/Reshape_5/shape/1�
/model_1/mean_hin_aggregator_2/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 21
/model_1/mean_hin_aggregator_2/Reshape_5/shape/2�
-model_1/mean_hin_aggregator_2/Reshape_5/shapePack0model_1/mean_hin_aggregator_2/unstack_2:output:08model_1/mean_hin_aggregator_2/Reshape_5/shape/1:output:08model_1/mean_hin_aggregator_2/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2/
-model_1/mean_hin_aggregator_2/Reshape_5/shape�
'model_1/mean_hin_aggregator_2/Reshape_5Reshape0model_1/mean_hin_aggregator_2/MatMul_1:product:06model_1/mean_hin_aggregator_2/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2)
'model_1/mean_hin_aggregator_2/Reshape_5�
#model_1/mean_hin_aggregator_2/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2%
#model_1/mean_hin_aggregator_2/add/x�
!model_1/mean_hin_aggregator_2/addAddV2,model_1/mean_hin_aggregator_2/add/x:output:00model_1/mean_hin_aggregator_2/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2#
!model_1/mean_hin_aggregator_2/add�
'model_1/mean_hin_aggregator_2/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2)
'model_1/mean_hin_aggregator_2/truediv/y�
%model_1/mean_hin_aggregator_2/truedivRealDiv%model_1/mean_hin_aggregator_2/add:z:00model_1/mean_hin_aggregator_2/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2'
%model_1/mean_hin_aggregator_2/truediv�
)model_1/mean_hin_aggregator_2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2+
)model_1/mean_hin_aggregator_2/concat/axis�
$model_1/mean_hin_aggregator_2/concatConcatV20model_1/mean_hin_aggregator_2/Reshape_5:output:0)model_1/mean_hin_aggregator_2/truediv:z:02model_1/mean_hin_aggregator_2/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2&
$model_1/mean_hin_aggregator_2/concat�
2model_1/mean_hin_aggregator_2/add_1/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_2_add_1_readvariableop_resource*
_output_shapes
:@*
dtype024
2model_1/mean_hin_aggregator_2/add_1/ReadVariableOp�
#model_1/mean_hin_aggregator_2/add_1AddV2-model_1/mean_hin_aggregator_2/concat:output:0:model_1/mean_hin_aggregator_2/add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2%
#model_1/mean_hin_aggregator_2/add_1�
"model_1/mean_hin_aggregator_2/ReluRelu'model_1/mean_hin_aggregator_2/add_1:z:0*
T0*+
_output_shapes
:���������@2$
"model_1/mean_hin_aggregator_2/Relu�
4model_1/mean_hin_aggregator_1/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :26
4model_1/mean_hin_aggregator_1/Mean/reduction_indices�
"model_1/mean_hin_aggregator_1/MeanMean#model_1/dropout_3/Identity:output:0=model_1/mean_hin_aggregator_1/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������o2$
"model_1/mean_hin_aggregator_1/Mean�
#model_1/mean_hin_aggregator_1/ShapeShape+model_1/mean_hin_aggregator_1/Mean:output:0*
T0*
_output_shapes
:2%
#model_1/mean_hin_aggregator_1/Shape�
%model_1/mean_hin_aggregator_1/unstackUnpack,model_1/mean_hin_aggregator_1/Shape:output:0*
T0*
_output_shapes
: : : *	
num2'
%model_1/mean_hin_aggregator_1/unstack�
4model_1/mean_hin_aggregator_1/Shape_1/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_1_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype026
4model_1/mean_hin_aggregator_1/Shape_1/ReadVariableOp�
%model_1/mean_hin_aggregator_1/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"o       2'
%model_1/mean_hin_aggregator_1/Shape_1�
'model_1/mean_hin_aggregator_1/unstack_1Unpack.model_1/mean_hin_aggregator_1/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2)
'model_1/mean_hin_aggregator_1/unstack_1�
+model_1/mean_hin_aggregator_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2-
+model_1/mean_hin_aggregator_1/Reshape/shape�
%model_1/mean_hin_aggregator_1/ReshapeReshape+model_1/mean_hin_aggregator_1/Mean:output:04model_1/mean_hin_aggregator_1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������o2'
%model_1/mean_hin_aggregator_1/Reshape�
6model_1/mean_hin_aggregator_1/transpose/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_1_shape_1_readvariableop_resource*
_output_shapes

:o *
dtype028
6model_1/mean_hin_aggregator_1/transpose/ReadVariableOp�
,model_1/mean_hin_aggregator_1/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2.
,model_1/mean_hin_aggregator_1/transpose/perm�
'model_1/mean_hin_aggregator_1/transpose	Transpose>model_1/mean_hin_aggregator_1/transpose/ReadVariableOp:value:05model_1/mean_hin_aggregator_1/transpose/perm:output:0*
T0*
_output_shapes

:o 2)
'model_1/mean_hin_aggregator_1/transpose�
-model_1/mean_hin_aggregator_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2/
-model_1/mean_hin_aggregator_1/Reshape_1/shape�
'model_1/mean_hin_aggregator_1/Reshape_1Reshape+model_1/mean_hin_aggregator_1/transpose:y:06model_1/mean_hin_aggregator_1/Reshape_1/shape:output:0*
T0*
_output_shapes

:o 2)
'model_1/mean_hin_aggregator_1/Reshape_1�
$model_1/mean_hin_aggregator_1/MatMulMatMul.model_1/mean_hin_aggregator_1/Reshape:output:00model_1/mean_hin_aggregator_1/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2&
$model_1/mean_hin_aggregator_1/MatMul�
/model_1/mean_hin_aggregator_1/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :21
/model_1/mean_hin_aggregator_1/Reshape_2/shape/1�
/model_1/mean_hin_aggregator_1/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 21
/model_1/mean_hin_aggregator_1/Reshape_2/shape/2�
-model_1/mean_hin_aggregator_1/Reshape_2/shapePack.model_1/mean_hin_aggregator_1/unstack:output:08model_1/mean_hin_aggregator_1/Reshape_2/shape/1:output:08model_1/mean_hin_aggregator_1/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2/
-model_1/mean_hin_aggregator_1/Reshape_2/shape�
'model_1/mean_hin_aggregator_1/Reshape_2Reshape.model_1/mean_hin_aggregator_1/MatMul:product:06model_1/mean_hin_aggregator_1/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2)
'model_1/mean_hin_aggregator_1/Reshape_2�
%model_1/mean_hin_aggregator_1/Shape_2Shape#model_1/dropout_4/Identity:output:0*
T0*
_output_shapes
:2'
%model_1/mean_hin_aggregator_1/Shape_2�
'model_1/mean_hin_aggregator_1/unstack_2Unpack.model_1/mean_hin_aggregator_1/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2)
'model_1/mean_hin_aggregator_1/unstack_2�
4model_1/mean_hin_aggregator_1/Shape_3/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_1_shape_3_readvariableop_resource*
_output_shapes

: *
dtype026
4model_1/mean_hin_aggregator_1/Shape_3/ReadVariableOp�
%model_1/mean_hin_aggregator_1/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2'
%model_1/mean_hin_aggregator_1/Shape_3�
'model_1/mean_hin_aggregator_1/unstack_3Unpack.model_1/mean_hin_aggregator_1/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2)
'model_1/mean_hin_aggregator_1/unstack_3�
-model_1/mean_hin_aggregator_1/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2/
-model_1/mean_hin_aggregator_1/Reshape_3/shape�
'model_1/mean_hin_aggregator_1/Reshape_3Reshape#model_1/dropout_4/Identity:output:06model_1/mean_hin_aggregator_1/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2)
'model_1/mean_hin_aggregator_1/Reshape_3�
8model_1/mean_hin_aggregator_1/transpose_1/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_1_shape_3_readvariableop_resource*
_output_shapes

: *
dtype02:
8model_1/mean_hin_aggregator_1/transpose_1/ReadVariableOp�
.model_1/mean_hin_aggregator_1/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       20
.model_1/mean_hin_aggregator_1/transpose_1/perm�
)model_1/mean_hin_aggregator_1/transpose_1	Transpose@model_1/mean_hin_aggregator_1/transpose_1/ReadVariableOp:value:07model_1/mean_hin_aggregator_1/transpose_1/perm:output:0*
T0*
_output_shapes

: 2+
)model_1/mean_hin_aggregator_1/transpose_1�
-model_1/mean_hin_aggregator_1/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2/
-model_1/mean_hin_aggregator_1/Reshape_4/shape�
'model_1/mean_hin_aggregator_1/Reshape_4Reshape-model_1/mean_hin_aggregator_1/transpose_1:y:06model_1/mean_hin_aggregator_1/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2)
'model_1/mean_hin_aggregator_1/Reshape_4�
&model_1/mean_hin_aggregator_1/MatMul_1MatMul0model_1/mean_hin_aggregator_1/Reshape_3:output:00model_1/mean_hin_aggregator_1/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2(
&model_1/mean_hin_aggregator_1/MatMul_1�
/model_1/mean_hin_aggregator_1/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :21
/model_1/mean_hin_aggregator_1/Reshape_5/shape/1�
/model_1/mean_hin_aggregator_1/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 21
/model_1/mean_hin_aggregator_1/Reshape_5/shape/2�
-model_1/mean_hin_aggregator_1/Reshape_5/shapePack0model_1/mean_hin_aggregator_1/unstack_2:output:08model_1/mean_hin_aggregator_1/Reshape_5/shape/1:output:08model_1/mean_hin_aggregator_1/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2/
-model_1/mean_hin_aggregator_1/Reshape_5/shape�
'model_1/mean_hin_aggregator_1/Reshape_5Reshape0model_1/mean_hin_aggregator_1/MatMul_1:product:06model_1/mean_hin_aggregator_1/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2)
'model_1/mean_hin_aggregator_1/Reshape_5�
#model_1/mean_hin_aggregator_1/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2%
#model_1/mean_hin_aggregator_1/add/x�
!model_1/mean_hin_aggregator_1/addAddV2,model_1/mean_hin_aggregator_1/add/x:output:00model_1/mean_hin_aggregator_1/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2#
!model_1/mean_hin_aggregator_1/add�
'model_1/mean_hin_aggregator_1/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2)
'model_1/mean_hin_aggregator_1/truediv/y�
%model_1/mean_hin_aggregator_1/truedivRealDiv%model_1/mean_hin_aggregator_1/add:z:00model_1/mean_hin_aggregator_1/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2'
%model_1/mean_hin_aggregator_1/truediv�
)model_1/mean_hin_aggregator_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2+
)model_1/mean_hin_aggregator_1/concat/axis�
$model_1/mean_hin_aggregator_1/concatConcatV20model_1/mean_hin_aggregator_1/Reshape_5:output:0)model_1/mean_hin_aggregator_1/truediv:z:02model_1/mean_hin_aggregator_1/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2&
$model_1/mean_hin_aggregator_1/concat�
2model_1/mean_hin_aggregator_1/add_1/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_1_add_1_readvariableop_resource*
_output_shapes
:@*
dtype024
2model_1/mean_hin_aggregator_1/add_1/ReadVariableOp�
#model_1/mean_hin_aggregator_1/add_1AddV2-model_1/mean_hin_aggregator_1/concat:output:0:model_1/mean_hin_aggregator_1/add_1/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2%
#model_1/mean_hin_aggregator_1/add_1�
"model_1/mean_hin_aggregator_1/ReluRelu'model_1/mean_hin_aggregator_1/add_1:z:0*
T0*+
_output_shapes
:���������@2$
"model_1/mean_hin_aggregator_1/Relu�
model_1/dropout_2/IdentityIdentityinput_1*
T0*+
_output_shapes
:���������o2
model_1/dropout_2/Identity�
model_1/dropout/IdentityIdentity model_1/reshape/Reshape:output:0*
T0*/
_output_shapes
:���������2
model_1/dropout/Identity�
model_1/dropout_1/IdentityIdentity"model_1/reshape_1/Reshape:output:0*
T0*/
_output_shapes
:���������2
model_1/dropout_1/Identity�
model_1/reshape_5/ShapeShape0model_1/mean_hin_aggregator_2/Relu:activations:0*
T0*
_output_shapes
:2
model_1/reshape_5/Shape�
%model_1/reshape_5/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%model_1/reshape_5/strided_slice/stack�
'model_1/reshape_5/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_5/strided_slice/stack_1�
'model_1/reshape_5/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_5/strided_slice/stack_2�
model_1/reshape_5/strided_sliceStridedSlice model_1/reshape_5/Shape:output:0.model_1/reshape_5/strided_slice/stack:output:00model_1/reshape_5/strided_slice/stack_1:output:00model_1/reshape_5/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
model_1/reshape_5/strided_slice�
!model_1/reshape_5/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_5/Reshape/shape/1�
!model_1/reshape_5/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_5/Reshape/shape/2�
!model_1/reshape_5/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2#
!model_1/reshape_5/Reshape/shape/3�
model_1/reshape_5/Reshape/shapePack(model_1/reshape_5/strided_slice:output:0*model_1/reshape_5/Reshape/shape/1:output:0*model_1/reshape_5/Reshape/shape/2:output:0*model_1/reshape_5/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2!
model_1/reshape_5/Reshape/shape�
model_1/reshape_5/ReshapeReshape0model_1/mean_hin_aggregator_2/Relu:activations:0(model_1/reshape_5/Reshape/shape:output:0*
T0*/
_output_shapes
:���������@2
model_1/reshape_5/Reshape�
model_1/reshape_4/ShapeShape0model_1/mean_hin_aggregator_1/Relu:activations:0*
T0*
_output_shapes
:2
model_1/reshape_4/Shape�
%model_1/reshape_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%model_1/reshape_4/strided_slice/stack�
'model_1/reshape_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_4/strided_slice/stack_1�
'model_1/reshape_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_4/strided_slice/stack_2�
model_1/reshape_4/strided_sliceStridedSlice model_1/reshape_4/Shape:output:0.model_1/reshape_4/strided_slice/stack:output:00model_1/reshape_4/strided_slice/stack_1:output:00model_1/reshape_4/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
model_1/reshape_4/strided_slice�
!model_1/reshape_4/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_4/Reshape/shape/1�
!model_1/reshape_4/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/reshape_4/Reshape/shape/2�
!model_1/reshape_4/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2#
!model_1/reshape_4/Reshape/shape/3�
model_1/reshape_4/Reshape/shapePack(model_1/reshape_4/strided_slice:output:0*model_1/reshape_4/Reshape/shape/1:output:0*model_1/reshape_4/Reshape/shape/2:output:0*model_1/reshape_4/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2!
model_1/reshape_4/Reshape/shape�
model_1/reshape_4/ReshapeReshape0model_1/mean_hin_aggregator_1/Relu:activations:0(model_1/reshape_4/Reshape/shape:output:0*
T0*/
_output_shapes
:���������@2
model_1/reshape_4/Reshape�
2model_1/mean_hin_aggregator/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :24
2model_1/mean_hin_aggregator/Mean/reduction_indices�
 model_1/mean_hin_aggregator/MeanMean!model_1/dropout/Identity:output:0;model_1/mean_hin_aggregator/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������2"
 model_1/mean_hin_aggregator/Mean�
!model_1/mean_hin_aggregator/ShapeShape)model_1/mean_hin_aggregator/Mean:output:0*
T0*
_output_shapes
:2#
!model_1/mean_hin_aggregator/Shape�
#model_1/mean_hin_aggregator/unstackUnpack*model_1/mean_hin_aggregator/Shape:output:0*
T0*
_output_shapes
: : : *	
num2%
#model_1/mean_hin_aggregator/unstack�
2model_1/mean_hin_aggregator/Shape_1/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_shape_1_readvariableop_resource*
_output_shapes

: *
dtype024
2model_1/mean_hin_aggregator/Shape_1/ReadVariableOp�
#model_1/mean_hin_aggregator/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"       2%
#model_1/mean_hin_aggregator/Shape_1�
%model_1/mean_hin_aggregator/unstack_1Unpack,model_1/mean_hin_aggregator/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2'
%model_1/mean_hin_aggregator/unstack_1�
)model_1/mean_hin_aggregator/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2+
)model_1/mean_hin_aggregator/Reshape/shape�
#model_1/mean_hin_aggregator/ReshapeReshape)model_1/mean_hin_aggregator/Mean:output:02model_1/mean_hin_aggregator/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2%
#model_1/mean_hin_aggregator/Reshape�
4model_1/mean_hin_aggregator/transpose/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_shape_1_readvariableop_resource*
_output_shapes

: *
dtype026
4model_1/mean_hin_aggregator/transpose/ReadVariableOp�
*model_1/mean_hin_aggregator/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2,
*model_1/mean_hin_aggregator/transpose/perm�
%model_1/mean_hin_aggregator/transpose	Transpose<model_1/mean_hin_aggregator/transpose/ReadVariableOp:value:03model_1/mean_hin_aggregator/transpose/perm:output:0*
T0*
_output_shapes

: 2'
%model_1/mean_hin_aggregator/transpose�
+model_1/mean_hin_aggregator/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2-
+model_1/mean_hin_aggregator/Reshape_1/shape�
%model_1/mean_hin_aggregator/Reshape_1Reshape)model_1/mean_hin_aggregator/transpose:y:04model_1/mean_hin_aggregator/Reshape_1/shape:output:0*
T0*
_output_shapes

: 2'
%model_1/mean_hin_aggregator/Reshape_1�
"model_1/mean_hin_aggregator/MatMulMatMul,model_1/mean_hin_aggregator/Reshape:output:0.model_1/mean_hin_aggregator/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2$
"model_1/mean_hin_aggregator/MatMul�
-model_1/mean_hin_aggregator/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2/
-model_1/mean_hin_aggregator/Reshape_2/shape/1�
-model_1/mean_hin_aggregator/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2/
-model_1/mean_hin_aggregator/Reshape_2/shape/2�
+model_1/mean_hin_aggregator/Reshape_2/shapePack,model_1/mean_hin_aggregator/unstack:output:06model_1/mean_hin_aggregator/Reshape_2/shape/1:output:06model_1/mean_hin_aggregator/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2-
+model_1/mean_hin_aggregator/Reshape_2/shape�
%model_1/mean_hin_aggregator/Reshape_2Reshape,model_1/mean_hin_aggregator/MatMul:product:04model_1/mean_hin_aggregator/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2'
%model_1/mean_hin_aggregator/Reshape_2�
4model_1/mean_hin_aggregator/Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :26
4model_1/mean_hin_aggregator/Mean_1/reduction_indices�
"model_1/mean_hin_aggregator/Mean_1Mean#model_1/dropout_1/Identity:output:0=model_1/mean_hin_aggregator/Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������2$
"model_1/mean_hin_aggregator/Mean_1�
#model_1/mean_hin_aggregator/Shape_2Shape+model_1/mean_hin_aggregator/Mean_1:output:0*
T0*
_output_shapes
:2%
#model_1/mean_hin_aggregator/Shape_2�
%model_1/mean_hin_aggregator/unstack_2Unpack,model_1/mean_hin_aggregator/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2'
%model_1/mean_hin_aggregator/unstack_2�
2model_1/mean_hin_aggregator/Shape_3/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_shape_3_readvariableop_resource*
_output_shapes

: *
dtype024
2model_1/mean_hin_aggregator/Shape_3/ReadVariableOp�
#model_1/mean_hin_aggregator/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"       2%
#model_1/mean_hin_aggregator/Shape_3�
%model_1/mean_hin_aggregator/unstack_3Unpack,model_1/mean_hin_aggregator/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2'
%model_1/mean_hin_aggregator/unstack_3�
+model_1/mean_hin_aggregator/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   2-
+model_1/mean_hin_aggregator/Reshape_3/shape�
%model_1/mean_hin_aggregator/Reshape_3Reshape+model_1/mean_hin_aggregator/Mean_1:output:04model_1/mean_hin_aggregator/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������2'
%model_1/mean_hin_aggregator/Reshape_3�
6model_1/mean_hin_aggregator/transpose_1/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_shape_3_readvariableop_resource*
_output_shapes

: *
dtype028
6model_1/mean_hin_aggregator/transpose_1/ReadVariableOp�
,model_1/mean_hin_aggregator/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2.
,model_1/mean_hin_aggregator/transpose_1/perm�
'model_1/mean_hin_aggregator/transpose_1	Transpose>model_1/mean_hin_aggregator/transpose_1/ReadVariableOp:value:05model_1/mean_hin_aggregator/transpose_1/perm:output:0*
T0*
_output_shapes

: 2)
'model_1/mean_hin_aggregator/transpose_1�
+model_1/mean_hin_aggregator/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"   ����2-
+model_1/mean_hin_aggregator/Reshape_4/shape�
%model_1/mean_hin_aggregator/Reshape_4Reshape+model_1/mean_hin_aggregator/transpose_1:y:04model_1/mean_hin_aggregator/Reshape_4/shape:output:0*
T0*
_output_shapes

: 2'
%model_1/mean_hin_aggregator/Reshape_4�
$model_1/mean_hin_aggregator/MatMul_1MatMul.model_1/mean_hin_aggregator/Reshape_3:output:0.model_1/mean_hin_aggregator/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2&
$model_1/mean_hin_aggregator/MatMul_1�
-model_1/mean_hin_aggregator/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2/
-model_1/mean_hin_aggregator/Reshape_5/shape/1�
-model_1/mean_hin_aggregator/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2/
-model_1/mean_hin_aggregator/Reshape_5/shape/2�
+model_1/mean_hin_aggregator/Reshape_5/shapePack.model_1/mean_hin_aggregator/unstack_2:output:06model_1/mean_hin_aggregator/Reshape_5/shape/1:output:06model_1/mean_hin_aggregator/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2-
+model_1/mean_hin_aggregator/Reshape_5/shape�
%model_1/mean_hin_aggregator/Reshape_5Reshape.model_1/mean_hin_aggregator/MatMul_1:product:04model_1/mean_hin_aggregator/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2'
%model_1/mean_hin_aggregator/Reshape_5�
#model_1/mean_hin_aggregator/Shape_4Shape#model_1/dropout_2/Identity:output:0*
T0*
_output_shapes
:2%
#model_1/mean_hin_aggregator/Shape_4�
%model_1/mean_hin_aggregator/unstack_4Unpack,model_1/mean_hin_aggregator/Shape_4:output:0*
T0*
_output_shapes
: : : *	
num2'
%model_1/mean_hin_aggregator/unstack_4�
2model_1/mean_hin_aggregator/Shape_5/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_shape_5_readvariableop_resource*
_output_shapes

:o *
dtype024
2model_1/mean_hin_aggregator/Shape_5/ReadVariableOp�
#model_1/mean_hin_aggregator/Shape_5Const*
_output_shapes
:*
dtype0*
valueB"o       2%
#model_1/mean_hin_aggregator/Shape_5�
%model_1/mean_hin_aggregator/unstack_5Unpack,model_1/mean_hin_aggregator/Shape_5:output:0*
T0*
_output_shapes
: : *	
num2'
%model_1/mean_hin_aggregator/unstack_5�
+model_1/mean_hin_aggregator/Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����o   2-
+model_1/mean_hin_aggregator/Reshape_6/shape�
%model_1/mean_hin_aggregator/Reshape_6Reshape#model_1/dropout_2/Identity:output:04model_1/mean_hin_aggregator/Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������o2'
%model_1/mean_hin_aggregator/Reshape_6�
6model_1/mean_hin_aggregator/transpose_2/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_shape_5_readvariableop_resource*
_output_shapes

:o *
dtype028
6model_1/mean_hin_aggregator/transpose_2/ReadVariableOp�
,model_1/mean_hin_aggregator/transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2.
,model_1/mean_hin_aggregator/transpose_2/perm�
'model_1/mean_hin_aggregator/transpose_2	Transpose>model_1/mean_hin_aggregator/transpose_2/ReadVariableOp:value:05model_1/mean_hin_aggregator/transpose_2/perm:output:0*
T0*
_output_shapes

:o 2)
'model_1/mean_hin_aggregator/transpose_2�
+model_1/mean_hin_aggregator/Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"o   ����2-
+model_1/mean_hin_aggregator/Reshape_7/shape�
%model_1/mean_hin_aggregator/Reshape_7Reshape+model_1/mean_hin_aggregator/transpose_2:y:04model_1/mean_hin_aggregator/Reshape_7/shape:output:0*
T0*
_output_shapes

:o 2'
%model_1/mean_hin_aggregator/Reshape_7�
$model_1/mean_hin_aggregator/MatMul_2MatMul.model_1/mean_hin_aggregator/Reshape_6:output:0.model_1/mean_hin_aggregator/Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2&
$model_1/mean_hin_aggregator/MatMul_2�
-model_1/mean_hin_aggregator/Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2/
-model_1/mean_hin_aggregator/Reshape_8/shape/1�
-model_1/mean_hin_aggregator/Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2/
-model_1/mean_hin_aggregator/Reshape_8/shape/2�
+model_1/mean_hin_aggregator/Reshape_8/shapePack.model_1/mean_hin_aggregator/unstack_4:output:06model_1/mean_hin_aggregator/Reshape_8/shape/1:output:06model_1/mean_hin_aggregator/Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2-
+model_1/mean_hin_aggregator/Reshape_8/shape�
%model_1/mean_hin_aggregator/Reshape_8Reshape.model_1/mean_hin_aggregator/MatMul_2:product:04model_1/mean_hin_aggregator/Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2'
%model_1/mean_hin_aggregator/Reshape_8�
!model_1/mean_hin_aggregator/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2#
!model_1/mean_hin_aggregator/add/x�
model_1/mean_hin_aggregator/addAddV2*model_1/mean_hin_aggregator/add/x:output:0.model_1/mean_hin_aggregator/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2!
model_1/mean_hin_aggregator/add�
!model_1/mean_hin_aggregator/add_1AddV2#model_1/mean_hin_aggregator/add:z:0.model_1/mean_hin_aggregator/Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2#
!model_1/mean_hin_aggregator/add_1�
%model_1/mean_hin_aggregator/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2'
%model_1/mean_hin_aggregator/truediv/y�
#model_1/mean_hin_aggregator/truedivRealDiv%model_1/mean_hin_aggregator/add_1:z:0.model_1/mean_hin_aggregator/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2%
#model_1/mean_hin_aggregator/truediv�
'model_1/mean_hin_aggregator/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2)
'model_1/mean_hin_aggregator/concat/axis�
"model_1/mean_hin_aggregator/concatConcatV2.model_1/mean_hin_aggregator/Reshape_8:output:0'model_1/mean_hin_aggregator/truediv:z:00model_1/mean_hin_aggregator/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2$
"model_1/mean_hin_aggregator/concat�
0model_1/mean_hin_aggregator/add_2/ReadVariableOpReadVariableOp9model_1_mean_hin_aggregator_add_2_readvariableop_resource*
_output_shapes
:@*
dtype022
0model_1/mean_hin_aggregator/add_2/ReadVariableOp�
!model_1/mean_hin_aggregator/add_2AddV2+model_1/mean_hin_aggregator/concat:output:08model_1/mean_hin_aggregator/add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2#
!model_1/mean_hin_aggregator/add_2�
 model_1/mean_hin_aggregator/ReluRelu%model_1/mean_hin_aggregator/add_2:z:0*
T0*+
_output_shapes
:���������@2"
 model_1/mean_hin_aggregator/Relu�
model_1/dropout_9/IdentityIdentity.model_1/mean_hin_aggregator/Relu:activations:0*
T0*+
_output_shapes
:���������@2
model_1/dropout_9/Identity�
model_1/dropout_7/IdentityIdentity"model_1/reshape_4/Reshape:output:0*
T0*/
_output_shapes
:���������@2
model_1/dropout_7/Identity�
model_1/dropout_8/IdentityIdentity"model_1/reshape_5/Reshape:output:0*
T0*/
_output_shapes
:���������@2
model_1/dropout_8/Identity�
4model_1/mean_hin_aggregator_3/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :26
4model_1/mean_hin_aggregator_3/Mean/reduction_indices�
"model_1/mean_hin_aggregator_3/MeanMean#model_1/dropout_7/Identity:output:0=model_1/mean_hin_aggregator_3/Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2$
"model_1/mean_hin_aggregator_3/Mean�
#model_1/mean_hin_aggregator_3/ShapeShape+model_1/mean_hin_aggregator_3/Mean:output:0*
T0*
_output_shapes
:2%
#model_1/mean_hin_aggregator_3/Shape�
%model_1/mean_hin_aggregator_3/unstackUnpack,model_1/mean_hin_aggregator_3/Shape:output:0*
T0*
_output_shapes
: : : *	
num2'
%model_1/mean_hin_aggregator_3/unstack�
4model_1/mean_hin_aggregator_3/Shape_1/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_3_shape_1_readvariableop_resource*
_output_shapes

:@ *
dtype026
4model_1/mean_hin_aggregator_3/Shape_1/ReadVariableOp�
%model_1/mean_hin_aggregator_3/Shape_1Const*
_output_shapes
:*
dtype0*
valueB"@       2'
%model_1/mean_hin_aggregator_3/Shape_1�
'model_1/mean_hin_aggregator_3/unstack_1Unpack.model_1/mean_hin_aggregator_3/Shape_1:output:0*
T0*
_output_shapes
: : *	
num2)
'model_1/mean_hin_aggregator_3/unstack_1�
+model_1/mean_hin_aggregator_3/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2-
+model_1/mean_hin_aggregator_3/Reshape/shape�
%model_1/mean_hin_aggregator_3/ReshapeReshape+model_1/mean_hin_aggregator_3/Mean:output:04model_1/mean_hin_aggregator_3/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2'
%model_1/mean_hin_aggregator_3/Reshape�
6model_1/mean_hin_aggregator_3/transpose/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_3_shape_1_readvariableop_resource*
_output_shapes

:@ *
dtype028
6model_1/mean_hin_aggregator_3/transpose/ReadVariableOp�
,model_1/mean_hin_aggregator_3/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2.
,model_1/mean_hin_aggregator_3/transpose/perm�
'model_1/mean_hin_aggregator_3/transpose	Transpose>model_1/mean_hin_aggregator_3/transpose/ReadVariableOp:value:05model_1/mean_hin_aggregator_3/transpose/perm:output:0*
T0*
_output_shapes

:@ 2)
'model_1/mean_hin_aggregator_3/transpose�
-model_1/mean_hin_aggregator_3/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2/
-model_1/mean_hin_aggregator_3/Reshape_1/shape�
'model_1/mean_hin_aggregator_3/Reshape_1Reshape+model_1/mean_hin_aggregator_3/transpose:y:06model_1/mean_hin_aggregator_3/Reshape_1/shape:output:0*
T0*
_output_shapes

:@ 2)
'model_1/mean_hin_aggregator_3/Reshape_1�
$model_1/mean_hin_aggregator_3/MatMulMatMul.model_1/mean_hin_aggregator_3/Reshape:output:00model_1/mean_hin_aggregator_3/Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2&
$model_1/mean_hin_aggregator_3/MatMul�
/model_1/mean_hin_aggregator_3/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :21
/model_1/mean_hin_aggregator_3/Reshape_2/shape/1�
/model_1/mean_hin_aggregator_3/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 21
/model_1/mean_hin_aggregator_3/Reshape_2/shape/2�
-model_1/mean_hin_aggregator_3/Reshape_2/shapePack.model_1/mean_hin_aggregator_3/unstack:output:08model_1/mean_hin_aggregator_3/Reshape_2/shape/1:output:08model_1/mean_hin_aggregator_3/Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2/
-model_1/mean_hin_aggregator_3/Reshape_2/shape�
'model_1/mean_hin_aggregator_3/Reshape_2Reshape.model_1/mean_hin_aggregator_3/MatMul:product:06model_1/mean_hin_aggregator_3/Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2)
'model_1/mean_hin_aggregator_3/Reshape_2�
6model_1/mean_hin_aggregator_3/Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :28
6model_1/mean_hin_aggregator_3/Mean_1/reduction_indices�
$model_1/mean_hin_aggregator_3/Mean_1Mean#model_1/dropout_8/Identity:output:0?model_1/mean_hin_aggregator_3/Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2&
$model_1/mean_hin_aggregator_3/Mean_1�
%model_1/mean_hin_aggregator_3/Shape_2Shape-model_1/mean_hin_aggregator_3/Mean_1:output:0*
T0*
_output_shapes
:2'
%model_1/mean_hin_aggregator_3/Shape_2�
'model_1/mean_hin_aggregator_3/unstack_2Unpack.model_1/mean_hin_aggregator_3/Shape_2:output:0*
T0*
_output_shapes
: : : *	
num2)
'model_1/mean_hin_aggregator_3/unstack_2�
4model_1/mean_hin_aggregator_3/Shape_3/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_3_shape_3_readvariableop_resource*
_output_shapes

:@ *
dtype026
4model_1/mean_hin_aggregator_3/Shape_3/ReadVariableOp�
%model_1/mean_hin_aggregator_3/Shape_3Const*
_output_shapes
:*
dtype0*
valueB"@       2'
%model_1/mean_hin_aggregator_3/Shape_3�
'model_1/mean_hin_aggregator_3/unstack_3Unpack.model_1/mean_hin_aggregator_3/Shape_3:output:0*
T0*
_output_shapes
: : *	
num2)
'model_1/mean_hin_aggregator_3/unstack_3�
-model_1/mean_hin_aggregator_3/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2/
-model_1/mean_hin_aggregator_3/Reshape_3/shape�
'model_1/mean_hin_aggregator_3/Reshape_3Reshape-model_1/mean_hin_aggregator_3/Mean_1:output:06model_1/mean_hin_aggregator_3/Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������@2)
'model_1/mean_hin_aggregator_3/Reshape_3�
8model_1/mean_hin_aggregator_3/transpose_1/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_3_shape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02:
8model_1/mean_hin_aggregator_3/transpose_1/ReadVariableOp�
.model_1/mean_hin_aggregator_3/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       20
.model_1/mean_hin_aggregator_3/transpose_1/perm�
)model_1/mean_hin_aggregator_3/transpose_1	Transpose@model_1/mean_hin_aggregator_3/transpose_1/ReadVariableOp:value:07model_1/mean_hin_aggregator_3/transpose_1/perm:output:0*
T0*
_output_shapes

:@ 2+
)model_1/mean_hin_aggregator_3/transpose_1�
-model_1/mean_hin_aggregator_3/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2/
-model_1/mean_hin_aggregator_3/Reshape_4/shape�
'model_1/mean_hin_aggregator_3/Reshape_4Reshape-model_1/mean_hin_aggregator_3/transpose_1:y:06model_1/mean_hin_aggregator_3/Reshape_4/shape:output:0*
T0*
_output_shapes

:@ 2)
'model_1/mean_hin_aggregator_3/Reshape_4�
&model_1/mean_hin_aggregator_3/MatMul_1MatMul0model_1/mean_hin_aggregator_3/Reshape_3:output:00model_1/mean_hin_aggregator_3/Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2(
&model_1/mean_hin_aggregator_3/MatMul_1�
/model_1/mean_hin_aggregator_3/Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :21
/model_1/mean_hin_aggregator_3/Reshape_5/shape/1�
/model_1/mean_hin_aggregator_3/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 21
/model_1/mean_hin_aggregator_3/Reshape_5/shape/2�
-model_1/mean_hin_aggregator_3/Reshape_5/shapePack0model_1/mean_hin_aggregator_3/unstack_2:output:08model_1/mean_hin_aggregator_3/Reshape_5/shape/1:output:08model_1/mean_hin_aggregator_3/Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2/
-model_1/mean_hin_aggregator_3/Reshape_5/shape�
'model_1/mean_hin_aggregator_3/Reshape_5Reshape0model_1/mean_hin_aggregator_3/MatMul_1:product:06model_1/mean_hin_aggregator_3/Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2)
'model_1/mean_hin_aggregator_3/Reshape_5�
%model_1/mean_hin_aggregator_3/Shape_4Shape#model_1/dropout_9/Identity:output:0*
T0*
_output_shapes
:2'
%model_1/mean_hin_aggregator_3/Shape_4�
'model_1/mean_hin_aggregator_3/unstack_4Unpack.model_1/mean_hin_aggregator_3/Shape_4:output:0*
T0*
_output_shapes
: : : *	
num2)
'model_1/mean_hin_aggregator_3/unstack_4�
4model_1/mean_hin_aggregator_3/Shape_5/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_3_shape_5_readvariableop_resource*
_output_shapes

:@ *
dtype026
4model_1/mean_hin_aggregator_3/Shape_5/ReadVariableOp�
%model_1/mean_hin_aggregator_3/Shape_5Const*
_output_shapes
:*
dtype0*
valueB"@       2'
%model_1/mean_hin_aggregator_3/Shape_5�
'model_1/mean_hin_aggregator_3/unstack_5Unpack.model_1/mean_hin_aggregator_3/Shape_5:output:0*
T0*
_output_shapes
: : *	
num2)
'model_1/mean_hin_aggregator_3/unstack_5�
-model_1/mean_hin_aggregator_3/Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2/
-model_1/mean_hin_aggregator_3/Reshape_6/shape�
'model_1/mean_hin_aggregator_3/Reshape_6Reshape#model_1/dropout_9/Identity:output:06model_1/mean_hin_aggregator_3/Reshape_6/shape:output:0*
T0*'
_output_shapes
:���������@2)
'model_1/mean_hin_aggregator_3/Reshape_6�
8model_1/mean_hin_aggregator_3/transpose_2/ReadVariableOpReadVariableOp=model_1_mean_hin_aggregator_3_shape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02:
8model_1/mean_hin_aggregator_3/transpose_2/ReadVariableOp�
.model_1/mean_hin_aggregator_3/transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       20
.model_1/mean_hin_aggregator_3/transpose_2/perm�
)model_1/mean_hin_aggregator_3/transpose_2	Transpose@model_1/mean_hin_aggregator_3/transpose_2/ReadVariableOp:value:07model_1/mean_hin_aggregator_3/transpose_2/perm:output:0*
T0*
_output_shapes

:@ 2+
)model_1/mean_hin_aggregator_3/transpose_2�
-model_1/mean_hin_aggregator_3/Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2/
-model_1/mean_hin_aggregator_3/Reshape_7/shape�
'model_1/mean_hin_aggregator_3/Reshape_7Reshape-model_1/mean_hin_aggregator_3/transpose_2:y:06model_1/mean_hin_aggregator_3/Reshape_7/shape:output:0*
T0*
_output_shapes

:@ 2)
'model_1/mean_hin_aggregator_3/Reshape_7�
&model_1/mean_hin_aggregator_3/MatMul_2MatMul0model_1/mean_hin_aggregator_3/Reshape_6:output:00model_1/mean_hin_aggregator_3/Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2(
&model_1/mean_hin_aggregator_3/MatMul_2�
/model_1/mean_hin_aggregator_3/Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :21
/model_1/mean_hin_aggregator_3/Reshape_8/shape/1�
/model_1/mean_hin_aggregator_3/Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 21
/model_1/mean_hin_aggregator_3/Reshape_8/shape/2�
-model_1/mean_hin_aggregator_3/Reshape_8/shapePack0model_1/mean_hin_aggregator_3/unstack_4:output:08model_1/mean_hin_aggregator_3/Reshape_8/shape/1:output:08model_1/mean_hin_aggregator_3/Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2/
-model_1/mean_hin_aggregator_3/Reshape_8/shape�
'model_1/mean_hin_aggregator_3/Reshape_8Reshape0model_1/mean_hin_aggregator_3/MatMul_2:product:06model_1/mean_hin_aggregator_3/Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2)
'model_1/mean_hin_aggregator_3/Reshape_8�
#model_1/mean_hin_aggregator_3/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2%
#model_1/mean_hin_aggregator_3/add/x�
!model_1/mean_hin_aggregator_3/addAddV2,model_1/mean_hin_aggregator_3/add/x:output:00model_1/mean_hin_aggregator_3/Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2#
!model_1/mean_hin_aggregator_3/add�
#model_1/mean_hin_aggregator_3/add_1AddV2%model_1/mean_hin_aggregator_3/add:z:00model_1/mean_hin_aggregator_3/Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2%
#model_1/mean_hin_aggregator_3/add_1�
'model_1/mean_hin_aggregator_3/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2)
'model_1/mean_hin_aggregator_3/truediv/y�
%model_1/mean_hin_aggregator_3/truedivRealDiv'model_1/mean_hin_aggregator_3/add_1:z:00model_1/mean_hin_aggregator_3/truediv/y:output:0*
T0*+
_output_shapes
:��������� 2'
%model_1/mean_hin_aggregator_3/truediv�
)model_1/mean_hin_aggregator_3/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2+
)model_1/mean_hin_aggregator_3/concat/axis�
$model_1/mean_hin_aggregator_3/concatConcatV20model_1/mean_hin_aggregator_3/Reshape_8:output:0)model_1/mean_hin_aggregator_3/truediv:z:02model_1/mean_hin_aggregator_3/concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2&
$model_1/mean_hin_aggregator_3/concat�
2model_1/mean_hin_aggregator_3/add_2/ReadVariableOpReadVariableOp;model_1_mean_hin_aggregator_3_add_2_readvariableop_resource*
_output_shapes
:@*
dtype024
2model_1/mean_hin_aggregator_3/add_2/ReadVariableOp�
#model_1/mean_hin_aggregator_3/add_2AddV2-model_1/mean_hin_aggregator_3/concat:output:0:model_1/mean_hin_aggregator_3/add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2%
#model_1/mean_hin_aggregator_3/add_2�
model_1/reshape_6/ShapeShape'model_1/mean_hin_aggregator_3/add_2:z:0*
T0*
_output_shapes
:2
model_1/reshape_6/Shape�
%model_1/reshape_6/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%model_1/reshape_6/strided_slice/stack�
'model_1/reshape_6/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_6/strided_slice/stack_1�
'model_1/reshape_6/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_6/strided_slice/stack_2�
model_1/reshape_6/strided_sliceStridedSlice model_1/reshape_6/Shape:output:0.model_1/reshape_6/strided_slice/stack:output:00model_1/reshape_6/strided_slice/stack_1:output:00model_1/reshape_6/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
model_1/reshape_6/strided_slice�
!model_1/reshape_6/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :@2#
!model_1/reshape_6/Reshape/shape/1�
model_1/reshape_6/Reshape/shapePack(model_1/reshape_6/strided_slice:output:0*model_1/reshape_6/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2!
model_1/reshape_6/Reshape/shape�
model_1/reshape_6/ReshapeReshape'model_1/mean_hin_aggregator_3/add_2:z:0(model_1/reshape_6/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2
model_1/reshape_6/Reshape�
"model_1/lambda/l2_normalize/SquareSquare"model_1/reshape_6/Reshape:output:0*
T0*'
_output_shapes
:���������@2$
"model_1/lambda/l2_normalize/Square�
1model_1/lambda/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
���������23
1model_1/lambda/l2_normalize/Sum/reduction_indices�
model_1/lambda/l2_normalize/SumSum&model_1/lambda/l2_normalize/Square:y:0:model_1/lambda/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(2!
model_1/lambda/l2_normalize/Sum�
%model_1/lambda/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+2'
%model_1/lambda/l2_normalize/Maximum/y�
#model_1/lambda/l2_normalize/MaximumMaximum(model_1/lambda/l2_normalize/Sum:output:0.model_1/lambda/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������2%
#model_1/lambda/l2_normalize/Maximum�
!model_1/lambda/l2_normalize/RsqrtRsqrt'model_1/lambda/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������2#
!model_1/lambda/l2_normalize/Rsqrt�
model_1/lambda/l2_normalizeMul"model_1/reshape_6/Reshape:output:0%model_1/lambda/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������@2
model_1/lambda/l2_normalize�
IdentityIdentitymodel_1/lambda/l2_normalize:z:01^model_1/mean_hin_aggregator/add_2/ReadVariableOp5^model_1/mean_hin_aggregator/transpose/ReadVariableOp7^model_1/mean_hin_aggregator/transpose_1/ReadVariableOp7^model_1/mean_hin_aggregator/transpose_2/ReadVariableOp3^model_1/mean_hin_aggregator_1/add_1/ReadVariableOp7^model_1/mean_hin_aggregator_1/transpose/ReadVariableOp9^model_1/mean_hin_aggregator_1/transpose_1/ReadVariableOp3^model_1/mean_hin_aggregator_2/add_1/ReadVariableOp7^model_1/mean_hin_aggregator_2/transpose/ReadVariableOp9^model_1/mean_hin_aggregator_2/transpose_1/ReadVariableOp3^model_1/mean_hin_aggregator_3/add_2/ReadVariableOp7^model_1/mean_hin_aggregator_3/transpose/ReadVariableOp9^model_1/mean_hin_aggregator_3/transpose_1/ReadVariableOp9^model_1/mean_hin_aggregator_3/transpose_2/ReadVariableOp*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::2d
0model_1/mean_hin_aggregator/add_2/ReadVariableOp0model_1/mean_hin_aggregator/add_2/ReadVariableOp2l
4model_1/mean_hin_aggregator/transpose/ReadVariableOp4model_1/mean_hin_aggregator/transpose/ReadVariableOp2p
6model_1/mean_hin_aggregator/transpose_1/ReadVariableOp6model_1/mean_hin_aggregator/transpose_1/ReadVariableOp2p
6model_1/mean_hin_aggregator/transpose_2/ReadVariableOp6model_1/mean_hin_aggregator/transpose_2/ReadVariableOp2h
2model_1/mean_hin_aggregator_1/add_1/ReadVariableOp2model_1/mean_hin_aggregator_1/add_1/ReadVariableOp2p
6model_1/mean_hin_aggregator_1/transpose/ReadVariableOp6model_1/mean_hin_aggregator_1/transpose/ReadVariableOp2t
8model_1/mean_hin_aggregator_1/transpose_1/ReadVariableOp8model_1/mean_hin_aggregator_1/transpose_1/ReadVariableOp2h
2model_1/mean_hin_aggregator_2/add_1/ReadVariableOp2model_1/mean_hin_aggregator_2/add_1/ReadVariableOp2p
6model_1/mean_hin_aggregator_2/transpose/ReadVariableOp6model_1/mean_hin_aggregator_2/transpose/ReadVariableOp2t
8model_1/mean_hin_aggregator_2/transpose_1/ReadVariableOp8model_1/mean_hin_aggregator_2/transpose_1/ReadVariableOp2h
2model_1/mean_hin_aggregator_3/add_2/ReadVariableOp2model_1/mean_hin_aggregator_3/add_2/ReadVariableOp2p
6model_1/mean_hin_aggregator_3/transpose/ReadVariableOp6model_1/mean_hin_aggregator_3/transpose/ReadVariableOp2t
8model_1/mean_hin_aggregator_3/transpose_1/ReadVariableOp8model_1/mean_hin_aggregator_3/transpose_1/ReadVariableOp2t
8model_1/mean_hin_aggregator_3/transpose_2/ReadVariableOp8model_1/mean_hin_aggregator_3/transpose_2/ReadVariableOp:T P
+
_output_shapes
:���������o
!
_user_specified_name	input_1:TP
+
_output_shapes
:���������
!
_user_specified_name	input_2:TP
+
_output_shapes
:���������
!
_user_specified_name	input_3:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_4:TP
+
_output_shapes
:���������@o
!
_user_specified_name	input_5
�
b
C__inference_dropout_8_layer_call_and_return_conditional_losses_6892

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:���������@2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:���������@*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:���������@2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:���������@2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:���������@2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*.
_input_shapes
:���������@:W S
/
_output_shapes
:���������@
 
_user_specified_nameinputs
�
_
A__inference_dropout_layer_call_and_return_conditional_losses_6524

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:���������2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:���������2

Identity_1"!

identity_1Identity_1:output:0*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
4__inference_mean_hin_aggregator_3_layer_call_fn_9364
x_0
x_1
x_2
unknown
	unknown_0
	unknown_1
	unknown_2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallx_0x_1x_2unknown	unknown_0	unknown_1	unknown_2*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_69932
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������@:���������@:���������@::::22
StatefulPartitionedCallStatefulPartitionedCall:P L
+
_output_shapes
:���������@

_user_specified_namex/0:TP
/
_output_shapes
:���������@

_user_specified_namex/1:TP
/
_output_shapes
:���������@

_user_specified_namex/2
�D
�
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_6993
x
x_1
x_2#
shape_1_readvariableop_resource#
shape_3_readvariableop_resource#
shape_5_readvariableop_resource!
add_2_readvariableop_resource
identity��add_2/ReadVariableOp�transpose/ReadVariableOp�transpose_1/ReadVariableOp�transpose_2/ReadVariableOpr
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean/reduction_indicesp
MeanMeanx_1Mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
MeanK
ShapeShapeMean:output:0*
T0*
_output_shapes
:2
Shape\
unstackUnpackShape:output:0*
T0*
_output_shapes
: : : *	
num2	
unstack�
Shape_1/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_1/ReadVariableOpc
Shape_1Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_1`
	unstack_1UnpackShape_1:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_1o
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape/shapev
ReshapeReshapeMean:output:0Reshape/shape:output:0*
T0*'
_output_shapes
:���������@2	
Reshape�
transpose/ReadVariableOpReadVariableOpshape_1_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose/ReadVariableOpq
transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose/perm�
	transpose	Transpose transpose/ReadVariableOp:value:0transpose/perm:output:0*
T0*
_output_shapes

:@ 2
	transposes
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_1/shapes
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_1r
MatMulMatMulReshape:output:0Reshape_1:output:0*
T0*'
_output_shapes
:��������� 2
MatMulh
Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_2/shape/1h
Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_2/shape/2�
Reshape_2/shapePackunstack:output:0Reshape_2/shape/1:output:0Reshape_2/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_2/shape�
	Reshape_2ReshapeMatMul:product:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_2v
Mean_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Mean_1/reduction_indicesv
Mean_1Meanx_2!Mean_1/reduction_indices:output:0*
T0*+
_output_shapes
:���������@2
Mean_1Q
Shape_2ShapeMean_1:output:0*
T0*
_output_shapes
:2	
Shape_2b
	unstack_2UnpackShape_2:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_2�
Shape_3/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_3/ReadVariableOpc
Shape_3Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_3`
	unstack_3UnpackShape_3:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_3s
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape_3/shape~
	Reshape_3ReshapeMean_1:output:0Reshape_3/shape:output:0*
T0*'
_output_shapes
:���������@2
	Reshape_3�
transpose_1/ReadVariableOpReadVariableOpshape_3_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose_1/ReadVariableOpu
transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_1/perm�
transpose_1	Transpose"transpose_1/ReadVariableOp:value:0transpose_1/perm:output:0*
T0*
_output_shapes

:@ 2
transpose_1s
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_4/shapeu
	Reshape_4Reshapetranspose_1:y:0Reshape_4/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_4x
MatMul_1MatMulReshape_3:output:0Reshape_4:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_1h
Reshape_5/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_5/shape/1h
Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_5/shape/2�
Reshape_5/shapePackunstack_2:output:0Reshape_5/shape/1:output:0Reshape_5/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_5/shape�
	Reshape_5ReshapeMatMul_1:product:0Reshape_5/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_5C
Shape_4Shapex*
T0*
_output_shapes
:2	
Shape_4b
	unstack_4UnpackShape_4:output:0*
T0*
_output_shapes
: : : *	
num2
	unstack_4�
Shape_5/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02
Shape_5/ReadVariableOpc
Shape_5Const*
_output_shapes
:*
dtype0*
valueB"@       2	
Shape_5`
	unstack_5UnpackShape_5:output:0*
T0*
_output_shapes
: : *	
num2
	unstack_5s
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   2
Reshape_6/shapep
	Reshape_6ReshapexReshape_6/shape:output:0*
T0*'
_output_shapes
:���������@2
	Reshape_6�
transpose_2/ReadVariableOpReadVariableOpshape_5_readvariableop_resource*
_output_shapes

:@ *
dtype02
transpose_2/ReadVariableOpu
transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       2
transpose_2/perm�
transpose_2	Transpose"transpose_2/ReadVariableOp:value:0transpose_2/perm:output:0*
T0*
_output_shapes

:@ 2
transpose_2s
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB"@   ����2
Reshape_7/shapeu
	Reshape_7Reshapetranspose_2:y:0Reshape_7/shape:output:0*
T0*
_output_shapes

:@ 2
	Reshape_7x
MatMul_2MatMulReshape_6:output:0Reshape_7:output:0*
T0*'
_output_shapes
:��������� 2

MatMul_2h
Reshape_8/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape_8/shape/1h
Reshape_8/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape_8/shape/2�
Reshape_8/shapePackunstack_4:output:0Reshape_8/shape/1:output:0Reshape_8/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape_8/shape�
	Reshape_8ReshapeMatMul_2:product:0Reshape_8/shape:output:0*
T0*+
_output_shapes
:��������� 2
	Reshape_8S
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
add/xm
addAddV2add/x:output:0Reshape_2:output:0*
T0*+
_output_shapes
:��������� 2
addj
add_1AddV2add:z:0Reshape_5:output:0*
T0*+
_output_shapes
:��������� 2
add_1[
	truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
	truediv/yr
truedivRealDiv	add_1:z:0truediv/y:output:0*
T0*+
_output_shapes
:��������� 2	
truediv\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2Reshape_8:output:0truediv:z:0concat/axis:output:0*
N*
T0*+
_output_shapes
:���������@2
concat�
add_2/ReadVariableOpReadVariableOpadd_2_readvariableop_resource*
_output_shapes
:@*
dtype02
add_2/ReadVariableOp|
add_2AddV2concat:output:0add_2/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������@2
add_2�
IdentityIdentity	add_2:z:0^add_2/ReadVariableOp^transpose/ReadVariableOp^transpose_1/ReadVariableOp^transpose_2/ReadVariableOp*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*p
_input_shapes_
]:���������@:���������@:���������@::::2,
add_2/ReadVariableOpadd_2/ReadVariableOp24
transpose/ReadVariableOptranspose/ReadVariableOp28
transpose_1/ReadVariableOptranspose_1/ReadVariableOp28
transpose_2/ReadVariableOptranspose_2/ReadVariableOp:N J
+
_output_shapes
:���������@

_user_specified_namex:RN
/
_output_shapes
:���������@

_user_specified_namex:RN
/
_output_shapes
:���������@

_user_specified_namex
�
b
C__inference_dropout_5_layer_call_and_return_conditional_losses_8486

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:��������� o2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:��������� o*
dtype0*
seed�2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:��������� o2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:��������� o2
dropout/Cast�
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:��������� o2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
D
(__inference_dropout_5_layer_call_fn_8501

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_5_layer_call_and_return_conditional_losses_60582
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0*.
_input_shapes
:��������� o:W S
/
_output_shapes
:��������� o
 
_user_specified_nameinputs
�
_
C__inference_reshape_3_layer_call_and_return_conditional_losses_8350

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B : 2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :o2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:��������� o2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:��������� o2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@o:S O
+
_output_shapes
:���������@o
 
_user_specified_nameinputs
�g
�
A__inference_model_1_layer_call_and_return_conditional_losses_7296

inputs
inputs_1
inputs_2
inputs_3
inputs_4
mean_hin_aggregator_2_7253
mean_hin_aggregator_2_7255
mean_hin_aggregator_2_7257
mean_hin_aggregator_1_7260
mean_hin_aggregator_1_7262
mean_hin_aggregator_1_7264
mean_hin_aggregator_7272
mean_hin_aggregator_7274
mean_hin_aggregator_7276
mean_hin_aggregator_7278
mean_hin_aggregator_3_7284
mean_hin_aggregator_3_7286
mean_hin_aggregator_3_7288
mean_hin_aggregator_3_7290
identity��dropout/StatefulPartitionedCall�!dropout_1/StatefulPartitionedCall�!dropout_2/StatefulPartitionedCall�!dropout_3/StatefulPartitionedCall�!dropout_4/StatefulPartitionedCall�!dropout_5/StatefulPartitionedCall�!dropout_6/StatefulPartitionedCall�!dropout_7/StatefulPartitionedCall�!dropout_8/StatefulPartitionedCall�!dropout_9/StatefulPartitionedCall�+mean_hin_aggregator/StatefulPartitionedCall�-mean_hin_aggregator_1/StatefulPartitionedCall�-mean_hin_aggregator_2/StatefulPartitionedCall�-mean_hin_aggregator_3/StatefulPartitionedCall�
reshape_3/PartitionedCallPartitionedCallinputs_4*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_3_layer_call_and_return_conditional_losses_59812
reshape_3/PartitionedCall�
reshape_2/PartitionedCallPartitionedCallinputs_3*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_2_layer_call_and_return_conditional_losses_60032
reshape_2/PartitionedCall�
!dropout_6/StatefulPartitionedCallStatefulPartitionedCallinputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_6_layer_call_and_return_conditional_losses_60232#
!dropout_6/StatefulPartitionedCall�
!dropout_5/StatefulPartitionedCallStatefulPartitionedCall"reshape_3/PartitionedCall:output:0"^dropout_6/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_5_layer_call_and_return_conditional_losses_60532#
!dropout_5/StatefulPartitionedCall�
!dropout_4/StatefulPartitionedCallStatefulPartitionedCallinputs_1"^dropout_5/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_4_layer_call_and_return_conditional_losses_60832#
!dropout_4/StatefulPartitionedCall�
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall"reshape_2/PartitionedCall:output:0"^dropout_4/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:��������� o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_3_layer_call_and_return_conditional_losses_61132#
!dropout_3/StatefulPartitionedCall�
reshape_1/PartitionedCallPartitionedCallinputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_1_layer_call_and_return_conditional_losses_61452
reshape_1/PartitionedCall�
reshape/PartitionedCallPartitionedCallinputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_reshape_layer_call_and_return_conditional_losses_61672
reshape/PartitionedCall�
-mean_hin_aggregator_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_6/StatefulPartitionedCall:output:0*dropout_5/StatefulPartitionedCall:output:0mean_hin_aggregator_2_7253mean_hin_aggregator_2_7255mean_hin_aggregator_2_7257*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_62342/
-mean_hin_aggregator_2/StatefulPartitionedCall�
-mean_hin_aggregator_1/StatefulPartitionedCallStatefulPartitionedCall*dropout_4/StatefulPartitionedCall:output:0*dropout_3/StatefulPartitionedCall:output:0mean_hin_aggregator_1_7260mean_hin_aggregator_1_7262mean_hin_aggregator_1_7264*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_63852/
-mean_hin_aggregator_1/StatefulPartitionedCall�
!dropout_2/StatefulPartitionedCallStatefulPartitionedCallinputs"^dropout_3/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������o* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_2_layer_call_and_return_conditional_losses_64892#
!dropout_2/StatefulPartitionedCall�
dropout/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_65192!
dropout/StatefulPartitionedCall�
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall"reshape_1/PartitionedCall:output:0 ^dropout/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_65492#
!dropout_1/StatefulPartitionedCall�
reshape_5/PartitionedCallPartitionedCall6mean_hin_aggregator_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_5_layer_call_and_return_conditional_losses_65812
reshape_5/PartitionedCall�
reshape_4/PartitionedCallPartitionedCall6mean_hin_aggregator_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_4_layer_call_and_return_conditional_losses_66032
reshape_4/PartitionedCall�
+mean_hin_aggregator/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0(dropout/StatefulPartitionedCall:output:0*dropout_1/StatefulPartitionedCall:output:0mean_hin_aggregator_7272mean_hin_aggregator_7274mean_hin_aggregator_7276mean_hin_aggregator_7278*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_66952-
+mean_hin_aggregator/StatefulPartitionedCall�
!dropout_9/StatefulPartitionedCallStatefulPartitionedCall4mean_hin_aggregator/StatefulPartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_9_layer_call_and_return_conditional_losses_68322#
!dropout_9/StatefulPartitionedCall�
!dropout_7/StatefulPartitionedCallStatefulPartitionedCall"reshape_4/PartitionedCall:output:0"^dropout_9/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_7_layer_call_and_return_conditional_losses_68622#
!dropout_7/StatefulPartitionedCall�
!dropout_8/StatefulPartitionedCallStatefulPartitionedCall"reshape_5/PartitionedCall:output:0"^dropout_7/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_8_layer_call_and_return_conditional_losses_68922#
!dropout_8/StatefulPartitionedCall�
-mean_hin_aggregator_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_9/StatefulPartitionedCall:output:0*dropout_7/StatefulPartitionedCall:output:0*dropout_8/StatefulPartitionedCall:output:0mean_hin_aggregator_3_7284mean_hin_aggregator_3_7286mean_hin_aggregator_3_7288mean_hin_aggregator_3_7290*
Tin
	2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_69932/
-mean_hin_aggregator_3/StatefulPartitionedCall�
reshape_6/PartitionedCallPartitionedCall6mean_hin_aggregator_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_reshape_6_layer_call_and_return_conditional_losses_71292
reshape_6/PartitionedCall�
lambda/PartitionedCallPartitionedCall"reshape_6/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_lambda_layer_call_and_return_conditional_losses_71482
lambda/PartitionedCall�
IdentityIdentitylambda/PartitionedCall:output:0 ^dropout/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall"^dropout_4/StatefulPartitionedCall"^dropout_5/StatefulPartitionedCall"^dropout_6/StatefulPartitionedCall"^dropout_7/StatefulPartitionedCall"^dropout_8/StatefulPartitionedCall"^dropout_9/StatefulPartitionedCall,^mean_hin_aggregator/StatefulPartitionedCall.^mean_hin_aggregator_1/StatefulPartitionedCall.^mean_hin_aggregator_2/StatefulPartitionedCall.^mean_hin_aggregator_3/StatefulPartitionedCall*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*�
_input_shapes�
�:���������o:���������:���������:���������@o:���������@o::::::::::::::2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall2F
!dropout_4/StatefulPartitionedCall!dropout_4/StatefulPartitionedCall2F
!dropout_5/StatefulPartitionedCall!dropout_5/StatefulPartitionedCall2F
!dropout_6/StatefulPartitionedCall!dropout_6/StatefulPartitionedCall2F
!dropout_7/StatefulPartitionedCall!dropout_7/StatefulPartitionedCall2F
!dropout_8/StatefulPartitionedCall!dropout_8/StatefulPartitionedCall2F
!dropout_9/StatefulPartitionedCall!dropout_9/StatefulPartitionedCall2Z
+mean_hin_aggregator/StatefulPartitionedCall+mean_hin_aggregator/StatefulPartitionedCall2^
-mean_hin_aggregator_1/StatefulPartitionedCall-mean_hin_aggregator_1/StatefulPartitionedCall2^
-mean_hin_aggregator_2/StatefulPartitionedCall-mean_hin_aggregator_2/StatefulPartitionedCall2^
-mean_hin_aggregator_3/StatefulPartitionedCall-mean_hin_aggregator_3/StatefulPartitionedCall:S O
+
_output_shapes
:���������o
 
_user_specified_nameinputs:SO
+
_output_shapes
:���������
 
_user_specified_nameinputs:SO
+
_output_shapes
:���������
 
_user_specified_nameinputs:SO
+
_output_shapes
:���������@o
 
_user_specified_nameinputs:SO
+
_output_shapes
:���������@o
 
_user_specified_nameinputs
�
_
C__inference_reshape_4_layer_call_and_return_conditional_losses_6603

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/2d
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :@2
Reshape/shape/3�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapew
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������@2	
Reshapel
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������@2

Identity"
identityIdentity:output:0**
_input_shapes
:���������@:S O
+
_output_shapes
:���������@
 
_user_specified_nameinputs
�
a
C__inference_dropout_6_layer_call_and_return_conditional_losses_6028

inputs

identity_1^
IdentityIdentityinputs*
T0*+
_output_shapes
:���������2

Identitym

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:���������2

Identity_1"!

identity_1Identity_1:output:0**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
4__inference_mean_hin_aggregator_1_layer_call_fn_8712
x_0
x_1
unknown
	unknown_0
	unknown_1
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallx_0x_1unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������@*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_63852
StatefulPartitionedCall�
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:���������:��������� o:::22
StatefulPartitionedCallStatefulPartitionedCall:P L
+
_output_shapes
:���������

_user_specified_namex/0:TP
/
_output_shapes
:��������� o

_user_specified_namex/1"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
?
input_14
serving_default_input_1:0���������o
?
input_24
serving_default_input_2:0���������
?
input_34
serving_default_input_3:0���������
?
input_44
serving_default_input_4:0���������@o
?
input_54
serving_default_input_5:0���������@o:
lambda0
StatefulPartitionedCall:0���������@tensorflow/serving/predict:��
��
layer-0
layer-1
layer-2
layer-3
layer-4
layer-5
layer-6
layer-7
	layer-8

layer-9
layer-10
layer-11
layer-12
layer-13
layer-14
layer-15
layer_with_weights-0
layer-16
layer_with_weights-1
layer-17
layer_with_weights-2
layer-18
layer-19
layer-20
layer-21
layer-22
layer-23
layer_with_weights-3
layer-24
layer-25
layer-26
	variables
trainable_variables
regularization_losses
	keras_api
 
signatures
�__call__
+�&call_and_return_all_conditional_losses
�_default_save_signature"��
_tf_keras_network��{"class_name": "Functional", "name": "model_1", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "config": {"name": "model_1", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_4"}, "name": "input_4", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_5"}, "name": "input_5", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_2"}, "name": "input_2", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_3"}, "name": "input_3", "inbound_nodes": []}, {"class_name": "Reshape", "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [2, 32, 111]}}, "name": "reshape_2", "inbound_nodes": [[["input_4", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_3", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [2, 32, 111]}}, "name": "reshape_3", "inbound_nodes": [[["input_5", 0, 0, {}]]]}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}, "name": "input_1", "inbound_nodes": []}, {"class_name": "Reshape", "config": {"name": "reshape", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 1]}}, "name": "reshape", "inbound_nodes": [[["input_2", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_1", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 1]}}, "name": "reshape_1", "inbound_nodes": [[["input_3", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_4", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_4", "inbound_nodes": [[["input_2", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_3", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_3", "inbound_nodes": [[["reshape_2", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_6", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_6", "inbound_nodes": [[["input_3", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_5", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_5", "inbound_nodes": [[["reshape_3", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_2", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_2", "inbound_nodes": [[["input_1", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout", "inbound_nodes": [[["reshape", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_1", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_1", "inbound_nodes": [[["reshape_1", 0, 0, {}]]]}, {"class_name": "MeanHinAggregator", "config": {"name": "mean_hin_aggregator_1", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "name": "mean_hin_aggregator_1", "inbound_nodes": [[["dropout_4", 0, 0, {}], ["dropout_3", 0, 0, {}]]]}, {"class_name": "MeanHinAggregator", "config": {"name": "mean_hin_aggregator_2", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "name": "mean_hin_aggregator_2", "inbound_nodes": [[["dropout_6", 0, 0, {}], ["dropout_5", 0, 0, {}]]]}, {"class_name": "MeanHinAggregator", "config": {"name": "mean_hin_aggregator", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "name": "mean_hin_aggregator", "inbound_nodes": [[["dropout_2", 0, 0, {}], ["dropout", 0, 0, {}], ["dropout_1", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_4", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 64]}}, "name": "reshape_4", "inbound_nodes": [[["mean_hin_aggregator_1", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_5", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 64]}}, "name": "reshape_5", "inbound_nodes": [[["mean_hin_aggregator_2", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_9", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_9", "inbound_nodes": [[["mean_hin_aggregator", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_7", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_7", "inbound_nodes": [[["reshape_4", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_8", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_8", "inbound_nodes": [[["reshape_5", 0, 0, {}]]]}, {"class_name": "MeanHinAggregator", "config": {"name": "mean_hin_aggregator_3", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "linear", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "name": "mean_hin_aggregator_3", "inbound_nodes": [[["dropout_9", 0, 0, {}], ["dropout_7", 0, 0, {}], ["dropout_8", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_6", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [64]}}, "name": "reshape_6", "inbound_nodes": [[["mean_hin_aggregator_3", 0, 0, {}]]]}, {"class_name": "Lambda", "config": {"name": "lambda", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAEAAAAUwAAAHMOAAAAdABqAXwAZAFkAo0CUwApA07p/////6kB2gRh\neGlzKQLaAUvaDGwyX25vcm1hbGl6ZakB2gF4qQByCAAAAPpSL29wdC9jb25kYS9lbnZzL21vcnBo\nZXVzL2xpYi9weXRob24zLjgvc2l0ZS1wYWNrYWdlcy9zdGVsbGFyZ3JhcGgvbGF5ZXIvaGluc2Fn\nZS5wedoIPGxhbWJkYT5mAQAA8wAAAAA=\n", null, null]}, "function_type": "lambda", "module": "stellargraph.layer.hinsage", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}, "name": "lambda", "inbound_nodes": [[["reshape_6", 0, 0, {}]]]}], "input_layers": [["input_1", 0, 0], ["input_2", 0, 0], ["input_3", 0, 0], ["input_4", 0, 0], ["input_5", 0, 0]], "output_layers": [["lambda", 0, 0]]}, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 1, 111]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}, {"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}, {"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}, {"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}, {"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}], "build_input_shape": [{"class_name": "TensorShape", "items": [null, 1, 111]}, {"class_name": "TensorShape", "items": [null, 2, 1]}, {"class_name": "TensorShape", "items": [null, 2, 1]}, {"class_name": "TensorShape", "items": [null, 64, 111]}, {"class_name": "TensorShape", "items": [null, 64, 111]}], "is_graph_network": true, "keras_version": "2.4.0", "backend": "tensorflow", "model_config": {"class_name": "Functional", "config": {"name": "model_1", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_4"}, "name": "input_4", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_5"}, "name": "input_5", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_2"}, "name": "input_2", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_3"}, "name": "input_3", "inbound_nodes": []}, {"class_name": "Reshape", "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [2, 32, 111]}}, "name": "reshape_2", "inbound_nodes": [[["input_4", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_3", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [2, 32, 111]}}, "name": "reshape_3", "inbound_nodes": [[["input_5", 0, 0, {}]]]}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}, "name": "input_1", "inbound_nodes": []}, {"class_name": "Reshape", "config": {"name": "reshape", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 1]}}, "name": "reshape", "inbound_nodes": [[["input_2", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_1", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 1]}}, "name": "reshape_1", "inbound_nodes": [[["input_3", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_4", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_4", "inbound_nodes": [[["input_2", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_3", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_3", "inbound_nodes": [[["reshape_2", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_6", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_6", "inbound_nodes": [[["input_3", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_5", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_5", "inbound_nodes": [[["reshape_3", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_2", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_2", "inbound_nodes": [[["input_1", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout", "inbound_nodes": [[["reshape", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_1", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_1", "inbound_nodes": [[["reshape_1", 0, 0, {}]]]}, {"class_name": "MeanHinAggregator", "config": {"name": "mean_hin_aggregator_1", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "name": "mean_hin_aggregator_1", "inbound_nodes": [[["dropout_4", 0, 0, {}], ["dropout_3", 0, 0, {}]]]}, {"class_name": "MeanHinAggregator", "config": {"name": "mean_hin_aggregator_2", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "name": "mean_hin_aggregator_2", "inbound_nodes": [[["dropout_6", 0, 0, {}], ["dropout_5", 0, 0, {}]]]}, {"class_name": "MeanHinAggregator", "config": {"name": "mean_hin_aggregator", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "name": "mean_hin_aggregator", "inbound_nodes": [[["dropout_2", 0, 0, {}], ["dropout", 0, 0, {}], ["dropout_1", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_4", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 64]}}, "name": "reshape_4", "inbound_nodes": [[["mean_hin_aggregator_1", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_5", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 64]}}, "name": "reshape_5", "inbound_nodes": [[["mean_hin_aggregator_2", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_9", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_9", "inbound_nodes": [[["mean_hin_aggregator", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_7", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_7", "inbound_nodes": [[["reshape_4", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_8", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}, "name": "dropout_8", "inbound_nodes": [[["reshape_5", 0, 0, {}]]]}, {"class_name": "MeanHinAggregator", "config": {"name": "mean_hin_aggregator_3", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "linear", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "name": "mean_hin_aggregator_3", "inbound_nodes": [[["dropout_9", 0, 0, {}], ["dropout_7", 0, 0, {}], ["dropout_8", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_6", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [64]}}, "name": "reshape_6", "inbound_nodes": [[["mean_hin_aggregator_3", 0, 0, {}]]]}, {"class_name": "Lambda", "config": {"name": "lambda", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAEAAAAUwAAAHMOAAAAdABqAXwAZAFkAo0CUwApA07p/////6kB2gRh\neGlzKQLaAUvaDGwyX25vcm1hbGl6ZakB2gF4qQByCAAAAPpSL29wdC9jb25kYS9lbnZzL21vcnBo\nZXVzL2xpYi9weXRob24zLjgvc2l0ZS1wYWNrYWdlcy9zdGVsbGFyZ3JhcGgvbGF5ZXIvaGluc2Fn\nZS5wedoIPGxhbWJkYT5mAQAA8wAAAAA=\n", null, null]}, "function_type": "lambda", "module": "stellargraph.layer.hinsage", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}, "name": "lambda", "inbound_nodes": [[["reshape_6", 0, 0, {}]]]}], "input_layers": [["input_1", 0, 0], ["input_2", 0, 0], ["input_3", 0, 0], ["input_4", 0, 0], ["input_5", 0, 0]], "output_layers": [["lambda", 0, 0]]}}}
�"�
_tf_keras_input_layer�{"class_name": "InputLayer", "name": "input_4", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_4"}}
�"�
_tf_keras_input_layer�{"class_name": "InputLayer", "name": "input_5", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_5"}}
�"�
_tf_keras_input_layer�{"class_name": "InputLayer", "name": "input_2", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_2"}}
�"�
_tf_keras_input_layer�{"class_name": "InputLayer", "name": "input_3", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 2, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_3"}}
�
!	variables
"trainable_variables
#regularization_losses
$	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Reshape", "name": "reshape_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [2, 32, 111]}}}
�
%	variables
&trainable_variables
'regularization_losses
(	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Reshape", "name": "reshape_3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape_3", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [2, 32, 111]}}}
�"�
_tf_keras_input_layer�{"class_name": "InputLayer", "name": "input_1", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 1, 111]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1, 111]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}}
�
)	variables
*trainable_variables
+regularization_losses
,	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Reshape", "name": "reshape", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 1]}}}
�
-	variables
.trainable_variables
/regularization_losses
0	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Reshape", "name": "reshape_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape_1", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 1]}}}
�
1	variables
2trainable_variables
3regularization_losses
4	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_4", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_4", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
5	variables
6trainable_variables
7regularization_losses
8	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_3", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_3", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
9	variables
:trainable_variables
;regularization_losses
<	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_6", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_6", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
=	variables
>trainable_variables
?regularization_losses
@	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_5", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_5", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
A	variables
Btrainable_variables
Cregularization_losses
D	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_2", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_2", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
I	variables
Jtrainable_variables
Kregularization_losses
L	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_1", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_1", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
Mw_neigh
N	w_neigh_0

Ow_self
Pbias
Q	variables
Rtrainable_variables
Sregularization_losses
T	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "MeanHinAggregator", "name": "mean_hin_aggregator_1", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "mean_hin_aggregator_1", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "build_input_shape": [{"class_name": "TensorShape", "items": [null, 2, 1]}, {"class_name": "TensorShape", "items": [null, 2, 32, 111]}]}
�
Uw_neigh
V	w_neigh_0

Ww_self
Xbias
Y	variables
Ztrainable_variables
[regularization_losses
\	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "MeanHinAggregator", "name": "mean_hin_aggregator_2", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "mean_hin_aggregator_2", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "build_input_shape": [{"class_name": "TensorShape", "items": [null, 2, 1]}, {"class_name": "TensorShape", "items": [null, 2, 32, 111]}]}
�
]w_neigh
^	w_neigh_0
_	w_neigh_1

`w_self
abias
b	variables
ctrainable_variables
dregularization_losses
e	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "MeanHinAggregator", "name": "mean_hin_aggregator", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "mean_hin_aggregator", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "relu", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "build_input_shape": [{"class_name": "TensorShape", "items": [null, 1, 111]}, {"class_name": "TensorShape", "items": [null, 1, 2, 1]}, {"class_name": "TensorShape", "items": [null, 1, 2, 1]}]}
�
f	variables
gtrainable_variables
hregularization_losses
i	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Reshape", "name": "reshape_4", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape_4", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 64]}}}
�
j	variables
ktrainable_variables
lregularization_losses
m	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Reshape", "name": "reshape_5", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape_5", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [1, 2, 64]}}}
�
n	variables
otrainable_variables
pregularization_losses
q	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_9", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_9", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
r	variables
strainable_variables
tregularization_losses
u	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_7", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_7", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
v	variables
wtrainable_variables
xregularization_losses
y	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Dropout", "name": "dropout_8", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_8", "trainable": true, "dtype": "float32", "rate": 0, "noise_shape": null, "seed": null}}
�
zw_neigh
{	w_neigh_0
|	w_neigh_1

}w_self
~bias
	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "MeanHinAggregator", "name": "mean_hin_aggregator_3", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "mean_hin_aggregator_3", "trainable": true, "dtype": "float32", "output_dim": 64, "bias": true, "act": "linear", "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "kernel_regularizer": null, "kernel_constraint": null, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "bias_constraint": null}, "build_input_shape": [{"class_name": "TensorShape", "items": [null, 1, 64]}, {"class_name": "TensorShape", "items": [null, 1, 2, 64]}, {"class_name": "TensorShape", "items": [null, 1, 2, 64]}]}
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Reshape", "name": "reshape_6", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape_6", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [64]}}}
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"�
_tf_keras_layer�{"class_name": "Lambda", "name": "lambda", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "lambda", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAEAAAAUwAAAHMOAAAAdABqAXwAZAFkAo0CUwApA07p/////6kB2gRh\neGlzKQLaAUvaDGwyX25vcm1hbGl6ZakB2gF4qQByCAAAAPpSL29wdC9jb25kYS9lbnZzL21vcnBo\nZXVzL2xpYi9weXRob24zLjgvc2l0ZS1wYWNrYWdlcy9zdGVsbGFyZ3JhcGgvbGF5ZXIvaGluc2Fn\nZS5wedoIPGxhbWJkYT5mAQAA8wAAAAA=\n", null, null]}, "function_type": "lambda", "module": "stellargraph.layer.hinsage", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}}
�
N0
O1
P2
V3
W4
X5
^6
_7
`8
a9
{10
|11
}12
~13"
trackable_list_wrapper
�
N0
O1
P2
V3
W4
X5
^6
_7
`8
a9
{10
|11
}12
~13"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�metrics
�layers
 �layer_regularization_losses
�non_trainable_variables
	variables
trainable_variables
regularization_losses
�__call__
�_default_save_signature
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
-
�serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
!	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
"trainable_variables
#regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
%	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
&trainable_variables
'regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
)	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
*trainable_variables
+regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
-	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
.trainable_variables
/regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
1	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
2trainable_variables
3regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
5	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
6trainable_variables
7regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
9	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
:trainable_variables
;regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
=	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
>trainable_variables
?regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
A	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Btrainable_variables
Cregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
E	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Ftrainable_variables
Gregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
I	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Jtrainable_variables
Kregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
'
N0"
trackable_list_wrapper
1:/o 2mean_hin_aggregator_1/w_neigh_0
.:, 2mean_hin_aggregator_1/w_self
(:&@2mean_hin_aggregator_1/bias
5
N0
O1
P2"
trackable_list_wrapper
5
N0
O1
P2"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
Q	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Rtrainable_variables
Sregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
'
V0"
trackable_list_wrapper
1:/o 2mean_hin_aggregator_2/w_neigh_0
.:, 2mean_hin_aggregator_2/w_self
(:&@2mean_hin_aggregator_2/bias
5
V0
W1
X2"
trackable_list_wrapper
5
V0
W1
X2"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
Y	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
Ztrainable_variables
[regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
.
^0
_1"
trackable_list_wrapper
/:- 2mean_hin_aggregator/w_neigh_0
/:- 2mean_hin_aggregator/w_neigh_1
,:*o 2mean_hin_aggregator/w_self
&:$@2mean_hin_aggregator/bias
<
^0
_1
`2
a3"
trackable_list_wrapper
<
^0
_1
`2
a3"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
b	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
ctrainable_variables
dregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
f	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
gtrainable_variables
hregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
j	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
ktrainable_variables
lregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
n	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
otrainable_variables
pregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
r	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
strainable_variables
tregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
v	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
wtrainable_variables
xregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
.
{0
|1"
trackable_list_wrapper
1:/@ 2mean_hin_aggregator_3/w_neigh_0
1:/@ 2mean_hin_aggregator_3/w_neigh_1
.:,@ 2mean_hin_aggregator_3/w_self
(:&@2mean_hin_aggregator_3/bias
<
{0
|1
}2
~3"
trackable_list_wrapper
<
{0
|1
}2
~3"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
�	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�layer_metrics
�layers
�	variables
 �layer_regularization_losses
�non_trainable_variables
�metrics
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�2�
&__inference_model_1_layer_call_fn_8280
&__inference_model_1_layer_call_fn_7422
&__inference_model_1_layer_call_fn_8317
&__inference_model_1_layer_call_fn_7327�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
A__inference_model_1_layer_call_and_return_conditional_losses_7173
A__inference_model_1_layer_call_and_return_conditional_losses_8243
A__inference_model_1_layer_call_and_return_conditional_losses_7887
A__inference_model_1_layer_call_and_return_conditional_losses_7231�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
__inference__wrapped_model_5959�
���
FullArgSpec
args� 
varargsjargs
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *���
���
%�"
input_1���������o
%�"
input_2���������
%�"
input_3���������
%�"
input_4���������@o
%�"
input_5���������@o
�2�
(__inference_reshape_2_layer_call_fn_8336�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_reshape_2_layer_call_and_return_conditional_losses_8331�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_reshape_3_layer_call_fn_8355�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_reshape_3_layer_call_and_return_conditional_losses_8350�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
&__inference_reshape_layer_call_fn_8374�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
A__inference_reshape_layer_call_and_return_conditional_losses_8369�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_reshape_1_layer_call_fn_8393�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_reshape_1_layer_call_and_return_conditional_losses_8388�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_dropout_4_layer_call_fn_8415
(__inference_dropout_4_layer_call_fn_8420�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_4_layer_call_and_return_conditional_losses_8405
C__inference_dropout_4_layer_call_and_return_conditional_losses_8410�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
(__inference_dropout_3_layer_call_fn_8442
(__inference_dropout_3_layer_call_fn_8447�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_3_layer_call_and_return_conditional_losses_8432
C__inference_dropout_3_layer_call_and_return_conditional_losses_8437�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
(__inference_dropout_6_layer_call_fn_8474
(__inference_dropout_6_layer_call_fn_8469�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_6_layer_call_and_return_conditional_losses_8459
C__inference_dropout_6_layer_call_and_return_conditional_losses_8464�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
(__inference_dropout_5_layer_call_fn_8496
(__inference_dropout_5_layer_call_fn_8501�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_5_layer_call_and_return_conditional_losses_8491
C__inference_dropout_5_layer_call_and_return_conditional_losses_8486�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
(__inference_dropout_2_layer_call_fn_8523
(__inference_dropout_2_layer_call_fn_8528�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_2_layer_call_and_return_conditional_losses_8518
C__inference_dropout_2_layer_call_and_return_conditional_losses_8513�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
&__inference_dropout_layer_call_fn_8555
&__inference_dropout_layer_call_fn_8550�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
A__inference_dropout_layer_call_and_return_conditional_losses_8545
A__inference_dropout_layer_call_and_return_conditional_losses_8540�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
(__inference_dropout_1_layer_call_fn_8582
(__inference_dropout_1_layer_call_fn_8577�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_1_layer_call_and_return_conditional_losses_8572
C__inference_dropout_1_layer_call_and_return_conditional_losses_8567�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
4__inference_mean_hin_aggregator_1_layer_call_fn_8712
4__inference_mean_hin_aggregator_1_layer_call_fn_8724�
���
FullArgSpec
args�
jself
jx
varargs
 
varkwjkwargs
defaults� 

kwonlyargs�

jtraining%
kwonlydefaults�

trainingp 
annotations� *
 
�2�
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_8641
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_8700�
���
FullArgSpec
args�
jself
jx
varargs
 
varkwjkwargs
defaults� 

kwonlyargs�

jtraining%
kwonlydefaults�

trainingp 
annotations� *
 
�2�
4__inference_mean_hin_aggregator_2_layer_call_fn_8854
4__inference_mean_hin_aggregator_2_layer_call_fn_8866�
���
FullArgSpec
args�
jself
jx
varargs
 
varkwjkwargs
defaults� 

kwonlyargs�

jtraining%
kwonlydefaults�

trainingp 
annotations� *
 
�2�
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_8783
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_8842�
���
FullArgSpec
args�
jself
jx
varargs
 
varkwjkwargs
defaults� 

kwonlyargs�

jtraining%
kwonlydefaults�

trainingp 
annotations� *
 
�2�
2__inference_mean_hin_aggregator_layer_call_fn_9064
2__inference_mean_hin_aggregator_layer_call_fn_9049�
���
FullArgSpec
args�
jself
jx
varargs
 
varkwjkwargs
defaults� 

kwonlyargs�

jtraining%
kwonlydefaults�

trainingp 
annotations� *
 
�2�
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_9034
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_8950�
���
FullArgSpec
args�
jself
jx
varargs
 
varkwjkwargs
defaults� 

kwonlyargs�

jtraining%
kwonlydefaults�

trainingp 
annotations� *
 
�2�
(__inference_reshape_4_layer_call_fn_9083�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_reshape_4_layer_call_and_return_conditional_losses_9078�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_reshape_5_layer_call_fn_9102�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_reshape_5_layer_call_and_return_conditional_losses_9097�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_dropout_9_layer_call_fn_9124
(__inference_dropout_9_layer_call_fn_9129�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_9_layer_call_and_return_conditional_losses_9114
C__inference_dropout_9_layer_call_and_return_conditional_losses_9119�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
(__inference_dropout_7_layer_call_fn_9156
(__inference_dropout_7_layer_call_fn_9151�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_7_layer_call_and_return_conditional_losses_9141
C__inference_dropout_7_layer_call_and_return_conditional_losses_9146�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
(__inference_dropout_8_layer_call_fn_9183
(__inference_dropout_8_layer_call_fn_9178�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_8_layer_call_and_return_conditional_losses_9168
C__inference_dropout_8_layer_call_and_return_conditional_losses_9173�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
4__inference_mean_hin_aggregator_3_layer_call_fn_9364
4__inference_mean_hin_aggregator_3_layer_call_fn_9379�
���
FullArgSpec
args�
jself
jx
varargs
 
varkwjkwargs
defaults� 

kwonlyargs�

jtraining%
kwonlydefaults�

trainingp 
annotations� *
 
�2�
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_9349
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_9266�
���
FullArgSpec
args�
jself
jx
varargs
 
varkwjkwargs
defaults� 

kwonlyargs�

jtraining%
kwonlydefaults�

trainingp 
annotations� *
 
�2�
(__inference_reshape_6_layer_call_fn_9396�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_reshape_6_layer_call_and_return_conditional_losses_9391�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
%__inference_lambda_layer_call_fn_9423
%__inference_lambda_layer_call_fn_9428�
���
FullArgSpec1
args)�&
jself
jinputs
jmask

jtraining
varargs
 
varkw
 
defaults�

 
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
@__inference_lambda_layer_call_and_return_conditional_losses_9407
@__inference_lambda_layer_call_and_return_conditional_losses_9418�
���
FullArgSpec1
args)�&
jself
jinputs
jmask

jtraining
varargs
 
varkw
 
defaults�

 
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
"__inference_signature_wrapper_7461input_1input_2input_3input_4input_5"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 �
__inference__wrapped_model_5959�VWXNOP^_`a{|}~���
���
���
%�"
input_1���������o
%�"
input_2���������
%�"
input_3���������
%�"
input_4���������@o
%�"
input_5���������@o
� "/�,
*
lambda �
lambda���������@�
C__inference_dropout_1_layer_call_and_return_conditional_losses_8567l;�8
1�.
(�%
inputs���������
p
� "-�*
#� 
0���������
� �
C__inference_dropout_1_layer_call_and_return_conditional_losses_8572l;�8
1�.
(�%
inputs���������
p 
� "-�*
#� 
0���������
� �
(__inference_dropout_1_layer_call_fn_8577_;�8
1�.
(�%
inputs���������
p
� " �����������
(__inference_dropout_1_layer_call_fn_8582_;�8
1�.
(�%
inputs���������
p 
� " �����������
C__inference_dropout_2_layer_call_and_return_conditional_losses_8513d7�4
-�*
$�!
inputs���������o
p
� ")�&
�
0���������o
� �
C__inference_dropout_2_layer_call_and_return_conditional_losses_8518d7�4
-�*
$�!
inputs���������o
p 
� ")�&
�
0���������o
� �
(__inference_dropout_2_layer_call_fn_8523W7�4
-�*
$�!
inputs���������o
p
� "����������o�
(__inference_dropout_2_layer_call_fn_8528W7�4
-�*
$�!
inputs���������o
p 
� "����������o�
C__inference_dropout_3_layer_call_and_return_conditional_losses_8432l;�8
1�.
(�%
inputs��������� o
p
� "-�*
#� 
0��������� o
� �
C__inference_dropout_3_layer_call_and_return_conditional_losses_8437l;�8
1�.
(�%
inputs��������� o
p 
� "-�*
#� 
0��������� o
� �
(__inference_dropout_3_layer_call_fn_8442_;�8
1�.
(�%
inputs��������� o
p
� " ���������� o�
(__inference_dropout_3_layer_call_fn_8447_;�8
1�.
(�%
inputs��������� o
p 
� " ���������� o�
C__inference_dropout_4_layer_call_and_return_conditional_losses_8405d7�4
-�*
$�!
inputs���������
p
� ")�&
�
0���������
� �
C__inference_dropout_4_layer_call_and_return_conditional_losses_8410d7�4
-�*
$�!
inputs���������
p 
� ")�&
�
0���������
� �
(__inference_dropout_4_layer_call_fn_8415W7�4
-�*
$�!
inputs���������
p
� "�����������
(__inference_dropout_4_layer_call_fn_8420W7�4
-�*
$�!
inputs���������
p 
� "�����������
C__inference_dropout_5_layer_call_and_return_conditional_losses_8486l;�8
1�.
(�%
inputs��������� o
p
� "-�*
#� 
0��������� o
� �
C__inference_dropout_5_layer_call_and_return_conditional_losses_8491l;�8
1�.
(�%
inputs��������� o
p 
� "-�*
#� 
0��������� o
� �
(__inference_dropout_5_layer_call_fn_8496_;�8
1�.
(�%
inputs��������� o
p
� " ���������� o�
(__inference_dropout_5_layer_call_fn_8501_;�8
1�.
(�%
inputs��������� o
p 
� " ���������� o�
C__inference_dropout_6_layer_call_and_return_conditional_losses_8459d7�4
-�*
$�!
inputs���������
p
� ")�&
�
0���������
� �
C__inference_dropout_6_layer_call_and_return_conditional_losses_8464d7�4
-�*
$�!
inputs���������
p 
� ")�&
�
0���������
� �
(__inference_dropout_6_layer_call_fn_8469W7�4
-�*
$�!
inputs���������
p
� "�����������
(__inference_dropout_6_layer_call_fn_8474W7�4
-�*
$�!
inputs���������
p 
� "�����������
C__inference_dropout_7_layer_call_and_return_conditional_losses_9141l;�8
1�.
(�%
inputs���������@
p
� "-�*
#� 
0���������@
� �
C__inference_dropout_7_layer_call_and_return_conditional_losses_9146l;�8
1�.
(�%
inputs���������@
p 
� "-�*
#� 
0���������@
� �
(__inference_dropout_7_layer_call_fn_9151_;�8
1�.
(�%
inputs���������@
p
� " ����������@�
(__inference_dropout_7_layer_call_fn_9156_;�8
1�.
(�%
inputs���������@
p 
� " ����������@�
C__inference_dropout_8_layer_call_and_return_conditional_losses_9168l;�8
1�.
(�%
inputs���������@
p
� "-�*
#� 
0���������@
� �
C__inference_dropout_8_layer_call_and_return_conditional_losses_9173l;�8
1�.
(�%
inputs���������@
p 
� "-�*
#� 
0���������@
� �
(__inference_dropout_8_layer_call_fn_9178_;�8
1�.
(�%
inputs���������@
p
� " ����������@�
(__inference_dropout_8_layer_call_fn_9183_;�8
1�.
(�%
inputs���������@
p 
� " ����������@�
C__inference_dropout_9_layer_call_and_return_conditional_losses_9114d7�4
-�*
$�!
inputs���������@
p
� ")�&
�
0���������@
� �
C__inference_dropout_9_layer_call_and_return_conditional_losses_9119d7�4
-�*
$�!
inputs���������@
p 
� ")�&
�
0���������@
� �
(__inference_dropout_9_layer_call_fn_9124W7�4
-�*
$�!
inputs���������@
p
� "����������@�
(__inference_dropout_9_layer_call_fn_9129W7�4
-�*
$�!
inputs���������@
p 
� "����������@�
A__inference_dropout_layer_call_and_return_conditional_losses_8540l;�8
1�.
(�%
inputs���������
p
� "-�*
#� 
0���������
� �
A__inference_dropout_layer_call_and_return_conditional_losses_8545l;�8
1�.
(�%
inputs���������
p 
� "-�*
#� 
0���������
� �
&__inference_dropout_layer_call_fn_8550_;�8
1�.
(�%
inputs���������
p
� " �����������
&__inference_dropout_layer_call_fn_8555_;�8
1�.
(�%
inputs���������
p 
� " �����������
@__inference_lambda_layer_call_and_return_conditional_losses_9407`7�4
-�*
 �
inputs���������@

 
p
� "%�"
�
0���������@
� �
@__inference_lambda_layer_call_and_return_conditional_losses_9418`7�4
-�*
 �
inputs���������@

 
p 
� "%�"
�
0���������@
� |
%__inference_lambda_layer_call_fn_9423S7�4
-�*
 �
inputs���������@

 
p
� "����������@|
%__inference_lambda_layer_call_fn_9428S7�4
-�*
 �
inputs���������@

 
p 
� "����������@�
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_8641�NOPl�i
R�O
M�J
!�
x/0���������
%�"
x/1��������� o
�

trainingp")�&
�
0���������@
� �
O__inference_mean_hin_aggregator_1_layer_call_and_return_conditional_losses_8700�NOPl�i
R�O
M�J
!�
x/0���������
%�"
x/1��������� o
�

trainingp ")�&
�
0���������@
� �
4__inference_mean_hin_aggregator_1_layer_call_fn_8712�NOPl�i
R�O
M�J
!�
x/0���������
%�"
x/1��������� o
�

trainingp"����������@�
4__inference_mean_hin_aggregator_1_layer_call_fn_8724�NOPl�i
R�O
M�J
!�
x/0���������
%�"
x/1��������� o
�

trainingp "����������@�
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_8783�VWXl�i
R�O
M�J
!�
x/0���������
%�"
x/1��������� o
�

trainingp")�&
�
0���������@
� �
O__inference_mean_hin_aggregator_2_layer_call_and_return_conditional_losses_8842�VWXl�i
R�O
M�J
!�
x/0���������
%�"
x/1��������� o
�

trainingp ")�&
�
0���������@
� �
4__inference_mean_hin_aggregator_2_layer_call_fn_8854�VWXl�i
R�O
M�J
!�
x/0���������
%�"
x/1��������� o
�

trainingp"����������@�
4__inference_mean_hin_aggregator_2_layer_call_fn_8866�VWXl�i
R�O
M�J
!�
x/0���������
%�"
x/1��������� o
�

trainingp "����������@�
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_9266�{|}~���
y�v
t�q
!�
x/0���������@
%�"
x/1���������@
%�"
x/2���������@
�

trainingp")�&
�
0���������@
� �
O__inference_mean_hin_aggregator_3_layer_call_and_return_conditional_losses_9349�{|}~���
y�v
t�q
!�
x/0���������@
%�"
x/1���������@
%�"
x/2���������@
�

trainingp ")�&
�
0���������@
� �
4__inference_mean_hin_aggregator_3_layer_call_fn_9364�{|}~���
y�v
t�q
!�
x/0���������@
%�"
x/1���������@
%�"
x/2���������@
�

trainingp"����������@�
4__inference_mean_hin_aggregator_3_layer_call_fn_9379�{|}~���
y�v
t�q
!�
x/0���������@
%�"
x/1���������@
%�"
x/2���������@
�

trainingp "����������@�
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_8950�^_`a���
y�v
t�q
!�
x/0���������o
%�"
x/1���������
%�"
x/2���������
�

trainingp")�&
�
0���������@
� �
M__inference_mean_hin_aggregator_layer_call_and_return_conditional_losses_9034�^_`a���
y�v
t�q
!�
x/0���������o
%�"
x/1���������
%�"
x/2���������
�

trainingp ")�&
�
0���������@
� �
2__inference_mean_hin_aggregator_layer_call_fn_9049�^_`a���
y�v
t�q
!�
x/0���������o
%�"
x/1���������
%�"
x/2���������
�

trainingp"����������@�
2__inference_mean_hin_aggregator_layer_call_fn_9064�^_`a���
y�v
t�q
!�
x/0���������o
%�"
x/1���������
%�"
x/2���������
�

trainingp "����������@�
A__inference_model_1_layer_call_and_return_conditional_losses_7173�VWXNOP^_`a{|}~���
���
���
%�"
input_1���������o
%�"
input_2���������
%�"
input_3���������
%�"
input_4���������@o
%�"
input_5���������@o
p

 
� "%�"
�
0���������@
� �
A__inference_model_1_layer_call_and_return_conditional_losses_7231�VWXNOP^_`a{|}~���
���
���
%�"
input_1���������o
%�"
input_2���������
%�"
input_3���������
%�"
input_4���������@o
%�"
input_5���������@o
p 

 
� "%�"
�
0���������@
� �
A__inference_model_1_layer_call_and_return_conditional_losses_7887�VWXNOP^_`a{|}~���
���
���
&�#
inputs/0���������o
&�#
inputs/1���������
&�#
inputs/2���������
&�#
inputs/3���������@o
&�#
inputs/4���������@o
p

 
� "%�"
�
0���������@
� �
A__inference_model_1_layer_call_and_return_conditional_losses_8243�VWXNOP^_`a{|}~���
���
���
&�#
inputs/0���������o
&�#
inputs/1���������
&�#
inputs/2���������
&�#
inputs/3���������@o
&�#
inputs/4���������@o
p 

 
� "%�"
�
0���������@
� �
&__inference_model_1_layer_call_fn_7327�VWXNOP^_`a{|}~���
���
���
%�"
input_1���������o
%�"
input_2���������
%�"
input_3���������
%�"
input_4���������@o
%�"
input_5���������@o
p

 
� "����������@�
&__inference_model_1_layer_call_fn_7422�VWXNOP^_`a{|}~���
���
���
%�"
input_1���������o
%�"
input_2���������
%�"
input_3���������
%�"
input_4���������@o
%�"
input_5���������@o
p 

 
� "����������@�
&__inference_model_1_layer_call_fn_8280�VWXNOP^_`a{|}~���
���
���
&�#
inputs/0���������o
&�#
inputs/1���������
&�#
inputs/2���������
&�#
inputs/3���������@o
&�#
inputs/4���������@o
p

 
� "����������@�
&__inference_model_1_layer_call_fn_8317�VWXNOP^_`a{|}~���
���
���
&�#
inputs/0���������o
&�#
inputs/1���������
&�#
inputs/2���������
&�#
inputs/3���������@o
&�#
inputs/4���������@o
p 

 
� "����������@�
C__inference_reshape_1_layer_call_and_return_conditional_losses_8388d3�0
)�&
$�!
inputs���������
� "-�*
#� 
0���������
� �
(__inference_reshape_1_layer_call_fn_8393W3�0
)�&
$�!
inputs���������
� " �����������
C__inference_reshape_2_layer_call_and_return_conditional_losses_8331d3�0
)�&
$�!
inputs���������@o
� "-�*
#� 
0��������� o
� �
(__inference_reshape_2_layer_call_fn_8336W3�0
)�&
$�!
inputs���������@o
� " ���������� o�
C__inference_reshape_3_layer_call_and_return_conditional_losses_8350d3�0
)�&
$�!
inputs���������@o
� "-�*
#� 
0��������� o
� �
(__inference_reshape_3_layer_call_fn_8355W3�0
)�&
$�!
inputs���������@o
� " ���������� o�
C__inference_reshape_4_layer_call_and_return_conditional_losses_9078d3�0
)�&
$�!
inputs���������@
� "-�*
#� 
0���������@
� �
(__inference_reshape_4_layer_call_fn_9083W3�0
)�&
$�!
inputs���������@
� " ����������@�
C__inference_reshape_5_layer_call_and_return_conditional_losses_9097d3�0
)�&
$�!
inputs���������@
� "-�*
#� 
0���������@
� �
(__inference_reshape_5_layer_call_fn_9102W3�0
)�&
$�!
inputs���������@
� " ����������@�
C__inference_reshape_6_layer_call_and_return_conditional_losses_9391\3�0
)�&
$�!
inputs���������@
� "%�"
�
0���������@
� {
(__inference_reshape_6_layer_call_fn_9396O3�0
)�&
$�!
inputs���������@
� "����������@�
A__inference_reshape_layer_call_and_return_conditional_losses_8369d3�0
)�&
$�!
inputs���������
� "-�*
#� 
0���������
� �
&__inference_reshape_layer_call_fn_8374W3�0
)�&
$�!
inputs���������
� " �����������
"__inference_signature_wrapper_7461�VWXNOP^_`a{|}~���
� 
���
0
input_1%�"
input_1���������o
0
input_2%�"
input_2���������
0
input_3%�"
input_3���������
0
input_4%�"
input_4���������@o
0
input_5%�"
input_5���������@o"/�,
*
lambda �
lambda���������@
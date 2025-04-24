Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C43E23644F;
	Thu, 24 Apr 2025 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497435; cv=fail; b=gNlJrSvgHP7tLmIBAS1vMdwbzAgU/9f1ddy4jm5i2TaqB71Th+H83B5+thhGmsXtqDv6Uotu3gO0z0YGEIQC+2QEwgGmE0WWH58rpy1MuvE3oYefihmXIG4Momvz016K9BYmRW65kchjbCDQJDzTFPcy/VVVABw2yeNc+X/l76k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497435; c=relaxed/simple;
	bh=2vILL2qAUNbOM9LHqFv9hSEvyQl4R2Pysl3hObI2mxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V1AW11xAq0AdHcBHl/fudV1lAhFMFedJiUFL7PgW3ytzf3nrxlDmlCLKCZbN6bx/zaummW7E8EqDwz+jDN18CVi0HcuITXb6rP63wbZnFEc88/RusK++1TtRmJR423MFzdISEQoTImP6DNDSiV4NgraTrbpyE/TsOS/8gaWMrVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O5vpYu017455;
	Thu, 24 Apr 2025 12:23:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhja9fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 12:23:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kdp6Vkdi3zS+AH2IiSA05NuCgDAHaolLBhUfC72GDO4RXxgXU6eIbqyR3DbYDK6DAlpySqtxBYLzWYb4zM/BpB3RrpqZkT1Zg4DCSVdANzIVPbX5cQ45gn61DXnad9OvDr88Ty93K7+ldZbJt2/IyiLTDMR5e+DI2z/YOQ792joPW3mhoN1Y6Bp2dL6vOX/P5VtX3eF3kuZF6ecPFJhD4yCKwVPVeSe7Sxp8bPliq2nBLLGgWj8mXwcgrp0hTLX/axIKiHTqWi+5P0pGA+/qOPmAQQMuIjR8M6K7xfKs5knHo8B0nCnQHoP9nSYCkVh0ekERqF6kOvs9VWnNwwk+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKE2l4NlbmHNjhgsYRIvABtKzjjXMx/qjWb4WeYfuXE=;
 b=txQIQ7i2R7DUBwun3MceF2odEYMFsFoDNXoCgDW73wCcmsQ6rWkAFtQF4sVBOUirZKCrM8LQ7dCEyBt47Xv8mmKPcn8HrMq4XLPjmLGT4pVRt3sQ05MKcRXfLN/XLk7JxBEx1z8BoGHIoMcHzV1eLhuSkh4l6KelRVYktQj5WHvebRRTJrwFnRtyVD8SaaWzVSQdPLW0tFlh8CR0pCW0sjKllIEGDYjbVM1Nk7yUjTJaVRTtH0BWo/R8VQfokFtD86eEJ7sTQRmJH+zWvs6bqDYUSDbDrUMd9wk3cdcDhWUIDBHXhW8ndA12LmaZIb330QOKSntOluZHF6L5mb5Rrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 12:23:27 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 12:23:27 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        festevam@gmail.com
Cc: xiaolei.wang@windriver.com, kernel@pengutronix.de,
        linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: core: release rproc->clean_table after rproc_attach() fails
Date: Thu, 24 Apr 2025 20:22:52 +0800
Message-Id: <20250424122252.2777363-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424122252.2777363-1-xiaolei.wang@windriver.com>
References: <20250424122252.2777363-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|LV3PR11MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: df0cad27-8c80-4f5e-5b76-08dd832ad09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3kS/RO8r9Tzk/4Q83N/XeHlSwrLrnuhr5VZu3tZkcxvdi0JnJCBIH/WDLog7?=
 =?us-ascii?Q?SC0ece6WnOlQ0a5q6crZ+M/kEHI18jyHq+6cw6QMBHEizgD9W5wm1sDsak9+?=
 =?us-ascii?Q?Go04sowfyGVK9+HsykXM3z2NnpjZcrCcU+zsUsZKBEN2zScvawdsXqmopePR?=
 =?us-ascii?Q?54Nlm6DnzuDPbizc3nVt2YnU9WYqcwf0sspXPZeOe+6g8yWozz5K2iarqm0Y?=
 =?us-ascii?Q?TlewjdtK8LUpj8+233+D+B4vsCf2H6TMtrr3C7nIwj/BlsClx8sWXpLS2oWc?=
 =?us-ascii?Q?qbgZ0SeYPg8tTB1HVvXwNF8ZQW3TVSfxWY4QFRnea3NSHyCOkUmnWPmS0XTc?=
 =?us-ascii?Q?LIp1AgFLYXx1xE1n9shMFLf1yiXzkiBMIHtkaJVYMAzLxRC50tb/uHtayV7f?=
 =?us-ascii?Q?l1QouNVETPu9C8+DbU4AIQQ+NljHZB4Z0o93qBSKyuTzpzLtpPnGUZ3kY/nK?=
 =?us-ascii?Q?KXLetQHn3TaPECAGtQE/UiXChcDh6Ux8y/L0yLZbuBAgn7BkWcxjDj5iPYEd?=
 =?us-ascii?Q?ibbHp1FPc0SbgbiugbIMi/LcCy6H2ofxcQThx15AsjL1HOozV9ysvjjaCc4M?=
 =?us-ascii?Q?SCD48CcDQDf2pWsfGGhrLuKzXR+j7O3dn0V/vDdgrrpkvlm0RLStYDvWcKQF?=
 =?us-ascii?Q?rgiS1V/ICQqIcPrLn6/B0Ua3VA02jaKWGzFPnLal7nEvLm3V8bbMSEhCC0+M?=
 =?us-ascii?Q?7JLfKp22248mcGV2oA7Ai5CsMFFZfwHakqUFLOefqTyIS/jUW2uav7JP3rJy?=
 =?us-ascii?Q?9GYdZSpxnkG/rloNfDZ5j7jh2phGcr8g2BVT8SPQfGzOpB0I1BgFmpr9j7Yy?=
 =?us-ascii?Q?MKgqLuaG0YOv2t0VlWqXTNaq527CXjWOCzC/ImAyq5gs37Ct9a10rEtOA41B?=
 =?us-ascii?Q?ntMPC/ey5ooowquz9uWjuJy6CgL5jqRLtv8IQikPJi8ZwuMyTvj8yIkQ8IF+?=
 =?us-ascii?Q?2O4pZ7mHudfWYh5EpWXoXsgdUhW/9H9Yf6oTH7MEIAEs4UQNFl4H6csEqtec?=
 =?us-ascii?Q?OCjaLqpSc+U0ZH2ry5C4nVPafmBIxoTGEqDLsDCBESJJsCTOqysuw9JjM3DI?=
 =?us-ascii?Q?0oTTfl9TApgU7xE/BTHrn0fBvAiHhiFumgNviFpKGIgqjm5wbPCGbvLb4EKi?=
 =?us-ascii?Q?jDy6mk3haVBfgUw0+WbZOqk6V1v9zO2eFcA4v+S7mCSv6PSmobUjKCjCfadm?=
 =?us-ascii?Q?errN/9zTQ70LaBPuywV6LBDgxIs/zLdO3uO886wc+ixdnjkoVx+qWstTvOW8?=
 =?us-ascii?Q?RQoUgIKGYuKg+/rrz1ldj70FkHIk6L9HnIOChkfsNXxzw6/rDFDe8UBtzIVz?=
 =?us-ascii?Q?8p6Vcxtaqh3+hG989VzBvQtR9yH7V+t9yJhP7thsd2cf8fKm33aSz+epay8L?=
 =?us-ascii?Q?WpiBLspYbJb/wXwKnV58u+19w8rnPZrPXQVcJHFe1GSpSyBc1n4uY3270HuE?=
 =?us-ascii?Q?rZygsFmTM7veDk7tfwHr6C1wJ4UVZDt9PMFy1V4Bge811UsxusAPZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pTTVdB3Hk1JRhZs23sQLKqYkc0UaHvXRZUp85VT6UsmVYLcus2awhBnyaZhC?=
 =?us-ascii?Q?wroNovRs41dqhdMz5bO5wZbO7S/ByOTmekyXrGVqHnP+YAxa8Fld4zXUK9kN?=
 =?us-ascii?Q?BHLskS3Audpc88Re0klKdF3od8zfvT2U9yxaibpdpnH85cdtZkdEUkKaJ32+?=
 =?us-ascii?Q?SyVOQidZunaMhYX84M2YcKQaYvwR2gCBmQg7ifgbAKcjjxydi5FqXVC4qh5b?=
 =?us-ascii?Q?EF6YsW3iEqcm1bI9cUhjKbctgPFBE5GrdukgQe/K66Y2wFFK8hh3EAuyA2nI?=
 =?us-ascii?Q?zjXIrSh88MASsr+UONnyrf2nSX7XHSdq0xaI2kF7BhcwGwHAOirbTJs91yeu?=
 =?us-ascii?Q?ERzwi/2yhVUHP83jaNdKu8VDCvTVlrtDO8qQLnQQKM9yK+281AV1N76XadX+?=
 =?us-ascii?Q?j4EJPAmWivPmT5DhIsQqZY3Jm99Y/J8rbsKdAN+yoedN+21Tu3z3/b1VF5VW?=
 =?us-ascii?Q?e5aX+A2xCOztR89KdPqWORHuPTVmIIabX28YyZm5kq/aTEh8Z8dcclw0YUDF?=
 =?us-ascii?Q?18gTEpQQvlAYObnwqw9ucWEJSU0FgILcDxhAmniilJYk56m7nrq/D1jAGIM1?=
 =?us-ascii?Q?0uOF+cXmgz//QuF6Yh5HHssD+P3XSLvW1X8lFpsVKFi0ZTTGno3qYSKqdvOv?=
 =?us-ascii?Q?THXMvF9q7X5JAW3NtvJfEpIzZshnPCdEZs9b0klnAs9DcQ2KZqPj+v1g2YSa?=
 =?us-ascii?Q?Q/jbRzJ05XSLoV8rtefQdGRsoyIzRvr/PClx6LdrhyMxSttOCniKt4966Buk?=
 =?us-ascii?Q?8WsDo7W5xWibshhG4zRb8YA4mG9bnY+pyEeaD4VnbNt+JS9d3hThfOrlE7Vg?=
 =?us-ascii?Q?CZtdPCctlDzbW4WLAM7jKHinIwgTogENODlmMObUx94IScvJsqt1zP2LKJjl?=
 =?us-ascii?Q?G1wfXEa7nZoZInqeIho8F/eqlfm7ALg+LY100DRpwwKMPQh4p3BlKts40O12?=
 =?us-ascii?Q?fM731d7JBp6X3yJbpcvEtoBv4XL6HOas8ULBom/h7SaTdDLbOpGysMRmv4g7?=
 =?us-ascii?Q?714o9oyKgxxNn2au1gID2M9Q2KGOehTfMr4BfC03p7SNl2ORjgRY6F65o+c6?=
 =?us-ascii?Q?0v0PXDWMKLjM3AfUqEkBFkCq3M1T25hOZfmZV2X5PjNk5ZnM17avBEKyWEGj?=
 =?us-ascii?Q?R6ho+bnOmI9nEgs/bix03c2StDkb1TvOZDD8qqPvvh7cR0O58Ol+A74uHuez?=
 =?us-ascii?Q?FSl4w2Zfc8tcR7WunHJ0gmjN0cqZMlQaB4ehTD3HRJDigE19judui8qRQoB5?=
 =?us-ascii?Q?SvUcjW6Bam/7PlgyfcrYwSmR5VPbctsRYq6qU5Woalplm64qm1W/0baGSBwS?=
 =?us-ascii?Q?v7PzggOJI/Gx4+pRKvW/4tHw6I0mQ5OW/c7acMiqZjYmmBDcUMqNCuV5EPjf?=
 =?us-ascii?Q?ZHoI+fmI0g6YfAOvltK1fT3XgY5wKos/r+tqeck6e/yGyZefXlQWm7M/+rG+?=
 =?us-ascii?Q?OrdbznvDH5od0GGGOXKoSAptIBU0Q7WzWYRCPHK3PX46QtaIMqDHZXZ6Iyie?=
 =?us-ascii?Q?H9aEuN18+t/07xJgdfFNy4FJKXfDa3AaPJnDdf6QM/t7T1FQgn2Bm81yrma8?=
 =?us-ascii?Q?H3MGiQ6hK0w/4CPkbRRDNN1W1nIEM33mxjSOhlLEws5zJr32HoBK/9Eq7AbB?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0cad27-8c80-4f5e-5b76-08dd832ad09e
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 12:23:27.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RI6xcZjSCaNzTpuIfh6VWf2JwiCMtwNf00v1t6fLsYRGOU3eI9J6cuebs6KhxRmclWEmO8ce5BS8hIgDljK2IFWL1Z91gnt4dFC4COj7bf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
X-Proofpoint-ORIG-GUID: eSXxWTgtnwQdvRl9pccpEMaGLoSO4EIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MyBTYWx0ZWRfX8wqVXuOPUMln v/IehYNKRAHtYnl1YKpfIw59bwKJGWQAjgBmAhwVDpPjdxtuZnA2ae5U1Z11JsGr2wGPH+uHft8 /BUod8F7v4Ub661N+6V2VDz63YtlB4CvOeaOvCgrv9fXlZqmUa6/3YHahxUmI0EjMyA0y/cj56s
 gwT0bbM3h5APvxRwd5MOkWlQhntA/YhESXeZ4cXFEiaCAEEC/SjQS5HYlw1u/Ba781tIrwDhhBf ToyUONKZaH57dJMw0ySLZAQ9yfpWwyz/cf4qhy2avyFwL2VIe1ZR0pHwtwqBq2a5Mmb+Hb7phYK HUdANdmvnIlkdzaj4OHhoTuArynRx/4AKlvxH9/ICwxjLb9s9/HSdjz4IXhhiQJ5FyQPCvRSe9S
 yCN7AgrCZWZaK2/C6oZOJ1f6M5BIJ6DnChCzMLHMk9PdADGusCyDiaCvLJygQezpuOzfaJc1
X-Authority-Analysis: v=2.4 cv=ONQn3TaB c=1 sm=1 tr=0 ts=680a2d41 cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=GwdIC4Y2Rb2A6QyvyBoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eSXxWTgtnwQdvRl9pccpEMaGLoSO4EIi
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504240083

When rproc_attach() fails release rproc->clean_table to
solve the following kmemleak:

unreferenced object 0xffff000086a99800 (size 1024):
comm "kworker/u12:3", pid 59, jiffies 4294893670 (age 121.140s)
hex dump (first 32 bytes):
00 00 00 00 00 80 00 00 00 00 00 00 00 00 10 00 ............
00 00 00 00 00 00 08 00 00 00 00 00 00 00 00 00 ............
backtrace:
 [<000000008bbe4ca8>] slab_post_alloc_hook+0x98/0x3fc
 [<000000003b8a272b>] __kmem_cache_alloc_node+0x13c/0x230
 [<000000007a507c51>] __kmalloc_node_track_caller+0x5c/0x260
 [<0000000037818dae>] kmemdup+0x34/0x60
 [<00000000610f7f57>] rproc_boot+0x35c/0x56c
 [<0000000065f8871a>] rproc_add+0x124/0x17c
 [<00000000497416ee>] imx_rproc_probe+0x4ec/0x5d4
 [<000000003bcaa37d>] platform_probe+0x68/0xd8
 [<00000000771577f9>] really_probe+0x110/0x27c
 [<00000000531fea59>] __driver_probe_device+0x78/0x12c
 [<0000000080036a04>] driver_probe_device+0x3c/0x118
 [<000000007e0bddcb>] __device_attach_driver+0xb8/0xf8
 [<000000000cf1fa33>] bus_for_each_drv+0x84/0xe4
 [<000000001a53b53e>] __device_attach+0xfc/0x18c
 [<00000000d1a2a32c>] device_initial_probe+0x14/0x20
 [<00000000d8f8b7ae>] bus_probe_device+0xb0/0xb4
 unreferenced object 0xffff0000864c9690 (size 16):

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b21eedefff87..6226e2d12a97 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1656,6 +1656,7 @@ static int rproc_attach(struct rproc *rproc)
 unprepare_device:
 	/* release HW resources if needed */
 	rproc_unprepare_device(rproc);
+	kfree(rproc->clean_table);
 disable_iommu:
 	rproc_disable_iommu(rproc);
 	return ret;
-- 
2.25.1


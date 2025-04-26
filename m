Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EAE1E7C3B;
	Sat, 26 Apr 2025 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745650469; cv=fail; b=MKWbF9Uh6RORehcQj9IxSkb/Ss2jgmLO258mxvJPCY7SWZF3pxsh8+Q8pdj2Be+VSuOVvxim44BNVpsd/xQ4eMM9ZdxQJZnMM/C/0HHwzGAuMcEaDL/cRIvRUWHoXh6RX+oWer9ApMNTaLtglD+5ij2XnTeK0RKbm6utUBreXek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745650469; c=relaxed/simple;
	bh=aFgKAE3MWaezGBr1UCbu8qwG7wKn2j67klVkv91He+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HAATcMkhltgi6woaXcXDcyOByelu3olF1MWKIjsnDELnRkjjf6EGJN1zXhVMwnrh+NQUXT8642Cdbk/deJM6bbH+bf+vZtSurwLh8KiTxw5Kw6cjEWaa+PepDZ3SVg2wVeVr2P2W5odIxev1xHi8eoNeV6ASMyWW7tBWqrj9ldA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q6oW7h014298;
	Sat, 26 Apr 2025 06:54:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1883g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 06:54:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cucn41Un3CIB58Yazg0epW65GUwvmSFvvUUAVc6JAeEbQotWgVfCbRPlXaYORUG+/RQ3aWIelCpojXz20hPwbwM0mN+H+cCHk1KDmUJyeO4GW2M2DR2GplZtHESUVZvQI10hvVvYM+iiQfJpFuRg3bWjp/wU8fWHuBml5hIg1vxDNTG69moy1hwFxkc4NTW4aKqMW+EhbW2Ah2Qdv5183TsVT7LD3vu8uJrG6N4a244bBNdyfYrf0CZVd0wd8VNEO8JEhmTFXBw3u30YxO2V1EGFnGQzDkPQUAufdx9nT9O3T+Q22MvtTcJeiEprCyX0Kv9cr/wsYC/juJzUlJm+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/qlR4YjA82la5xl7VE/ArojQzSRwYtU888jK7QnczQ=;
 b=tHIuRifjkGDW3emvnxGrHalE9rFfj+ncuhFQ/jZo8naaDJN9ppUspFYxNCB/HrY6FiteU/cme+5mijzJ9Pvj6WZUAE02GaCDMEKELjKrRUcC2UKAQWgonKtpU6iUn3N/ZDMYifI5t4+WFMGs+bMECyqe3OxmtegThNJFONDKtJb9Lq+9sONj2sylt8ixZ2ArpI09zuF8Ay0X1tHzW/abzuRQrL0Aib7AT/2HLWIdaOqAT7jSy7OPqZ/wXfTOO74RgZE/c3E9a4e9IARJOb01M/zk2uAK5mdDXTGASog8guNK/8J9Ou7JdJEJKKKKOzDKVh1ZwOx9mDFFH/tZeyL/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 06:54:14 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 06:54:14 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        xiaolei.wang@windriver.com
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] remoteproc: core: release rproc->clean_table after rproc_attach() fails
Date: Sat, 26 Apr 2025 14:53:48 +0800
Message-Id: <20250426065348.1234391-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd221ff-2a35-4ed6-1a76-08dd848f27fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s7wISi3ZtoCgfJiHsziscDVfWsKJ+J7rp3esUQdQi8Pe37PT7W2Ekr3NsZc5?=
 =?us-ascii?Q?OBorHEDfe+xRCyTJj8eSHVwgtqjsSq4A7ux5ZKIk1NxiQkJ57mG2jtyA7UxY?=
 =?us-ascii?Q?1aPqaEjsXDIijWPLdXyYkFu+1+Q1nkHhdp6iAYMxeTvQnd3xnmwjAJVOlXwj?=
 =?us-ascii?Q?cbDufGLQs0QERBzfjxXZDCy2XKhQ1mxhpFiuXiOc2TFzkUUjPT2FGnvtAkNV?=
 =?us-ascii?Q?ztgD911bj2u5FqKhgYfeUtHMy8nQhrkWs95DM88NdXtecTFM/+VYBw5Y7xhY?=
 =?us-ascii?Q?IdisSI7lD5ggbY6Op0wuTE4pkKCdFKK00rorDFd76vtthpZfXXxMadHHWGUH?=
 =?us-ascii?Q?MVmUHgu5vR7m8PabGWPD7XLqY8NtSocorlj8g4HpdJ07sWAzq5NUkN0uAE+y?=
 =?us-ascii?Q?V+tPvUREW2LalwOEW4NDe1GG12uPJArkzK+wntDdsk2zRRQrYtvKY4Iql3tG?=
 =?us-ascii?Q?CVolg9zA+9fdgf6l6sbmoKFKy9VXvKkjhejgiT6ukMwIdzlX0o19lM3i3UQv?=
 =?us-ascii?Q?b8ny8hfTS4/fY/9uehW0DyLVzQhXCL3Hqn76i0Sb+I/D/bIg/M6eZ7e+Dtsr?=
 =?us-ascii?Q?tTE7I3Aa/8bRrIAlbk5o32M+Z/q/wBHFta1YqP6MxolKaN4TZjeAJ24+qlkm?=
 =?us-ascii?Q?w+xObuas7EQfr1GpsQMNKFpjOFxCQ330jXvvsOf5/rVNEf6pXZS5uUcIDvjQ?=
 =?us-ascii?Q?4Dq0AUp3prEK9xDJk60zzFLoBuRS51bC6d3rqRzpJnCIVyrO/3fokCDDuQoX?=
 =?us-ascii?Q?ddg4XJ+8R1+AHfOQLjpfoS/Mpw6k1zw8C0PowDxara/9iN7J5G5n7IJDiJci?=
 =?us-ascii?Q?YBAGIeAUTH0+lbshJia6dn/A1JdFzZnwVfugvhX+H5OT/qN8FzA8NZBMTcKg?=
 =?us-ascii?Q?toipk642rmKe+h4XUhKyPDBRlL79uUHf50fcNVqD8L0C/7sO+ECtfBXps8Pg?=
 =?us-ascii?Q?UuElC3CBTGbgjOELP6CfNHWrIQsCMfMj9/3sBg46KfbMhqTBKQx2lTK8X+pA?=
 =?us-ascii?Q?Mp7rlO2LG/Sv6SWW0gJmsQt3HIXJJ/nNm+oM9vwT+mafGBEIXqSoaDdnjTN2?=
 =?us-ascii?Q?YTH2dMXsrhuJ6lyq4AVJFSVl64qikRDkpuNv0gpLZbNTDUPCT66QvN7mr47B?=
 =?us-ascii?Q?L0b2RI0Symsnk0C7PBDHwvKsohDzrrcKWdWDImwyhaWQ/rul8GZpgW0lavaw?=
 =?us-ascii?Q?BNhhunzd2gJk1DyJOPNl6i8LRVqGPQHQGIhgU8KVCACK3qQ9DfxuI96L4BF8?=
 =?us-ascii?Q?vFbO+AdswVq069TKEPY4XJmTKcagTzaImOTDUCYpxwwsyKJY2ysanh3s1ABh?=
 =?us-ascii?Q?PZnTzkiOJmIy2TCawx1TgkklcLBtm3iSOXy+zEMch1hS6xzKckE3dGgWmlvE?=
 =?us-ascii?Q?odp86mJlfY6nrvazX4384fPwVwXfk8JQVyB4SMK7y9bR4NfXe5N12GRjJRH7?=
 =?us-ascii?Q?A2nHlI84ARMjSh5wcwVxqBxFpJJDRIGJ7mMRlQ7qL446C8bsAah3uA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Slo/vxMb/LMhm/avCOsM3aO6Byj8zNxVN7ZEn8AgDAhKxkdkllywjMCUmPiQ?=
 =?us-ascii?Q?CCxgHSN00MJXme6Ug3IUBdqOXdqgDeqf838FmjlPndvKOkMFSHHOFcPLUPfM?=
 =?us-ascii?Q?Iw5sx7lpHDH13NoQyT6qG+empeUDVxveTuinBlNrzNe1TEyFermIPJagd3Hz?=
 =?us-ascii?Q?2IrFBgZ0rGFb84AwJrBcToM4Vye+G/F6eb7KCuIcSx4w8E6giNlT4772QfV2?=
 =?us-ascii?Q?WzmKn6m1JmgMgDn06C/gPB4iC5H4352wgRuPJJYbUKM4O8C3x9vGCs9JSQmM?=
 =?us-ascii?Q?EkQ3eZo9G+HN21t11ntHAIvtXz1uRSKxnxFY8IWk2BURg7Ka5Dc5Ah6S/Iyv?=
 =?us-ascii?Q?ltme2Lci49GV7vr8/dgfS1UgHUU/UZucNgaK+qzEuK1VyccFPXLmOU/dfMeC?=
 =?us-ascii?Q?urrFsfY1szT59L1aJyPjrkVvFszJ/ob3hbYF7Fa5oCMkuKrlq/eXv6VqZpZr?=
 =?us-ascii?Q?Y7Zw8jgQ5I3A4lWlnB/MKhu76TT8lRj3PJ4Ft7WSdRlAx6/EBxq4hgsjKXyr?=
 =?us-ascii?Q?n/dQCQiGsYrWR3UdmYPrmdHXlOcLt6G2IfQgpnTf/vujoYcJnVoaoTzqHjgu?=
 =?us-ascii?Q?f0aNsDa0BDPJlQnBuEm0Qd0UCjqhgzOh7mPsl6vIHOXSDW5erioO8sHdaAFc?=
 =?us-ascii?Q?3kWC8Z8oMKDT1+mOMTqj2Co+P9D3z9MgloKDITnbS3KmPau0q2r25FGSl+Gr?=
 =?us-ascii?Q?6h4igsV3P9yTrhHDeYExjnUTFmcTRiN9TQaRWMaM7lmC8ONUZr6OyaxQExZi?=
 =?us-ascii?Q?Z3qCU5llO0kXVcmkHztWKLeYyggUjH3VPXq5T1O1RQaft7ojBmzwaCATVyrr?=
 =?us-ascii?Q?44PxmPu7+ihwQuoirD6sDpDCO8QUvy3ErPQl+qLbvml5n+bBt4deHih6z22G?=
 =?us-ascii?Q?W9gqRh/Tm8ApeQKALIOS27dcfJIOvJj0GwD+t31Ff/yer/9BtUrQ8gqgSocA?=
 =?us-ascii?Q?64plAfYFaxi+95lqPkFADq7N4TfO/kZEkTwjC36wkWEg4N6xVrcxS/C1wp2s?=
 =?us-ascii?Q?y26wQ27KBrftBLWWAUzB6PkTvtCGN64U0OUu5VAQIwHWqoZ2A19EFj5Y+S63?=
 =?us-ascii?Q?btvF4WNXbwTroTfkUfod1z11P7DQhhBQvA5zClsMLSduLUrzAjS+fawokLkz?=
 =?us-ascii?Q?mXSL2xrQav+voMC7uX5gMUxYjsivSmLY3USU/YYrIwD7amr5oNHuuf+wUJNR?=
 =?us-ascii?Q?qszz4lJMJSTdd3o9aGiMQa+hYDV76S1U0YaHCQnLr2TUWFq1E3QPtOSmOJNH?=
 =?us-ascii?Q?MI45pAZ/4Q8F3gUxYx7JQxwF2AHBo7EE2RN3el4F1yivMtMndp5JsPLWwVGP?=
 =?us-ascii?Q?/oyuSgpIRrXP225yJyG4ioHhvFD90uePkzJEkQcYNNCLnZQXdY1zv8rUE5PB?=
 =?us-ascii?Q?kIdu2CXMQvVnJJIGhNTjHkkiKVsWQHNLMk3GhwObLcDlxh/o/Fam7vERzUna?=
 =?us-ascii?Q?FC91qQFP8hWU0ZnYmvfG8Nz4eTz3Z0jUOFyl41YvBA8Z44sZ/TIb+HmfHu6y?=
 =?us-ascii?Q?dG1ZySMkIiM7W8Z4lBw3NdfEN5+Be/Qbr3pn97ikCc+WFGW1opOGkcItqWRj?=
 =?us-ascii?Q?xN1IxO+RFPhVWWke1IAaUj1/we7ykSgGs1+tgnFGLlUijFBYRcItZweD78dv?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd221ff-2a35-4ed6-1a76-08dd848f27fd
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 06:54:14.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZe9iKE0hYludlBNJ8lqQsozCb8maeuFEe5MQ2ytYlTGEIYaAqmfAJNqBibSXLxwIpo+kT5eudPES2Mwyd3wJEFrIxhkuprAhapAi+P8MHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680c8318 cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=_-TifzoAuyXSqXD3PkIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6UZXxfFYfXGylpAxdWhBs9Ci8N1DaR3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA0MSBTYWx0ZWRfXxpC0KFXPVQ9R xUVyHVrTd+USwoEhBfFrKgWdbF/lVoHzn88umhWP+Aj8Xyag0ljinyNIxsCSRlmlJujxIP6Il63 8S73ke22PNm8yJvb/Yf2sJQLwLpznz3lX812XgFjwm4QPg3U6TY/OPXdtwei1VQqkoL537cmRcC
 f3t3l4YJLlcfl2tKnIS2qaC4ZyZ7nh83Xg7TsU7Jx0U/ybfHZRGC0/rUwb3qSCTX/Dd3tIt/Zc4 vbQBf0K4agcT6pAvi6jllS+hODHvenRxg4+pnjaHiyvm+26k4b01/clcfFZxMelT2jPPorTUQ7x MjsbZw1LEmK9uniGTtl69wnGILVhISLYxz59nLoTYd7C323I8TzIv1Vw/XiBtI0UNaei9/vV0+J
 1UgBb0GPhBgcIqbCbiendAcg5RKBosqUtHC+R8Ytw0LJRkVWUka5F3Eta7PGFHLC5CCbR+95
X-Proofpoint-GUID: 6UZXxfFYfXGylpAxdWhBs9Ci8N1DaR3A
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504260041

When rproc->state = RPROC_DETACHED is attached to remote processor
through rproc_attach(), if rproc_handle_resources() returns failure,
then the clean table should be released, otherwise the following
memory leak will occur.

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


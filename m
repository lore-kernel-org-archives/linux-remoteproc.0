Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C661E3DFD;
	Sat, 26 Apr 2025 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745650468; cv=fail; b=cLv0RS7TL8gzbIQ1j80arD67AcEqxzypKNBjZUBWgZQlqkoIN/CExPlgiCZWtVTkVWQsx7AV1x89r2sL8ao0Pf+78m1umW2vGw3EwVEKFmR9bYM6EtRiKbWIZPdgwYCN26y/2Qr419kiIkiqhkQoovhpt3z4pw1RMiwALe5WKJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745650468; c=relaxed/simple;
	bh=TIH77YRglfKX57iDSGpfR0aRPJ7YlgNzeoDiBodGCdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vw7Mo/7aua83AKXeqV1Ogy8rCgJGt+XN3KijHkRfB7y4l1Q7eqeU0x2GgT0fJ+NG3/iXdMl25ACTdp40fOeK3Ic0eH0LY3X6ZmMUsLy+5NbPbYygXmNyF8yDSsfae3CNROUKYX2dk3nZfsxzmorv/os0zKlB2ahTRWSL/hrgT2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q5vQPc013528;
	Sat, 26 Apr 2025 06:54:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf9068w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 06:54:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlEMgiafI5u/T0V8K5E/0T1D9IFpHVEfTGnAy5jWh7f6F5xpK5CPC4u83OeZ0CwCY/k33Br9n86cd/UE4lgzoGm81Zpdqf7Dc1nGH/579AlnNCj+0rNVpnG6Tzt/R5JSMeU7HFFvtdfOA5HVU0qzD2wAPPTdckJSSm/8qTgRupphlhSlBUpp7OiIfEHCpBx6MkVNdLv8owAHraMxbjXPX3TSkaWqlFaaGxo5li1glXmmcP1tCgNmUlk56FPpSwxI9nFwJCA4JoXN/hZFyhFPMWjCOQk5DkpwbDdLZvWl8UggTqJ4oa3PNhS6M/e8Fnsayns0T+LAK4Vk0IIZ+s6Jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG2rc4MLLkUTrTlcRuyaGLcKXu3OpR0nD4xOU3G3ZsY=;
 b=uAJKDzAWtccgwrDAFQCq8jmQ9TLnpMl+4Ha94IhplR4dPsTUXgHg/ftS8j4qQ8w92ka75WvAWeDGL0j5sD1iL4vRuWXQZ6K7Rhk0E1VRbFJO2DGyBovQsm6QoByDm6IKzeTk7Rsr/bw15IM+1VaCXnz7GGL4DJl0QM9s7DdJcT4Ppf/QeCBxUvlDkk+eyEXBYggAhuWy8sIJc4ma1qx1fwxbTSq6GNHCyUz7E0BBnH9seiap3jMNUO8E+Xgu5O7F8TMfYotRUmg8jS4wv8fwVUSPsLWJQhD8qUAuXtBd784rkJoisHJhF4MYzBSURnm75EnzNqUH/p8AmjkEuly+Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 06:54:11 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 06:54:11 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        xiaolei.wang@windriver.com
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under imx_rproc after rproc_attach() fails
Date: Sat, 26 Apr 2025 14:53:47 +0800
Message-Id: <20250426065348.1234391-2-xiaolei.wang@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: cf2b4595-4fdd-4231-5552-08dd848f264a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DZfg6v3phIEkceBhltaP1EcQe9cmwV5ZqJh5zQneoLhuILbSxXv2QEaZNt0R?=
 =?us-ascii?Q?zqr6YLbe2c49fuovV+KvvJRpFUELPNKl3KuS+WkKNGDp+hf86zYkavoASMv1?=
 =?us-ascii?Q?6NvMBc7KDcsQkIdr9X4qOCnGa/NnfiLZK7PTYZwScpgFCwIvzeiVCYThkO30?=
 =?us-ascii?Q?tvx9uUMsBLT4+dqR4s+1u5B1NNV/b7SI2QOXFv/CEqwYVpxcfLxhRYJxkYX9?=
 =?us-ascii?Q?h89GGMJZyxMTJWjV4V2I9v0VmtbREqyIgLXf1bv5gJqwK5SkF3L0b++k8+1Y?=
 =?us-ascii?Q?AI1fhn7ePd8RRNRWtPIulZWxzVDxpwfcmPcQ4+1Tb/pJmKxteU2dS1/yGGt+?=
 =?us-ascii?Q?LeNLZ73VacNx5asIV7tdllGdtfkQgzimM+jJFd5ED4pyY8SajnBfWbtM31fm?=
 =?us-ascii?Q?thrKGbXq29pLB5TVF9LM9CkJfTwE7oW5renRWJ+KVo4Zq6B2Q4sBon9xago1?=
 =?us-ascii?Q?P46kmnO4zQ5l4NYwsze8S08R5AJ48AUB405P/r/d9Jm/TjYApPCD6EOGEpge?=
 =?us-ascii?Q?6EpDA4tp8OTfWIYNVZKgrdRrFupR/ZHdCk93P7Dtc/1rqWenyFYT8zGp4Tv8?=
 =?us-ascii?Q?+c7S5hMOHRCg6QydMwm5MOinCbSKkXIhcY75kc+lfP5QnT7LXNobXefAQCxB?=
 =?us-ascii?Q?Z5uFChF+Oi1I7hEoa/dAMlRHBPdmP85QMpTkFb7R/IKUAuh4XTeqHJknTrmC?=
 =?us-ascii?Q?ycAnaJwtjrCAuprZgy43JXndmRMpDZmsF/KbhCWtXbQIelrOHFPQtHl5vg6B?=
 =?us-ascii?Q?5AOocMw3UDdxvs7va8OYalq9WXcsRNlsy8P9Oj50iFwZTrsi/zkHKwfTNYSd?=
 =?us-ascii?Q?1KaZprPx5gdbfspmpz5QEpXwIWLJ/JVn+3s6Hay/LNeKzWEF4mAJYOn1Uthw?=
 =?us-ascii?Q?/F1U0+/iGmyOltje4EyV3km+p/Ef+daDRnPDeX+Nrz/DEfPCRfvie5nnY7Cd?=
 =?us-ascii?Q?H5kiw+HD2h+FIDVH5NPmtI04YCVX/3vP0NgVoMuiuTYwCSfSjNlyGhVaflX4?=
 =?us-ascii?Q?q1nT3RCEIHIFO6MTJBf6K8fO2Z1fHuFIRXiSRdbdRRCeO44OR4nML4B/2pgg?=
 =?us-ascii?Q?u96VTcNfxBMPWpy0OW6qeSJ9dHqIySsaF20mQ4/eYKlFkWvp2wUJ24DApcOM?=
 =?us-ascii?Q?fuUok4Wycqk0rjyIKUoXZeTVCPAqWNrrTIO1/RU6nTrJgadEBEAhomAoRxUz?=
 =?us-ascii?Q?KXsuiRWAovo+CSYSdgcJnrOUqOt98K+PlhsZf4r7f8x6JEuwTbrnbXl5Ujae?=
 =?us-ascii?Q?f3VpawU/bpNWhrADY6TXWVhDRmcM+HTbKdtAAQ18Bj1Z+lKayVwu2FNCuZb1?=
 =?us-ascii?Q?TcgM+Ugyc8mRpo4gIwBrF0kEKdi0nEbh4ZCSi/xbeIx/cUHK4dQr+shI9FcK?=
 =?us-ascii?Q?jvmJ3mQtyk2P5uC5q1ogs0upyJlocpTnz8stXJit4+dSNGvkqs6yTEfeuO4l?=
 =?us-ascii?Q?WX8GhNzwwgAZbZTDPUealhJ1zVp8lngUXqRW9PPn8fE+bkeS47yspg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R5/i3UI0pTFzDDSY+PwvbAEKNXAMkzFSWB27zfgwL8l40QC1msSoDEsa0ev2?=
 =?us-ascii?Q?1LUYW77KjJis8JCduhTooLxFuMyI32asJOVwRWQnmWzVD/1K+tLFaZ9fN9eE?=
 =?us-ascii?Q?rlxtzSid/hztT6JD/HfiRfuerNX4/KonscI4iHFDuLaWNKqKthGKK/mrIJt0?=
 =?us-ascii?Q?URiWQH32LaAeFOm1STX3+w/Sd0388sqVCoV7Geab2Y0kjdW8MfI0du7pBB/h?=
 =?us-ascii?Q?q7pq0sh16pZAMbTss+VfcBWIOWsKfcZOBPmMFsCLCUtVEpO7ZhbCy1sxl6f7?=
 =?us-ascii?Q?+jvzO1Q77OESF6dGdc+c1yl+a+YMGzLTtKsSAlKTlb2T1Kj4zyavhdzBz4uF?=
 =?us-ascii?Q?Kk6e2IzfqhhSFmiNT/tVpMWJru1Q/ysqxA/RBg37kMqSa3/c1iCIr9ds5BfY?=
 =?us-ascii?Q?m7x69O4ynRKtXeOBG371hFJFflcxLolYBVtBwSEttfwsukYJh6chG+QKIyk5?=
 =?us-ascii?Q?FlVUlu98vyjxuGYvNbmbC6H5Ba3CJynx5tkaYf7iE4tomUc+oyIK8tLJBkxq?=
 =?us-ascii?Q?JDd6o4hsVKHk+H9czwRpnvwHz4YfT8VXtjK1m5G9HA2t/RGc7t5SWvkdCjoJ?=
 =?us-ascii?Q?6XUznnujrBvLhvLji5OqyNvbpTbXYQxsd5dL/hCQusR97uYXBR5Ov4drI1Cn?=
 =?us-ascii?Q?2OHwJ4z9E1UMcy65qSG6w2XLEMr4msr/RxNua9zISoeRiCQF2gluiOQR8rS1?=
 =?us-ascii?Q?+CuQK25WPisgnrYg+Un2SCYwM7eyaRJZYrvmrRdWM2j5ZS1ohLdjrjvTQfLc?=
 =?us-ascii?Q?orERGJYJnN1SbgcGA7vU05+6cMySFqm+h/h37jNbWZN1TX/LuR8Q8xxgcbu3?=
 =?us-ascii?Q?LH1+T5Xa12g0tEVbrHH3F8iSc7K1U52yuV6fOipJ/U6zkUhhVJtPckTqTs4G?=
 =?us-ascii?Q?SgTr9AdCR89Y5ODTnww5MOO7Fd5h/rGKSaNFhUrPplU4y2gY/zpzHONtwWHn?=
 =?us-ascii?Q?eOllsa/+vY/5R1JF9Hey7/+PCS5EitxH5N+HdbNmsKbB7ifa+k+29rhQP8kA?=
 =?us-ascii?Q?z3BESUC2rxVBZtxiRWGhBBugrpKdQj0O9+WOvgrcfBlGG6MHMdPTH9496G0d?=
 =?us-ascii?Q?4IH5ScoeBBk/C2BOHGKTL2UI27kkvRLh0cMgLQzsVCA5msEQMRVSrIHKU4VC?=
 =?us-ascii?Q?eA9xsusVk7YO06xoHB45oXZRDGO+nAIR5Orm+JSACJJp4SU7VzgVxAYTiYoy?=
 =?us-ascii?Q?2GLUiCMT48xHqonxk/HOb+hFJtDq6pss3UwJlpdI5kKhi9YHblbDa3eQO/+d?=
 =?us-ascii?Q?WeHNNmagvURUun+T0z8sBrjNUHPHLygR58zLXdkEaQOzmEBDMoHDtITa0xcx?=
 =?us-ascii?Q?83f/V7gKilLp+LyIBoGz85DBjnDeA68ZccCtIuTUpRu35E3R2Nm0D5Si2B8I?=
 =?us-ascii?Q?TQb3vTd9JnDcNw03hybFLb7IiTwkXag+bD2IFSfR5dA1R575KWTEij9KYHCH?=
 =?us-ascii?Q?Nu9Wqt2eDZM8FcF0Qr0/YqPrdM5BOKyzHJ1+Befuu44Eci1h0iChiGqa6G3y?=
 =?us-ascii?Q?DRc3BuSx5KXc5SWQWiTpl+JmETckVHfEwrzxkYipqizln5wBCHQ8JqcMi36x?=
 =?us-ascii?Q?U9+M6bBbOqEKYA3FP9iBsV92hZa24bgOxN9RMae5CG/MGekWR7r0MUdquLOD?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2b4595-4fdd-4231-5552-08dd848f264a
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 06:54:11.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NWXjh41mn37EUdrFahrxDjpEx0Rn1Nz8xLR7bQoHOG5lfndfljIc1EpN7NGWPovUSZxkrHBfowrMmti8IjRtW2GKQ5dHUwf9AqP5OEC6w0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
X-Proofpoint-GUID: MHxtKRAnlcu-Rw6S0vyzbVia__g1p83K
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680c8315 cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=PFr4G2WbsretGfnwE2UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA0MSBTYWx0ZWRfX3Bb2vu1Hr0jr ZtOjl1g4KNXmMSYp92CQHa9erXfpi0QFZYnWT5E8ac8UEwQBK4fgV1L+kSqZI+QS593mUTk/KjY LMLjDJn+a3VQR5caGniRLVdTEmrk3hkpjcf3zP1ja283qaHIyqlEUeX19sGcMt9BXCKTrjvKBnV
 hpr/wdPClPlXjmPPpwDhmpfHl5+oCXW+T8gMcnCtHjLSSy+OtJGfgVvmQExEbq30PzZ7w1+6OTi rKHskI/KuQaEeXmR6Kjo8D5vcj5FmbUwUFLYuSqUZCwN9cNw0iKpBcZf8caikEJzmhdFgJQWfNR pvepUHTCPW4oCVA7jEPz2f1KlOdBcvqKyXXqbSSQAz/H/q8Naw4RhZyA30yGg6Ea791ZZ9WZ0HR
 dO2+Hnc87ZGdr3ytpXY1JxMvgcUht+Qjb/tPVd+2QGLSbHvY0ewfPc2q+XHeH5n6qLLYn9iK
X-Proofpoint-ORIG-GUID: MHxtKRAnlcu-Rw6S0vyzbVia__g1p83K
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504260041

When rproc->state = RPROC_DETACHED and rproc_attach() is used
to attach to the remote processor, if rproc_handle_resources()
returns a failure, the resources allocated by rproc_prepare_device()
should be released, otherwise the following memory leak will occur.

Therefore, add imx_rproc_unprepare() to imx_rproc to release the
memory allocated in imx_rproc_prepare().

unreferenced object 0xffff0000861c5d00 (size 128):
comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
hex dump (first 32 bytes):
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
backtrace:
 [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
 [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
 [<00000000521c0345>] kmalloc_trace+0x40/0x158
 [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
 [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
 [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
 [<00000000e7e994ac>] rproc_add+0x124/0x17c
 [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
 [<00000000efc298a1>] platform_probe+0x68/0xd8
 [<00000000110be6fe>] really_probe+0x110/0x27c
 [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
 [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
 [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
 [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
 [<00000000db3eb243>] __device_attach+0xfc/0x18c
 [<0000000072e4e1a4>] device_initial_probe+0x14/0x20

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..c489bd15ee91 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
 	return  0;
 }
 
+static int imx_rproc_unprepare(struct rproc *rproc)
+{
+	struct rproc_mem_entry *entry, *tmp;
+
+	rproc_coredump_cleanup(rproc);
+	/* clean up carveout allocations */
+	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
+		list_del(&entry->node);
+		kfree(entry);
+	}
+	return  0;
+}
+
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
 	int ret;
@@ -675,6 +688,7 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
 
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
+	.unprepare	= imx_rproc_unprepare,
 	.attach		= imx_rproc_attach,
 	.detach		= imx_rproc_detach,
 	.start		= imx_rproc_start,
-- 
2.25.1


Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8A52B9A8;
	Wed, 30 Apr 2025 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004889; cv=fail; b=I/BRXFKkkCFP8pGCDRTW1VNckcI272koPoKhubAnBV2R+NzTrKt1Nc88H4kED1do2UgRjKX2Aqp9NOWUXHNbSuMRSpv1A5ck4Fi6n0KRqnzGLy3sQBNV9i/dgrFpS6VDor+6/OMVS0p8aL2iYftt0vsu1uFFGZYq7VV1PJOPavE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004889; c=relaxed/simple;
	bh=UQyzASrkXgY3JneIC0bCsn0I0R4CWTwNgEg8LcMmeis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VU2Nl4j3uZQ/cQ4vfpiAf+3ozZx0PskXhoS+ki5qti9mlAHZ/vI6ZPIH5cWud4hu1W4141kcJ9i0NjBQzPCEg241Lo8uudte/ztotO1W5VBsxqqeksdF1gT3ZZhnxWDwSJVGPcfCfZVcVKdrNm/2jFPiCTKBGmhk/69lW7cnmD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U4Rne4024093;
	Wed, 30 Apr 2025 02:21:08 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ugrjyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 02:21:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FribphmgklcjxuoS/2KyyOH4zfRjByqPHa6g9hkmSOhGs9QthZBeszYTZuvjZM0kCqDMziARQaHJDF6986kV5Mk4gCrOBMlQTRwAIYXiQRWcXymckAq0nYWUtzHHYodQIKdw7dAGjPuYsdSsUGBi+LCVV9vvS0KpoGAy90dH/MukzW2axk6bl0UoRhbcBFbjXVRnVtTPVpoRwz4W99P+oiq5wN3bB8HbWoa1AVRjM39fu9ERFsRxhDg6ViBm+cok/SXBN0yH47nalA8opsjT5GLOZvEenxKLpD7VWp0ZSHQ+gZIxKtGku8zFVB8RbhI8oqQlrS5lslyXKZCLxfyoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3I0fSQAovM0FV4dHh9ee3gg/jKD9V7VGMKu4BkiqXQ=;
 b=PiKxU7Cxp9/zLAFWN/VGUt1NtEoZu2bR4v7uQreGD/iPBqOy5/0uaCkxsTLvjuiuxDj14jUXlTCEVoIowgUrUmP+PrHmvMUFYt6A1RhRRxSsGZzsFYRDIWLRrb3/TzcySu+tH/3XQfaY8BcED02d3r9MP3gGQMjpN6D2ev8cj3w57zx5ddzmwSE6eCCBDI/Ekf0xK6Yul30vXjgI2iJZxejoBU23dLwvjKj/go6CqtKQEYOsqrqFCIrTkpofxrSIL13oeH/DW9Nhp7tC/Or5E7JEF4Bm6XqMn4nrKSNMMHB6jp5EnNCGgbqaiRSNFkLoEY7TSQEKkldVwQxJ7CXLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 09:21:06 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Wed, 30 Apr 2025
 09:21:05 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] remoteproc: core: release rproc->clean_table after rproc_attach() fails
Date: Wed, 30 Apr 2025 17:20:43 +0800
Message-Id: <20250430092043.1819308-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
References: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::14) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|DM6PR11MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: c26170e1-9199-46d7-8c51-08dd87c855a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZpHunrxkjfYXk7jviLEYPjmWwdZq4+Q+J9dFpw1AoEAlJ3Jeznjzino+/PYB?=
 =?us-ascii?Q?6DNVl420vxGkZIJ2ph9IyiwrdxdtvtRfEKFX/4cx4jyw4e/N0AKui7QxXWn0?=
 =?us-ascii?Q?Vcbw2S60+K44uF9DxWTxQAhPgWTYZjne3iAZJsoNCK7Beg7PCyi5aR0bNQlJ?=
 =?us-ascii?Q?RzjMMFRRtnU67WtQcO/1JU5yC+gnmU/TuFvKgD4l0jriuW6l1gQPjN5yMecE?=
 =?us-ascii?Q?12j7R9Q0C75YsyHTrZ1B/oV+ztnsYUiBBTWgFPGBMQ6v83nlXuSNGtAHNuJy?=
 =?us-ascii?Q?MdPp0VdRxPMnfL183zPt2+qIfJgUO9xzr4H/+vB+KFDfhtOHIIa3aUuYc1/h?=
 =?us-ascii?Q?kpxBqp6J26MMSaYrSZp6BIHQGqT6BoSSfNZmCRyHdfNg2feafD4nEiFpGBgw?=
 =?us-ascii?Q?ChnRVA+M9NTJ8C3NCZ6BmCxWRxsM9EIJF0Ckex+8BVvnN+rbKKL5g6sruBCM?=
 =?us-ascii?Q?pAcw9Qs0CoecSbLWXiIZsZjkbBllQCtm8sCSERpKLrDzzh6SWGVduqzqTr+R?=
 =?us-ascii?Q?QPOf5+OELbMpsqVHrxdrJiETAlYEbMWsvPODM3/LXWECsBE+45uDPNmSh9sF?=
 =?us-ascii?Q?57zCOajtW3jjcw1/zJtGKtGaDqIvO1hAsHYoHW9bFjG78X+jgvK68tQOhfND?=
 =?us-ascii?Q?Dmu0J738gWrLpzaiUNHNkFO1tqds3AehtzSqsmgN0Yx9VM2VWZlQ6xkkSOAY?=
 =?us-ascii?Q?32Jo488U3GE051/WGtPz3AaMtuV8bTt/y6TLywoVwvLFTyuU7DmdwUct8BWg?=
 =?us-ascii?Q?quS2fgsl5pkBN1xYiIiebKTvFNO/WRxlGk/QrMNODqsU7VSL7lPq6SJKvGzJ?=
 =?us-ascii?Q?mSugu8DUWuZ6uyEr3SyRCfDZNvuA5WxXQ8cfE4qyX1ig4YPqumf5K31VsXeC?=
 =?us-ascii?Q?1SNOm56d1VAyhuwQwPh6TnI5JNnpYGu/RnKJGgLajL6duLdbMlwkpGs69aDZ?=
 =?us-ascii?Q?8ukyhwEDoZyUbeG9Id3bEONH9JLzgsz/6fc9XSDDydwNpUHqI9/9DtOk8M4Q?=
 =?us-ascii?Q?7h0Bof0Wp03sEsLLg9gFt8YitaVxbam2WfI6DWL0NUmdNzFTuFnZzt3w0PP9?=
 =?us-ascii?Q?Rsm16ORfhgpwXMm5cNbQFfnsX0yFt/N9l+1wJOSitj+3qyQ5tkQQBdIP4Frz?=
 =?us-ascii?Q?IjKWqljwCfbrcjlC+4Gy1KQ1tyoFRPaI4kPVwA3D6fPkhLVSiU8+cB/DMvXz?=
 =?us-ascii?Q?eKkNEx1iRr8jVz8TJno1Xfqu0OJy8/NwEJW+6xyXZU23wZUmSmcNwuWqYTF6?=
 =?us-ascii?Q?tcQCKIz7tdOt/A/thwjuR272c/e9O2mEKKTWRiOrz6KaCyZiBQ6BENvi1MMO?=
 =?us-ascii?Q?uuxLBPEJfxnCG2uRxoHwPoM4eESjEuVvHXff7myrbRi1a9G//6AGV6gzfRaO?=
 =?us-ascii?Q?GGuTu4j1mC0V7Iiz6ohfMtODMtqLzWI+qjcs/lWLKIVGMLJpkKTZEn8SkwPZ?=
 =?us-ascii?Q?hAgLmnN/dr2QNbhmXpgrhexO82E2aToIXS3R2w4qbgotWrR/0M1cIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D1fOSj0F6bHr8avJrHv67KZZZCEsiT/LIpxAEc7LJOdVYHMBRMOXUQD6EVM6?=
 =?us-ascii?Q?gipdOvsExvb7FDxYtJKNdhCIwVNSA8EgeNTdm5pvO3/RqoXwx/rxmky7rBpA?=
 =?us-ascii?Q?LMlZtr5OrS3z6FBv/LvGyjfoEsGAH5/Lc036dexr5FJW4Gmt5RYXuZXUviYG?=
 =?us-ascii?Q?lM209+ca7okvfizB8uylBFvKf9DOlLb+gfLTSzlXUksMzdXteSQ8VzqsyrrC?=
 =?us-ascii?Q?TlSJWG8OtFofsVVz9epNz+MIUkJDYfLfrpNduD9rUGEVKPFyWgQdNVdahkBI?=
 =?us-ascii?Q?yzqrlUkgvmq7Dk/pV4CyGtL64OC3pSClgn57yQrVHPNpuxoilUYX8mqDibLn?=
 =?us-ascii?Q?/HigVWaLVn3M3jGdCDH17UMSUJhQ2oRCkoDn9yOc42vamwvsyZBRD1iZkZsA?=
 =?us-ascii?Q?SPvfU5a9kr+tI0/BSiBbO4g7uNT8HCnjDRsVF0cszOVSQ42HQO54rjxHEWGe?=
 =?us-ascii?Q?0Dxeh+5zmCk+bjmv5aU18Ay4pWHWLcXsquk62cyK5+5kmbQ/BhAte2DIb+lI?=
 =?us-ascii?Q?uqgEm7kStK/esdIU8bWr2nfKWgh0kHmoERcMf7O2QcoodDmHE6F3YolXHc5J?=
 =?us-ascii?Q?Ozf9eWGpE5BE9ASMrVjjmi2Jfz8NOZtOMT4/u9Fv7/BmbMrGF93L5/Orbi4J?=
 =?us-ascii?Q?iW3vQDh6Xq05UXI4dezRjFor6PdEvI/YQyOYDVmpzOiixY8DI37ZMqnnkOWt?=
 =?us-ascii?Q?v/kMyi/3RfFdlh8DAR4ivKR0mzicorh6L1j0RT9pO774M9cPsKLVmXcWml1I?=
 =?us-ascii?Q?XD35YjnvKQSc76r0rs3dKmNwhzNHcJCblIusqJsGLC0tp3XSjKuJbqBU1kK4?=
 =?us-ascii?Q?jMbeq+z4QiI6Czp52Vq62MOuE6rhVSrXu5z+OExE0MONUeoG10mW+8HBLEDM?=
 =?us-ascii?Q?+AAEGjPudEp6LMZweeojo8tvMifr31b9T1Uq/KbSd9oZHF98mB4BzLQGCfo6?=
 =?us-ascii?Q?zH7d3+OCF1V6HLtHGgVfPrpzbFDhE2FEY+9/kXn8q503ai7uLQATu4uEH5Ve?=
 =?us-ascii?Q?1JASpA6JNV4hL+X8dSMgIUUzTW56tYa5uuivmTaqX5WKfE0GClmj7b/XM2E5?=
 =?us-ascii?Q?q3Bk+W8qJ4jmeF19KwxEh93LKiNvdTnTK6Z26aYQRa7fU/CAlP6Frmt/9s/J?=
 =?us-ascii?Q?VXcVHMSCZxaF3J0WTZul+8a+SnZMr8+OcZNyN2B8C32aRxATJarNn4RzRWoW?=
 =?us-ascii?Q?gogaEQS9XbiUbkn7vxYRnjVPPJUwtbV+RnJsskIq9Nmg7kdijwLE+xTx6N2j?=
 =?us-ascii?Q?9+O5OCq/17Oj5ZkBCm7/IemLBEulzJIMpXc33RfApTMLVJq9MLYp5Z/qQ/cq?=
 =?us-ascii?Q?yXav+m69sdJ7Svb6Y6aH/f1SQW5ANFp9DAecP5wDmMPqLGaCCfE8w8iHJGuB?=
 =?us-ascii?Q?PFMZdGXzNmyM2eGt9AfhVaCzaGPR345NueBUKpnlzytZCXXkCD8JpRlTHqVU?=
 =?us-ascii?Q?l/2mQVUsmSc0LbZQ6gBOnzEpJdY2Zcfjz+4JP6v965Y8eKGlxnk6MMjEyAqV?=
 =?us-ascii?Q?QqYkFgj5C6QumiCXzAMeLilTiJoyAFDaqmQtWb3hZI03VEJjB8TH6Yw2buLK?=
 =?us-ascii?Q?CmEfuRuBCfOUhiVzwhnaVbx8hgv22//NloBqLdHpPbtuGbUSI8YOnXy43WK7?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26170e1-9199-46d7-8c51-08dd87c855a4
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:21:05.8965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bh4L/O58ImagowkE4I+h3RjkLQEiyQT/NaC46LsvJFM0Cro7lQOeB0pypOk5eYKNd2yChhdO9r4hQzq+jPZNhuupObXTnLUtwjmRh1tweL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
X-Proofpoint-GUID: YIdjzatVym4-9nMbQEsS84zz1YrJ9w5C
X-Proofpoint-ORIG-GUID: YIdjzatVym4-9nMbQEsS84zz1YrJ9w5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2NSBTYWx0ZWRfXwbL8OLQnpgP4 Zc7lt7XW3cxnWLGVubHP//E7iubFTGX8Z8C7Q0yYGKuJikEA8xWIG7O4uEMT9CiWcu2cQbey6uW 24QJyU3sEbH5297HV8iEqf0xe6sHXWOPuZiu/n6zh2r8US1kB7nMhABvnO7+PVmofLuszc2D0ZK
 oDo74/KFvMtEYJmnSVypYkh23mjS9dXpzoAJ/6ZA3irrEf/WW7+jLW8yKnwE1BRgtWHg4a2TtgA +AE4yuhBx8t2sE9ZXSu/rsVoCaGw47d2O4u9a1KfJIG8Q5R5Fv1yenF+Xb5+HldgkgjZcQ/1NSC UI6xMyEJ1L5VVTM3LYW4k0KQj9NGrdDqQJGs+36SwXbCtw73YA/6vTvV7D9mHgNhJrfsUKz7h3r
 8/8gFcKgxE7MBLHhKKgKplR5y/wrnjWF9sMIAdbUPE+9m11iK+FDf6TM8H3DZ3Z/cMqovQ/I
X-Authority-Analysis: v=2.4 cv=Od+YDgTY c=1 sm=1 tr=0 ts=6811eb84 cx=c_pps a=hSS9g3ca6WprpwKybkK64g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=GY8FpUsesA--Mwu5c3QA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300065

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

Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fb7515ef155f..48d146e1fa56 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1655,6 +1655,7 @@ static int rproc_attach(struct rproc *rproc)
 	rproc_resource_cleanup(rproc);
 	/* release HW resources if needed */
 	rproc_unprepare_device(rproc);
+	kfree(rproc->clean_table);
 disable_iommu:
 	rproc_disable_iommu(rproc);
 	return ret;
-- 
2.25.1


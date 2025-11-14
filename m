Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470B2F3C3D;
	Fri, 14 Nov 2025 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763103340; cv=fail; b=hGjUDpMAOJIaygYQMHB4SZAMFeKQQZNc4yo7bcKKc0rkW8vWFtN9mFmqAsRaitJZBcl4/LLNhqdN0L0XN1hNXNwwc2PNyD/Z6yed8PkDZ+yJSVk2/Uw2bDqTAZ6SsJ7ewcNyoPicWYlhNaxza46zGbKJmJvlb4RNEnKgW79NNr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763103340; c=relaxed/simple;
	bh=7kmUmcOQ7FAuEepoiDRUBnQQ90KAbjO1NB16ieEcbBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TqYTC4wxT9lZ64VrG4Xg+1MEJ13BWZGyHJn89cMz1zu7JyFAPi4vVMh2sg+oGdRY+DUNireyLEWX0Yqm6Ty+WoLiKDNV/IKYEB4MXYw1pbgN59Y8B4YfwB60edExdXnjgYOKvqUdV+QsIU4lBH/+DAekSouBbsCVQM3bmQJzTdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T6oJJX7s; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T6oJJX7s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti6U7+ld0Ymu8h4z/xK08VxtQQv2hdJz2aFXGXbISZCv2W/tBjVCeYZPJZG6wxLOUpDpoDETTsoXr9Ws0QS0p5vCo6SH2u4PRdSjlnqIYT55Z6ob4/Cx8kshShW6+tFVwcizbMoQ87y2Tip2jl9Dx6M1cn/rpfmj8WJ1GFGzgEUggSXHQOMyJbgDREWheYGlYshlYuqgOpqJMVnTSJWaE+EW3KxBVtMyY+cjbhbZdgi2bQ9QMMiA+bNrVynp8wUQiI4CCgl0ENMQKBAb/IXHWLZnVAiS41lJYGid3754qXq25vVLU34Hwndon3PKaTRarAJ0ECtnchGcuuft2+qOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j8svbfKBEkjYBeVefi/aqZ6xCwyMAnR70nABPryjKM=;
 b=NM154htsFqpKiQ0OfHR2gvTGqE+XJ4wpFbYbssD+kbwlBTWvYQUq1Jow54+QYCX7XgA8QqkLC3s5BboSFZqyhHrC3RI2VY9xoAjMLs1vNXlX5Ki/yKtAIaB9mDTL5fkQyeJ4dvz7mFGyAwr/oCX2oUY+aZ8eilyrOKgiCba32D/CCcgr8FnESBc9+dcqNgMbzpVFH50bxH7dGlBdZJE1t8tQXEIP8qmdolZ+/0GV1IfoUtErn8ChVLs3ICYuqLOynT/qzHZcqrv35ACPKASaWqd8O1VkF/uLNsv140xC80vtDqeEvrUpifxH/R6wdwIvBqiOot4hxDy5XBjC1fEXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j8svbfKBEkjYBeVefi/aqZ6xCwyMAnR70nABPryjKM=;
 b=T6oJJX7s45iXFeGP3t/oUocAe8Ei80ExrwrDVlWYFDW5PYrjtIJBFYjTugjj6VLnWnL0LoUqP1LWf+dp8T/v4rd03RvR2rVQoBdjx8/JwDNmstEpYMmoabSEFSWkpmIsTovpiCuQHObTdGuI6ux1Gfcp/lJiu+YRYKSIKIKBOn6zuITISoy41niMdE7g4Gad9+78PjkGr+cHMrd3Kwip4oaK1wBq9OgW9YqiQPFRyXkfT6OGmZ4n9slepQnZxGt4mcIYvb/b2ttPIiBF6bUoyZdSvQLzJhXUcieJTKHwdqRNUy6rV0ACcpRjC+Y3bEVRhsshh1bPXjQC/Djqfdx4kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV1PR04MB10276.eurprd04.prod.outlook.com (2603:10a6:150:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 06:55:33 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 06:55:33 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: corbet@lwn.net,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: dan.j.williams@intel.com,
	cedric.xing@intel.com,
	pasha.tatashin@soleen.com,
	kevin.tian@intel.com,
	skhawaja@google.com,
	daniel.baluta@nxp.com,
	yesanishhere@gmail.com,
	taimoorzaeem@gmail.com,
	linux@treblig.org,
	arnaud.pouliquen@foss.st.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	rdunlap@infradead.org,
	daniel.baluta@gmail.com,
	imx@lists.linux.dev
Subject: [PATCH 1/2] Documentation: Move rpmsg.rst and remoteproc.rst out of staging
Date: Fri, 14 Nov 2025 08:57:44 +0200
Message-ID: <20251114065746.901649-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251114065746.901649-1-daniel.baluta@nxp.com>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::29) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GV1PR04MB10276:EE_
X-MS-Office365-Filtering-Correlation-Id: cbedc2d4-cce6-4f52-b982-08de234ace5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PvpbydSN4sZfLjIBzZMlqseZQGFKAKh69L8iyVrxGYa0WxeqA8K6KCNo9+go?=
 =?us-ascii?Q?TfwD9RzduxOaBNCPkAszp8O71nUC87pAXXbXhEy4oiyB/dDoNIf1gmJEKH6Y?=
 =?us-ascii?Q?WZZitntE2Zl+nrH3GakW1y3emUTU4M2npI91+lx6VRXr8R7bNGWvGlfLjE/u?=
 =?us-ascii?Q?nAmep1QMPOg9Gzz+ruyGKDy5gwrcrTB8ZfD8oszqPI2BPzsyzRt9sPDNgMjM?=
 =?us-ascii?Q?eKpQIDch9MPa2QH+DrnEZCwOstzunUH/Gz4KPMcylZ2/HhujmDWThcVBoTEw?=
 =?us-ascii?Q?R2s9KhKYlpdEp4/IZcACA3lYR6rL5mbwXoHpt7oITiwEmdymPX5YpPfYZ3yK?=
 =?us-ascii?Q?inv0sX9nLfBm/AsbYFQU22/sgeV4kAGj8fEBkXLxsCuMWKHRMwaJ+sDF9Ddd?=
 =?us-ascii?Q?zD057C8Cb9iFgxjWfCypf7URvt7vxCfADexVt8L4hDiqILYhqTXZ1ls/CPdv?=
 =?us-ascii?Q?uevtadNb6MLE/ChhcMOF6GOSqYCeMv50i2SP6KQ5vcP9+ObYf1x8I/Hsb3I9?=
 =?us-ascii?Q?hvETnQCsFXazt9A8OhWym1xZ6UnBH36gSWe+8V6FQ83MYCcE5P/0isQzV/ve?=
 =?us-ascii?Q?PnZmnYA/xmdqOASufnGVpPOuZRgAsAvII4q7zxhWo595HbkXOswtDkIM5I+3?=
 =?us-ascii?Q?Xnft5ZilyRMfV1T0bTPmNleiJhyDfV5wIxnT7G24Ea4bw2OYHfas0e7/iDem?=
 =?us-ascii?Q?3YhwLmO+JgLVg4ZbOnyguwyjxERNEgWnZ4t7HlObnyAb90lfWt03CREN6ifG?=
 =?us-ascii?Q?e7opWoJWe6h4AofbBNXELeJVXBSW+xuTKrxPY/9StWFWwtldJXk48i5reo2C?=
 =?us-ascii?Q?owoEk39h14S0Tffv+xwmLNcumpPSLiaj0ocovpE4Iwq/W5lQJ1XBeFlsfL3T?=
 =?us-ascii?Q?E7w6w6N6pRo40um3J9jC0WHuRsBjBJlYP9X5i2GNv1u+LLtSCStcMrOPJOLm?=
 =?us-ascii?Q?6HadEDgtnUnXg9FUN0ZAk8XBQjc3soLBGG7bB61j9iD1Yh8UaifuR0r5Sy0Q?=
 =?us-ascii?Q?KSpja8O5a65O0gghGkQ60+Zc78QQNLZjbgrWrqVDVKoDrunqlwYnA0EWwTyc?=
 =?us-ascii?Q?6aIuILrZ6xMxDTuYubxWhM/QD81+0armGPFwK8SQprLACe8lgmPi9pwcfAGR?=
 =?us-ascii?Q?FPClrvKvmqpHE6puTQsmA1ZVYLCWUm+6IlDG9DmNPnSHK6SQ5mPeWAiL+KjT?=
 =?us-ascii?Q?ReWhosHm/9jIs3LvMQUYSHndHifrwefrXJaPlguq5RfIh8fjypRfs4rKcu7S?=
 =?us-ascii?Q?tI0+wipMOtmFLiPDIRcI37fyIgU2xaaGOti7iIqa1XCNUc8dFnoL2lnf1AeZ?=
 =?us-ascii?Q?71ywzAdav+LegMwWFauoHBPXFy+TEv1KBdChPsIXX5iM8/cfy/AwPnvAgv14?=
 =?us-ascii?Q?p4SIHi9nYe7wv2cYI2ndJywIRaq2APR843wHoisRLo7ZvRnjBBT7Kx1QvZaw?=
 =?us-ascii?Q?3mWHvVS3DSsigcStsZn07arVZjO52fXR9OtE2aNJV3vo8VGE91Zegj8qFDXF?=
 =?us-ascii?Q?zwhtI7OwOe+I7du34yI4w7QQDkhKuoCH1tM/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KXbQkNGmjw2488sJEZNdi+QeNFsm0JkcIu8Nr3dccMu9XmoZeJ709FLfn1Fa?=
 =?us-ascii?Q?nPDADOPuef8U360DeBYKFteF1WwGY3A/y/le2NGJgVW9QWs8FxynQXTuNPdF?=
 =?us-ascii?Q?l4l0Td2cPtCjJd41BE7Kuc+8dkAWAfvcmzR/smSsCQ3PAihwR3y0oHFk6s3G?=
 =?us-ascii?Q?mtYDs+8jDrbiWFsC04c2BzvQFx17Vn0BwLzApRYPHxLpydK8XWGUqKOk0iCq?=
 =?us-ascii?Q?hGjXga5uoO2/QO3oGRrx5iT7pPj4C6vcqIqnnZyWkoN8wM6Je44ER/RZltm6?=
 =?us-ascii?Q?eObbhq6pxJb3/J4TrhrSMo7p5RQKobzQvMZE1ucFRD3rcMCfV3+lwtsjU6ei?=
 =?us-ascii?Q?bDAMUeYmFe/aMWVTg4idMBErUDIpOtJIzeQ0M5V5h0oEs+gb8XZzayefV8Zt?=
 =?us-ascii?Q?5kciShwKTU0zB6S5CosAa+7oiLE92Vef++t41bxGoAoBNpoumxJ7lbklwAX0?=
 =?us-ascii?Q?kxMY0mWovIXxyZsvlD8/xxz2HBq9WokUda1OIBoEqk1vkkz71Yr0IwOJwIO5?=
 =?us-ascii?Q?ThPckZyhSptYT2jmLHSLZQXksx8Y/j1Pz3nuCQKP3vA/wHpmRjCQE2iolpLl?=
 =?us-ascii?Q?+wivxeHjKtkcnDqqXPw7roIpALFH0OpiANtK8K+jxW8VT+MKh1Usl/1COeDj?=
 =?us-ascii?Q?iriR9sO0r9yusH2S+MimBcI80PfnFWbsPoN5oVGhesZF2BdqFlF6XzeotGx3?=
 =?us-ascii?Q?tiLK4l/zcKnCSnt7UGL8RWvZDBK3Rg3pHa9RGyBrbHXL8UIdaCnCPwpNnDuN?=
 =?us-ascii?Q?oaQhukYUlj5Vm05lWhKD36NNgb+GO1cI78IjpViv/tqZ6mT7r9AaGg5u7XVv?=
 =?us-ascii?Q?2ITxrSxYbKIdi4FIZQRFaXrBRvpuGPly+FBeMyukuTjJbgAiU3UMLkwaNfUy?=
 =?us-ascii?Q?NwyLh3Ao97B6mAV1VaFrMunpmy5wjjPs3ECFG6xh0il0m8AuI4FzGS40qtcg?=
 =?us-ascii?Q?XsWYC+NDVUsYNZLABd7SZVarDGwrWAHD0bSjqL5doWs6qkT1nRtTgv159a6B?=
 =?us-ascii?Q?cyqnpjM6DhixsCkL4insvasQX+NnWM1V9IXoefY44RSQsUIimsiYgBVXLQ6h?=
 =?us-ascii?Q?SX+eQseCWGv6+r4gZVgFWmtZlI2njHTFkUmmBwbymHxiz+rAUVRLPF0ZME4B?=
 =?us-ascii?Q?EBRBp3eiwuUT0M2/AcWeFETLOJBj/e4zRpr5w3jc1PS51T/8PHaB9ck4c4uA?=
 =?us-ascii?Q?uyn7nhknP2wxfX/6C/vB22frF4Qh6Zoiq7n/Lu5fbgp7XszYkM0ySr1MhjSu?=
 =?us-ascii?Q?kBeuvZ/c+d7Q2ebNm7DdBjIwHDQUOQrax4AViss+wIGSV0tPGyY+auTQaZpf?=
 =?us-ascii?Q?MDdhEA39gRkbcNJxuQ2T6XyYWP6fFt53/CT4kAl00PnW/vDJqnv6dh3h9iy3?=
 =?us-ascii?Q?UbY06VPlIKVR2rOM+6BjkMhrFI+zo/EJq+d2ixJqvj3A4OEO2WQJ7U/qeofB?=
 =?us-ascii?Q?5NyIYwPkchL0ZJWU7aancis1O8c/8xgFSXGlWEXW7f27RHKrWQQSXL+qzafX?=
 =?us-ascii?Q?o2ElOy4zajfVHC1q/Re10onEbls+cJoeGnnDxj0kFmj+9UhLEfekG0MLeYgS?=
 =?us-ascii?Q?tsUxpm61VHXtB+FG4YrArCJ7xJSv2zhWJrbI96e/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbedc2d4-cce6-4f52-b982-08de234ace5c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 06:55:33.2314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRkEfj9PgYNLqvGWL/mLHvtvUQDL1DnQZ+2xnEAvdru31Gf3ceXMvd6CQ82NpzWhiW/0GoBPh7BTDUv8T1GTvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10276

rpmsg.rst and remoteproc.rst are documentation files for
mature remoteproc and rpmsg systems in the Linux kernel
so their place is not under staging.

Move them to Documentation/driver-api to better reflect that.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/driver-api/index.rst                   | 2 ++
 Documentation/{staging => driver-api}/remoteproc.rst | 0
 Documentation/{staging => driver-api}/rpmsg.rst      | 0
 Documentation/staging/index.rst                      | 2 --
 MAINTAINERS                                          | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/{staging => driver-api}/remoteproc.rst (100%)
 rename Documentation/{staging => driver-api}/rpmsg.rst (100%)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index baff96b5cf0b..5321a9459440 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -129,8 +129,10 @@ Subsystem-specific APIs
    pwm
    pwrseq
    regulator
+   remoteproc
    reset
    rfkill
+   rpmsg
    s390-drivers
    scsi
    serial/index
diff --git a/Documentation/staging/remoteproc.rst b/Documentation/driver-api/remoteproc.rst
similarity index 100%
rename from Documentation/staging/remoteproc.rst
rename to Documentation/driver-api/remoteproc.rst
diff --git a/Documentation/staging/rpmsg.rst b/Documentation/driver-api/rpmsg.rst
similarity index 100%
rename from Documentation/staging/rpmsg.rst
rename to Documentation/driver-api/rpmsg.rst
diff --git a/Documentation/staging/index.rst b/Documentation/staging/index.rst
index 77bae5e5328b..de6dff862a0c 100644
--- a/Documentation/staging/index.rst
+++ b/Documentation/staging/index.rst
@@ -9,8 +9,6 @@ Unsorted Documentation
    crc32
    lzo
    magic-number
-   remoteproc
-   rpmsg
    speculation
    static-keys
    xz
diff --git a/MAINTAINERS b/MAINTAINERS
index 41ded579750c..490100765611 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21898,7 +21898,7 @@ S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
 F:	Documentation/ABI/testing/sysfs-class-remoteproc
 F:	Documentation/devicetree/bindings/remoteproc/
-F:	Documentation/staging/remoteproc.rst
+F:	Documentation/driver-api/remoteproc.rst
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
 F:	include/linux/remoteproc/
@@ -21910,7 +21910,7 @@ L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
 F:	Documentation/ABI/testing/sysfs-bus-rpmsg
-F:	Documentation/staging/rpmsg.rst
+F:	Documentation/driver-api/rpmsg.rst
 F:	drivers/rpmsg/
 F:	include/linux/rpmsg.h
 F:	include/linux/rpmsg/
-- 
2.45.2


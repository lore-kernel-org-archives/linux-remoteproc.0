Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8192F3D9039;
	Wed,  4 Feb 2026 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770202353; cv=fail; b=mrgFWidz0o9VJC5whxiZ7vSej7+/1k8PnihmIngCXt6Bmmz6BawaMcgJINCmKRCvip4i4PlZtb1ybqXhhRHYPOlORzjiWSHLc8xGwQm11Q/BCEpAn6tqpVRrrYij+1ot1dHWMwierViEXoselSxV659mt7I1tAK2sG3CiAqLhRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770202353; c=relaxed/simple;
	bh=liPZbG4cl2hv27V0aepfnT4Rs28TZ67wHXzy1lu0PJc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=egNQhZiYQ4hoZtwybPDt+GNw3oCfJ2cBdfiaXhXoK7L/0UBhw8dcI5uSwNgTcFDQ8K2kQMLV0Ndny260s1R9dlUvUX0i1xVr3fsR9EDa788IG/QRRQW069PxFw0+xC8m1eeRhEff8rUqmW7APMwj6quKmIBFvPj89wW6jLYGiBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dP5nLVbU; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dP5nLVbU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwiJizSMB6NcssoKcm831+B3411mz6GALzdXodYZOCBEeBadI3RQTCYr2pClHnQ7flPZOz6t01/TX2YTGZIJQk8Y7r9NQYP6qQY/LBuIitqQdkk9BUeDEgvHsrI/lPnK6BinAc6dmSSiISXHBwRa3TbySPWGXNlM21HDPX1Uc6WD2oYtBRTvJy410QWgsamk5iJA0yh35YVW7pXkdUlIIRCtrEMyfAku8YFaNWaHvDgqSl/YJ125dbhQnAvgROHtKq3m5RVKmZZJdVOPSIBOEtgzy1AGdqarA6gaYLar/coMsLZeEDZ7fdDo4Hd3CdRRmm4rXgkH8jI28im8dfjbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugMjX0I1GVK6nnxGsWLjBY4WHWqeUVMXmOz2kHAaSAs=;
 b=sDYQHNut9aFQd5wuaOfPPxNRJIKj9m4DvOwsCBalag+KgVYxZQktgd4+C8BBCFcrotOQNxQ0Jl0Bp5ZOOWD8jATGjIEvpV2okxqnoT7CYqpR//g42VdXPbWqRqenOJWU3ASV1zdQ75U/I2nAO4UWuIPTPXgnRi+RuPBubLaOgo+/Jp+C+rrKNcal1yaU/sK2gYnGlgDDX2d6nveXoCWKRWiv1W4C8svd65RQS1tC2Vm98clAcKOf+8Z0P1WXTZpSz2QdEC5Di907G5p5N43jQFoT0K3KFnUDktdY4SKyNPUDAsjRgS7oiQ9DRCQLGacZSwuLbbp1ns70xhG6Xy8CqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugMjX0I1GVK6nnxGsWLjBY4WHWqeUVMXmOz2kHAaSAs=;
 b=dP5nLVbUfSaqW8ZqSvcs2VHcZRnbfK3/m64OC8ig+idq5HiKytszYyLW+rxmVWp+VQ0DpKcgq2qRaET8qXSJbBaBxXU1g8MNZRKGa21+htCHAu4GJSwACKy3vfaiVIBax/BbxtIDi/4TFZB0JySHm8cGEUE20TD5QCnxkm3EhDdSiZLDedhJWbzdMl5AAAsBJd+AeMRU7C+YVEKMBzE6FbImFzeicKUpN0PhUzL6LwR8S3x6oXH9zCRiP2RT16xxC9Wd0pEqKKbBIkhNa6KQ+Ku0CqeZ/JZiaUusQCS1RuykVWXtsEUiD56WljBQrq8QtaULrP9GT68KfyhKaS58NA==
Received: from DBBPR09CA0034.eurprd09.prod.outlook.com (2603:10a6:10:d4::22)
 by DB4PR10MB6118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:52:29 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::66) by DBBPR09CA0034.outlook.office365.com
 (2603:10a6:10:d4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 10:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:52:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:54:07 +0100
Received: from localhost (10.48.87.127) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:52:27 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Andrew Davis <afd@ti.com>,
	<arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 0/2] Support remoteproc fixed device index from DT aliases
Date: Wed, 4 Feb 2026 11:52:14 +0100
Message-ID: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|DB4PR10MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 2480cd61-c2db-45be-845a-08de63db7d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w3rhYhnGpE0LjqXyLRkpq4LubuwGd3hiy9EjWL6ZASVqBEwwgYipZT6P9Vcs?=
 =?us-ascii?Q?gt1lRRH5JCjCzYGR0GvB+/wwPEUBVns2LQHueiMzO5s35KMFMLSX7uqUE66C?=
 =?us-ascii?Q?p4YGRLH3U/SXRt010aORWkEFzUEaUiI7nKZYLSDUGNUQS/sn1gJueA1vlO7C?=
 =?us-ascii?Q?4cmwxqgc8SUavjA3w2viZoG4PrxK16gsB+dJof403uSoIwB3xpzqJJiCWRUe?=
 =?us-ascii?Q?7Kn9AGeORRqmXz0qghw2w3Q6zVVkwCGWGXXug4/TWPpfvx4pRUO3/QB3QZek?=
 =?us-ascii?Q?gE1FSh2So1/LR9tVjnvvjanhEPfRAAb9qtf/KAT1EMDNKRIiCZfQQOqQ+Nj0?=
 =?us-ascii?Q?kC6315MlPCuO9Psq2LZeFsbKj9UPn6vIBdcRphcm/ObAvMWiAqtnXQ4m46sI?=
 =?us-ascii?Q?Adcu6bRwJ1cfpMDpCIRIT3BFWE2mFbb5KIejJCt481MJpfx4wwJ6N1ju0Bvt?=
 =?us-ascii?Q?F8L3rWe2wQBIiTVaiKYmMlbq/NQ0R8P0BWzfLGkloZPNWNTZqbugxRjnothx?=
 =?us-ascii?Q?A3mvyPF4Ht8FsbIFi3LZTT+bBSkVkR4FinqUZZqOt/35jXWvv+tBL8VvhYKM?=
 =?us-ascii?Q?T9N59s0IhHt42VWw5tTTPRbBGe7fYeFGLbg4qmHfs9rOM4SPIfbXC6bNLhBv?=
 =?us-ascii?Q?SUlJIHWHevuO0ZBtLm9GxBtcke+mnDzbd9QcmQeScoxe32xpInE+64Tu5EH8?=
 =?us-ascii?Q?csn8Q7DO49+aOmVPyCULaNOmBwdRnVw2Sy4aLJpxltoLJvsXz52HtuoxT6HB?=
 =?us-ascii?Q?5jZx8T65W+kjRMoh8cCkc5pvbZMTrqNjtexFuO8sqG7h9EOMIZRIf4rnhQjc?=
 =?us-ascii?Q?d62efWHAHaNjr/DibdpRZ2vsN5MRHuuNCtf1GBLXU9S0wppcbghc8bJHWQMH?=
 =?us-ascii?Q?WsjESFIeiLbWamvolcygwmi5RAWu/VrMvFTw5y/7DWmRK1rbLcESAZqJk41F?=
 =?us-ascii?Q?IxBgNr+KJJVZqVrbPrJWpn+oF4Q4dfdyfNUauwX/XNrA9tD118xQ3QvO8BFF?=
 =?us-ascii?Q?h5TpO7X94U449XLxTCYspLx8ouOnsUnCTnxTxIw1M3IS8zER7MeP6n/X3xuR?=
 =?us-ascii?Q?tEwoyq9U6wI9iTHTW2kmKgJx9qOxS3ddBz3fVxOHjUaqoNeHt8IKSRMqsdI/?=
 =?us-ascii?Q?9twLovzTUaBBcTrgMVQCvZguRyihQVnkDTUp4ih59m1srC6hOxefhOhraXKl?=
 =?us-ascii?Q?zFzS1x/UAAYUKmC1D0kmzaMurjVlYXXmokKlJPS3456fY+IrE0LNcIZueobK?=
 =?us-ascii?Q?CL8BTvM2TGn2XD2vy1tvjzjfJh800qKJODQvk5Ss8Fz0PHlvNkIWwXfqwBZM?=
 =?us-ascii?Q?AAlPC2rRqKH946nMqGvrLJ4JzoREs7xCUX6FIvwMsppInuuQaKm+xFb3nKgr?=
 =?us-ascii?Q?oWx1iOdvkEeIWQ6ZYY9WqVFCn+aD5FTfXyXuRjDIv3VuiJKYjTnSvTmAOt5O?=
 =?us-ascii?Q?Jk1x9af7HOpFfloRjKonHo2MWXRD/ETdU9Lx/t2XRgoG4w89PKlToZMNaZBD?=
 =?us-ascii?Q?UDRfJdJYcWoe3fRPOxWigC4XPiOtooaeEkRp2oRfDbf2+myVxU0dfp4ox4HT?=
 =?us-ascii?Q?r4dSEz2Fj66/JeYppuccUCq3DJxxcsN9houHw/H1pvn5JwLsmKjMUm59/4lX?=
 =?us-ascii?Q?9IV4aEYNjL4ymwBFZJYNawzqnTvhwN9wrd+bqCzL2FBLLjspNqm+tU2T3GWF?=
 =?us-ascii?Q?LInV2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BmocXddSiWwV3fHYxBMGpAhvoVUDYLeab8IvlNBQmoZPQlF4MtZR+MSCvJ2lQa3AtlkJq/M166hjS4uVk2PM+f1iR6NX+441a11pxyJSr76W+BGD9Pz4qPXO1pyTcYcUu5H1hV2U3H4wTvPo4wAz3eiBcuSp2L8b7OBxV+2o/gGajCcUJQWujtjKszdw4TgqatHUdJ6flLwXUQC1orccDShFkhmgyVWoR0FGLrWWO7RP90xhuorRBYlY+tsnhL6DL9e3bBAEv4v6xNL6Xo7NdgG+UcamMt7FGZmCR4t7zYsKmtH8SKYUNGwmdtAOKLJgv9UQPa7vF7RdiEVwbP6YXcOLRxZaxBBcGCUhwzTx754I1hKGziFOgmKYf0pjRIZ+QrYNGzrIc1CmDo61NXSacKPH3178piln7BKerONxDV8QQgT1dblq6yUzglNMie8e
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:52:28.7495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2480cd61-c2db-45be-845a-08de63db7d8c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6118

On systems with multiple remote processors, the remoteproc device
enumeration is not stable as it depends on the probe ordering.
As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
always refer to the same remote processor instance, which complicates
userspace applications.

This series:

- Introduces support for "rproc" device tree aliases to fix remoteproc device
  names and their corresponding /sys/class/remoteproc/remoteproc<x> entries.
- Updates the keystone_remoteproc driver, which also uses DT aliases, to adopt
  a common RPROC_ALIAS definition. Although it already uses the "rproc" alias
  to construct the firmware name, the change proposed in this series should be
  compatible.

Please refer to the patch commit messages for details on the implementation.

V3 update:
fix typo and add Tested-by: Peng Fan <peng.fan@nxp.com>

Arnaud Pouliquen (2):
  remoteproc: core: support fixed device index from DT aliases
  remoteproc: keystone: use RPROC_ALIAS definition

 drivers/remoteproc/keystone_remoteproc.c |  2 +-
 drivers/remoteproc/remoteproc_core.c     | 40 ++++++++++++++++++++++--
 include/linux/remoteproc.h               |  3 ++
 3 files changed, 42 insertions(+), 3 deletions(-)


base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.43.0


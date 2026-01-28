Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8715E2D5410;
	Wed, 28 Jan 2026 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596305; cv=fail; b=ABr1TRa4sVoqfyoPte131UXy4uxUP3mW12zzW0hZuH/66xrra38uuiEBz7IzhFjOJrw1ynhianS1jx6TBulE+29X3Q/PJsgAL1CkqVmoh+A92HExgqRVx4uJKo08TAKzoq0uT25XfbN7n8Lc+MAyRuFIuFdQQ69JsJZqQu9gKbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596305; c=relaxed/simple;
	bh=zzdJm4usNapxE8AXSbrrhcb9Im9GLpSOMiIke91tn4o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=enYlTV7/SDBEvwZ4wEZlpxsnibV7ROt4AwvB1GKLKfqJAvaVOT5kwQ9GExc5ksrC4kJUJqtmMaQR7TZgYSGb8v3l3YaFnLwL1grLMNOg2YJerqS/mOjQrgZ5eZ7ARshcXORkaVi1H26ypI8bVzW/egGhCKpj5RemFCZou33pNUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Wb7QSvOy; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Wb7QSvOy"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SAOD3S2891379;
	Wed, 28 Jan 2026 11:31:33 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4by2eytpnv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 11:31:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFXyb8O1YaqiBYwY/M0PyklmwxGbgzfNZK3SAxqFlrbDRsE1DT62nn2gXw9gHSNFCCUvxALG+ZvepTalKoXOpg23FOBqRusnJr062Ep63jJjVKquDMzoGdhCWxZf3DxEJwOzvhmZixJaGURp/VeuBXBwoGuFcGNdTMMY7U3uK2ES8Ka90pWIMoTN6gAqBWc8Vx4wgFoe5HAUDRuICbdP4xDOQWx316G0UszjYg3qwhfIyeW+ESMk0bjTI242qSD+Q1aJaRPrVbbHlEE97uXLrI9UVrxSKJNHNBoMb9GdE2UDJe+o+5Wyfv5N6EAF4U1mJ0G48w7zGa885ozlyhJloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqJDhay/85TDb/ffYwP2WXsdEHpMDhupqI+gw0feynU=;
 b=wG6YbA6OK1rWVxzjSAvfDnXdmwyzUfMl4Y61dgAQnQ9/kivUc6yDHBhqmgzcn11C/2w7/HR1ydQHAZMgVUO5SM1Ha64bhPYFtcpfYxkPXzA1A25bVD3oNqq0KKE0pge580uA/ZhIEVykt/X1uG89lF9tsqrvP+rK6XLJV/WuCg7nH28y5L3W4raAahmUucU+5ifg9+QqYIPWVXnhEgS/FBE58Q7Mp/DKYMobm8jg+iruhCtuZxAIUixLpVSqyIKcs7zdnBZDTSE5Pmv2VwevDwuFore1bvqE3sFT72GH7sPrco2d3VLg4wYrUT+iwI83Tg+DiJMuDizpwhUp/TEaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqJDhay/85TDb/ffYwP2WXsdEHpMDhupqI+gw0feynU=;
 b=Wb7QSvOy6cy65wk+OktosGkGCB3ijslCfDNLp6nc35bKQVFKkabFYZp73VsxEdxTqUd1uJ5tZzTFtGtzdUuxlCx6rH0Fuw201dWJC4tCZlvqIecX8MqI5EriORmZVoWSFCa1QuBRssIY5aoI3rtpn1EwAHOkSy/SBdPqTWxmaXRnFKquetRlZvjpf8fE5Wai3uIbBtkemmHz5LGyS43X0QG+BFmmA1pKghg+EeH8fAxXbNC4OzrLmytdVcu+CJK0Wrc6e5ubcZzbVr5cZUi9R2RowJSOnldCRYXceco5SdMu6NHIq9codo0Hrkrrh8Yqyfpm9vvPB+6G0ktBObZgmw==
Received: from AM8P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::14)
 by PAWPR10MB7104.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 10:31:29 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::17) by AM8P189CA0009.outlook.office365.com
 (2603:10a6:20b:218::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 10:31:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 10:31:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 28 Jan
 2026 11:33:10 +0100
Received: from localhost (10.48.87.127) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 28 Jan
 2026 11:31:27 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, Andrew Davis <afd@ti.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 1/2] remoteproc: core: support fixed device index from DT aliases
Date: Wed, 28 Jan 2026 11:31:17 +0100
Message-ID: <20260128103118.3630078-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128103118.3630078-1-arnaud.pouliquen@foss.st.com>
References: <20260128103118.3630078-1-arnaud.pouliquen@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79C:EE_|PAWPR10MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 0674939b-e88d-4363-56e0-08de5e5865aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CCWPdBlDC307Urt5beVJ4KtLouwnnfX8V50I+9ek4XuC4upVn+WiS+WqXGgH?=
 =?us-ascii?Q?C5+l8rziBHbVb+Jd8XlOaztMqGy2mcsX13Lut1B3bRI6pWdPdWoi/BfthKHa?=
 =?us-ascii?Q?6MBdVSGDnvkyM4+mwFwnU4T8tpAQNHDcR5RHtMEi5J6eM1CpDejh0AOCvty+?=
 =?us-ascii?Q?a1+4FVxHldyfa99ms2Whs6dgHdb3/UaJRQUniTEIE1d5wPJn5S6a4Miaq11D?=
 =?us-ascii?Q?MgbTF7KBjJEIXSZDHm/bH7I9sXj8s5FPBuuIZf9CTEztA8fI8cdyJR3H0RSo?=
 =?us-ascii?Q?UJVYa0SX+aZwOIq1jZCdBQ+wvbXcXscQr7ogLW0v2yaV5rGVR4bitxXo4Ms6?=
 =?us-ascii?Q?QXtAN86JfcI8YKUgzNJRh73GCo7fiuzp+gKXTq0GfTIRK6FF1vMynuwNzdx6?=
 =?us-ascii?Q?GApKVFnjPT8etL64FuKyPq/0EpwGpHUVxCYPakNfyY7ObCWcLlvhtY4Fk5Ra?=
 =?us-ascii?Q?eZcbM5uX4wv63pRRVVCSuetm1IrMPG5Zhvc1g5xLYvoVfaKUslHvR9u8uHrx?=
 =?us-ascii?Q?VCeuZsxjCKv1XNrTlZJWcA98kKT2s+TDbX49L8zbVDXBWj4T6aukQhAwYFCk?=
 =?us-ascii?Q?ukTY+IickOl4qX+Wc1ecyie/ANicOwzHTJaOWZB04gl1KT7ZDwUVleFssswi?=
 =?us-ascii?Q?FvICZrTTONoSUIHjCTjNfgpBb7W40Z98iPIU8j77dQVO42bhF2uJF1/rAkTO?=
 =?us-ascii?Q?NjNLL9zjOqrT46VXt9u574yqEI05jHWC07dFcRM+EHhidTmIw36rAwkuTcyE?=
 =?us-ascii?Q?f6wk4vEgbsGwEw5vqPIhjIzBZjjN9Jr7TKecx1aDFg+7ha5/AzwwyCWOFRbd?=
 =?us-ascii?Q?kAl1YQlu0JVPfcDjKN/Pxj1dN1K6MIyPkSsen5IhdfBqhpwLnVI+JyYkNg9Q?=
 =?us-ascii?Q?2BEanz+sxU7dHjMl4+irsME+woMic9GuzQS1Agdqe4hlqibDW6JpkUIl7cbA?=
 =?us-ascii?Q?RqrERpQoOC20XnWbyHx+OYi+wkcUhgpyvoAuxu4RI8vWY3KOJYDyjWKzl9gp?=
 =?us-ascii?Q?yjB1ZW9KtYqXsmMDTVzyq5Q0sX1SbWnaQdEvx+P8eK14DAS2t57OGVu8N6pB?=
 =?us-ascii?Q?WfxSlSYFjitH5thsQCdoSc5bppy5JjPeJK/3NK0j079k6qVOFf4nNTiGVQxb?=
 =?us-ascii?Q?d9HnNRCU+/VeLsorZB+tTw1rxO4F1CpYLdW66pA66kP9cr9iqMoJywpGnhqM?=
 =?us-ascii?Q?cB9+RIApOcVguSne2ZJlevgwDhHTszlipPria5HgHbom1iF+G13RFU+8OPsX?=
 =?us-ascii?Q?pNjNV5m3Q3RAcn7ZT4YjONVvXkGOSumJgW/5LiC/C4rrstWx9AJd7oY9QZo4?=
 =?us-ascii?Q?nDwilkebwpIPQfsVHnmlXMbwXx1gn4o3TNlzt66wtfjSCCtQ0yskgg5PubFQ?=
 =?us-ascii?Q?8FiFpwXAzATBTaOmtWotGiFWWYowclq+7tVb1o2zLURbYbBQLZwkU7ou8Ao/?=
 =?us-ascii?Q?ZHcWssSjLdz1exeVArYruchn4pm5fPippY1tFc4MS4Flou8vnck5H8Lgrcdo?=
 =?us-ascii?Q?q769o9rRyImTZu6c30ifbtqPK6xF3QFQDSs5QoY0k1TR4ZuAtgIvIl2xCPNh?=
 =?us-ascii?Q?Z6411PUIKKMQMulGbm3C9j4F/5K90GrY/092OxhojBgooHv/Vw9+zxeSg/Po?=
 =?us-ascii?Q?QL4FvuYNGqFYFeDehrwrLdN4tFUDsCvqx36zq2SCBLH1vdH58hNZjdEj+6zA?=
 =?us-ascii?Q?5UXwLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:31:28.8000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0674939b-e88d-4363-56e0-08de5e5865aa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7104
X-Proofpoint-ORIG-GUID: Kobn1bWuSZFQJefJJCGrKwTLS7x6LXZ2
X-Proofpoint-GUID: Kobn1bWuSZFQJefJJCGrKwTLS7x6LXZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NiBTYWx0ZWRfX/B2jkdCB9DMO
 qLFevYSJwVifd6FopatNBD82xuYiud+Zf8OE0bfOb/05Y6SxdalatEfHfxi3y4ZYnXsyWfsJmbT
 uxiBvEBC+twh80zbLnksFcoWc6hUuJrHPc3ZK+RWnzO6jXlPWER3Yr1L7uC1MNn8ENiOp6P6kfi
 irsF6KtT2J61hYY7qj4BFr/kLWcRBq50opiMkzorJIbzIyUtQuAi0AORaXZQc6F7nb+sHj4E1ae
 mcBGCH03ImFKT5lIEpE5Zrj3HAwClh/yzX4jHZANEFsDpURHOAJX+numEYrDRB7D4i4vOAxosXL
 JvcKQHQUvgOUIMXO+nUjKzu95YZGaLTTJjVTqAbziaSpUrsGXY+UxDhhzUEteYKUIk1CSN+W3mm
 lu1YgyqmCdBP18r3TQqdYJWaGtp3JcTcsr6x82oYTfW58R/qKv2WqiAKsmW2ODzHlZer7QMOl/d
 jypng7BudQtRDTpN71A==
X-Authority-Analysis: v=2.4 cv=SJpPlevH c=1 sm=1 tr=0 ts=6979e585 cx=c_pps
 a=oniE2P9vU/VSStgxRiAJCg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=vUbySO9Y5rIA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=lvzeJy420HX2BfjcoQAA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280086

On systems with multiple remote processors, the remoteproc device
enumeration is not stable as it depends on the probe ordering.
As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
always refer to the same remote processor instance, which complicates
userspace applications.

Inspired by the SPI implementation, this commit allows board-specific
numbering to be defined in device tree while still supporting dynamically
registered remote processors.

For instance, on STM32MP25 Soc this can be used by defining:

    aliases {
        rproc0 = &m33_rproc;
        rproc1 = &m0_rproc;
    };

When a "rproc<x>" DT alias is present, use it to assign a fixed
"/sys/class/remoteproc/remoteproc<x>" entry.
If no remoteproc alias is defined, keep the legacy index allocation.
If only some remoteproc instances have an alias, allocate dynamic
index starting after the highest alias index declared.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
V2:
- Introduces rproc_get_index based on Mathieu Poirier's suggestion.
  An update compared to Mathieu's version is that the call to
  ida_alloc_range is retained if an alias is found for the remote device,
  to balance with ida_free().
- Rename DT alias stem from "remoteproc" to "rproc" to be consistent with
  keytone driver.
---
 drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++--
 include/linux/remoteproc.h           |  3 +++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index aada2780b343..38d6eb1c9483 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2433,6 +2433,43 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+/**
+ * rproc_get_index - assign a unique device index for a remote processor
+ * @dev: device associated with the remote processor
+ *
+ * Look for a static index coming from the "rproc" DT alias
+ * (e.g. "rproc0"). If none is found, start allocating
+ * dynamic IDs after the highest alias in use.
+ *
+ * Return: a non-negative index on success, or a negative error code on failure.
+ */
+static int rproc_get_index(struct device *dev)
+{
+	int index;
+
+	/* No DT to deal with */
+	if (!dev->of_node)
+		goto legacy;
+
+	/* See if an alias has been assigned to this remoteproc */
+	index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
+	if (index >= 0)
+		return  ida_alloc_range(&rproc_dev_index, index, index,
+					GFP_KERNEL);
+	/*
+	 * No alias has been assigned to this remoteproc device. See if any
+	 * "rproc" aliases have been assigned and start allocating after
+	 * the highest one if it is the case.
+	 */
+	index = of_alias_get_highest_id(RPROC_ALIAS);
+	if (index >= 0)
+		return ida_alloc_range(&rproc_dev_index, index + 1, ~0,
+				       GFP_KERNEL);
+
+legacy:
+	return ida_alloc(&rproc_dev_index, GFP_KERNEL);
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2481,8 +2518,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.driver_data = rproc;
 	idr_init(&rproc->notifyids);
 
-	/* Assign a unique device index and name */
-	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
+	rproc->index = rproc_get_index(dev);
 	if (rproc->index < 0) {
 		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
 		goto put_device;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..3feb2456ecc4 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -503,6 +503,9 @@ enum rproc_features {
 	RPROC_MAX_FEATURES,
 };
 
+ /* device tree remoteproc Alias stem */
+ #define RPROC_ALIAS "rproc"
+
 /**
  * struct rproc - represents a physical remote processor device
  * @node: list node of this rproc object
-- 
2.43.0


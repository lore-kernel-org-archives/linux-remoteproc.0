Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B9F17C77;
	Wed, 17 Dec 2025 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986013; cv=fail; b=Fr5i3lzkwvSC966pQrZ0hHaZpH03fGJyJjiS5Ox+9jvtG2X5+wGobEYTmWCuSuffYMwxDPMTEiXIBbwxa7EqXwepuvRBaU3SYyWgCR2zGnbtuoTSFGaWTwFDg5aazVsRQB+k2DoJIIAXX/9ycdwyzawrHaaHxz9HWFlkTuaG1ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986013; c=relaxed/simple;
	bh=p6jptTaSs7JBJgzDPJtk4MmJnAdK+bAJp2WTXTZ6Znc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBOA4448LfBQLf5U7pw0lV2A9tQox2hHUDS9CW4u1NEW8Yv+R7R8NVGxp2dbjudfTVvDEjz8tiZ1SDkVRIhu5l/G+bCafu0Rw33ihRJMdTr5Uj9ynw2QANABe5SJMXuZZzPALp6BhyUiXRtNm4aLvJopP3uEbIG+ahG2Qr/4d8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Rt79TrLP; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Rt79TrLP"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHFaOhF3369922;
	Wed, 17 Dec 2025 16:39:58 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b3a3wmn86-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 16:39:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xsj0UjUsY2mkZPoOk6iuA+EjkdRAD2OkNP+cZdKCMl6LgVGrbsalm4s+FoxIFZidAmkmZ914yX29Kky7xAObQ2+sQXvQ277AV0wdYxIL39Izr+w57vmDrcCXZBqNPLgGIEkstC2c/Z++jB/ZNi23uWbTdGZfLkbngJ5/ljsyA4foo4E3lwtILqgPErcRhmiqLT5S7y7ia/nzmd3D03aFVH1z8z3IAm/o+bnfUautQkXdxZCLisSoaUd3hkgIWYR9v1MTx6FXyCpQUNlEuCdAn0POT9RP41SvMoAthmZwOofbsZ+7h8NjvsWx0wELeBLBXEGUgF+rjdIgqKXl0JzVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOl/LxvZc49Z7Tz8i0JalXOr+dGCvyAzl7LCpi4fZws=;
 b=GdoXXDXLTi1WdDx+ZOrxHckULHP9rUaObG14m7cYoijt2p0olqcXy+dcSPWzWRvjniIobEQJYMY846XjPRkG+zoidhWrwM93+NJNc6Q2TACYdDIjYmIrmYjpY6d2EJmkNqmh1OT8o25KfDWAUYq9ExveW55XgS7swDMilT293aSNKEkwpQ85Xn0R/I8AiTMy83gie7OR5WYOhqzMXKIjPCQaw6W8y9E/JexLV3fY8JNmHQ/WDFwkILLRATmbd7WXb7D51e4G51j7LhotbabKQH8dmqbl+xHqcyPPRSL8V86Gf0XZrA8htB49Tm6Uy3pcjxIoxi+6CHky99HLjOC5pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOl/LxvZc49Z7Tz8i0JalXOr+dGCvyAzl7LCpi4fZws=;
 b=Rt79TrLPZcCbARO1uHq7LiZeQvP3bpqgvmRcVoIeMoTzSPT1iTWY/PRhh2N3IP6TzwRTxIiFaATlUFpSn4YavNPzNGcpkGeb2ntbhGuTfpT1QYgVPrFO2KdRb45FFOXkMUHJQZkjQnghgRMVaN4w1cyzpV0lbsxsdPW15MEjeiqYJH/ffff8/NlkFdENMLHydcqTu2dYTEe6k8/r4nUFFt0Se/As+gnkERSLnrPIe8/4UkBbwd1lzURtu0fVlPilg9UJ7avZdpWj2WK6r4TMR8WpBalLEIxfX3GuUIxzRwJJq9lXxD4pS63BV2usAZxwSF/fnQVB01xt7j7AnO54dg==
Received: from AS4P195CA0053.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::9)
 by DU0PR10MB6605.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:406::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 15:39:54 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::92) by AS4P195CA0053.outlook.office365.com
 (2603:10a6:20b:65a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 15:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 15:39:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 16:40:41 +0100
Received: from localhost (10.48.87.127) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 16:39:53 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v20 2/6] dt-bindings: remoteproc: Add STM32 TEE-controlled rproc binding
Date: Wed, 17 Dec 2025 16:39:13 +0100
Message-ID: <20251217153917.3998544-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|DU0PR10MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3f32ad-19d9-4f47-9a0b-08de3d828620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gmsqPHoYvB+7UOnacl4bs0DwlmN09pYjnmT63BNtTF/PoYWyNG0kEUzGiC6y?=
 =?us-ascii?Q?RtVYNd/N3BJxdVKegOJ6iKcy9RJC9rOM/cI4zy6G7xeJuw3VF30m6WvIXxWa?=
 =?us-ascii?Q?dOmTlIIzoMH4H3BY0tz7/YC5jgKRIdbKmvw9yBaj4+ltkaKTp3oOXmMCnCcI?=
 =?us-ascii?Q?BzLARjS5jcSR6V4+6kKzdr3ATE0wgps7qMY1XHHypH4ZJ9TNUSe9a77IxH/K?=
 =?us-ascii?Q?8a6+A7pDtteGfq7H7P6hBWLQ4iF9BfKtFy2c1JOPnKkFuhsq7eDv9aBZEo7h?=
 =?us-ascii?Q?6y+1Mwgu4+9Z8tE87c/i6PtbYu458FE0NpZABfLPvYI2SYCviY60tnCFOobu?=
 =?us-ascii?Q?drcaA0PNiROixZBstOY9srNIZTyOnOcIPhQRculTtr03LGVe2yxapXxkTuMv?=
 =?us-ascii?Q?WDXWWsRED5edXRpck4DXJZi6XIHKujDJoWhaRG1hxxbfgbxLVp1MQGdopwwv?=
 =?us-ascii?Q?zqTqKf971tTswXhiVtROnVIX2V0GVXEBS5htmSPOqKT3MsamJR08yxHAqmQ3?=
 =?us-ascii?Q?d2rDpNSP5Hm6FbJGYt25pD+Fi+ZAHUHcf1acf8Vsa2bgalmFgQHGyME7qjbm?=
 =?us-ascii?Q?0+RtsUg1NvSby9Y0KC6MYMKgNBBXQY5YKJ2K2RVJCqY2JEotxjdfBG+phDyK?=
 =?us-ascii?Q?Krb5qk/ioQ+J1yDBgEBotgC3U0l1iOjcuRZYSa2lUNYSB8K+pcR6FpU/XPbU?=
 =?us-ascii?Q?FKLpnOZZUkUuyt89QCn1fXRrEn/+Ybu+C6eQf3Aao4Si4k60FSbnZwdSvH7r?=
 =?us-ascii?Q?2KXTJ1s2M2sW6O0OvqWd0Cf0vGCVs3n+jxV5jlGxePKbhT2ucmS0hFeiMzTP?=
 =?us-ascii?Q?fPG/XbQVJ9IDMuVP9lzqYAJWuuhjJiPV609PD7KX88IvTS5FSDKE1KyFEM+7?=
 =?us-ascii?Q?iYrxitEd4AGcrtTNJq6EcVBJIwl5akuIGwp3Rc5RIdwKfeMCP4v9ULx1Yz2J?=
 =?us-ascii?Q?rc/8hD2+maNQ7iXuakv/ZkLvJ98KMOBfnirxr4T33izVElqoWDxerFfIumWP?=
 =?us-ascii?Q?tq0sltu6g8vY6tFKxToFfDNbQ08gb6HijbBNL3/X7FsXkbAer16a7KNts1B/?=
 =?us-ascii?Q?hmYCtQaUHYaY/hVnDAXYY/VxN/VuTyivLwr9tgomUTxSXjSJCeJgPTFKDdhI?=
 =?us-ascii?Q?lg2GB8JVHexnq69ZuWS9DzvsvOVlMoC/TUzfTwUAbN1ZP7lZ8lNGC2ylsfWn?=
 =?us-ascii?Q?GCld8v+gDYji52yrHOiqixYogNIY1MR8nFcoD6peedTYI0/vLYIB+znm2CHf?=
 =?us-ascii?Q?39nAPlShWHRzoWkPLpLx6llqqaeYTFAnOKLHZcJYxwq1EI4pneO3zRAmqF+u?=
 =?us-ascii?Q?BtZUKUI1lc03BEqM2CF1mvWgL4G/CGcHizAxHhVpRB1WdWisFlf+CDyRwTb7?=
 =?us-ascii?Q?kZaT6QObg65veVL8yC4X9NWs0kKpIWLnsOVlqEM5k/xgH4evlizxnHsov8rf?=
 =?us-ascii?Q?SIcsUbI3LWoCfvF4eH0Q6YmH7jcSilSgbJFJ8XzGZSUzI/0CNfK9yTZEAyL6?=
 =?us-ascii?Q?z1qZlr0np2q0ytJEX7ZENu5T83wzHqIvSIie?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 15:39:53.7691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3f32ad-19d9-4f47-9a0b-08de3d828620
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6605
X-Authority-Analysis: v=2.4 cv=HLHO14tv c=1 sm=1 tr=0 ts=6942cece cx=c_pps
 a=ymtDJClzu6q9zAPI/ygaog==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=wP3pNCr1ah4A:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8 a=Gk9aBJqvnsFLiQrOkBgA:9
 a=sptkURWiP4Gy88Gu7hUp:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: OvjVSdEVs_YFL8u5gyS0Cy0eaXj_U1Y5
X-Proofpoint-GUID: OvjVSdEVs_YFL8u5gyS0Cy0eaXj_U1Y5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMyBTYWx0ZWRfX5+LTN5UgMBkl
 iTUS16yDpCN6SQdQr0AZfI4M7kNyRjTBfDKeLaETVAulAWj+3RfLRTJas/7bRzndtoPVcnzbPsW
 6pj63QQiBleBSuyrKbhegMlf0KRmbHNXtmKQSLvNYu2Y4jHE0ZCBM/XluEzJ3OIIncVMk8agsec
 spKeSiL/SxZaPd1281mskS/XQ5zEGHubm4VifarND8UAi3RZYM448DOragXOR1P+bK8VfZ6eaEO
 3LdnN2q4a0yaT0J3bB8D6mLxnwKCtgC38kHY/KCyGcjONlIbLQkGPaU2Fpq7O/tx4+83axjCR//
 iYNKP+xYfrNl+ZUf31kTdrCWgd93rKRFI3B1Ud6IuJrHt3HbOmy6RJXS/WMOHOdZpWkpxRISu3L
 +sqfClPoxCh1sfw8NiNXVu3Vf0N0gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170123

Add a device tree binding for the STM32 remote processor controlled
via a TEE Trusted Application. Provide an example of the STM32MP15
Cortex-M4 core exposed as a child of the TEE remoteproc service
(rproc-service-80a4c275-0a47-4905-8285-1486a9771a08) and managed by
the remoteproc through a TEE client driver.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../remoteproc/st,stm32-rproc-tee.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
new file mode 100644
index 000000000000..e9cf8e781543
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 remote processor controlled via TEE
+
+maintainers:
+  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
+
+description: |
+  STM32MP remote processor controlled by a Trusted Application
+  running in OP-TEE. This node is a child of the TEE remoteproc service
+  (UUID 80a4c275-0a47-4905-8285-1486a9771a08) and exposes a remoteproc
+  instance managed by the Linux remoteproc core via the TEE rproc service.
+
+  Firmware loading, authentication and remote processor start/stop are managed
+  by the TEE application. The STM32-specific driver handles platform resources
+  such as the mailboxes and reserved-memory.
+
+properties:
+  compatible:
+    const: st,stm32mp15-m4-tee
+
+  reg:
+    description: |
+      Remote processor identifier used by the TEE service. The <0> value
+      in the example denotes a single instance with ID 0.
+    maxItems: 1
+
+  mboxes:
+    description: |
+      Mailbox channels used for rpmsg/virtio functionality and processor
+      shutdown.
+    maxItems: 3
+
+  mbox-names:
+    items:
+      - const: vq0
+      - const: vq1
+      - const: shutdown
+
+  memory-region:
+    description: |
+      List of phandles to reserved-memory nodes describing the memory layout
+      for the interprocessors communication.
+
+  interrupts:
+    description: |
+      Optional watchdog / status interrupt line used to detect crashes
+      and optionally wake up the system.
+    maxItems: 1
+
+  st,auto-boot:
+    type: boolean
+    description: |
+      If present, the remote processor will be automatically started by
+      the remoteproc core at boot.
+
+  wakeup-source:
+    type: boolean
+    description: |
+      Indicates that the watchdog interrupt can be used as a wakeup source.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rproc_service: rproc-service@0 {
+      compatible = "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08";
+      reg = <0 0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      status = "okay";
+
+      m4: m4@0 {
+        compatible = "st,stm32mp15-m4-tee";
+        reg = <0>;
+
+        mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+        mbox-names = "vq0", "vq1", "shutdown";
+
+        memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
+                        <&vdev0vring1>, <&vdev0buffer>, <&retram>;
+
+        interrupt-parent = <&exti>;
+        interrupts = <68 1>;
+
+        st,auto-boot;
+        wakeup-source;
+
+        status = "okay";
+      };
+    };
+...
-- 
2.43.0


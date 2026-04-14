Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0503E9F83;
	Tue, 14 Apr 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180566; cv=fail; b=md0L0oh4DJP9RhPQWFfnsVCTXPBQ0BbXpRXo9B3FD1gMsZIwm0mOASDasPMNpEj17Vu6efwDs6brWra+v0Ad50WAdNDXlyrJ5OdzscJmRBLx9VosNK3iae9WnJEpSJfwGuUmEb3phr8y9FJRnquIwJmfX1EFU+XUxzDcQ4VcF8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180566; c=relaxed/simple;
	bh=H9+Rx0sZSUE47cM4LHZAiZsdZ3jyKcTyG734gKuH2bA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qkvd8rM8Jduk7BIpUxmFt+l+X/ZDzDpjz+SPcRzyjcQdl86tYHnEfbrtQ5NHZQ9VK8yk0KHHXU6EKigA8HVYDMaW0GERxQewcC1FyZBTCjSDipN0tg3WmbBwAVfLtYDc3Ii15uD0nLLxy6waIy87Wq9mfcaXpdzUP7Q812VKx54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Gz5ag2Dj; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Gz5ag2Dj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqqjPBbAFx9d0p8cV7bcxPCrIEDYAMI2gycPsz+hv03oyDEE+PNNkI+yps/j5lDD1xOG1aSIKg7ToLIhTWtRDTMsnDHKGmLy9wi/I87oMooRPDNwGkMW3LZ5yhYQj9ojWWJEANdvcU2ru6d2B5lTzNkoU9hknYalWX9eDBp7VC+H+CKr8euysWzavhvV2xKYVfO8bJa65aQE02c9aTXNj9MiHgAxLvmMPqGd5mkqfy338FWFegM0Q4Xgevjm6pB9Vv7E2VJHuPL1VXAF/P5nQ5VcCzwDH2YJXFWaBLgKVhRj2x5Lo5KodLkg9Fx6BMWmwDupv8+8Y8yAO1qIx3q9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsZA2EnshfnaacFfzKboi8kXs1ZJm3gOYoQM5LUOrKY=;
 b=NGZRjFFeUYFfpO2nD3Z969jYQhSrn02H3/OoE9jr+vy7y7IkmUu3m3EFJlJ/I0V8blLkL/Bi826DrlI1GpifDuqQS0SWiIMiktFGV/uPCI1lO7Zn+99/C6bkFk5uSNCUQROlYaDquJhswUjyB4QzMv1AjXu9AzaykJuDajRQc+JTl76tRtBtkx7qynYqqTQkWtOcNNLn5iLdGXnWvHvVJvYzdxh1ZhfpVZBL2nvlfaIhKbQSmF3AmJbHPWM7/5WncBEzpygc8piiFp/mSas9I9EM2H0C/cpW3A/EvVyq+lMyD24FUerYOiULDeDqDBpWpoVn3NIRaMsXEjihEuCu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsZA2EnshfnaacFfzKboi8kXs1ZJm3gOYoQM5LUOrKY=;
 b=Gz5ag2DjWxxCdeqxG/GmKegEzRXY5lXntusxpfwyGpa4VMmhl52zWkSLaUGRCiSDO28tgNgoAwnDnZhT4r9DJXpNZQwCffOnq1KSpQ+h5SWGXw5WYs3qJRpmFF7ijDPMX4CrqZ45nxVXOgSyq0IxpjkRVb16ca4yeiW2upryasF3cZLUht3kDn1wWdRKOn+mCKcTJ+6t7c3hNgdViQ8h3rxQySg6FluGMOahsvFPGsyxIx6VY/rOevWd7sBg5s8mbM6HwayC2f7wpGUv1ogHIvAXkCKz1+SNmhac7ABbxWx0IMMOm2T3jjjwh429qp5olmEdAHM4OHpsmVVfGHxRxQ==
Received: from DU2P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::26)
 by DU0PR10MB6020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:29:19 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::2a) by DU2P250CA0021.outlook.office365.com
 (2603:10a6:10:231::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 15:29:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 15:29:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:32:28 +0200
Received: from localhost (10.252.12.46) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:29:18 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<devicetree@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v22 4/7] remoteproc: Introduce optional release_fw operation
Date: Tue, 14 Apr 2026 17:28:59 +0200
Message-ID: <20260414152904.1679724-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
References: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|DU0PR10MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 362f149b-3e26-41a0-a58e-08de9a3a98cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iyZTotZBS/maypsy/w9+gwU1cyxPCHjBEOA93tWDznNStAiXyeall3F+aAz305En57a0v73HNO2UCSc67T24Gndgmw9ZNvTJ3dmE29jPzyOQ2NPUjmeqDNpBkuWHhKgxWzeaUMa5ChxHgZlCebfR/DUx6filZ5SF2XM1Q5oiJ+QBwrSNnv31Zd2zrMOdY/TUUPv0i+V9SnOAuCGzTCsHfL59z58eSCPDbI0PFEcxeT43wpjDZkmDgNJh714RlH4FTc2PxxeAC/SibloCZMedOp7bqyECMVxfBZNeHMZb9ksrT8CnewWV1yH3wFchYYMLpSqLAIdhRJnxkZCJAlR0hl0UjvRHdss/77WQ+8UPOePnoHtz+VYDlJsWZAgxx5OZwWVvIyIrcK2zB7Dt+pPshS1RabBRUPK/JadtK+akKOVstdQDU103k6uu4TIqbHsWwzzbxeBwBEeHIHdebCodOLqRJRPVUKQgNoObkXC2PQptpLf0Zlw+XIrsH56fc6guL4mjmzzWd6O11tKE+uivw0K8Cng02N3jKPln3NAtkY0uqJPNa5YpY98zjwRo/XuyBxZ+g4Vb94XE9Ai8vuSfjOal96MSSmDn384KKZH510nyuMyLlxGu6/wYUYHAKjjMxT1cv7ubVCaKotiR55UiSuNU19llYs2rVTrzPbpuNeFdfnlqHeJkwiQhNTMboNiV1aWigXemjQxtJnwve3ps2UvdfXxA/jYncahwZ0OWPJ/VRCF4rmNOP/rHFaSxzMT+I1nBfDFxSlg8qd8J0GTzCw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1ClBhaudzeOhcoIMDD8O8j/GrONHdJXPCdlvztLiUsp8jU8jDVRXgqc5E+42OyP9KZgg2iiGWXg6hGPukTjzqjoukLDCjfH53SBAdiF3H8w6pe9gXzdlT7WZSaMeHZs2vUk++H94IuEXzhSQPKNYh4LlX76C+6Uc3xa95mSc245J+FB4XwZ1GQZJheOshG1vu0lzEc+ujSaJPQLmPYQ/n0muLLA7wGlvuRztRvo8BagzPrRgd3nHL46+fF4irN9Mqeg4guoRfdeCcRgcOyklLPJ7NbNVotwtAq8SbvhxH35ctdXUPQFs+qQ3MicaW3NtP2JlgCLhMdWvpiTLwFGppSea2QZAOuaxT5S45eirMKji2sGkdkypxQJ9Y63pMZrJ5um7f95X4Mj5/umcbOYqlsrYgpq4w2pBxEO+lA06Lm0TUIYdIIJ9AyLlRs+uFdWT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:29:19.4550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 362f149b-3e26-41a0-a58e-08de9a3a98cf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6020

The release_fw operation allows releasing remote processor resources
configured during rproc_parse_fw() and rproc_load_segments().
For example, it can release carveouts mapped during these operations.

This operation is invoked in the following cases:
 - When an error occurs during remote processor boot.
 - When an error occurs during remote processor recovery start.
 - After stopping the remote processor.

This operation is required for the remoteproc_tee implementation following
a stop or upon encountering an error. Since the remoteproc image is loaded
during resource table parsing, multiple failure scenarios may occur prior
to remote processor startup, including issues with resource handling and
carveout allocation.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---

Updates from version 18:
- Rewrite rproc_ops::release_fw documentation
- Improve commit message

Updates from version 16:
- Removed the rproc:load_fw() ops introduced in previous version.
- Removed duplicate calls to rproc_release_fw in rproc_fw_boot and rproc_boot.
---
 drivers/remoteproc/remoteproc_core.c     | 6 ++++++
 drivers/remoteproc/remoteproc_internal.h | 6 ++++++
 include/linux/remoteproc.h               | 5 +++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ec1860e1cfa9..93ab505ff014 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1856,6 +1856,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
 
 	/* boot the remote processor up again */
 	ret = rproc_start(rproc, firmware_p);
+	if (ret)
+		rproc_release_fw(rproc);
 
 	release_firmware(firmware_p);
 
@@ -1997,6 +1999,8 @@ int rproc_boot(struct rproc *rproc)
 		}
 
 		ret = rproc_fw_boot(rproc, firmware_p);
+		if (ret)
+			rproc_release_fw(rproc);
 
 		release_firmware(firmware_p);
 	}
@@ -2066,6 +2070,8 @@ int rproc_shutdown(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
+	rproc_release_fw(rproc);
+
 	/* Free the copy of the resource table */
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0cd09e67ac14..c7fb908f8652 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -221,4 +221,10 @@ bool rproc_u64_fit_in_size_t(u64 val)
 	return (val <= (size_t) -1);
 }
 
+static inline void rproc_release_fw(struct rproc *rproc)
+{
+	if (rproc->ops->release_fw)
+		rproc->ops->release_fw(rproc);
+}
+
 #endif /* REMOTEPROC_INTERNAL_H */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 8fd0d7f63c8e..a2bb51a113b1 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -381,6 +381,10 @@ enum rsc_handling_status {
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
  * @coredump:	  collect firmware dump after the subsystem is shutdown
+ * @release_fw:	Optional function to release resources allocated during
+ *		parse_fw() or load() operations. This function is called after
+ *		stopping the remote processor or in case of an error during the
+ *		boot or recovery sequence.
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
@@ -403,6 +407,7 @@ struct rproc_ops {
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
 	void (*coredump)(struct rproc *rproc);
+	void (*release_fw)(struct rproc *rproc);
 };
 
 /**
-- 
2.43.0


Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535E3EB7E4;
	Tue, 14 Apr 2026 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180568; cv=fail; b=bwLVNwFEA7PrH4/tFVHlsONc6kD7X3tVBKKzxWL1JBt75nXYQ0GYjijGtZ1ulizElp0ojjwtaKvY97GcXxeAR36xCaEnDTD+fYSp5yCrfqDwQE8yOZ98j+qR+RTZs+N+EBTSMn/kfvyGzkevTrwqomM5H/EL5XvpI5yB7VkdOrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180568; c=relaxed/simple;
	bh=MFJNizjQQGYyw8aC1ATnEqrixhlbAc1nPP2x6lHK9lI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/MJqL0+IZS7Gnnnk+w76S63dFB1DRjsGAR9yhtSftcOml22p//QaatsJPnZ1ZXUNc0M9ZUsStgA+XT7n2tRLCRneE8MI1yJdlfK9Jqs5gM5FJXHRNhBAJT6br/CQ8vsNDHECsSZ/WVObeDLYeTeAg1G0HAFUKNFtobcxi7Jeh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ozwbVwea; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ozwbVwea"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPVgslaTjKyOKaDkJMUZP7Js5my7lT6VOpwyjPtLzpX27LsnbN12yEZcxqpeeX9oWwUr2eRiBnLWMLkZ/CIRHDSBuwvCWoxZ0rDTPc4Kvf2zJhiHGTaQvvf18LAs+48D0v829mkustvX8ODERKdyJrXSYwCxQVI65raWOrjILTMwTV0Y/tX96tdh+X+X3sTftAyNCIuYtuGbWUAJXpTbSO5EfyB8CWEt92sKfT04VDuo8mbBK0h2aRee8b9eQTFaeBlDXghevzwUW7KEiqOFvY7ypUcFJmw8YkIzrim3XQAHPi8EuBZsAFsew7/8T32XWDnpIPqkn0N7Z94tFjJG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRyOHtwxBAWTaSYwzi+cFsdXjencMM15jUAnlq1EhzE=;
 b=DR2yxP5MJBZi4KvJYAgQT8ogvVF8SCRpGz3IlPFhP80L6fvt9NKiPZfz1rM4PDyOMbvBMA+jqvnN71gpeCPkXxOapxxrIDV1ImqNEOfILDfZsFvVPY+boWSFvL9fv8JXkmmIiggj6n6z9uQgN8K3banzIhqzrItdXoTUAmdylDBySDFWNN5g+oo4l6AlEiZn6rlB+77lbEU85VHf+r64lFowujpD6/LcNs2FNMl+dNSkD9bL6WR3MT2nrpeWaTPl8NWPn5bL2wVi95bXAOz6g/fnU0R8uunIZZX9MztkJMWZ1GDhpj2BFRzWAv245Xdwa7QO6SFYQ51+4TIpdAmhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRyOHtwxBAWTaSYwzi+cFsdXjencMM15jUAnlq1EhzE=;
 b=ozwbVweaEF5IlTt31lNZEUJRQ2nXqHXmCVfZH8pWSeHp5ybxvnUpPCZOSQWKWXHFPqsOBL8CUd+k8deMKK/wVIfbOl2W3RUiyJeEbIluNUjKGbdFUa/yLZMPWn6CVEVdsgB5IYSK9R7r4FNE3CxjbncF+eKKD+UtjdsOxiuH/giT9srWfhUEQOXLO3PE1EFemWJsw9KqnOSkGKbrrzF0QXw8yFt6j8PxtKrYTAo3A7jr8aS4XJCdT32l1uun6y18Ux6W8EG46beN9w5GflzRJ/hpe5XI62Fbgqav98cxjJ3wK73bGeTe3DdHAbFSjLJsESDFDSAVF/JixbGW+hSlLA==
Received: from DU7P194CA0026.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::23)
 by GV2PR10MB9654.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:29:19 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::f3) by DU7P194CA0026.outlook.office365.com
 (2603:10a6:10:553::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 15:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 14 Apr 2026 15:29:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:32:06 +0200
Received: from localhost (10.252.12.46) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:29:17 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<devicetree@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v22 3/7] remoteproc: core: Introduce rproc_pa_to_va helper
Date: Tue, 14 Apr 2026 17:28:58 +0200
Message-ID: <20260414152904.1679724-4-arnaud.pouliquen@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|GV2PR10MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e85212a-1f58-4d08-912d-08de9a3a9847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+G+3PF/UvJG5jnATktDzNtvKWa2ZlczQsHQGFKm5pxqTDi1fXLIumPE7ED0PYwCdm78sV/f/jEY009OYxYKVq4mYxaSedJ9xxIdGo/hJ6oyW/Me+YpXUooxpIsu9oHZ0L1iT1woZHTvw9RKU0VQTN6UB5CWAiQvD6iEOLXDS6PL7tQIqzCA2M25A56iCX6C2EDlnGMrngsu4K23E+tjEMNX/bbWm0pjPqBuwCmb/wVF9h37Am4kb9eNRWSEMPRtrveiMOsORGB2ISreNyTWRvIcO95bSYDGLHXjzG9rmADx5IQQN+NV0YxTXyO6uFBhiZKknqPMZmaGo4QriJAWojXgSzKDzM2gD10AmaUZvYUk+cBic7y79iz+MI6uqyJroyhPvdJ62baZFLOWdHdjBPIVaG1Ic4RCz6t1Xa2zZy8y4rJG+yUvPvz7n0XAxHCM4VicbXIN8RrqcUaMVT2wJUWJkcas0tq+QXdedwfUosILUyX9zjuYyLNIiVAFg1IACIUvxzEHhLo57BPJp2bK4lP/pRMLFTvvPkEZv0g8lrQiMk9ZTkwnw7tyctiK5lmEvo8KZq/RuV6WHa93/DYHeR8BbTpd4lLPTjVyPvl+s1ypMnDHbWeMLrMY+YvwO4NTtC4ypX9PLf+D/9BY2RK1kwRv6o71zUw1MxVOf3rZm6IJUegzOad9cbc+kXpLVs++UYQTNJ1B6t4W/b61XqRKahU01+ZlYu7FJeZgbvwZ7OMVwJPLz37JEC4jmh45yGoOf6h7UHlKDOZZcTeNpciXMxw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ti4vLGVRUnmsQ/WUdJVBGwwvamp4t0b9lAHog7nMnNDU71Vj2GFj7aDvHm0LA/JYldGB2EBUiTlUOANgp/GdvqvaI7YcCN68ebxcZCghC2VpsA1pVJkn1tqaLXN4y+gIWbpjldX+uHstB663wY3Y2CVUVE9+v/NxlKPllGlVYsAmZ3fYfWPpJzOq2Q/5hr/e0c81k5UVWulzie5FwHYheH4JhtryfubCwq9sFoKWPnwB1MS2U6+DMDfhLO6OZ+VwykqM7E6/yY/Q/Xf2Wi+JRreOODc5ZyTTpsu6vMhPzBOyaG8MOCp43xKiOHA5hFzlM95a8zG7zgpo0vWJq0CmDBAL/VNA/wTXignLKLJFwvveJpFYbRG6eQ0HlzU72Jmg5FTEBuGig5IeeTjzuAeI3Yg0nPg+PpchVdjgjzVkHYC+yXyMjzyd19IBRuL3HMmU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:29:18.5682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e85212a-1f58-4d08-912d-08de9a3a9847
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9654

When a resource table is loaded by an external entity such as U-boot or
OP-TEE, we do not necessarily get the device address(da) but the physical
address(pa).
This helper performs similar translation than the rproc_da_to_va()
but based on a physical address.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
V22 updates:
-  use size_t for offset and remove its comparaison with 0
---
 drivers/remoteproc/remoteproc_core.c | 50 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  1 +
 2 files changed, 51 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b087ed21858a..ec1860e1cfa9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -225,6 +225,56 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 }
 EXPORT_SYMBOL(rproc_da_to_va);
 
+/**
+ * rproc_pa_to_va() - lookup the kernel virtual address for a physical address of a remoteproc
+ * memory
+ *
+ * @rproc: handle of a remote processor
+ * @pa: remoteproc physical address
+ * @len: length of the memory region @pa is pointing to
+ * @is_iomem: optional pointer filled in to indicate if @pa is iomapped memory
+ *
+ * This function is a helper function similar to rproc_da_to_va() but it deals with physical
+ * addresses instead of device addresses.
+ *
+ * Return: a valid kernel address on success or NULL on failure
+ */
+void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem)
+{
+	struct rproc_mem_entry *carveout;
+	void *ptr = NULL;
+	size_t offset;
+
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		/* Verify that carveout is allocated */
+		if (!carveout->va)
+			continue;
+
+		/* try next carveout if pa is too small */
+		if (pa < carveout->dma)
+			continue;
+
+		offset = pa - carveout->dma;
+
+		/* try next carveout if pa is too large */
+		if (offset > carveout->len)
+			continue;
+
+		if (len > carveout->len - offset)
+			continue;
+
+		ptr = carveout->va + offset;
+
+		if (is_iomem)
+			*is_iomem = carveout->is_iomem;
+
+		break;
+	}
+
+	return ptr;
+}
+EXPORT_SYMBOL(rproc_pa_to_va);
+
 /**
  * rproc_find_carveout_by_name() - lookup the carveout region by a name
  * @rproc: handle of a remote processor
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..8fd0d7f63c8e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -690,6 +690,7 @@ int rproc_detach(struct rproc *rproc);
 int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem);
 
 /* from remoteproc_coredump.c */
 void rproc_coredump_cleanup(struct rproc *rproc);
-- 
2.43.0


Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CAA3D3311;
	Wed,  4 Feb 2026 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770202353; cv=fail; b=jTWj6/y/Ii5GsWZcZoFHFO21+7MibBC/FHIW7WSNoGreEXkCxlD2bTjmjMrx8mJMA9l4CDYz6dskrFMCXhbPFmf4ES5ZXV1ZIfUpUa3nMtMNR0AKV9nVsWdZzryPCQkS9dtGOmQ77fylZnR+5BrEDOEmkOPhpkTJlEjt7o06gBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770202353; c=relaxed/simple;
	bh=b+J27v9yfOCPUfs0o9XeIylhwgYMoPhQUwJ9z/q37yU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aWCbN5s6Y8EZ0BKl2c87IL2uI/j/LyAh4sV7mpOPyNi5U3aCP1/zCRQ6OwJsTwhjwPqaebK9io3xtG/BzRmrRWy0P1lZ8XQurTlQhqlVzyST7g8GEpJpmYcBMYk/7vW5oUZJMqI6MUQIVps3Vc6LZwLv71PlRxhymNPjth+33RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cI5+SjwE; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cI5+SjwE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yn49XDzhP1WqCWOOLAhxnHPYyPbUvBjCGawCtt3v1Z8kWBFKXW1l5Z8V9oVWsrbbXGJ8vlr3rGBM6b1nf1qSpanJLq1FwFtiBqqUMfaigGAhtW22o9n/h+sQafjI25xwudpnJ6wPANRpCs9CYPH8ZR89KOj+nhHYIh7iiB1Z1EK52G9wF0oxwzpXENYPTbI3OVkk6lEvLCXQbJ883+LN/0qHVQSy68Gi4RAZwADaK0fhIm/sly4pu+xRUBk2qkxbnSNXC2XMaBwA35npv5IXPH/Xul89aamVD1wEN3o2IS8q1bdKABmnx0T2d9YRfvYK3NGMed5+ihou7rHYfCfkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSh752ofBnog2GaJSvOqs4K/sU55opu/L8KWkalK70Y=;
 b=nCB5+vmY+6T+K3Mg3id0v6fejQWrOkEMHUjPiyXJ7n86sXeO5WYupIG8f5KXjC+RYHwNr6fcjrUs7BSSKFsFS0Idn14BwAMRzFoKqtafsfLCPNUt9vblYAxOef3wXjXK6TUAVjYorty3QnVIjesskDP1FOlz2rlsp3lapNOR8Zm2swosH0m/Au0shPbxVjc+YBFJSWqkExlls6vopiN/WbfXuWOmSiRffYM9YE7xELFEmGgtC8MxId7hDO9qm1iVrX/SXhi7oLriWY7qrCgydqn3xnLeHH3C586jbSlVivCoKjNzfUJv+zBTyzlu4ZrsjBqtgmwVzXAE84UrteP6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSh752ofBnog2GaJSvOqs4K/sU55opu/L8KWkalK70Y=;
 b=cI5+SjwEXW7gWfNusVuPjucD6StY7tr7ysn5+mC3mNpQ/zrz5yl4facH3W9+u3Blkg8/MdqhipNEDlA20lvWAjHFoRpTUaNB18hPOqUprN/mU4jfDAwuJAsGTXaxERpvdLRryleBqWKHapagCFa6prH2V9EX5ynyqI3GSLyogkcVKXsbVKUQxusm0pj/hOtErjfLczqGE5eF6VoFC2qShrC2ZGlj0Dy8clx1Ceayl5UZ6HrQSkFauyIqXP4+L2zDkotHZY5ssS+oThUE5QjGxABZX/0GB9IUdF+DrkN+ktm1bpcgLnBlT1Ov69mi/hYdE/lY9OUiXDwTFPG5TAwlzA==
Received: from AS4PR10CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::17)
 by AS4PR10MB5149.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:52:29 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::bd) by AS4PR10CA0027.outlook.office365.com
 (2603:10a6:20b:5d8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Wed,
 4 Feb 2026 10:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:52:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:54:16 +0100
Received: from localhost (10.48.87.127) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:52:28 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Andrew Davis <afd@ti.com>,
	<arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 1/2] remoteproc: core: support fixed device index from DT aliases
Date: Wed, 4 Feb 2026 11:52:15 +0100
Message-ID: <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A1:EE_|AS4PR10MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bae5884-44de-4468-39be-08de63db7dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hTbZqmqZOetYYZSvtwRUuSePpfYgU5nbfV00I+Chp4VCD7BWbsopoTuHIN+o?=
 =?us-ascii?Q?+HHNDo7eTiUKxp/+w3lnksl2EdwRnilRYlN4oxDqUJ3d3E3Po/8EM91uPLak?=
 =?us-ascii?Q?2DlhIix7mmGaojfmdgeANcbq0GAolSSUnG/dlKJ5c2vFJBzyfUapKe+yBPmN?=
 =?us-ascii?Q?QTJNz+4wqwXIiwJc09Vb2bBS79T6MKvK7a7IjNvyinazCSg843opQKTzTCnu?=
 =?us-ascii?Q?bvr+TY43hQv3Hq5F+ixc4uBShxA6AWoGoijv031SeXn+Nk0lyBkxe3/XFSTG?=
 =?us-ascii?Q?8LcGeJgBhNFJr9fSOYE+mIxWEww3R1HSRvOOTTm0XxjzIzkfLNtSYkjer3WK?=
 =?us-ascii?Q?XRuJFja3yQWshMxb0EPLeVrIpEddSPkGWUmULWdIjJDdBi5f4vwfn8n8R3Pm?=
 =?us-ascii?Q?m/3QYpqh7TgtgOhv5zbqSCslB4OoexV/bWShPI1Wiix95JjJ8OE45tGqQe/8?=
 =?us-ascii?Q?wF3iMNrpl9cXz2vRx3324YYJZtAFSIycRBdmdSdArURh6JeIw7o6k6ymGqJT?=
 =?us-ascii?Q?V3jwhZs0Ri9UQRIjQmccuzAnHrpUqsSoTdqKzYo3qRF0ogspbB359Yj5l2ne?=
 =?us-ascii?Q?lpe7cWiQ7zfXB6ZUm+qpbiN/MTt/8ar7xfHGEAG9VhNef4K3kPLbhmLKOViM?=
 =?us-ascii?Q?l9gNY5vE+jguiw+Nl0CVK+HAYDM+n53e35E5FwzV542Ts4I33PB26UTp/nRi?=
 =?us-ascii?Q?4nqtf71cd4AUzU2CO/3gHN9RuQpBY5ynCuejlT0duJVFuQTpFasRljXBhpbn?=
 =?us-ascii?Q?Iys5oexscZyepMewwGTi64QLC/iBNqr1gLvG7ndA22x9UUpXub7z1S3bBEDx?=
 =?us-ascii?Q?HO2qljkE2qT/QaSha23CF2d35XZL3wJxZvw+UgboriK/RalzTy+mB6l3BvxL?=
 =?us-ascii?Q?pkML+kNUHNwEV25LNWWNQ1jrI6mJ/VTioLnid69W+WbQIC0c6XpmF5wBjZvC?=
 =?us-ascii?Q?YWiANwj/Gonw7voJEflv+Qdyfi1+MaLKMGFolLofQpoAWHJWBERRV3+Y5r4b?=
 =?us-ascii?Q?sjyKL4uLGSRhyTgvUV5RftkhogY+W5XLQTKbpMl/kLSu1+nt+OnK4qpqMmts?=
 =?us-ascii?Q?jcZt9vws5I+JlaxVnI30Bzk/TDvJVDXK1VdqYuT5l5o39rZOGVakMiyS37Xu?=
 =?us-ascii?Q?yMaOKO3bIvcnP2+dJ4QjMqrEDrMIOAiT3ZTIMS/vLBLYh73exS2wmwXwejfe?=
 =?us-ascii?Q?nCundQDNC4vcg7pbFf5dYP02b2bYe9afVwiDgYeT3ORWlD8B58TBuGSGk9eT?=
 =?us-ascii?Q?GOFIsJb9x/ZwGi/DObJ8eDie+XfrKpBvYmcpFQO8CIW/cw00uxZobWlyyvYF?=
 =?us-ascii?Q?vAxodiRJpLKBupMyBTH/ivhZoCgVhnl0Er3emnASkUrOSMnpIW5kC2D/KBdp?=
 =?us-ascii?Q?oNnEaU2WitLBlnrY/URbA2OqNlZNgicrn+LpYQCBP/pGYZ3VU/MHrLxGG1NQ?=
 =?us-ascii?Q?O9XeZgU8ddl+uuyEOM2LrVc/NKabLEDvc2ZfvZkfPjXYalXFXSb3Pu7uQg7u?=
 =?us-ascii?Q?wF48e3dnP53r5NEsTMlV4T58oFOFUZA7mgvaWuqXxPvn75+QD/jk1GxRX/aw?=
 =?us-ascii?Q?t0cmDO9dIg24CTaFLRvbg9H66fJgkj01+Y5Foe67r5rdcKBT4Z92FsOeI1wR?=
 =?us-ascii?Q?BKrevwiyDmPc82AtTga+6jVhm6qDFGOOBJi7RbS9eCOD9+BBOOYC+J4BE2rg?=
 =?us-ascii?Q?G07I4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e3CyGsQ2xmenw8l9KpO+OmgdQrGVok8Ne+Lw+i3iy7WYqTPD6OReYgnQN/+RyHXAR+VR//KCMGYfqC4zyzC+Dyqwr4Xex4frjbYr1ZjIcwittWhC3RJiEbXi8n7SZnDNuR9gGW5GP9rFXlEjDpSoPG4OQshA2fXLA7bcMYvnSJmevjpsbvMHaqKIFIDTeNwZW7DB03ogUvI0hBpOu3nDVVzNVGwvLzkjSAW/2Y/tJ/Ku3P19o1r716A+/ld2lx7NirW6VZT5gaYuiczMZCnPz7zbZ/GCou2FiRjKzVvGqxy8qL2was/hgBKrml72c+S0BpgtZOuySkabD19zKflBaxFvCQHJz+ii14hmJfFDfO+juuhTE1iTExL1rjqlKpwu6jQPo4UKYD1/tZqMNl4tkguflzWvhb9/K6X7CQpN5426mnpPwaaKYjg8eoPkJ/yF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:52:29.2712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bae5884-44de-4468-39be-08de63db7dd9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5149

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
Tested-by: Peng Fan <peng.fan@nxp.com>
---
V3:
- fix double space typo
- add Peng Fan's Tested-by

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
index aada2780b343..4a02814c5d04 100644
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
+		return ida_alloc_range(&rproc_dev_index, index, index,
+				       GFP_KERNEL);
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


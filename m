Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A452F5A12;
	Tue, 30 Jun 2026 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841265; cv=fail; b=oS23DVtIczbHFWPwhVV2OjHUZOc3EHonqWqS955EOeReEOa3Jk0DQQ3ToXqNUgCbS1AbG4kzOEN4Ru2v1181uicjdWqaFuOeOSLUQ9PrZq9YeWXha3rGsaLQq19suimrkR5HDm7w0YEN+NqDagIsfAbv1tSGSQjlsZJwhBoNZc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841265; c=relaxed/simple;
	bh=urgzCngK6lu0uSK0jgGvgduF2ZoG+V0MANs/GqPr7UY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LwytKatrR17SzOWSnEuTh6YVRMUvMyufNxj9V+AJTmXeUZmqTWBhxlm9iQR3pWovQrCkzG4CkQdHz5L8a1qyIk8FJGecG+cKhd4v8vHD4vRA3W1NvU+xI2XoCjdVqxwbNE3WMyrP2VMM/dMIDxgs773K96owadJsynsqqpnrc1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qHFj9UQA; arc=fail smtp.client-ip=40.107.200.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qHFj9UQA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqDQrWoSIAStdCQN0c7uz6sR2RL5YTZPCrMCqqaSHzL1clHyUq/Ma4dJeyqWbdeSyeDB7l/p/7QCiIf0fWwPKW6VtuCd5Dyyum+eoHc2AdfbZSrpPr+PuTP2M7Qh4WAoS2wRk/UQ5pX9qQhPa13xgGGgRtgyHcVQkGDcAOgkA6PPcuWkjQd9k6PAQBmaN/z9gPFXWhGEULN9uwEPcxZNcagyd2gLUCp/3bWsLRBSnizxzRBrjKAG/ya7kvGG6iqrhiyaUkHrSfHg4qNvHVzKkak46Gb9VCEEEkwvv5l6bdF/FS4ETpy6tXk4SiVHCh64l+KI9tcwbP7t3LXiDP1ecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGK9p5iOJf+in+M36/JlNCWTHNtfqbVuponWtrZRE8A=;
 b=xt0uAEhMMDIPUPIFA+DFaHvR5qW76eh6yNZCaV3YX7aTgBZKozHPYluyfRi7q7DOn4lzVjfcsApZ0Nc/DXRfeBsAaPwn0E7KxxFl8bZoWqRpXtj9GtDuYkHvyquO+BE5+MqBRAEQogS96/6Uv/2DKCZ5jyFrETDA+F3PNMCpng7SY/CuB6yli7T/ErTtG8OFQjOq0zfTV4E6UC65dQVGO9jhZj1vyTBzbUIC5F1A9ajM+7gfnK5se+5lhbHApY5y/AhrMjkanEMW7ntwyNKJyUywCN48biMM3zJUHxIn0psaM4Pe90aN6LzpBEcxSYb8FKwZJMWcrMDuWk4SMg4Z9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGK9p5iOJf+in+M36/JlNCWTHNtfqbVuponWtrZRE8A=;
 b=qHFj9UQARManfvasvM3eOCO5xMAp6WrVSnmjc8FZ8NwX0oXZNjFF4SzxlVtUFEzf//Faw5ywu5QqPr1BJPVrt01dW3UmS2S+x7b7mqGyCVmXyU99gtiwQoR6Uj7j7dKCkeFou+l07vkO4uBh65bmd3dxIwnQ9PzTrIe17b5Hzd8=
Received: from PH7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::15)
 by PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 17:40:59 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::a7) by PH7P222CA0004.outlook.office365.com
 (2603:10b6:510:33a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 17:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 17:40:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 12:40:57 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 12:40:57 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 30 Jun 2026 12:40:57 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ben.levinsky@amd.com>, <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: guard wc-ioremap helpers with HAS_IOMEM
Date: Tue, 30 Jun 2026 10:40:56 -0700
Message-ID: <20260630174056.667646-1-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|PH7PR12MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ea1d56-0d34-41ca-b663-08ded6cebee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	m8kFj0THqrhWWph48T1LfsbTYovIBbvbZhijtUigWoxLvmuphtsd60YIG7KspMiw8ogV4vNOB1JrEvhJyccljx452BSVIsd/L2KLx5+ZJ1Qr939MAiS4r/rJzs3zp831MEGuQUeKaSRdFKKwJzW9mXZfhl+9/Dr2RYCiMyQVEMiOwIhW1EupjsxXxzBtquTZqSYGEh8BQDIvPqcUJq1WcuRdfodF2wPH06GpsdycVFzeEW8pGCelwX+1P3zoXAt4uQnqCb1YQoDMQ5LbJaD4q1j2lxRRmbUJaq5pLBgfYuCCDHP/vF9lSujoJFNBNeM1/ct4Wq1aL/BqG/AtkZUp082ZmM/MECVVzZS3xpE5fDuYlUL1d6Hm55DLEQ4UKu0+P5EJvrK2j0m6FFCMng4Hc5Bj4uLZ+G36VZrV4mVq3pplN2tHtr9YuMRVIUO98ivcqmjDwYFJaQP66O/gu+qiAmUMi58YnoCjeM8dM1nlIirgkHzJab2I3YHJSZAe74lXiRTIaLGfnkdJHcPFG2KGz2A8iRgEIvU+IbP6KDvWmUnYvo8qfeoy6LpC4wMDrKijTGFTofxk2zMdmC7+6U4fS4c89Pkz17F8FYt05EajjLdW9ka6Ic692ZDDrKyJIhRglsnlhRlmr0D8GG2qGy8YvD6LOisQlx8X4kFjJLsLzwhv2aKARKINPs4TyqJIFncvcJ6g/wJB4mVazNwtn32m8A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QVYzN9lA6yInZwNwqbTbCXAW4h0xq3KwVyniQN1dAUHYe/TNukCiohCcxZoMBIo/G3GSGxZvJntNeNSfHoexBZquhTxvJP4pwIfEguZb8S5QERCuH7n5SjbxiWy607CddaX87tOfW+g+apFGa10FRV9GZh0W0J/x9wH7lXtzcCmfemPdF1NxDAMaLF5m9/pQuzbzIOoyWEFCK0eVM9MrTELtALHshUMtbhyuXhhxefdj2UCXXmfyY6VSHStrGLEiwC4e8PvzeYXzMBCNeO+6x9Wcv4RDISgQ/8RjvUifPMye5aWc9RjVgaA4C+n5p02VfugA1UAXfOXkZa5TlQz3etufe2R4iwBp0qEpwjNdOb6YMyzl7LPFVOD57b2WMTPQCJdnmuSCtIaR1+mNoT/CCzpVEmYMoYxNlB593Xul1vky83h6rFqnvQ5sCOmyXmWr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:40:58.6377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ea1d56-0d34-41ca-b663-08ded6cebee1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8178

The common wc-ioremap carveout callbacks live in
remoteproc_internal.h, which is included by the remoteproc core.
This means the helper bodies are parsed even for builds that do not
enable any platform driver using those callbacks.

On s390, CONFIG_HAS_IOMEM and CONFIG_GENERIC_IOREMAP depend on
CONFIG_PCI. A randconfig with CONFIG_REMOTEPROC=y and CONFIG_PCI=n
therefore has no usable ioremap_wc() or iounmap() declarations, and
fails to build the common remoteproc objects with implicit declarations
from the helper bodies.

Only include linux/io.h and build the real wc-ioremap helpers when
CONFIG_HAS_IOMEM is enabled. Provide no-IOMEM stubs so the internal
header remains self-contained for randconfig and COMPILE_TEST coverage.

Fixes: 50227acbf4e5 ("remoteproc: Add common wc-ioremap carveout callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606301559.w8eorNQ2-lkp@intel.com/
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 02c00475b010..3a742ef6ef60 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -14,7 +14,9 @@
 
 #include <linux/irqreturn.h>
 #include <linux/firmware.h>
+#ifdef CONFIG_HAS_IOMEM
 #include <linux/io.h>
+#endif
 
 struct rproc;
 
@@ -123,6 +125,7 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
 void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
 void rproc_remove_rvdev(struct rproc_vdev *rvdev);
 
+#ifdef CONFIG_HAS_IOMEM
 static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
 					     struct rproc_mem_entry *mem)
 {
@@ -148,6 +151,19 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
 
 	return 0;
 }
+#else
+static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
+					     struct rproc_mem_entry *mem)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
+					  struct rproc_mem_entry *mem)
+{
+	return 0;
+}
+#endif
 
 #define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...)	\
 	({									\
-- 
2.34.1


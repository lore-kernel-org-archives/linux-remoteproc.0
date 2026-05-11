Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010030.outbound.protection.outlook.com [40.93.198.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783C4D8DAE;
	Mon, 11 May 2026 21:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534334; cv=fail; b=con+zLo1tVxyIqZfsTAt/jiyfjOwR/7/YWBMGvLyqxFIcfTsqrmiufka+UxG+HWd5Cp8oTC7AuLwsJWBExffx4v63UVMWbSBrgat/9lBJp4y2iD1hgxPJtMYA++oDAk5RvbhSJmVO01mnCSIwZVIFNHTsqH4GhjQkd/8ieLjiXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534334; c=relaxed/simple;
	bh=yHJ+rxXQAW5q4k45Q4lMTjUEAuEy5HklpBfPJr0FfsI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RoMcdBEHrjJ4AfPf/coVjQVirr+ul6zw8RQOkdMNrH16CEBRwKM8NrsCJCGnBg4l93SB0o1X9d/x/82v8b6n8sEP6OZi+CVRo0MjStP0HwX8AjyqhZZkVXVObxTKQOrBTNduZWqRHS474gA7fxfEuFCSQWl++TsqBK4vycpUso4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hFvVd9bW; arc=fail smtp.client-ip=40.93.198.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hFvVd9bW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/VoHgU/Yae/qiBnUPzMlgw6RwUU47gcjeuA6LTK5WGY9mZYGZ7L30Y5iWIRcZR8Fne5yBcwCvI3/2lQvG0HgqfVe0RyK52NkSjiuCuTQyLnzR2fUO9mSimNVXO0ZWF3WhMeShoaCePsYwbO3gRLknfu62CijHkwVDS5BLmyjDC8XL4DP05JSjO9PgqAXJTJBeQPFuPmz3SPPY3iJQaBRNwUuVeWJTnk6iTi9Q+IOTuy/9G4VljueGt0fEmlOjkIiQTVkMJXcLhtR53Bzb4eg3IHKQOF4TQLV1e9MILF1O24YYTvyGdqsmGiGFidPUVzbxUWBHd7qMwd3UfQs3izQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNhbZWAkgil4ZGNUckgm3UwUpHeOrexLpsmh/WgnsKo=;
 b=CDg15/U6e8Q/Qt/JeG4uB0UUundu/kKx9njYGOC8GPSfK7Aq5mZKg655n48eYPpHSrh7Tu6BPpdvWfcL27s+8EN2qlkfLtblGGNsAXU7noN1Z59YR4fyPKg1nLTIsnb0nKvfspWFDcZgD/C0AMj0oaE8VqSfUkBXiHImTbYIH0yUUl9+H/KM5ve53A6Ga8dg/2zBWkERaAXHAUCmO1k1Ku3KIfaM//KSznbDzLrQIFoRyZsjSBzz745Ji1N23kk5JshFxvFjTmJMyq2/g71+EW4N3PVLb4LAX8TNzyOgSMhla2fjrZgu3Zl65fW9T3pmw4lEdfRrASfxItVyNH7zPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNhbZWAkgil4ZGNUckgm3UwUpHeOrexLpsmh/WgnsKo=;
 b=hFvVd9bWsvdqkUZMkJtOPyZlJq6qjxaBVHMksNUOTCEGmhsIHOojCWRdjdrEt3HH2f4+CMSvS5NlpA5qysPgjCMCjgmjoaqI5cdx4fon2J9snDwWez3d3MX2nRrAwjwZe7vS13BD4EFc6zus0eGB6db+PjF9v+UnIFZD1F+kweY=
Received: from PH7P220CA0132.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::24)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:18:47 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::19) by PH7P220CA0132.outlook.office365.com
 (2603:10b6:510:327::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 21:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 21:18:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 16:18:45 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 16:18:44 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <tanmay.shah@amd.com>
Subject: [PATCH 3/4] remoteproc: add helper for optional ELF resource tables
Date: Mon, 11 May 2026 14:18:40 -0700
Message-ID: <20260511211841.284809-4-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511211841.284809-1-ben.levinsky@amd.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: fe901cc1-217a-4720-233d-08deafa2e33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	K8uLiGXZVmmbda/xbDFcE0A2l70yyuIAE3hojCTw8CYLJvem+HPicGAXNYkoKvXKfCfWsfZd6ePTIHwFBP7huKb1Pr7mU+g4Vc0+mJvlBrmHigEdfWoLzC0Vwqr3uwCb8zy6+lkSOH95BXpVHJ/8jYTPdE0DNrbIwiJj0U1azvDpTySsRehO0fDItpH8bfbse/4AD1Bc1grNHP9jG8Kcg5k8fkDZ6U1vB1A5IYrITTuG/ekcpScZKVnSBADt8YrccsJTey+K8DZW8Tz404jBmzV5J2ELLd8VRnvjU9qnvFx+peMnx6rwBQFc2DdgdN3zaAEcY21HT6+3eJiNYLuSp8leU3LyUYxrp/tyWRw6xqPKhvUrbDN+r2wYYk2rNyh5k+0jy6UreFeQkZp/O3PsB8T3ecm9ESb2Gjr1pVIJZw2UEzNJ3JnKJlPqJ22D2noF9/PfR29p3Pr/hHhFgVz2TfkhDi4pMcjnWtrA3eTdxk0NT0fQbNcuR4K5DMMpo644pvqAEAh2wgtZN4sDoVEe0RN4Vu9Vfv2CKD/2Ni7nBoqD4kCEZi+xaBnkBYUhk+TidJjhZ3rHOTkoTdd2/DJOjyWD5N756ULy+HW+Wzqi8hUNWOfJTp7jVJf2FsBUaiFN7Lrfiwfk3aeIhozttWjG0V2qyCcgQhbk+0Bo2TCqyRDhO3flzEjHUqxBX5uv0SKwKahrh20Ae48eXCNDyFlaOZPSpkG+vJSfAZhGOpPwjIQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rjQi7OAU8vP6EhCRNIFp5DLrsgeYVAKkelpcksDjFvz+p7C9PEP2B5+7fh9GsO5K4cFpWh6oB6+NShHCROG5Q+qrig9PMM9XAsWmlePIhne4zcalr9QxtyzMLMZW2VqeerKoBfk5xesbTI02i+7OLgLtn9wJDVkg55ehDm/sSBXWmLRht/ZLH7nXafe7an9JkDAQg9j7TUovRSy99AbVADdSab9SRHmMSMNBtSy2m4NsGTlZyeWQfIGZST7pG9zaAVQBRB82KBAnhD+Y2qi5Vts586+U0u0dY3PhMG0pYRqliXYrp/366Aivw44qUJZK70r7Y9QEMi1rhztcga/9p+uXE4nw1IuqsTo/A5hxjuO4G1GnvCf8zMyXuorI3CebKNGqUqtoWGO7wKW0Co7cAzV7/7fYbuNRz1FD7vjSG8dgX8s/KIhiQga5BHYSHN/C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:18:46.4348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe901cc1-217a-4720-233d-08deafa2e33e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

Add a small helper around rproc_elf_load_rsc_table() for remoteproc
drivers that treat a missing ELF resource table as optional. The helper
returns success on -EINVAL and propagates other failures unchanged.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 3724a47a9748..dff87e468837 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
 	return 0;
 }
 
+static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
+						    const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret == -EINVAL)
+		dev_dbg(&rproc->dev, "no resource table found\n");
+
+	return ret == -EINVAL ? 0 : ret;
+}
+
 static inline int rproc_prepare_device(struct rproc *rproc)
 {
 	if (rproc->ops->prepare)
-- 
2.34.1


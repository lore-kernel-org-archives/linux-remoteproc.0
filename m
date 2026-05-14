Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C273D33F378;
	Thu, 14 May 2026 16:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775705; cv=fail; b=fP+9HUvDGyY9RFlo74Jf5smUg9aVPeZAB2VTUZtQJ/l3GNv8d2FCHXsLexvUO+i+TVIGolDyKBQXf1dOgOTX++5ZUsBIzgbggUJ1tWIAygKlNYd0HCpeYhPMFKY4sEr6HhZdGXZHQG1jSO8SCqW0iDPDyaD00wivhvgrqVY2AOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775705; c=relaxed/simple;
	bh=nCK9XHOAhEArGPnEpLKbMqJQG3XWPyb42PMxFXLoYOw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwJiyMsECbQLWYYuDbXq/geE0kXM35qvPYIXTxP99KhDeE/QkRUEhzA2IBaRv222qrd0fZo76GXP54jG/J2CmCFCsCDtPnd6Lrk7uwYKrMVM3rE5CBATxnZHNfctC3O5AEdSpV410YUWyWFcMQ+i56u3BnWmseaaKe1V5iB10fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IW7Dvx5D; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IW7Dvx5D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9HYphc26nKgm8bsLNR3w+ZgNiYPv9abXEWoUW6IHFI+bZiwOioCEPft5+V5M9IvccQV81+zS4GeZPWjpkMrPLfmJm7GHoJzGwW3IomBVdTYlHAzglJzCmlji/x1aHxYMAdL72C4CWOfHNdlEm8Pep+eUSdb7kkhICES+t6XQgBgGYSCTUSOODeiMTpVwYXheSandWZuaZM9ke6u2sjEvVbpYfvdJYjXCqzSkuvBKAtahzg6INLhIIhN9xPyWR0l9FebviVyX+roWL/DXUKU8BzwvFagmSHTZPv+bsIoW8kbkeu8QYzJWpCPrzszgix/IfIVHDdABMeQmN5i/yo8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGlAdHN3po/lNXsgP53RPBEk/N60pGPyWPruKCyHYa0=;
 b=EGEIrxQs1V3wV1uwAoOU9VFS1KPKYvlyXmW914lAHJrNIZI+J573xy0eL11FrXXMWlW+xS4wl2kuT0TyV9Tip8nk/NadZ8ta2iclWgzTvkN0PGk4pat/M1wSRrnfk0giP9Bn9EjW+RKGu+a5ZvAgdWapOI2KBtdqK22iPx22zAOHeYrIr4wHUC6u9QJkD//BGGxgG8cwVJ481ymL+/w7PoPRVZEc8ffUF57huqR+GRcPrUTL3i7/6MKQI74tm4ROmTUE9b/pxc3Jjl2SdpEyUn0VHUw1QMs0CeOmb+vrrwBgiWzx7QFD3ZkvPOmLh/JQFz4QGN/RUIpRs2B2kPmsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGlAdHN3po/lNXsgP53RPBEk/N60pGPyWPruKCyHYa0=;
 b=IW7Dvx5DiNoekyoSYX+LKiStkhasrva8FMo9jH/0b3oViAwKrzudMw5rAPOdv1+j+tpOHpQOgWkrGz436zjjP53IkZ9Dv6HGhBDqNS06ayA4RnDdhxjOuhbvOIuM6dYDg25FVj0N632gXQ+82L7RMeIdLQ6rcWgm3P9y0L53OV8=
Received: from BL1PR13CA0370.namprd13.prod.outlook.com (2603:10b6:208:2c0::15)
 by DS7PR12MB8369.namprd12.prod.outlook.com (2603:10b6:8:eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 16:21:36 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::2a) by BL1PR13CA0370.outlook.office365.com
 (2603:10b6:208:2c0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Thu, 14
 May 2026 16:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 11:21:35 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 11:21:34 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
	<patrice.chotard@foss.st.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
	<daniel.baluta@nxp.com>, <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 4/5] remoteproc: add helper for optional ELF resource tables
Date: Thu, 14 May 2026 09:21:28 -0700
Message-ID: <20260514162129.1504162-5-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|DS7PR12MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: a5685b77-166f-437a-3629-08deb1d4dec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	5FWXrJifKcoh614oVYX5KaG7pOkqIFIvOED7natZ35A/5V4SDx8H2X5ado27WQb2jIW45AHaXuDpWia6t+GewwiYDwiVLPqqayrbt9TJIW4V4IAik5tZxYy0tFfZ6PNdTOCjVHd7z4dBF72rn6nIUkcO5vs2wTCAwLtJw29SvekwmmqEYVqcQr2hNltPf3Gxes81wFKARt8X+4rLqAEcTIhtpUKJ6g7R91mYziYYhd9YsvtwcDP5tzZhS+mvhpOYO+g2P4W9jtZIImv1L3gvdIJuTwrYH4TDdaeilqIbft/Qx/BNpCBtxUZz6S73/HUeb29h5p46pkUigHhFYz7mT27JvdSpt9dhQhWlOquLtSdiXav6PiEdBXMvwiFMYtLdF2VSiQ+FvmHSUhUm/+CkAdgodiPwZOHLZMsOlyFW2O53foi/4pFcHcoeLsIqAv8ySs1ZY6MvYEMKoEbmXZNP9jUpWKi/is+a3klCAxbywHuJ85PCe63wC6gRVBC43Ei641mZNep+MR/Fpvs9DltN2guRQUB5xZk8cAhniMPKMcKO6vYNXyXeOWDv2LYsL0c/+qhXXn7b8tBnwXB4H0p1TmjWk1elmCp2JEZhKfpEq7nPjtYrHGijc9HWB8lLODMZu17/VrTTkLCeeRn/Ujll5RktDeReoFcZYWQ1yQ+1sK1GrW9Zlo85uNvvrVQllMrSPtT2oHV/y2+hlA1S6+O/WbHCkMjIs4k+4GvgRlMYspE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kf1wi/+F+JV914SVV1r6LsKt13xJazdMmzoWPPUnVGGkqzRR8RwhnsKlc6luwyYN7Pnv+WAvtesdVV1t9G9cgn6VMrxOWHdYumaJKPdubpSwAtP8zkI3K4wIbXLDVPFFoj7YGR9+wS9uvsf+wuCKuEsDBqkELqQeOoRP7WmS+6zgK1EzbDQNgfOz4EW1ZbXpBKqLYxvEVexBxYnLnh+BJM71WrCOZnJ+alpjMFoGsiNjOib5zZenfzTUzxmIsJogEVFh0fj5g9HhrVmGZlwKGMmgqgQtmvsy8YEixklsfC2YdoYNnBO2YEIgSlja7/wQhh/GtdOwGRZxi2+WX7DEuAkl+UG99d9gxo+wX1qyvheW7Tc0+OLst4puyi/bcqwsALlOViHeFDFK4Ei/ecb42LKGC7rwxQOroRMLeZ/5leRDsd8WSC8cVhAgp3BpeJ63
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:36.1083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5685b77-166f-437a-3629-08deb1d4dec0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8369

Add a small helper around rproc_elf_load_rsc_table() for remoteproc
drivers that treat a missing ELF resource table as optional. The helper
returns success on -EINVAL and propagates other failures unchanged.

Keep logging policy out of the helper so platform drivers can decide
whether a missing resource table should be reported and at what log
level.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 9955e512f073..565b35256945 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -149,6 +149,15 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
 	return 0;
 }
 
+static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
+						    const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	return ret == -EINVAL ? 0 : ret;
+}
+
 static inline int rproc_prepare_device(struct rproc *rproc)
 {
 	if (rproc->ops->prepare)
-- 
2.34.1


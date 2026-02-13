Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AB27442;
	Fri, 13 Feb 2026 00:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941544; cv=fail; b=nA/HDtzf1JbGOOkvjy/yE41/8WwKEBtcFHrKeir7QeBLytes9lYsnkHJE8xZPu4VwtvrDusWXeK77yInaHLGCZgJLML5wKCMxy5Ehud9NXIOQaN8mcwq2U//hlYCxiYNi7ooV+SnVAL7vdr0bqC4zZQoyVBhhdlEX69IQSlc/OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941544; c=relaxed/simple;
	bh=hb739PmoB7YMWfbFpy1dLgo5yeNFjZvBcl5OBbO6n4c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6hZhGtSYnXPve6x+Wu/C2U5yuHHfN68Jw+du+3kRh2htv9WdPIOJeNnEVbXn+h+l4uNMlTyWPFP5PAjhjnmzvxE0W36zt48/PRRLD0yQ8WiPQhTdmqQPqSXtQpuW8dIAeZ3uH44oaD0R/5dhPsIf58VPOPXq9WZF1sH4ErkHrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qQxoNpav; arc=fail smtp.client-ip=52.101.62.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qQxoNpav"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHeNPIRe3suj8ZWw7UeiaOdO6K/ymRtTeLtI5YrFxYJuf2r6KiXcbPYCZt5AGL9J7HLSAH0meV9KPVapXOZpFU4KLNApNabpnWcAQD2O7HZPMRFoQXsT498OXuPNYXXFzrCgc9YoPh2tvIO0HvWI392LitOfwOdNPGMhC0qCyywRJo1t0IXoiBAKW68WnoI4+gWDagQQ7jIz50k92ub74+Sx3b1DuSXDJ5zrIOkxSjnK4IagoRz3b2kOsX97XGb3rViYQgJ/Lyi8tIfe0+P7Yk0Js4gXG9vS2gASb0DvHlUJ7VS/TXAsvWgRehtN8lmhdXhignu83G+Ps6wOylUlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZq7texjhmmQ5F0k+11IkIhObsFtf+eVA/y5SHmDyRQ=;
 b=J4ATXjWR2jgo23LhStA7bfbw56FdNkpCQMKXh+uueI5AnIyhlcZYHog9KTAwRWpRiG3dbEdl30+MQhs9HoyFgBnbBmyK651hZ9zEM9W5d6OJJCL+RzOoSjIln8BVndieND8ppg9h8B7Fo0X9ZbWaMGn52PDmRqOOZ0JenOQxdXyZbCwWue+jj4hEpAdNYKs4aYR3rTJlhTVF0ArqYsjXy3HOCzG7JnEn7pr41vWNSf0gYmcmIvFFmD/HDJornSzt+BKJUNB6hTNA53nTe+K7AgdgRym42CWOIU7mAdwZOdW4W5PMG5HPdRVm0qD/pN9w+jsgZ1akVHnVnLx40/A6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZq7texjhmmQ5F0k+11IkIhObsFtf+eVA/y5SHmDyRQ=;
 b=qQxoNpavUl+MdxGbQip1R9Z/7z3EV/u6gLqt86gzlNgjrfzV/fiMtS1b0Yo+Rnzabwrt1adu845N3rZx3Np324nn2yAOIHzLxpAIVAQOInjPUspLntsIpmiImIRHDKLsDdk6mvAh1QMValBvAybghvBcxxgOwoGZCITtftnj6ss=
Received: from CH2PR11CA0022.namprd11.prod.outlook.com (2603:10b6:610:54::32)
 by DS0PR10MB997579.namprd10.prod.outlook.com (2603:10b6:8:30d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 00:12:20 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::56) by CH2PR11CA0022.outlook.office365.com
 (2603:10b6:610:54::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 00:12:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 00:12:20 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:19 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 18:12:19 -0600
Received: from localhost ([10.249.48.175])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D0CInb3962116;
	Thu, 12 Feb 2026 18:12:18 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>
CC: <vigneshr@ti.com>, <s-anna@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kristo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hari Nagalla <hnagalla@ti.com>
Subject: [PATCH 4/4] remoteproc: k3-dsp: add compatible string for j722s C7XV DSP
Date: Thu, 12 Feb 2026 18:11:51 -0600
Message-ID: <20260213001151.17370-5-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260213001151.17370-1-hnagalla@ti.com>
References: <20260213001151.17370-1-hnagalla@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DS0PR10MB997579:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c93a0be-c22f-4897-48f8-08de6a948dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gJwas/sp6OnDjwSi50xgLUuNn9m8Wxy+VWUwtf5PQfnlevnNDYNWoFI/JiUg?=
 =?us-ascii?Q?pV5TOKpK1TUYuiVb98Xl05YCNRfcQ6xsxfOMwd521skBaC4nbQXedqqfilfc?=
 =?us-ascii?Q?HoyleL4dCa9rcPocRNBncme1isJJon6KTmIb0v98S+vjCMyMKMWGJmaXYkHO?=
 =?us-ascii?Q?eKjUcmcm3kVr0LHcsWXsPjcajOLcWhH2shO4tKfKYrJovUWmp0aPdzFJxr44?=
 =?us-ascii?Q?TpvrAA/y36YsZGKZvuXZE0cCjImL4dtiZQk8wtaZ9sYec+OoYIzVUAVfBP13?=
 =?us-ascii?Q?V891GuEpGtKoNyPz2i05pVRNW+fqvu9JBAFGl5071G9NmIRDxXtupRbXRrVC?=
 =?us-ascii?Q?XkfdBEokCiZeoLWn/ycd0LJ4knCME5E5e8OMs7eD5jRDT6JOmSjJF33wOj/B?=
 =?us-ascii?Q?kQchzwJVysa/KbgiMjrVudUbSv0oKLHbFGsBj0IeWedDJX0A1/4Ad12BS4lG?=
 =?us-ascii?Q?XcvY8IgxW8JuGi2uK51Cjic8GjWvsxvUX5uAdA9VmVxCJwbO9ctFSAYLQ0ai?=
 =?us-ascii?Q?w8BvrfQuq+2RMcwJRLw9Bv7CMS5uMgsIlO3n6JmboFq6z8iPfXDmaAkAJFwx?=
 =?us-ascii?Q?j7+YR78T3Gt6jgNvtNKfhvfi2PiHcpqymmyZ3pb8W2gMgYcHBQLtr0mNAVF1?=
 =?us-ascii?Q?jvZVz7IDbop5394qclCWf4B64V772XYP9Y2vF6qnh3BQeO1R9PoNcMQlFESC?=
 =?us-ascii?Q?giHniOtzLK9hlwyNKMRHlVEMOz4VNAqWY9tZU6HTBRbmjxNXwJCe8058ulvU?=
 =?us-ascii?Q?Zy2XnfzXFg2OumgTBsBabNvkvy+N/P0wHujlp6Dl5aGPgbwFEqTkYWYo6w4/?=
 =?us-ascii?Q?L2cuIGiHix3GWRvWHKclWeP8SRemybnYJFe4ZWOZe5mR+bVTO0xHoMacDx1l?=
 =?us-ascii?Q?lPvW+hkoRqSrCk+9t28MEOZwx4Dy1VnUxjgy9xhgGXLEMU/UdlUxruKuFCFI?=
 =?us-ascii?Q?CLusnJCwoX2Fjm2m6g0C73GbYT/Bgm2zXn94nVu2fvAhiHrIauISGZiwzOZf?=
 =?us-ascii?Q?trdSAby+s/KR0t6cXlYGxpW3zMKBLhMkbE+MLIyD0mgdXOgkxORZWSgiGRPj?=
 =?us-ascii?Q?bnz4wOeCfkd2aFr7Pyg4AZFynNTuuM4nNVLDqlxIF+IEo/D7mUdDFx+41djT?=
 =?us-ascii?Q?wFMVZoD41bjKjJB27NSYcfYhwLyUI4YnwVHUmLJxqT5x0ys2PfWa8REI1CsH?=
 =?us-ascii?Q?7SOJlQNzbZkXV3yES0dqfRtxD7ehGKIwP5dI9jfgeQvkcky2FZufsL0kp97F?=
 =?us-ascii?Q?wFjimPmDeJKXrvv/9bzVr895vbukmL77F/DBCmPSm2TsLb8rbo0tjVQR3JZW?=
 =?us-ascii?Q?Z17Hb/xlkAbLyjlhsdMLNI4KyAFTvRN9necCs7/055iyYOCXWDHXWnkfe0iX?=
 =?us-ascii?Q?S8hdfQx0lscq/wxQd2y2U0T2Z7DV9iIKGnx9WJ01jdlm+kuguFfRHqd6xc//?=
 =?us-ascii?Q?tPz6Bs5QjEv4ZYPcGBeQPC2vI5pT4Pz9De9ehNUV/j2pzbcOIXzchpVe7QYd?=
 =?us-ascii?Q?85jPqu05VP39dxeVRYbMJvp8aprMRsupNCawmcAJYPkuKactfHsk49GgaK1+?=
 =?us-ascii?Q?S2/4dGdkerd18NssWur+tCSfTPwLmI0cRomoMqAhkg2efZWOCCpbgVDwMMPU?=
 =?us-ascii?Q?kuU5r1JOAj3eaAEXWCznT1CPW80GhpfYNAH6hjlXPoD0kidX426H/MEchA2R?=
 =?us-ascii?Q?7yxS0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0skMTtOV7PsDcp4PLjplXYGLTpHHHOxUUa+5rDgBOHi9Gi2LBmAHYajYk6S4S3lYDRACkVdI7KX03cc+79euNV2iwcRa7jtOITrS7NKlNXfgohsEuFdZks/cOOTW7POnx0tN7jSSSLWo3wzVmTGJbzVP5++1Dlg9euI/DZdeP6bIqZU/0A1+sCFgKbfOKXvAHVAHrhz28BqUYzjHHaOco+qc5cdAoATiB9kXaGThSnPo8dhT9+79RDcmmpKAaqpj1x6adDeuuU0k7GqezlNDtLOtdM0Rfd217AqsMuMnKsU+7PuHhyxkN078iYBeEUHTroqvqIUpQRgBBY1bpnv+I9NCPSvIFxW+9/zS8Bp3nMcjCmhxhZ4/jvOWXh0WYMB64mWnZd08DjRz4YD18EFovHYjkFxr1CWtfmLJB2mcFq8WPNf3HSn5CD0b9BaAlt+z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:12:20.1019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c93a0be-c22f-4897-48f8-08de6a948dec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997579

J722S uses the C7XV DSP based deep learning engine similar to AM62A,
but the reset and module enable integration in the SoC is little
different. It does not have a local reset from power state controller.
So, add a new compatible string to distinguish this difference.
For these DSP core variants 'prepare' operation is not needed before
loading the firmware. The module level main reset is released during
'start' operation, i.e after firmware load.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 7881c711d872..301d7b5afd2f 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -214,11 +214,19 @@ static const struct k3_rproc_dev_data c7xv_data = {
 	.uses_lreset = true,
 };
 
+static const struct k3_rproc_dev_data j722s_c7xv_data = {
+	.mems = c7xv_mems,
+	.num_mems = ARRAY_SIZE(c7xv_mems),
+	.boot_align_addr = SZ_2M,
+	.uses_lreset = false,
+};
+
 static const struct of_device_id k3_dsp_of_match[] = {
 	{ .compatible = "ti,j721e-c66-dsp", .data = &c66_data, },
 	{ .compatible = "ti,j721e-c71-dsp", .data = &c71_data, },
 	{ .compatible = "ti,j721s2-c71-dsp", .data = &c71_data, },
 	{ .compatible = "ti,am62a-c7xv-dsp", .data = &c7xv_data, },
+	{ .compatible = "ti,j722s-c7xv-dsp", .data = &j722s_c7xv_data, },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, k3_dsp_of_match);
-- 
2.34.1


Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD811DEFE8;
	Thu, 12 Mar 2026 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318954; cv=fail; b=lUzAlh8SI9CMroFUxtJ5qSes65lBxb+yvZaPbbtZvQiksdlTgetFS2PQaeBuQQcoqAw6lug48s8Bf7AtDe44uz64bxd+RAiRYk9QOjTrT2Dp/5kDmEpfNMrKaI5XqWzKbYs7Aq/ZM+3VfBPnlg5ixNJTW2zJLZgncWEfat6YqYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318954; c=relaxed/simple;
	bh=rxwwCHCGYQxum6btf6a8Ueb/ckIJEPsSWOEqbilm+Ds=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kQbfggrvYFep1jUpeZ8sf2yPPI9hcOuw1wXF0l7xFQw4usRPZhfITyF5m+IJZsXR6uBwUEYoAYZSb1sukSgg3AuVAniwp7WPQWz4coDRcZwgiy0UeFQX2vV4Is0GDFbVWcQKrGtC9vnCRRvEs35nbCFAHaqbGBqHg3WPl7I4kvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tj8GAvo7; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tj8GAvo7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfE5uqHEAMbDVOzOG7g68HOLSftwnMSwLbSoEh5oK8ZV93FEjI8e6YXkgDE9hB7PVwby99AuGjPRC5ildDKl58IPLG3ZBkHo33UT9wZFASWEg+1Lt8XcF6u/t5PQsEItxiTKeKVOKRX2xJ2havyiFwta8NuSQulKzTf+Dl2aPzL0sde4xYQhcBnt614AYPDuw7flquV6t8u0bOape/2EdNmGU/gqfzGzQg790/5eEbAvfkaEKGLp/OUAloIM/knBoWouMsz2gNFLy/QyNYh8shSCcFI42x47FHCir8vm3+lqI3I/l9SLJfG9TkrZr7AUN/4p/2OdqG2Ee0fbi6ef0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEgProxPJbck3mms7CT9oMqmW9Q4yUpZDWF1GXjxCkc=;
 b=eVCyVBa5vkYFv/QmF1ls3HvrAwjcDjYvrVrUTQa1xYsmoOa6d9JYztYFPhz8xHh/Ab+LN+DtVLfLfiOQBiE40zVA8nUJukq23XlM0TQxT80Tmb+2S0GgHGi3klkHvmDGs3kb6bZGKvtYQ6aA9LPXAAog5cbX0Xtg3HQepQ2VXl6ncyq+OLwMJuqM9JoGJFSwNr5wk/iv/jLKYs+lPZMEY3Ar1NV7jTxfjr9N7pPa1qV4bdz9MnMEj/J5ddlrR5srh8YbEPz2RWUWCE67IrOr30pqSOrveQTwjRoZ6QKUh2njqI1VZQEyYHii2833lZyLB8UzDsY+YBSQXIs9U0iwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEgProxPJbck3mms7CT9oMqmW9Q4yUpZDWF1GXjxCkc=;
 b=Tj8GAvo7m7/+pw9FFo6wRuOAyQCXI3b5v4zghYVxKe/nmvcUhpi53+k3/jzR5S2/uNx5na/oqj+kT8oiTPLZyRiOijPskD4sE5hFMALsMXCpdPhu1FRDr/CwKBkrkRFkcXjUWGznpBzQiJ8h/8HfVCvA2cZZLUzUU+xkON/7S/o/BCPd8i6TPrKBJSjZuMN6L+oTos3lBkBzYmdLQfbQhWJAav97C5rih07atPj9A8Nzw5HSLdnWlwWukh9DEDQ9hoGBZv/cXyZ7iZ5G6vuKfxiTnfN30ObRoa5m+YQiCqmQLjoYW11eL/zk60qXCMKRPYeQ1yiJuj3cYDhO1pAmmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11271.eurprd04.prod.outlook.com (2603:10a6:d10:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:35:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:35:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 20:36:58 +0800
Subject: [PATCH 3/4] remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM
 reset vector
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-imx943-rproc-v1-3-3e66596592a8@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11271:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d27dc3-d19e-4d17-2dee-08de8033e0b1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bm4FS0zZHVuE5tJdmuS25dl5NaubsRY92oRSGlbEnJX9NRMnnYU7397wIYE+aJcFWQCfpAb2fbGFf68CpJSsqK8hvd+z9pgKQdgNOnpQupwNvKntvGYFd3XdkdNhr8WJJKlv33xGu7FjGpRZImg8UA51kqfaN6f9fFii9FN1e5X9vSDz/oGusWvmm5dXp3JHTpJf//ABbJKLzTQA0pV3UWgvruqz86gQBDp4Vcc1odgJ5UuUPqskrW4F4lUyCM8VbGsgU+5xAHVSWt4Q3t1tigkrARdqu/btpI6Qvo4J4OaqCIJhTFlW5ipt2oxNZ7buLPzxoTAQNERHgH6ac2/zfcpC78LNFEQ9vDDTIjBS7uVHiBCtlUzu+uBgeuiEYqhigZXnrSIbE8MMpEwbpwpz+nQu15JYGkF/nrCAVC5GDdCMwkY22XZnKEqeXWL9MJjG0LnmGdX5SuNtlb/B5xIQHNlTGmM9kdr2s4/dUr+TSZQvLUm9m30j2a3APAbJxyLIRIAkKVXur/gq8Cq2WGIQ37Hd/cuC9ZI/IsU6C6gw2gtC0gmWOqLar7WTo6MOdnweN3yfgxq54C+mDO1ZV6pLrYwCDoiG9phSB9VlVqHNfP9X089jmP5lQhX0bG1zTSX1/aFjNS30OAwKs3OrG4oPgLW38An7QZxINCR07k1lba3boAtPjS4Qiq+yQt3Dz++2A/9LB32AEGw9WT6DZWHAoKUe9OXX8tqREzowm0mI+6o1+5YUWd4nm2ZvphpN43XD2uk+0hNcCou1AQCNyiyCSU9tNnIe2z+DVMcRyadeMlk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3ZxMmt1Rk9qeUVFZ0hyMU5YOWYyblcyUmE1Wlk1R080aGg2Q3lqQllqSTJk?=
 =?utf-8?B?Y1NWd2trTDYzc3VacjVhTGxoaWZyeENYN0VGQUNJclFWaWVXU1lFek9pQUVZ?=
 =?utf-8?B?MDB5TGUwdWpoZlc5a3JSZ3BIN1laam1HOXRtdTlPVGJyL25LcDJHWStGVk1a?=
 =?utf-8?B?WkN1UzZPVlhibHVDK1Z0WGNHNFd3eXNHVWM4cmNGTlU5NnFkSUJ1TWg3WUlh?=
 =?utf-8?B?bGRUK01aQXRha2JFT1BVSzl4N3VGTXd1ZmlRTmJyU2liMmpscDZNKzZ2Vkd2?=
 =?utf-8?B?R0pRQ3BwU1M2Q3NEcUh0RGw5N1NjSjRUb1hNSUJLM1Z6K29UT1B4RmNrS25G?=
 =?utf-8?B?NHhQbmlpZHlQRWcxWjBwd0ZuaEpFdUNESmZ4M2JrVVpGWWd4U3hLcU1NREpJ?=
 =?utf-8?B?WUtXeWhlaFlyMGk5NEpLOGhPd2xFaEJKY2lLSXdiWnFlSlVueElSL1h3ZlUw?=
 =?utf-8?B?WDZQcFRIRG1ndGIyc2tZemorVi9pQWV4WTR5ckNEUUd5RmNhTHcxTWVVNVJC?=
 =?utf-8?B?K2RmVlRvTGlXdnhmd1ZKS0NmWWxYaFZYWlZtMVN3emZtL095YklpMjFUbzZ4?=
 =?utf-8?B?MFhEMXRkMDBoYUI2NDY4S2VHdUhVZjlIdElONFNYbk5OckQxNklDMEZLck8w?=
 =?utf-8?B?cEpoRzQwdFJ6enptT2YxWDZWeWgwVXIxT1lZMzE0MGpLR3VPQTI2NmZaYjFr?=
 =?utf-8?B?WW44MXpGNVd3V0ovQ1hsRWM0TTZNT0pNZUpRYmkxR2JYL3YyMlFOVmZ0L2xE?=
 =?utf-8?B?cWhFNzRaY1hKRGZ2Y3EyMDRMYWR6aUQ4T3ErbFB1OG56VlovRVBYbnVDNmhY?=
 =?utf-8?B?OXZwR3BZS1FVQ2t5cHVxMG9TRGMzc0xVSS9IMDBRSHI1Y2NNcjNzYzIzdmtB?=
 =?utf-8?B?UTlXaTczQ21ZcmROcWc2M1F5M0RBZDJESjFCTnpWZ2pDTndwRExwbjV2NzNP?=
 =?utf-8?B?cTR6MWNxclN3VkR1byt3ekJoSTBJWEg5d1o0d2cxalM5MGtBTWJNaXI0U3R2?=
 =?utf-8?B?R0J4VUdnZ1V3K3REWjRTYy9GNEcrc2l2aDNDbEhoRjVOajRKR3NvcFUyd1lL?=
 =?utf-8?B?T2FUT3ZVQThGYmpsbi9pS3MzalB2Q1hHb3JKR0ZvT0w3TzZEc1F2c2dpVERR?=
 =?utf-8?B?S0lOVzBmVmFJVzVOWG04UjU3dEllQXBlNE0xZUFQT21KWlk4WTJ6SVNKaEo2?=
 =?utf-8?B?cWwxZDFOU3BDOWNJaDlOUmJ0ajlST1BHUkpnMUFqbVJCdUUrdHJITkU5N3dz?=
 =?utf-8?B?YU1SMTc3UFI4OU5UOGdSeTAvdnlqWm13aStBa0ZYNFNmSldkSGRBS2c0NEwy?=
 =?utf-8?B?Q0pPdVM4cGU2WGJvc1VlSVh3Y2lUTnExQXE1dEFGeGxxMUpQUSs4Z3pXV3BT?=
 =?utf-8?B?TXEyYktyY3hRN2plRFlOVlRHbzF1YXd5Mm9xT1R6V3dSMXNjUVVFb1RIaitO?=
 =?utf-8?B?bUdxK05CclhwZWdsWEM5TTM2VlNoeGplSlJmY2NIOVdqelRWNVF1NDNKNFZx?=
 =?utf-8?B?ZUtKVTBTcVl6Ylg4TUw2ejBwOVZPSnJsZVR0S1N0SWw2d2dMNkJyRFVwT0Jy?=
 =?utf-8?B?QlhyeFhYVlRVcWV4N2cxdUE5VGNlUFVCVjgrdTczZ2NPL2hhcGJ1OGZHQ0px?=
 =?utf-8?B?RFI3VkhtUWZZWkNES20yakFlZFdQQjN1VFppRDJiS3lqM05VZHRYMW1RWUxx?=
 =?utf-8?B?ajE3VjJEQ0tBWWg0TkFPQktmUTJkVllMMjFXQ2pITk9UdW1kWDRpK1V0a0Vr?=
 =?utf-8?B?SWZFV1NoQnNaK3pkWjJQU01uWTQ5S1N2SDM4eUlPRzBqRElMT3FpTE5mYjI2?=
 =?utf-8?B?M1JlQkptM0FLU0xqZEhvNmVLbHFTcWdtaXRDVEtOTmEwOUw2NlRES2RQZXR6?=
 =?utf-8?B?Q0E3T3hpU2d0QWtNNUFuNDBUUjA2YmdHT2Jib2RCdTJOVmNXeVNTa1FzdDRo?=
 =?utf-8?B?eCt6RVlFVHpPQmhpTVg2VHVMNmhlckhQdk16ZEs3cmhNaVl6cVdVb2NWWTVo?=
 =?utf-8?B?dEZCVzZMT1h4U3hFWkh3SmhUbjk3UXBKRzRhYW5iUit2QVJ4NDJGbXFLaEhG?=
 =?utf-8?B?Zm10TCtCSFdmaHhKaDhsU3QxOVhsUE0ydjVBR3ZoUGhMM2wveXo4d3V5cElQ?=
 =?utf-8?B?MnhoaGFBaStkQTA0RWtXdWJENFNDL1hBZGVHMXNJb0JvZmQremNVT1J0TkxN?=
 =?utf-8?B?cThpRE1FNVpHK0ZnelpRUlkrbmFrQktyYjlkNm5nREk5eTRXVE15ZWRvRDQ0?=
 =?utf-8?B?QzN3cE9CNE5NQ0tWQmFseHRwN3lSRU5rbmFMSFVhL21FaEZlTzVyRVlueW5o?=
 =?utf-8?B?aWY4ZkFQTk9ITTA0aW9UblpsYWpDNGZ6SFc2NXBLZkdGZEdvWmh2dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d27dc3-d19e-4d17-2dee-08de8033e0b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:35:43.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6BbaTRqtiib20IbKJhH4mOhvoufw/gkC87kR3JCJThURTe4VPqw3A1PHF/FWni45HgzXtEziPYE/75FdK8p1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11271

From: Peng Fan <peng.fan@nxp.com>

Current driver always programs the reset vector as 0. This works when
the Cortex‑M7 on i.MX95 executes from TCM, since the reset vector is
naturally located at address 0. However, when the firmware is loaded into
DDR, the reset vector must be set to the actual reset address instead of 0.

For the Cortex‑M33 Sync core on i.MX94, the CODE TCM base is also not 0,
so the correct reset vector must be passed to the SM API; otherwise the
M33 Sync core cannot boot successfully.

rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
hardware reset vector address. To derive the proper reset vector, this
patch introduces imx_rproc_get_boot_addr(), which masks the ELF entry
point using the SoC‑specific 'reset_vector_mask'. The resulting reset
vector address is then passed to the appropriate SM CPU/LMM reset vector
API calls.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0dd80e688b0ea3df4c66e5726884dc86c8a5a881..9b07103857b13018bdf62431cbfeffa3e3c1a15c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -124,6 +124,7 @@ struct imx_rproc {
 	u32				rsrc_id;	/* resource id */
 	u32				entry;		/* cpu start address */
 	u32				core_index;
+	u32				reset_vector_mask;
 	struct dev_pm_domain_list	*pd_list;
 	const struct imx_rproc_plat_ops	*ops;
 	/*
@@ -345,7 +346,7 @@ static int imx_rproc_sm_cpu_start(struct rproc *rproc)
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	int ret;
 
-	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, rproc->bootaddr, true, false, false);
 	if (ret) {
 		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
 		return ret;
@@ -365,7 +366,7 @@ static int imx_rproc_sm_lmm_start(struct rproc *rproc)
 	 * If the remoteproc core can't start the M7, it will already be
 	 * handled in imx_rproc_sm_lmm_prepare().
 	 */
-	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, rproc->bootaddr);
 	if (ret) {
 		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
 			dcfg->lmid, dcfg->cpuid, ret);
@@ -739,6 +740,13 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
 	return rproc_elf_find_loaded_rsc_table(rproc, fw);
 }
 
+static u64 imx_rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	return rproc_elf_get_boot_addr(rproc, fw) & priv->reset_vector_mask;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
 	.attach		= imx_rproc_attach,
@@ -752,7 +760,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
-	.get_boot_addr	= rproc_elf_get_boot_addr,
+	.get_boot_addr	= imx_rproc_get_boot_addr,
 };
 
 static int imx_rproc_addr_init(struct imx_rproc *priv,
@@ -1244,6 +1252,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->rproc = rproc;
 	priv->dcfg = dcfg;
 	priv->dev = dev;
+	priv->reset_vector_mask = GENMASK(31, 0);
+
+	of_property_read_u32(np, "fsl,reset-vector-mask", &priv->reset_vector_mask);
 
 	if (dcfg->ops)
 		priv->ops = dcfg->ops;

-- 
2.37.1


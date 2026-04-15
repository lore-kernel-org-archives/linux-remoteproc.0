Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38968393DE3;
	Wed, 15 Apr 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239341; cv=fail; b=qPWd/PFHuLfa5VAUUr6+gcFzmcOhKajPRU09VHqgQA6EE6KCKJMy8rpAauJq50V2iK0y3An5QRKon1UWUrQ6s3M5jJ31V10KvjKd8T/chuOJtK5jJRlEgbDL5aJWzjb/kvzwFrlhpQ92+Ft8izvORpERVuHQHexdmaBt8oR1LIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239341; c=relaxed/simple;
	bh=c8Ed1sOvDjpgcDztGfPbshW1aFJ9QHenb15eusie3jE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Imb8PY4nXsr8sm4GgcMgGqV9IG7PY9DRCaeeBYCDS7ysSrqjtpQ24yC6uTSOjx2Zhqc1VWKfVSKzpgaay+pjIBMVMHDC53buca86p+N3Lb3JHkGMj8oZaGDFA/tX0NjLFbsAIirjxyBxR69NXbekAmB1spkbAMEq8FJOlL9zLdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HZBiBVqk; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HZBiBVqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeGU2zmnLAXDHhTaA9ZIQViU3VMiDedamWHM2Zgq/dfx9FLF1cM2PAJ4TMj87CoxNeDpqXpdKiooiJjyXNYkMEu0UmKgQOTEgMDNgWkzXcX1473fBdsfuPf3qTVQb5uwierot3Pgd6zYZwapaKxUrclSkI0MOeo+X3rlFcz0yjpR3VWnGms0N/eqUt5WV8TF5EzdEuz5DIdWHaBBL/1if0QKwUsyDahlEExrqyuBvl46Eyuvx4dDyrOB4zeyqXNBgC8Wus0piTE5fctwEggdoM6NlwjiXMTUVds1TBQ11PTOQl4HV0hsSCA1BysbpCclf4CkQlt3ZT4Mx/yBvRBo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cwtzPmvJKi84B2erj5iTbpL45x4M/tMpaT5nR5u1+U=;
 b=h57nBglVMyao91p8Ktbx/Hrqg3Q5ZYMFipK9pCBV7MxSnihoZDChnt66FWrTgCF1zqkF3Rq4LUGM3YLwhXj2qiPKI2UUcKCtrLzimLFMyESpqOgu8xT9u5Mf/pbB6FL8ILHJMLqROJp3QzAv2VxAVcDlX//NhpScttAnktD977UoycylvPINC+EAw+kCy+/7OIitsc4H/oZZqGpkyKZgOskZyb9prazjGKaWSuDtVM0Iz049ykC1XhfympaRMGp8wB7++qkqfiuissdfXU7VpN5426ftzC63TkxzDlLCDHkqtGK8ZqofZYPaJjjz8pzxTcFkG4RDi/W7seIHIJztfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cwtzPmvJKi84B2erj5iTbpL45x4M/tMpaT5nR5u1+U=;
 b=HZBiBVqkX7SgmAk+mTkrfuC5HEjRH92hXc2tjhuAF1hjWa47gyAY62WxtENBay1ALzOil5XunpM8EKbZcNLkAIz8+LIhfVgVJWplYPUDl0tt+hZ1u7EJDl90vGIXnOP8dFOhWYPzHxQGRtEHIfN0yfqvokMY1Gp/F/8hJ+qPgDzzjvpOq7YOz0SVeWFv8NFdpTzaBNs6uXaAtdhlJGf/puTTGqu3Zo78prZPW6guoUPyHlrRykU1DIUaJGjVMQHBcG6YWirNvGXFIt8rdLMENSf+52kpc1yBVSysPVgLa0iXmsWL5vOfbITZHQp24Z8rHoZ05WpJA5ubBol3mm5pnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 07:48:58 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 07:48:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Apr 2026 15:50:40 +0800
Subject: [PATCH v3 3/3] remoteproc: imx_rproc: Add support for i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-imx943-rproc-v3-3-9fa7528db8ca@nxp.com>
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
In-Reply-To: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 443d9de1-0377-42e7-de7a-08de9ac37304
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2OteDFnrUHm2sx3XZbS7dcqE79phDTrTEzKzgN/BVSNSpswOSs2H88e3oILt6zSKMhqtUYWplS4CHgvT8D7zXz67UddMwTYZ+VJenmycbeZKRJj8h9JnBPg4FeH6oV8Z+16Zg8pDSPTRwkEwMIqj+ulE2Ui5MeD+HvJ4krxXd0gzPbELxVs/q6OrSudADlCPIMPcIS4UJ4Q4tbAPoEPlF6bmAqZEa1+sQ7LNVjuXmQ1eJQO/liDC+EHHgMRZbL00pcTP8qFOziwlKgKcHYOna0YK7ZHTdiWcp69EsOCkgPdj04CruPoylMOW3opCxU3tKDJvz15i+9Uyxns6LiruP4nw5DixzaQ/Fs2KyaWQGC1pNtxN/065oTqvw1lUwy+AQG9ZJRi4jG0OKa6NgT6kxwhgK1LEY0f1P8Dyac3i7Yk2ecFlf5KWtDF0D3+li6AuY25V9uuQ+H9btp51jDu7L+oaZ2v0weisCNmGewkLftQYseEigVqCdHAZMt3/QthoQcVXbYKZ2wO/BWFdfa7tKwuVfxcbtsWX8TYAvIid9xF5SBCnfL56UYR+vAOkxjSFeAXue9fG69l4/MIXKZ5mlt1yfHwWa9OejC8Uz5Y6RJl/9mCUJTNzIxsGbEEDEeWWyeyQ259yjw/xXvGTNVDV3Wyk4qmaHbSvVXD4NbMV5PbWv+/SY/SnZ4/VGta0NRzkZKKuaYSmzM3QE0933ELSp55i6DSXtGHs33FxfFWw4AHRuplyFZwMrlpTB8F3g5rkLaqX+KD7RA/4tXK/LNvTFqsCnjRqO5RDelYk22pWfo2Yq8r/xnfiCan6kCPS/Aj3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXFBcStDai8vNVNIanRONzhMSFhQaVNsdmF0TWc5NTFxTVdJQXJyMEN2QTJo?=
 =?utf-8?B?ejAzY29Sdm54VlBuOXEyNjkxZy9Ec3NSMkd2bjU3blBFeUYxS1g0VXI0VGxa?=
 =?utf-8?B?SHUvYWp6aXB3eEZlYmpMVVZzU3lyRE9WcEp2VkpQYXNlZmR2a21tRUREYy9O?=
 =?utf-8?B?OHhiY2txVFJBNXdtUk02a1kvV1ZSL2REU3dpVW5FMHFIU0NpMktOcjRmaXpV?=
 =?utf-8?B?Z2hZd05yMFYySUVGc01BcjkzWU4yTFkxMGlzNC8yOGJvT2RVWG1IaEVDUVQ4?=
 =?utf-8?B?aE5JaVUrRFl4V3Y0eC9RTHp0am53STcwTUxXTDhqVGlWMGJhT0xpZUhFRWc4?=
 =?utf-8?B?WEx0eU5JVkxHWW14bjdFUHd4cDZER1Fab3d6Ukk3Y1JGWm05aE5zcWU1QTNj?=
 =?utf-8?B?a01STnhGNU5mOUgyYkpwRUxnY3RsaHpsWWduN0xsUzF1QXFic3dFeU9meEs3?=
 =?utf-8?B?U2ZuOUFRVkQvSEVnMXpmVjlrcS91QTBGbEtwS1RRQ2pORFplWTdCZVdEV1R1?=
 =?utf-8?B?L1k3eWh0MWhsa3lhWEVzSSswTHVBTlRMbGJVS1E2bUc1RUpxdEp6WTUrTlFZ?=
 =?utf-8?B?TmwvbmNjZmR2ODZRSGNyVUkwU2RZOVV3bGdLbWdHL1NzTC9FbSt1MTJJYnht?=
 =?utf-8?B?RlVIb3gzT1VJVDJsd2krWkx4THIwVllGTzJIYytkRlAxSnNOanJZOHFFcDN5?=
 =?utf-8?B?dHpESy93dm5mWm9vWGFQU0l6NE00ckZ1QjZoSFFteEJDZ1pXOW9hZnF5c2JZ?=
 =?utf-8?B?M2o5MHdWK2tRZjRUbXovd1lsd2JIZG5WOWR5ZmcrS1ljTStTUVVPUjN3SXBS?=
 =?utf-8?B?TEZCdUxZV1VHRTRpUVdJaFRROUlnRDFvM0gra2ZpclhJclBRQ0VrVlV3bjMr?=
 =?utf-8?B?ekhrendYc1doeVhkUXRybE1XRzdQMEplTkVTbmdjZ0U3SjV6VkRSM2w0YkdS?=
 =?utf-8?B?SFI3b0JkODUwMmVkdXY1U1ViZUFmMWNlUzdIRC9NM1RXdk1KZ003dHZ5THZm?=
 =?utf-8?B?U05tandhdTQwYjNNelZVbzNLS3NHMlRVY0FoRjU0cndkaVUzbUJ6ZWd4d1Bz?=
 =?utf-8?B?b1E2WUxkUHF6djRSdEd0Sk1pUGVRUG1YK04wQUtNaFV6enJySDYrR2p4LzFh?=
 =?utf-8?B?aTN4ZXlUNjJJSFpOUWdFTHlPSDBMa2FUQUY5OWhTU2lsVzM1OHZraXl6dTF2?=
 =?utf-8?B?WjFtVnF5OFZpZ0doMVR3ekpia3VuYk1CNDlvRlZPRFF4OG5peXZydXZtYTJM?=
 =?utf-8?B?bjNUalk2M05Oc1FrSlZtUkd5TmdIQ09aeUxGVng3dzBhMHlNM216TlBkWktC?=
 =?utf-8?B?a0YyNGlQUnhxQTZwbWVWb2JYcFZrWndsM3R6b0drdm1FeVN5UEdUSHZuMFFm?=
 =?utf-8?B?Z1NsVnljVm9adC9PeUVFcXVmNzcxTVBreEFhZTBzSzdaOWRRY1VHQTRTVFc0?=
 =?utf-8?B?SWhMVzhxaHBpWG8wS3lwZzZwS0hIWWtUMDIvUTVEM0dFOWlXS05NUWVjMmxY?=
 =?utf-8?B?RGhtQ0NCRlZPTEtHZDZCNmt3RjA4OHUvY3hRTzhiVjdVWUdiTXhwZ1paZHNY?=
 =?utf-8?B?a05odGRKSlFYQUJsd3JIREYwdXV3Y3ZmT2d1Rk9RVEQxZ1o5RDMvMjZldHU2?=
 =?utf-8?B?ZWtOSTBneklMdVRjeCtkajlRWk1ZNksrUVpJdGRRU0R3QU1JT2tDTlZ1QUV4?=
 =?utf-8?B?NzN1ZXJudnNGbnRpdnNCbGFQVk9QV05Uc1JXZTdBck1Fc3NDTTdkcVdnTlRU?=
 =?utf-8?B?Tyt6Y0x4c1dlekh0b3FMU25COTRuMzM5RDN4bzZROFc2b0VMcG03RVBmRndU?=
 =?utf-8?B?MEhhNUp2NTRZNnpVTFhrYU1LQzRpWUY1UGlDSUVwTjI1by9hajVMNzlHdkFt?=
 =?utf-8?B?eFhnaEJpU2tyWmp1RUhGMlFPb3QvSGFxcWZ1UzM4cDBLOU5ZSjIxSDVycm5S?=
 =?utf-8?B?T0VjS21hRzV2L0xpSTdwZ1ZvVi9JVHVrWGpTWHY2TThucyt6ek95ZEhtYzBR?=
 =?utf-8?B?VExiUmE0UEFvOWNrYjFjTDZ1c1EveFBiVTZpaU81N1gzVUxxNFFmdDJvN3Rh?=
 =?utf-8?B?WWlpK25mU0dFTmZudXVXaDRSOWVlSjhJYWhlYk9EVWRwRm4xSDQ0SXVYWlFG?=
 =?utf-8?B?R245a0NCY2hxVVlacTFxNWgzUWdReUQ4TGtqcEF6Wm9FdDA3UkN6aHdvRnN6?=
 =?utf-8?B?dmJPNEgzTjVBaHk1YVc1MUNYSFFuTUZlOUFuZkQ2Y2I0NUlXWitnRTJtR2Zm?=
 =?utf-8?B?Z3ZreGFxQktpTmFqMk9lOVo1QnZIWHZNWDY3UWdBMHhjMFRvN2lYa1dQQ0xt?=
 =?utf-8?B?YWRwS1puQTJNRmdSSTdGVEZPdU5YcHo5SkQyb2wvWE1pdHNQUm8ydz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443d9de1-0377-42e7-de7a-08de9ac37304
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 07:48:57.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMg16KsSiQXeKBJwTmuMZM3QErMUk9alxW2gBGW8VWBmeAHLIqBLb9cREuhWrS+vrHV+FzM5jDCOdRv5JtQXxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

From: Peng Fan <peng.fan@nxp.com>

Add basic remoteproc support for the i.MX94 M-core processors, including
address translation tables(dev addr is from view of remote processor,
sys addr is from view of main processor) and device configuration data for
the CM70, CM71, and CM33S cores.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index c21782be4bb69d830479f538a091bda48b740ca4..5c4a1f2f877f5afd82192a13281f57f094a0e478 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -145,6 +145,47 @@ static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
 	{ 0x80000000, 0x80000000, 0x50000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx94_m70[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx94_m71[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x202C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20300000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx94_m33s[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x0FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM CODE SECURE */
+	{ 0x1FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE */
+	{ 0x20000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS SECURE */
+	{ 0x30000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* M33S OCRAM */
+	{ 0x20800000, 0x20800000, 0x180000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1477,6 +1518,33 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m70 = {
+	.att		= imx_rproc_att_imx94_m70,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m70),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 1,
+	.lmid		= 2,
+	.reset_vector_mask = GENMASK_U32(31, 16),
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m71 = {
+	.att		= imx_rproc_att_imx94_m71,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m71),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 7,
+	.lmid		= 3,
+	.reset_vector_mask = GENMASK_U32(31, 16),
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m33s = {
+	.att		= imx_rproc_att_imx94_m33s,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m33s),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 8,
+	.lmid		= 1,
+	.reset_vector_mask = GENMASK_U32(31, 16),
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
 	.att		= imx_rproc_att_imx95_m7,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
@@ -1501,6 +1569,9 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx94-cm70", .data = &imx_rproc_cfg_imx94_m70 },
+	{ .compatible = "fsl,imx94-cm71", .data = &imx_rproc_cfg_imx94_m71 },
+	{ .compatible = "fsl,imx94-cm33s", .data = &imx_rproc_cfg_imx94_m33s },
 	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };

-- 
2.37.1


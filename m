Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8433090F4;
	Fri, 27 Mar 2026 02:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774579252; cv=fail; b=dvVFx3jYZeSA1pcPOWu2n7MB7g5USmLyBifIiUzYVQDmBIYeO/u7dV6CBQrIE3xK6tBFUwjSviLIf8VZBwXvNmDQ5IOTpoTx4I/jC8gJyBrRKW+iKEezeIzScd3spw8DMJsX0bCauO4gpJDt+PUsIQCTmGsJP6dEnKD75R+RSwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774579252; c=relaxed/simple;
	bh=sq1sVbSs61kgxzRW++q6Fh3H+TYPhrfeHNGqX4yRxGg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lHbFfrLelCK8ztfPm+KtuTxQhFwQHfTAN1bhFgF1yHBeHnH91JodD6XadXo+KRTCaTrZwQYpPiwEwPoJTAhZ4ReLUnjBI8wDgQuYY5S6lDgoqEq5NQOC8mq6UB9KwAD5eYQl44yL9grMoVvf3buTEIl+9+vxhVKbHw0Ax+onDpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qEgF0zZw; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qEgF0zZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPiKCd/Y5KvJXewYSEnuu8TBGXQN993k/jhcfj1GnpMq3k9Mb2uwrM3VXoE/fozEBMQw18FlNbxjAih5HqTYLbqal4Qa4VlPi3Y+xLUlgNqN12PI1ByfcJPI2EdUGFc510q6MwVhTuUO2uGFbwp47Uw5yW+ePlWj9YuLCIdyFY/PedBaGnUIXq/kCvOnJbQ0ePR81josBx4Kmu+2Z6DqfHrJ7UrCpW0iaVgM81e5opUf3/SjAAJuI0umhJ0FXE6/hMM98zuNPeOmLd3q3NVxbykzGn/vNqvwVzaxnZzpWueFZIUy4w5auWWA1GkXt6drV4mNgQ7w+ju/IEucJSnb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjjkFDFH3Mi6CNH8f8YiHeCSc46WETMqGG30Gm5Yl88=;
 b=cYP5+xU/JNx6hG1xyADQ6QjQk/b31Yru4bQZFi/dlz9ThO3c5EYNzegj/+8tFe+CMpaRJVtID6ntudCFlnn/NuHkYeRg9/4q94Haboo4KwU8rrjRxkfLeWteAcSSqy/+x6Efmt5KzEOooLgZLlABlxevWT8wQqgQZ5blrAGBsK706QqJApOd22e9acatExE+Cv8t/OlRbXFyedc4wZS3l5NnbehSq+vdqH155NXyAkZpS24CU7VR1cEUUHfzetiDtiyETVfv3qm+BlZwXC5S+0nWhyW+7kflQGAs0+7Zh0ok9XhDpmomAEzWQVu/PXwb6S6JfhcC3dbPNP/GxpquQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjjkFDFH3Mi6CNH8f8YiHeCSc46WETMqGG30Gm5Yl88=;
 b=qEgF0zZwS9v/ompLXYtQnojQP6MM63eJKfTgfQUlqUIoUWIdeYhIoFhNVyB4GeNE/GWJUDqdgdWzcJf4Xm1x4RgWIRO9D5TC8FlCDceJ54Tib1Gi2xJpYxpQ5WjE5C0yf/f3M3E1eNVr+HskYMpS0vuJ2GnFhWXqArLVVtmEDslG5eoinbBrBF4mWZHAO336lzw1HjbRVCHAbf398acWcQxtuzlN5BQtTJEi9ANKsgx3E6kRTEj4TR9sqC8faUfFxqJJV0rtcZeT9lia/6Ill0HdTXvzlMhFUSdic+aNIKq5/c/9r3wRPCgMwRWbEXyXlByfW7e61neAyTsPTmrvEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11084.eurprd04.prod.outlook.com (2603:10a6:102:492::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 02:40:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 27 Mar 2026
 02:40:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 27 Mar 2026 10:42:04 +0800
Subject: [PATCH v2 3/3] remoteproc: imx_rproc: Add support for i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-imx943-rproc-v2-3-a547a3588730@nxp.com>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
In-Reply-To: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0190.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11084:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a58a53-17be-4630-9109-08de8baa325d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oOS6izypxgHJUiVawnhFRSy7b35jgD0IG8lb6yG/t+fl+jxw7u6Wx9Cb5/EZQ3+eTep+R6NmbGoScNd0urcmNKAKW6dZzu41bAi4Nn73DEbBNTZj9KdlfBf2aPX4uoH+cTsn3jIvFuk0QAJ7V8oJum+ZVYLGjl8oAigd8xGZEForzgJuVGttlZYhpFF5LljQb0rNWE4fddRMbV+r0jfy0ENPrx2Y0HvY5pN4kwUjpapd37Myx5W9pK4cwx/7NHtr+1/TQ5Tpq8d5WB+2eibckaOROnYAT776gemZ1tX1djuJSV+DSqlMMXCFpInYliAgNkooyXv+f2GOaGukRpbEqwpRVRuU337TMcCQex3YCjhwzkKBafPCxeg0Kx8KEIxzwO4166HcncCksEeZackEBPakX0Mkel61DIkcCcMMtj+2E1CTfAZOVf3lQ967QwCEPFFSOyOIpgt7OfXY+pvTOQKDikt+A4FW0k+7TL+y+MTWRkuqqj57zkCdOrqOGPbOWO/mE7UDraci7t/rKH91qwZvs0kaP+NelOZgUCTdROpcoBgaLqY46CMvtQOpbprvNAv8l2Xv49xZvkJm4nazZbMKsovZPKl2VgjDAHwmEECk+uiHD5vXGzt4HpAXSFfH4SALayYMW0iCcHH41oOWpVx37+lDiFnHVoUTDWdKn6HYP2Pms79XMUqFMfzW+f0rjaeD6VuV9fDcNne8F2gaidRyAOIG97Epftn2ZvcBcsXs1J5FUNI0FrkADT388xI0WP40yzLGRHVNLaSOk+5+S41mBqLv6K/D7iYZ+ejCA4z0Z/uzJsnFYy8mU09g7JXT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVQ3SzNHWGI4TDF5SmwxRXd4K1JmMXF1WENWWWdFRWEyU3BFdUVSYkJEQWxS?=
 =?utf-8?B?T0VZdHR1UWV6MG5Td1EwcUtEQTl3Q1JQZExWNlp6ZTJ1dlhYdmtUc3QrTEEr?=
 =?utf-8?B?Zmk0NFVHV1NPNFRYc1VteUliNlB4MEZxZndvQWlqUlJiTnVJb1M3aFM4eEpr?=
 =?utf-8?B?a1ZveWpBbi9XOHZ3OHR2c3NMZEp0THJSZ2J6VlVuOWw0VTFlSDhqb2VjRlhS?=
 =?utf-8?B?SHRzTzdjS2Fobk80bTVyanA1V3N1SlkwcTkxSkp3bUNudjFHVjRRQXhtSkpK?=
 =?utf-8?B?ZXB1MjRxUGRJa2Y5Yy9RNTdqWVJpdU90c0N5SzZnbk5HeG9pYVdXd0hFYlpB?=
 =?utf-8?B?R3BYOE1QV2ZEVzZ1QmVIbDV3OGo5M2tDTTRIVmN3Wng3RXFwS0VwdUNLWEww?=
 =?utf-8?B?bnRGZHh4cE5NNW9semNpelhQWWRzTjBFVm9vZDNiLzRFUU8rbzhuZUpJQlB6?=
 =?utf-8?B?dVg1TStUaFdKc3RrSUJldzIycTJZdm9ULzJQbHMzSXRHTmZnY0ErY2ZjNFhk?=
 =?utf-8?B?a2ZIZlZpcE9mZU9sNWhVSDFQMFN1NU9idFd0c0I0N2F2U1J4QzR4dm02TDFm?=
 =?utf-8?B?MTZ1Wjh3bEVJSTUwM1ZPRXh1eFB3V2JaMzMxSmhlSFVxeFZKSmxhaVcrVDVo?=
 =?utf-8?B?MUM4QWlFZWtuTDRMNmluWVQzekY1dzdaVmhvNmUrUVQ0WXNsNkhmdWNwcHRq?=
 =?utf-8?B?TkNyRTh6M1VLOEdpSDQ1TEZEaitqWmZ3d0ZELytVS3dKbG5SRFJWYlJIZE9p?=
 =?utf-8?B?NHhCYmJ2b2tUTHI2RWF6NVp6blRTdG9YQ1FFWDlqNitvT1RESGRoZHh6c2NM?=
 =?utf-8?B?aGErS2VTVjR0Szg3akJIdytGRENNeVV0WXg1V3puQXlqM2MwMHU1NVF0Q0k1?=
 =?utf-8?B?OGZHVW04bE05M01zb0JDeWdFVkk5a3gyS2oyNFliSWdBclcxYk9LUU5KM1Nj?=
 =?utf-8?B?NFdUUXJCem9YZnNiMlgxVjJ6RjdUM2FmTlFkWGxDT0hIVjJybVVhOFBhRmRs?=
 =?utf-8?B?a01qT3p0WERxSzEzVHNQdk5NSHNIZ21TRUp3bzRhT1VvOTJZbVVnVVdjYVh5?=
 =?utf-8?B?ZHNpTXptendOTGtlQkVYVGVseEorejg2UEZjSEV3L0k1SG53bCtJcmRjMndX?=
 =?utf-8?B?aWVkMWlIRUtEMitZWi9NdWY2anVuemxVK0dheUVYR293YWlKaEpleUk5b3Ex?=
 =?utf-8?B?dHJsbEVvek5mNUhCQ0lKd1U0ZFVlUTdlS3BRREN6UnR1RGFaSThKK2xqRk5s?=
 =?utf-8?B?eitXVElGdGdTcUdpaUFMdld6Q1JKY1ZsdXBKQzh3U2s0aWJibS9Cbm9kci8r?=
 =?utf-8?B?STUzZVVUazBMTzhvajh3TlphZ2RaanY5dzh6MHNOcUlkN2dROEl3UFdjOUw2?=
 =?utf-8?B?Ym9XdWRLNGsrM0VwQUhHdjQwd1lTZWRVMU5FYmd0eldnRGEwNkFsVUxpVXNi?=
 =?utf-8?B?Z1JEbDhmUlh0NmIwdkJUKzZDaGdBelRaSWpRMUowMStLRUQvTEUySkdWVzZz?=
 =?utf-8?B?Q0pvSVlveFppazBCZUJ6cjBpRTIwUVBhTjdZV0J5em5BVHB2RFIxK3ZiSWUz?=
 =?utf-8?B?VlI1MFh0eS9FVHpYOFBLMWpTb1JueU8yNlBRbndtRHNjYVJ6TWpObU1rTDV5?=
 =?utf-8?B?ZVFSYk5JcThIU2VrUjBFV1lQMnNZVHVTREVjVEtIYVRjd202NEJUbVdSdlpk?=
 =?utf-8?B?YmRFZUxmOGpIUDFSSmowVWxwa2ljN1Yyc3hzdTJJMVMzNk8wc1l3WHZUU2Er?=
 =?utf-8?B?ME5NRUdzcTBRTVR6c3JQeHVTbm43SC93SWtzeXp3K2p5OWNkMXc0TU1WM3pN?=
 =?utf-8?B?b1YrTUJrNHJWZVQ3dkZURXcxVzB0bk5zdzVOV1VqUThjcFM2NEprY1dEN0Uz?=
 =?utf-8?B?SkZvekRXeTlnWU1oQ1kxUHpNNnJ4U2xySC91Y3NXUU9LRWpEUXBibW9kKzVI?=
 =?utf-8?B?aXFDUEhSdzhYUUJtM3czS2ZSVVc0eEZyQlJUTmd1Rm5YVWZKTlhEVnQrMDBB?=
 =?utf-8?B?Mnl5M0t1Z0JxNzZoNFJFcW9jZHk2ZnpLbnE4eHlPVm1xanhtazF3UGdpeXlu?=
 =?utf-8?B?emtFcndSZXQ3SE5TTC9MWGtIbkl4cEpvNGFXcGxVTWZXOHJNL2FSTkRhcnQr?=
 =?utf-8?B?R01kTGswYitlWXh6RTNHMCtCTEZJb3Y2ZlFoWkFiU1pwbDh4cjI4d3d6WjNr?=
 =?utf-8?B?MjNyZVN0NHplRDQ3c2p5WWF3MWhzOVlyMWJrSnFRa3JMZ2lCV2xwY2ZTV1pl?=
 =?utf-8?B?dEFWNmV5c01kTUgxS3o3V1NKRFl6SldpemdxUlF6S0ZtREQvQk1hN1hQVzVt?=
 =?utf-8?B?eVluSHpjRDVPZytTWDZxWW8zK3NHTWl2eXo4Zzl1anB3WUJSQzhjZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a58a53-17be-4630-9109-08de8baa325d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 02:40:24.0868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYhh2MFsegQU7OTDDLW7PqhAP2X1aWBmVeHv6Gw0tSGq0sgiT7Rq5V2r9chE3ppFMw1zX1v4LuEdl4OlLj5KVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11084

From: Peng Fan <peng.fan@nxp.com>

Add basic remoteproc support for the i.MX94 M-core processors, including
address translation tables(dev addr is from view of remote processor,
sys addr is from view of main processor) and device configuration data for
the CM70, CM71, and CM33S cores.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d8ead42640881bd523d605fa7002935ef6e98077..525a92e03e8ab540697a3ef1f593b079f55e10ee 100644
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
@@ -1466,6 +1507,33 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
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
@@ -1489,6 +1557,9 @@ static const struct of_device_id imx_rproc_of_match[] = {
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


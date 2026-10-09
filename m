Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013044.outbound.protection.outlook.com [52.101.83.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34F2609C5;
	Fri,  9 Oct 2026 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515518; cv=fail; b=NJP1cDqanhYORE35hyjnbPUdo9ESVSmT6cVnikLQj3oQrh51+J5GcaP0DBki1bEylghsTC3tTBUa/B21OuYEkjsr5svAotQxXkDeOSA0SqYPQFCSB4JTK8luoYZ/YI8fQKZXDG1yg23ODB9sxht1tIPh+I3pVSwak9ZAgVy6wuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515518; c=relaxed/simple;
	bh=kX0CWEdzUIVF91wy0ZGSnA3F2KGTe0yyIXtYWS8s5sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C5tu/SRMbwF1fyi3SLScqEUbbYPm6Yi/vyWwRjCPfrPZzikNvyGdFI4QaS4k+XtkCC6iuJuuKSLPkktqkPt2QpfsBkwvduGkMZ9GAJPlTHncvQzpPjoKaq6UHp0Z+489+A1ofcwF5AsLjraR1wZfRq8SlXDqQPgLkC0X6q60v6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xSYiR9Xk reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xSYiR9Xk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bM20vcJVN/LxWiQl0y6t4UFd8hOPrAfPvCFlYhrhB4Y3s9RhxZFoSoMRCL5NAYBxw0hjaccpGrtgsCXTglBbC+Jsy8ds+n4RHsT119bp5oYYVh1xY1xV2DCUpYBzDrvqxNy0ZAWbIV2xzq+efCjKtURDj/44c+hcjDue9CISuAGm1dHyaSZlQdB3G7tJt1513cCNnJxQt8Se67k+XGO0HRYPL8K1bGXoCWWtQIl/9n2I1Ws1jEZTUrvpo9r8Rde7MnypHeyOYF6l4W3KQYjtBIjY6TiMQsXX0VHblUcx7RKZl9NVqVazAUYiChgJmKOTMu9cCVxFTaAOrqlsyM4/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXgaBu0wXQvZ2R1ogj1MKUL/ySep5Q4zwMMSm0C+aC0=;
 b=QRiharMiq1QZr/VqbaCkHmjh2izLlh9Zx1GOhLvKvbBFjKhv2dmD4J4KZBhMQ+5RDpSbZ1PdGhzrpr3lV7UehVRw/xBigXyy15s/2VBs2IXyKJ7tmUOdnjUiJ3xxif7PAPnjqCTToz57FSnKwTmWkWWFhSGbpshydki65cXcxTOwCmVIcXZRdlodvfvDFIgFk2wy/yz3Ujtn//lanzZbqdN5e9uyah89sxL4GIDYSVf6xTPiqlknYY06Va5Y2rkv0/XmKqTnX5lJE0EeppURzrcQ0YpslRd3qtySxYVovQ+NnBMLvbOmghirzkVtT3L56pypBptO4/+lqWqiMpKEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXgaBu0wXQvZ2R1ogj1MKUL/ySep5Q4zwMMSm0C+aC0=;
 b=xSYiR9Xk7wOQDFS6kqdecZgVu3aBzg/gMYdEt2pKqeqj52mUDX8j3rKDFgw3iP2BzApvyc3oIgiqHZwA3Yy4xK8aXqd5KWVOkGcdkjNdGfvHv8AuSnyXWOZxsIB2eu5NN2EZUsDHzmFBpG26cDCCWKrbVe/h5x89uw3WQYqHq2Ij4Q99KrbQ4ikp8PAWdbzWQv8EAF/9MUxtDT8FgnGpCdz3DLgRy9B9NQ6yRyH+xhUqaWl2IlgoQweCYPDlYSrC2niwXi1ISnqSaolMcSLbQtG03JKXuxFoSD8FHNi289G9pYixVSy4y7s/BDoz4Wkkn/V6f1mQlujp/UapAO8PHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMBPR04MB226274.eurprd04.prod.outlook.com (2603:10a6:20b:75c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 03:11:53 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 03:11:53 +0000
Date: Fri, 9 Oct 2026 11:16:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Message-ID: <ashciuN/Po8nIElu@shlinux89>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
 <20260917-memory-region-name-v4-1-260755920ebf@nxp.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917-memory-region-name-v4-1-260755920ebf@nxp.com>
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMBPR04MB226274:EE_
X-MS-Office365-Filtering-Correlation-Id: 06804b07-411f-4929-98b5-08df25b31142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|4143699003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QKlQQp9ijbAi0KIA4plOguyPIPpMaMHgsjoDSZWMyVuHBASPrQ7/b05f4Lrimnk3qb89EEOP2DPAeeOFfkMPBEH7QofR4M0J1sJvwApl4fG8doHV2MXWPkZZCeMOZwQBamuLbsTpliDb+cSCndBf//+ePOKDZ+Yc1JwB7MTcL5stKxpsivGfNVlOKC+kUsdXH8/FXKhNbWsfuYRAuwY3ZRdtRQAk0HJe/jbpKq6PkZeONnmnnVgWHXGYIqaCqvujRmuEEjy1lzXfIsS+NgeN6iED6dyubOO53Jht3At+xa26W4TNj7/d1OPTPrOw2kibn3fD6jChhNueaJ2+hxF+fSP/8U2rq9DsK/xzHop1T+BjO1ML4jGH7x2kPJtgxzUS4eR4Qf/LCQiERaH2IwieIGhw2iHECNU3yjFOAoKEDit1DydkX8Z1tALKmAh7UCRi9luUh0e/upcE53BzkLc81vh5t6QXo+DwK2Frrvtw/aiLM6h1yvSpSl3ZvxS4yZGcoGTh6zdJbNWcDn9Dq9UVerJQ5gMTveUqVjGXzmUui9OKskT6AOaKB8PLt57mmQBOOeiK+0eh6Qisgyk3/azjwah/dBXKrObAwbCSTUaODK3uo2xVFdDaOH7DQPGcak7D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?WrRNaALDXQUZJ9NVnA8ZU1xyF8BwQKgkNnChP0uhTpRo4FI/Pbd8ouGRDY?=
 =?iso-8859-1?Q?r5mN7rUF9EyI/vIYReQVqWQgFVFyrvGQx5Px8drQi9NbTdt3FQbkoZEp5j?=
 =?iso-8859-1?Q?EWaCn7N4+hIkBzKnYaw7Qzn6SXkDLr++2VNu9GRBDM9ua5NzPUmZ6djcUf?=
 =?iso-8859-1?Q?XArQiM59ufN/N865ZUOcI2UX1rVd+TS85qP21+CQ9xEuk/9xhSNaJWla9i?=
 =?iso-8859-1?Q?8Raz6miZUZWTbm7N5TrwyYQMh3cmKvA4JmH/TDa6pvB56MztbJ0SEBkA0x?=
 =?iso-8859-1?Q?AWlt+CDApKAYlkdUgD7rXNXWxgAk2pNYTpSe2TgwmuY+dsHPBnhEP9cCKM?=
 =?iso-8859-1?Q?DnmH/2a7a6zZ2VwPdHv7MirZ1wnaaCwAxQnWxeLeY/Rr3vhQg+aX8NGhbR?=
 =?iso-8859-1?Q?A+oHw43QZ6gY5d3wcEs6lGZxbbbzHdpyJWXJhGhYr2xuHjo0orhbOWpexo?=
 =?iso-8859-1?Q?wnPC5cRtpxUbB7KMGChz71FiGofSbPzjrrh/hZ1UIup30JkIuLXuERH60Y?=
 =?iso-8859-1?Q?It7YiU8n9Nz/v3uG3juEPx+gzbzpOr0JHe+EQrLqr0q/SzA+o+ndx2OSMp?=
 =?iso-8859-1?Q?l5SnutdYwi2zIdjWGLIx/oOj57ploPVXlUfMp0gUSxG17jQU6YGNTl7sD8?=
 =?iso-8859-1?Q?5vTL1TraRFZIYovphk0jfQ4Af91WDImWINpnjb6626Mvu09A3IL/glyqau?=
 =?iso-8859-1?Q?wkZr8bpZxSyIIFE5rxr/fVTlU1I0R71bvTFq+0dXCL1icCKJhms4dliFtx?=
 =?iso-8859-1?Q?IEpWF21SES1S6jgrWsplzvap/4RRhEbcUHiEFfmgLSO4OQq0K7BRTrsFTL?=
 =?iso-8859-1?Q?heKWRTLSF6eP9B9tg1SjRhKftZ0+L8TM4WMYiYlRV0eEPsDuqNZ57lzC+6?=
 =?iso-8859-1?Q?GEbbHQjR8esmnDODMzUvrLvbnfrVlOGuCVVkho0dmtYWoXj9pofL/3mz5L?=
 =?iso-8859-1?Q?xZw+78h+YTbZKJjMxI8ECMGhzCT3r8PYO3sRbmw1qWEVPhef3rQcFSqwm5?=
 =?iso-8859-1?Q?4BvZtJUajF0KvHIGlUCs988BlbunCZSwsw0an+jImpHdJBpoEg9rJuc7GW?=
 =?iso-8859-1?Q?fC/ekq0Bw37MHaxNzKPRkdcoGfvX50q12COVWTSeNwaq5OcThbJtOelb0U?=
 =?iso-8859-1?Q?68D1SbIs7AmXqTFT3rHNKP5C1rmWe5ZhW1CuP2u+PJBskvgufVKeA0ojY9?=
 =?iso-8859-1?Q?EAiAgpqpkYb4q9zwQMo5+GZwijFkccyi9YnxSZN2s2Mz6qGzEEGU2igWQp?=
 =?iso-8859-1?Q?U+U7Omxq6rOkrT4pKpL7590adKxvV6ibwj39p7/Wts+kvvQc/ut2TWRgE9?=
 =?iso-8859-1?Q?84WUN30iehzXOUJU6XX22jjbYcX0W5gfYixvMpniAiFb3rcoP3e8i9Mqud?=
 =?iso-8859-1?Q?pWnyHI5YicAuHl4E3uGYzcZbhHpwkpTA+8UIhnz0PKF4ictb9XxnDRlEms?=
 =?iso-8859-1?Q?BwShk50zM0y3xieVQauxVLLbgjiAxFA5XMo1cpGr7cNyqGAeaX+KzjFbit?=
 =?iso-8859-1?Q?C02ygtoYVyJ2ElGdo8dq+s6GRS9+hrVEtNvbTLnDHMxpmsGFDcR7shn0WM?=
 =?iso-8859-1?Q?DHgsosDJ/g0WPCx2TzaYi+Pr51FzxxMDSBZA8AbubNIUK7LaiM/y6+G2FI?=
 =?iso-8859-1?Q?Log76SP8N3N/KHKNe476V2F6dZx67qA1nEtDwrRejM84tGHMWcaON9xo7r?=
 =?iso-8859-1?Q?YunetRK8OPfKVxcugqhkUViprgoabPDWEiPjpiKd9+XZarlZKqWVmur9ja?=
 =?iso-8859-1?Q?zgTlrID7Vsvz2YgnUJUSv3xpwVC18jsNP6OfiQFAC367L0u1BtdtsIdLC7?=
 =?iso-8859-1?Q?bfWP9SeH2QpS2lQ4tEErcxk+H+2CSTHBRYG7R+HeZ5/7JslKLqeZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06804b07-411f-4929-98b5-08df25b31142
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 03:11:53.2196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntddJdoIQYrqvum9TuMetROCZ0FqjMFy+2HfhrqO7TKO08qFZHHzXW8+qeu1ztXn+kax1zX9oRp6ggdl3USRLoze23sREtH8jySQdesmq5F1Pumhg2VGKMx0+hEsi6MQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB226274

On Thu, Sep 17, 2026 at 02:19:42PM -0400, Frank.Li@oss.nxp.com wrote:
>From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
>Document the optional memory-region-names property.
> 
>The driver currently derives the memory region type from the referenced
>memory node name, creating a hidden DT ABI. Since memory node names are
>not constrained by the binding, incorrect names can silently pass DT
>validation, as seen in examples using "vdevbuffer" instead of
>"vdev0buffer" ([1] and [2]).
>
>Add memory-region-names to explicitly identify the expected memory regions
>and avoid relying on memory node names as ABI.
>
>Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
>Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
>Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>
>---
>Use optional property to keep back compatible with old platform.
>New platform should use memory-region-names.
>---
> .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>index c18f71b648890..5d98d21035f8c 100644
>--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>@@ -62,6 +62,15 @@ properties:
>     minItems: 1
>     maxItems: 32
> 
>+  memory-region-names:
>+    minItems: 1
>+    maxItems: 32
>+    items:
>+      anyOf:
>+        - const: rsc-table
>+        - pattern: "^vdev[0-9]+(buffer|vring[0-9])+$"

Should be "^vdev[0-9]+(buffer|vring[0-9]+)$"?

Regards
Peng

>+        - pattern: "^m(4|7|33)-reserved(-[a-z0-9-]+)+$"
>+
>   power-domains:
>     minItems: 2
>     maxItems: 8
>@@ -134,6 +143,7 @@ examples:
>     imx7d-cm4 {
>       compatible = "fsl,imx7d-cm4";
>       memory-region = <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
>+      memory-region-names = "m4-reserved-sysmem1", "m4-reserved-sysmem2";
>       syscon = <&src>;
>       clocks = <&clks IMX7D_ARM_M4_ROOT_CLK>;
>     };
>@@ -149,6 +159,7 @@ examples:
>                 &mu 1 1
>                 &mu 3 1>;
>       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>+      memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1", "rsc-table";
>       syscon = <&src>;
>     };
> ...
>
>-- 
>2.43.0
>
>

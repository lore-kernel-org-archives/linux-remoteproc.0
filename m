Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A925452A7;
	Wed, 23 Sep 2026 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189057; cv=fail; b=Gt8P9Az5zkYbiTWUwtRVyYoJbdnXmRna2gHenLUm6BNrQNZ5v5reptRNhpopK+HLMj2eP/H0xOUrpEhbKI4tXOsera8+r9Hd1NmUxCqa2+4RV+R3Dr24rjUuWIzBWZuXrsi21m8xnxuhU1DwD0tu5s+hlAPRKjX93Fu1TKMb4YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189057; c=relaxed/simple;
	bh=uBolWorylGgZfCepMl1gs6bzVSVkGaI54AHh19fWsIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xr8YQbt1Dst4iifmJQZRwM16rNhbBAnTkKGAQb14ydUYKyC4/yqD6AzYF/rP225CPYh6gDHPIuG0JayDcn+lnICFmli8gB/0f0hZNrDaWQI/UiqGqkIK/XjffvzjUlNf7XE4rlXBzEtMD8xCBRG93jJxyVTCD9IIGwDXSiiOKrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wcx1sqjU; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wcx1sqjU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7dIsOoqB99eZqoLsMWKY5tJQETwNcQ4Nb9GZXXlhsy589u3wrak+QA4V/lR6fAAKSvF9+j7vJZh0FpppEPA6VBM/sMfMLeEsVWE3zct0Ka+gXJda4chyuFP9Kx6Y15DwgrlZ+GlubDl8Zi0swueKeM2yNH25dzU/ChCsMkhwfGX05IyRF8wUeoRz1aJa+OFwOUqp/16dRKE+dmiHM/RKCb7to6w9PzBmV3Cxot6ZCqBm4hw0pJzLILqYewdf6B3JNkONIpS0URVznrtDR1Z/zzRnTbM8JzyxtHx6bh5MvlMyPK5R/Dr31RV/n4YxBR1/7Z13l2wf7au2KPYlW4HoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxe8ec31w2xTVzCPILG5U5LwemAQN3ofZRYQEQvEkvk=;
 b=qbg+jZZ+dFJd//AS/wzDe4x8HctjdbqyBIfPJCGhCcQCZaPZjoDaYsYbAzCDlYQ9UyAvyNWsp5cgythXhUCtWMUdXEpV0e3E7t7VkJuBG+EGSr0SVco7BnU/Trfpp4DDtp+ILAz9zu8iZ5AMUzKV1lwRypb6+NCTt92OEONXO2Qipg+xEoO2LyxK7ynOn6xoAuV+DWSijGJfIRIny8GVWbLY4owX9Ti2rvvFkCqzy9lI/TvZmq/qmclthiAl0GyM/x3vOK/UKkFO6pgGeJh8EMDlSLvNQN+Z2oJNCr25BIIcjMXB2I6h8Ums8l1O2Kd4edZMWqgIAq0HTQnr5ZcQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rxe8ec31w2xTVzCPILG5U5LwemAQN3ofZRYQEQvEkvk=;
 b=wcx1sqjUhQhFzsI03bK0spvVVW9h+i8wlc+RaQdmERFTPGn+/ovgycuNAEiZySs2EwJ3YzHtsxR0NuvZrGfp9/uDImyAt+Nk3BRmViM8FA4haBnRNpNu/AngNFrWmJYHItCQuEA9eoHXyHsW0p7VxK0RIcaHvHYGlnbva1b7uqqmJi1hlfWXUl18cmUyuxhcCQ6xhKY6izEUnWMSM6SKsDu11+ZaSmlypewasL9msOXP/ii/cuVeSowW72/qokLxy9QnQFMyvRxaqPDDYHm8NBqFGQpNBAb95EQzIgCAlNorZJjs7jDZtDepmoCyrGVuVJEpydMKhIgQjkIgJKhR2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:43:40 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:43:40 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v16 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Wed, 23 Sep 2026 13:42:32 -0500
Message-ID: <20260923184255.299034-6-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0128.namprd15.prod.outlook.com
 (2603:10b6:930:68::18) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: daccfc00-993d-4512-9c99-08df19a295ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|921020|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4IK5atHQsbk30YxG11GkHsQVITqXq0z5wbiPlrzJq7cWRBoaJk2Fl7t63PbU7fS2Nbp0loS7u1M660NC80KV19DkW8LDVkmCHSmwGSFEOk9baYtUZL4KQ8UruUwOvAl9RDnWsvkNGGrT68hv4q0XDOWeCT9AzVodca5NO1XIwb1IHZ5gGU4cIqWdKWpzuwgN82C5nqvIKxSrixv8i/USqXt2AWmwQhR7sn7TIyBOZfqaX+Y/4uUWrJIlFxQ8KuxeE4Pa7KxzXXexhEIobBWVJoxZa863gGkwPy0ACklUxg0udELvy9XVUSE7zYvsAgeQlt6Z5UqqxqXDA2kkvLh4w9vjKkmtJf1MaAlLnUSwW4xtvUR4E5QH5VZRC0H5acl/gruDMDHygMsIT6WDmUY1XLnRhij3ePyAWcWA/MzFxGgcNyiROOHRaZjqPNqftDEFWNh57D+itI79CVzQ/rltrvdyL6Nqsvw8USe5paUOt8Db3noOnUzLTrcYqkWAcses4mxRr3IVLW1trQHW9L1bNgyrmk9cbdWCc+BCISMn30Vl6leqhXZqJP2R0FqyA2TaYD09cCRZ0YR2NZe1bgOJpIaorMmNztscCt56FxT2xmUGegpHgHI2FuzGtPVbCcTHtQK60WEcmu1ImTXioux95bZ6K5+5lx4ySjaGbkjkJZK+iOlUcgcYaKosQbztO0sH7nOiB+P2zHBiDapteUtgIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(921020)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NF1rUJBUOdcr1QHioXt/Uuz6j8sdaRlCGJkwrLOCGuxW5o7TAQL+ztz7uCSR?=
 =?us-ascii?Q?7tZjL07yk9JT00HsA7+SDR1D3rz3pgZbhDZ8zePk17vVtCK80zV6FMwTadZ/?=
 =?us-ascii?Q?eto6a+9Fr4u/pzCl9Es6zw7gTF2SjjVDl44SQCzTNbskDDGsJHUp+BXnJXQd?=
 =?us-ascii?Q?Cn60pF7VPYfyqaPGtcw3/zG/pJsAwCCiqoBZ4VSPtURyzO6Noxx/1pOL/H+G?=
 =?us-ascii?Q?DZ5hMpXVHb5Nob6pe9icySdpk3PljYSD+XqWGWckeXV3eHPbjYGVe8nH9w/9?=
 =?us-ascii?Q?Tivtk8GhyQ8zkw/EcnaLtbhSPTfHN8qHZl736OJkmNUbmuBSUwBE+mFcGufX?=
 =?us-ascii?Q?yU8w6wAW1lKGUsBRImYtv7F9suS9MZkA8YkweXWWAQNaNruMiqQJZRvZozyl?=
 =?us-ascii?Q?bF+rF+D+372rA1chk7NkeM3B7Jg+OuvSum53EIv7ngwTJX5dUo2Ruw7eEITf?=
 =?us-ascii?Q?guH+yoL5wzov3q1BJ1rFkxcRup86ga+wgY+mJQthnhNL8oCZikscschPaSCH?=
 =?us-ascii?Q?jMHm9JZWvBiN6l+yhN8TaATX8zvHyxYU7s8rYnFEJ5v6yTsgxDFsK+XYT42u?=
 =?us-ascii?Q?nwjhGebwX3Vk+De4eZ5XDmqxx6LOoQvF/BqnexUvmdYaOWOKJFIk9mfp0nNU?=
 =?us-ascii?Q?sxASMb5S60NdUsWe4EX4F5lbGpkduz1UynmFZP1T8NqNEk8z7Vd3XeDHGCzk?=
 =?us-ascii?Q?t+5GOwFSXK3zR+LOXe2bzTcf6Q1m5jOOK8JIcHmawvtxWTBH2Pkj9329qXjD?=
 =?us-ascii?Q?ipoo4a5rKlgT0CLyiUhfBJUPr4kr4D0Afhbioy4QFoJFxLeHxFKJtyJNwGvs?=
 =?us-ascii?Q?+/LWntyt1jR8udj7bTEayVwGAorwjhdtwPkQSO1Kv/UxZFN+Wki4ayNHyoWN?=
 =?us-ascii?Q?Oo1NgjeuavXO6d2mvBG5HV/XHUZ1yBkBuK45SBNdfOC8bFSWZ6t0iAN4RU+x?=
 =?us-ascii?Q?0EBN8q3dYpqOi0a0Po0ZTnGbmKDptHntn6bufYUkyqeOxyq42PCKzBHSzV9R?=
 =?us-ascii?Q?zP5Dp9vQ99mnUtUcWz4PBwcrUv7Z7SO5r3GdocKWxYzVOPCKwlDI+Fs+QtAo?=
 =?us-ascii?Q?9TR4/U6Pv1E3dHU/yuTj2u3jSyS3XbSmbqc34EJadwZr9b8jHslwwqdBZRyX?=
 =?us-ascii?Q?YfHjNEJBWkJKL0tawD20Gm6of09NglAMl8VLdIiMlu3tjjwDm0fgOSQsMdpq?=
 =?us-ascii?Q?DejvUirQyM6f8+yj70NMq/+VLCYTTk87HAv1kRfqiBrYpt+E/zctEZaqkk23?=
 =?us-ascii?Q?lZm1zEJdTaCzvqyNLenGPiHfYZ3lcqv63lnHB8n58JHq+UVnBqyhNxEti80y?=
 =?us-ascii?Q?5otKga9m5WGiX5GI7U1RpoSIQ0ePb0CpLkiusTjC1C60lEQw4oLeU/Rlharn?=
 =?us-ascii?Q?Fqge5OXsD90XMn1woTvyTiR4oKKMvZ/dNAKofnRWSYMm3AsbWCjhi8ci/sp2?=
 =?us-ascii?Q?vJhVHSOqjI779gCdh9F4PrPBx/xBbzs/I439iP2lo0EHD3FJEHpZL9OHQ1Nm?=
 =?us-ascii?Q?/FOcIFuCKtdbkGYJmJ5TshrAcsr6dgd6/Q3mNOHyf6ecT0nFJVmsI10cd69S?=
 =?us-ascii?Q?9KDPz9cd5bheFHoAIYpJtFEbtQQ9tN8fAf/6GFY6kcWQWxbLNKFfcB7bwMFK?=
 =?us-ascii?Q?h7eqL9lXP5moZ2xscghXmxr/6IVSRCChyOyezC5hXnXvSpxrSwGpcIiQ7k+k?=
 =?us-ascii?Q?k0KPoMVjhsWfjQDy8rRwi48mTZ/SpX1BCoWvt6YQtrY+SEhQCGsUKWk6QzvT?=
 =?us-ascii?Q?MN+vT4EGofYfDFCSkbS1PzwSfcb4yT3se5WhxD8UfNvpqwXbB1nw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daccfc00-993d-4512-9c99-08df19a295ff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:43:40.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjx23zErzdz4CK2VJG6XzC++dMPNd2ODXPzYB15E2yiRZfp9tCVXU4mhf8vSXWFP8oOjWBkTOE1bLl0129GL8ygx0rfqlU6VVW0Goylxocvu3w9Bs319fUbnjZ7wo1/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

From: Shenwei Wang <shenwei.wang@nxp.com>

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..81fb36b48f20 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -190,6 +190,29 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			rpmsg_gpioa: gpio@0 {
+				compatible = "rpmsg-gpio";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+			};
+
+			rpmsg_gpiob: gpio@1 {
+				compatible = "rpmsg-gpio";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


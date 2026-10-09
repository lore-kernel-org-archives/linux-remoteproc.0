Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DE3783C4;
	Fri,  9 Oct 2026 03:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515813; cv=fail; b=QAjGUf1IBq8rrlLikktig5E6gKcxta90kERoOSDExjZvw+Ht4oDpe89oabANRBolbt9FZpVJaDnnsovBZACY2ncFHgBOPtPRzQoBAS9fFuAoSraR8uznxmVl1Y+ZRDWLyNEyf76w3aDvN/oUmoPlPmXnZX8cn2kVebGWEEYrQkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515813; c=relaxed/simple;
	bh=ZUYJuZU4gBbuspikZoJQoTncu1r9CiPU2DByGvo/bCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aCyqjgVieUcCxD5cK/8XjNFC/F7QjUABLc7Ahn+UZLX3/KmeXzMTnEuPLZ/iv13zXut2AoDNeGS1f/whTYjZEbOM+J8IkLoerRnBD9sUN7Amr4NUaf5Q3b9VCEWY1qBiKHqtQtBW1BB1As8McQobw2gAhRkVvSjX+2I7FP5D/xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dGV5ZtJ5; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dGV5ZtJ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn2GRn8qPoNxxfimPUpu7mC6tWmgiSuTlyddhc2mLxm1YvB6J4AV4FpOV+0xjxRMn3J6c87hg5bOZXtzRxIG4rTTL4755aXXVZF5p06mt3bjfurKqLh73y1S8dpMZsQNQRF39umQTRO+CNyjEL8vCZcXj3JgEu2SVXD8WSL3/CJw+Ddo+0rNop7nTWvc8WJ1EjA1d6S39oUq+j4H+2dzRp+7SCX2vUVIG7ooPSn/C7VgSFchR70BMtt65X77os/HpWnpIaA0TLZH6V4xbL+Rcm5/eKl8BRBkavo5Ep+/NTZbHUTUcax1ImQ+Uj0RPm+SGnHHnIfuETm+/ceSNvdqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFcWsMGnyzZcim5ifgI+pmlqEw9dogtANHw1V1+0CIs=;
 b=a30GH5OW/EGF24U2zyoEsV4xzDEmMI0fRPgEDNTHlM+W/UzXz2Owji+5Bg1Dw20PEzfkUtrPUG62xDlzdcvB1yYb4Io/GA/8Hgk5O4iuLh1v/lpqOp0rjIOOWi8+IuERrVu8o9DZT02devQLbl+IvU4CxGWYx9ww9pnMBVci/nnGe/4ZoedMqUkM1tuNzB8NQk4ayzpA1bzungKjrc3pUd+66WmmO8XINqBF9m5bMRNIGctlQv4b5dGn2VAxNQM9r7C3SIuyP221zuy4CCq01GT6j9A/pJUNkGZfF2DGyQUcwuBXmdZiqhN8mnMa2o2JCZGmzeaZPB/WuJES7gE7Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFcWsMGnyzZcim5ifgI+pmlqEw9dogtANHw1V1+0CIs=;
 b=dGV5ZtJ5rgYpxT0Ka74V3yiDjixWqR8q9m/L1zz0gk2Ypl85WI8BGbvsuuCdbvUSih8vJwfoMV9pJWIDOflfIfYhC3lFe/eAm+zDW8gL2oxadRXXGC1seWduNSdnp6uoR0wmeyysGmoVIVuhwj8ALlMkcjEYXgdYyv33rMNdr7NQJ6CILLzxEe1iyyHLjru4d9BR1K6qLcCt3kVYald7BWq2FjxYTyuMKwY9EHOFJPwpWtzz/wMFRAEf5iiYczrNkr1WBvj1SXrXpSZOenKefBP2dfkqwyWjgohAazBC3mF3I/9O8rvnNDMZKUlsmPgzNy5Ht4IFGglAQrZrLZtRkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB8645.eurprd04.prod.outlook.com (2603:10a6:10:2dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 03:16:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 03:16:40 +0000
Date: Fri, 9 Oct 2026 11:21:14 +0800
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
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Message-ID: <ashdqkzRdM74N4n/@shlinux89>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
 <20260917-memory-region-name-v4-4-260755920ebf@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-memory-region-name-v4-4-260755920ebf@nxp.com>
X-ClientProxiedBy: SI3PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:295::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 501d8f67-fc63-4b96-6d6e-08df25b3bcb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|19092799006|4143699003|11063799006|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K/2KJVNrIFLufnovY/+pYMYmfI3Z6cHadZQDpuA53fSWWED29QS9OS0BCVXYBu0oWnHMWqtXuEagZ6qzw7czzT1g3afDGtSefBHbhF2oICWkqS2epwqF8+1c6puDlUOVkMoyVyEH98kQAYgvQtBviCk0oUjtYF0ShxTlT+lsE2uYemWW2kiN18uEcnyy5o2Nq4WP2WVIpC0hKILaSyTsrTrg4BMB+HwlYAIfX2kkhuiULgLM3FDesKZPSIqCswCKfadsbQA6wIBSCrK8UTtAxduMkVOSmof9z3T69rxOOLkzpNktYU5gDmJwarVkc18Iruw47j2LDPyA7X3869yhdYT/JObXyXevFcHX1UHhUookRniuTdnx9AeChFNiBHfYAzTVu5zt/zuITKHCRLM52lqUNMBYn9G64xXjnDn5anpKaaI/9hp9eNt5rJ/XRinRHe944Ksi+hCXVwfPn0zZW8JVZp3ulk/MUHpcb0ob4YCAw+Steguu2mJr+vQwGBnY3qcRSXaEhsyzrYu/yyMSm/MBbALnXQe3H/CXmtDbRFY0je2qKFMhWMS8ziHmWW50i8cS3V+lxiTQ0Hgw6rFRHlTBxjC45/0zm1xN5JRJ6L2ponk4fSUEiVuUOuY0HrE4KEC7zIGTUNmJQ40YZ6WlWjEGZC66I+wpSHFPUJddWf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(19092799006)(4143699003)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qFY8bvLdxy5a4NsiUbMHre1FiF1gGg5WRGj3t451lFJMCyrBArBjOBHCMILI?=
 =?us-ascii?Q?DOBgKk1BcnNgDJNLwmSfKnzofZ7N4CstRJejLjs3vnGtWyB3WqSJeNeumCPk?=
 =?us-ascii?Q?d8oDRnAWkpLmNG1nvPZzzHfuwOzn954uWOAZrfnstKUDR9tvVcJ+i24XSCXx?=
 =?us-ascii?Q?6TKcmXOpjcOCtDWWC2BstAiaQdsc9jNQ5j/ps56EEXt3PRbHn3gPgG2f6yiE?=
 =?us-ascii?Q?6HhcUSBtvoeMX5jSayvpg8JQJkjLQz80RMdyIIFXXdCpqZSCaHVHCGLrz2Ip?=
 =?us-ascii?Q?M+Q/di5SoWWgfqCSMrNxhDKR/gJP8GBfyNAI+4wsw1pn48VT0HUHEp4gbXYb?=
 =?us-ascii?Q?xRH6SldvmTHXK6LNjtXdK4bjRj4BMwMhngU3fItsxUsIUVQ7irBp/VWYMrev?=
 =?us-ascii?Q?6vunbVgN9P20+TP/pIIKuxLF72fFb/PkOWc29Bw1TwbI9hu9WYQK+uRaUqJU?=
 =?us-ascii?Q?RVBXaIu6SEJV6ZtWM5WndEcu3pmB2HFfkg7OWrdZbql9tH8+S7ZAvUC7stv9?=
 =?us-ascii?Q?LEoMXrEXWm60iHyuMat4EVdhPRTdxsIqH7QgEuTW/HJGeVZ0Y+9Ol0clv9aN?=
 =?us-ascii?Q?aFHUIxnsBWQY16xTYSzZVzrxFWXrqI0pODO/HcTg2DjQFe1MZu3gLxIyuXSx?=
 =?us-ascii?Q?YGlgbLo2VD++a3bB1/n1Zb05R1FcyQFjnwM199BSZeYdZjG0cVxw2tJRpQWa?=
 =?us-ascii?Q?5idqu4AL31QzFedYFjdJUaHRke8wDcDu27F+PV0osdeNFMQ/uywbLKxQn9U+?=
 =?us-ascii?Q?LiglmJX2skxCGcFCV3N3Tlaw9os4vEmjqDE22nm3SxOlGDDqhgNyTFc+Y0M3?=
 =?us-ascii?Q?xDK5q4HXbaKMv6jqercvkhUVVHLVs0mUOUpRMMz9OjY3Lk4032IvWYh8kp0D?=
 =?us-ascii?Q?IUfRjvRcvD4flt1lNb1tAZC7K1auHRWQ5sOMUVJDQTOW4ynlrSnjP8ICQqyv?=
 =?us-ascii?Q?39e5+4r7RDtxbIZ1M0+SXE1Dw6jtTvq6vCa3W7EhFk/IpnfyI9beMfVzZXmH?=
 =?us-ascii?Q?lxWTbehRBZl1hi6sU+QEVMRA7sbhHdhN0wDCPNLyo8oHvEJXjz5ErBprilDz?=
 =?us-ascii?Q?ZcS5AgxC48sucRsVd73v30C/uQDJ/n3kP3J6TXVDQdFA0eloko5cEvjulIJV?=
 =?us-ascii?Q?TSMpomSwokwj2Btbp0JMp7enYS7m3XH8y7FmN6wwQh3CpoCYhtFB69YSUQg+?=
 =?us-ascii?Q?sPcm8nnGWBudrrN3SgMi2P9FG3pcBOdivN6Ooj0oyNaCs9tHZxHizlqx7c7G?=
 =?us-ascii?Q?waCLdtU5/ArF4gtklg6fOdhyIRdGb7O26ploHdlT1JUg5wXmfvcSAd+s+1k0?=
 =?us-ascii?Q?kusMHRdgvRHm7ZX2CVRz0pXLVcv9nhEyo7sAvFx53uP6F0Uz6712KqD3o8Rm?=
 =?us-ascii?Q?Sal5taQmYKXVjV7Dx3I8dOFdjfw2AKcPsIKut6ccCYn53yuZ+y8znRJl3+kQ?=
 =?us-ascii?Q?TqD5JS/LPlahUunxrAmvjjEtunTRGAzmQMm7j1iowj5DrB3vPSLALZ5XBfs2?=
 =?us-ascii?Q?vSmu04/wVWDcVipa26XMw8+YZ+9e2VPc2lx8lWZRQXsZ+0s+vrlqhSUOJjVq?=
 =?us-ascii?Q?G0me6XverFqFXBUnwsnbY82mVSNXFuoRQ6uaepmReHVLAzi2MmsajmkMfl/P?=
 =?us-ascii?Q?eijMbd3huXGQhKuaAKQuKyGULMf7m28mC0uAhSvskd//hqln2G8A5Wg82QSB?=
 =?us-ascii?Q?g+gZmIh/o71CZFdbAXuvYi4LufeVDFQykaGyU5EmqHw5STDZGl1VamEtE8fs?=
 =?us-ascii?Q?OAuUYA78RO6mNG7Zboq5l4lVsgn4XhyZ9x2S4M8F4NpjXrs7iCMW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501d8f67-fc63-4b96-6d6e-08df25b3bcb8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 03:16:40.8261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEC90GPgigQVlx8DE0K5h7jGdXBPw2xug5Yz6Mp2uwj38ffrUo0fCe4JKUbA8biPN6rmHNEXYGtZCwb317LvDJKyQL6rOAXKCq2ZeNTfrCobMmj21PnGx0nVSIAz+c3i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8645

On Thu, Sep 17, 2026 at 02:19:45PM -0400, Frank.Li@oss.nxp.com wrote:
>From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
>Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
>to be used with the mx95evkrpmsg system manager configuration for
>remoteproc and audio over rpmsg-usecases.
>
>Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>
>---
> arch/arm64/boot/dts/freescale/Makefile             |  3 +
> .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 ++++++++++++++++++++++
> 2 files changed, 70 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>index 95ae85ab4adf5..3f98132f5a32f 100644
>--- a/arch/arm64/boot/dts/freescale/Makefile
>+++ b/arch/arm64/boot/dts/freescale/Makefile
>@@ -707,6 +707,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
>+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
>@@ -729,6 +730,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
> 
>+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
>+
> imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
> dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
> 
>diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
>new file mode 100644
>index 0000000000000..bc02864c6f88e
>--- /dev/null
>+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
>@@ -0,0 +1,67 @@
>+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+/*
>+ * Copyright 2026 NXP
>+ *
>+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
>+ * configuration for remoteproc and audio over rpmsg.
>+ */
>+
>+/dts-v1/;
>+/plugin/;
>+
>+&{/} {
>+	remoteproc-cm7 {
>+		compatible = "fsl,imx95-cm7";
>+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
>+		mbox-names = "tx", "rx", "rxdb";
>+		memory-region = <&vdev0buffer>, <&vdev0vring0>,
>+				<&vdev0vring1>, <&rsc_table>;
>+		memory-region-names = "vdev0buffer", "vdev0vring0",
>+				      "vdev0vring1", "rsc-table";
>+	};
>+
>+	reserved-memory {
>+		#address-cells = <2>;
>+		#size-cells = <2>;
>+
>+		vdev0vring0: memory@88000000 {
>+			reg = <0 0x88000000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdev0vring1: memory@88008000 {
>+			reg = <0 0x88008000 0 0x8000>;
>+			no-map;
>+		};

vdev1 should be put here, I think.

Regards
Peng

>+
>+		vdev0buffer: memory@88020000 {
>+			compatible = "shared-dma-pool";
>+			reg = <0 0x88020000 0 0x100000>;
>+			no-map;
>+		};
>+
>+		rsc_table: memory@88220000 {
>+			reg = <0 0x88220000 0 0x1000>;
>+			no-map;
>+		};
>+	};
>+
>+	sound-micfil {
>+		status = "disabled";
>+	};
>+};
>+
>+&edma1 {
>+	/* reserved for M7 */
>+	dma-channel-mask = <0x40>;
>+};
>+
>+&edma2 {
>+	/* reserved for M7 and V2X */
>+	dma-channel-mask = <0xf>;
>+};
>+
>+&micfil {
>+	/* reserved for M7 */
>+	status = "reserved";
>+};
>
>-- 
>2.43.0
>
>

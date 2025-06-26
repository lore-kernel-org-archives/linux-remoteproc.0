Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD162ED860;
	Thu, 26 Jun 2025 18:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750963970; cv=fail; b=g6GCN4hJDgEs9v7x8GdlNEp0ZL3ZNDUj7u6gf+DFzJBZbBDNlXnz+HNtSWFkcEK7DSf+KgFa69Z0h1KXBfbm+xZfk/bGYKp0hamFF3ZieI2XCTbmWAmO+fs7idswNHz+G/UPwLQiPllwLdQ5WkTpDXRBvToiUeh3/an8IFDfOYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750963970; c=relaxed/simple;
	bh=ooLKgC3PlcEZPENZGtPXeUzk0LiUnH5U+qJKdURNSDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s2FE7Fb+oXhe8ttsKG2L3ud9cGkTrEFtkPRKsK+uduo3uFbx/pFtlDFOIzd6m/XV370dNFACY72IQG8RjTpCPGNcnyloFIB1ueSANnwnoHGBGhlGYcH0v+UJ600nXR+iN17WPjY4E9rKZzL/FHJMvquDziJUaayaKilOVZL7+s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b96tU0D6; arc=fail smtp.client-ip=52.101.66.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b96tU0D6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE95VlIuACKcd6pQ59SfMNsTFq8iUmDvjq3AdTXuXNPOySZB8N1sV4SkoNNLzSdUIF7Gq8hPdAUvBcUXh/tIJxSSiWey+Q3hizNCeDdoT/uCr14ZkoSKlC4l9V+yB9KphhLE+C/Bz1yUuzIzcgntXOCDwqGrjrwQjy5Upv1S5MOcoMCqWwAnAQgE3yrKrxQA0w1tGW3sL4eYV1pHX98UWPNw9WzLtoVBedCyinGcnc0hJVk0lta31kaBha4yR36NgcMF1LdZ4b5rplndI3OYg6fdvTt0XOWbUP8o79JBdvW1hXbW2x62uNJJN/WyMHXY6p7MT+Z7AmDg4zc18704Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AkAQcPHI2NNKdAm6rnz3srSSxC3rU+pFvG1rDKnB1c=;
 b=Dd130i+UMPCYkKzncMfuFZHBa6qdJcGUGBrnrblLq5vEpdHbJUiUp3qQ6ngWXz/IAk9SdUeWzX4+k0zrjRWZE75Qx0TceapmcuirpAHahWsN5YSD5T5BPLxboGPl7YDBlywnxfvxCDvhlI4ZZPTPAbxj5EN45lwoxNHoC76M70qntgdjybE2HfMeT9b8dWuds9/knKPLqAbJlr69cOYMPNbBwiCCryi6w5PzcmEDrg4qp7jwj12KQWXl32uz/DK9iTyWWLy0dSnzk4hy5L1HmXsub1Of7I7r93LwkG/PKZriy02CX8VttEiopZZmbmQUGRNqznsC/39/J4fIqee+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AkAQcPHI2NNKdAm6rnz3srSSxC3rU+pFvG1rDKnB1c=;
 b=b96tU0D6AZ3pOyGIAzAVOntDEdNzcwbbThXZNKJhRWBmjyFZuw60+phH7pkxfs5Z7bEehbiF73qFKVb/GI2js2OVONotmYNX6MfIxjNLV9MyZbULYSCuCaSkBbFzLRdTUby4sh1WxvbzqAo0XkDJ/WMnBe51F+ggJLmQZBj9XadrMXTM9Rd4MnoEk63mUoRbQc0tHW4pTo9+xRonOfMClYZ07s5Pre74MaCA3I6gG9aIK0PyI/PHk6Xurytk7ur91eTaz2sfKJ4MilQrwk/AfbdWdPgATJFBbO3EDUEKBFT9BpdWXKMzJClC57oIm2bu0RIPT/HLnzXbC6qQ8nkbUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7126.eurprd04.prod.outlook.com (2603:10a6:20b:117::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Thu, 26 Jun
 2025 18:52:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 18:52:45 +0000
Date: Thu, 26 Jun 2025 14:52:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: imx95-19x19-evk: Add CM7 nodes and
 vdev related memory regions
Message-ID: <aF2W+OG8HhB7W7Ut@lizhi-Precision-Tower-5810>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-5-699031f5926d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-5-699031f5926d@nxp.com>
X-ClientProxiedBy: AS4P189CA0056.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b186bb7-61d6-4682-282c-08ddb4e2a39c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u2LEhz47v/SyaEpBKDNbeqzODyMxxL9W1Ar7gn2S8Xx052npxdbG9CEHkR+j?=
 =?us-ascii?Q?cPL5Ek0yb8ewGAtJgadgENPB4KZee33cSlpSGnmKWHzfXvqDP6b7YgKiaHhe?=
 =?us-ascii?Q?QDtjycUOWI/q1SO2v/hcp6W1KKlhsesIis58WZlZSzxunvfiZLl1C4InFFzg?=
 =?us-ascii?Q?tdOJgHCQtqr2pPmkT9mH2fWVIOVKezYm9E5895RP1eQQaGg65tUOcL8AZFWZ?=
 =?us-ascii?Q?pjjaQgIdmbN7H3dNtzXrOeXLOQY6oEqn+6XZN9NeSrWQ8kA6ev1vDOMv24ZI?=
 =?us-ascii?Q?wxM8qjh8nflMFKCxb693mYxG+JbV6RUJTZGVPbwFjksDxmu7Oy+IKK+OX0/M?=
 =?us-ascii?Q?1Y2WSlmi3B0JLwPAkPMm6zLpHsbqvzrXQtMdeA0UWwW4SYrNOHCsVh+k+ND6?=
 =?us-ascii?Q?nKvylhIwSm70ptSUjv7Tm32XByIrHeJfToJDbw7QwxYLwsbNAj0WJDnH3Ab/?=
 =?us-ascii?Q?UsVN5oO7epQIklKCpWytYpjOOlpKGwrf/W5V+ABvmH4RTEBN4CnW9J6tOvdX?=
 =?us-ascii?Q?fIeqv68GSUzkdTF/q5y0BkL0Xc+St4DqwdF9Wn1PuFwHLaAwjJNOAGvWmSuC?=
 =?us-ascii?Q?7nzLN0N6sumy6wRCjF06qS3UjTFNpS44iuqwotGBYs2Zyhvk5Jo9veTLTMNq?=
 =?us-ascii?Q?jjzamn0YZ72R69A0E01SSU/yqAQDQ77+ViLOOOEZwCNQ1nWeHFLSUz+8S8AW?=
 =?us-ascii?Q?7GfNEokOW4oMQyE907uAWnyDoRtq33x8YSM5ptABLnQ6zthCU0dGSAay7Jie?=
 =?us-ascii?Q?dxSxEPsrUaTmZ+uGjUFsEsS0a2VrhwXySt3mUyog8np3KE5qXUxQzwYHYLpH?=
 =?us-ascii?Q?DRDpyqzCfBP+1N2gW/NFergLBVPqYFhkI4AWbmMnJaq4po6v6bpbT3qLtXuJ?=
 =?us-ascii?Q?GASgFslAqroOBp26oAZcnRHrf7HxATk6aM2y9kSEr3rtG3J6Tg/kg/Uesz2s?=
 =?us-ascii?Q?i0wCQbajKfdXUcMK0/9dGDL8yngu3qRdjDOqJwVj9ef4OCw+agHXiFLOdwFa?=
 =?us-ascii?Q?yBwCAonDuTICt+arvQVpV31tmGEJmYn0bk8qnDjof77vwtc+hS5ptnRcCP3d?=
 =?us-ascii?Q?zE5AbCLdrcuF4Q1Jjpzamv/TWS/M9hcCjFgvkx9zAHfpFM3AFwp85LNy4Fk6?=
 =?us-ascii?Q?rSWQ/c3qsMVBbN0Mctnk6rqHCVFxeeOZw6lf2Z6b3pTsv/QNJHItGeXyL7n/?=
 =?us-ascii?Q?vTxMCjroWb9jYiOg7amcObeeek2RmKtIkE9SGAyrhDOG1tlO3755TZgiJP6s?=
 =?us-ascii?Q?4jx/lbMzTeFm309O+8oD+TxYf7kwe6rYzX9xIj7ylxeXmVyJ3Izxt/HjbKVO?=
 =?us-ascii?Q?vh47y9YtHRj1MqXBwZkGn2eCfISdiFtT8LdS9CnqekPhBvP+xa0l3One2Xpx?=
 =?us-ascii?Q?SWcdDs5jbzoMRVgeuGHEdu2/d6ieMG+KRE2i7rXDY5eDbMFdU+vfHXr1DR4m?=
 =?us-ascii?Q?tVPbouZB4DWHZxQibao3/+ZYDGdeRh8RSH0gMneEM8CbwskRebTVyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lxaJa5crg+VH11fk019jZZ5TzIC1tZJPD6yTzr6aYPajTMBesavUZMfL0kWY?=
 =?us-ascii?Q?EvpLkC8phlXsMgLs54KRrnx94ooqDmBzHyv1BjZ4n7lUzLG81xHQKTBN/xqf?=
 =?us-ascii?Q?2w0tmrEFc0vrn8dTwxXMt+FSoNc6PCYXFWV6aqEUhk7I/Ccn/O4jaBwB9M8B?=
 =?us-ascii?Q?OQ/M841UCaHBw1/t67Zsgq6x7Da596/4AnI59NHHoPkCBfGjb4hXhHuDoTKw?=
 =?us-ascii?Q?foNPVPxbQa0IMfGG2v/AvmZ3+UusgAqQaE30f12a0rBKKX1hw199g2pDDJDq?=
 =?us-ascii?Q?Y2bAu1d+VRwwpPTKNH8ZPUweYu422JctitmyxUy2Z+C3u4d3UTafSxOEBr58?=
 =?us-ascii?Q?QJkG0ZjQ24C/a0D0qpzCOwLDhu24wNdvdiGoDNEv+R5ZqWROv81PYESxUVRz?=
 =?us-ascii?Q?pOI5jHdQ7mgbt1UjOElEWMQq2M5TRdC+E5dAIbuctQ27UUqcILSYYGErzjI6?=
 =?us-ascii?Q?f0Cv5sUP24XmqkQXptuOkvdc02DveDHyJihDjWENJzSMNQcA9KYOSwB9nMIx?=
 =?us-ascii?Q?aE/k88dMDX/pzwIbu7cHtEcktWQFQ3jVavllnuwPDGKRffBLcrQ9mafLfGBc?=
 =?us-ascii?Q?gHSpvdY6/Wtb7u7lxGdT9Atgp9OO/GVuOPs+UzaXSZnI2CaF36Eh2GsW640f?=
 =?us-ascii?Q?54DbtQ9g9UrzBYrhN1lyuVTeScrfaYKrWONaN3oFIbrPM3h8R7aUafqy0BQ7?=
 =?us-ascii?Q?fFCMgNdNX+vURrTCH3dxGuHPq0ztXWMhcAQ7UrzlNB/25zwRlLVBc1LlucnQ?=
 =?us-ascii?Q?Bmxre2idg0CMudCb0i8HO6LZlyZiQ/4jPYaNfS+9kkrGDB2kSoGDRlByIetQ?=
 =?us-ascii?Q?D2txgKMYqKgTJL5r3q5c0WbXTo+qWzmXt5x9xpflsyRFVSD9o4/bSu/xbqCb?=
 =?us-ascii?Q?KiY/RCMjRqRhhIa2BLMSyYPdkeUFg+BZARzleBt+SYGOdKbrQMmJ4oc8gioz?=
 =?us-ascii?Q?aj9AyoUFo2ZpJC236xRjlEomU3gvbeMJVf78HTPxfLRYDqpzl0YeZij738ks?=
 =?us-ascii?Q?4AhmFaKmMzaOlvbVDXJduvNn9mhpfiI/VLE4X0Okt22MPdnUebsvJg5HVYUa?=
 =?us-ascii?Q?EheZeWjrxh9E5krXLgBhu1b0b6vywj9YE4uw6Dv/63oR1uouxBS65euazVqx?=
 =?us-ascii?Q?KfrQc8nz14Co8XY3G+v32yf+TOE1KPSYvKCR65J4fVE+SgWcQv41ue1gpwRE?=
 =?us-ascii?Q?yX+QPQPUFd0ggLey7Eq2x0Fnw8kgJgOirW0pk7NluBioXzZzXLP/DY3x/Mww?=
 =?us-ascii?Q?5C3n+8nKCkqpHlRSkd9ssFxTudaq7R9WQgtVEz/09MXDfewhx/uLA+u32enH?=
 =?us-ascii?Q?eJbqOsrAJByCO5EzFGZz9mLZs9UVKcPdRu0dotPr5zQ7JYgC8egya5A78GE2?=
 =?us-ascii?Q?KXQhWW1y+Y5QUnLiNPA/b/Df/KGl3ezbI8BVMzX6uuNOaGUlNRenl9nA0y6o?=
 =?us-ascii?Q?6iJFyJR+HHvBOJGvwxhsi/HjMCNvolFnYy5xLShpvMajINe77YTLgTNXGy31?=
 =?us-ascii?Q?WaDkIJ352AZtVaQcEjVZu6yA9FBB+6hnJOCVq7Iw5xh9O+EvJdM/2CphS3qS?=
 =?us-ascii?Q?q4FeTdHfNZ7odlETtNX/eD7dzg5wIf2N/xw6V/bF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b186bb7-61d6-4682-282c-08ddb4e2a39c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:52:45.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5PnsMpL8xeGXnBALWfjcNf5RCmk3RMmEbu8yurY0xI2Axk53yBX2TtVpF5c4Cp0TUB8uKPrpR53S87YbxNOjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7126

On Wed, Jun 25, 2025 at 10:23:31AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add CM7 nodes, vdev related memory regions for remoteproc.
> Enable MU7.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 45 +++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 6886ea7666550605d6c2aa3d81ff270164e5796f..70f000b1c4032a449cbf9ceb746c16c9f3062a61 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -75,6 +75,37 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  			reusable;
>  		};
> +
> +		vdev0vring0: memory@88000000 {
> +			reg = <0 0x88000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: memory@88008000 {
> +			reg = <0 0x88008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: memory@88010000 {
> +			reg = <0 0x88010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: memory@88018000 {
> +			reg = <0 0x88018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: memory@88220000 {
> +			reg = <0 0x88220000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: memory@88020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};
>  	};
>
>  	reg_3p3v: regulator-3p3v {
> @@ -202,6 +233,20 @@ sound-wm8962 {
>  				"IN3R", "AMIC",
>  				"IN1R", "AMIC";
>  	};
> +
> +	remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mbox-names = "tx", "rx", "rxdb";
> +		mboxes = <&mu7 0 1>,
> +			 <&mu7 1 1>,
> +			 <&mu7 3 1>;
> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +	};
> +};
> +
> +&mu7 {
> +	status = "okay";
>  };

can you keep &mu7 as order, at least it should be after &enetc_port0

Frank
>
>  &enetc_port0 {
>
> --
> 2.37.1
>

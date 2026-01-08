Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E5B41E5C0;
	Thu,  8 Jan 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868103; cv=fail; b=mKC5bCrdhwz0mDos1gMJvXX0WoJ8KAJOqEGGvEjBIvG25Nwu/NhNxEoqwbF4VFJdlWOsJlHNbTgb2aXuiLmi49l0J1naaJ+oW3XQFTA6uKzrxULzhfwWro+NMGw3++Q4d9avryrj2uusFG7LaHWf7u4ki0gdmYmB3llhUjcXwtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868103; c=relaxed/simple;
	bh=BPOqElXP3nSybyuUALH++GQaBk+OJ3VeuDTTQrdmHrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r85lUA1NBK6dOuGgkYs7g0qAYJmajo+6W3ZLcQR9/mc0Gtwa8QXxLvELwKzPeEQRYsBeAEFKFt/J7dMSvfT+rZOnALjE9UBJbS5cv4ilGviBPv+Mv8GEFKhpdA02220ufqwe22s0hlDeHzjjZJevyH1H3nc8q7M9NZujZjTF1Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L+cahRrJ; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L+cahRrJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTj2HOKq1EKSdHnayOXYGe/bwbt/9YhULgHj+Z78EgAGm1uyZNPS100V1CdrdLnhqecRBpewjLRLO5yErbyIVIedSH5jT+MllG1ZK7O+ITEn/x/oRiNJrHK637mOHpxp8l58eT+onKYPaq6HBmLjau3Z+JC4aiFMD53pXpbxBtx/itd4fvDpnQZo0ZiNsErFN/kvpSnplpae/gnnXJdDPAp987y12poguQ/ifaSO4Nxgkx74RVHiOSPnOa00TRJA4oDj9x8vcSOyto6y9voI63pt1k8o03AgGsPbk6uODwBnjONh3bIPPpSKClK+rWEEu5t4nBzv9+3vjPDy/reVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Os/KBcqKoPx7couqn3OqVcK6He3fnr7cEJqFU1UgtS0=;
 b=hhk6wKGVcHAMf4QbfosYFH9WQxD3ESbGpVw8uWhfaad6yhgaHwxmQwoiHcsgVxqzzccVaO2/VweMUGplfXywmULgi+RWl1rVSTo4NPSDig9FEhxJc+xAgiJ91DL9uwDQVP7QG9TTMIh21u7F6+KYbsYX5XRpEtAxI8NROw25mvrqDMrGjUPdAwm/YJ0bRMrCV1ADns2l26nkEZbCk4wuOxlJOqh2wFpcFGE5pxottsgyk/OdLy1avC+Y7kVSr/hFSJJ+WQJf96WrwVofn1F/lM4UAK20F8rFWea50UCP2cAkURmV8KGceJAETdk1IUzBOy9KMnFv4eK6d0PsgzQ/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Os/KBcqKoPx7couqn3OqVcK6He3fnr7cEJqFU1UgtS0=;
 b=L+cahRrJMcH/mwrud9VztbXCrpdVoQeUGJGCVtn7+CjpzMiUWmM2jGIfL7JoiA+bs+l+W5fT8M1Suj1ACtraSOG3ckVGkL7xzq0cFAO/r/V5ivSImrTsv0N8fhxmD89cYA0bvzYF9osG6G6Qu1LxP7r64iY4MeyA2ZeCODBTdTl0a9i6S6LS5dBBOhU/TYQJ6hd6LVwZLooHBL4575Q4qvGj2WaKT68KO0fHDjgFMQEc9eX86CLZm0R2gRSdGPbog64m7KhKP749mu18wByCHKX7bmE6ovMYMrLhUO05kPfdubpd2i5NIg1kfv6bUTN223rrcsW1z8HWHDiDu2FQ0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AS1PR04MB9311.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 10:28:13 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 10:28:13 +0000
Date: Thu, 8 Jan 2026 18:29:36 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aV+HEAzwNSOCUx88@shlinux89>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
 <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
 <aV6ow9dGUNaPDqZg@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV6ow9dGUNaPDqZg@p14s>
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AS1PR04MB9311:EE_
X-MS-Office365-Filtering-Correlation-Id: 65129cdb-a4d8-422a-4175-08de4ea0a01c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mNXeoyhjoC2VdNB3t3pdgmTIlDtJ6+OjfoJhvVQm5xejuiRcoshG5V+iynsx?=
 =?us-ascii?Q?l/gs+woLsaGumPespaYOz/1tVAXZ1dNNs9A/1UUz/Cv2Ebqf1YXsNq+Q0BSS?=
 =?us-ascii?Q?NhYGGKklD0iF5DsJ8Rm9Gnc1S8oidHDs4Sfnc1TZnyp+NQNRz+Q0XL7ZoSvc?=
 =?us-ascii?Q?+vAvWxl/ZJSbOf4vi+8I2qbw4OpkhtMInW2kk3HcXvC6RWQZrRpWZl7gPPmp?=
 =?us-ascii?Q?Ls3N7AHlpqW7bsoWRxaEBWQvhCz/muwtDXSpSmk/pBzfP6a5siE16TTjbqN5?=
 =?us-ascii?Q?HYnTMIzjWcyUtLbu0dTKUuZgYcRgf2Vl8aj9TGU9oUNazAzGCLWDVk9JJIsg?=
 =?us-ascii?Q?dos075dyJAEehd/vQRzpNcl7Wa5L7IWT7KqLzG4RsGXMRuHX3KsnzEBCVE4F?=
 =?us-ascii?Q?SDsO8s/FkTwP8Ryq3VYIMOrFW3s9gZlIEg1xctzOLQUW7WrBvH/WCAEUPWMw?=
 =?us-ascii?Q?bNlBLt1qbf52fNqPVpMV9IeDu5FF5THtUoBbb1geVLs+0+p8hyHZvX8vuprg?=
 =?us-ascii?Q?Ru8GFpqKSif9fzKXHHngoUzjA+U1+BkmPRGGjr02h7gjJRgdlPKGgUZDQvF/?=
 =?us-ascii?Q?3/sVBONZhfLp7A6M/BIm7q5uB0T4kwtZ7qPR77/QcvfslGDFIH2qFqPr34jP?=
 =?us-ascii?Q?X9ZZTnDI5lvAtT/2tbFX6WUQ7aavM5SzldRv615xNks/gkGNgI2k4vA53qi/?=
 =?us-ascii?Q?OHWjeIthM8ywap/Jg0UEmbJpl5czGsbsskmi2mm4xZM6gTEezztGZYAxAJUZ?=
 =?us-ascii?Q?YbfQ0xNX6HEEvrbvEW3va1nJbc6Zjqyl50iBex43PE2e7EjIXT8v6JOhHNJy?=
 =?us-ascii?Q?tjxos+cJNPoW781/wtZLIZE2HsKx4Ve5fOqZ7glflJBuny8FPdS9EP5Z1svf?=
 =?us-ascii?Q?XnHiukq/NjE6yJxR/2+Hkp1F98lyqRMmFOOGCf/P1QPPXdzvkIUV8dO66m1O?=
 =?us-ascii?Q?UbZH7rJlw3FE52cFPyqU/FjvXY3cZKjN9BvFse753Nq9BdmYNemOq/XDO+6X?=
 =?us-ascii?Q?4FyuYfYWZhFh7CvJn8iR2DKRJgvr/kfqdi+FQ4rFq+/0wbwY8NmS2yicXlWp?=
 =?us-ascii?Q?oSGCG5O8tRqjAkb+3hcUDnwU+2rz1CPekqjB+ZLlwFdTR0r5Qbenmbk70of1?=
 =?us-ascii?Q?m6pExGQJNxaoAgwoLXNvbkQfgOecWFRoJWsYZImYFpKB6BLw/c0zx5UChBf5?=
 =?us-ascii?Q?ezEOOKnc6KCiJEtfcbajohtGFGydWciss5oKK4jlka22gsLUcbbHMH/ptCtn?=
 =?us-ascii?Q?vxDBPO5Kom98o2bdsQ0WKfHV8aHWUGFBSbZShmE0Ix147D6veYwg2tOsk2TQ?=
 =?us-ascii?Q?7x1cvOe+2w4owaWeEnRySjD/a4brnkRq/RP25AyhWQLPa5b0W0kCLbHW9oiN?=
 =?us-ascii?Q?BXXQzjB9L8LeaTrXp/aGJvVfPxFNMWeBYS/vZyYWXMfKdQbTUupoKRvdDgIk?=
 =?us-ascii?Q?lw4BlJAmnc1vXTzsJ4uNiPIS75ATj3Y/iAMdeT01Mcd+kpQPTvyYl3GpYMOi?=
 =?us-ascii?Q?H5XejDafHV2LnWOduLuQjJ1t6GNAuePvUWqc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S4vJZLC1Kp6wZ4JZUCJxibxPK9HjqOGojtTrrjLhmdm1IeRrtBgPnUdw9KH7?=
 =?us-ascii?Q?QXI8Dru+e/oV9jMvF64wXb5FeoILcBmrHJIo1fLUII9Q8KP/WpE41JMjC2AC?=
 =?us-ascii?Q?tByOhTWD93PmMmaQ8we3hjg91lbDIlUw1BYJlteVsCrhT5+RildrDxmYF9Vy?=
 =?us-ascii?Q?eGtgPJsZGgr80Jij5r3AKVcy5vp3oSXUE1Ovgzqb32IEwjgfyVb4e5rc/FtV?=
 =?us-ascii?Q?bT93/9uh3dEJCGuSXXrVnRvuENa1i6pFTvTiDw5tr9R+24wkrkzK20uAIiqY?=
 =?us-ascii?Q?5oKsWjJ9BFM0KMrBbDwY3LRs6zPtEFDLbiewTf3O/XK1DKh2ohUja23ujjjy?=
 =?us-ascii?Q?nrwdVmMQB5eAGcJesLI6AIEGjN5XeUsDzlmhBKjzoUdZSTuGCnTet9JoG29s?=
 =?us-ascii?Q?g9VR6yLJo6lLzP5FLrHfKdDiN0MSUWLILCARaN1hy/4W8iEMASNVmah4pVO6?=
 =?us-ascii?Q?WyI1X4s1+0dKFgwYhQgRlxKPddxwyumxtE3AfYsR7qUqNDQGs7vOjFizNCOl?=
 =?us-ascii?Q?XVthbmXQupwmB6C+RnFAvq+1M6X6gw3ZrBq88K8hQa7va/Lw4ae71OsBKm6H?=
 =?us-ascii?Q?O4RD66Dcw85FV+kLku/YYthLZki940U9Ec9D0GM06DajvYnOHZEHHfmyljo4?=
 =?us-ascii?Q?zSQP+4gxi1NShiKi+NMLprscrCq0JwU6zNwUUsj9pR8fGyCrmF8r/hUaMMI6?=
 =?us-ascii?Q?i0e6X3oADCfreJFnJSP9iGZcLZ9qlJaEoM/fYfAteNmSj8wR4zU0kWiuWp7c?=
 =?us-ascii?Q?1SdOOU/MsrdhUv7sp664Whj2dMusaAlfWjVE8ILfia1pbpVPIiW55Lit6k8X?=
 =?us-ascii?Q?/+N4HiJPjICZejR7x+aUZ8X9C5S3Bps9+zpfYR88LQDGBsW7TmTM1/8jfnqk?=
 =?us-ascii?Q?Dhcx+uYOfCuqZ8Kmdu0kLxQEChUdBQVKDhwmgot5+uN/kCXznrReZogOiVHA?=
 =?us-ascii?Q?1ESzcGn1qvJpRMec0oqNo+ctnaIL9nOdgugiByu5wl2VSojo+Lv15Gsny6TD?=
 =?us-ascii?Q?1Xb18xC/lxgx+Lm+1pnPBkzdtncxhg94TLPk7zkt5tU/qlN5QhDIplpd8qYu?=
 =?us-ascii?Q?5PqXn6H5ZXI6ZBG/0Z+LEq7XdOtXUZ44QWnWSje3sHo49jonJH+MXj2CNcST?=
 =?us-ascii?Q?5RpXRWLaEV/4Zdwave4oehXKTGRtKwfur4HvdA9vXUgVxDPE7BYlOP+Ozjpw?=
 =?us-ascii?Q?Iq5Zb03Kk8Jsa5Uqf6o2CNHVHrQekZtQLeQ2DTGZDIERyld/hvVHghXJzzPG?=
 =?us-ascii?Q?q3na89ROEwrw29Q1oyCMId7aaVSNJTssVpql3YwTvAy0fYODDfApDiHl9WsH?=
 =?us-ascii?Q?RRtigimRRkw8A9s6CTn9Xs9joWVdLVYN4B316R8m4DrHpgSn8WXERujdvXMo?=
 =?us-ascii?Q?l3ZONlO9r1SFLYu4R/S6dnuhxpHUohndaXZW3plLx5nF6jXEJUtZOApIhqso?=
 =?us-ascii?Q?9cxngtibVkQQ0OJVXtr+MAUtje5Q0eARUFRH2X4LM3EG25UwF432kKTyqGQW?=
 =?us-ascii?Q?r5JJ8NgasmdIY41Rf0q1h31vPjN6bqthn/s1OwfnuMaOOZspO8qlXlB4HaJL?=
 =?us-ascii?Q?7MhGJVYQXn+eK5Icc5m+Dv/s3JPqdRnLZh+dXtgfTG7SU1saN0STa9j/JqJL?=
 =?us-ascii?Q?8MmbrarUGYqLV88g4zrgJc4pOAqa76EvLqFAnF6a8dQ7k8dcJmqjA+yRpOFF?=
 =?us-ascii?Q?wMvS1lPTpz5Tjij6P7tIoKJfL4uGIGSp8Uhe0Cp5Wl+bBwk9ZWLVOVdd2Sod?=
 =?us-ascii?Q?MioGokoR7w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65129cdb-a4d8-422a-4175-08de4ea0a01c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:28:13.0640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9LzS9QSl2/0nfxB0E08nlLa2hHekyE6zdcev0J0lTCAVvCdHllmoGFQSzzwu66MYvUGCFlPb9z1U9kYsFMkJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9311

Hi Mathieu,

On Wed, Jan 07, 2026 at 11:41:07AM -0700, Mathieu Poirier wrote:
>On Thu, Dec 18, 2025 at 01:17:38PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
...
>> +/* Linux has permission to handle the Logical Machine of remote cores */
>> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
>> +
>
>This should be named IMX_RPROC_FLAGS_SM_LMM_CTRL.

Fix in V6.

>
>>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>>  static void imx_rproc_free_mbox(void *data);
>>  
...
>> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
>> +{
>> +	struct imx_rproc *priv = rproc->priv;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> +	struct device *dev = priv->dev;
>> +	int ret;
>> +
>
>A comment is needed here to say that if the remoteproc core can't start the M7,
>it will already be handled in imx_rproc_sm_lmm_prepare()

Add in V6:
        /*
         * If the remoteproc core can't start the LM, it will already be
         * handled in imx_rproc_sm_lmm_prepare().
         */

>
>> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
>> +			dcfg->lmid, dcfg->cpuid, ret);
>> +		return ret;
>> +	}
>> +
>>  
...
>> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>> +{
>> +	struct imx_rproc *priv = rproc->priv;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> +	int ret;
>> +
>
>>>>>>>>>>>>
>
>> +	/*
>> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
>> +	 * to start/stop rproc LM, then if rproc is not in detached state,
>> +	 * prepare should fail. If in detached state, this is in rproc_attach()
>> +	 * path.
>> +	 */
>> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
>> +		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
>
><<<<<<<<<<<
>
>        if (rproc->state == RPROC_DETACHED)
>                return 0;
>
>        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
>                return -EACCES;
>
><<<<<<<<<<<

Update in v6 with your code snippets.

>> +
>> +	/* Power on the Logical Machine to make sure TCM is available. */
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>> +	if (ret) {
>> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
>> +
>> +	return 0;
>> +}
>> +
>>  static int imx_rproc_prepare(struct rproc *rproc)
>>  {
>>  	struct imx_rproc *priv = rproc->priv;
>> @@ -980,6 +1078,93 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
>> +{
>> +	struct imx_rproc *priv = rproc->priv;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> +	struct device *dev = priv->dev;
>> +	int ret;
>> +
>> +	/*
>> +	 * Use power on to do permission check. If rproc is in different LM,
>> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>> +	 */
>
>Two things here:
>(1) This whole comment describes what this function does rather than what the
>code is doing in the next few lines.  As such it needs to be moved above the
>function declaration.
>(2) We know the M7 is in a different LM, otherwise "dcfg->lmid == info.lmid" in
>imx_rproc_sm_detect_mode() and we would not be here.  As such the comment is
>wrong.  The only thing this code is doing is check if the remoteproc core is
>responsible for the M7 lifecycle.

Update in v6:
/* Check whether remoteproc core is responsible for LM lifecycle */
static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)

>
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>> +	if (ret) {
...
>> +
>> +
>
>>>>>>>>>>>>
>
>> +	/* rproc was started before boot Linux and under control of Linux, directly return */
>> +	if (started) {
>> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>> +		return 0;
>> +	}
>> +
>> +	/* else shutdown the LM to save power */
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>> +	if (ret) {
>> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>
><<<<<<<<<<<
>
>        /* Shutdown remote processor if not started */
>        if (!started) {
>	        ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>	        if (ret) {
>		        dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
>		        return ret;
>	        }
>        }
>
>	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>
><<<<<<<<<<<

Thanks for your code snippets. Update in v6.

>
>This patchset would be a lot easier to digest if you had split the support for
>CPU and LMM protocols in diffent patches.

I appreciate your detailed review and the code snippets you provided. Please
let me know if you'd prefer that I split the support for LMM
and CPU into separate patches in v6, or keep them combined as they are.

Thanks,
Peng.

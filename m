Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F46B2F1FC6;
	Thu, 26 Jun 2025 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750905944; cv=fail; b=qM71MwNbIWLj91ATZcgaW9DV9X3I7WFMzcGAOYB8Bn+rbfUCRrXTvowwgNbZqz38CYr7FIXnwwAzUcFRnEh/9ZWsQepURVZpINxqx2/RjKkaPOW3sJvVGUG9Yikvq7wiqNr25ymzDh5m87F+09IICJsLX+1lXqZil+ygTbCXds8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750905944; c=relaxed/simple;
	bh=KuiMutl2r9pwZD1qKg9jQC5REIngG5dCTrELmSfz4vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mQOu58R/fKDvYwoDvNAfXNCGkFumnjiCUqtj5EGbzboKt9y1NTwMW8ZbqQ+ka68C2k2SDZi9UzVys/TNmPJZ1CE/+IR3lezgc7XF4BW3WeIEmFUpT7VwwdvIyLvqpnl1rGsFkQ2Qt4QAe7nLzIccneKPegbptdg0kMd7J8gWS58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PNSWITqN; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PNSWITqN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXfT45LyKpbMBFaZOFd4irMIAGxdQqoUE6M/f/wOciJt9TZkVOGct0OkA1paLkDQs6c9FTx6ecNB6BxWFtZaIvOMh1C2zlD/kS8uJVGEJQ17OtdRZebK8bmzI6735N2we/S/Ia3S7DCY9z0RQ1fYiM/wSclhcAFEbscVwNZmGyEg+T3oTpoMBiildABOWpm1SFX5ZDE6PFf+8EBK7tRbF/H1xEjOJ0mKZU2LcJVehGgHAXOrsU/2uahdhBhEjVN6FqXkdYbXHXI4lOZSp1DGtWddJfPLwEXlNQKzgHBpOocO2MLfSBaJPjyXpcPqpHZkwoR0SiApdZ6fMLLZk4G/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbB5fgaBsek15boj0o+i/wkeMCvviqd+Xe0k3uye8OE=;
 b=HX9ReuTQx4jQskJgpq6FEGOanzrwdKnoCG6ksQyliav/5P72mxeLzOEUIxlqq3z71nMu1Ft+mgYZ03WzWwjEhMW1NMoFdwSXh2DYiABFDoUcwdXp3CVotJPsOc0V1WfqqVleNd/Kg8nJL+174F+WIPNyjJfwk/ZIDnelcaIXzpNiNsCxGwTUvlFnwsBjpaRkAxExwBx8/8JMmxp5XrSD3jQq9iYDT7mu5YSrLN2vsbFG4myMU/DnrBbDZiEIjCO1aRWAYkTlRqqh7ZwUaqSpJcflYxth5OUR3jG4T0PvARTY8M/ookklkZADpBHEdQTpQ+SmM3DDH6fNUbhDVO8iKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbB5fgaBsek15boj0o+i/wkeMCvviqd+Xe0k3uye8OE=;
 b=PNSWITqNaq24FUm6lJguFO9Hd0vr7TKIYGSJ9L8L9YUXk30rwJ1ot5q0Z5hJWuj322/gPyRwthjI96syGBQxe4vrE/Mc++LPLJDbiaDatAqP7aeD8BeMTKHlkaKGXemKZyOzHdQ2hJDrV9Rh72ghd/mmBkBMkTm0kNItTSMUf4Squde1Re8LVV/1aVBOM7msZvClAWwQ4K1IJS34Kz+Bmqseu7LEn6bTaWHPNMSKt6LNyXp0SBsPHSyH7xJthkWPbgHvC9ZozC/IHSqUmTaU10QYnctkTdqNpaC3fdFnU3S2XdFRTqBkWQkG1ezfdCmEG387AkR9md/9anJPPeBR7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DU4PR04MB10529.eurprd04.prod.outlook.com (2603:10a6:10:55a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Thu, 26 Jun
 2025 02:45:37 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:45:37 +0000
Date: Thu, 26 Jun 2025 11:56:02 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 0/5] remoteproc: imx_rproc: Support i.MX95
Message-ID: <20250626035602.GA13855@nxa18884-linux>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <175088289381.2146689.9089577049350520635.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175088289381.2146689.9089577049350520635.robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DU4PR04MB10529:EE_
X-MS-Office365-Filtering-Correlation-Id: 4358ddc2-f5c5-42de-fb2d-08ddb45b87fa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Xyv9DIjR5fyXBqpbvsWHvVLTF6w7CR6kEbAT0kjsvg/rD/XlftW1QvWbSi3?=
 =?us-ascii?Q?DIKZJKz/LEDkm7lXEQaGdXGzXxF1eZffRwMq4eyLMpeCeHuxSH5txjzw5wen?=
 =?us-ascii?Q?9kMWXPK4yX4mqIpQbN8jL9rdyteQNaYV9hHP+Nfq6gBjSHYI+H8hfe2uTlEU?=
 =?us-ascii?Q?qD68j9TV4y+zK4Nt0DQEbsy+FOpjDXmypXNfTOEtqOYZu5vKtjWyBTak+sno?=
 =?us-ascii?Q?2E3UBrxJLhL7/yB532fjrohtoE8zS7xcOtkmlHg4uvbrbdi11qaCBY1G+iXe?=
 =?us-ascii?Q?aXfNOXdMqQeZnpz4ImxOO/02GcYOkAcaCkDKfNpgHKGm9963Jr2vqB6LKeCe?=
 =?us-ascii?Q?xOF036DHBJbAIQi9GHmWTSPeo/FHq79YowwFAVpPx1bC5pA+NhqvKOD9C9e9?=
 =?us-ascii?Q?JSce67kd8maVo1R7K3ev70dIrQfSgJN0MfxlKXwTejdXkL2THIVzovqDtiCU?=
 =?us-ascii?Q?4n0biSGk4NVqwS8nU5Mgy1/SrKUpFWkKIjhm9PD/tY6RjiDuu0CMvpu9PQ1b?=
 =?us-ascii?Q?GN6Hf5ffmRusqMVRO1u0BkahbVpn3JIwi4aCn3OthGF8Gs8ibcE8QoiC+qbW?=
 =?us-ascii?Q?256eoZF/AvpxFmNPijtm2B34S2/lvW4Qa44mTCiEjFS1LVRdpiQYPzuQ/TaR?=
 =?us-ascii?Q?9eE5B/v5O7RBL4uoBjphayCR0Rzn/UYlsieP/4lTPzn9kjCcu8N/cWbZlzbL?=
 =?us-ascii?Q?eJY0vaioJ0IrS6tFrFKae9x4xv5GJ4zycZEknytE/zqEfv7wMMAi+kJjrXCN?=
 =?us-ascii?Q?jzOJrl53L6YY8OEBTc2n5WzWErXsMavQwpNlp8n2KajgoxU983dGYBKXrfuV?=
 =?us-ascii?Q?Gl0FnG4Tf6XQzjpx4MLKixAZlSf2MlR0TWpRwOnI3hSzC2zzDBrQxeQTuiup?=
 =?us-ascii?Q?yKO6IjbZoEbyjx0d77qku8v8avUd3YCD6InTL2y8p6xHimvNR6tE/2pr8T4s?=
 =?us-ascii?Q?O2q6Y51i7nbEpLNlOuF+rqwVTS79ykolI4svIaoHcSYEe041aLe6sRbdJDh7?=
 =?us-ascii?Q?Rxr6Z8q7LImfPLHVnJ2X23XXQN0aM7kKJW5ItfqRfUZ/RW+SWngFAjjYZM33?=
 =?us-ascii?Q?b8ydJ8RLuNqfuKBcTvPnhiGdL1Ct+pCK0gudM3ZQNnl9EPAK0tmLjhb0zPPu?=
 =?us-ascii?Q?/nSKHzJrCnfOM5aY3UKYzlKmPijhbTs33JfyIsSzpxNmmCU2Q91De4yvEBKv?=
 =?us-ascii?Q?H4iExTuPHP5cx6WHgdleMSDkPQyeIwiFtWN3zzaXLSag1ka9GMDzmvGfRk/A?=
 =?us-ascii?Q?PZvdxAQZKYsYGPd185KD1n5RhYGwrXHDH5eqHHtch/iGrN9lTByQlWD73UfO?=
 =?us-ascii?Q?/Oty6KbB5H81oMjYo8adGCppOVQwRr4SWLyiB2KnfrefKKtGCYt1SW1EwV4Q?=
 =?us-ascii?Q?l3UL+zS+U5NU4Rqfruwm/Ut9H9+tJbOZCJ0CTdYLojNIqkHF+mvAIAuLMaEo?=
 =?us-ascii?Q?oEA0bumh2tIcciJH4r0+kfR3XwO4YvC2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OIDlhVGC35ZrgtBolahLKp8Rn5kH9Bx9J7e6DbNgAf4L5CpwvJ+0GAuozhOk?=
 =?us-ascii?Q?Ucc2MWNyTdpfLHo0TM+aFeSakB0vSd/cTqHAAfuH54W8HF+yQa0r37ZXE8RZ?=
 =?us-ascii?Q?LwTzjgYn+tgfb39L88msr3qC2BVdDBB8vXmeFuluTLL2upQD3u8qtJDt+b59?=
 =?us-ascii?Q?XrCHgHUuIrkkPJVdk8Hx9+ayBKRlve1qcFUx9TNUpFJC68DZ/NZg6kAYNpgH?=
 =?us-ascii?Q?D53cqCNkxiTNPxRU1VukH1Y/D+XPlrAa9l2pIUT/DJ2rYkGwO3QpDlUutDnP?=
 =?us-ascii?Q?brMiKYd4O9k6m7uJKVKqT8nBk7zPCOLDgC9Ziq6UWZF39n8YqUC1s/EYL10+?=
 =?us-ascii?Q?jF4OSAZQ1eP2YCTA42RqLMdzmIPrdI8rwax4EGkAZi9n9XPJz1MIy0gu89bJ?=
 =?us-ascii?Q?34RlOsTr+RzvHfm5ipVRM2cNDIbWQXIIuNAhcNL7nYLX3huNm+k1+GwVaKtL?=
 =?us-ascii?Q?ENFPBNFMemE3wH7E5aTah0C1KCe9pmoCrKWCto4jcibKpf11/fw4o6MmUTDh?=
 =?us-ascii?Q?hI4kEFnAll48pv+E56lV3qQcXeCT72oXJ8AK/H4ucYoxLl1XHGzKXRp3n+vr?=
 =?us-ascii?Q?LBF6QAxGWUpSpe0iUprVhRbgXiHU/uvcMn0Bg7FNSneRG0kVcKtJyEs7y6mO?=
 =?us-ascii?Q?TY0ori+cjwE6E03sPCfPjve8l/OnKJr8UIMPzMB+yFUs72N10/mgFDQbdh4u?=
 =?us-ascii?Q?zLA3WangtDg2QBhhPh4s0gaEzHWmDHVatACO7ztiGL/I/bF2l+mO/6K1xMPy?=
 =?us-ascii?Q?DEo1beiB2xUVbIAXeQW54Txmf4Y4vBOhGhqgXxOcSfm/XMmIxzvhUdYo8Xob?=
 =?us-ascii?Q?qWNy7zb3pjyahBG5qrcYeSqgXYvJ4heKJEP5FWkyGUX+6hkoqnuwa3i3JAv6?=
 =?us-ascii?Q?qWv8/tfOW81k+IEnir2juywVqHNgDPsSJDmK3SwZu71tscAEH8bJg1N6BnHx?=
 =?us-ascii?Q?ekOmkQ2QUeZ4lerBJBawpHOynDfwAM4X7h71PV/J6lMb1wvmrymZZA2ltHeR?=
 =?us-ascii?Q?xjOJPIBpGgWktAZc2abDu3bdBmaDIe9Rrjerq87zYYbLkpBTFqOLWoSu+F7s?=
 =?us-ascii?Q?Edyn74UME3OXXzm2/P6hBMrw27Hef5vf8ArlaEcyRkMEBSuUWXB7PNROQWF2?=
 =?us-ascii?Q?TGoJJgmuPIXI/LUlQuGGNKB7HLbyTdfuZsJkA4tEKB58jnDDkMCfbcvV0IJb?=
 =?us-ascii?Q?teFzj95UtGCIPbeGHJv4b82SfJQZnhgRPgZYroYTa/qRxiPlhwIGwp2onchT?=
 =?us-ascii?Q?OIkfNVmBiGN01FwV9zxlKflEcWBKbwErFV6XIaKUDIhG7kCAwqMMrYr8nGZv?=
 =?us-ascii?Q?6zpFyrppMv99q4YJwp9oZBNpsTVCvQBUBhx7z0/hqvDmY5d2ScH41dwKokiT?=
 =?us-ascii?Q?dWRQvb+lN5vU0a2Ql5XRJ7qmzoCMJcCt2RsDet1ieBpf38u9O1/Z7I/fqFRl?=
 =?us-ascii?Q?2teJZu6LO67j/gU7Z0TAykBTmP+BBXgvcqh2aTGJE4HjqVQGI7L9Bez/cvGn?=
 =?us-ascii?Q?4OVAYbfOKooccMbj982qG1xi9oxP94eohBYkafmBnchqEDAff/Oc9PDSldS9?=
 =?us-ascii?Q?+/MCN79lqeraUpx/qTntZ6fciB2OoJ7/BeigRgiD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4358ddc2-f5c5-42de-fb2d-08ddb45b87fa
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:45:37.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnYHbPCIJ1qMlhTu5LVFIiSosMcqdZ5aAnU3qFi72jIxIID6T8vYLX1SzkFMHbE/qYWrdm5svyRA/q9D6lEiyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10529

Hi Rob,

On Wed, Jun 25, 2025 at 03:25:18PM -0500, Rob Herring (Arm) wrote:
>
>On Wed, 25 Jun 2025 10:23:26 +0800, Peng Fan (OSS) wrote:
>> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
>> one Cortex-M7 core. The System Control Management Interface(SCMI)
>> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
>> Manager(SM) includes vendor extension protocols, Logical Machine
>> Management(LMM) protocol and CPU protocol and etc.
>> 
>> There are three cases for M7:
>> (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
>> (2) M7 in a separate Logical Machine that Linux could control it using
>>     LMM protocol
>> (3) M7 runs in same Logical Machine as A55, so Linux could control it
>>     using CPU protocol
>> 
>> In patch 2, Use LMM and CPU protocol to manage M7. More info could be
>> found in the patch commit log
>> 
>> Current setup relies on pre-Linux software(U-Boot) to do
>> M7 TCM ECC initialization. In future, we could add the support in Linux
>> to decouple U-Boot and Linux.
>> 
>> Patchset was tested with below boot images when the patchset based on next-20250526:
>> imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
>> imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
>> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
>> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
>> 
>> Patchset was tested again with rebase on next-20250623
>> 
>> Patchset is re-based on next-20250603.
>> 
>> Thanks for Daniel/Frank helping review the patchset before posting out to list.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>> Changes in v3:
>> - Drop fsl,lmm-id and fsl,cpu-id for binding in patch 1
>> - Add lmid and cpuid in driver patch 2.
>> - Add i.MX95 lmid and cpuid in patch 3
>> - Rebased to linux-next-6-23 and tested with this new rebased version
>> - Add dtsi/dts patch 4,5 to give people a view on how it is used per Krzysztof
>> - Daniel's R-b are still kept after talk with Daniel
>> - Link to v2: https://lore.kernel.org/r/20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com
>> 
>> Changes in v2:
>> - Typo fix in patch 2 commit message
>> - Move the m7 address mapping array from patch 2 to patch 3
>> - Add R-b from Daniel to patch 3
>> - Link to v1: https://lore.kernel.org/r/20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com
>> 
>> ---
>> Peng Fan (5):
>>       dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>>       remoteproc: imx_rproc: Add support for System Manager API
>>       remoteproc: imx_rproc: Add support for i.MX95
>>       arm64: dts: imx95: Add SCMI LMM/CPU nodes
>>       arm64: dts: imx95-19x19-evk: Add CM7 nodes and vdev related memory regions
>> 
>>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
>>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  45 +++++++
>>  arch/arm64/boot/dts/freescale/imx95.dtsi           |   8 ++
>>  drivers/remoteproc/imx_rproc.c                     | 138 ++++++++++++++++++++-
>>  drivers/remoteproc/imx_rproc.h                     |   5 +
>>  5 files changed, 195 insertions(+), 2 deletions(-)
>> ---
>> base-commit: fda740558acb4303fcf377e5cf9139f795b1d85b
>> change-id: 20250525-imx95-rproc-1-20bb74ddc8af
>> 
>> Best regards,
>> --
>> Peng Fan <peng.fan@nxp.com>
>> 
>> 
>> 
>
>
>My bot found new DTB warnings on the .dts files added or changed in this
>series.
>
>Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>are fixed by another series. Ultimately, it is up to the platform
>maintainer whether these warnings are acceptable or not. No need to reply
>unless the platform maintainer has comments.
>
>If you already ran DT checks and didn't see these error(s), then
>make sure dt-schema is up to date:
>
>  pip3 install dtschema --upgrade
>
>
>This patch series was applied (using b4) to base:
> Base: base-commit fda740558acb4303fcf377e5cf9139f795b1d85b not known, ignoring
> Base: attempting to guess base-commit...
> Base: tags/next-20250625 (exact match)
>
>If this is not the correct base, please add 'base-commit' tag
>(or use b4 which does this automatically)
>
>New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com:
>
>arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were unexpected)
>	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#

This is because [1] is still not picked, not because of my patchset.

[1]https://lore.kernel.org/imx/20250513-whimsical-almond-quoll-e3ad5b@sudeepholla/

Thanks,
Peng

>
>
>
>
>

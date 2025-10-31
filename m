Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CC12F7466;
	Fri, 31 Oct 2025 19:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761938902; cv=fail; b=N+/8l8JZfe1NOET3LYC8G/5tb8Sf+N6XUsqJEXECNBncddkt6lqMe87+aXHZRYMXWoRhFyXwMoto38q27iiIugTufs3yVw89iw0ESnyva9HHEoYekW6Cn5kOQbb+dlVV7jhpy2WxoJuqIm2M6st53b3vnzrZm9OGHzWdsPohOaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761938902; c=relaxed/simple;
	bh=W/mqFm9I+2OUQzc9/bPjNwG5TTm0Ua+12WZaOfCxqo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=neOTSCJCUI9PwAyjqjluNqS01YdZmiaBeM2cFQzW9DUmY88d7VLmiQFfd8On3VqmfFmGY94lUwPRf0upQsPprpEz5coqAbnVDj5F8fy+V3b73+TbiPL1jqvpyAE8sPvN6ry5UoAvMXCMrtwdq80UaWDENP5Sh2TDt8bI0VQM6Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fnavbkeR; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fnavbkeR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyGBZvMzMew4IhkkG9yKSfxH/vCRhY4NmQ2hstmufkK0iUcRBNknVHHiGh4LWpuiJeTmUKJUj1dGvjKBIDhum0TqhOAM2xLp+OAfGaVFrtvvRCJ9/3xmUABYps/tBLBQVwJQhCp7elQdTIHblyUPUarP/936ThTJIdGFUP6YuNXzfml+F/Ump41Bujwkza17V8sZy4N8XKglpWsZb4/E73S0o+/7GBoydZFD6reY6jIybJQ2JVP6mjU+9I7dHEEj3LtbvKp3NCxkuYvCC2BDsDkQ0o99gJWv2SGKyAWmGe+j7+faBufmZ+jkJq0UAcsNNwlUS+cIWTKCVGoCUKQfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXcmgFgJLbkHMSBVSOuJG4lorwpxSl5Hs0TTaSCW/1Y=;
 b=dgVbIA5ZOS08lcTahR5xKRt0REUy+fR+TlhH1DAUETFqg/pEw9IM6DhUY+ndXO4Ufdz6vASCL3abhjqTBIlgVvfpUZUzs753z47nsuPbVUFoEPvpWIIIxoCHL+32A/Q7kR3U+/oPq3h+4vS38ZXLoM8J5rXOYuPpDEwquJNBQVhrLVYpBA/0j09Duv5wfmU8JZa6RZnBBv0hdEpZ/PtCL59otxlnoto3VRxHDXS5GbkRO1VvgEABEc8wVCj9AUrvdPzTdiodvvKNmA+PrEstQ8Gw+F82HViDNf/OgxPT+p931X4oulVz8inNn1udDAjHjVLti0N9zKiHSWXQqG30TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXcmgFgJLbkHMSBVSOuJG4lorwpxSl5Hs0TTaSCW/1Y=;
 b=fnavbkeRWF+yu0Vu50dFZM1FPXTE0UUIx0MVGzz0fvl9Avs2RM01fJzDYMTxceL1sNhd2kFtTCSFKepe4ZT5ctRfGHYT0lOUjM6BdhBhFFHQrjBklRM9NDKmw3cHO/M0OuUGzyIl5xgF3STvUM3INI7FxDkqVOSpBSjtYzwvvIoiyUqqBi9CSweLyMdHiC0P2zv6eW72sV6p81fDmeL9wRm/srP5Th1ANfyjcwgnJi66ibn+cl6VCdtHlUdOZBiHMeN9SyHBFo5w93XkPlGKZcWVvSqFIa1oS+rv1Udmi0FT0hdM0GNhu45qvzyDMMERu705GNXNJ0VNVydlxO1hlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBBPR04MB7596.eurprd04.prod.outlook.com (2603:10a6:10:201::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Fri, 31 Oct
 2025 19:28:16 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:28:16 +0000
Date: Fri, 31 Oct 2025 15:28:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aQUNx0SWWO7HjyL5@lizhi-Precision-Tower-5810>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
 <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBBPR04MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: b043b740-a870-4c88-315b-08de18b3a401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lQaHOvQUVawlu7fJ5yDDQhOrn1uwzKNH/adz8G1fhqB01d6Yqcps+UlI+f6B?=
 =?us-ascii?Q?JABoYYoImASEdrhb9Jjb4+V5tTDiqTXAKxtwoxsqPcDaTS3It98r+pQ3a2cP?=
 =?us-ascii?Q?G3uUuHUxTTwEWLfN1dADXA/fuYvh1ERczwlU/l0xq/VfKNp5VubAmIcim6RV?=
 =?us-ascii?Q?oxDqahlRJPMkBsfIweLQDC0lxv9IDPA48Qi7pzLfNU94hnw0jllSB2lPeIK/?=
 =?us-ascii?Q?VBKhNYTPDol0qtUgn6teVV+bFGJ5Fc8jgomAae6d7FgutAG3bYtOHDlLq+/2?=
 =?us-ascii?Q?lC5ygNT0WTOrZMCdd5iLfELjvrvDX8MAtJei2w88zUQmTHvCiMZdZxRKmHeo?=
 =?us-ascii?Q?5pqjXoF7WHxU6YFwdtHiEZsSV4VYqkh9Ou9i0OTS4ehq1eIaLrs4zyQleTR5?=
 =?us-ascii?Q?ss3lB5a7f9/rugiAJ+1TLYpNLH4p2l7re4Qbf6vlI7Mnxh1wCHoo1Hi329i3?=
 =?us-ascii?Q?CqsunmoeBCvobOSZ4PbH/Bfttf35/lv1A12ZsK9Ux2CXQRLMFrx3yG8q+IcQ?=
 =?us-ascii?Q?VISd/zitoqj8PJ8PrJkptvYrdP80Tw8GwHE/fMms6vURwcc6/BenJcYf98bZ?=
 =?us-ascii?Q?EUW9AzirvqMY5JRcdRDBwE0H0VDS02eKrwArCV+9j92xl4roI0rP+KW0yonx?=
 =?us-ascii?Q?boXYcSqyIcivvWF1LUYsol1UjuSdwliLcZko2OLWeHGYQO1eu0KP2RB1kUqK?=
 =?us-ascii?Q?nG7JSOkdPuw+dsoDSdKtT/iAuY/bvlSPhnRNeM3FXHOec/2J36H9xi9gMReQ?=
 =?us-ascii?Q?EyRniXUeKW5attLNqVebHVuM3F0y4JlGZyZpy/gc1HmqtrSJAbYgNm/IDc5v?=
 =?us-ascii?Q?+NEV7ZiJFAgXm9ZWruX18W4sbJ6wZ9ScFex6kKF3QaPSBCwkz4tWP9SSt/Rx?=
 =?us-ascii?Q?gCgmpwpnxLHFUP1ibQT/iZU8+947CwBnQdYWwi9HZWiC5q9FOaIx1r9cXu/W?=
 =?us-ascii?Q?28kg4Rv9hpu9t9MBQtK+pzsO+bEZH3rfNKTC343lRISajtyvTbFPbfSfkh2R?=
 =?us-ascii?Q?Yly/1jFnzuukOS3TPqNnLdIzeNQlbakHP3ZhAPHs59wH30xyk04uyzNIx5Cv?=
 =?us-ascii?Q?XZHoBT0jk1vR8qCdrpulptKoRHsLXqMmzqU2o5REV6h7Jk+zFTJ13DW0zaoh?=
 =?us-ascii?Q?bAb1rpBQBmKVtpiAgAHWclCrbsYLTGivZP4wYPvmGAc7g2kEvjOP5cEVKspK?=
 =?us-ascii?Q?Aof1+aeNGjrDO7+lNUBu8tN7HCPmz2y/mdHdEpYXHXZUw+VzfUGVNysSC52m?=
 =?us-ascii?Q?2oTAE10OtKjnbfNk2885Zxk7pwTZF9sc4/nhLPfPSKM2/zua+0JMffPb7aYo?=
 =?us-ascii?Q?eZ7yR+aZVP7gWpJGoReymJseulDjRHjlstj7Vp0E8V3knPgDNB1TA7O8IfZg?=
 =?us-ascii?Q?gVUytTPkDxbpbIEeg1w0yCisrP6UulhjuxReCOm4jZRFV1vUNsMzPA8IBHoM?=
 =?us-ascii?Q?voC11uijSfSJT1H/+JEIJiklYBOsLjMZTazgQuo5qZpqGGGyz/ilzaUVtMRc?=
 =?us-ascii?Q?Ll6K/hlVagw0T+8ghWqdBW2WxOIbZTxzR3YN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VehuLYgaq5AmEKdB7uGX/0pCeFuWAj67DeUxddLtHEt90n4WKY5u0qUWfodY?=
 =?us-ascii?Q?KSDwInr1g9olr+BELeTHd+0Xe4T0QlJiDmvHQ5kj752w8qv2CtpduhYZK3D6?=
 =?us-ascii?Q?XrEpK0/4SqjFvxU1cisvz8se5M2Bf5S0HzAnBVhNQXmYoDbmPpYSLU5e2OLm?=
 =?us-ascii?Q?0H4EfrxSssYtXsG8psDQThIxvFkcdvzvB5ia/aAGK78evLv8omckkmenU7Ks?=
 =?us-ascii?Q?4f6xHOGEjewO2X0BwK4r2JzO+4ikXvhkNaFYAImjNh3SS+Thzszi+UGMtXQ3?=
 =?us-ascii?Q?eYUV2v8tToEJnuCQJaghrO4AddacrG1cQNTAR09eEtF2MlOAj20Gs3YZh6qh?=
 =?us-ascii?Q?/oGkNfm5PW0pTr8MeokjiS70MeRhuFXmMA09ijirzd7mqy0VYnp1uID7IzFi?=
 =?us-ascii?Q?/nF6ZUi3eg6RMu1BBIahzuUerc7ReRk86a1aMyVSBVbhMTWj0ypZNB1+M1PO?=
 =?us-ascii?Q?g/uUOmSFt56BL4RmWrIO1Vk7X50nv7Di5o+MLbTyPv8xFzN8L1tPUreENarG?=
 =?us-ascii?Q?0OVuFc7dwzj36kAZiybozreNNVtJQv6SMtg95jh0C3u7/RZLtTa/waOpohuc?=
 =?us-ascii?Q?uSGE8Fo2ZPYvll4R+Y4AQLM0+O96O3Za1yboUTMugZ2qHzzb2NHd46/DY23l?=
 =?us-ascii?Q?zlA1QjABiJ5dyXyqpPZVwNfHFrYjl6HwOjIlL0zP+D0daUU1lGzXd4sw8SJS?=
 =?us-ascii?Q?ogwZTWjl0iIiWp9Lh/DVhuANld5+U0WseFhFxn+EGvXZ0J/RI7tD7/HFcZPB?=
 =?us-ascii?Q?AUeTSX3eN3lAhdHCVmfQbTCxg0NdPgM8Y/ZKYFkEhhvwQG8RoAaBCM4GEGPg?=
 =?us-ascii?Q?9MzZnsyJHx+sXF1y5SzUHM4rBeyPN2PvTcANU4YFwJWdecWfrLoRCEjN1y7e?=
 =?us-ascii?Q?hfn7cYT/+7NU4eiwxcJ9HTdKrfO5ykT7xViH67JiKHSlzP44KTDwHfNigZDH?=
 =?us-ascii?Q?1k1V6wLgBdPmVoRP3GUmxKg41J9ZuocA/zAYjGq9Ir4SC+I1YB0ayR84yXjB?=
 =?us-ascii?Q?ux3Ke25TcPEaZS+cSSR3vLn9Zti08/+3MF1x7X6u0a7dIaEo6LAMMoW/7P2n?=
 =?us-ascii?Q?WorbZAmJp6UCqcJLirvyXq1COUmp+VJjX+4B+d7BZsFm5b8M4vVn4JqN3QK+?=
 =?us-ascii?Q?LLW5xlRdeJUoQ65TheAdQwsKPSu/zAjL/HFj/yxbgFx0s3QWpzT8GdEmpRK5?=
 =?us-ascii?Q?ogbB5OB8uiZJ/aG03p8X/55HrI2cD7EaMy0DygndCIWnFh3bmqZxP925OrL9?=
 =?us-ascii?Q?Uz5+FLcCL6yv7SVtbptl9/u7egr7Garrl2yC4WctDb4cbaM1sd9q3O2cjxiD?=
 =?us-ascii?Q?x//16xOIqPJAXR75KJIXmG4gxW5FcV+MT0/vwFRv84go6/Qfb8myUQpxHDeW?=
 =?us-ascii?Q?a20afzRuRVTFJwkFJydm8nJeDEXsb18LjvZX1xbfV9OPVnz87oku5ccAh2w9?=
 =?us-ascii?Q?lUq0Lyj+Ycnqet3O0rV1uYSwtAUNGRPSnPdnSZhF4UK4A2heAe0b5wsBuuvJ?=
 =?us-ascii?Q?KYne3+FRSRmEn9UbXd8hr/FOa7ljU22kx5VWvF7WQg0RaFvgXcru4HQ+/wQ/?=
 =?us-ascii?Q?0QGqEfrwdA3EvxiO0xGmq2yC1OYk8WtaxBnNyQfF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b043b740-a870-4c88-315b-08de18b3a401
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:28:16.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuAKbIIESk1KcttEQEGVJkXx9BBrb+tAWMqvRT6xacn8LXG0OlYvO3LLFWPr0CcwWycf5BKRQMD9SN0WysQ2Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7596

On Fri, Oct 31, 2025 at 10:24:55AM +0800, Peng Fan wrote:
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol
>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
>
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 192 +++++++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.h |   3 +
>  3 files changed, 197 insertions(+)
>
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
>  	depends on HAVE_ARM_SMCCC
> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>  	select MAILBOX
>  	help
>  	  Say y here to support iMX's remote processors via the remote
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 232eb91e0b5dc2432131b1c140d6688b073fea1d..1fb17701964ca4ee4b73d343b5ec1be8e2ee5fda 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
...
> +
> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	/*
> +	 * Use power on to do permission check. If rproc is in different LM,
> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +	 */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret != 0) {

	if (!ret)

> +		if (ret == -EACCES) {
> +			/* Not under Linux Control, so only do IPC between rproc and Linux */
> +			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			return 0;
> +		}
> +
> +		dev_info(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);

dev_err()? because it is "... failed"

> +		return ret;
> +	}
> +
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +
> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> +	if (started)
> +		return 0;
> +
> +	/* else shutdown the LM to save power */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +	if (ret) {
> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
> +	bool started = false;
> +	bool is_cpu_ops;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
> +	if (ret) {
> +		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	if (started)
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	/* Get current Linux Logical Machine ID */
> +	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +	if (ret) {
> +		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check whether remote processor is in same Logical Machine as Linux.
> +	 * If yes, use CPU protocol API to manage remote processor.
> +	 * If no, use Logical Machine API to manage remote processor.
> +	 */
> +	is_cpu_ops = dcfg->lmid == info.lmid;
> +
> +	if (is_cpu_ops) {
> +		priv->ops = &imx_rproc_ops_sm_cpu;
> +		dev_info(dev, "Using CPU Protocol OPS\n");
> +		return 0;
> +	}

does need else branch to set  priv->ops?

Frank
> +
> +	dev_info(dev, "Using LMM Protocol OPS\n");
> +
> +	return imx_rproc_sm_lmm_check(rproc, started);
> +}
> +
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
>  	/*
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index e4b9ede656506142b260aa7515823f489a168ba4..c05bfc4528f3b7518d4f2272d15fdeab1a68c2a3 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -52,6 +52,9 @@ struct imx_rproc_dcfg {
>  	enum imx_rproc_method		method;
>  	u32				flags;
>  	const struct imx_rproc_plat_ops	*ops;
> +	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
> +	u32				cpuid;
> +	u32				lmid;
>  };
>
>  #endif /* _IMX_RPROC_H */
>
> --
> 2.37.1
>

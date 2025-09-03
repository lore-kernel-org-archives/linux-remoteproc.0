Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013060.outbound.protection.outlook.com [52.101.83.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94282D595D;
	Wed,  3 Sep 2025 05:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756877287; cv=fail; b=cZAUaKbBn710RfuSc4+c6smxRu8RFkSghv/2/PMmeZooF7y78zbmmP43JsEu1idRQcfmGCqTKQROQ/jM1JZHi1Sq0zEnFs2fLj/qWeIdXs+DPvnRnovnkKLtPg0ij0jlvg97RT8sNDLNipAvv1bFu1I+YzQmvxTO+jyg6JIpujs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756877287; c=relaxed/simple;
	bh=owd+zK37U2qkLVkgV0CaZPhPZPuHVpltYNFPVPnfHNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OpvwkcQz5GgXkMUGpG7mccYkLdYVIEAAZQayvtNdUJjwpdqvtt315TF2/nbGDeSUUNh6qer+hGpt1KqhiqgV8P0dkVQNY8EK7RRX5KV0CzlAcxGJNu9EmNIzJ6Ypb3AXL7Pvpmre3dUkrxotOobXoda6jK16sv8p8SUNLqkpPhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iNwfqG52; arc=fail smtp.client-ip=52.101.83.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iNwfqG52"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ+Z63ZuRwrJD1h0wfyyNs+dpLfrQzuXJtrM3DXJ0Bv/PnVudl1CrC59w3g5h5ZH2NXc8jJTwSxcNycV/YCpTsIDaCoh70dY+gIixWMbjhycYQ/g8btw+UpXn4wsc2tzNIh84LA7+O9R/nFsCg8t08IieGEYoogFUdcwu+bdP0aGyQpXGmWHNmjZ7gMmg1vnvaOVZMJLws9nP3F3grd12YQlV4PmZenkJbBAZZKfe+VjcO4SHDA8Py8lxlUJBUfyziQIJtt2jSJ2GDdzQcQN0PTbNwyy6F760ApKLpDJav2ogjuOzKAMhTnBqMzvrfuv73+33yUzBfeJ1qw//tN23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFSEr7RKSs0uPOiErPyEj0x0GwAcIUs9afIV/brs1a8=;
 b=jICQnvQYdjYPyOKQKYk5/OPtUzLzZTY+xG+NYh21CmRuVI/P73cPAhPtylVnj2WM98nrX1Fv85QwHyfnEcUyQuBWa0lamv0HWS5eEEdFxt1IRGNo170cJTp/F49LDMyzVyrwsIRS8mZxSyL/VOlVRrwhj2oaZv0y1Toeo0abw6HdQR8A3OTaSssV8cZZhLZfxmnTFASIhsz0EV0o9jJKrPRz39rnQCGOZhsmrD6nFLXpmFHMexAEX8EFQ71derol5yODlcEMpFXeA7kMI+ZKzgvfcDS0p7aprlX1peZ8z8mqanQbj4Vw2nZLHvcuGLrRrJtUAzQo8+ptYV4SBAPuVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFSEr7RKSs0uPOiErPyEj0x0GwAcIUs9afIV/brs1a8=;
 b=iNwfqG52vGHtpyqDLXCYK+sy4Eg1s4cUUv+/70f+MRRT7UYhGXyurhJ0ghQqWaK0b5fxdfMHV2UbX7wKu3iEpU2OuJYtxp7dRL7gEnCN1rpZwiDRNRTXbK6BvzEk/j8+ZhT6cxvEsi2TxjiXU0n0sDPxj1WNGlimVMhvSvJTwwMC0nGGtYMAe/fRarSK5Tp35v/wR2xHVsNzt0IfepW1zsGzfm4TSF4lFzKKGC5fb++vKGNR7XpCYYSwkZeqpkyHdxuF+a3/GJ/peqq6R4i06DL18MEQFhbkZPqPlQ9/omLSUxOUpg5bewe3TyyXhFT5htbXyPGaoDDcyxjkluBA6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8275.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Wed, 3 Sep
 2025 05:28:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 05:28:00 +0000
Date: Wed, 3 Sep 2025 14:39:15 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>
 <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net>
 <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903045611.GA8860@nxa18884-linux.ap.freescale.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: cc6b7704-8079-47c2-f99b-08ddeaaaa534
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pdc0JqUC25O7pFKF2OzoOdVE38xNLek422CMzaztt0QHCHsCbAgi09KEuau3?=
 =?us-ascii?Q?+o0zX17fEOggs+Ax//rYllS6V0DpDkCkXEj5KSo26WlBaCiovdnp+NTLIFmF?=
 =?us-ascii?Q?BUxEHkrZRfqXtcyGpCasovXzC9CVttin9NPAZ2eniQajGQdBJ6sSPl2CMYnL?=
 =?us-ascii?Q?Uc2F4kwX00SuRT2DBaExqOGXyhjsru+fU96+P2WRf2LZulyJ8drBXChKbqAh?=
 =?us-ascii?Q?7Vu8WbsU4o+k1Jl5HsH94o5NA1iZkNC2N9cj5cSuNYFkm8VjqNwDyeQo6prR?=
 =?us-ascii?Q?Ja5UK7wCHtP+/KY1Ga4oIdQ6xRXENkhtFNm13bfY8Z2v+pf6txU6U3BcvzS0?=
 =?us-ascii?Q?LqNM6lqNEGs/L9FwUOZPaZrJXvG2oXjk9s4Yupf4RGL6uZx5MwCaQ1eMVsoq?=
 =?us-ascii?Q?uWjcBzVCwfgMM1dVzF/lsNQPM9uiWFXNfmxKlrjY9t1XIHfVqlWRpkaIbiYR?=
 =?us-ascii?Q?NgBiaCkXaNdewkG35pH9CO7DZ8m2E3LhPuSinBzgbornds7huiOaxf5GiupJ?=
 =?us-ascii?Q?xItruPHPmH0RGU741kyd68fLxM7qWij+hIZ8movmt+KELzbmbCp/yhIDPhQD?=
 =?us-ascii?Q?XYBM05yoaYRCVmbCssEpbQkGI5rlbBJW+ukGCJd0JNUarHmVmhd3T9T33g5E?=
 =?us-ascii?Q?4Oimng8k/8ay7q8AnRaAl5Ra3ug5cVJO7QQ9pQwseIhHvEtAnPUlMRSytCTr?=
 =?us-ascii?Q?860VqnRImX8G8VOE4FlaqSw793nI7GINNuLijF8OwoOCcz1VMLljfS2JB0kI?=
 =?us-ascii?Q?BNBegPZ/cUH0UtYyPzaDPag54P2oqQNwZfpyKfDHBs6pYFagKGngCfttzY8l?=
 =?us-ascii?Q?wZFb0CQZTuxQ2oma+0CVp5hpK92QHR1d0zdb2fjdaOzHu6w03FJv9Yazd2FC?=
 =?us-ascii?Q?ESdtJluBjM37Db3DvXSdeODWxwaoKd3PVQe+bySNmvMvLELPxCuAutteN5CH?=
 =?us-ascii?Q?zoUGuSnxY1EBWuY2oHIasv7eKPckCs5Oh43xvQMK0Ac9SYa0tUJ7+U3Wg+JH?=
 =?us-ascii?Q?11JBRb548lcA+0S6oa3cxGRlMGcXbr/hWTxF4mQd1gpK6gD7Kt4HAuog8+Sg?=
 =?us-ascii?Q?KeINUGVwSV2WNJUkMN27/jE2Q4jRetk2Uh5yLrlnLhuQGRRy5lBvVcDNyrMm?=
 =?us-ascii?Q?szThCAVoHaALnkAuWUCmmQRBI+qXF//UoBvndeVsaXorZc2ZHLFE22z/MOqd?=
 =?us-ascii?Q?Cc9Mo84Jh9Ja0QZhf/jaDMCq3N5ofOPkLaLJDSZkhYIfLDZtowizvc3apNsZ?=
 =?us-ascii?Q?ydAY/kU0LTdYrzYHv+/LKOLUW7eSGzgwxiuWhvKokG8K0iozZORIU5nhNwVq?=
 =?us-ascii?Q?RqYQpUvK0YUZZcRq5igM4iMDgGZmE5eMwQiN2r2zRf5gGEgPVkMcD2RZ9bVj?=
 =?us-ascii?Q?pbFFKbg+Qa5F/ZJ1U40TNcBQ8sPbRjn72h/pRnIgldtstOH1ov129g9V7PiY?=
 =?us-ascii?Q?5DnMG65E99YwyC9Pp8OD6SPFezonD4eG2ap3kFtjGEObL5D8a3sRuiVVKsrv?=
 =?us-ascii?Q?PyyWwKkxth47KLA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/MMts8swQaGsSWqaYu81FWXgc33p5pGEMGBRbUav8/CB3j4u6fjwS5NWREJ?=
 =?us-ascii?Q?o3nUl4aVlsxz+OPnKkWbEDgxt1TPiKUmrWtMYVYKaQmAxawLRFhFzlReuS3t?=
 =?us-ascii?Q?YnAyUzAbiqahBhvUO+JN1ZRJ6I0OBxjfScSht4CbOtAlhi4T4zownayol0EF?=
 =?us-ascii?Q?st3ZVaPE9TMcF04O0X/gLNJTNO/8xcxccDXUqTzQliaWVp1SIrTJd1w809gZ?=
 =?us-ascii?Q?oU79FOPN00Ugni4yBq6ETLtlBCE9fbQ6Zus52WtImHDkDFkhQKqtMo0otEj+?=
 =?us-ascii?Q?dWAqDj+p/HpG+JIY+u/lSQQNvmPglKygM+1vi1JXatGgK1P7kmMY3ZV6EUAy?=
 =?us-ascii?Q?uLxYmu+PIzKpocNu/zYYps/Xo6ZGMK0bTNHFTedXXkJzcUOOUeMD1yILbv/R?=
 =?us-ascii?Q?ioZmhNeOMrGhomBQVyMm9Jom6xVU+ykCegh8WKNpoAc0iCap4EBptn6NqMh7?=
 =?us-ascii?Q?1648ReZDJr0MQQ4nejIj0lHmWJZnzXlMiA+s/x/yDQAP48vbrKC2zFcRmCDY?=
 =?us-ascii?Q?TBFo1SftsGJ7GsnA/JfIuyd1gy/WYbtBv/OnDBy1xDD84T3RTlEzTbhzXFJG?=
 =?us-ascii?Q?CDt8f/UaDC8JyhIg9ES39fU029BXd56kziRKMDXX8Lzu7NCe3tH1iHOcGCs+?=
 =?us-ascii?Q?RrUwUaspK/atJT3FrVZqYmh1uexEjWFrYVkCgVyMVX4TFC7gBvX5F1hevG3M?=
 =?us-ascii?Q?35VeOUjflB66TnzUW4a4T11bSI0rAVinPVMbKciAhbXhYG0CRq7A/duCDeYn?=
 =?us-ascii?Q?L+eNeJejLGS66XZg0khzLOt/SMlz0e3Jd7GDJKQLqGLO85jZyXq8EezF+nzK?=
 =?us-ascii?Q?zmRzGltQv09TK0dadHFsbvFqvQ5u05o6KeF+viox77wEmk1WYmEy0hOIcFif?=
 =?us-ascii?Q?fHJTd3bBjxvjx06vIh+Qn+oqseiuwMfPK+5WYwveMmNCnqPD+zPI8hQk5BqL?=
 =?us-ascii?Q?bTwQ6iQRj3KQ9aG5rGjrnfeEwb/KPqEOWlqBg+dJbA5nRjNErMwmz3MknJx+?=
 =?us-ascii?Q?4+66tMDF1txnE/nXELnFFR0jWWs+pwosGTzCXQ4nBWWhAMmOzO6GOq6STGBp?=
 =?us-ascii?Q?/H3UiRIhhPGAt0RNoy2ijyfwQiG7tZq0lSnh6tYCwQhMAQccsrYqDwyrxyF1?=
 =?us-ascii?Q?ku/M1maM+dxwSR5ywRTtg1AENxmt2DhpgS0od4X0+sqP0AFHFdk/RcV8Q5Re?=
 =?us-ascii?Q?RyfQ5CFL2ro61eKEunomGhTN05MEK6dCcclhDbmhE7IIyss3R1x3WDXDwdWT?=
 =?us-ascii?Q?ERzOUtInuQxmsGH3/nW4mWcQhVS9t7wU5W1AlX19hAbOXZrmRSoV9/vO8Tse?=
 =?us-ascii?Q?W4NaVRzZ6+40ko4YHsnyIjmaE7VcxvW1LTdanDKKDyeMj4rdJOkR4SAgpsxJ?=
 =?us-ascii?Q?6vDYNF+sYiqktGxMxaQJ8n75lM6BNt5m1k5XnkpZ0h1H9GTUkshYZsDpUMfq?=
 =?us-ascii?Q?dA1T28ZUZZnqh9ygLciVwsnO3bHpGiUsdMZNsRVFdC0QdcAyBIUWZhaWn9hT?=
 =?us-ascii?Q?eDCIR+K4pOglDPWxR+g9xQ1lnRgX4mU6V36Qn81pyrB2cHyEMdbuNLT2ryVG?=
 =?us-ascii?Q?Ayx5R4OY5PkenXCCK4+6joQ+QgEkRmKvY7uC7Iay?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6b7704-8079-47c2-f99b-08ddeaaaa534
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 05:28:00.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tg5DmAIZx4jyIvnEPHCv3T8pMX18du+1wFA1FECi+nQrXmI4L5jE5dDn6rEVC2TTINSW3UPXFd/3RYDNsKH2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8275

On Wed, Sep 03, 2025 at 12:56:11PM +0800, Peng Fan wrote:
>On Tue, Sep 02, 2025 at 10:38:49AM -0600, Mathieu Poirier wrote:
>>On Sat, Aug 30, 2025 at 08:52:09PM +0800, Peng Fan wrote:
>>> On Fri, Aug 29, 2025 at 10:00:04AM -0600, Mathieu Poirier wrote:
>>> >Good day,
>>> >
>>> >On Thu, Aug 21, 2025 at 05:05:05PM +0800, Peng Fan wrote:
>>> >> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
>>> >> one Cortex-M7 core. The System Control Management Interface(SCMI)
>>> >> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
>>> >> Manager(SM) includes vendor extension protocols, Logical Machine
>>> >> Management(LMM) protocol and CPU protocol and etc.
>>> >> 
>>> >> There are three cases for M7:
>>> >>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>>> >>  (2) M7 in a separate Logical Machine that Linux can control it using
>>> >>      LMM protocol
>>> >>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>>> >>      using CPU protocol
>>> >> 
>>> >> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>>> >>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>>> >>    has System Manager.
>>> >>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>>> >>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>>> >>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>>> >>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>>> >>    Whether using CPU or LMM protocol to start/stop, the M7 status
>>> >>    detection could use CPU protocol to detect started or not. So
>>> >>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>>> >>    status of M7.
>>> >>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>>> >>    the M7 LM is under control of A55 LM.
>>> >> 
>>> >> Current setup relies on pre-Linux software(U-Boot) to do
>>> >> M7 TCM ECC initialization. In future, we could add the support in Linux
>>> >> to decouple U-Boot and Linux.
>>> >> 
>>> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>>> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> >> ---
>>> >>  drivers/remoteproc/Kconfig     |   2 +
>>> >>  drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++++++++++++++-
>>> >>  drivers/remoteproc/imx_rproc.h |   5 ++
>>> >>  3 files changed, 127 insertions(+), 3 deletions(-)
>>> >> 
>>> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>> >> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
>>> >> --- a/drivers/remoteproc/Kconfig
>>> >> +++ b/drivers/remoteproc/Kconfig
>>> >> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>>> >>  	tristate "i.MX remoteproc support"
>>> >>  	depends on ARCH_MXC
>>> >>  	depends on HAVE_ARM_SMCCC
>>> >> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
>>> >> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>>> >>  	select MAILBOX
>>> >>  	help
>>> >>  	  Say y here to support iMX's remote processors via the remote
>>> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>>> >> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9df0ed873f493791f2d1466e 100644
>>> >> --- a/drivers/remoteproc/imx_rproc.c
>>> >> +++ b/drivers/remoteproc/imx_rproc.c
>>> >> @@ -8,6 +8,7 @@
>>> >>  #include <linux/clk.h>
>>> >>  #include <linux/err.h>
>>> >>  #include <linux/firmware/imx/sci.h>
>>> >> +#include <linux/firmware/imx/sm.h>
>>> >>  #include <linux/interrupt.h>
>>> >>  #include <linux/kernel.h>
>>> >>  #include <linux/mailbox_client.h>
>>> >> @@ -22,6 +23,7 @@
>>> >>  #include <linux/reboot.h>
>>> >>  #include <linux/regmap.h>
>>> >>  #include <linux/remoteproc.h>
>>> >> +#include <linux/scmi_imx_protocol.h>
>>> >>  #include <linux/workqueue.h>
>>> >>  
>>> >>  #include "imx_rproc.h"
>>> >> @@ -92,6 +94,11 @@ struct imx_rproc_mem {
>>> >>  #define ATT_CORE_MASK   0xffff
>>> >>  #define ATT_CORE(I)     BIT((I))
>>> >>  
>>> >> +/* Logical Machine Operation */
>>> >> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
>>> >> +/* Linux has permission to handle the Logical Machine of remote cores */
>>> >> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
>>> >> +
>>> >>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>>> >>  static void imx_rproc_free_mbox(struct rproc *rproc);
>>> >>  
>>> >> @@ -116,6 +123,8 @@ struct imx_rproc {
>>> >>  	u32				entry;		/* cpu start address */
>>> >>  	u32				core_index;
>>> >>  	struct dev_pm_domain_list	*pd_list;
>>> >> +	/* For i.MX System Manager based systems */
>>> >> +	u32				flags;
>>> >>  };
>>> >>  
>>> >>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>>> >> @@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rproc)
>>> >>  	case IMX_RPROC_SCU_API:
>>> >>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>>> >>  		break;
>>> >> +	case IMX_RPROC_SM:
>>> >> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
>>> >> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
>>> >> +				return -EACCES;
>>> >> +
>>> >> +			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
>>> >> +			if (ret) {
>>> >> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
>>> >> +					dcfg->lmid, dcfg->cpuid, ret);
>>> >> +			}
>>> >> +
>>> >> +			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
>>> >> +			if (ret)
>>> >> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
>>> >> +		} else {
>>> >> +			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
>>> >> +			if (ret) {
>>> >> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
>>> >> +					dcfg->cpuid, ret);
>>> >> +			}
>>> >> +
>>> >> +			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
>>> >> +		}
>>> >> +		break;
>>> >>  	default:
>>> >>  		return -EOPNOTSUPP;
>>> >>  	}
>>> >> @@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>>> >>  	case IMX_RPROC_SCU_API:
>>> >>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>>> >>  		break;
>>> >> +	case IMX_RPROC_SM:
>>> >> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
>>> >> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
>>> >> +				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>>> >> +			else
>>> >> +				ret = -EACCES;
>>> >> +		} else {
>>> >> +			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
>>> >> +		}
>>> >> +		break;
>>> >>  	default:
>>> >>  		return -EOPNOTSUPP;
>>> >>  	}
>>> >> @@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>>> >>  	return 0;
>>> >>  }
>>> >>  
>>> >> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>>> >> +{
>>> >> +	struct imx_rproc *priv = rproc->priv;
>>> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>>> >> +	int ret;
>>> >> +
>>> >> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
>>> >> +		return 0;
>>> >> +
>>> >> +	/*
>>> >> +	 * Power on the Logical Machine to make sure TCM is available.
>>> >> +	 * Also serve as permission check. If in different Logical
>>> >> +	 * Machine, and linux has permission to handle the Logical
>>> >> +	 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>>> >> +	 */
>>> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>>> >> +	if (ret == 0) {
>>> >> +		dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
>>> >> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>>> >
>>> >Why is setting this flag needed?  The check that is done on it in
>>> >imx_rproc_{start|stop} should be done here.  If there is an error then we don't
>>> >move forward.
>>> 
>>> The flag is to indicate M7 LM could be controlled by Linux LM(to save SCMI
>>> calls. without this flag, heavy SCMI calls will be runs into). The reason
>>> on why set it here:
>>> The prepare function will be invoked in two path: rproc_attach and rproc_fw_boot.
>>> When M7 LM works in detached state and not under control of Linux LM, rproc_stop
>>> could still be invoked, so we need to avoid Linux runs into scmi calls to
>>> stop M7 LM(even if scmi firmware will return -EACCESS, but with a flag, we could
>>> save a SCMI call), so there is a check in imx_rproc_stop and this is why
>>> we need a flag there.
>>> 
>>> The flag check in start might be redundant, but to keep safe, I still keep
>>> it there.
>>
>>One of the (many) problem I see with this patch is that there is no
>>IMX_RPROC_FLAGS_SM_CPU_OP to complement IMX_RPROC_FLAGS_SM_LMM_OP in
>>imx_rproc_detect_mode(), leading to if/else statements that are hard to follow.
>
>There are only two methods as written in commit log.
>one is LMM_OP, the other is CPU_OP
>
>>
>>In imx_rproc_sm_lmm_prepare(), if scmi_imx_lmm_operation() is successful, return
>>0 immediately.  If -EACCESS the LMM method is unavailable in both normal and
>>detached mode, so priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_OP.
>
>No. LMM in avaiable in normal and detach mode. I have written in commit log,
>There are three cases for M7:
> (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
> (2) M7 in a separate Logical Machine that Linux can control it using
>     LMM protocol
> (3) M7 runs in same Logical Machine as A55, so Linux can control it
>     using CPU protocol
>
>>
>>The main takeaway here is that the code introduced by this patch is difficult to
>>understand and maintain.  I suggest you find a way to make things simpler.
>
>You asked Daniel to help review this patchset. Daniel and Frank both help
>reviewed this patchset and gave R-b. 
>
>You also said this patchset "looks fine to you" Jul 21 [1].
>
>Now you overturn these and say "find a way to make things simpler.
>What's the point to ask my colleague to review?  What should I do,
>redesign the patchset according to "make things simpler"?
>
>Please give detailed suggestions, but not a general comment.

I realize my previous message may have come across as frustrated — I truly
appreciate your time and feedback. I’m just trying to understand the
direction you’d prefer for this patchset, especially since it had prior
R-b’s and your earlier comment that it “looks fine.”

Could you please help clarify what specifically you’d like simplified?
I’m happy to revise accordingly, but I’d really appreciate concrete
suggestions so I can move forward effectively.

@Daniel, @Frank — since you've reviewed and R-b'd this patchset, do you
have thoughts on the latest feedback from Mathieu? Would you agree that
further simplification is needed, or is the current structure acceptable?”

Thanks again!

Thanks,
Peng

>
>[1] https://lore.kernel.org/all/CANLsYkwZz4xLOG25D6S-AEGFeUBWwyp1=ytmu2q90NyEpkoX9g@mail.gmail.com/
>
>Thanks,
>Peng
>>
>

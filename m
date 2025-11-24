Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06489258CE2;
	Mon, 24 Nov 2025 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005295; cv=fail; b=r0/Xi2rGATdZlB0Qd+kQoiYZe/jPuupBKKEkoypYmCTKiB7MRKsaCUrMaczS26TA2e738MRtJFRDux8UFP4kyXrM8NgXgCOUjncBMDMH27kglkWZsU3EExEriBWs2U549uwUZcLdCBvcECVx3MU1u+rqC2QGVEiZuoPCRL4m9y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005295; c=relaxed/simple;
	bh=L0ECg7rOplhj7d0CC5QvJa6BENbrVwpT6FyCo3davc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a1nExz4eml9qhoOiDJOjk7ieVDKLI1PWNH4DR7lIxUd4nyoNRAPmvvqKxqgGd+uAVTrwz3zVJBZpegdmCAMAAsgKrVAJJLA79zyzITLsEYNn6DDp/K2MvdzaPlYirHoxha2GJb4qh4IsdjOy5NfFdNixRmxJ0/oMYausDWSzDUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AieUxMHp; arc=fail smtp.client-ip=52.101.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AieUxMHp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfCSujHyzjTBsiop1ZZIGcr8ARsuaQK02eCYyGib+wlQ/iWAFWRVntMXaNspGjz/RwA84OJ1VWNEz0Bm0Oz3ErPmGzxw/3aNtdrAW/1f4wxjZSWsuIZ91oJUgmjTO8ugciPYizYSI+k/lbj9AdRluKnOMminjU/7BSlzMKmeSO7hIwaBeN4n28slWx0PxniAo82vZqEQ9vaZ/IH7fxwepd486gmPLDHtQH+VWDzHBHEye45Rr6uicqJHPyi4w678LJ1788/YBN9NcVu03ZyVv29fpDVhkGMwYuC08tUlWh3BrDi9LG/iu0yENUofHudBxbIRHi28NT9GRV2ZQFF3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sx+MhwzhVSwplhT9ipuTcXCFgwvnH0gF0LB47snwiUo=;
 b=os3qzTS+YMBs0HtyowQu3T6iRE6DIY0k/tHOijZp8Hv1XU9P9wuWSmppAtUkELjisFrxkmLT5c4l//58hUQjaEY9QKxM/HvcKuUtdCq9xq0vgHROtn1e9aqhyrYy8Q2iXRfGX4ZGGwtpuj6hs8BiyusmbiBXOKE9kYavaMvpHrqyrWiRn0N04yzR3Tfp3RLfr6YVZgdRVooOcy9b51NLa7CWMNsIhkQO7WiMNT8Xir9Z0Gjr6kvz2ouIM4iZPr5bIctxugoJovGwnP5ivfHU3ZXxeVgsQj4oB9KHueAHo4apUHTaFmZrSJqsPy7Yvv5wdXbsBhax8hDCXqLBsx6ETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sx+MhwzhVSwplhT9ipuTcXCFgwvnH0gF0LB47snwiUo=;
 b=AieUxMHprTNrqMM1USi1g5SoDdMJ31t+rqN/vizvinrka1Rqi+VOP9VUWC+U/Vpm+RXRKPzki6UKOtzwSlDvggxP/OJoijaOllT0ucBZDzBvriDlvH60y8Tv4nSB4jTqjW2NJThy0/54MY460ZuAohlYAhvgvt5XI5TcgEMee3Y/jCTN6XmakBeNGCd4jAvAfoI4HCHCZyuUdsnqzIulvOQqmuo9oN69E01SiPPxGcWuaDe2xXIYYtqo+tCpKuPJpd0H7x5tCQyc+ZxCsmfAKIL4U1GTbEMV/0SfMODgrvBfEQqn+Sr/HQW1Riac4xhc6c9wjcWVMWBN8VGqxk3uOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8869.eurprd04.prod.outlook.com (2603:10a6:10:2e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:28:09 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 17:28:09 +0000
Date: Mon, 24 Nov 2025 12:28:00 -0500
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
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aSSVoOi3VIn7LefK@lizhi-Precision-Tower-5810>
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
 <20251122-imx95-rproc-2025-11-20-v3-4-9ae6ee619a78@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-imx95-rproc-2025-11-20-v3-4-9ae6ee619a78@nxp.com>
X-ClientProxiedBy: PH7PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:510:174::11) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fca6ca-9ed9-4cd0-3eaa-08de2b7ed641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xymoZBdbsL5cxL/4q4QeKXisQ4EUVS0X7HD2US0tiBpY2nGHtgpzfAz1uvCY?=
 =?us-ascii?Q?6EMdJ6e6zReok3v86sah/xCuoK9I1oowVpeU6tfeLCerovP1AxpeywhW1iVv?=
 =?us-ascii?Q?50Ilc0JzjnTMZkOkQ12NHj3Aa+H/8rIRWUeQpW14cVWQNWIPOFdi4tzbrQjV?=
 =?us-ascii?Q?/JJNr5D035Uvbo7Gx+tCoC8ZlQx6+Xht4En7AFhyqDT/S6t9vNXVlkwbvSHX?=
 =?us-ascii?Q?DEDHikeVt1WHDPK4T+sTJymMyjgwGmSnTEo32wSw0hpmdaX8HVUJo1xnlAps?=
 =?us-ascii?Q?Fvg5oq8m/Mpi/WYIIMCbDMpCIFiuSrdlE7jMSz4m10B8yDR7/Y2qnfk+qhBU?=
 =?us-ascii?Q?bfMuL/EPHPBYqf8L4+XG3X9d97QlOFwfIzMC0P+dXKAq2fv0achCP7fKF6nw?=
 =?us-ascii?Q?1hPe6UBVMdCplJNZLQSL4gX4H0e+1/FfmObEy8SisnAUds5ZaDwbt4v/OhKe?=
 =?us-ascii?Q?WSyPt3V2pJ66KblJt/PrAo+ig8n6fNGzC9Y457I8IlhSYnv8tpXSIHi1DyLa?=
 =?us-ascii?Q?RRsE5Il12v26xf4H0n82BVnx8WtPfYMSRXMN9okPiCgH/XUACWUXY47LK3vC?=
 =?us-ascii?Q?uZGHfMSveyfridquXLwpaUlA79o4gnX8vqXvHO8crG4lQAPG2tCyZeaGhv8x?=
 =?us-ascii?Q?GfjKlqaJZOcDemIFbTDhNreKBWgtGJLQNsRnu2EmLxZtvlhTp3sdsbjtTg1/?=
 =?us-ascii?Q?iuIsk0fDsZAM9Dxnnc6Nx4Dep4BGZNxHyeqsoicVgBBZAcsFTkBC2qT44tWR?=
 =?us-ascii?Q?B7kfjx5ouoQA2EphYC7+baOg5l998DbPOSbnFIBH+XQ0MVmG4QFCM12ABnTm?=
 =?us-ascii?Q?jKG0Yf70xdno+20aI27dMJcB60jEHcDoo0i495lrjXZdfgntyim8lCRAye8H?=
 =?us-ascii?Q?5m4XUnzgoqzV3P4Eez7K++tn2ialfcJWu4oRR+W2KT5ttdDJA5agiCZxarBB?=
 =?us-ascii?Q?oi4c0lR2lGmlesFQwEQzccOWPzUH3qTHV7F5rDi1expCXO3FGGFfTrU6eggS?=
 =?us-ascii?Q?0Gq8aAryGUqci5jWhkq2KXNKyfdDzaMEdN6DrjzCfSPM/ghWVqX9G4wXmK2f?=
 =?us-ascii?Q?SV696XzCpIGiGQrttDizKeJ5fTy4wv2qukmuEhIfIa5zoiU8x02hBFUwrxBv?=
 =?us-ascii?Q?nKpC5m2iWFdINfbxA2iL4SATbBlaJ3Syo/eNRu9RsZ6G4XiGATICyy258QZZ?=
 =?us-ascii?Q?mOoW+xNWDvjbM0vGAnB/8PXd5ByUEubXu1V7GTLc4gmhtrqGg+z2YxDydyAR?=
 =?us-ascii?Q?Bmfknn2dUVk6v4/3MyAZDBunPn8wMaXDVSdtp/tEzZ9VLxIbxr6YMlvINRf+?=
 =?us-ascii?Q?Iv9bL+vcr8bU23FDSxbjms3EA7IbVriSBtmykZjfjDvdRjlSZ9RWEU1GOUKX?=
 =?us-ascii?Q?TgUUcJvbbfTMFZ+gl9LU9jyvu8R06m7+aVJYmzfPW2nVZmsGRJ694Ge062Ji?=
 =?us-ascii?Q?iVlOqxQKsLJ7EqiEKeMrK5W2cvutYrkbaE7WPVzYIWgFxgC4b+DvhiJqbKc6?=
 =?us-ascii?Q?NZzVmIpD2v+45XkJynk1BrhMU+Y73491v0dZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0K7r0H6vMaxlEMGw5nOK+IHYkLD48w3CJw2Tiyp3wE68mb+8MZQH1WJfO5+P?=
 =?us-ascii?Q?b4o9lB6EDGLj8HGucx2zeUrU9D6S0bjEOcgkX3u0V1b7NmeDiCwH6ORlGh8g?=
 =?us-ascii?Q?KY2aW7EbxD8aZ+GbURimIA7or2jA+Xnvxad8S+RbpycHo2IB8zIsx5ZDhxSy?=
 =?us-ascii?Q?GUNg/Hux6hqVyw6lKlSZ5IQhdpW+a5BdnRniTh7RvmVKs4xNPfJFHMwtFP6Z?=
 =?us-ascii?Q?a8piXsROVDXS5BC/XZTJe4mAB6VB6+s5XFk0u/3ofOmxF/r58mB4yjsL7uBM?=
 =?us-ascii?Q?jvS8OtjKOP0AnAvmGTQEN6ShFZ3IrzlJeqpLNd7m3dk/EpJEeiifi7DhcWqV?=
 =?us-ascii?Q?sG6dhcSvVr6thcSxvhzvaA1N5zao4iC60U850vBezzKtmNNtpGdCaLHLY3E6?=
 =?us-ascii?Q?ElCfaoDB+uoVoG7f8pWWPeiT8U6Ow1VBsZhClshTgpXfPUEQFwqJkDDOVci5?=
 =?us-ascii?Q?cOM8BDhYCCuWhEvb17TTgqlh8B8EeBavJPvmFDEHSwVCf57Z/By/BeeBNEEH?=
 =?us-ascii?Q?gy8IONqnUMroM2oz6UxnRLxpkXpagqD0CaZmecmmvfu6gXtuCFuIvFr5DIu1?=
 =?us-ascii?Q?QsXtkNV7yL/+Wr4duXmd7UayDDKhsvGPzOsGOBn4SQV1Vjt3qLy4zKPP7qaA?=
 =?us-ascii?Q?3+/eWBErGBfKb1ykFEMFZmlO8uEgUtl+5VEoGplMpjxQARHr7UiV0CC7f2Vu?=
 =?us-ascii?Q?9YcUk6yoxbn+7/RiHIoH0FDahL7m6DVY0NUV+KM17OepTddv5e6xdyk2YDbY?=
 =?us-ascii?Q?i0uXRT5+r1f6wgV6Jp37079WGvalZgPZAfCefqwEFktZ3RJHkeqfTyM+8oEz?=
 =?us-ascii?Q?QFAtCVNCm3HOrzuAOk6uVC+JcnfEuGJ+bQ9P953WDw8QeTHi0C5QVHxSrKvP?=
 =?us-ascii?Q?GnUC1MNek54i2z5krm9izJcE3n4di6icA/Xqqea7X2FJvDJs+4YQIzhc3cJM?=
 =?us-ascii?Q?wHKHgLVl6GFlBZGfzfbiWo9FDv/IbllDyx/mz48mo+6UUpJrOKWH1MqhsIES?=
 =?us-ascii?Q?7v/ZloCdzp1NpYupeaYOHlj3nkFftKRIBsQNcDo/aQcl7/Q1CxgyOLUkaopW?=
 =?us-ascii?Q?F501QM71u7KNWQ7apQi2yIWmzRuBTrHuPfgDuRAtayS6xCmaQmd38Mzt3kEb?=
 =?us-ascii?Q?cZz6bNgPEWtFRuA1HMnAEoLsIt+N6OgPGxX5TnKndX9D5KKyvrQGDLn53ra2?=
 =?us-ascii?Q?loie9XcDvQo41Ea8SdBim6Vm1R8A21X7S+4N7tXNdtWYVbXZzx92Ihvne0At?=
 =?us-ascii?Q?RmwVQEc5BfKtY6VhAL9ECLrN4I0YhPLJHgr1KsERNPNH+ea7Nvr6P4yoLPS7?=
 =?us-ascii?Q?p0wbwKtTksetrNvZQkc2vCaxhqbE9uZQzL20RUS/i8rkl3YXEVvunkBFsuua?=
 =?us-ascii?Q?MPLxet2qprIszfLxgOb3hKWxMi7UiwqwOnG7LbzihDqltQ9x1874Xy9tbbr3?=
 =?us-ascii?Q?U8QkqkL2C4wITA6ZBDGkN96I3lLeqTHDjfDioX7btMLyZ7WYz21VFxXOMGZU?=
 =?us-ascii?Q?EXbDOAvTr0BjRuJNiIJaLFy4xVmQU5XuzjP7CAcNyGQgQJjX5uK4Cn+iU9RO?=
 =?us-ascii?Q?ACN6GSNqYQhmgfi1euX00NvThbEoTi1Pt890UnIT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fca6ca-9ed9-4cd0-3eaa-08de2b7ed641
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:28:09.5144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1EJNFczDfJOME30LniH1cckSPTjfwkvlhvILEHtJ2g3FSLFTSdV6cM3r/w7/qXeKp3yNncvBWhe1yRMHl5JPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8869

On Sat, Nov 22, 2025 at 08:58:19AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> Depending on SM configuration, M7 can be used as follows:
>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>      can't control
>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>      protocol.
>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control it
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a separate LM),
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
>  drivers/remoteproc/imx_rproc.c | 193 +++++++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.h |   3 +
>  3 files changed, 198 insertions(+)
>
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

if (ret)

> +		if (ret == -EACCES) {
> +			/*
> +			 * rproc LM is booted before Linux and not under Linux Control, so only
> +			 * do IPC between RPROC and Linux, not return failure
> +			 */
> +			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			return 0;
> +		}
> +
> +		dev_err(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +
> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> +	if (started)
> +		return 0;

should it be before scmi_imx_lmm_operation()? If started, supposed need
check scmi_imx_lmm_operation()?

Frank
> +
> +	/* else shutdown the LM to save power */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +	if (ret) {
> +		priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
...
>  };
>
>  #endif /* _IMX_RPROC_H */
>
> --
> 2.37.1
>

Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700C749C;
	Tue, 28 Oct 2025 16:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668231; cv=fail; b=UnPGVHGyELdshDSQDrX6JQqIUU7705Y37v6T47J2Fe2Y+bSq9RbNELGGbQfClxlh6SjoRiQYgAtPBIhtrCQERpsfYUrEHp4Qurse4yyfI2Fn3MQuT6gXOf9hEGIC55o/hS6pqYNoqBtpf9WuuztbhAwoZb6KZRjaOAu6ynGWLDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668231; c=relaxed/simple;
	bh=WDbvwe4v0+M+PBYoTiEnWgY23YimqS7jJH782hHMsw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fO1wr2odSZzMIE13+Apr2uqRHbVfCnRp2EX7LZvR0wlSJedxCSTVQLzfNX75x+whCeJyzphjP4oR8nxtlemDF4eJuL0LoCNzVtf0YL7f9RHnN5X9bZYZ27Av4N0EFyDdKemCTz+2OMeocLXTZvyUFSUCg0RLRRifsAmdxHbTtbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I1yTo9K3; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I1yTo9K3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0ofopsKdicqXgWXdTRmTz1vnHHPFqAViJ0M3pcI2cdWt5YEBkdGvzxlcX4CgZDY2y6bSbMAdbvcEYBeLRMKR1HQ43GXSJZdDAKNCDHL/423R4t+rFvuTAe480HQoRwI8yh2C5wo0tOuTtAGpcr41vq/2EJuBGkqAzlJC1fAlTBQiJMTeev0YpOVNiLDqWXg6h71dWKvfTUZXb/Va9xaumqOCpYPG6X0BaUBGT3XhvNIYBdi0WqD9ctO9QS31NszBCzeIi0/EcZ3VcuNCFu1nycNGN93MT/BLWI+XhAJe0ly5Kp7RFFfbKRtfDm3UnNCTPdBXJNHjtiSOUYB+O40Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWlxATO+6R979P7zEdMx7F17MaF/fXswn9kwEgpGD0M=;
 b=VnDQ4deAdfuGcQVX2BQatIBDZ1DPIp7CRpGClj/pqgN+OSnLj8ln13+aBSvH+LrVR1FNJ46vDmSi7J3rmU2AGE/aZALNuWeG9ZsEvvDQ2h9Nz27YXyi+1+cmbmlhYIGPPhcBS8BiyEWmktEN6t3tN68h5MtQ1SNGaTV6+Rg+PXK6BG5OzSw5dYk1seX8kZ8onESPsr+p27Qdt8D6EniJ3HG8WT6xlZ8L7RCXtLcSKbT+HbVAU0Zcw1Z0PS28DCjM60vdZojvGs9vK5V1eZRDginqjU/c/W1xUuEbVT+WezTzeZ6nwsex0xIve15FXj7xrK6qo0v3kocqIf2I1NimGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWlxATO+6R979P7zEdMx7F17MaF/fXswn9kwEgpGD0M=;
 b=I1yTo9K3ty2w0crxTM+4xYUK4859G+oSor9tWP1NHrh07XMbmKRWdGljxz8SuTjuRwTc2pR3Ve+kcyATuCwMuiSgO85iBCTB+9bqXfsXcedkZkudvf9LNBob0bckU6QEIwBjcdZTalIbsre45RSWSYmq+MZ4BFnuCF3+QQn6imGqoojsm/GAuVLTMLONX8cKAwq9YlxUlRKYBQQBXf34vQ61WuRW4SddoX4g865gGOi5lM7M7yBIYAny+jPOEBSjlH1dFn507yEWCZ8L4s6ycQENDn3sy8/H3VLD9MHHjx5fWD5TbNgIkIlPcRmBq8d/TU1t+3x1m+k3S/7TQcK8Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAWPR04MB10053.eurprd04.prod.outlook.com (2603:10a6:102:387::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 16:17:04 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 16:17:04 +0000
Date: Tue, 28 Oct 2025 12:16:56 -0400
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
Subject: Re: [PATCH 3/4] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aQDseAYDhvZ01NI8@lizhi-Precision-Tower-5810>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
 <20251028-imx95-rproc-2025-10-28-v1-3-ce9e7db9edcb@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-3-ce9e7db9edcb@nxp.com>
X-ClientProxiedBy: PH7P221CA0057.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAWPR04MB10053:EE_
X-MS-Office365-Filtering-Correlation-Id: b775c56f-aba4-4976-acfe-08de163d6efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|19092799006|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7cwQsV4Si1xUuoMsS5hHAerMCWK50/vYOfjI1lMoRZI5bieqakCn0JR09VZd?=
 =?us-ascii?Q?MSBpnz46DkQ1CKb2Bw1jFZ2n4nI4JEXcExm37eFYEKYwXR5x10/iUIBnIBLe?=
 =?us-ascii?Q?BGN5YvcJDAVDX5MsSGxklDYc5vu1cx566e+27j2o1Tol6xu3TE+TqZPAibZo?=
 =?us-ascii?Q?W8ToUsjikh1OXhdh1OoULYhW598etTixq/pHwiX33ZEeqfDnfFxhEE5WSeCI?=
 =?us-ascii?Q?nhqjujd76jdoKbkS6OwS2PaPIJ83Lr7v0BE7LbHXqJTI9qtR5lOF+lGXaDUH?=
 =?us-ascii?Q?s5yTY63Aicw7pfY1HS5BwmoFFYmzOVW/WmCEoRQozmHci8eSUTAmUgqvhcVr?=
 =?us-ascii?Q?ECHb0+0/A02qk0zhi768u+xmvWyzYiT7E39/9qPfI4x1Zy9TIsGKcosrTUsN?=
 =?us-ascii?Q?3uGNd7cF+t7kK5qtYS8Zgla3yQl/ngL0eCmTiIwC/5fI65BHa3G2auPCxeEu?=
 =?us-ascii?Q?nrAVqM77FKWXxsf2yyrMvKl0BASGpNq6nT0XoISDyxlkvoATmGyMKWzXMpCg?=
 =?us-ascii?Q?MDJsaul2J/RGz9/JKogR0aXNkRq778I7xuxAW66aKVeI9dguuuCVHG4WN7sy?=
 =?us-ascii?Q?iXgkVgjW2CDs2xMP+S5TBq5PARFraJAAiAQBKa0rQn+zNBNf6Vc+CgKkyZQr?=
 =?us-ascii?Q?J0Lqnr2wajQ5nHIvY/v2RWQFeEfoT+I1DMcMLmy3bsuVAukqp8QlMKi9aM4U?=
 =?us-ascii?Q?E3WwHxwk1RZ5gecwRWhPN/wQFmpr1ZHRRcnv/VTXZeMNWfKTZCTClworq9AC?=
 =?us-ascii?Q?VffwB3vw4QTHVd6TQnq72sFYy17tO9/wBS6a4BNV40jcVF6zp64yOaeJ3Yel?=
 =?us-ascii?Q?LNTScZSHS4tFov8sPw35N11s6D52Pd3fLuUlBhXjMTb8WsHMPMMEdIGZ+17/?=
 =?us-ascii?Q?XszYrusPlBB2MHx0eFXBSGsBCyD9zS84Xs3TpthVyfSb/5RwCLycdSes8t++?=
 =?us-ascii?Q?jiisr4ljHoBrygdUZLTVfjkv+VYChIcAbgV1FtoRTiJRjJSW8A3CwSK0QLj4?=
 =?us-ascii?Q?IxG9AwVht2ZxbubsGJzUzNHowHnycJL1LnpybWrchg4ekAb41mLUY4ODcZmH?=
 =?us-ascii?Q?gc7PXsIqYJXr4mXcaXiW/Peuyl4MPvUsu/f+AP5jIk+0Bgpv/zWjy0ek9Q5R?=
 =?us-ascii?Q?t8h4a0/2tZejtgLjFlGS/edC8mJEtdOqS3pomF+E3+cqS/W/w3kZLEWj/5GV?=
 =?us-ascii?Q?TaUcVAGLa75mvxl8f5F4WsFMB3CiBqfFMvCgRSGQ/087fXzrGVZ6OMclhW2X?=
 =?us-ascii?Q?kTRaDwlF/wdNRgKZ4gSScOtl5u+1w8wsOqgqczotTv0MssZs31GiExzl1jVK?=
 =?us-ascii?Q?YayENdsIzVMP6uarXase5kGzKRynqmekGzo0aBvhWo9Ly7SbO5MyMJKhbYLF?=
 =?us-ascii?Q?UGlJ5kuD3IgyMHLrIt+KjeRMA39JfEizfwLNQ3/8zWKOuoiG7ia5k6i0k6FR?=
 =?us-ascii?Q?54e7tJymBF5uxCm9rZK9npw6IRBH5KbtzSkfIk0YyxzwEAlEGGDAC7WAxyVA?=
 =?us-ascii?Q?5/F42Tck/x6ajX2rWTm0ko5ah5VNIaSpb2wD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l5WVvb8muqfpuppasDkECn7sEZLZkhkNOztW8hpuo9SSh2vIGrruXa96I8pp?=
 =?us-ascii?Q?fRn0TSO77HGgHebqoAgVyFxmbdtKVNd+Fl8Dex8JHD84kgPO7shRIvFQH517?=
 =?us-ascii?Q?fRris53s6i2Db7RCOZycVO0rtvrKRGk1zZFneVoFqCxQtD6CTrrdGnlpOiSo?=
 =?us-ascii?Q?hj7HZRiNHrNGtvdBgQD5+0Tl0ChAvZ5tMIHjrst6dplfFv1qFks6nMwHzo0t?=
 =?us-ascii?Q?gzdWWjpNZnu995KqQqSKRyNss+hizgCqzoYGkKGwBChJdbWZWex15ZxiFfl3?=
 =?us-ascii?Q?sGubc+TI3d4Ni0K640GoWyjJB41wF+nd8zj4hWKrNYSWoJcdP0CykJtiUZC5?=
 =?us-ascii?Q?E6g8V3twNccZCxnl++voblPwPp4wATBVAU9HrQe8GWj4OgEdlhVoItHBNXTw?=
 =?us-ascii?Q?jkrqrwfICtPflMSN2SaINsOqLlZtKpHyOBsiKljyvslEleYYQ5Z7oFVZteSe?=
 =?us-ascii?Q?L2NUtG+J+2lIZg7vfRAsNO/XgBLqlfq9aIdrnINMXcHYXPWjDqVvfGAZZFv/?=
 =?us-ascii?Q?ssZOurT2UygCHOhzhKbI31PAOHDLn1gD0Ru6gvDrgTXd3jO+VCj2wHujA+9d?=
 =?us-ascii?Q?vJcKvYZPYegE9Ox9E14Uoz65/+m/tm9fqLRab0iuF5NfFIJFL93n5OcJmfkS?=
 =?us-ascii?Q?O9uITJtgzwyVXDkQRR77BSUE8FjpFddGFYQwj8mlmyQMDLtkydeaWTQGobNm?=
 =?us-ascii?Q?zjCaVAheOr2ctxGNM5ti9F3+WyJQn2UywyywBBpvJASOUjU5VRZn2XxMcUSG?=
 =?us-ascii?Q?bobuwTItqQ5jxBEc4VMZxY/yatC/GOno8KhGNk7jIANnFeYnG38agjlLebxD?=
 =?us-ascii?Q?ZE68K49MgIsNSuROy13Kge3SQKdE/CGHXg/LLLj1Pxi8WpZrhI0Id729iyGf?=
 =?us-ascii?Q?vyQVX0y000dQt8uujFGgzRKwUqrd58rn3eYejFCbZiy93yaoUJbEEDClKoxb?=
 =?us-ascii?Q?q+smENfpb94B5wtTIzbfBJnoPbPm8qTJskStb5UyKsoK57FoOPqfwGmDj3Hl?=
 =?us-ascii?Q?ktUAziXW9ezdbXC8WG0oEPuwSup+sqg2WZRd3y4B9boeqX+jj1K+Azv/V6Vm?=
 =?us-ascii?Q?R76houAq4gffQPEyPiGX+e0mj99cQ0VB/6suRwYY8vRmLhwDIhXOyixKEarm?=
 =?us-ascii?Q?6APfAv5s/xRTWsuujKbmCcEjGf9yRcgQ19ZyvJJdnqaQKHbOkvqa+O9GsHSW?=
 =?us-ascii?Q?HhmiJ7Ew3agQeYB1OTnynsj0/QI3NHhV4FjL7UzppxPGnRsjp1x+kswH35mv?=
 =?us-ascii?Q?DeaHEQkqAJyHjJSnZdn9T/sSXbzPgwGUpU5NEzWb2REBf2VWwOq8ZuwKN87/?=
 =?us-ascii?Q?TDmcpYs0z0O2L2iGFEmbnn9rcXWVuGDlHJN/8Kb8tdNEXEG5bC27ElQvwMsx?=
 =?us-ascii?Q?sbrSpHlmXDFGJmPsvZPQHAzgtcbZntburmUU94KswAAnHP6fX8pQpm0EyI1b?=
 =?us-ascii?Q?1WFFOLNoIrbq4b/ZxX8L0scT4sWokFg5F7Ugpua0+1/p3KE7+ccd+32WBz83?=
 =?us-ascii?Q?zyNYNvUbzq9dadL1PPD0RwkupSU4QCtPVjf5eeVdCVsx820XRdnafoKFfQ2r?=
 =?us-ascii?Q?pm6tMsURSESRYY4CKE15llnT41nqeaEYL26jiElV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b775c56f-aba4-4976-acfe-08de163d6efc
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 16:17:04.5504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFEru7hqD6yGhJ87dr4+USJu+Euygn7CbckheBCxs+3bmwhAe9XL1E3GUiMN9q5I2kiQYQozJRVTjqQK/tGF/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10053

On Tue, Oct 28, 2025 at 04:18:03PM +0800, Peng Fan wrote:
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
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 193 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h |   3 +
>  3 files changed, 197 insertions(+), 1 deletion(-)
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

what's means IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV here, which is the same
config

>  	select MAILBOX
>  	help
>  	  Say y here to support iMX's remote processors via the remote
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 4ffd2415295be5e60c8eb8ea5126b3562bf703fe..8ecf95c81b598bbe38b721808878e5427339a08e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -22,6 +23,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>
>  #include "imx_rproc.h"
> @@ -92,8 +94,16 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>
> +/* Logical Machine API Operation */
> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
> +/* CPU API Operation */
> +#define IMX_RPROC_FLAGS_SM_CPU_OP	BIT(1)
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(2)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(void *data);
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc);
>
>  struct imx_rproc {
>  	struct device			*dev;
> @@ -117,6 +127,8 @@ struct imx_rproc {
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
>  	struct imx_rproc_plat_ops	ops;
> +	/* For i.MX System Manager based systems */
> +	u32				flags;
>  };
>
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -313,6 +325,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
>  	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  }
>
> +static int imx_rproc_sm_cpu_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, true);
> +}
> +
> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +			dcfg->lmid, dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -369,6 +419,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
>  	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  }
>
> +static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, false);
> +}
> +
> +static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return -EACCES;
> +
> +	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +}
> +
>  static int imx_rproc_stop(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -485,6 +554,44 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>
> +static int imx_rproc_sm_prepare(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	/*
> +	 * If remote processor is in same Logical Machine as the processor
> +	 * which runs Linux, CPU API ops will be used, directly return.
> +	 */
> +	if (priv->flags & IMX_RPROC_FLAGS_SM_CPU_OP)
> +		return 0;

You already have imx_rproc_sm_lmm_stat[stop](),
why not use imx_rproc_sm_lmm_prepare();

imx_rproc_sm_cpu_prepare() should be empty. So needn't check
IMX_RPROC_FLAGS_SM_CPU_OP.

> +
> +	/*
> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> +	 * path.
> +	 */
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)) {
> +		if (rproc->state != RPROC_DETACHED)
> +			return -EACCES;
> +
> +		return 0;
> +	}
> +
> +	/* Power on the Logical Machine to make sure TCM is available. */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -532,7 +639,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		rproc_add_carveout(rproc, mem);
>  	}
>
> -	return  0;
> +	if (priv->ops.detect_mode == imx_rproc_sm_detect_mode)
> +		return imx_rproc_sm_prepare(rproc);
> +
> +	return 0;
>  }
>
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> @@ -991,6 +1101,83 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>  	return 0;
>  }
>
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
> +	bool started = false;
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
> +	if (dcfg->lmid == info.lmid) {
> +		priv->ops.start = &imx_rproc_sm_cpu_start;
> +		priv->ops.stop = &imx_rproc_sm_cpu_stop;

you have switch callback here, also swtich imx_rproc_sm_prepare()

> +		priv->flags |= IMX_RPROC_FLAGS_SM_CPU_OP;
> +		dev_info(dev, "Using CPU Protocol OPS\n");
> +
> +		return 0;
> +	}
> +
> +	dev_info(dev, "Using LMM Protocol OPS\n");
> +	priv->ops.start = &imx_rproc_sm_lmm_start;
> +	priv->ops.stop = &imx_rproc_sm_lmm_stop;
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;

Most likely

	bool b = (dcfg->lmid == info.lmid);
	priv->ops.start = b ? &imx_rproc_sm_cpu_start : &imx_rproc_sm_lmm_start;
	...
or
	if (b)	{
	} else {
	}

	to do ops switch.

> +
> +	/*
> +	 * Use power on to do permission check. If rproc is in different Logical Machine,
> +	 * and linux has permission to handle the Logical Machine, set
> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +	 */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret != 0) {
> +		if (ret == -EACCES) {
> +			/* Not under Linux Control, so only do IPC between rproc and Linux */
> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			return 0;
> +		}
> +
> +		dev_info(priv->dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +
> +	/* rproc is started before boot Linux, so do NOT shutdown the LM */
> +	if (started)
> +		return 0;
> +
> +	/* Permission check finished, shutdown the LM to save power */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}

look like this block should be in imx_rproc_sm_prepare()?

Frank
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
>  	/*
> @@ -1166,6 +1353,10 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
>  	.detect_mode	= imx_rproc_scu_api_detect_mode,
>  };
>
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index aeed08bdfb5619c7afd7201589f417cfd6745818..b8a30df92d3bdeb915e33551235d555b947d0b16 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -51,6 +51,9 @@ struct imx_rproc_dcfg {
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

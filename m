Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE42772601;
	Mon, 21 Jul 2025 05:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753076821; cv=fail; b=OjVkK+WuuXKBg/Bdc0RXzf8gJqIuVjdxaI4zuEfPqiPZq1iNYOqxB8F4e3R4S2yrcFZxXbTSFzh4gAMUmHZb15CGZTNV3X2ECofjJ4kMSNuRMHDADFcHnlmFuh58A9kG58tlL5BQxGrdWVAZ9pRUkcUkHb6hbgZveArl7RBZTWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753076821; c=relaxed/simple;
	bh=EGA1qlK6YEQOuF5WJ2q4YKeW16g021d0p3aSfjVVRsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OZXsA7ce8lXfpwsm4x+a5eNSTYXLOa24IvTNXK4c7UKZhiyPq9H0yiBSCmRjBv3u6z9ylRGdiktmmy6SJxHtiBRJb6KI79t6wQUAaKTvVRbEMQbFij7CMY0QUiMKdyCxYyI1+LPk/oNLJR6HmghI042KQOlrwvO19QXHjRIVV3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DrGjoYOh; arc=fail smtp.client-ip=52.101.66.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DrGjoYOh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqB57N4V0pY2l+NahCQbVLCqi03kRYhAOLlsH+hLzPhNX+uDIALv4TL2rcC3e4//Cgq29FWxw4epsDM4tCYBSXZMSvfEtFTQcmMiUHo3pR2FT6dVk+UpmJnINzwvXXSQ9CVELUWrnMphMyCljisQ/6fBOxeE7r3ggJ5wToPgz7XdMWSOT1If+/UJx5uyCl4oLx95WefF57lKh7Yww4bCl9bw5c62i5z3eAncWKwW4WmNedngOpIToQwgXp+gOGhI1wimz69nI5ibqLMu4exckpcaDSLifyVk6dVCOVmf9jOqxdVi/5xkt9kk4YU0C1zB9JVTvon3DUQ1px6/RqMQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8nVvKL5BahHyTr2kfF9X5F8b8vKLBTe9S4jl9aIqyc=;
 b=ogQ+hLVsQGS6ydzaoRexW3ffi6KL0A4t5/tyr7o9EclDwEdgSyD+AaQsltNzkheNaGbrR9NEVKNHhYoY3FzSJXQfIOUJGDNFxZPse1qn/sON3dpZgZsTI3AMYJMW6QVWiQdOzCLu4pWcyn7N1guqW1W30HXTGo/7AxiHVI9sAI9ubVSAfSOM7/DAEu+UgIBwb56WYyHmuf6QvOMHZfS3QcaHu8vrC76d097znVNDyQhJnEhMPkQgOsvK1N9kxqjPy5K5y+PmCvGgU+NQsv96u7sTTupc7TO5XCLto9AyjnDM9To0ZhgYO01QDP0vwafQUfX2P4sRjFqqTSC4JBwNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8nVvKL5BahHyTr2kfF9X5F8b8vKLBTe9S4jl9aIqyc=;
 b=DrGjoYOh8/bmo8qvpnqzoJ74GKpk8LJP4rjOHvk2pAJutDokpIBIZKrpltuWDR6rgqsDT7Rrs8asMsQzpcJGu1Z9ZuaSfsEsNWr8b2dz0fPOmJhTBv0ki+u76gSwNtWtEBjNHsBxds5RstAQRxVklwf1hGBGhCl9kMMsizsRNJQLDZk/bl3+QwWMMs4d6yExb3LxbSbmMUVSuuYKoHvAbSCOrE0HAHC4jEp6TmkQ1fstZ+mr/tsnpF+kgz841ftB8INRJCmZnS/Qp3nZZtMhsSvQfHSewy5guuxCftkrsTlRVEK/BmpH8NTkuC9IemZVk8X6NZlxf34pwnuLdVsOiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8924.eurprd04.prod.outlook.com (2603:10a6:20b:40b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 05:46:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 05:46:55 +0000
Date: Mon, 21 Jul 2025 14:57:24 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: xlnx: disable unsupported features
Message-ID: <20250721065724.GC4844@nxa18884-linux.ap.freescale.net>
References: <20250716213048.2316424-1-tanmay.shah@amd.com>
 <20250716213048.2316424-2-tanmay.shah@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716213048.2316424-2-tanmay.shah@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: 0910fc3e-90f4-4e75-246e-08ddc819ffc9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MA2usSLDF5ibow0Nkpbv7PW9p5K+4jTdhO6USRY8FwtgZxEb6NP5GjqnRFcN?=
 =?us-ascii?Q?YmlallLGdVr25vwQqTCQ6lZE6+nVySV9DVK0enG42dnvAcPdV8p1yNdP49jR?=
 =?us-ascii?Q?3aDW9vwdVqgqXHPRfPhae1q+Xaf+bv8pOkR0tDoK0dw1WjoF2UHdWv6qnLpr?=
 =?us-ascii?Q?4OD0QgtPcPvprZM1IW6eSbNwj/e0PCOQ0ziXjTbVeUdmk4Ypoa7qrUY2tyZ5?=
 =?us-ascii?Q?w/LILBtt5HtWwmvnXLxENeaD3ZJTH5kSZn2A1iCJgeXgClOvOuvhgwKVrEHR?=
 =?us-ascii?Q?0O/rpi2OdTHWV7TKf3Q5roWgJHaaW+lQdj0RH0+x82e6E4ED4IrzqCABboab?=
 =?us-ascii?Q?3LOdNv8SHe8vH1fxefSk8GEffplyTVKtonww+8hS8Vig7/4Sp8dlTjaG4ru2?=
 =?us-ascii?Q?v/MO2Heixz3veJNMMSSa0uNFqS6VgboTsmsGzI1Aaq+tEj6/aRWnYw3sYGaz?=
 =?us-ascii?Q?h/AxQ5BVoURrvl6sUjb8fBFM6imkhWFuuzuoNkrX+joZssK66jAq6pMi2yY0?=
 =?us-ascii?Q?OK5vGuY22/bZyTmxLOFGicFIiHPnQ7KHc3APmbSqohNE7tdgPpEPODK5oQj7?=
 =?us-ascii?Q?0l9AQCMrf8wjlWndvEsdzSk18V+c8cRKW3Bv23xCxqlt8ORxZbB7Qk4mj42q?=
 =?us-ascii?Q?/lSKxBIQpR1x0o0wO/Nu7AHPIilnStW5g4HhCMfWmCDD68pSE+q2vKQLWdkQ?=
 =?us-ascii?Q?R0CGkGrUx3HjYttZaJJTSQQv7jAGpAozJDQtkjvSZdQwzjl24DBtebK0ApP4?=
 =?us-ascii?Q?ZO5NcBO2/HqzF6dNJryR6YRSHaAtNcu/jMMnOYps8rMYeh6mkjTP6SRa2Vvn?=
 =?us-ascii?Q?IklR4ADwsL8rIg60Q8mK8vO0tH0mlP+nw0SmEJh5kscWG8sbFQbhawlzSjpQ?=
 =?us-ascii?Q?EPbY30PbC0OpbvISWnjNelNK4tlaFNBy5kNdoiQFtuWEH1it+WYXwkmzWKDS?=
 =?us-ascii?Q?dYAv/UOxBrH6+ksibeteax0QXAJFtsvNru21IIXHqpefgNu3q0uqUec5MIgq?=
 =?us-ascii?Q?OnSAKuupSZTJb3ru2ysArXrUETwfggT1pilalwSPwuZ9LAt9Cg9p7J6sV2AF?=
 =?us-ascii?Q?QA5QlDkEqztQGkiVpFOqPDtNgbhEB6dDjPuM3wZj4f9gyJk7OU7aLisUQtX7?=
 =?us-ascii?Q?ATIgpjqkAu1RDoeBcrBeh2vBUbfM2zuP8MCO3r6aa40uLm82+yaMn93DdHHh?=
 =?us-ascii?Q?50UL2kIDMTLp6cUGK7jb+P0Lf2NCQGpHs0TSWzaw3hM2zT34UDRZuUHQ9Ntx?=
 =?us-ascii?Q?pMDZ23JtxLPHUh0RweLnOXtVRJaSIwc2BCF+cqzYuPsyndaSFPrHkXqPLJ9y?=
 =?us-ascii?Q?LF6/cY2pXhQhw9fhuy60kK1idOV50fmz9B404/H3HfKppoT5/w1iCaFq9V7q?=
 =?us-ascii?Q?T9eVHnKYZu4MYYtabdrSpCoSAh5EdjWKwI2g8Ob/Xgg/2Jcf7BqHfR8Y8b7v?=
 =?us-ascii?Q?A/vhtPv6A9W/pPEAvx3ERwk6Vwdn8zfAYSCCvf2qKUN+4tqJvkn+LQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ghg+x9FA6hMIU+u6dDuRfxtJY6LyCiwPgJYEwacauQOuucMWp2iFFquAUfed?=
 =?us-ascii?Q?FXPGpbiVxIGO37wwAK+HXfghaFTi6vrFsmlRK+/IES7fwuEkS11WvBS/+EUh?=
 =?us-ascii?Q?GpDO3V3s538s6vjPbsQsi8xdZ2ll7h4W2rIytk4ssDuYOCyFW38KpZvXlYe/?=
 =?us-ascii?Q?o8oSHvNOQ1iNVfuyDAjmdyzw9iX4Y09OfKh87VECVdpuQH6fPxLtOvYVfgVR?=
 =?us-ascii?Q?VUPAfZHaJe7bpyaZqbrX+GlpxnK3u+KtNGHBqMvbSs8tUUdFRrZtxqVwgnPW?=
 =?us-ascii?Q?o7eUodKoiZfBbxFNCTzM5fGNahTuBCijxtnoIBtxHqGFrPFlwYPEbF1/COPZ?=
 =?us-ascii?Q?5B1YSHcq4J9QgE4UJFtmliRtZUo+86z/ImF7C7hWOnjQUaVdMr4URzHGr3mE?=
 =?us-ascii?Q?1Nn5OJYCvRfH9FsgxgnZtlTotwEK8dN1GNSvixidxNG3yOJ/dAPFA56BjPFk?=
 =?us-ascii?Q?2unqkFCdsCQt64ahHpXELDS1RAZ3+QDO7tvhe08r7E4TcfnYdTUNVvV7L/pI?=
 =?us-ascii?Q?hGALG1x9nO1Tjyi+WbTjYpiSHWHLepNOf5fLXcNGenUN3GoyAvXSQ8YRJm++?=
 =?us-ascii?Q?muHZJeeXPUY2stUR+Wyc78yAsCJ1Jae/rqSGZsse2UECUEDQMwQRCSg2Nkb4?=
 =?us-ascii?Q?A/lOAkYkTf5XbT6Cu8UPp5LvdCD4/OuqbOgbR/BfSOXu5B/EZHnCOJ/MDMkY?=
 =?us-ascii?Q?hNNpscu7NwmUNINkJEmbszX0OpnKa2TVo5dV5lT6wMmfVo6t6hwKWPCs6bmK?=
 =?us-ascii?Q?gPIZ6A5sn+ftC9kgseEpRYNO0sZo5HEy0/K0MM3BnsyivizzvWEFIF0SRugF?=
 =?us-ascii?Q?6AVokWhIFTYbHAdPyEtkBMu8J3FZ4UtP24+RwDcGGrGkTF7gJpi5rTN7ckWU?=
 =?us-ascii?Q?Fj7mHY8ZPQbZEepVaGWGNqMlEBFMdQgCKhEUOFZ9ys78e0XuORVD0RMqGfgx?=
 =?us-ascii?Q?l3uXnbdVrVt6UTO5qDqhDae83bffxG/bTmB9iTiC3/mzozPCehWVIVRkQsFZ?=
 =?us-ascii?Q?TYuYR3nF57bmc00j1OmFCFCocRvm4oKfr19eRfArhTP3gIu6vmlqh4MYQs+P?=
 =?us-ascii?Q?8rLrINCtAsf4ZIIMw+aekr0N9aGJxdYFgrW0bYLoi12/r7Qu++K0hbnKtZOn?=
 =?us-ascii?Q?FQhdvEg5z/kdGD0w6EeZlGFJDf+pyalSiD68ce3SC0oWse3rPY/LPNuIyq/D?=
 =?us-ascii?Q?3VIUAGc0qcV1wKmf80YLQqb5ZV3SVzKtKKzhpQzm1APOpPYl9wEf0F3GE1lj?=
 =?us-ascii?Q?zR5sLHz5gLJ9Sw/uM8G5b6e8rY+aY8CfBdpzKu8V/1rykuz73lwKWTsF1Ll6?=
 =?us-ascii?Q?i3CxYXMEsNEXAfzryncq4TwFuiLyXAme9wFmDhWLTUNLURLf4PzRPQQ4urde?=
 =?us-ascii?Q?HKQ382lq/951cH7legumPP8CqhTrYieFhsnK8IekXal+Gy/Z2o8x+QQTqLzN?=
 =?us-ascii?Q?Lj2H7bpSFMLulcuufqxl9IfyHdM1xDkM07R57u9eofOBNXfktan37AzbMiTE?=
 =?us-ascii?Q?FvvWr33d8s9ZdFdUTML/CrI8C+HVw2U/oyD1XxnIYyzCoYSDdOPoV3aJnviN?=
 =?us-ascii?Q?69cd+8mR/FbppYRpfIcT8XyQVVz1qNlIhfnXWzfG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0910fc3e-90f4-4e75-246e-08ddc819ffc9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 05:46:54.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBRratMKlMP0Pbk9GgIjJ53jimAd5NWMWo3AMU4lhqIoe3Caf8RExg6Y3UOCH5Sg9iXZ4SmOibQf0iOhKGhNXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8924

On Wed, Jul 16, 2025 at 02:30:47PM -0700, Tanmay Shah wrote:
>AMD-Xilinx platform driver does not support iommu or recovery mechanism
>yet. Disable both features in platform driver.
>
>Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>---
> drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>index a51523456c6e..0ffd26a47685 100644
>--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>@@ -938,6 +938,8 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> 
> 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> 
>+	r5_rproc->recovery_disabled = true;

This does not block sysfs write if my understanding is correct.
recovery_store does not do any check. So even you set it to true,
user could still write sysfs to set to false.

>+	r5_rproc->has_iommu = false;

The default value should already be false. Is there a need to
set it to false?

Regards,
Peng

> 	r5_rproc->auto_boot = false;
> 	r5_core = r5_rproc->priv;
> 	r5_core->dev = cdev;
>-- 
>2.34.1
>

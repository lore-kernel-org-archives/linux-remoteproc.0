Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D223ABAB;
	Thu, 19 Jun 2025 07:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319033; cv=fail; b=fM0W+xDKVI6e2ya/mSSPQU3DNikugMtRQya6vAQsRXYXAZ1u17xTJayKMzRGScyghum47gj8RBf8MpQcR2HC0z8QItltzpt6cmXj5a1zvy1cqJqiq8MuchESh8DK5S69cXOlTcakoGipTo0NneQCv6il8PiVjaI3oTqQUzDLSl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319033; c=relaxed/simple;
	bh=5u/GqeIBD2GYlBJxNrztg7QPXwWc3zbaFTD/iO24eQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X6blq3yo0o8mwPeuOxOMsBqaXoWT6+V1urDsW/PJSh1U/eSMwxJoZImqrpUMf+33769gquGexLIpfCiprdyHC4pCOngiKQV/OesBzI45AanzDQZctwpVpJEXucoKa2DJav0MbmL4yWj1fCieO1IDjS9OzRvx+sde+WCd73oWihA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eV5z9HD3; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eV5z9HD3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cavST3NNGEoN9v5JRD1uIz4BbP4v4bdcGW31plQMewN+Xudv9kd+Y4k6A7eEOQwZw8/dNsIi0oh02bNKAxI2QgnNYjkeMfrXJeRN57Cho5iCFZGPuLgYAwZfK8LgwP2w8ccJHUHiNWhsLTtzdP+8JxM4amFWvRlN5hJFkAvXzFe8cmb0yWzuWHuzGmooeEu+zvG4zSyQE+wpL7P5DgjicR1dAma5vnbb1U8mlTOH+eIf1/ORJcdfUcc6xNB8WcGSESjtBBy5rzNQFbxsxlp3fov7WVQZo6OCVaIwTqDZrP73Xn02NTGQ9I7aKYszTPgU/a9jZfSaJOCRF0wDlN/UwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRvQiyDS1rBlFXj6bgga+V9EUN9ClWBnmwIHzKqWA5Y=;
 b=qeof32qPOXHN410//V7iN890azo2xeQD5ZDx6JqRiX7BZg3ieDG7+RrHnlAq90Hx3lGx86dEh7QGht7CGNAZXhc6qMWhqJSe/QorQlHrHy3K1XSUHwuknb3JTuNIeurX0GhVLc+q+QLyCZcV01gn9lOE+CtF45Cpsax6wKuAJXza37sOXH4nGoQbk75/HaBIfx3UBzj35nnDABCh27xs3h6iwFGQCBtVo8ujUdA1yW++7+xF5xvNm5acDzeTcLXRFYDrw8YF2qRFt3hT8x473ytG8aX/xQYQPxJl5iL8pcHv87s2Xj/B9COr2V6O69u8j2aWOHb3PaoizVabQDaWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRvQiyDS1rBlFXj6bgga+V9EUN9ClWBnmwIHzKqWA5Y=;
 b=eV5z9HD3CY+hCLnhkZOwRmlKB89xw+J5IKdlQQeXvOFJoRwACTqiyk+aC/hWVseeLaLlAq+L4zvbx4CcVCD1+0MbQZUrYJL3qXaSsDVTuIedPUdlfsAGOqgOaWa/PVKhuIz2DMlJ9cVpZ9Iw2Zd8xhcqBxSOjn2vd2gORtFHqccKHk53x/7XXo3j/wHWOtYqYoxO1/vg0JXQREnH+ykkuVtu+7ludtgk4nmwUbgD/9ZtTUZ+2TmgLK5DsIVYNhtjfbPdTzkGkaPOtk1jQMbbOG73PqvOSkFM0jzVYtwTEexjUbWXFXQcAFS6OPdRbbNChsbzAthEQAJqOqJflJ4Zig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB7138.eurprd04.prod.outlook.com (2603:10a6:208:19e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 07:43:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Thu, 19 Jun 2025
 07:43:48 +0000
Date: Thu, 19 Jun 2025 16:54:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/3] remoteproc: imx_rproc: Support i.MX95
Message-ID: <20250619085408.GB22452@nxa18884-linux>
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bdc37f-5b1d-4cca-2e41-08ddaf0506d7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XIyM3E2I6Zhk6CK1ceq+aUgJOU3/b1YOGOhxbPNPodvcl8SfiuKZQm6qBSoY?=
 =?us-ascii?Q?XzCFizMUEYgD/XANHHeyShkFBJprdflLAasgFDi9t6aDDGo01U5PU/u28X2Z?=
 =?us-ascii?Q?l0qTPov/YVNz9FbjVH+ukfvTOYjp2BMRj5UJqEFEZpeLtH1vjgrn9BeE9aZy?=
 =?us-ascii?Q?iHbYvAEI3ihemSMAoPiJSt7SVguT9YFLy0eaLZmIGE9AsCX+TEWO3WzQ9D/4?=
 =?us-ascii?Q?bZnlDhE9kMaoxzK5DkTv66EzjJXVuuPgqReyNBJDxSHt5nCa4aQAUxikC6u6?=
 =?us-ascii?Q?9PmLbki9UE7vN2hw+E4FYjJHgqO0sSE/z1PRcmqDLWRCWP50MCYT3VNJ+YvS?=
 =?us-ascii?Q?JNpxFk+HROUcq515+zfOOnLJHmY8g28RQuZAsUw/hQWVL/7x5B50e7V91N2H?=
 =?us-ascii?Q?ubg/lkmhmgphhV6DSkRnyqK9H7oxmSmXiIEZuIjChsF25lVYpJCoQ6xl+jSH?=
 =?us-ascii?Q?Gm67MX0a8UiRjIqKASC2A+mE0ktX37bX8hz/+jN+qZ7maQbADQC2ur2d1nU1?=
 =?us-ascii?Q?X3NwPZ669RGioakphnCQ+cKn3O7I/EJ/nNtGNQVcD1yz5PI5G6zVYoInUMYK?=
 =?us-ascii?Q?WDMwfzDzD3zWzyqgmLLX2/RiBSLh2y1R42QK4jDKLKzH02M6bPw+1yZ+THjV?=
 =?us-ascii?Q?UkzPWiUruAYJ7pJJIvUSrwWjKjqSsTb3K/tz5D8Wa6tRyph1fLUeH1KyLbZd?=
 =?us-ascii?Q?dtH9+0f6daLG+QtvrHnzjfcni7hs8bSvvEjEIJKLAD+3gLS5sgpVZMMei9p2?=
 =?us-ascii?Q?Ni/SugWaSA6xGpRYDZvHfeJNEFi53dkwfxYY47cIjDDkMpFzSNNPZWhfe2O9?=
 =?us-ascii?Q?C4t3GytcnpmYiHjvU/fORjjly+qu1oyB/e4koIa157lSaShnRYOuzyOrDSuQ?=
 =?us-ascii?Q?TtmPMd/6AxH5NjQo3pBw69YLYpM0uTCb9HlUQjn+dESqepmUDxp01zp8Jsuf?=
 =?us-ascii?Q?rbmsupPYII/Al2bsBomJaRcc5Nvz7g6DgT+HeHcGMklprEbFu97JO5EpSmfg?=
 =?us-ascii?Q?Hqu8mQIiE01KTQzT3lfismBrVnXTKFhkx+Kmw5y8LPlJ5ba2Pm1YUmzW+UAF?=
 =?us-ascii?Q?w6qxgOeAjGZDAGDb9Lpp/3abqm1C5agSr2IMqjPXTYKRu5/YrJJ8VtROj75Y?=
 =?us-ascii?Q?f1AJooJez8SjuHupqThe/hws9Tf0SPMebE8dtxQiS00LxuTucs5iLOREV+Dv?=
 =?us-ascii?Q?5hLltbxs5MzcCf8RFCeGhF+Hjs5+WFQEv/as3xhJ8DANVZxuM6yKv5xT7ksF?=
 =?us-ascii?Q?SkuJMdb620BItgkOR96MA/3GCfpb2K6BOo6mB7tPnFKZcvibfrVljsSQAPxS?=
 =?us-ascii?Q?HMiL9luZRyzCyNiipeCuRYj5A495/hKyRR3jLJaPCyAb2WbMolEjsa9xaSHr?=
 =?us-ascii?Q?6GNmvxTsS/tJccihiNe+LoeGMIvuywd6zHN2rGUJ/Bxw3vw1U2ve2rTSGtbx?=
 =?us-ascii?Q?yKsrx8Z/Dhf0jz4Gu7u6yHJA2/+3ycg2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sw0y/QB00TG6O5/v13Y7pWgkPxk+p4eR0rB5FmtkBD1D/Xxy0c2rn5IQfTpl?=
 =?us-ascii?Q?ns0jBnNE55gd+1OoCtnUswmcVsBMpMC1+HpryNtbKMJqi2xD/0TlbGjDLNwC?=
 =?us-ascii?Q?BTFECa6vHBVI+bPLoom92KPJKd0iszk9a7rT+dx0QGtB3UFqME+EU/l9kOR4?=
 =?us-ascii?Q?mCjHkhn3FM0kEuvK5pMrYbkOAL6q27tdBdU6qLzuDimKCPjkme4peuJSllKG?=
 =?us-ascii?Q?QU6suN2lKh3XYt4/ePAgCWeGBFpQeK8kF+ht/IuQxdvVzWgSIyxs+zuoV68e?=
 =?us-ascii?Q?B9mBjNf3tYvzL8HqQwcfEMC8XR8Uq7twqiU8FKFbwG3tqe8HwOF7jKEiVzST?=
 =?us-ascii?Q?xQyOtaHl9OBX5BwDe0dkMDJ6GCSNS/bwhetM3n55aC7FTJg9c1blQFJla55/?=
 =?us-ascii?Q?PU1RRRIH6OMhQQBzNpZiYWCU1975JeW4ktEoY1uYJrAMm/bZ7QjR5YyGADGf?=
 =?us-ascii?Q?xrNOFz6HPsF8rQHX/2oZiWAUz0JZnYVnCXGbowu1lu3evt9v/SdivQo0sxQe?=
 =?us-ascii?Q?+CP1O6KUHtCPblyzf7OTGbcdbJMwRCaZ91OwFwY+Wnft/D+EqwmnKRvs/R/p?=
 =?us-ascii?Q?bOrVrBSZGPQVrwtOytvqZiyuEwNS8onaA3QWvFjqd9bS4mf5rgMbJbrxtO4Z?=
 =?us-ascii?Q?H/GePZtey+ngEBIhWSYvYhuFu5CWSU12zAB4mBPe/CCzANPBt2veAnwSV8cc?=
 =?us-ascii?Q?zPLRwNZ0vngh/pJ4SCPpM5SME1EYhwkzWKTHPbBLBcAH+xQehISbJkY9lcVD?=
 =?us-ascii?Q?tW49Mjs14bjK6KlPGxjyWGcEo5B8+zXENJtR8VQRld/knvyCxuTO89vICmEL?=
 =?us-ascii?Q?BNyCQ5IthtPzKCLMsuEt5TWgIC0gnc1meOENX89iP/olZ1lCxGTgytpuzGy6?=
 =?us-ascii?Q?1KQWsPMJ5CTqXXMEw3wllr1b5rZBTDpA/E07Lm2tidob+xRX3ie1RA036Fhl?=
 =?us-ascii?Q?+ssf9eaAoNxSLKykQenWFt/dailm5Te6yPgQWdAS0QBL7eNWNtINnWofyXKr?=
 =?us-ascii?Q?uWowAghVkbhgwapiTmdCRCRLSwITxAKf/MB0u+qRs6TzctF2mlJhsI/q1oyY?=
 =?us-ascii?Q?dI2F9q18eGXvGbl4cVpfNCdy/QGuF9zf3EIb3OAsjyVe+YDqLjftZIEr7SIj?=
 =?us-ascii?Q?5ib3AY1eZCb8PT//dMtZh5lCsBxFPFBjUb4HyaIcgJQmHbHzHE1beZNgiiIr?=
 =?us-ascii?Q?1FcMUoAHEidMyUgmdHlMC07sjKq4HICywoNDiiBWE1DVqX1Rsxho9iUt5278?=
 =?us-ascii?Q?D+C0Gm6AxPuHlKBoU2WYHvDlqWLWv73oT/fu1fa3vf9oiUb/0ATMSWIitomC?=
 =?us-ascii?Q?wgMLZNbzSxfDokXRAxEQP81ZIKBtDaD+MWPiMrmZXf8B7fLNWLixPDYlJc1R?=
 =?us-ascii?Q?2R2aX7WvcwLUZZPc55ZFxKiWvwGwmzNg6L3e/tPtiAzoV2vT5VNm4y25zfGr?=
 =?us-ascii?Q?aNQYQ3isMa7L66kGeqvnYm76qElOS6uBbpZTvAwWkqYElxzYnK4uj4ZfM3yM?=
 =?us-ascii?Q?ZbtCW4nn9y0sbZHA3YgIx5o8xoTce7t+zVBCaQEOWPWMn+IOpm0t9ceZOKR5?=
 =?us-ascii?Q?WsY4zb9VKTq1TSCLbmpPmFOHkVZ3H4jVF0eu/JFq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bdc37f-5b1d-4cca-2e41-08ddaf0506d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:43:48.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AycxrMz2EZb7RHMzNg8F63xYK8nVafM5Ep6dYyHT1A9zVn12T4IAvAsdN/I6hdKCQje1E4T0/JTkV8AOeYczw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7138

On Fri, Jun 06, 2025 at 09:55:11AM +0800, Peng Fan (OSS) wrote:
>i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
>one Cortex-M7 core. The System Control Management Interface(SCMI)
>firmware runs on the M33 core. The i.MX95 SCMI firmware named System
>Manager(SM) includes vendor extension protocols, Logical Machine
>Management(LMM) protocol and CPU protocol and etc.

Ping..

Thanks,
Peng

>
>There are three cases for M7:
>(1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
>(2) M7 in a separate Logical Machine that Linux could control it using
>    LMM protocol
>(3) M7 runs in same Logical Machine as A55, so Linux could control it
>    using CPU protocol
>
>In patch 1, add fsl,lmm-id and fsl,cpu-id to indicate LM ID and CPU ID
>In patch 2, Use LMM and CPU protocol to manage M7. More info could be
>found in the patch commit log
>
>Current setup relies on pre-Linux software(U-Boot) to do
>M7 TCM ECC initialization. In future, we could add the support in Linux
>to decouple U-Boot and Linux.
>
>Patchset was tested with below boot images when the patchset based on next-20250526:
>imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
>imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
>imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
>imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
>
>Patchset is re-based on next-20250603.
>
>Thanks for Daniel helping review the patchset before posting out to list.
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Changes in v2:
>- Typo fix in patch 2 commit message
>- Move the m7 address mapping array from patch 2 to patch 3
>- Add R-b from Daniel to patch 3
>- Link to v1: https://lore.kernel.org/r/20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com
>
>---
>Peng Fan (3):
>      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>      remoteproc: imx_rproc: Add support for System Manager API
>      remoteproc: imx_rproc: Add support for i.MX95
>
> .../bindings/remoteproc/fsl,imx-rproc.yaml         |  27 ++++
> drivers/remoteproc/imx_rproc.c                     | 146 ++++++++++++++++++++-
> drivers/remoteproc/imx_rproc.h                     |   2 +
> 3 files changed, 173 insertions(+), 2 deletions(-)
>---
>base-commit: b79c044712e34fe49e7b85ffafd0bd460b5c4afa
>change-id: 20250525-imx95-rproc-1-20bb74ddc8af
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>

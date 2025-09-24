Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E978F43;
	Wed, 24 Sep 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758728112; cv=fail; b=XCJvH4jiKyTjuRlXysilMqH40azqkXn8CDS0ED671fDRWrCcCXOSw78AxcOruAZyKSWSxPhifXlrXeJ5gPBFLv0Gp9aKzR/hM7Bzi4oPmKqWSCJk1OarDEV+PQ8XsnlxILD/FqiyubNzsKm6gzoJkvvNrXAx8a+2gEtu1CAi+5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758728112; c=relaxed/simple;
	bh=kd/iH6n9nzFN6xySHuW8+Ap4cFk1MARaNcVWRy6DYsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BYBKxTwF0xkOYZ2kPtDDN4s1sNiei+CbODaH9HBhgoXwCb7w0/N0/vXQYrt4bBH2vr7MZ9VohmMNmSJLcZF63RkibmVNGwM8RA2+ruPSX7iN9VADvWdSWlPoqmrBybSDOQ+R/de4WA5PZNvrDVvorL1lsuq5tya/CZ7B8aXEr78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E3JevCyq; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E3JevCyq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnvssiBXu+iigG4FyXwh7nDmBDPRnaZTy84UN20IBUHqVWZSDojJmQZ0ynsEkzox7lQAqlHX7dyrjLMAcvRbPSsaYGVX+VyodJHOkdGs3HuDz6auUzQQV2GFFsRwgP0rpDvLzEUJhFWMSENoHiHyE1DK7S/3I40b1HbW1LawI34uhtJP9/WTMCa+c3FQtIA5OwLgudKpChz8cw7Gkk69JULnCUZ+NrRAzOYTLwpYrl9aEKHVh28pzmIXDXfOR6b+bCzHCJka2hhnCRh959/r5Iv2qZ+7q8nCDhICNhmxUQLyGvnmtokqciIbs0LTA2k4n9YPnvcQe/3yKtj+SFxZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy7QfNU/dr21B0GTzI1r5r6GPyFzbA3t4UoCGhN05Xs=;
 b=BGEcnh16DQdBAMCH9UNb/GEuiTDkKjUODxkWplJ/dleC6ysckvXcrBES3r5xj0W4g5ddsTHte6OKDzRplwBuMQJYOHwFmRE35/NnguO/gVNyOoyKNoFm7JOUuqzoPMnPH6Gc6OAKktacf9KwTsGTJ/Xcp7KDwTI2dzYBnnrZbzJbfLg13dt66wBJbC9Eb2cw4kXMBsPzes23rdLUqKz8oCsVje9+wIMsXkKeXS7Jgis/uIge9jC3jlcwb9OfnT53Bwr4f5qw5dw3EDSxWK8sDLnwopRV3TDXPf/fz3YAhRw5HEaDUU4pRgKK1W5EMbrmv8JD7kX9cdUmwhThn0v1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy7QfNU/dr21B0GTzI1r5r6GPyFzbA3t4UoCGhN05Xs=;
 b=E3JevCyqxeh9vTzjuZkcyFQfCI+wqoWIe2LzuHRYKW7C5k3xJegcpp1BQhVF67mmMJvhGsTLQrlmAI+7XyXCQkdzd+MG/1NRXjzMnWUD11y6kG6JjFNqC+rGX+35ZhX8E00bQ+3x0Jh/SnQ/UPpag+QWdidzO9zBdFWKZU2hG4G1/drGhtzphf2H3o1P8Y2+5tt/JgVudo8FaMQdyml1LUGSCgSCajvkS0/VOiQXJvK0vCEFPM1NfssSZrLgI/KTK9ejEbyuzGN6+/Tvb7I+CbD7azrtJvGuwUfRf64YwUd1sDtEZgg2nQP1b+KR1rOuUAHEDdRGEx8GR5vULVTmCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8740.eurprd04.prod.outlook.com (2603:10a6:20b:42d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 15:35:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 15:35:06 +0000
Date: Thu, 25 Sep 2025 00:46:50 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bff54d-06f1-4ab9-1aa2-08ddfb7ff027
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mNq8M3F9lQNFuisaGdZjLcy2otfKO9T5Bl9xm7piFPJ4k71+8MtI4+Sjl8zf?=
 =?us-ascii?Q?3lrNmlyjIVh09cenijw3euN+4XV6XiyaL2zN6pctZDc+SIeChELwX4UMb5cf?=
 =?us-ascii?Q?51YFrdfSYw7vezZ3e01IWT2zXrLwH/STHptZF3uJHqw3FaxQVyqSUpgm9Q6E?=
 =?us-ascii?Q?vyhA2vIhh3/QewsyMjekK+be/gefVOVsqSbHkFyW6GuQ+TFZzWsUwj5X7X+h?=
 =?us-ascii?Q?LEe+iC+QzmdoAO5yhd1X2ntXRFEbOFr2l6aNLdbJXzURhe5//+pDTKC0SG8T?=
 =?us-ascii?Q?3BBWtsjhHIvP/CenGxzYbJX7iwG81rboEbu9UWGXrgjOTBsXUniIzHeVcVru?=
 =?us-ascii?Q?znRCPrynLOVhoQ5PdgZzyK4Zcs7qk0I3pZiUQYm/mEpmmRg3ny+NvC4tO8rx?=
 =?us-ascii?Q?Xq+6r5J/MfGAO0geOibmCLBFio8d2InRUDKcrooYUoR72+/UHRDw0+BqfOcO?=
 =?us-ascii?Q?iadvOgbwtueXiLteaST798mmbEQUBLOqZzP6mVc1ZCAzjG5XJ+LMZPXoOvAJ?=
 =?us-ascii?Q?4BmUZ4R7MhdW+K2IPOFWxtgOaC+e68tU7xi/5lfkIUgmvYOAKqm+lug3fSKb?=
 =?us-ascii?Q?wGvEDmlVvGzJ95mGgDyrqQDkGd7R0LLH1XpSbJTWClKP/22dnox0fXVAoSoh?=
 =?us-ascii?Q?pvTIpOuL/xy6QYzkM3twxPzphFw6heu0YiK6EzKdOF3DHLO86CXbPKWrplHw?=
 =?us-ascii?Q?2wSpnsv15t9MBT+a7JHx56I16vkpoiI6N0KwdH8xJaY1vfW62PIbE0s+UeT3?=
 =?us-ascii?Q?UtNUyyp6aIOPUH2dfO6Z2zM1CZPh+zCn7xucV+fUJc04Vi4qJsBe0sJkefic?=
 =?us-ascii?Q?QX84/KSbnpApGcC3U1GGQ3s8tm0ryLBndBvHs6MVoO6MdT4QP3WQoh6GwgKx?=
 =?us-ascii?Q?H5ocGNniZBI7a5e09qxifAnLzdGxHLi8qQ5eQo10kZHohguGPmMOtnCixTuQ?=
 =?us-ascii?Q?iHbuvUtzIuIo3+iT0pwK0kMlMRbLzlVqILa1x8E+GGPBTcwTjUbBP0aAx2i9?=
 =?us-ascii?Q?iaI4bDCSr8AvWxgc6vTITRj25HD8lPP3zNmrItSBOX2bt1U8s+f/UUhtE97G?=
 =?us-ascii?Q?4tcmuhTQhYcmMcQzcVqdOY8Jpv7el89zRhfk6dtgDp4hmGDntD1F7klVAdZE?=
 =?us-ascii?Q?UJwPOh7tYvc5yMzMsSAwSBa5zdC/XAXcwRgEWasQTF6qKd+Zypqd3MM89GJT?=
 =?us-ascii?Q?ibtX12R3A19bmS9Maiv3nvFivQ+t7QWWwyRo69JMXKqfcXXeBMN2qimc9Egw?=
 =?us-ascii?Q?GEP6RZ24qb/v78SYiCADBVtql9nsxcxxoZ6Pe1zvupuiTSlyvcQaUPh40saX?=
 =?us-ascii?Q?nOyWTxx5ZfRzfmqwlp6UrnsM6qnPoY9ZsobfsHAKclZMQDFo4qEhxXs8t7KR?=
 =?us-ascii?Q?fetWPU59dGvcECyoQo4OVpSeuRlRm++QqSnw3PO7SLHTP95t1yGflLFo403A?=
 =?us-ascii?Q?AOB3+p+Nb1Q3gqBEpI5ncG2APp2HzNXj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JlrRdA8neejy4S+sb/esQW31Yd7cKdxdg2tN8kyBVFVuG8lQsLwS2Osw0rc6?=
 =?us-ascii?Q?zmGlC70oRh2kcUVm3n74t3ad8BtQs9ywoNLjcZLxuruFjAo5pvHY3AdxduDA?=
 =?us-ascii?Q?wAr8wF8NUN7DlfwqQ94o6PJsHgoFKl0HmhF/Jwb3oRyC7bGVG8KhkYTHyuJM?=
 =?us-ascii?Q?O/XwsCjHSSkoG1G3EeIYYYWeSKnsP1I2dtBCW9xtwYlPNYki6jh7jYWE/tHh?=
 =?us-ascii?Q?PId/OPnX78sBmjC3wlFLUrdBaJOXxoGGHJYdiYxt6XhgZ0HZCYIuAjMhgVyy?=
 =?us-ascii?Q?y0mOBN/xECOhOZSTG9u2agS5k8zLDctraUAanLaxP8TyMX1CiiNPx3sq0lR4?=
 =?us-ascii?Q?gVyqH+RtIqrn57VPBz3aE1kfD/DtVN7nMOPypvvh6IVgYJOZbMJTFCfpXE4z?=
 =?us-ascii?Q?QJO6JLQw+5zigjXnY4PxGSnGvGygVXRcmnFgGVMvCngBtFwFRYA6rPUOvEK+?=
 =?us-ascii?Q?PGvJORiccwkMheyad1bv8JGuQp197pY4VmXjaW+9mmkwa+LgfLUDVUDa/vLq?=
 =?us-ascii?Q?3OLy5GBV4fndWalcHJGIPIvpnMjezZYhD8K7/AFgDVZCBJS5LmO0RF6VA/Zb?=
 =?us-ascii?Q?K2ozx4QCri0hs9vDdgDJEwd2A9hT3JbsGEBB7RZvM2pgIHtqd2ve2rxAfSFF?=
 =?us-ascii?Q?ZmILkoLiay/dT6Wuhyc5pbLbUvMnzHyVIEeOrbMMwaHmcPQrHrWkkTXRW85n?=
 =?us-ascii?Q?4zjGXQuDkJGMljg3X+gy+lf6HNFoNAkOsrZzvLe1GyCjCiA5Y8af+y+PWMY+?=
 =?us-ascii?Q?GNlBoqh7O5k8b/ODIi4+1xN5c+kLTOq6aF5HurtEzLluIXkLVkryjud7yH5q?=
 =?us-ascii?Q?sRSScF5E2QehSd8a3Hkw/191fMtCGDEjW9ASkHxcecwzMLkbjeYmUZWj4qpX?=
 =?us-ascii?Q?N1dfcmfimkqc1AjH7ey6ekl5vQAqAJAXxz1+mOLapZEBmwqpG5N1FNN3oC5p?=
 =?us-ascii?Q?3m/Z+IiSVAfQ1h7+gyGe+aL311KbY7oyMCKZRK87IWg/tehOf2wDi3QcO99s?=
 =?us-ascii?Q?eWN9DXPAZPA02K38SBtKlEofsOP8V2YYXZFWSk+8DjbbVm6iYcx0YR/CQpAD?=
 =?us-ascii?Q?Iq7vq7kIj4qDwqxm5P3KO1heCYmILIiJDk7vG6HfQmA/11MGi9O+2rtYuXQE?=
 =?us-ascii?Q?20QeQYEOLRBNzX3rBOGeBGggwdNcGGBD2Q4JoDluDB7NUsQLHsgpMA11EV7M?=
 =?us-ascii?Q?5gP90nlyyo2XoauRjzhDEbHze1Fvr+Ew5kxQGgJvSnMoVbyV97EkKUU1tZfd?=
 =?us-ascii?Q?ObBFsvlAs5o4p4afOK3EKJgRgqlj7FzqNtYY4eNfW9Qm1B/8J+dPrABXxC9W?=
 =?us-ascii?Q?mYpXIbPywrPmoZX/IvQGPzq9tRI6eer3DumWuvd1CQxYOwJF3yyMQsXRDOdq?=
 =?us-ascii?Q?a9rdsxaEdgixdFavtnonnVCgLeAXICPPmsbr7vtIfRLcGj7Q1kja5WNY/PQe?=
 =?us-ascii?Q?LEOnpiH5UnxttZoXBQF7hHLttBPAZbqMjA1ZDy/Ry83F8RE8SDktQo7TIjmg?=
 =?us-ascii?Q?oUD3ja6RDrxU4Pn/AOgu2l6Xy9bcHFY4eGYfHojjC5i+Lz9UfEPGOWdabrD6?=
 =?us-ascii?Q?1ok1GZC65R422V9I30NHnZQl1cuQlTJ2W189Z0lz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bff54d-06f1-4ab9-1aa2-08ddfb7ff027
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:35:06.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKJmzsp+1XPIiyKSku0nzQsTYhgVx72Et0nQNLmyeh7qPC0FkNc1XDiEr6XgAYvG8rVRhN0Ex8FX+w188iFN9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8740

Hi Mathieu, Bjorn

On Tue, Sep 23, 2025 at 01:16:32PM +0800, Peng Fan wrote:
>This is the 2nd series to cleanup the driver.
>
>---
>Changes in v2:
>- Address a build warning in patch 4/6
>- Add R-b from Frank and Daniel
>- Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com
>
>---
>Peng Fan (6):
>      remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling
>      remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
>      remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
>      remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
>      remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
>      remoteproc: imx_rproc: Use devm_rproc_add() helper


Sorry for early ping - I just wanted to check if there's any chance for this
patchset to be included in 6.18, along with the other cleanup patchset [1].

Both patchsets have received Reviewed-by tags, have been tested, and
successfully passed builds (arm64 gcc) with each patch applied incrementally.

[1] https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/T/#ma16bb8a38300f6eb333ee04f00d57805aee3c114

Thanks
Peng

>
> drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
> 1 file changed, 57 insertions(+), 71 deletions(-)
>---
>base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
>change-id: 20250916-imx_rproc_c2-2b9ad7882f4d
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>

Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A934D2673A1;
	Tue, 18 Feb 2025 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739887474; cv=fail; b=DwtN9uFhEUI5JfsjzL4IieLXx/2n4E4vUOFXZhVwU1tr5V+yDWWdmyCbLhTT9LQznNh0pdxBwdLA2RBY8zUA6pcuY8M+232jzvkSCy3yxjENrA0U9z4LzJKcLJ70kwxnT54LEGzLHQ4tMjGqLPvv5mURxIUywCUvloGok8u4/cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739887474; c=relaxed/simple;
	bh=r7Ol/5t1zoH/g2A831da5TKexJ2TDiQNYs7bEmVPLZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g2GaWiRWiSofCcbxQIcqEb8eilnSkohuglCXif6nWO0EYkB4p4gOh2JRMZajxpV9dsVK1QHGR4MR0WRE65iLYqyaRVE/OnXXbHhTIU+lYVf3Se3Kibff5yFBfkYizwYsdx0tWEI66cI4Dk/smU8BZ+8YcpX2fI3kRAPVWEdUXfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lJPPMAg8; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lJPPMAg8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoANLI6xoX6Xica1fCnJqwYQp07deN259i0rAcglSLDnafJP+Ho/nXetuv4E3qTU7fjFpgVI/03oMtRGy1ix3+/iZCx//67j/YDfz6LI5rAN33k7bStL4dlDxMSFMQ3+Lol/f9gmZvElb3m1Ogic3zuWF1Yio93gzoe696jMD/n460JALH/LJMK1sphzYzFTfkWiEd+BAZIQEs+dNCYXSsWcEHtt5mTwZEuFUgJzoXZxIFByaqVFd8nJDcg8yyrvOfcnyT5LofdsefjGDk15CZWgxfr2pqUsllqWBLXdn6kk3PSEzobobcCtGa0ytuZXG3rKC1ydk+nrEoO5ZEefEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP4BJQpa8cQMOgDk2kLNoVkFiq95UsayiMUHPOGpZdg=;
 b=MwAHos7V6nl2XBJOh2hm6dE6XLn3WiXoY/jIGVadlGPXyFvkN8A5TX0Nf6pc20BgxkMJIQh9d1XSkRCOqmF20FgUQkT4EQRDZVQyy+/q0if/WAFI/BCvNqARj6XNz32ddDLOXU1I9lT05UI+fuZK0en83olPssvwajAYN4Pe2rV6hHguun5i0cszHRXagL26hjcFC28xAZK1D/WcDkFdjqnOMn5lGRuh9vHEqHtaEQdA7sttcamLaeHSfEjxb8u1ii1oRfM/6hKIh+reL8HhUGwpGywu7b/6+qqf346I4KRSe3BRJuWEBuQQ/YXrneyKPVkRuAQX49/Gdno5v8T+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP4BJQpa8cQMOgDk2kLNoVkFiq95UsayiMUHPOGpZdg=;
 b=lJPPMAg8WfEQfSJYYBW9nbBk4SFeOz7rRg3+b+mud8SKNBZIbQabPSlIW9SEzbKitf7bpyAH6vn4jJaMAMDBtLJFXgquFFcy7IXuPABlxrUpsa+hKxhOAaEm4a83vz4trhKgThmQSzEXED1zOjFQOXByQoEArbAQLK5nNMe74bLWGTaNPjUdyGg3B5R032xYYq/AJWVSeVbQ6RUVASNGIEVzHd6JidwkyjgLPtTlJOuH9fxRtCAXngt9+uqq2lchTHLt+Rmr6QIZUjtWh9uIoaO2NrZDpX3UfOm0h9nciSTFz0TScB6s/j677vibEVOR+UkYmdkaGmI4jXHjOkvFqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAXPR04MB8078.eurprd04.prod.outlook.com (2603:10a6:102:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 14:04:24 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 14:04:24 +0000
Date: Tue, 18 Feb 2025 23:11:27 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com,
	krzk@kernel.org
Subject: Re: [PATCH 3/5] reset: imx8mp-audiomix: Introduce active_low
 configuration option
Message-ID: <20250218151127.GB6537@nxa18884-linux>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-4-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-4-daniel.baluta@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG3P274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::17)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAXPR04MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2aac95-ef76-4518-8886-08dd5025265d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qs7Iv42QLzb3t1KVjka1CLzkThSfrG8SaH8DAuGgbhaxjkXT9tqWub8Xj3lx?=
 =?us-ascii?Q?zRxuyVNlygORhbdXt5tuQ9zaeIHUMz/IdCjiEHyBys7W1IPKChH3BwVbrnl8?=
 =?us-ascii?Q?1HrfWlFmREzY+hh1UsDBLjEpvMbhX9ecMuIPxeZpy4Gy5Mmq4z5DbJRkSrDm?=
 =?us-ascii?Q?nWeywdOSxafdtYbq6bcAecz9iggeSm2sLSz+ydfuq9iFAGkozCf5ExbJLMD+?=
 =?us-ascii?Q?KLF2oB5+uZ2PCjK5NHuasE3ZG/nqKRDbTJZHMsTNTsExJW4ygLPtv67zD4Mr?=
 =?us-ascii?Q?e2QK5YQ8WUEtyljmWvInLhKhEDo3QeMopswIy5+5ZqevME0Qr+lCkAMOXDr/?=
 =?us-ascii?Q?J4lkWCDl/qnUtCC76GiHFfEhwK3zNgKjLrS+qqNvNIqIgXjRimNngPIOf+cF?=
 =?us-ascii?Q?HG4pip7pK3ZZCspgQlkzpDynXcQx14oh4v9Sbm3ezBeVIFStiyWhzuxTm/1y?=
 =?us-ascii?Q?BJIILmq+DC7P8gUAvQySv41JsUdj+oMAEWD5y7dRZ3g6p8pfPSmiEkh8kSGE?=
 =?us-ascii?Q?bmgtlTT0GqFhx0ZLV+TKPqMEdksFrltSYkitfPV2gBdhX4+ARSalHbMgw2Ht?=
 =?us-ascii?Q?BTdYWatH4wAUsPiLRw8BxFwTbwpnU1kXCgb2LkPhk5CqvZbMEmEvgkU/DflW?=
 =?us-ascii?Q?kVhpWKxp3RNuLdn5d6gJOm9q2L8wXoQawoZisNca5oKf6Z6+lGNoeQ7OF4Ti?=
 =?us-ascii?Q?+dTuEgKY/LfjL6jCfRP1CESQ1GgVgIFBNpoJXKH2lcLDDbWlHJR7r4ikbiky?=
 =?us-ascii?Q?5fGeBJxvkCzR3dpB9gMBwrCFD42uRz3BCJNMZCSTU4l2JlaCtMiMKAe3YJSc?=
 =?us-ascii?Q?mKWeX+3sjM0l4KRSAOZL0tTFeVcrFhF/hGGr5fmsJwfLxVYoop/78jcPWx86?=
 =?us-ascii?Q?P3w6w7sSq6Sk8+DNI2QY5NxOQ918Vv+c7mbVSHNKlxlphxHJS2vsJI1T4OkE?=
 =?us-ascii?Q?3kZG0st5loIit19DNNQ4CPZXePWqfR93oKmttLWUR2qOHfF9jrDkoCLylcF+?=
 =?us-ascii?Q?C4PAMQOmg2wZlQuEdNjevwuqClaTqAHWOxppe8ZCZrA5AVY1DZlPo8+3OoRY?=
 =?us-ascii?Q?hHf8ySBnjaag8Td6OsbK6N22aQPNQIyM8sZd2cnkGtGl8aa/n+bPQfzyOkEA?=
 =?us-ascii?Q?uDNDG6tLqdSfeN0Mv6jiznjeFh9MiBqm+NZiWbvU+YLGpD/g3MEXgBhMkTVG?=
 =?us-ascii?Q?iC8ZCGA2A2QWVUitHKSsXsMyyx51FfAq2Zsm3cJsYDcoiBOuhgTPFBjCbynC?=
 =?us-ascii?Q?Hegcs2P7+p57kHpBKsoGXDKqAB/nX3Y04jgw5sfwx+VB1cX4rVVSJq4NWCJE?=
 =?us-ascii?Q?fI4o9K9z/avN9HlrU+l5+7/JQUjhHYmrh8yKInF4eZ0zdW/l8ysqeTzNq8Xt?=
 =?us-ascii?Q?Yq8Mhr7SRQ4sqHXYjedKneOQeU+3fjscJPfmY7FfZvpOO3cLnXF0E4mn39PX?=
 =?us-ascii?Q?pLXGWObMQxYLOw4yzByRRMEEfMvsgaDB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eqozCNmn6hWccnb/Lg0bpYmufP0UfSyNkYiPr0rLgTTnpmMTMSuZ81izz2ZZ?=
 =?us-ascii?Q?x+7OWRap6J0yWdyhrhoNUc/ipWZF0kodjpXGloFpGizQXmDGiu+4uvzT3dU0?=
 =?us-ascii?Q?RVJYrMuh9kEKRkYKs19g7uQSdKizGFrH27yt/JwLbIMDgPiHXtV7tvuAgj4E?=
 =?us-ascii?Q?G5ZqeGUGy3Xoxq1tsRZxjT1GuzaEEKHySEYkgvyim+sGooOEx8+1mPPksuIv?=
 =?us-ascii?Q?JMGl6pNCbfVX6Sclk+N4boie/nibiCDDgvGv1tIs8MxmF4zdkdoC92eoxxCk?=
 =?us-ascii?Q?JYp11MNUdX/anwKeq5MrNRPBJjJ+pBgAgNCHa8C8SGSTg4MQ3yXR4TS+fXz1?=
 =?us-ascii?Q?dWdqIzrRyWjwR05OeKmg4vX1LDuTYGoAfgnmWiDJxVRZjuFnTRPEZa+aUpwT?=
 =?us-ascii?Q?jlKh8h5HnPKd6/NH1HUmFsO5s+MZk4amK/Ec/9QZkUo0pusmSKkaQUSWSixs?=
 =?us-ascii?Q?0iN2J2rQXGg/Fj4R1d9oylS5SnrmCB2xou9bsc3kAg3QvlZReQPpM2dQl2nd?=
 =?us-ascii?Q?6Q24d/H+I9q2P1hiyJW3RTE1N5crkCVS3Ms1yVe0sF+O3PdbhM9lyZDS7PHw?=
 =?us-ascii?Q?VyMEtVBq+lwMWUsrn911Qyxc5YG1ZnG0/wzFd2V4ilvk6yq8iTuYYvkDmrgg?=
 =?us-ascii?Q?sdrW8F71J9jFlibJlVm5BfHhO3nsZU6J46ZDfSZJeGj/PKR/B1vdXYD7Ixe9?=
 =?us-ascii?Q?ohf0hSsz6152/V0TYABcRhu9nAK4NGjsnXJlmsAkZkuNqxZzNuBBikE+rLF4?=
 =?us-ascii?Q?lWe70WYEH0PhwRr525agE24+RZRdTId7IEzmMiodOWO2yw4en9YXTavir1Pe?=
 =?us-ascii?Q?44xowTsehVk8h1iE7kJWJWdggVzrXTVjHMDRO01htORv6tj7Oj6y0xF8m/M9?=
 =?us-ascii?Q?OnLKPLYY+jAxRha7J5JGEkjl/J3uDK+YbsTlKzvF09MH5l6+hYZgkXSwVFe0?=
 =?us-ascii?Q?NpL/FNxmi4BZbrnpApMo+XvN4okjKRZVyFUKqB0uScD16NX7vzV81FfUaOS3?=
 =?us-ascii?Q?geHuwOzs1V+jvMJpNHizdp6e4xo9Tn24Vb4B6tMZoPvnsclbPrdWsr1dh0ja?=
 =?us-ascii?Q?WgwBsN4xAGLyQZEZO/JEfVta3jHOu1XK2wnnWWVTFNPSNUpvODiNE+9hq/km?=
 =?us-ascii?Q?yXCyagvzRJTq/RUyF4vciKl7WR007luDh+O7CzqOaNqtSJSi7aG8T5XnI5/9?=
 =?us-ascii?Q?SoGZkMKpcJA0lHHkO9f9hy2+UiKANVhg5v9GZ4ek3O6kvbi5Ylor2d+7Qxgw?=
 =?us-ascii?Q?TX+q/4lasoImzzw88NnS7sDIqO3ct7d/p6FsZcypAeO5qanFeRHjJgCGj2MN?=
 =?us-ascii?Q?mAPk3z/oMPd1ahDzLZmMiucWJIO2FLqDexs01FFPA3CHFezlc+hpAx7GC3b9?=
 =?us-ascii?Q?gHq83GYE3V8RGJX7M6HYG18NagvFwLfPnGXaLOIlaRoktnDvs4ABFjMCq5Zr?=
 =?us-ascii?Q?0hGd/SDeL/ho31EM6zsY6H8MVzQMu6Hp6rqYroBNENW2/X6Ko72LWehSrC2s?=
 =?us-ascii?Q?73viYU6uChvrwjGdrRL4T5P4aAfEGXwjII/ZTxZD0y0qUd//pLMdIRMbEyIV?=
 =?us-ascii?Q?IXMY+ULcBg5uJfN47nl0sfGzaaPoclmM+jPtGl9o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2aac95-ef76-4518-8886-08dd5025265d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 14:04:24.6540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9LlZk7mPhTX7ko9lGDdnGH8ROPAtEL4PbOJsqdhtHcTLa3SC07w48AO5nMXE59NGy8z4ZkSbuePL6VKyD4kCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8078

On Tue, Feb 18, 2025 at 10:57:10AM +0200, Daniel Baluta wrote:
>For EARC and EARC PHY the reset happens when clearing the reset bits.
>Refactor assert/deassert function in order to take into account
>the active_low configuratin option.
>
>Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>---
> drivers/reset/reset-imx8mp-audiomix.c | 45 ++++++++++++++-------------
> 1 file changed, 23 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>index 6b1666c4e069..8cc0a6b58cbc 100644
>--- a/drivers/reset/reset-imx8mp-audiomix.c
>+++ b/drivers/reset/reset-imx8mp-audiomix.c
>@@ -23,16 +23,19 @@
> struct imx8mp_reset_map {
> 	unsigned int offset;
> 	unsigned int mask;
>+	bool active_low;

How about using u32 flags?
Then it will be easy to extend to add new FLAG in future in case.

If you tend to use bool, also ok to me:

Reviewed-by: Peng Fan <peng.fan@nxp.com>


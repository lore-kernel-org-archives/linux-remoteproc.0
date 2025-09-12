Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2449238D54;
	Fri, 12 Sep 2025 05:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757653205; cv=fail; b=qclkTXaaTUq4UdTiKVFIfsPNjgUmnd0GufyMLyQ5diWsrnNhYRjEcNS/YUh7WWv6d4WjoKDyQR6Phc6JQ+pe208BrH15XjWncop/HOQAfy251OGlk6xvGblDD818M4QJCcaaj9ga6OW9+ic+Ay+DkWvYXDY0pcgjtlbumdAAhy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757653205; c=relaxed/simple;
	bh=vFAuyJaLoNKhPGFl2vGV132nibwONe/8Bg1H2I3QLAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UGcFiWrANc6gI+fZ5VdmtO8YNvN5VNxhYFuIWITeyPz+Pa37tAcjIRHLyUY+F7wjQEpa1dxofP973XAZklOYTLwq8oq8CNwE15uEvJrBP9NCzS7NXqkMA4c+i2tTgLzWXLwKiBTAxcv9N9n017+PGgXNdyu5GUWuMWHIZ3sG394=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DRLXSpvf; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DRLXSpvf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqkCnrO+T7njEFNEmdyzOgekWaAZSxH2UPgJeQupkr+FCFt0m9yusxCqkDjc4973z+I7ESinDJvLqX0FqpvfJmcC3Ojyt805B1Vy/Gm35gaUrfnS8OTi980tnH57K6aF7XKKDe5Hu+XteW/FdbhAKye3J0fsxKzNDri1l4Hk66tf08I1wIgyl7fk4ENljpwTUMUau4MSyrB4US+9v0mu9hkvqLFiot4v4ncEKmVZvh0dPc+4ZMFsaZWpTR4DPrzM2CXPytPluYlW6AGShIw2TzEcmO0yV8yPWnoaX4AZ9h1moGk6T/zoG8Ej0zsJ8xLEz2hOyzmqfyluwGZC4zWujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfWjbX9muQ/QfiOVxmiYUgB+1ry+Ix4xk7wSPOIA/0Y=;
 b=Db9xQ1LzIrw1XwUKYbrMfMrtrEC73VcmH4t8ZUDTrnLQaqUaWFwivVHzkO2YfaFVsllKdP+IvddrSY/ohsK7MR796FBd/HJNWQrs5V7tZdF8VIhbfhwnp0Evhd+XmvcoBR4Q6TFJMiD5ud5xDG4oo7GojAOZ7mgDRzAOJHtmUvYtKmCmCb6JKVC29rn2vJC4JTT3tTA0dcvohfXf2Urkm6eAP07uqsCBkLUB2fnPjAsi/Tg9FqwOMLhGqwuOUmdI1+NDr74BPePG7l38dY1u51zKFpTd7IVONYUMNXL+EBmDE1dSaIld+0tuv+tpI1thR7UpQ19ekHg4GdQs89Qxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfWjbX9muQ/QfiOVxmiYUgB+1ry+Ix4xk7wSPOIA/0Y=;
 b=DRLXSpvfmOMCT4Z0mJWHQyWoufrGIw/A/OpHQ00uYXWrwJDMYKiSPuNEGuxXUO+k42Kjd3mg8UrV7DdnmN2pizh4gPi9mOng5b2PNS+5tS/Owl4f+6g4ELCKvYRyRgOjn8yycLsQox4QHkzX7DPVzZRPoePnWJjiqvI/O15SwHuz5F4PxEiNQSHOhpjNYZ/Sq6je3jVIeksehx9DXkzeC9HJQdk/0vE4UBATSsV3zgj0r6ynrQdch4aYMv0HF9TMGFETn0mQ0DdALOZvOWInNyQldcUk38lBn8EPvhXGLnTOnVOfFAZzmQ73VuVU663rSdTyYU/i/ponejhNY3K6+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB7075.eurprd04.prod.outlook.com (2603:10a6:208:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Fri, 12 Sep
 2025 05:00:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Fri, 12 Sep 2025
 05:00:00 +0000
Date: Fri, 12 Sep 2025 14:11:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
 <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: d04c8031-d88b-4525-d7ec-08ddf1b93a0d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+X2/OpNUdrJ2t5EVyAx2d42MXMH0Gp5y0qiaKrF9EzieB7gjVI8h8ePqMDGN?=
 =?us-ascii?Q?GhUWD4hrszP1qzpu79/2trokcLM5MQVxxtbTzB2dgSK+nnJ/LX0iRCLUGGLA?=
 =?us-ascii?Q?OlEf1RJ+8DtXGqDaNB4H1RqhpRnMd3B1cBNB0LBC71oyJe4Q4p9X6ctFJ/eq?=
 =?us-ascii?Q?1Auk48HUiMfJ6/p2Zbd367A5dH3RcOlZeAMM6tJw5vAE7yG6Tx71oVyy9hel?=
 =?us-ascii?Q?R/c3RhKnLIxwUH2pZb86aDA4nINThozSmpsSmllrrdRoIpRgJYf9DpAIAAY4?=
 =?us-ascii?Q?6kfgOjiEWlmHDapcTQbQxWIZPxG2p1ExWcvLJpZ5tI/zSVPpX4kCqfYVFswv?=
 =?us-ascii?Q?3QN0wxy7r9u9D7lUQHiaM/tyLo0eZqnPU1XmKVE24/q7k37pFTpcx8HrSujs?=
 =?us-ascii?Q?11lTFZCpQpddxqoqjcWXYkgjLQKGpY57+NqH8aagdK2uYv36kQv7vj9rco8Y?=
 =?us-ascii?Q?uinz/Foz2XsfZ8TmaVDscIX/KjNwuymHBDaTjwKNxK5sVlwAXHPD87Apf4nM?=
 =?us-ascii?Q?Ydqy+J8hJmnONu3QvxT3aiBsr896h682WziSmVqZPBWQmJrYpXGCnWUPQ6aW?=
 =?us-ascii?Q?h7djQXP5z26Rb16U8+PXZjCBMrbH6haDSqJv01J8iVXqLVObFNqAOuUxhJk5?=
 =?us-ascii?Q?naFL70LfVi847hPNqb7Rxhdiw4ie4N/xzCFQQxo67C1wckvFmJ1ReBoCYkfc?=
 =?us-ascii?Q?7gNvp6TaZ6VkippfjHnAONZTlshAd9q5t5O/jqSLCxrHpxcnrtAU/HG2hlg4?=
 =?us-ascii?Q?eg8HxxvGegDkAwzedP3J5XmIdngNTgQ8nP+BhXcc/G2eSvHvK8S1owiWts/A?=
 =?us-ascii?Q?3KLIlY0qrU3643YQXDakyBGKRv+mz40Vy7RQpnVW2QWoZpHlfGKnJ2I7nHhd?=
 =?us-ascii?Q?eCjMVhh2tuBtcsfy/CR0JCL4mH3YddDOh8j2+SQQiSUJq8jR/7OSbyzgVVbF?=
 =?us-ascii?Q?cAuMAah3J6FTjioWohb3yqKKm656BtySX6XOZUbNq12lE0dDlTQIWRVt1zmZ?=
 =?us-ascii?Q?ANIAf9H6iXIG+6sBYuB0RiwvMDfM88VhUl8JYsxqadyPYQluz49q4DaIxtid?=
 =?us-ascii?Q?whEn4R+WUJLHDqp13KUL0IwJQkE+uDVgbbJ+ZxJMTXNZJ6qq5CW2WD5KKWV8?=
 =?us-ascii?Q?EBWKhpd1ZCbABOMci9k5zK7OamTAXKZqvZKJ+sFLWvts4DBiQbC6Z7zRoWe5?=
 =?us-ascii?Q?bB/I5+VwSMQDkUR+F37U2UDlJP9BsiMrIiusHitKNkcT+Cq5K+e739th9ZYC?=
 =?us-ascii?Q?TMZ6Y/h40iHZzfrXbopJP4/jXGFfelMjdgEh5W08N2PC+DIkB91lfq8bdaPE?=
 =?us-ascii?Q?r6hvlipq+053snIvraHHnGkTJr8sIF6lCyVeLQlQFhyZrQXcjMzkadF377lc?=
 =?us-ascii?Q?ZvhLAtPrKteMJaD4N2siFJVgUktubQBKArTx29mzMZUM72+1m3ulKp4r1CX/?=
 =?us-ascii?Q?uwFRS2glNLwK0S6sep/nQ4QkNQZQEImae1tKGnADTqRqm6Hb6A6AkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EOBWlCg1FZm3R18lRVlHlkurE8D4BzVujyuBnkjSD6lz40EK1+hS7YE/r4xe?=
 =?us-ascii?Q?8mT9dqgdOVlMwWst41sksFxb4CdNkF+xSOaSikc5/6ryV7hyolJjWSjTZY/A?=
 =?us-ascii?Q?KZNFnbFzwVl9eX6bCPRJ138kguoBY4JKBCl1FXw1CSpQb/d4hagjK/Vm5srk?=
 =?us-ascii?Q?oOG5OS3ix6uSs9o7gRzTfNUqP167XD29nyKwVYp3D4xzZQaD3qzgSk70IzJF?=
 =?us-ascii?Q?ODgMVUmfBr4q3tLJ9ih+YhnsQFG14dfqHB3ArGRvqA/sSL7v7/T2/gLxDAOw?=
 =?us-ascii?Q?HpvsGVR1ZiswN+VyZCQLFPAFqG8B/S3JmUnHc4OsEbNg4r2uyQ8SABI4fU2i?=
 =?us-ascii?Q?fEWWSaayqizdh+/kdizY6EKqfqJ8DHkdm2YdVCCr8c5xbWmXAZOaeR2ii9oP?=
 =?us-ascii?Q?j72jzwFkthoQkKcFJwLt06bcjEzYpl2+mYpVLMru2DsE7pjMQet4oUv8am/e?=
 =?us-ascii?Q?JcljiDvq0TNK2mMenpf6m/zs7LnMFWALokDAlYVxM5MdNtCQ2+Lr+4JdyorA?=
 =?us-ascii?Q?T0O+XsRemVsnpO+GHEKiwi/lnCJxI+kr6SHxjnjzKX2XrM7X+f4FWanH26Kc?=
 =?us-ascii?Q?0AAdEbGB1YrnRAEyMkUUvQKvknxhvI3WOwwL/5ZQifTLfj8SIRKahZhKkQII?=
 =?us-ascii?Q?kpC/FaaYec2Hjk4LOUQ6R4rWo7wgj+C78NW25+LiAQJEEm3qOPN32YrtRJnw?=
 =?us-ascii?Q?RZX3/CMTfxSW+ccc/6lClHqgdiCWkfL5RIVZd/s1H9mOxDB7k9qUW11mmEZV?=
 =?us-ascii?Q?Y6emgQeiuwuMqHcu012EGtZzJrWX95iVSh4e7gbnOBnqv5PV2QxDBjaLlY3Z?=
 =?us-ascii?Q?XJT//HfQUkhLLFYR7sLIkGdJmK1SNGLjS60W2RSJuXUIXczvx+AoNjmJqVkV?=
 =?us-ascii?Q?X7k2RwWE1d8Orvd9vTCXKDrU0SxMQB2SDWKNOqm54Fc1ENMKejA3vxip2FS4?=
 =?us-ascii?Q?u8xt75pOVi9HHez3ehItV2Y17yxtDQXImU7py4bCDukuaSKBSoPlCBELqOM0?=
 =?us-ascii?Q?PJEsUiMN8kUMUWsDxFB2OP6WZgbuNHjM/QXhqxTE7XIt+l5MetoEPH8e4p+R?=
 =?us-ascii?Q?y7OAWJlLMm3uRN/7+i/8M9YYfUMqQ2HJ5T06L8RghzKMMxF82xyVHrxTT0GI?=
 =?us-ascii?Q?O4hdG8MMCPLS+Bw65DZM1tnt8j4D+Bpf6AxfYzZOUZtSMd+hyktG5mr6GPrZ?=
 =?us-ascii?Q?+VkHLYs+2C57gxi4A+DVLvRxyPYkIAE1M4caMLbN5psbcw77NdD8l8T7gHgb?=
 =?us-ascii?Q?n6MFPyMFgQTbwNxTkkTAGGeU+qzsZqrfX0M90SOrPAKY1sIbnjUBfim8TvaO?=
 =?us-ascii?Q?AnHoIkkzwMO6vn2jVU2JYO107Wh67WeGsw88PbZ5lSLsRiRYPWK0wz3bwv7T?=
 =?us-ascii?Q?aj6UlmwrKDgOQtHLSIH5YsH6uHjnnhJ0pDJuJWBotp6b5oZLB99A0KNzraVR?=
 =?us-ascii?Q?JO5cj8Glublx6E0bekQx2LhiG7s0M8gZTocGFCAkjaLMSr+zWdOqcUfsPpxG?=
 =?us-ascii?Q?oK6GkcUntUHqwvlJuUmSjegujF9KeLdB/smJ1uuY3nrKk0oy68RDL86Mwvef?=
 =?us-ascii?Q?u+R3J+mU9Lkkbwg+Y2tWXouDy0LOuTq7PnDXabuT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04c8031-d88b-4525-d7ec-08ddf1b93a0d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 05:00:00.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMxLsvLGaDK9ASdAkc6FclpifleYDJhFnakevF90e6/RkjIiOWV6Nf40N4XYqJxL69C7kRlYyPa68onDQbTKVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7075

On Thu, Sep 11, 2025 at 01:13:59AM +0000, Peng Fan wrote:
>Hi Frank,
>> 
>> Can you remove 'method' in data struct also?
>
>The method is used in other places and other purpose, imx_rproc_detach
>imx_rproc_put_scu, imx_rproc_remove, it is also referred 
>imx_dsp_rproc.c.
>
>Could we keep it for now?

The method could not be removed from the data structure, because it is also
used in imx_dsp_rproc.c.

I have a few more patches to do further cleanup, but that would make
the patchset a bit larger. I would like to see Mathieu's view.

Mathieu,

Do you expect me to add more patches in V3 to cleanup other parts or
we could keep the patchset size as it is, with further cleanup in
a standalone new patchset?

Thanks,
Peng.


>
>Thanks,
>Peng.
>
>> 
>> Frank
>> > -	case IMX_RPROC_NONE:
>> > +	/*
>> > +	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
>> > +	 * dcfg->ops or dcfg->ops->detect_mode, it is state
>> RPROC_DETACHED.
>> > +	 */
>> > +	if (!dcfg->ops || !dcfg->ops->detect_mode) {
>> >  		priv->rproc->state = RPROC_DETACHED;
>> >  		return 0;
>> > -	default:
>> > -		break;
>> >  	}
>> >
>> > -	return 0;
>> > +	return dcfg->ops->detect_mode(priv->rproc);
>> >  }
>> >
>> >  static int imx_rproc_clk_enable(struct imx_rproc *priv)
>> >
>> > --
>> > 2.37.1
>> >

Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E113A244;
	Thu,  3 Apr 2025 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686675; cv=fail; b=Gbt9v2gVR7bAY6O1/w3Nx6iBUgpBts8Qm4YaqyA54AgLR4FGWWCX4D1BjIIDjfZOoqKNGlbvHANoMqY3DYuei1XwQfuGG8vtyNIatYc+B7w5SZaibIrhWi6U7Lm8W+gGh/jZuMPTV6NPrqg+rEQH9j/SAbNRfEHXQfUVpspSefQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686675; c=relaxed/simple;
	bh=rtkrXMR8hZsRKy3jBCiTPde6TqWnqOxY4QYV9s6HUrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S5hzhi0A26lmBZmiJiQdanlrZz2bl8r9hg4Jb4N+fWIm3lboDiJfEEftw7mjUYEpgsDu5fDFYH+rs2c3YwBochBTPYKus9l5sAtFPQkAaQf+5/B1GSpDnqsuRxh6PC/NqL9y+k6DaAjGP8sl8KcM5nsHRAHXpHtEbd9Utl/zGfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pol1h0C4; arc=fail smtp.client-ip=52.101.72.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Pol1h0C4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgWGq9hHQUWFfy4zzuwmmm6pXi16Pt/aB8JVNG2JZesFrAuUAZoNKm3BLfz1Oq02LHnKgo8TRJSJx6y7HbBa7QM3W4jozjD7Ir56znqeVWL61MnEiXV4AH33bTescqZXKxFmJmVO5AhxCdZ9IRHWY2qlovUO03vv82Nrqj6FWGZFmYl2+8SVXmTwAl+PtIIy6DhRDxeNMfw4rHbz1y0BhpImXnJJf8X6rrfSlOgfBze9w10dFZryIHNy/XF5z9wGW5m6TytPQSPS3+ncwa7KUC0dbgGFfXhjzJGyqqDi5HFOULSRE69uLOvaSQBiQyRw5TAd37oAyXld1h/FdNty9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjjq/xcv5MMN9Ex+j9womsvBsJ2OTlpe0mjIfGV3aqg=;
 b=VV8GRSn+XM2x/40THshv+OLbnlYHbn0zSjxHxYs7Wlq0tl0AQAmZNuNxYeZwadg2a3Ak2mrPx7EMGjIsIXQ7g73/x6ZZWnnILWgSk3lY6kFGq+WC3E1vsHfQGo9LnlV2TB2aHE5j6ixz7O5cYFw+0Qlj4yUqGQpzAH2ljRKe79wLchVxt8aOS81LEB1dAsexKSOFE7tgPtVdXqv9lPYfMHZQ8VsugeHGuXvjXrxaJcr3kMjwft9/XjA9p+7YnJjYk9F5g4BQ4N3G/i65tPR4RdUpoAFZiSEZu5CafrruHTxNWSNx9D2KhijvPsvjxPP5CR/Rj0nKppiECkBOFh1SHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjjq/xcv5MMN9Ex+j9womsvBsJ2OTlpe0mjIfGV3aqg=;
 b=Pol1h0C42yJdRBmyUQZ60t0SHhbEDqM3SxQZGH5dIkzI5m7QMWdjR31/88LrqASM63n1Q/VXYupjeyubAXPXUFwXbKQHYXbNMj/iN1UEVSVg5fHzqTtOd8SR1yy/YHhDJj9JWQmyLe1yseWNyvb3Eed2YkXdo9BcFrBkzbdv7TLx0ULLMQkqWORFTrrMUTtHrrcgUG8GkxJ+WlKbzeAwCs6jEpKamICTnzvlz5o9G2C9KApAm7w5mSJq3Impza2z9/QgdFYEtzwo0uNjxcfoo52TvpZhnhhhZYjM/8D/WwzCFLb2uUNOy5cz/PBod+95/SmooXaQhTsM1nuhpg2x1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10270.eurprd04.prod.outlook.com (2603:10a6:150:1c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Thu, 3 Apr
 2025 13:24:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 13:24:27 +0000
Date: Thu, 3 Apr 2025 22:32:39 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <20250403143239.GA22779@nxa18884-linux>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s>
 <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s>
 <20250401014124.GB15525@nxa18884-linux>
 <Z-wOr3eLaX9myqb4@p14s>
 <20250402014355.GA22575@nxa18884-linux>
 <v5xgigrvpy6shmgdkivmxywkacsubnsimk6vyrue4mmoyufpbk@br7lnyvtnatc>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v5xgigrvpy6shmgdkivmxywkacsubnsimk6vyrue4mmoyufpbk@br7lnyvtnatc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10270:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d444a4-3763-441b-63ea-08dd72b2db5e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HIQk4BSw4LmhfTPTfzgfOQJBUc+MBd2Pc1XBpymIWVzq2tijYxu+yy0dBVVX?=
 =?us-ascii?Q?iUKMaWPBz5FS7oE3zlD/+LnbskQmNqp7HUfGxFsWmzxCGp9WcuFUqLA8qCIY?=
 =?us-ascii?Q?nuHx/VlGl0vvLZi3/As96ogNoSzsFdYm+2VnUjaGIn4Vs4CLL61ez6yaMHCq?=
 =?us-ascii?Q?LR7iDW154uqZHl5vT3yg1BUpBPN+wCmXazZVxGQsLLBtYz+I3hiUN0RoUstq?=
 =?us-ascii?Q?c87vsqOaQaBg9OdZ83kL0FlYp15gW/6tV2vx387gFKK2lDALtktKC4rMqU3k?=
 =?us-ascii?Q?UTtC6ZqTnF+0QtiXLg1YhkakYboY0lTqyVopOvHhZzfKXzexPEkTfB1TNcXh?=
 =?us-ascii?Q?3Wm0lZwzLs+OOFjMcSV+SiJR5kRgKdNz6RkJmleTdUdJvuYkutdYgy1KDU6d?=
 =?us-ascii?Q?l+WaG7OSyhRHV1U5dJoRCgmxE4cU8ZCcuLlZDVf7RnyB3u6au684dzntckgC?=
 =?us-ascii?Q?z+DMVTvrmtDF7l3HoEfhGGHxeHXa4z7g1+t3uxEJ/d0zeazRBAquFqTNmd3j?=
 =?us-ascii?Q?j+rOh3HrjXXJzVWReZf9DakQW7uiKIdBvZrCVEYFHtLis83a+7jMrTnl7LML?=
 =?us-ascii?Q?6yGr/VWQcpW7haTRWySn9EOy1tJ8Fw6uzfNRC2QrIx3dU0Gtcx/cTG+fYXEo?=
 =?us-ascii?Q?8LjDUgmk+WWeHxD2w/D6CM3mLz8gtAWJF/dB8nnZq2weLxMhEG0zP3rh5cHW?=
 =?us-ascii?Q?T9qp373LoAGJhAHCVfptz/8Ps/dnDmMFgLwIRyWeLIrLI7e3GYFRetYAXH01?=
 =?us-ascii?Q?Bbb4738wmbr3NCIGwtSNwU49xQMPVFSJKJIzcxJJCZJzqCrr0d6McpQTY4fR?=
 =?us-ascii?Q?ja7wmIRUFGsfKpo+9dxHpQgfSAagnBHBaVFFQAWTog1QtKbMp6S9vMDMkUpL?=
 =?us-ascii?Q?rWk1Kan4BlKvSBHnjbQ4iUCDFwR5sCWNlzYMpjMedBpesO3eNcUJVjRwj65N?=
 =?us-ascii?Q?Fz9rKDFT39lJA/qMNgR9Qy4D6sneUhvZS6htEfXlXq4puDkKHCWdYhUS3cZz?=
 =?us-ascii?Q?owbvm3BczxFTEGTJ5ENHCy0tdq7D2wFdpGY+jQrnbm89ikt3KsU68JixHvQZ?=
 =?us-ascii?Q?d9GuFHf6TzM4GKvp4TpgWjYfC7rqPv2IH2nQM9eXFNH5u0K2EuwFAXJhO9kh?=
 =?us-ascii?Q?x/Ff+Y2P3m8l+yRz5V8mY8nOUR5lX8pXh5eU8Sihyg4WfVMTT47D4b3nLLWg?=
 =?us-ascii?Q?CaUqdi8XN4g1doK0KsrpN9v5eTWx9ebY96m6O6h/+VE2iEaM3/BA/RKMzVsO?=
 =?us-ascii?Q?sbYFwVO6RpoI6AxniywHE25Rs8vP7DbFEihyKtmDWoHqx9k1u7aXLAEJSPsZ?=
 =?us-ascii?Q?2nH25sJnw2EloUio3jTy/uYCqT/YxgugJdeLwWon/v1oQQlnNZ+thol+kVN6?=
 =?us-ascii?Q?/HVOp3twhy5g9tipjRFwNpFmWEJEFpvGgPuM6JX8zmTXETBecWouekTSYmVK?=
 =?us-ascii?Q?wpHT/eYKS7QcgS+OfJRDeDzd5jzsIeZt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YGLqwpSaDH//5U6Wvj3Zmfe1ztsOGMGzzTM5SGd5HwrwMDg7Ytf0S4CKoslC?=
 =?us-ascii?Q?BlE5P+cRFQnccriVd78bs+dejjp5Rs3jbSUZuTa8ZlgB4NXdOgKwfMHw8UVh?=
 =?us-ascii?Q?+r1oMLZOUyUe/dWXax90baea6NwBoM0z9bJvL5pkZJSuyQ0BEzf0FTzP/I5e?=
 =?us-ascii?Q?D8mBRiVJIpozrUPoXphBUee5AvbZHEi+2BzI/BD86okb0vkNsXIq6rb5Hgy/?=
 =?us-ascii?Q?mZIQjGmgaPBXp+fmMkF4ySFiwXFmLChc1Zs39605tDhk0y2DFFc/4uZZhWtJ?=
 =?us-ascii?Q?CHWucxTDS9B2F2K4o8oWVuWnncWBBX7rw192A64pzZTpu8iQb3e2ZN8dSWcz?=
 =?us-ascii?Q?yntuR4syhLJXSdEu080bDtkF+Q9UX2NpZJCqe4ud7KDI5P0ozHC7WLtKbAyC?=
 =?us-ascii?Q?OXwuYv8bH2WrjJ60b/9SLPU33w7BwZLe6n2hA8/M8wvkRdnx3jN1XogXlMIv?=
 =?us-ascii?Q?SRyFwIGErmIYKqn4Ac4i2FDJ1+1BEzPJqTnYVyYpkeV+kxIK1l+Q2cJek3NZ?=
 =?us-ascii?Q?sxLhh8whynUlbATej1Fo35ATcptIrHsrMY35Kr1wAz1ihEY6BRjTuM/AH1RA?=
 =?us-ascii?Q?FVNRRLcmJOQwQmajAmh5KcpaLR0PA0bb1Lr9cBa3gQW8pCfHrJGkurBSjbQC?=
 =?us-ascii?Q?JITksb2Zx5n5HfWCZjssPJyk25veGts7H4QO2OcdY1x6El0WLGlA2Jr4UY1p?=
 =?us-ascii?Q?AqAQLiA0kYSfH1hkP7iKn3M0w8kH3GhbCzqKxvsIw5NatU/wvjdxKXoTVMTN?=
 =?us-ascii?Q?TzBFYTYbW6K8u3Ft/dusg50nkfFO165+8rOcSv3QUJLpXXZOv+ZWYnTyeRCq?=
 =?us-ascii?Q?qO3B6mS2tddaZLWXvwHz4BAk8MiK4GUusNUKP4dBBIJJ/n1X28fOq6e/40WO?=
 =?us-ascii?Q?rNTYYfNT7/aKO8nCrA75pbEWb1A/uZ2tzai+PTUUwUcR+1Avgm3sl1NakwUN?=
 =?us-ascii?Q?RCZLrwZ0RKRX3i2Zy66dbrTB6eAJc95QIjalMgJMSheFnG5viD/BQY2OaGwy?=
 =?us-ascii?Q?6Mrh9VMfXzIXWl15XHS67VSoekjVIFSutaMgVQ9L8he3/+zKPpgo3XHwF0I5?=
 =?us-ascii?Q?Vu1zBpmY3SmbxyUf0g4yAOT6sJvEMDFcZBIAvtzCn5GHJmY+htP9wLQ62j+W?=
 =?us-ascii?Q?vwgrYIuiQcmTWkQBO40zGN3xQ6OFLXk8ZVZc03PaI0pojT6Uvth2rTsaJuhh?=
 =?us-ascii?Q?QcpvcCJB8mX7aCugqvVq3bfZyzzKCOYEDN/YgGHsW/26ybHbD26qeL8AuFOI?=
 =?us-ascii?Q?BP/vpDPgK1fFrbxEPepPos7c34ihEq8nfNuSQiPrag+DLqIU/MXQm7XBsixg?=
 =?us-ascii?Q?VtfsS9XN2GOltKgWZTtJSFUjVzGb8fJorEZ1TKC/DJbQRDHHz3R6CSzS0X+6?=
 =?us-ascii?Q?HyPZp9ma+3tvbmTV3tLasYA/KlFSp0roJRPXK9VukDuxS82LIuy5TYS2MGax?=
 =?us-ascii?Q?LtWz8CalG4qAmoFHkgnDJ2O0Tk1UPphDdMqiczjC+NkxJXP73QUaXP5XNsBx?=
 =?us-ascii?Q?i0LxVdn/Bwd8I7D2DglDk3NGaxgvoQUIiWHeOd9vQyBvbdYOAZKI0K+6kTPO?=
 =?us-ascii?Q?bbN44YCVihvrm0xlNhiMMKxG6E9N5VDegwzem4Uv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d444a4-3763-441b-63ea-08dd72b2db5e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 13:24:27.0782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqOI7hj7kNHTTVXsvTADt0gjO9qHsCeBje434PKNLGW8R3YcuFKCjlxg0ZQJh5tE5LyiBrQOXqB8SpaODwjq5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10270

Hi Bjorn,


Thanks for replying this thread.

On Wed, Apr 02, 2025 at 08:48:58AM -0500, Bjorn Andersson wrote:
>On Wed, Apr 02, 2025 at 09:43:55AM +0800, Peng Fan wrote:
>> On Tue, Apr 01, 2025 at 10:05:03AM -0600, Mathieu Poirier wrote:
>> >On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
>...
>> >
>> >The core is already checking if @loaded_table is valid in rproc_start(), why
>> >can't that be used instead of adding yet another check?
>> 
>> Ah. I was thinking clear table_sz in rpoc_shutdown is an easy approach and
>> could benifit others in case other platforms meet similar issue in future.
>> 
>
>I like the general idea of keeping things clean and avoid leaving stale
>data behind.
>
>But clearing table_sz during stop in order to hide the fact that the
>future table_ptr will contain valid data that shouldn't be used, that's
>just a bug waiting to show up again in the future.

Agree.

Do you need me to post a fix for
commit efdde3d73ab25ce("remoteproc: core: Clear table_sz when rproc_shutdown")
by clearing table_sz in rproc_fw_boot and rproc_detach as did in this v2?

To i.MX, the above in-tree patch is ok, so all it fine, and this v2 patch
could be dropped.

But anyway, if you prefer a follow up fix, please let me know, I
could post a patch.

Thanks,
Peng

>
>Regards,
>Bjorn
>

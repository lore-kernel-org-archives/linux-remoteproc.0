Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF0225D6;
	Sun, 28 Sep 2025 06:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759041901; cv=fail; b=rXPTCsXYr9kjRNnlp59KCXbKk3PbwBBjusKPi5cgJdd3Y9LOJaJ2Z0RfLUv60x/oK0silze4gLUelcc9nSvem0o4F2mJf4yfZ0KWT2PQEY0qbl8gFPCxbMwS1Z5qT1zdKS8H++xEg5OPOucAuZ2Q4DI3PrS658Y1DoDcUy49P6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759041901; c=relaxed/simple;
	bh=N/EngRG0TS3brbriERGGl5BgedGxV0Pc2TEfz630Rb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iXDrS6UlmQVMTMatEjAd3zsVnEMBhh7HSX1g3pA5WSOsYICG52x35f5N9VVpuAKRlrHiGFz69BCAe/ArDLslUdAfMN4yZCMlQaIHbmxTuO6T4WeSaNbDt5Bz8YsdShbn6HGvxHWqjRP7Nsova2y9GqTUZ50FDEycLgNFQArdGIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W4kRNgCF; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W4kRNgCF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgKZta3FTRpkAi/SlUbew5Rg9a2RmLJOyx2DVeBYIgJ1CUhrCT97u6UC1Eqf2SfKrvrWndYVv0Pmx3i8SFlAMK1BF/2YFmefPmORXO4VwpIJgHzjzcfs/+eysxZZAf6W0WUn0iHcUQrumE5nrTDPLDh9orql/VGMwUbE0lJpgm2/jxnVkIt2Swbuo3dJebXJTt7FTpxWV5k+JTkbFYu3d6iF6xT5qKSFFp6PRFxdBioKFKQJgyE6l7sY+Iwt2RydOLtOgT2VDnBP4zPgU030h3zKF3Br1JT60RP/rwPhQUEP6ZTPC9WYSA+NP4ih6YQJz22LwWgn1i1/Hp9O+fErqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZS8VG9PFIZBz6jjjp4w1dibNR+3LSjEhL/m3Ig7Twzc=;
 b=aTXgXFkhGXCwNc2UljX6UxemoEGyL2WtwXCcsSsSxN/YVKTpa+S5NiIcMmpYN5Yj3ir+/0i5JYBfyTqYQVeD58ZnyiHjs0Tww+WlXHBf7IDznjCxX7Xo2CC9ivs9pVdaDwNe8W32yDI+7Z83QEL///cYCN8U8i568R8X5leA47VVT7a3OqnvMJuFeXQ+lkPAezjplWy1HSDkQ8ADnnmvQaFtoTZCInPfgzLsUumUaEj0L5UEMg7N4uOpY23jvI2zdoQrRbiNVSzQ/SFOKJu1n+OXh5IuXzfyUdimX1vhL5ID3kzC+/i62cyC/REcmH6XmzhdLBKwYtXCzBA5aJJYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZS8VG9PFIZBz6jjjp4w1dibNR+3LSjEhL/m3Ig7Twzc=;
 b=W4kRNgCFN6Tisc6eGcxNF1NEZM9m6qGrtTnE2zC3Ejz3ZKWiwYEvFrxqkcymgrmAZlLKl9vHaIZdLHvrX7qJSPN+T4letk7e19prJVxryJMZu4g06ARLCB5BMT5aeJE9IVPqGXIAgF1G7eVHImYMxdgxU+bdETD8s4veZ6PeOnRI6174G5tU0ykzvuZPlfM8Ajq50IKacZrSj6v/1rUNyd1Yr3EOiXSFzZbLMq10YRTv5FuQhMP23i8Bi3f5uUDnBjy+938aXUw8bzlT+DnIX8A/BiXx3DtkExMy3zJXOnlUzSamrS9LnaW48PQnmz8OYbVIx0ihmaXOFqd8SnTN8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7174.eurprd04.prod.outlook.com (2603:10a6:20b:11a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 06:44:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.014; Sun, 28 Sep 2025
 06:44:54 +0000
Date: Sun, 28 Sep 2025 15:56:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org,
	mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
Message-ID: <20250928075641.GA29690@nxa18884-linux.ap.freescale.net>
References: <20250925185043.3013388-1-tanmay.shah@amd.com>
 <20250926073735.GD8204@nxa18884-linux.ap.freescale.net>
 <e93f0ee7-687a-4f47-a847-90cc1ea87290@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e93f0ee7-687a-4f47-a847-90cc1ea87290@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 5324098f-40e4-43a7-e97d-08ddfe5a8812
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wll97d5dHePPetLnu7T+yg7nm1haStaJ+y0KyMfX/iVor/8lRR/K+wiD0Hf0?=
 =?us-ascii?Q?4zgYmkBCzcBAYSpZDbc1x+L3dqmPfiwzZJBS/iwLZGVWVx5/CtVcPIpr2CET?=
 =?us-ascii?Q?0rhf/7yR2tIWx/tImYZo+jQ+/tYlVqe0yq5EBBeQrjHmJ20XnB5xQ2cIrrSE?=
 =?us-ascii?Q?9TbNwrZqs0eh1vg69VCaff6z9VGMXUESa5mLAJzGnSin2BwOHjFkep8UY0UE?=
 =?us-ascii?Q?DEAXz/+2dLdlT6zHDRlbif2oQFQ9oFO7arKBy3c5cDvVnw7XmA/z22HxKOuY?=
 =?us-ascii?Q?ns+F6MmnPNkyvkf8B03nAw0OzfTzT+TNETegbhhDdVfH71RdT67NRgyOplT7?=
 =?us-ascii?Q?LbIrXJ69QnYzhqsPSfW4c/R1IF54u55+G5NJxFECod3IcMm1ehotQowaZBRY?=
 =?us-ascii?Q?Iq+Eh9EyxhTE8MDFW9zN0UxXi3o4j6PWSrgeZeeMvHeqbmA2xtyaNSD4T5iq?=
 =?us-ascii?Q?R0nb9Dj8VHJrynyRHCdGiQ8ElgR2I7+gD4nLcUPX0U6JoDvvszLHAJ61LOxJ?=
 =?us-ascii?Q?oA77q4GyWHD7PuYl/NlafAl8GXcV49QAclUtff8hLDdOg+XMNfkkEh8NHZcz?=
 =?us-ascii?Q?/rOzBxSV+0j7uTzufM6J0bCD+aWI5VkclHG8nUVeYCnxvulVv3joFEMMnHmJ?=
 =?us-ascii?Q?hUzAijQP7h6a2lV5hI7SbDh9f5RKWng+gf+9g6KtWTtqGas6lhf/9y9XuflB?=
 =?us-ascii?Q?nlgKpKxS24hAC3eEBhzsG4Bv8bXrV6p+OeJKq04pk0+ZUAhc2SEAct+WsdGJ?=
 =?us-ascii?Q?/d0toaNG5BKafBvzh6QvsvG7WHaiEVGKLU7ZmLOAsrmxhA+XMgM4cJcgMzOG?=
 =?us-ascii?Q?8bVXabYqa7tgtiPxCjQGQL70TLvIBKSlV01GCaAqtuf4vb70JrH06+3nOJZ7?=
 =?us-ascii?Q?kZGKudK+9fVS61aYeMMELXCU4XvN6rM6ZTiAFidbarW/xUTCCSZCes3lvyOn?=
 =?us-ascii?Q?9W8ExB7ihVNDKp+7uoW5R3gZfv5aSB1H7xWxjK0l4lBr5WdSVuq0+NhG89lr?=
 =?us-ascii?Q?oKwAZDok3+9ZoRpRiNxD0NOwpkuuwX0aHqv0OVpTuLZAjXDi+TB7srNHwAaL?=
 =?us-ascii?Q?bxSQoZK64I1z8EPP4tHvLwTiSgovXpYONXiUlonCWyRHiwocY9cSl7pfjjsm?=
 =?us-ascii?Q?UM+mIL1Z3ga5ZfffCtA5NuTPh4A6fPnYvOQEa06LgrhzH4HnyShdVoPCK0ob?=
 =?us-ascii?Q?qKWT3HzDUWVqeIfSSXonk8l+PIg53qpGaYQdRDhoZVdCLUckK9cyP5JxkSjs?=
 =?us-ascii?Q?3fOfcReItMxhnUX1PfMBF5zWy3pMWrRYvQWNMcYnXW1Kt0jFENT8E3gvqxl9?=
 =?us-ascii?Q?JI7o4WshCjj6AVvjPrJu52nshN+bkYfB4I/F3oKvXdlAKmHFMlIsc6pK4NS7?=
 =?us-ascii?Q?wxmtSmq9b0CkRdOchEdy2WmfsW1dgcWFJHQiQ1kCLzHbHKv83Rf5vKfNKs0c?=
 =?us-ascii?Q?cQwqHcJA4pVAQsFkYYELVU8hPOd+9qf+x0airccXIz90BFxy6vWTM8fGSwHz?=
 =?us-ascii?Q?vaGDNszG6l0fBwGwNm2qxoINbMGEkMsYFbdJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EwkEP48UYyyseY7KUt1Ue6m/GPPTANVvAmBn3MGFbtncudz3O5ns800aWsTn?=
 =?us-ascii?Q?Nerz875yQCszDJGRgEo2/+9cBpQ++laCJZ9lWCSgQPHpy+Ldq+gGvY86b4WS?=
 =?us-ascii?Q?k8TblmH70Kqsu48TQt7RawRWHEF3f8trH4tzyyUOF5+j5VrckXqIsTLfcHu3?=
 =?us-ascii?Q?FDkyBzgwC4Grw4KOEuStDeMqEauQe13oFrKe4ZqOjRJVPE1VPoL250qKFUnc?=
 =?us-ascii?Q?vDKvud7G9oyhVA9fXwQI7KbdTvfDaMvvnbCTLJi1ArpQQJYukIVEnJKs4EJ5?=
 =?us-ascii?Q?Ol0HRi/bzYGSOtEbk6vq+ulRYJv8Akagup+euCIH2qspjphz9iqJrDBHT16m?=
 =?us-ascii?Q?TfMW0PZFNBo9uQJQMOw2EHeuzbjIdfRaFCre/u+6xhNvaZxYomspHV2nZ0Uk?=
 =?us-ascii?Q?jsaQZxZhw1/pAVc34qU+lKq6zvN7HHZ9Ca2Vec/hn/XW+AISPm3Uf2ZqX+ns?=
 =?us-ascii?Q?/WULk4pUUpNcPwamGop/rZoG7j9mmUuwgH631wQ+aWG5B1wzrM0D/cgdX1N/?=
 =?us-ascii?Q?7jp6zv6d2U78qOCu3J8q8Aps7c1GCcQp5QumpaQ2+ZfEvRfj7MtVPgbT1r5v?=
 =?us-ascii?Q?8bLaaXhXT8dGbb80itkRuri3sS086cmsxf7xF80RiE9Sf7DS5rqfsr1XUUhP?=
 =?us-ascii?Q?hpSgOikzSFl98Gfpta+c/jY8kfFZNequSi241KlJl/m5p/uLZ0SIBuDy7amr?=
 =?us-ascii?Q?8M66r4W5lUdcufZVUf+lDYEORaL4ALhtfLIH2fz7bSsNzEsJk003aAlB0xbv?=
 =?us-ascii?Q?5C4OSO0VwGLeG49DqUfoIprybfWnEEG1Z+VnfJi3Un2+AuTgUu90hPUlGix7?=
 =?us-ascii?Q?b9KmCeaZ2HONojsHu+VTNy1hgo/ixrWcKOXdGXAvvUYVrn7zvggZDFqT4eV/?=
 =?us-ascii?Q?W44IU+eIeK40KDJRLjJgyUMpyglaMgtyTeawa9AjLvAEPaoaOJGev/7HEsCa?=
 =?us-ascii?Q?YdUnhF+dMKhZ7yE+grdjDJfnfRbjk0DtmGzpJwwGJwmahdzkkrilDJC1zFW7?=
 =?us-ascii?Q?vmK+XELT1VcQemHXNTl0Twrlf/iq88x2veAPd3b3uDAe9FuTNt+OVJz/AE3q?=
 =?us-ascii?Q?b0FXBRgCtmj8MIGx/rZhYOxuY7gN9BGPaDeO7UGOK0U6hSOA8lZzpjXVNO6F?=
 =?us-ascii?Q?jKPfyAiQJz5wAA/Me2/rIUXguqHIR2LvUy+9ORRswwD0Sjly5jZagUAYc1T9?=
 =?us-ascii?Q?DQ6nXwYZebef4NB74l1b7gjFqvDN5TKz2U5kGDyM/f8VBLAoI8vaqWRzvQNa?=
 =?us-ascii?Q?L2DumZsfpaqHMA1ty802Vc9B3iEEM1br7uo9r+jD7n+rIyQNPmvI15znPKjq?=
 =?us-ascii?Q?2RkWXNdvt4cAZiB/RGacJ5Oz4Skdmv92vs5gOD4Z7Q5CDKOniH4ehCo3zPg+?=
 =?us-ascii?Q?vVnramWzdTXXESkYQ2x0XVd+FCTCuBTHfxucOCSfQhOFlWBggAPmzPvGF6RX?=
 =?us-ascii?Q?kuPnqNL8269/08M1qYNz0hodARSyrVtIVPesjQv1/jsMRm00eFBtI7L1oPOW?=
 =?us-ascii?Q?w1beTJyRH1+aYVrdFQIhONx17kDov8ljIi5jsC0sxDdY1RuVgimq8uqp3kDA?=
 =?us-ascii?Q?qHZ6k6GcyXZFqPAPxgNmQNkUOwitejknvINaz7Zv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5324098f-40e4-43a7-e97d-08ddfe5a8812
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 06:44:54.5230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UtRyywntCqQ5w85/HA8/KY+o7P3r8FGswqHI1jSWxFJoZrh8b22mRypR9H6+xVAoQwtoib7SEh9IRNCbyvYlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7174

Hi,

On Fri, Sep 26, 2025 at 10:40:09AM -0500, Tanmay Shah wrote:
>> > ---
>> > drivers/mailbox/mailbox.c               | 24 ++++++++++++++++++++++++
>> > drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
>> > include/linux/mailbox_client.h          |  1 +
>> 
>> The mailbox and remoteproc should be separated.
>> 
>
>Mailbox framework is introducing new API. I wanted the use case to be in the
>same patch-set, otherwise we might see unused API warning.

I mean two patches in one patchset.

>
>Hence, both in the same patch makes more sense. If maintainers prefer, I will
>separate them.
>
>> > 3 files changed, 29 insertions(+)
>> > 
>> > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> > index 5cd8ae222073..7afdb2c9006d 100644
>> > --- a/drivers/mailbox/mailbox.c
>> > +++ b/drivers/mailbox/mailbox.c
>> > @@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>> > }
>> > EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>> > 
>> > +/**
>> > + * mbox_queue_full - check if mailbox queue is full or not
>> > + * @chan: Mailbox channel assigned to this client.
>> > + *
>> > + * Clients can choose not to send new msg if mbox queue is full.
>> > + *
>> > + * Return: true if queue is full else false. < 0 for error
>> > + */
>> > +int mbox_queue_full(struct mbox_chan *chan)
>> > +{
>> > +	unsigned long flags;
>> > +	int res;
>> > +
>> > +	if (!chan)
>> > +		return -EINVAL;
>> > +
>> > +	spin_lock_irqsave(&chan->lock, flags);
>> 
>> Use scoped_guard.
>
>Other APIs use spin_lock_irqsave. Probably scoped_guard should be introduced
>in a different patch for all APIs in the mailbox.

Your code base seems not up to date.

>
>> 
>> > +	res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
>> > +	spin_unlock_irqrestore(&chan->lock, flags);
>> > +
>> > +	return res;
>> > +}
>> > +EXPORT_SYMBOL_GPL(mbox_queue_full);
>> 
>> add_to_rbuf is able to return ENOBUFS when call mbox_send_message.
>> Does checking mbox_send_message return value works for you?
>> 
>
>That is the problem. mbox_send_message uses add_to_rbuf and fails. But during
>failure, it prints warning message:
>
>dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
>
>In some cases there are lot of such messages on terminal. Functionally
>nothing is wrong and everything is working but user keeps getting false
>positive warning about increasing mbox tx queue length. That is why we need
>API to check if mbox queue length is full or not before doing
>mbox_send_message. Not all clients need to use it, but some cane make use of
>it.

I think check whether mbox_send_message returns -ENOBUFS or not should
work for you. If the "Try increasing MBOX_TX_QUEUE_LEN" message
bothers you, it could be update to dev_dbg per my understanding.

Regards,
Peng

>
>
>> > +
>> > /**
>> >   * mbox_send_message -	For client to submit a message to be
>> >   *				sent to the remote.
>> 
>> Regards
>> Peng
>

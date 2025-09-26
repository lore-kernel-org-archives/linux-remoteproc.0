Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EC41D6AA;
	Fri, 26 Sep 2025 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758867954; cv=fail; b=Nf6jh+/b84iAR9lGf6MHxIv2xg6+rd25LDhQPQXm9KolpFXHc7EUVkkitVWzM1SiN5xeAWAAOjdjuAfkmos3FSQf8wKugArBzpMWDiy610OIT6wGStWbxy5EfF4dba+k6nkk8IenSvh/mlYtB8MKb2W74Pdc4oc827wZxfTYaew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758867954; c=relaxed/simple;
	bh=wKcmqBbdNomJvpDvS4+QgMDcCYN95ICLzXP5eH2WY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R8Ec5j4AdyG3YLMFiddIcaObkjSLqNfTyWTGwwguZOm+0xwAFTX+wvefkjkNcifSVQB1rZuvAcGYRC5MH7RdJrmX8thgv/vj3dJW7r8FucAnq7kab4Sprh2gh/k3y80+natG3DWpTVM91h0wwyhoi7c9TI6w6OGBVj7MM9D7Yrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fBnrNF27; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fBnrNF27"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snwGPlGVZ0PKox0w3Z0GhW2/dMOhu7yUO2fH6+mxhVNFjs/hrk0Tumrmmrn81D/Z2KJD9EONSoML6OyOf53TxFkFvQx5e5g9i5xmkV48Q3E+5fAotWx/dTyQEbgrZLHJ+NdjPszPMgx9DuLZt2ZuzQ4XBWqRHh8Si9LmT6j4JehBRiYoP6N+tnfSulmkY6WgpIQhPACwXMzudfdIES0QCwhz7m4Z+nRW9X0nskhqpojk5EXpmbIvmJbXzHa6KxmBTsr8SwZOFG7wSMMGy8ocWGsYIjtlbBhLuDvlkbidlhIWSzXpMrlnXVF+FKF05lsZFIyeB2Edxn5UbvR7BGq3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsPKujKHzt1Mi/MtWOhTyWASGa72kOJqW9Mm3AoLvWs=;
 b=to+/5GgLYLUbSm0WCZdNtzlqlMs4lJSRMda/g8u5nqinJRRptXtD9ho2gf2XwIUzSYfTwA57kX3uvCPgVLzSyIdo4YKurgjWGsiLKXwNxrxTcr5fI1alaSkqHo/nI6o8z7amPdnrvref8IJ89mlnNldn+KceHLY+pS1NhLQyupjQhd9EeraroBRd0ammGZxLCd1uK85YvBPN6xor7sHGOulVrKAm/AAl6cHE9qWEGDJn28JUYontVGtGCKr4wEqt4Me4LgVXKG8Msd/O4Ib5x5npHIJ2NY/I5G5xGgL79Ql2vGPBLJ0XRl67u/jCZhvXAZI4J3yV/9vaAj4UNkyRvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsPKujKHzt1Mi/MtWOhTyWASGa72kOJqW9Mm3AoLvWs=;
 b=fBnrNF271V8kz55yzdnb4XYQ70hwzZruHENg6Rq2GQ2UXfNOWIjiD1z6m3Qx9PvvyKPEPRbYMlW+iJSDvFXzSdnInYPKCZPmbycf47eykjftlZhED6j2Yw0s0AJfulwyzMPCCWSMelH/zS8PzWAhirzyxeE/4KAeeXEnKxZ7ILJphaTkcWPlvnqy2oe/qIhVG+EB/9QTzw0QudAxF1J+RDdMFnNcgICbPVlV88oNY2hLyj+24Bwh4cpUxa1ritYImwKag2WV7m9Rey/KAkt4/wgTXhrKzzqzLhPxvqV+vTzGPkHn0uzYq7x4qOvNJ8HULarQbdize58HhOrN5jwaQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10273.eurprd04.prod.outlook.com (2603:10a6:150:1a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 06:25:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 06:25:44 +0000
Date: Fri, 26 Sep 2025 15:37:35 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org,
	mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
Message-ID: <20250926073735.GD8204@nxa18884-linux.ap.freescale.net>
References: <20250925185043.3013388-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925185043.3013388-1-tanmay.shah@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10273:EE_
X-MS-Office365-Filtering-Correlation-Id: d07a8daa-89f2-447a-dfb7-08ddfcc585c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F8YYyU//d+vMfbpAGLavst0iuD6nP6ftTy2ky4dEbGsU5QkPkqLdWoEoIeP+?=
 =?us-ascii?Q?nlXd6NDRJRoTIjgrKT+NAOkSzwnP5m9NJN52DxYSVam7ewllm2OfR78fuT2i?=
 =?us-ascii?Q?xU9g3jvnXfzALm9zVlcrtz2rHJ4avK19kdgrXR9u7owpxiC3AGHKkH4QSiyr?=
 =?us-ascii?Q?r3j1DKaGtAyuAQH+aY7vO4c22aUw4ifIjUf+pa+KhjLiiimi2qMAs0JQnfWR?=
 =?us-ascii?Q?JT9BF7x0SGgQ6RzTYFd6kzhhNuuTvHxQznnLJyS2AKQwg1UKK8juLGNbwJ7R?=
 =?us-ascii?Q?yDgjUJERlWluHbiwRScgovAiHul/EV1gdLICe42w9m3xgGXelRbdtwIewxru?=
 =?us-ascii?Q?cjwGpHO0fr30lbMPOghXgXZQWwI44Ij3yaQfDhFbF7Nr+M1oGBdPe2LDo+f4?=
 =?us-ascii?Q?TsnvMOl8llIV/aHQP0P/aWRqgt+8QwYXPPeRJg4+ZQBXmBMf9f920ZLsaXmC?=
 =?us-ascii?Q?iF26/RWNCZIEPGOaqtD/O96yeFCQ2e9S/lOvMkMqVQLvME81UQbNr3kWAFg/?=
 =?us-ascii?Q?kJ7H0aqORw/xJOlN8X98OV9Kg8qy7VcdJqjQHBL4bGkzZvwOlTrI1q+y2pPf?=
 =?us-ascii?Q?SmpqrBooathbHx1j/3G5nZyJSHFG7t/7lS1kI/Msk5FgOHWlf3DnnHallvhT?=
 =?us-ascii?Q?pcDm2e3WHcoYXm+OeaPLJLlefgVdAUiNPPiCb1hYJ3eQKaYEyvQI8HOi6wB1?=
 =?us-ascii?Q?slVAsgizlNcsV63Ivbd4MELEPtJTjNP0axycFX+M2g3QrdaGnF04rAlEw7eQ?=
 =?us-ascii?Q?776vTcAZ6fgeo8XyISgtBgKfdXlwppE/4aivIOrp7UqZbJhn/m8f61ZDK+D/?=
 =?us-ascii?Q?JFlRz06Qs9GeIyM6hprup8r2XZbBu5RNF08ZiXlA8FPUDzcf/ObJhCp/2Pnb?=
 =?us-ascii?Q?/XmbjgR6aP31VqEMmOpGb0xnnW/+/ZlXeRJPzLyH1rvwrMj9d2aaY/uzjW9I?=
 =?us-ascii?Q?t78Oem0vf8jGabxO1l+HsSPClUvxyjwzr1MyikaVeYAtIIUsH/azXrqc1zAd?=
 =?us-ascii?Q?x9BSWmPICj2X96a8KX/HNgj54YN/0qIachAek6UJvZAiqkSdn1iJKYUcOCBX?=
 =?us-ascii?Q?2gxJR1+souzdi7pGH6Q7bkuTb3uhcwUWVFQA/RK/ntQxDFiTxkzMWHCMZRRf?=
 =?us-ascii?Q?H3eE3VcWS2B4uQVgTzFhIhAcp/8157dOj2Tz3XhaMizporTywhOY9dQo/lLw?=
 =?us-ascii?Q?T5PZgqZAYWAAP/881HV4VRQrNWd+8Jjw11indnBrhhcri308aEPgKX3q55m2?=
 =?us-ascii?Q?Nj346B+jUH1QgMHEDDDZ3tWobam8WabZG4e/i3mZDB2IdFara7RIf3lQYaa3?=
 =?us-ascii?Q?eOtXIZoxKU+feASyX5OpfG23aK+p+hnFFwKnn6eqtxmUQi0R9JazDkpsN0hx?=
 =?us-ascii?Q?wUlvfXE4En78II61UiCl1hlrSesw9TSP80maE/f55O50eXQA3lqX5zvpBf6P?=
 =?us-ascii?Q?275YWPhzsKF2L3pQlhlHFLR90JJ0QmcSeEvRMlQw644jLitgnyGxjbKz2aA2?=
 =?us-ascii?Q?NXzDI3QqMezdRz1w1waq/uB/M2fgTV8WdNkX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ll2W2gJlD/sYKwM0hoo1n5gtxZfT6/OcIR+Fx0AB1LnnDsF50c8Z1W+B+4ua?=
 =?us-ascii?Q?wj0rthXnUh8SsuMjJKQgbOAl2pYYSdQjCcDlgN2Lq5Tz+q/bUc1AD7e1CVrN?=
 =?us-ascii?Q?c6zA00V5+csB8Gw7vLsW0tGfoN6g2vE+knBwHrrn+0YkOx7veJMAAfhgcNa4?=
 =?us-ascii?Q?l8WZFJeHxNtRN44Cbr5F/4PzcNopELPexUTCFxOgLNumhDAGssa54Cbssd4R?=
 =?us-ascii?Q?yGMo8ghisgvrgoo4G0M31fkOH363dScMZFJKBg2LhyCPDLbM22TgIDvqG9fC?=
 =?us-ascii?Q?ixHjpRfGnyk2kYCtxg99SmV7XX1C81z9648c8l005Zl0ayhwZmDXEu6ChDDf?=
 =?us-ascii?Q?YuJ5J7hbbhaH5B5eXDz1NoVMeHn0b7sneqlipaoB70Bw18DrdHSGVKEuNo9r?=
 =?us-ascii?Q?77KjjNBTGG2n1YCgXFUqtMhC6Dp3Z10bPmWexGu09qW0AKHajKpctk/Qw3+T?=
 =?us-ascii?Q?qc9aZp9H/ekWGLVCHqowCfSe77E6Gcr+X09v1VCH9OGdVezT9E5Oks2JO3Q6?=
 =?us-ascii?Q?SJ4CYMQ/Im97jg64HK5PLKb+fBSzsI40BTF5//NZalMyXC4LqCQ+y08CoVSy?=
 =?us-ascii?Q?IBCZYgXfRgTe3/YkP+FniGxOvzUiXSFLSxCVSg4qCIn6y6ttXlGSU5Pmi+IC?=
 =?us-ascii?Q?vjH7P7uV7gWW03UJQlC0AqWS0iGryWBeigQDPbQS18hgDpfd5lhUq2TC5E8N?=
 =?us-ascii?Q?7iw6Tohr8+qD6+cYJRfm33MGovDPZ9CR0qGv62+pzMHcB7IVni2X+efeL0VQ?=
 =?us-ascii?Q?/s0jEgV/ZTBgJXJWk5fG91EPZ4ulNE40VplgHWgkGy/OEdVSz0QmiAf07hro?=
 =?us-ascii?Q?E8dRoOgU4DMvEvfuggKyxzuV/kF6t/u2QD+Ht7giBRaCeMAY0yDHkYNHBvc/?=
 =?us-ascii?Q?Arh2NeQg+S3m66aIk0N+hGyYeWfvuAJe8wyY/pqEyHsWSG3/SdB+qeD9YO3K?=
 =?us-ascii?Q?pP86TkZBujCSWRzkcC7LAopo4i2RiIbPBuW/LBjnkDROdEMRu99b5Nk7t8Ax?=
 =?us-ascii?Q?ctEOvQ8PROSlh25TCTC9hUjg0rXrfcnFRbRPHR9B7lDcmI+INwfft+cgLLxd?=
 =?us-ascii?Q?5iaefvElexJPI63XR9nuKaR859n2SH7iasUGL9bR6BrP336hky9l7UUPdwTu?=
 =?us-ascii?Q?in8PwRgarBGWOhWMhvxRSKGGF9w7zs6rGxwdpttDvK8XClx2+zID5b2cUvGX?=
 =?us-ascii?Q?c1lFU7mbMlAyvgcbxS1zAfERV2Zq+4qxasjHGL0YRtw88bq9bymI72zk1+oX?=
 =?us-ascii?Q?b4CShrV1PxsXDV5aE+2sOy/Qzjk9ySe4LQ2KyliEWIrzif3G3SNFqVarld1n?=
 =?us-ascii?Q?BWzjRDyEUvLTyA4wFCgy13q4HZItp8lOeTSIt/zkEf96fblFzPuSyYrz8bpo?=
 =?us-ascii?Q?m7t9xtNrSgWRccZFGug1HtTIkU4TqTsBfbolXSEeSzgztb1/b6zBvBjRnUpU?=
 =?us-ascii?Q?5Duhq6Ca8wvZIbniLkEba6DouXa58qhpVPHnLI2mHYI3jry/CUbikXr9H3h8?=
 =?us-ascii?Q?jd55JuLIsCxOc6242PDjliaexvdCZsA4RcxIg1LdbjJD8GyrhRA+HHmOmh9L?=
 =?us-ascii?Q?w93sZI8F7SGvrJxwJH34z9UYFQ46Z8e8BWlfShOc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07a8daa-89f2-447a-dfb7-08ddfcc585c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 06:25:44.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yma7Fn60xBcx8JMKiVFXjRvM9jc5aQ+BHWTEJD3vb2ZM6iche6K7m7PHoL+zQQvFxwlRwaHPCA9OkYCMFi47BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10273

Hi Tanmay,

On Thu, Sep 25, 2025 at 11:50:44AM -0700, Tanmay Shah wrote:
>Sometimes clients need to know if mailbox queue is full or not before
>posting new message via mailbox. If mailbox queue is full clients can
>choose not to post new message. This doesn't mean current queue length
>should be increased, but clients may want to wait till previous Tx is
>done. This API can help avoid false positive warning from mailbox
>framework "Try increasing MBOX_TX_QUEUE_LEN".
>
>Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>---
> drivers/mailbox/mailbox.c               | 24 ++++++++++++++++++++++++
> drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
> include/linux/mailbox_client.h          |  1 +

The mailbox and remoteproc should be separated.

> 3 files changed, 29 insertions(+)
>
>diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>index 5cd8ae222073..7afdb2c9006d 100644
>--- a/drivers/mailbox/mailbox.c
>+++ b/drivers/mailbox/mailbox.c
>@@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
> }
> EXPORT_SYMBOL_GPL(mbox_client_peek_data);
> 
>+/**
>+ * mbox_queue_full - check if mailbox queue is full or not
>+ * @chan: Mailbox channel assigned to this client.
>+ *
>+ * Clients can choose not to send new msg if mbox queue is full.
>+ *
>+ * Return: true if queue is full else false. < 0 for error
>+ */
>+int mbox_queue_full(struct mbox_chan *chan)
>+{
>+	unsigned long flags;
>+	int res;
>+
>+	if (!chan)
>+		return -EINVAL;
>+
>+	spin_lock_irqsave(&chan->lock, flags);

Use scoped_guard.

>+	res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
>+	spin_unlock_irqrestore(&chan->lock, flags);
>+
>+	return res;
>+}
>+EXPORT_SYMBOL_GPL(mbox_queue_full);

add_to_rbuf is able to return ENOBUFS when call mbox_send_message.
Does checking mbox_send_message return value works for you?

>+
> /**
>  * mbox_send_message -	For client to submit a message to be
>  *				sent to the remote.

Regards
Peng

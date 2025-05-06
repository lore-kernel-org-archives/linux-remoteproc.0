Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3606834B1C3;
	Tue,  6 May 2025 03:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746501024; cv=fail; b=K56UYWj2f8GOphGVZqsQVwsVEKBS1aO7FYNQGGH1hy0M+N29RFwU4l1HRlNNk350qur1/vK5O6spX3cXihJJn+WO0l7TWeKu0kkVU46EvNF5BUJWjFgvpCLDUAGGveSS0ZlLf6EMl4UYlpMg0FYTRl1F6M7iGRwu1epaena6eV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746501024; c=relaxed/simple;
	bh=g3Du4FVuK+ZeY8SaMlD/s9pK4s/3eetgnWnn2QDNde4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NwOBf0HiGDHFRAYMiE7CRZbh6sMihQyzAQ9QDaKs8W61I2bTtrjKVeRa7rsdYhnb8oXWCK0S50FJf4FJFgVYYQ2e3O6JuihokuCzyyZDqQO6i6w3wmqLkTOUYoMm7jJFyO0T66jXelgCyGYvvghgjeNxIaYJpOh4PfvF5+dDCos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v1jFhW0R; arc=fail smtp.client-ip=40.107.20.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v1jFhW0R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0ku1bRRP/Ll+JqT/IA4e4UNXhKMswBf1IQ9cZM5PI96PGFW1wwJkuNUTv6fpjtUsU9CNudm+aqNpt8pF2HFdDd/4ZkkqNQ9JTQ0jl//m/vB7JkJu2gWPFjKCvuvEjeN6XTFHvD4cjpH3rCznNON/om/ZvyAFt2GEeqszBw2v17bbWIRpsOqV14o/bYyPmix3NrhRo9Bl6hRwZofFTjbdRrvD4DSWCS/C3Udv2Cd6N+HuqXzs+NrpJqA88Rrm90iNC4CXMWVlygIABNTDTgjsbD7O72QIynACftWl1i1lBkNtraC105PBNL9ock71o074/kcQas9jZWScUt2owT+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzg42N0VclWS4FFnvgE3i5Du/96B4EtbeofzJKSGxHg=;
 b=DAHM0glWXF5l7OAJ6nNt/dYzdd/tYS7ANhk3vU+qMDL46yjpS8kCd3fav9Pq4kG20SpCPGtbLtoZfBgK8TIWxxLi2KuSdCvVcA3VBij4RloiZoPH4N83H1y7lAEx6tjYJogfffCgB0yH3Z8ZS2ptYoqBDd7gCv9AYmnojkcDb0nYzFFF75e2a3gPWcMbWS6Q+6fEihMV871vSXNytdkQvM1Ty7A3PGeE6iAAanJZvv6UANnTeLwscTyQHm22OBnVDLSMDSSK642q8PQ3ZIH9Pz+8rUnkt27qCn1icTpahpb2wQC7m44sbKbe9vFnRbl+gtc/Fk3iiwL0C+/w1qX5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzg42N0VclWS4FFnvgE3i5Du/96B4EtbeofzJKSGxHg=;
 b=v1jFhW0RPiM0CyrVzX/n+Y+QfiTLg8uNNFrmbQCBF+DoBtJUoAcBTWSJktdPw8BqtHZDMwftuJRmw+ByWc18dr0jWMCrsFLUBVbGJpKVc6g/l0YHQmmQuacQavuPNY2AjvXQw3UgnIrLiRgpEoTZg6icS3H9CA1O0xmfgaYLW3QArIXDi/awv+8QxCb5om7CXnCPFf05bQVeVQbPsZ4ZapE29w9z9kly9LkH7VBuPSXR02lZRWaJ4thSaK1O0MtNBzxu+Gg5vRx6sSYmrY4DJRxOzz4w5TZ1W3Oyi2jufXnvmfcfddHTkEH/66EH3Xdj/YSfLNmA8lhHgueM+kTXxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by VI1PR04MB7166.eurprd04.prod.outlook.com (2603:10a6:800:121::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 03:10:16 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 03:10:16 +0000
Date: Tue, 6 May 2025 12:19:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <20250506041909.GA24259@nxa18884-linux>
References: <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s>
 <20250401014124.GB15525@nxa18884-linux>
 <Z-wOr3eLaX9myqb4@p14s>
 <20250402014355.GA22575@nxa18884-linux>
 <v5xgigrvpy6shmgdkivmxywkacsubnsimk6vyrue4mmoyufpbk@br7lnyvtnatc>
 <20250403143239.GA22779@nxa18884-linux>
 <20250408161054.GC31497@nxa18884-linux>
 <CANLsYkyEhhQA5KOsNveGSHUc3ZpckoL-CCHNZ0DZLMNYdNGzdQ@mail.gmail.com>
 <20250409064610.GD27988@nxa18884-linux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409064610.GD27988@nxa18884-linux>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To AS8PR04MB8450.eurprd04.prod.outlook.com
 (2603:10a6:20b:346::5)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|VI1PR04MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 403b11c0-bdc3-4bca-277d-08dd8c4b8546
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NMjv782DNgYc85wT6FDDjDUdctqhEVJqn3LHbvVcOrCcAihifSqH5XaUd2Ow?=
 =?us-ascii?Q?BhlQbBLCbMUMiJpcSjoZ3dc2l8ZJ2pvAbAxMLjyyqR4CtqEbmtt4yavCR+vF?=
 =?us-ascii?Q?byFENe5aAfO+MW0+tM+F+jsZf/ZILSKuKzgR5Qil40F6LX8soDmnU7ldTX4J?=
 =?us-ascii?Q?5ToH/yFFD1ZbmgeuYfvErWfj5/Y2W0GIOAvFj9b1g/WIMYUEKvY5GJiyCbkv?=
 =?us-ascii?Q?g5pOvFuALGAdJbnYCw58mux6qNZQBLjFZtjnGQOPG3T8HDoQosk5fI5u72YO?=
 =?us-ascii?Q?8GGXXtgUTcoeiX9OotNUcP+YGtPjMtY8e1qnXAY3GSMQxqYYINxQvDXzQwCR?=
 =?us-ascii?Q?grmrExJtfD4on523Cl2dEJPqX1gk2U1J38kRwEbVJdOa8gSsV41u0nLlpVoT?=
 =?us-ascii?Q?Xd4YbtYcXu5SpiWpeMn/uue0nMlBjvyQDdvxoEqmsxu6qDWHb6IDvglJdWE4?=
 =?us-ascii?Q?TtToGnLR3K14xu4yBULuQqVDgEfhOx5HPadIc9WwXJtXUgAehfX1EodASg9D?=
 =?us-ascii?Q?Bgi6zru4RYvitAfDqVop78bKNio2Y9F0FJqaX1/JnKqIDiWh113lR+EmKfbO?=
 =?us-ascii?Q?mnA+vYba9HjOWLwYGTrzYvQOGHXtp6wCeEGFvYIl8v4lq5RHOQSGmm5ECq9J?=
 =?us-ascii?Q?TSJO0gnT9xXCZgggVnklYT370eospnb1JNHbpilSaB6BR1/OEupmmNgLe1rn?=
 =?us-ascii?Q?e+e6ufGo2x3hbCAhdpwN3ry9jwOVU2r64V0jZ4cRYRXd7xFiVbV0C3hH0OyD?=
 =?us-ascii?Q?6SzTwoEC1qNnUnTXVOki5kt9PEVbkCLu47syiBJhQXQ2gOO/EPwmKYq/iyuR?=
 =?us-ascii?Q?4UzQCMXpBxBd5SLehEqsWbDAyTnzHAlS/kbDSCAxpDW5FDo4Yuv0oeB/hCZb?=
 =?us-ascii?Q?5dYqZCAedHYNcBAT3XXG7w6NPTEP1nYdxhjO8axp+mG59A0rdIluSZ/JGE+e?=
 =?us-ascii?Q?/9DzOAkCtqAlRMVjc5IUfTEAVlBL4AHnWBpuNPf8h/jMf2oRhuWCMQxniviu?=
 =?us-ascii?Q?NJ0S6HsRAMx0SiYKISuBYVMEIiUg2eHr2z23QW+D7DbuP4J0svnhxeTCQFJJ?=
 =?us-ascii?Q?S6VN/OE0H5VY0QwWn1MPOgl+ba5KupMJxoU/l1zbuc12JfF7tAR8ygQdXp96?=
 =?us-ascii?Q?9Ne4plLefvtlJBujNcdb8ARJraRvqeXtYiXLbl+EBu3ODT1K6sm8/1Eu3UJs?=
 =?us-ascii?Q?YDMjOr217xcrUKEfyFiMcAzsavrQ6GWGPncgb+ly3eg/J7rmD+pcDvZpRAv7?=
 =?us-ascii?Q?Q5PGaxolb9HmkBtCk+5ia9PHtDYv+0Kc5siL6g1igXYhDuMlF1UIUneo0n8G?=
 =?us-ascii?Q?gBFDDcGrvd3uk6+SzA1pPOgUf7jWloMoGijnv48eslkjh0XFZf+8l98kSBK+?=
 =?us-ascii?Q?SJjkFJzw7pqdVA0XfZWKjO1PYGtH7YnjWQ9nMAbwonYWitRn6EPUZsyxcKPi?=
 =?us-ascii?Q?sSjncI8QaQSousYIqxDsMtjCd5F0WWxy7PTRHnIyTk20x+SnJpVHgzBneggA?=
 =?us-ascii?Q?HDZZz9k94USctuI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XYytU3eUNvPjdRfGZ+TViCqIvBdjOBNyj8424fojuGFiR+iMsgNGXUfmqKLA?=
 =?us-ascii?Q?g1NxQWGpd1k4dck6GL2mdmYSASiH4/KZ5l1pc5SXPyKTpqTmhgxvtoKU1SoY?=
 =?us-ascii?Q?cx3/7H4A5m26EKJjhQ25U3dxfw+qf3vL2vWCfqt5k887JR1/883ZmJ5gvP2U?=
 =?us-ascii?Q?4hrfR9U5RrX9VPyPIWX+cNKrv7A5xCawmBU0PYQ7eDCoRMMoyikitEedPRi3?=
 =?us-ascii?Q?OrPsK9++sUSWCmg1Z2YL9roxeSWZSkf89Wfgu1fWNwKTPIREo3YgxdUeJ8UD?=
 =?us-ascii?Q?ptzuMTY+3UyQcsxMafZzU2RqeGjExZZaskAoO0vL0BWm7L+VJNVk/xq/NEoL?=
 =?us-ascii?Q?j0KTpJ0bIQ+l1xScrJBzXVxWrTnDHaahDG6Jtmz2JMudzC8lHiMQGzto56yX?=
 =?us-ascii?Q?fzwlVJBhnoLY6SW2i/rsv9jQYaovi95T2MbT34wFc+5X6Sa2qqIXNW5C93iU?=
 =?us-ascii?Q?gckVHsPHUaaD97NUtn5KCpSfTB4TG/rFM+P1FJKf/onN8nciTpP4AIPEPhCk?=
 =?us-ascii?Q?dEx+bZR8uHmecS8LpTLpqwOuCA0XcAcMZuh3A3kliGZLYJuBtZ5/sNRFPMk7?=
 =?us-ascii?Q?twtQjbr219fTzc2cbK4OFlyb0yU9ONT1ZrY4QIrLsC0B5AD5w0TEsXpXuPge?=
 =?us-ascii?Q?flRvGKoldrxlEnfqAHPvUo3oWEXN8yao1u0UJUqjgztjwz9KFLd9YNbbz5h1?=
 =?us-ascii?Q?yeOZG+8vwkSIMFUtdJuvsGkib4JUR8eforRRsFdmXUzooNLp1D/3P6PpOPn1?=
 =?us-ascii?Q?xbAKBuLGaT6rRey1HsNJcv83YICYY6ncbbYyikwgdrII22EIrskIO/rjMiIj?=
 =?us-ascii?Q?8C8+3NoY9fpKnK5N/r5HhTBNR93Z9hFKE/tRvnj/RKPBz5LKrPp5r/MxEus/?=
 =?us-ascii?Q?0PjoeWcYdMMGFFcMeuO644pZPB0X9IzaJkHUHm/2QJ/1vlc2x3cmK12/SXlX?=
 =?us-ascii?Q?C+mP21fmsKNZln/nynF1+5JoHxUrnX3tAmhL/P/hSfU7nP0RKuYIGn6ZIP9P?=
 =?us-ascii?Q?S7wze05ORD/59OLQrhi/nKgmhLhjzTtgKOhZv5SOXuynXzOINSohXlrUMRAj?=
 =?us-ascii?Q?wnTOJLLs85SSyeFaPZkDoDUQELfjt53EkiSm1yfGFZOPmG2S3vdoWT3cFEG6?=
 =?us-ascii?Q?xsulbf42EbqAFsktdG+7+RxGyJZy4Paz0bET2p1jiZReQONHnvTmAp4lXk7r?=
 =?us-ascii?Q?0Lz9R1ISkiaqLsQs/C0oSrE3PQwOY/sHIaJ9wW+1hXCJIDc14xrjMTxq6+0j?=
 =?us-ascii?Q?CM8MVbl63ykc3Wm2vg/riO+sdKJE1lhnA4IhO0b9j9+2Vf3hOPi/+dGjzCCy?=
 =?us-ascii?Q?cKj3YUQ9gn9mGo7z4yxRg/vzX1+Ci89hhcmyqz89SFtIg1O8hG7U1zWxwKBJ?=
 =?us-ascii?Q?I0G72fijBQrl7EWT+hmRA8iXakm/otKdRzqLYgqW2YnVRMgEqlcUDU2jeT27?=
 =?us-ascii?Q?LAr4rcB0zpUwQd8goJvW3Uce0nzS6XO/WG7iIUzJWukdM4cYjL9cbQ3HxbWh?=
 =?us-ascii?Q?mdxg6MGW/5K6U1Xa28RF3yL99tgAI2bteZeMEwFQpTrj2PI+Dr/LKCp34QU9?=
 =?us-ascii?Q?g/vmJwZ2qFWguBCC3Gqr8hE6PLQvk5GbXG+WqnCS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403b11c0-bdc3-4bca-277d-08dd8c4b8546
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 03:10:16.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icyg92oQY0f+kvZs4NrICepIMU7yZp74X71uzgq4x4DaB0nJj455u2dSdJR3IQl73G6BHKRrPqhEK5Vn+Te9FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7166

On Wed, Apr 09, 2025 at 02:46:10PM +0800, Peng Fan wrote:
>On Tue, Apr 08, 2025 at 10:59:58AM -0600, Mathieu Poirier wrote:
>>On Tue, 8 Apr 2025 at 09:02, Peng Fan <peng.fan@oss.nxp.com> wrote:
>>>
>>> On Thu, Apr 03, 2025 at 10:32:39PM +0800, Peng Fan wrote:
>>> >Hi Bjorn,
>>> >
>>> >
>>> >Thanks for replying this thread.
>>> >
>>> >On Wed, Apr 02, 2025 at 08:48:58AM -0500, Bjorn Andersson wrote:
>>> >>On Wed, Apr 02, 2025 at 09:43:55AM +0800, Peng Fan wrote:
>>> >>> On Tue, Apr 01, 2025 at 10:05:03AM -0600, Mathieu Poirier wrote:
>>> >>> >On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
>>> >>...
>>> >>> >
>>> >>> >The core is already checking if @loaded_table is valid in rproc_start(), why
>>> >>> >can't that be used instead of adding yet another check?
>>> >>>
>>> >>> Ah. I was thinking clear table_sz in rpoc_shutdown is an easy approach and
>>> >>> could benifit others in case other platforms meet similar issue in future.
>>> >>>
>>> >>
>>> >>I like the general idea of keeping things clean and avoid leaving stale
>>> >>data behind.
>>> >>
>>> >>But clearing table_sz during stop in order to hide the fact that the
>>> >>future table_ptr will contain valid data that shouldn't be used, that's
>>> >>just a bug waiting to show up again in the future.
>>> >
>>> >Agree.
>>> >
>>> >Do you need me to post a fix for
>>> >commit efdde3d73ab25ce("remoteproc: core: Clear table_sz when rproc_shutdown")
>>> >by clearing table_sz in rproc_fw_boot and rproc_detach as did in this v2?
>>> >
>>> >To i.MX, the above in-tree patch is ok, so all it fine, and this v2 patch
>>> >could be dropped.
>>> >
>>> >But anyway, if you prefer a follow up fix, please let me know, I
>>> >could post a patch.
>>>
>>> Hi Bjorn, Mathieu,
>>>
>>>  I will wait for one more week to see if any concerns or questions.
>>>  Please raise if you have.
>>>
>>
>>I am working with Bjorn to get your patch reverted.  Once that has
>>happened you can send another patch.

It almost one month passed, I am not sure what status now.
I have patches for i.MX95 that are pending at my local.
I will wait for one more month until 6.16 merge window close, then
post new patches. If any concern, please raise.

Regards,
Peng


>
>ok, I am fine with this.
>
>when get reverted, I need use another method to fix the issue.
>
>I posted two approaches[1], but not get you reply. Since Bjorn raised
>his concern on 1st approach, I think I need to use the 2nd approach without
>touching the core code.
>pasted here,
>"The 2nd approach is to clear rproc->table_sz and rproc->table_ptr in
>imx_rproc_parse_fw before rproc_elf_load_rsc_table.
>"
>
>Or a V3 of current patch with updated commit log.
>
>Please suggest.
>
>If you still have concern or things still not clear to you, please
>let me know.
>
>[1] https://lore.kernel.org/all/20250402014355.GA22575@nxa18884-linux/
>
>Regards,
>Peng
>
>>
>>>  If no, I suppose this thread is done and I will start my other work
>>>  regarding rproc.
>>>
>>> Thanks,
>>> Peng
>>>
>>> >
>>> >Thanks,
>>> >Peng
>>> >
>>> >>
>>> >>Regards,
>>> >>Bjorn
>>> >>
>>> >
>>

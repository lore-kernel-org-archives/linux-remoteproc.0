Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98AC30F7FF;
	Mon,  8 Jun 2026 05:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897530; cv=fail; b=kVgHmdQ4nTBa35tfM4qrF9aiwVoCbpRkcTSj4jl4Py3TLJSt5pqYxRdEAYGgVJr6DkniJ88JG4ZW2BQTdOmSAOVP/s3ZoYUPGqD85AsfKwydRz98mEPZpIM6l/lBsBf7j4Sn6dxz6sNsPrOEJ5JO6dqHvujHEG2o5cUOZxI3ol0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897530; c=relaxed/simple;
	bh=AZwk5ewa1B4twt+QO2foUTHZnPbmHDctVYtouujZh1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L0FXGO4ek+2Qb850puBXXKMWjBypymGV+Hz7GhHnud/jhxoHLdEv/SXrzqbxKeMQCk0gkHUquIn3m6Z6kb1Su0D4IplwDd1jTqNqm210OLYnOwErnDvI5aDIb5NT5YMrTDBmiwXJQZqAVQPeFS3+6wg2PPjqJHfAC2ab5A7cxqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mlB86yoA; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mlB86yoA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcedOkSJpFx95NLVFh3NjEI95K8aRUX1DLfEzdy0vdoTLeGhYflhCyM4uEMJT7t5LKiyCTmUgJOZHoHaOWXffJyEZN3nW+rSyULxa3x+2560Hv6OzMnx8b/j32QHZV+pKtsig4THBDKiZZHHmcn8J5YtRL/8yWP3B2l9BLRBviLK8whwVVXCyQHPgOADByAY7rXPKvPe2JG2t2R2sWFxPIPFarnvIo9K1OgquUgdx4CvtG9JvDhPVbwK/MI9BhLfAYUZIePNUHUS0aPuj1by6TjZGPZ9KyBBqfOwHKvHj+08+dZoQe7kdAw/MOiyfN/v1hekdaoQB6kQWp5pD6/2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZwk5ewa1B4twt+QO2foUTHZnPbmHDctVYtouujZh1E=;
 b=Gd3wJHonAVO4MR7FP3Haqus5cUTVujpRcFH/jOCSbyNt5DJMnYBDPRYxzAmZFWnZBtvVIQUutT1AkC4uWcxVYLepOGwHjsjXvgLTdfFs5ro+u32lQquzvwYEMzP5wOh4AMJQZSxSbwqcGIqzwnlmNauqny7Opg/rK3WDBXB9ANlhRE3xFM6qMQ1ODQ14OWdkKtOqEbSdD5amIqmbS3XV5vdmRGGrGMHKBrCDibTmRCdNDP82qkYiUxkRr6OS6JNBV+sULHlqCykjODb+8cktTUUVaSBYvW7iPWD4ZLPYj1DyR5sHxKy+TrKem9mzffkX/9eri++bj7tZ/PROl/eeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZwk5ewa1B4twt+QO2foUTHZnPbmHDctVYtouujZh1E=;
 b=mlB86yoAuuPiKPx8oC2t9XEl/i2mJ/srTmaEpM+GskcS0zW1U3w9gNa78qELMY8wsQ/eJFL7wrAQ7DAC/9AwY0ZMw6uMUMnby/CMaJL9yx2D8iBNZ1QxXof4xSOCTcA1AWEwIINnA8vHvIMHNU1TmCpgP7KH1xHTe9qRIXbEFLDgRsFicxaZdst3m601LDU+3tes8x6BQ9S2QFnK0jJDi0ccAcVTN9lO1RaL1zyd/Ga8aPU/6FVE9IYVW1gvZ+F5dIkiWCd5/n20qJvPl5/m7U1qatSXQ+hrb6B57iBv7nQpY7St7U1hLxqJxqZnamtBFhu7LNHnn57HzIp+jEZtMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by DU4PR04MB10315.eurprd04.prod.outlook.com (2603:10a6:10:56b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:45:25 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:45:25 +0000
Date: Mon, 8 Jun 2026 13:48:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 7/9] mailbox: imx: Move the RXDB part of the mailbox
 into the threaded handler
Message-ID: <aiZXrgvPRZXTnscJ@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-7-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-7-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: MA5PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::11) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|DU4PR04MB10315:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b713d31-0b15-49f4-f706-08dec52123a1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	De30b54uX1cT/QhuRaK2UvyoTWIUhGWjtJs1rK/ZMTGWDmdpOXrmf4yZ8UtDb1gtJ/YmNJc6sACH6wTPIFsFq+USCZFxsCxNQ/DQaUSyoThDJ0kiKjLf2zj1502Ul30F/wOeXiA8+IHt125QIByZUnfXMzBVqc6lo8p5JwmHs/eqELquOVobHQ4wro6efQK/OLtzMjoZ3D9yy9Ui1ab16pnvJCJ7GuH2zdvq/52XPjnH590j9xXhFCV4KrpVrZL8os7JfYtgOrsIEJvjks/l634LwbZG4yLmPvRTCzf+zD+WFrarwLOqTMJzI8Coz9rv+hVsSOgWF/7SDd8JYXvr9NxKRg5EM5pGdguJvJEx69OvvYVc6ofxP9BPzXwY8FvHC7ab/79pmLhRqwVj+7WcvVGxc8iliFLOAZLg2FuJjwgzMd2xx46hq+Tyq6LhPt4ORYC4STPe+orftdUBZSWtV2XXbhEtwjU+o5A1Diz4LxhiOvenHRIEZ6/kQ/UsKF5aWP5epBpR8iS6/aHX7+sOS5oll+AkjLqsCnIlIHlQKJFbiE0N6uBQwycnNhyu1iCPu/ljemJPrEOSuOEfPe4ErGoqmGQXZNy0ym11DHPIs8TvqjBnSgo8F+GgiLmbi+WYNEJaOtV6tRiv3JJk2TEopLaHQsKdc/m5nsgfew522RAmDWlshQ8MruafspFY+B0KF78ReOUsiUAg3v7QUUq72+nId0CUfdlI1v3e/qrDExPOUPtfpyJl8pJQ3QLxwul1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nJ8dHCQbP7Lrhy0SqAOYgNBu31km3hLnY5eyZvlEH+771Omi4iZr4WpAdXI7?=
 =?us-ascii?Q?9zFl666AYVqx9dILDn2JNcvmKH2z9sEZEpCcM45bZSpYYO6BYL3YL+ppuTIZ?=
 =?us-ascii?Q?tWOsw2ltebZlZTyZLEI57VXbH1+oBi7mtjMEUSNVaESjeuCln30wR5feXCFM?=
 =?us-ascii?Q?5dGvxjMafUS1R/f8Y7k0fHbvjwIkJYyr0qjIuc/EMtzWDSLHY7vnUPm37gdG?=
 =?us-ascii?Q?cfaiv2m2QQgpZJGKCmxucSBzAGS7BQuLDbDhBVj1/OdSrmc/jMqTVd/+cnAL?=
 =?us-ascii?Q?iGje0hJ0d2j/CMTQ5wW7ohswwJGxZAOyXYKlQlkyeC6rMcpXZY2D2i2NDBjB?=
 =?us-ascii?Q?SkaXU4Vlx318pROiYYW6kt6Rz9lzgeOnhFYdazZY+sQtyRaa50VoX/lXyfez?=
 =?us-ascii?Q?qcamSGgSrdaDU+NCV4wSj1Nk5WK06ivziPcMYltZMcUHBXFL+hwoICXDvuOj?=
 =?us-ascii?Q?17ExsY0LaaSBdA3iIFsdTXfdqy8ypnvco1tLpQ/CNL7tm8XhlZ5f8En19R0L?=
 =?us-ascii?Q?ctiHIJ2rms9RXo0XR+1fwdSgRA13Ee8moaTPRZO5ev+Gx7aXcWBqBbla0F1D?=
 =?us-ascii?Q?1/fsX55QMfK5Xrk+hIAF3hPyfnMfcwF8M7ApzzrCwsFeE27MwfI5qSxdpQ13?=
 =?us-ascii?Q?xrk8/bGavK3ipSJ8ziyWSu7f0HNudDmJA72pAB7tM1eUVvScnDiYkLlG/6AD?=
 =?us-ascii?Q?+cyFUKxUwgno8gLuu3h5GPsKZETgU/O1+2GQIJxeuiRgLWITXkEb9D230YNi?=
 =?us-ascii?Q?Z3obdxsh5m89z6ojwe+Wu7zls3p+NqJZwg9Dcj601/EPEzQ1WPl2cU8rkLoP?=
 =?us-ascii?Q?uVwnELAJi/5atWE23Fl0Y0Ox/KJv/2Ty2s8zi4ZN0qhChlPLHjcfLDpL+5rk?=
 =?us-ascii?Q?YNqAwTAMMHXIRrwhXRd9xfLzRWG9+MH+EdWipIHgk4zdstS330GlfQyjpBOI?=
 =?us-ascii?Q?J9/eKZZIZ4uIrtx2ydiXpVyu/vGo0/78gsjZOcvXfTG+vkznQ2ncJS1VwFeY?=
 =?us-ascii?Q?rliAG5A7dlp3zM1EwJBgQAWqaD7PkVnpERsID/tIFG3gc351CtRVxgb2A/iI?=
 =?us-ascii?Q?tkihql/b75yPTZI41jdqPTrq2yJS7B1sxMOEQdzOKd6TpvfugkbQra8KtgsU?=
 =?us-ascii?Q?GPoay672QMk85ZmKRrNjDi7xmDF0tlsmrRH/Rws8NjwhqxVG/1dXS/1S6cyt?=
 =?us-ascii?Q?MgI+lU3am34SRtibvhnheeddcOocCgMHNZN8E4ZRuGUdXOX3E9P5Rdk+DxE/?=
 =?us-ascii?Q?hB3gZitOy3UuF9tapqnptW9EyXUQUyBjmb2gs5NsqkaBj2lm6pblt2J0Xptq?=
 =?us-ascii?Q?XQq5v/P/MTICIqAf8cnsXeSSoMvvUSrScUy+jkX5HzCEBTjydwauc3EHjhqf?=
 =?us-ascii?Q?R1/tXLiDTz7I3pm2VcarzpejLH5Xpqv0B2oavr53IRASDgyqxId4sxOxPo/E?=
 =?us-ascii?Q?qpAJ98G42p2UT2BrGtbwzyz7CBVPN6wokzmYZ66csRxTUQHrzvxxXUxphD3J?=
 =?us-ascii?Q?JIq0xa0YnPeJ7wbdl9MUb3PlRAPGv8fwsRodKWZj3rlLZDQ97x7hdUQMLIWp?=
 =?us-ascii?Q?KKxA4LLIHB/OOCWnNYUKYarbBHf+eG7L33QnnDWQAnYli98HcXp88HK+dSeT?=
 =?us-ascii?Q?kA5Rv3+Z2nhrGyJBb33y9LGa9sm+76uKwyJOfcB1yfPUoIo+R7cvIyBisQmN?=
 =?us-ascii?Q?9mPNkB4vhQnYsM3HwP/5ATUAJ6U2Bv318VYsfA7sLwnzcCZldsXVjI6jhgRU?=
 =?us-ascii?Q?vbooUJDnIg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b713d31-0b15-49f4-f706-08dec52123a1
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:45:25.6493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ayk9Jx5O3mVPOVjYomS0lTVfP03GQ6mwTr/GMO3f04c+juBtDYvbNwyIwqIkdIz4wybAH0DmK9pyveIVoHpvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10315

On Wed, Jun 03, 2026 at 03:05:10PM +0200, Sebastian Andrzej Siewior wrote:
>Move RXDB callback handling into the threaded handler. This similar to
>the RX side except that we unmask it unconditionally in threaded
>handler.
>
>Move RXDB callback handling into the threaded handler.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

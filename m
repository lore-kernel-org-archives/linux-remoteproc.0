Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B8272E72;
	Thu, 23 Oct 2025 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761191950; cv=fail; b=BeBn0bjoudolnbI6qiDAgBQsPZjCjCqC74XRFxWtnOw7DcjVzV61YdoEX10Fays5k1ekL8wXH1au1Cal/hwVzyUJFlLNZztiTA5oCvyn7SNqSZniOUyta2jpxqBl66PiV95P66Ld5r88BPZSli004Ep5CyXaMfsKsq/dEGfDfTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761191950; c=relaxed/simple;
	bh=NSGGk0oeoiIlAEifl6JPfaouP7jPn/gUqM4APWQM/P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HZjGcp+HtCoBjoF2MIgCf+18ljKiNeDQeSJqW9lQMXBIjdPIs723fHH9uQKkQk/8/42oCo7eTh7JH2zK/+qC6jQSRYDjUdzgNEgU431UWJlUtQDOvTkoYYUTq6g/s/0QPCZKkGojsaQzFXvoTCqdO3PgZJfsaTj9Bj0mE+rYHkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GTSLtmzA reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GTSLtmzA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIxKGQ3bWwR2guIl7XDKAfLk5HhzLHEbUOK8DrvPLj6SdxvydhDKcevif7Geknlc9DmO7z1+z4RXsSgGg0rkPg5MwEq7xWw1axTTeUHWhEN9ssXUTOoZxkSas8wE9rRXQX1xrqiIeyBNjjO/ugWojHpSxITY8o1SCwvlWom5vPNFRA1GOlPKLP9pEWXEMg+O2x4MfwK4FtQzu6g1AiJx11Tl0CQFORnbK5SHflKBb/qkMAAg7+E2suTmZ/PaW0RaLwBd3A8y0yzf5kVpaVZRqVLQmXNkISDM51q4RAaqOc+VEgULaVD0+bR+8GExkamrZ+d8JyL6y66B5LiAeqE/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vuj/nMOhBqwvhSZYtCDXMZCy1G/ifzlaibi2b0rwBoc=;
 b=e8HaGQ4p0C0Uo/C9iOg422yhoM/H1Ao7pJqZomYLuyFMpfEuaCyK/ITGQ8v/MpSc9ZwuNef7fbTWkSEo0auZNiPtpJyJmsdloTHAwS8MuBSwuiYgygMk5vLkRayN6zMKacZRCDFhWsj88eAQUaxbzsmAS81kXwSjVIAmtnoyz/25ICpbhHBkhVz3DTuEc4QeJ3eIH0kxasDC9+1J3FnbqooxKpkBMudNR49PwF28pbyQYIMJfPccQHcT4g/KB/k/fP+4SdKZbxg8s7LqGyVkl1/k2xX5l3B3i75GrfsjtliiT5HH/mFANtdn9vEtIWDBMEbj7HOTMKP79o6wj8wwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vuj/nMOhBqwvhSZYtCDXMZCy1G/ifzlaibi2b0rwBoc=;
 b=GTSLtmzAKf0jyG/hJuD/ssH/wIpM7DV9hQJGbfXKMt9XO1h8+0I9kOyYTFW0afcarQ88gtZu9vkC6N218fZGKYFZZgQ+csPjwI8N+wYWo18uhGYcxJt+pUCG93q7WYLd7GD0MqsjDfaH/8UsalYsWgiJ+8wLlFXfWpSX+xKeYboMo05/2obbeShaFsAkqh8zE6SeWMLlX9IX+MROAJI/BeE/dUqKCAGqpoVDdrB8YqupQXgO2vHcZtcgUtizpVNYTzA+empSIEVqhurX0HQInbZQkxnW5C2hO8p9MsIWsOy7m4xyP0PDd1Cm602cExkvsfCdOqZ9LRlwLKt79hrGRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10646.eurprd04.prod.outlook.com (2603:10a6:10:58e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 03:59:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 03:59:05 +0000
Date: Thu, 23 Oct 2025 13:11:11 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] MAINTAINERS: Add an entry for i.MX remoteproc
 driver
Message-ID: <20251023051111.GA25716@nxa18884-linux.ap.freescale.net>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-5-b4baa247358d@nxp.com>
 <aPkXRy7TsPCrq_s-@p14s>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPkXRy7TsPCrq_s-@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: d25e9df9-b378-4831-7475-08de11e88218
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?rWaXqhCEnqzrPJ68jgjFIUEfmX3o0Edj6ad9BvnO0Vw/bnhKGO52Lf/t1r?=
 =?iso-8859-1?Q?Q2xAKiL2axMJld/29rkRqFYB9XFfr7ms5z5PRa9lXPYwjoogf2SigV8miQ?=
 =?iso-8859-1?Q?34TPtkZ0h+hvLABRXnn+aMgvsqVqXc5pMKTWu6RdzKngnekArJv0m9mg1G?=
 =?iso-8859-1?Q?yphlMOPh/FRIzjcpjvNG+hP07GM7J1IFrh4arRjE3YFjp3NQiUnkj7+LM7?=
 =?iso-8859-1?Q?6EskgwcarA14wAT6nURKTlNRk1MH05r7vAs6RDOcyQ0bu+dr0V8UxO0q5T?=
 =?iso-8859-1?Q?bP5lq8JhaxpaeeWVI/Ybg9mC52fonTQ3l6Dl3B9TWDRoHjInudc1xwKm8D?=
 =?iso-8859-1?Q?48pwxjK53BjY445sg2x+3xEMnwN0tXo+k35rgvo+Mo4w2k8OzVi9ZsH5GG?=
 =?iso-8859-1?Q?OZaObMFf8Ebc5HQer3V38n2zJ/Dz25fD21TuS2u6pyk/xZXg0K9Z3kQ0hV?=
 =?iso-8859-1?Q?CrPrlBJlvJkgIPD5LCtDlyjyDsP4DiAQLANnemXjmgBILo2DPbRWE2U+w9?=
 =?iso-8859-1?Q?H1P0cTAyzAP3i+LXjinFo0Zl50DW+Eqdl0xo93JmTb5ppeuwgyCzHuqgG8?=
 =?iso-8859-1?Q?7WWpr6afA/peO96QrUG0KJb74b8ZsW/KraMjbPRCd2fkdzs3KFZWRV2CAy?=
 =?iso-8859-1?Q?dXYdpgKd9Un/QiSvBFMRS+ES/MlTD/pf0Bn3kwSUIcqgInAoXll3ozSO9U?=
 =?iso-8859-1?Q?ZYrsL+OGK5aRMGwKSdSVFPCDb8SltEmA28D9rEf49/f6Y+AWIsGLkWEMWs?=
 =?iso-8859-1?Q?YjpG9jy+VNIBb/Zw8Cd0JxyMyi/AFGrdIlXRZO5PINhix71K92YmoMQddi?=
 =?iso-8859-1?Q?17Ajiy2hEO37+s/HUyA3epMeIIlr1oC+OJmPO9zAj6mNCCe/Be/FIjATSG?=
 =?iso-8859-1?Q?YxDj8+uiQPCbsa3P1Qao7Dxlc4REFFRNnV2AD1RnhnD5FNa8ajsudrhf7N?=
 =?iso-8859-1?Q?JiLIvLcmScdRKW73rh/VsbGQkqV0gkq7VJPo7q4BQR74jlXaf7TvOM99wi?=
 =?iso-8859-1?Q?DM/w59S+0wRXAC0joqcYvZk5Q2l61qaBwEnICa2rBCPQUzMwGhf5vQ2pFj?=
 =?iso-8859-1?Q?WoJFVba5rXrOesK9v7kC94BfJd492sD98eiXjEdwVlTjN7mk6Bjmnz8ilo?=
 =?iso-8859-1?Q?ejvTW9bhApibeE/7Pv0H76TLwHjogiiNw2UbEEDpiqR2r6LlBIWI5odk12?=
 =?iso-8859-1?Q?TukkXFocangE64vBq0+fPL15ojsWjnKPs3npCOv49Zs897vUk7J8Q88QTQ?=
 =?iso-8859-1?Q?DgJ/iIivcCh6ZYiyfyGsMxmZHccAd09MfJd2J/w6MhcM6oZmfWMmJOisaN?=
 =?iso-8859-1?Q?smeNVRm7oHhTmtDeD44aH5oyF8ziWU3b12zLAfi+RF1m5EPCrMDsL6/POM?=
 =?iso-8859-1?Q?UfCYL+RXDtvYQ91f/WTmEGB+OzFBUEpLopcVaga24d6f9TPBlvHqG+O/CC?=
 =?iso-8859-1?Q?R7vQj0Z+3reOpYJnrtcZOTrIG2ZhJlhPLHkBeFM/Y3uK0EFRWrIUIlWHIn?=
 =?iso-8859-1?Q?hUmqfB8NkM+xb3I+3Hq6xqkGNPlTBttifCrUvgmUgGsssX/U7/wTrrSy+z?=
 =?iso-8859-1?Q?+iDKVnc9TjP4NPEn7mrDKpILZ0C1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mCQn4S9H0pzSQpq89UHKvmKMvU2c+IZtwH44Q/3djmtjXr1ZYfe73bHn3Q?=
 =?iso-8859-1?Q?HENU28uaUK0dxNDuYs9Ox4TVrxj0Bzei9FX5ezOVl5M3k4+3jxE9K6lXiF?=
 =?iso-8859-1?Q?ndwnBcoqIbKIh3Y1vJ7bN56Q7P5oQ0eC6uWRS8L9ZqUPSo5wqce8wuin0H?=
 =?iso-8859-1?Q?zZOYvTR004wJ4mubk9LrJAEFfAoTv5heVpa0l9zDbFaPwmWCEy3w77ruEO?=
 =?iso-8859-1?Q?YDZX9JB0yDsAyzEeW56IcmZ3QOsDUUcIwaZwrrsLJ4wozbuwRRqNIfnIGk?=
 =?iso-8859-1?Q?+MBb0TJ2HhtIzS590KaVoEGgpHuEI9lEe8BkaVzUnGrU1m0oi9ippUEs6w?=
 =?iso-8859-1?Q?vO+UCCMIV1m6OO4yq9wToz0wKTlMzhNYhxtj4+aOAH3sKnR2X6Y4Kg8Hkw?=
 =?iso-8859-1?Q?u4zqBhI8Zxj9FLFSPmo0dvZaN6eYFOApxc6D/WwEcKB4cEEU2bYXThPy0w?=
 =?iso-8859-1?Q?hpznLf+vvjo23M5lsPluuuaRDBaKDDzf85qaf9w+MD2G6LWMdsGdr+OCR3?=
 =?iso-8859-1?Q?GH6Obh61NplBm33ksnq690kHL4VLKpUFGfG0gsCzC5Fkx2mtjnc8kM341m?=
 =?iso-8859-1?Q?35rRxfsXu5UDjw0QibL6iX4OhZ8i3QFvvbtxWlg/qWTf5C9MStXdyEK1Rw?=
 =?iso-8859-1?Q?HANj4AZgvq6DuS6M0hiOIyLMoBOthRP5uuNVr20fML/SkKUhNxbqsuxb9l?=
 =?iso-8859-1?Q?MxlAJCY22Nw8WwUKf8o2TWzDW7WMtImvDZ5RsKBT4KIkJG40rxye2gklcq?=
 =?iso-8859-1?Q?AVw1XDt9MVCGHcRW7liTA1+i9ukEkBKQb4x7qW99TdSBvOfp+gIpJS8QeM?=
 =?iso-8859-1?Q?UD3kCODVHwq8+1bui9OJr+Ah/daN3vDg9rQLFIGdIvc9fIs8YijFaJC4QY?=
 =?iso-8859-1?Q?aGsqQUdTG7bw61RLAaKqLekxetmVM15CtxZW53iv/q8m60s87JzpnUdksA?=
 =?iso-8859-1?Q?/ManQbP6HmlKNiA9CQ3O92Z5ie8nHidpAwvi5V0AdixMKGYn62p5+f4H3G?=
 =?iso-8859-1?Q?BL64eGR5u2CwVndA0WR+fY3hfnmDWQcWey9Fj/Ak80YfrFpWP61FPHN883?=
 =?iso-8859-1?Q?4GG7YSYVt7hOpBjXD8o+z4CaWwOimYMmp5WhPK0ymC2keA68+429sABl/b?=
 =?iso-8859-1?Q?CROOiewtFf0mY/zo6gg+QktukDXv+AR1aJUSW25hjL1h2yVSmf5YyjVh4Z?=
 =?iso-8859-1?Q?QXeKa05IlWKwt+iJgKli6jkcAKaz4ZKVqjubGPyI2GNQ1ls9c34AlMs9ZT?=
 =?iso-8859-1?Q?RI2dlT5bEYpInQVIxQc3JtfvHF2Xu1T7oswKDHu38o6IRqdEtEqpjruaBt?=
 =?iso-8859-1?Q?TS+/4I70oQ2DULGI31iCjGRJmgF8zAXNpxAJzyDpFxqI7cRMzVdsstZdUW?=
 =?iso-8859-1?Q?mlj5wJ6HrqiQR50yJxzgkUE3d5ojfbGCi8x3qa1PF+YwZPEdOW1A1ZciyX?=
 =?iso-8859-1?Q?OmuVdiUaXm9dLiGWBRXc5DcDTylr+QDKbY9H16JLDJpkI954M37PRCuzJb?=
 =?iso-8859-1?Q?jN0HI20XoG/NCfcfAPSPHLuP4U9n8gkwK0sPrPQNEwanzh3qrAB86kfrlK?=
 =?iso-8859-1?Q?OFCwD36N+vZbJSB6X91rwd6czGttRLqmMkBWLciUZWImNZhEj+o2Ea9xlh?=
 =?iso-8859-1?Q?efBuep0AI4UrBxXGbG/QFnGAUhDf3ToVhF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d25e9df9-b378-4831-7475-08de11e88218
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 03:59:04.9733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gO5jROT+DZzosFXF4JF6qOhFe7vv5ENfQ0sgBtol0y2yf1DMCbW4NU9O5T5uznoRWMw2kMhKZTDQIhHAkFLZDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10646

Hi Mathieu,

On Wed, Oct 22, 2025 at 11:41:27AM -0600, Mathieu Poirier wrote:
>On Wed, Oct 15, 2025 at 09:52:59PM +0800, Peng Fan wrote:
>>  
>> +NXP i.MX REMOTEPROC DRIVERS
>> +M:	Peng Fan <peng.fan@nxp.com>
>> +M:	Daniel Baluta <daniel.baluta@nxp.com>
>> +M:	Shengjiu Wang <shengjiu.wang@nxp.com>
>> +L:	linux-remoteproc@vger.kernel.org
>> +L:	imx@lists.linux.dev
>> +S:	Maintained
>> +F:	drivers/remoteproc/imx*
>> +
>
>Here I am suggesting:
>
>M:	Daniel Baluta <daniel.baluta@nxp.com>
>R:	Peng Fan <peng.fan@nxp.com>
>R:	Shengjiu Wang <shengjiu.wang@nxp.com>

Thanks for your feedback.

I'd like to clarify the roles and contributions regarding the i.MX REMOTEPROC
drivers:

- I (Peng Fan) authored most of the code in imx_rproc.c, contributed 
  most of the patches [1].
- Shengjiu Wang is the original author of imx_dsp_rproc.c [2].
- Daniel Baluta also has done excellent work reviewing and coordinating.

Given this, I believe it's more appropriate to keep all three of us as
'M:' maintainers in the MAINTAINERS file. This reflects the actual ownership
and ongoing maintenance responsibilities and matches the rule regarding
selecting the maintainer in
https://docs.kernel.org/maintainer/feature-and-driver-maintainers.html

We all actively maintain and support the driver, and having multiple
maintainers ensures better coverage and responsiveness.

In this patch, I use drivers/remoteproc/imx* to match imx_rproc.c and
imx_dsp_rproc.c, if you prefer, I could just add entry for imx_rproc.c:
M: Peng Fan ..
M: Daniel Baluta ..
F: drivers/remoteproc/imx_rproc[c.h]

Let me know your thoughts.

[1] patch author:
git log --pretty=format:"%an" -- drivers/remoteproc/imx_rproc.c | sort | uniq -c | sort -nr
     45 Peng Fan
      5 Christophe JAILLET
      4 Dong Aisheng
      2 Wei Yongjun
      2 Uwe Kleine-König
      2 Linus Torvalds
      2 Hiago De Franco
      2 Aleksandr Mishin
      1 Ulf Hansson
      1 Thomas Gleixner
      1 Shengjiu Wang
      1 Rob Herring (Arm)
      1 Rob Herring
      1 Oleksij Rempel
      1 Miaoqian Lin
      1 Mathieu Poirier
      1 Marek Vasut
      1 Fabio Estevam
      1 Dan Carpenter
      1 Clement Leger
      1 Andrew Davis
[2]
patch author:
git log --pretty=format:"%an" -- drivers/remoteproc/imx_dsp_rproc.c | sort | uniq -c | sort -nr
      5 Shengjiu Wang
      4 Iuliana Prodan
      3 Daniel Baluta
      2 Uwe Kleine-König
      2 Mathieu Poirier
      2 Arnd Bergmann
      1 Ulf Hansson
      1 Rob Herring (Arm)
      1 Rob Herring
      1 Peng Fan
      1 Markus Elfring
      1 Linus Torvalds
      1 Andrew Davis

Reviewed-by count:
git log --pretty=format:"%b" -- drivers/remoteproc/imx_rproc.c | grep "Reviewed-by:" | cut -d':' -f2 | cut
-d'<' -f1 | sort | uniq -c | sort -nr
     21  Mathieu Poirier
     17  Daniel Baluta
     10  Frank Li
      6  Peng Fan
      5  Iuliana Prodan
      4  Richard Zhu
      3  Ulf Hansson
      3  Oleksij Rempel
      3  Bjorn Andersson
      1  Kate Stewart
      1  Enrico Weigelt
      1  Allison Randal

git log --pretty=format:"%b" -- drivers/remoteproc/imx_dsp_rproc.c | grep "Reviewed-by:" | cut -d':' -f2 |
cut -d'<' -f1 | sort | uniq -c | sort -nr
      4  Iuliana Prodan
      3  Daniel Baluta
      2  Peng Fan
      1  Mukesh Ojha
      1  Mathieu Poirier
      1  Frank Li

Best regards,
Peng
>
>
>>  NXP NETC TIMER PTP CLOCK DRIVER
>>  M:	Wei Fang <wei.fang@nxp.com>
>>  M:	Clark Wang <xiaoning.wang@nxp.com>
>> 
>> -- 
>> 2.37.1
>> 

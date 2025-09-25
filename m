Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14B221FCF;
	Thu, 25 Sep 2025 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805945; cv=fail; b=hRwqPySKuplUO9+t4xTQODeAWMKx2DWvR/1KGcwFoChQXhEyu9zRXuoPvxy2/+gQ8lY7UZ8rH6ic0U8DyX52eZIPQC5shssSmKUZycP8cRiziPXpq1hLYRibLdN1eAh/ijJDzF624rER7J2KgpzMqYYWzo0pMv4HyDoUrFAfMsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805945; c=relaxed/simple;
	bh=PMeFBmP6K3djDsQRcvvGB81S6gh8zQKstaIWMsTYVH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QmQfjbuAeiRV++FvvLF0uCJbPlRSlxnQaWSR9w+6UzV75RAVyIEZX4Hi6VjxN4JUk5MEQhsvHXbXBsZqkdHX1fORTc6Ep5FCf8LXe01ij2H6eLh1jwgo1fvkOBusvu2PR1oip7j9qYp6xGN0Chqa0hqqfLsAHCsxJq553AYbSFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NPqkPlhE; arc=fail smtp.client-ip=52.101.84.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NPqkPlhE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSP/5xHeLuaYUrAdixD0Ef1j4mOhptUasKEUHt4nOd0hk522Aip7mxdUzoXu0JT3PeYwsOm7v3L5j1Zuhe36NDhFx8JfVkMHN2WH6crlFVmjWPxwqjCo3D6/wcOdXKiQZlKx8/Kjl+QkpUG5ojC//zoold00fN3XmpBLivPvoIqZmKGBjfeDWWViuaBgTS2yJyeEqKccR0llOi7r+jzhsCKRf07gqGrEw6likUyAsPhsRw/uVKaMMO34oKW9P2x2J72MC+GAbNSVWrrDmC25E3uUs86oo/miILNccbwhoP3EN6vmAb3Re3OEYYO9xMLbR6I9PMXxL9NkbokQO3ADuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7ZOzzWHN3KnkdSd5vUJuqCtC0iRjnLNS4D7ErWRC74=;
 b=R0DtP4N+VNkOI4PLXi/ZwXVqy8cYndbRvSQwhbT0/JPufdSPkNPYa1QDgL8LtaM/eTfwlTzcHPaSfVjBDqvuTQXd7AzIkKiyXazlOgAsWUrx++Qg4Xv1LFLOtxm/K7DN38BOSePQUKOgrtTsYYhRq1Bx3ybv8BKXrybHaiLmdUzMPRT3vAzAdgyeaJNDc9tQM0mkrrJwugVkclJRMi6oMIJmkGPH6m6ipLUEcecXPk91x/P+eJVMutu9jj7PjoisW9laNtN9bSAaNG2DpsPIlb8i1HvFUXJJzNIm0zAZ2aYipEMwmK9EFPNWmbMUROIJMKaA9KJStV4u0kTeEdaI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7ZOzzWHN3KnkdSd5vUJuqCtC0iRjnLNS4D7ErWRC74=;
 b=NPqkPlhEWXuW/WDTC8i+dBjYeswtsHHyYOj/G2Dor0GfM5neoREAOGreYr9+PBGD91DEIMVODd6iDx3nIMo3fMmqCy2koeHoX1w7/nT/QwZK0ahabiQGiqvy08oXaKBsRl4nKDHmcQ109UGqxlPahY01f6ZT0+B4qcPgICOxSzuU4MSkPBsrrFwz9Q/w6yK+BZZWP1953qG8Xsn0oaQZSdkcPMfDqQQUHGkqu/h2MKqFzv9jFxELnPPwIcpQpb4lErrv/KiU2yL0nHvyCh26+xw8r/vz6ED/arzMkmYiWfplDRzQ9kDsR7GO5WYdxmHcKDKuVaRvSMzfgQfPE2OI+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10771.eurprd04.prod.outlook.com (2603:10a6:102:493::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 13:12:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 13:12:18 +0000
Date: Thu, 25 Sep 2025 22:24:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup
 order and error handling
Message-ID: <20250925142400.GA18572@nxa18884-linux.ap.freescale.net>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
 <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com>
 <CAPDyKFpjP07826FXh8XveXiH7ta+N=upYaowf7r6gyNWPSFfqA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpjP07826FXh8XveXiH7ta+N=upYaowf7r6gyNWPSFfqA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0138.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10771:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf42457-2c6d-4e08-c1e5-08ddfc352743
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CJoZDBMeKXG9qD+6bkCrYncx4yhrVbCZSbt+ehqY0O9yJ7zDLEaTNevGbQnN?=
 =?us-ascii?Q?ZDw9zBcfqsplBoSYIOlzGV74n4CRidfCYvGirC7Vcbb5OS/I3r+KdHQ15cNX?=
 =?us-ascii?Q?C4TQc+d6mg6hixIlpk28foL38FyUsi5boMPlgG9FeUvA6V1mkInKXY0tY4Ic?=
 =?us-ascii?Q?rtQOWQdjq2+jEo7zXsmeoGUqHQHCi+IRd9pvVZ+0gIvpJorHEU7jJT/j+J44?=
 =?us-ascii?Q?XzRpUGa6ctVcXY6EdW6com21K3Aw45aZUXS4+hz6Q4NA0oJ935RLVwbOGRDc?=
 =?us-ascii?Q?2j2hEm3TMxgi2N/khOhYG6Swbm+IHb3cH4yAYOk7gkG96HPTcLZgpmMPCALT?=
 =?us-ascii?Q?auaJswUFYN77N99m8M9ZDteNwIxLSWp6MLNr/ACyCuQJjHlKGcZHVEVZI1Yh?=
 =?us-ascii?Q?bZYDnBnpau915wST0fRfOXPubnaKS+kc2NdbaTjwO3UcsONhuga0SjmG3Hup?=
 =?us-ascii?Q?K+xT4eVtYlyULhv4e3NWTq9rjI9lY1TczaICBqRjg6MLlGofrqByLxDNUQI1?=
 =?us-ascii?Q?OtKEpE20MkmIg2IJ4aT/lfnrcVkrKKbUaY4pEvKgyQgbJCtIUW1fmY6Xge9c?=
 =?us-ascii?Q?lcThk+hoCJK5/ponUxnxjf9NGq/msui+1bYNVvAvzDbb2N141DVt7slGpnYK?=
 =?us-ascii?Q?i3KomcQXvotm1wckvsb729dEyg0VikBnxBDq6FLMohGRLd5haYJ2V2lIUgSW?=
 =?us-ascii?Q?zj/PJR4fCwexbNhV7q232NJp8wiT5+SSBfQgeoQ4/6j6Updy1Fa/xu377Uwj?=
 =?us-ascii?Q?IRpYmll5kBYehRzotbwWz+zYWgfvnSbdOow+LfxwOCO09f6ElZQ0bZAi+/4v?=
 =?us-ascii?Q?a91RaC9siASW4nI17+oGsggGd/uhlp7yGKVugTRZDHkchNy/ySIOgk/s3PBV?=
 =?us-ascii?Q?gi2XyZufzObMRkAWSLNRfUbKmuD28egenRVGRdV5B9cmoPr2DuakCMMOrJn9?=
 =?us-ascii?Q?gsTFAOLxdIgjSc5NQW7QMnG9CQ68F6/zei3ojjIORLMt6oVU6L7GIrT9dpzI?=
 =?us-ascii?Q?lPivVphvcj35T7sssaApPsLGYz1h0oZmd4TVM4wpJpe0yRaeG0PXbZDnI1wR?=
 =?us-ascii?Q?Wzd9vwXbiMWDQeLF08BgpUceoHKoxDVMIr621CvhbtE6AESiW7k0cQ9ub5mq?=
 =?us-ascii?Q?3hVT7XxAbUZTUczYG+1oJ9jPkNGRsGKhGIe8R5giuftpvPKiPC1p6coV4cU8?=
 =?us-ascii?Q?cYlyce+PT+nisW7ErSxxGBfdnIvUJ06rt0PjpBGZLM+g6uBwNk7TBm3wXqRi?=
 =?us-ascii?Q?xhekn2u/xPSO2a8hmFzjRPLfzGJ6PuwbGCjeN3VgJZyzKPeACIQ6OJNVp7y3?=
 =?us-ascii?Q?NBgtmpQg0YNokpdgNt8gcvdsw/iBeBLGPO3S221YU0vcLdEOf27qnBfghYlP?=
 =?us-ascii?Q?qjTpzqgdvkp0t4wGE/24MxHxCnIJ6TunAiI7eShVA6PgR0a/nLqrkUiBrobi?=
 =?us-ascii?Q?QzXQtODCQpfiyOTaxVtZIKy788E265knwvu29zqoqJllz4Yf/JnoMdJf0fmb?=
 =?us-ascii?Q?7c4cInXNl5pi160=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sJZnvS1OffPRZHjukIHmUJrMMQVU7vj4tQjQMb85rCol1RMEJ9iJJjkw9sTs?=
 =?us-ascii?Q?yzMsQygODrWCmngifLTDxedKWl7A65RaOZhhf9ZiBdrhXg6hY5bPS/vgYELx?=
 =?us-ascii?Q?Y/qihnRhudZF/ITrMx9UtNE+ut17fPBMFXtSjf+7XB5Ijh/QvgGvMdu5FY38?=
 =?us-ascii?Q?EZR/uDpTMXoF/EXq3Laj1z1ci8Lk6jOnGl5ajWKM79E32ACFbUZ2+hsqy5um?=
 =?us-ascii?Q?HEjnAAofe6apc7mwdUGe7lYD8FevpqAzuEeC4r6sNVNroe2FYtnBIMdQnb9m?=
 =?us-ascii?Q?H5XVe5IfnOXPdniMjuyxR3iTMZEfESaqp5wXCn/VV00FdBF0DcXdUYV9f/KV?=
 =?us-ascii?Q?lPMcHaFt4XuoJEtzW1i1qNwXHcyun5tiVvfEV6Quci1494G/68ZV3a4PzJZ+?=
 =?us-ascii?Q?hLokQV6sqjh0OAbRZ921mHo3ptK/2KDArvojimRd0Mh9797WbHVhI7uMUHXH?=
 =?us-ascii?Q?OlY+TULMXMsOodqqivogZofw+pjUmAQ3SyjqaoKIVnWkW9Nv8c9q40gTQ6ze?=
 =?us-ascii?Q?afY2XwwlD36oCiykKdHJRjhbD/kkk7RMgkyvtX9algUn/VZZB103koBx3CBe?=
 =?us-ascii?Q?3YDW1e571LdeZ82czplI9fu9ZpQ5QWnRPFjSfW/rs5gnecCrWeKoHWsX0uLV?=
 =?us-ascii?Q?Y6QNRhs0RffCIs2CVNCzWkAC9F3ErMhMOpKTjqlKWJJdZoxU4j+JCB4ahd4O?=
 =?us-ascii?Q?0DTRklrqlOzwCkVGzUwzEBwYA+jCj3SFdgi6hiY3zZd9mGfuevtzJLrK3oW1?=
 =?us-ascii?Q?3OWwpwtWXENTABwLep1JXCrNGHm6xEnk1YEolbSZOH7oxsnV6lotfd3rJKOH?=
 =?us-ascii?Q?ppj+rUzEmwtCVCtlvVwtrYhM8x2eoBkmBJO+v1l5J2kYK/NmQPgoZPzsK53y?=
 =?us-ascii?Q?Cd5JutY5zkAHi6aA8SGpyFIc3eCROFA8GnUURtcI7XnagGQm2IxsnxkJTBdf?=
 =?us-ascii?Q?yFYAVHDa+frvkxMYWfq787S6nnWqnrJGMh703fkJNBPSX0KwlYuTw3/7Ve/A?=
 =?us-ascii?Q?XDr6WXXNdsE+ndO4xkE+mv9Gqfay+C4LUalI1EO19xFLjmo863C/Kkwnebhm?=
 =?us-ascii?Q?MkUS+r13nSZ943NXIpIqzJ9WdZXyNbnb/CDz8lox5FQeOupph/UbzTGlUxMn?=
 =?us-ascii?Q?c5/FxJYYyghlKFXQHcNxF5oIxmZga/xTf8k76RlxIxnFbze698WpzmI2Wv+f?=
 =?us-ascii?Q?XVuWVYauy38BiSxwVQE6GX0Q7EviPkXy0X9LhH4lTG9idcUpGKSqeZ1S9WUe?=
 =?us-ascii?Q?d65KhY2z4Pa5fVCb9w1nxpWQ8huXHsk5tRBg7BEg76220/AWbIHH1N35uAT5?=
 =?us-ascii?Q?cwvXiMub4YgFv1BzkIKaZLtpyNhfhPMQqaE3hquthv94ROCyb0CLiK+Ywusv?=
 =?us-ascii?Q?tWeH3fhYOdkWcpWwPRJV5FHC4h8dqc6bR6TdkZV5trkJZgCE+HlHnf4aV/oq?=
 =?us-ascii?Q?v/dI0MxozsZH5+0CyZXTmBdV1LkGOMwcqnSzb8A9CNYa2GNO95IGhnXQ5AXa?=
 =?us-ascii?Q?edjKMNslV3cLpZMUG1S/k4wglJxotjuYG3oYyv/n2wBbcDBLXwZi6IAm09Mq?=
 =?us-ascii?Q?gOra80mQOxC7RrtKqtMI/IG2xNWZ6rZRFKcWYx3W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf42457-2c6d-4e08-c1e5-08ddfc352743
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 13:12:18.1620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJIY/L2dp1WxG55wKYKvSONAME6QtckIY7SNJAg4tFlzJErcPBri78ENRXoOQKtycZb1WWPbSnIF0ot3ozjFCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10771

Hi Ulf,

Thanks for reviewing this patch.

On Thu, Sep 25, 2025 at 12:18:39PM +0200, Ulf Hansson wrote:
>On Tue, 23 Sept 2025 at 07:17, Peng Fan <peng.fan@nxp.com> wrote:
>>
>> The order of runtime PM API calls in the remove path is wrong.
>> pm_runtime_put() should be called before pm_runtime_disable(), per the
>> runtime PM guidelines. Calling pm_runtime_disable() prematurely can
>> lead to incorrect reference counting and improper device suspend behavior.
>
>This isn't entirely correct as it depends a bit more on the runtime PM
>deployment.
>
>More importantly, even if you would call pm_runtime_put() before the
>call to pm_runtime_disable() doesn't necessarily mean that the device
>becomes runtime suspended, as it can be prevented by user-space for
>example, assuming that is the goal.
>
>To make sure the device is put back into a low power-state, this is
>the typical pattern that is deployed in a driver's ->remove()
>callback.
>
>*) Call pm_runtime_get_sync(), to make sure the device gets the runtime resumed.
>Not needed in this case, as the runtime PM usage count was increased
>during ->probe() and not dropped).
>
>*) Turn off resources that correspond to what the runtime PM callbacks
>in the driver are managing.
>Not needed, as there are no runtime PM callbacks for the driver.
>
>*) Call pm_runtime_disable() and then pm_runtime_put_noidle(). This
>makes sure that when ->remove() is completed, the device is in a low
>power-state and the runtime PM usage count has been restored.
>
>*) If there are PM domains, those are turned off by calling
>dev_pm_domain_detach_list(), or from the driver core (after the
>->remove() callback has been completed) for the single PM domain case.
>
>That said, one could consider converting the pm_runtime_put() here
>into a pm_runtime_put_noidle(), to make it clear that this is only
>about restoring the usage count, but I don't think it's a big deal.
>
>>
>> Additionally, proper cleanup should be done when rproc_add() fails by
>> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
>> the device in an inconsistent power state.
>
>Right, this deserved to be fixed.
>
>>
>> With using devm_pm_runtime_enable() for automatic resource management and
>> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
>> enforce correct PM API usage and simplify error paths, the upper two
>> issues could be fixed. Also print out error log in case of error.
>
>I really don't want to encourage people to use
>devm_pm_runtime_enable(), simply because it's not always a good fit
>when making sure things get turned off in the correct sequence. In
>particular, as it's just about saving one/two lines of code, this
>doesn't make sense to me.
>
>I suggest you follow the similar pattern as I explained above for
>->remove(), for the error path in ->probe() too. So, calling
>pm_runtime_disable() and pm_runtime_put_noidle() should do the trick
>for this too, I think.

I appreciate for your detailed explaination. I intended to drop the remove path
in this patchset :), but need to keep it now. No problem.

Follow your suggestion, I work out one patch, would you please give a look
whether this is good for you?

You could ignore the 'dcfg->method == IMX_RPROC_SCU_API', I will drop
this in the patchset to make the runtime PM apply for all, not just
IMX_RPROC_SCU_API.

Thanks in advance for you guidance and help.

--------------------------------------------------------------------
remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path

Proper cleanup should be done when rproc_add() fails by invoking both
pm_runtime_disable() and pm_runtime_put_noidle() to avoid leaving the
device in an inconsistent power state.

Fix it by adding pm_runtime_put_noidle() and pm_runtime_disable()
in the error path.

Also Update the remove() callback to use pm_runtime_put_noidle() instead of
pm_runtime_put(), to clearly indicate that only need to restore the usage
count.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index bb25221a4a89..8424e6ea5569 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1136,11 +1136,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-		goto err_put_clk;
+		goto err_put_pm;
 	}
 
 	return 0;
 
+err_put_pm:
+	if (dcfg->method == IMX_RPROC_SCU_API) {
+		pm_runtime_disable(dev);
+		pm_runtime_put_noidle(dev);
+	}
 err_put_clk:
 	clk_disable_unprepare(priv->clk);
 err_put_scu:
@@ -1160,7 +1165,7 @@ static void imx_rproc_remove(struct platform_device *pdev)
 
 	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
 		pm_runtime_disable(priv->dev);
-		pm_runtime_put(priv->dev);
+		pm_runtime_put_noidle(priv->dev);
 	}
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);


Thanks,
Peng

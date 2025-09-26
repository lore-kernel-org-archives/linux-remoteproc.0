Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B0283FC5;
	Fri, 26 Sep 2025 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870915; cv=fail; b=QylX3ssiPWbLP8vEQpR5HaHJewqzvPaSaz/POSAwDJbMArEEb0lln1oMofbznjvegkC0XgmojyapVeM5dhO62DUKYB1a06HZPWObtPHyJ0VvevIacj3/9ifyamPUxynPBA3OHbddw/8f7Gg1t1u1Pbljs+q1WihGv65XYiABhTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870915; c=relaxed/simple;
	bh=KCMneI2qKNjjfxMR6CNicSY8FqXkVQm9bSmntSWxTVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IEbJII6X5+LEpLqOOjqS0WBpD+CiSA5QwMi4sef1AkA/EXfHcfAYuDUs2CSkdTnOGjCVNJcsL7iitjCCrTONwGj9EVwQbgXuMj5MQ1mEAogurTignI8xu/6HJ6XcZhx+M01rTYy4We+uXtstYTBb33QITd51CfGUnw4QXcZwtf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=soXnLxP5; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="soXnLxP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH0carA2SqlQpK9ib+Y1w08f7LkzuNj+PCvb9cgSqZfSxDYBayk6CmCwDZ6/5DnD4VGbONo7IJRcd5TS5kwSTaB2BuY7gUSmPCa5qx7FlebtgyR/4uURvPLam29fmfbRM+ZhxtamHgZD8Arp7HIgIOaJsORv+Vw4gDU9W8uK58if4NDXjGPmiG8xUnGopY7Pm4oscdDQMaDaopIrMCUiyvFA1KuY1PV4bVEsc8j5+us/Ir2Ud1vduquTwiMcwHqKOu/Y6a7JDQdGP4YY5M7ZiT/Qg6FsUmDtny+NOGRrRQfK6Pty1FVRJZt78iVwkMN9P0WoivNNFIVC7/os0nA54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5GI18a0Rv0wtOjT8DjM/6ILXIW8znOVC+f0Lcc44ts=;
 b=fvkp+4WVE8OynsH1fSSBuyAR9GV4IHTkflKJLLxNLQNCcEB8Y4DUzRMliHiWZUp/EZaxSxl9mLUcExJEQqDH/zag2lSblDpbukHFLUFTPe0MQkTvmtkmSuPmARrwQp8arPk5LlhSW4G+6aTg0caMBYg803BA4mqAcZGRlHkM+0tadRe6I3Z8WvLr1DWAzpo9VFsuc0bbeIOcMWAg+rU3BydIlpUk9GDouJafNHyl1WfQWUo00Z3S4hFZjqKsk0A24RWymC1wd/RE50Uy02Owc+nqHLO2bOZ0clU1F6o1VPee1XUGhuGW6iLAYUBxbRZZM62Sp8xIq47a2v9Ar4mn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5GI18a0Rv0wtOjT8DjM/6ILXIW8znOVC+f0Lcc44ts=;
 b=soXnLxP5l/QaCiAGYRojRaZ2/rmX35q+/AUCTIGLG5cE8qqn3N1ANceBJCzTaSUAou22rAP+6APIXjljlRb+hBr0J71V0jzCLgOQYiIs9XhswZIEUpPp1OhBFo0zWtXZVue6mGCMScno4qStU2ZbM1QWspgEQzS4hOCdmp7ivDtGbcZPS4g7ZpD2rWw2aqycBGsfTEiixYOF0M0vubSlSXiz0AIkTgYvhlxlYai/676ijohztDRFik5WpVhqIqXN+Hmq9uPdy81xyUy4fmqE+Ep0DDjavEbRc098x8ZCjt/a1/4kLj7WehUtqS9F7ZtXEd3H3/cB7RtKTpi6AQlLhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7129.eurprd04.prod.outlook.com (2603:10a6:10:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 07:15:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 07:15:09 +0000
Date: Fri, 26 Sep 2025 16:26:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <20250926082655.GE8204@nxa18884-linux.ap.freescale.net>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
 <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
 <CANLsYkzWQEWKM-_iff7wY-sk_OERFiAMSrXP6Cyf8vJfXqunjg@mail.gmail.com>
 <20250924203115.GB2711@nxa18884-linux.ap.freescale.net>
 <aNVe6MG2HiWNJZQP@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNVe6MG2HiWNJZQP@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 70935d2d-c927-44f3-64bf-08ddfccc6b55
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TNhStKUQhedpDaLrrcd5qNv2qWcS6mzVjxTM0llD2Dqrs8VD2/FTiHHGv9IF?=
 =?us-ascii?Q?2XCAWXixLBmBLXr8jLjG6dQXhTkY16HAFVxiqbWEyVqYaGWzyxGB+9Hrj4jD?=
 =?us-ascii?Q?0jCq5ZOoPlQN3OLlg12Eeg6ff47nRFL3ctOyGWx0Iy1sEbGcp/hEcRPnJbdC?=
 =?us-ascii?Q?OjvPTwEe9eoQuGcpqUqh8uBHilwWjdOB/86qqjwbiRDMGRtCcEW7d32jFI4W?=
 =?us-ascii?Q?IPMOpG7+mlCHihXcw60kujhh9LmL1JzNLHD6CrgL4ApA5piWCf2CSOTPKH/z?=
 =?us-ascii?Q?euLWoi5rIOjnzwL78lT/9ITsN2bSVmSR/A2gg4Dy1zxZuwOlNal2D9Nz9MMT?=
 =?us-ascii?Q?E7ogQ29mgdvJmm6bc3V1x3nWcAeG5/0K0M1UYCdFCIWlz+bCPzUfrkue4NBH?=
 =?us-ascii?Q?k1+IDHO60oXADEh3c45RQdDyp871SD4QzuuTRIiL7DYu4yZ1xNriPprVkA7B?=
 =?us-ascii?Q?/YX1Dr+0Y7KlwvqDCTIbZa3G6CjQ6K7hsYUWICAQtOQrgJ5CBy9MLPW03r9s?=
 =?us-ascii?Q?CH8KJRKxSKZUKY60umn36pm3JuVv4iJN/sW3eHTHKxFw35JdGvQUHBH4TS4N?=
 =?us-ascii?Q?3SXHQCYj6To5aA3FZ0CNhERxN86yBTlEIfGQEMC0q1+uD3F/3T4lpDu07hfk?=
 =?us-ascii?Q?MaPSeeonYQ5/2cQIGjb4MrlJ5PKI/z9+wEq5cLyDOY5HPpHVxU28B8zg+BXx?=
 =?us-ascii?Q?RyVlzXRf61UwL8I0amEjaMlt4ir3+Kwvt3Jhh7fdL4ftXYdzzMnb1v6L057O?=
 =?us-ascii?Q?thlb7OXNxPqqFYf4CSMbZgBHNTQui6fqcfkrESwjwmf/mICh2mTRAGSTVgNF?=
 =?us-ascii?Q?o79wtJ+JN29XCnM8dP+EXwa5wEZx7LvFClSobE3on3WQ7eAaSfcIdFT6xJoo?=
 =?us-ascii?Q?v8BCssTc6r8T0NbcFkGwPJah752UC+wjVCRxKe1wgIr4sgHSzUhu059vdrAW?=
 =?us-ascii?Q?9vTcSaxv2fPmX2RhrtVfIrJmwc2KOnAPPwgzwdeIJo7XtgAD1hR13Y4BH5fo?=
 =?us-ascii?Q?wcsRGhae/ohIl7zzE9CPdnRQ0CHCqmEnrUYOydH8u3OrtLmJ7zeF1wBnh9f2?=
 =?us-ascii?Q?zoAa734z88tvjjpXYMwssWhOEbe2b4wmfOhAL9I3Ix/Han5k6qT9NuFEHpTq?=
 =?us-ascii?Q?EU3OJ19iJuSLq5eZs+f6lQ0kxiYEITWrKEwzm1Msr9fkXtPzDI+uI0fpUKGf?=
 =?us-ascii?Q?FSr4TptbR4AxMkUuiwwQK/qlXaXIqiFtbSRomo8ulVh9TbHwTU9hNe5UgeQ+?=
 =?us-ascii?Q?vkHvSgUuotT7B4ZdOR/xmGjLOPLJrX0m7kGpnekGWsiCQ1XSu+6p42TS02zl?=
 =?us-ascii?Q?6tyzLTCjdc3efW5eCAG2iAJhVS507mrOf1hH2seYme+VEKAOht6B8kk7hWh7?=
 =?us-ascii?Q?uU7EMOtubXfqexcQVCYi+avXRx4BoDZyBQU3649KHghfXzYJKj9M0pyW9nOD?=
 =?us-ascii?Q?wCh+dg58vVf9vHxxTBBRJ3JDuJHAuiPNmJlUF1hMJd7i4Ut469gvs6F4cJm6?=
 =?us-ascii?Q?QOH/UqB2oqKIPINIGNnQBnPS3I+Rk2kHIocD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PzUNVxtrkBsOs9MONEVI3CZ3JSpAD9t6qS1+y1QDk2h0xJOOXJp3jmQH8uTf?=
 =?us-ascii?Q?KZLO3bOzzS5aOo4Br8Gfk3JWZ5bRMtPRU7bR9A0pcC/W5Q0rpcnoEf0iO51I?=
 =?us-ascii?Q?EJpX+7XJxqAqH+Z2a6HiPD2cXr3uzPjk1mP0oCL8slWoiwdxjgOr7gl68vxw?=
 =?us-ascii?Q?qDGjq/7p1Lo40XTnOjFUNxn2Cb/p8sryxNFf6RgdAZXzd/CnsjIWSZx+ttFM?=
 =?us-ascii?Q?FNbn1Q3aZmYjCdY3wdpZ1Yc2h79WyyklvTLQqghGeSUaeWee6whBcQb8y0fB?=
 =?us-ascii?Q?4aTAI/vBlGRNLpo1EZc4mxaVK36Wvslf4DZiUOBMdVsMabQqcbp711uJWzh6?=
 =?us-ascii?Q?MIvuHNOvxhBvP3+qskSmVuALGEJy5qSxCwShfh7T+80nap2VGUMS2xfx6wsc?=
 =?us-ascii?Q?iJwIUE5yfSY58/r90rDAsZYislqaYNEMp9FIrDZ2P4m53hQudyDLjT0JRHdq?=
 =?us-ascii?Q?BXha8l6zQ1lX/RX++pUFh8TNTyPLNF7STUIk0TraV1ow9nd5SSCHdp6JjCyM?=
 =?us-ascii?Q?nsXuW8Etp7yR1mLmsP5y02/Y5KlV15gV9xdlyXeqoYyhwUPFJzrhTkgLiJU9?=
 =?us-ascii?Q?UDOb9JoMcLQDwdhrjaPCkRsIHQ/0KyenftAKVDtQBJgEOn6pNcNYEpRxuI4B?=
 =?us-ascii?Q?vZ25aB/rc/dJ+O3Vi8xq/zUd9f1yYRkkt32kKywWyPspYUAeyzkQmF3IPuMq?=
 =?us-ascii?Q?Pmkga3jpQnLCZNERR0zDsTgmBfAHeaQe5VCMWzO5DqNokaaD/arp+3oDcM+0?=
 =?us-ascii?Q?89xTx3jigCqDDqea1o4FmKZhIvJja//cjVpGGd+8C/PEoRrzpiI7CAMSa5hR?=
 =?us-ascii?Q?XDQ3Xfd8DU6Bcyi/PpFFAUNyNr4bMvYVM+iLXB77HCUIe6/LCvDKeFf0KOFl?=
 =?us-ascii?Q?SvQZoWvzWqLYOs8wim16NxMdID9ZVwX1UlHtOR9sZBC9XyF1v3dTHrJ62v79?=
 =?us-ascii?Q?Ybl9vIWDtj6idD6Fq7RVj3wsoQCmXzdbSL2xG4cGJ2/gqcL/wV8LsMor/CcC?=
 =?us-ascii?Q?jmQGfgwEkLc9m1rwpL+NOgmc5DM/VjxUC2W9nWupskUHxxs6kKLtU98W3nQw?=
 =?us-ascii?Q?h6qViKF6lem9JMrPlB6C5/NOWAIV/8DmkjshekpAVlipbBa8egfcxZNXUgEM?=
 =?us-ascii?Q?3CINbqBZn/tZyR0skXEo8XXfbf+bwUVnAePU4xYdCXuU9vaJmKVDrqGBbYtr?=
 =?us-ascii?Q?ltr/NzJezbMH8zrjXbVrnM2YOzXP6Ka/HRobIDi9M+8lrsQy4zDydKvepuO7?=
 =?us-ascii?Q?sp0t42T35qSskkG+uzH6yEgievohDusJQGoda1qR/5lZ5/B+gNFdcAkoRvuX?=
 =?us-ascii?Q?Jr8D7XZDwaBt5kDHvvZo9vBXZzr5UBaKJyeRVTjUdr48+I3KbuwDK93wpTJ1?=
 =?us-ascii?Q?6yddeNjmfTggTda1JxKW2+f/pWFR56eIy8R6VCy+jZoo+Vkp2OScvrZxJxlY?=
 =?us-ascii?Q?A8vJDeyGJTAtL8f9uyd8hyF2qOibR0Oa1QeZ0GU1sJJQwoXbZU4k0I6orA3B?=
 =?us-ascii?Q?cfJ/KZ9B+LtaBYXykCbwPZ63+GbZg4azk+0Sk52NC+0Aqhzf4/e8V6rzwbb+?=
 =?us-ascii?Q?dl4UDZN7E1hoZKsAodhhSYHGaOzcFAqgUKU6FZ0d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70935d2d-c927-44f3-64bf-08ddfccc6b55
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:15:09.2138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+QXRJCPKKTtIViYV85PGUAwckzu4ohbyLCSsQAbGpWm7hqrGMQ3v4uBtieqQdgJuIU1W5OUX7O2xle5xduymg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7129

On Thu, Sep 25, 2025 at 09:25:28AM -0600, Mathieu Poirier wrote:
>On Thu, Sep 25, 2025 at 04:31:15AM +0800, Peng Fan wrote:
>
>It is fortunate that time was taken to understand the problem and fix it
>correctly.  Otherwise we'd still have a problem and more patches, possibly
>wrong as well, would have been needed.

Thanks for your caution and patience.

> 
>> >
>
>Most people tend to address one problem at a time, especially when subsequent
>patchsets have dependencies on the previous ones.  I'm not sure there is a need
>to document something like that.

I will not post dependent patches in future.

> 
>> I ask because I have other patches queued that are independent of the current
>> series, such as:
>>  - Reintroducing the table_sz clearing
>>  - Misc cleanup in remoteproc core
>
>I'm fine with those, as long as you address just one proble at any given time.

Thanks. So multiple patchsets/patches from one developer are allowed only if
each patchset/patch focus on a specific area/problem and no dependency.

It is clear to me.

>
>> 
>> I understand you may be busy and have limited bandwidth. Would it be feasible
>> to offload part of the review work to Bjorn? I rarely see Bjorn reviewing i.MX
>> patches. Alternatively, could we consider bringing in a third maintainer to
>> help accelerate the review process?
>>
>
>How fast do you want to go?  By and large, I reply to patchsets within a week,
>sometimes two when things are busy.  And when I can't meet those standards, I
>send out an email to the mailing list with the review order of the patches in
>my queue.  What else are you expecting?

I have been blocked once [1], this make me delay about two months to post out
i.MX95 (: For i.MX95 reviewing cycle, it is not that smooth. Anyway, I get
lesson learned and will follow the rules.

More and more, we(NXP) are taking upstream first. And I have requested Daniel
and Frank(both are very experienced Linux Kernel developer) to help review, so
hope we could move a bit smoothly.

For now,
To imx_rproc.c, the queue:
cleanup patchset2(at here now), cleanup patchset3, i.MX95 support, i.MX943 support

To imx_dsp_rproc.c, the queue:
Drop method, switch to use ops

To remoteproc_core.c, the queue:
Introduce back clearing table_sz.
Use scoped API

Nothing special to expect from you. I get the message that non-relevant
patchsets could be posted out for reviewing, and one or two weeks is good for
me.

Appreciate for your time.

[1] https://lore.kernel.org/linux-remoteproc/CANLsYkyEhhQA5KOsNveGSHUc3ZpckoL-CCHNZ0DZLMNYdNGzdQ@mail.gmail.com/

Thanks,
Peng

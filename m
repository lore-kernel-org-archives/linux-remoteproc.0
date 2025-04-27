Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2501CAA4;
	Sun, 27 Apr 2025 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745716888; cv=fail; b=ftaC6J24hZ+k6ZQc9Hyi7zwT9bq5RjsVgkZUFkUKvU+IFB+ZHWwNS3gr1ttCk7jB9IvRtzASBMffGA2bdMzm0n3Whm3RGzPgbW4Vj3+FqwR7g82gj6in+a7aTWi+AIR9WLLy3MIo1/4FnhFrWRoyjOatY+CiEE0oWDfwzyolbXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745716888; c=relaxed/simple;
	bh=wqoVjTzGaVuccUiw59M9Hi6npaPJ93SSCqwSjptvl1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nFQa62Zff/U81Zwk4pRmdoAyeApJpTgm7EUouGJuFJRX5n8Z+ZD+CP99GNFuS0fGvIFH+NJ3IVB5G0DYRjilLFMACyXVW9kKaWeiSP3ilK7/OMRzK23GJASToS1TRd3ptbDYOexK/bu2KxSXSNfxruE68/CA3X3GU29gR7kXo0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iI8GCu7N reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iI8GCu7N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4A58zf9KjowxxIsYVfaVDAKcYbpC94Z9RQAS5pFfZF719CMCPKit4CkL1gD3xFcibQrRykCZoUqe1LqtQ9SxeyvHtDwrpcBx0mXRMui1fgWjl3ND8SPVffvcqrJAIDm/dj79ytMcX3q472UD7YezYIetfmadxOg8g6vv1ob+ADLzlqD1jYl4fxuLwsZkaVJMybYEzSg3h5dEohEYZJRJTGhK7igMkXPZnparHi621n0Oz5wRBTBXr6zIS2PA3wnOjNyE6XCKgGuDJg7s5Sy+sUgL2Bz2wLeS//KjGOTzVSZ4Zsm1a3iPkdcO2e7LG5NVqNvzKA4WeFB6ULCBUls9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa4exTbH2DpULxI25zqOaJRcYVUFlekIyoS3MlGPubo=;
 b=ZZGhlcDYGVVqMzayTRhQdKAralXfnnzZ4i2ERPDraWIvzyohJhmFvjnNb42NJppOHi+N56IfAIAjy1rQj1/fRf2I2OO2ac0QhEEJccJcCu9c+kmOGJyuyS9dNo25XJR6CKT81NyvgFle/QXcXfjp9h9vc8AfJca0e/ngpJyi7QzqsOMpL5nMVvJTlOBVhYy5alRLuRMZTqG0zGGFl66FIs0Cv8tun5diXwWtGQfoAxO+y7d7jg6Wt5aKOYZbK24PQn5wR7mDtUpRHvWsXf/mmSCJifDtoZWcUwZExSywpTr8ZoodJWSG41KbeaT4a4z2cpmmDk2+uzwVqCEeKcdFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa4exTbH2DpULxI25zqOaJRcYVUFlekIyoS3MlGPubo=;
 b=iI8GCu7NWGr9/ZrFOiFqoAh5q8BuOnapIFscMvJ3boLZydwt3GATXHQODN3JlDG3TIhhHeDcU0+bgH63OXi16dnF1j0mEP/k438yD9pi4V+3n+VXI1l2W+7w296rXLjH3SSPEbPOeUdf4CLm7wnbE0WgGhnlvw8RFX3UijKYCkOnk7ta1Wqbh/NFIEo8au3q1IPYC84/8DW7kO5kyv851n9GWlTWJC9DA8E373Qw7BO58KfQPK9u+UhiTv6mMxQagSa+QLzNGs0xgJgarkJe4VKzmL90nOk6KDiKboZlqVCdog//V4kFTxKC71YvG8KrpQvWIG//+Xa32FyVHnqbLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7587.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Sun, 27 Apr
 2025 01:21:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.025; Sun, 27 Apr 2025
 01:21:23 +0000
Date: Sun, 27 Apr 2025 10:30:18 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
Message-ID: <20250427023018.GD13806@nxa18884-linux>
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com>
 <20250426131804.GA13806@nxa18884-linux>
 <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
 <CANLsYkzNE-Z8LwEtpXrmnWLLDNvzjFYaFHVePE_mSkmWVdQ6Zg@mail.gmail.com>
 <f6e79b0e-5e0e-47fa-b2ac-fcefda19efa2@windriver.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6e79b0e-5e0e-47fa-b2ac-fcefda19efa2@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c73453-e993-4879-f7fd-08dd8529d195
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?43YmPfd6KyUfkmG3Y8ePRCFa01VFlXad8mXN3Otp20XJXJOl0HB+jrv18S?=
 =?iso-8859-1?Q?nvWC3TZqFVx2cpXYA7D/aYH3yEi40W2soXH/IevGbgg8e47PocEbef0ujc?=
 =?iso-8859-1?Q?WTbc5u7EYO6KrNYqMtWN6DT2zgOfuCPXmH9X15RiDK1jDDiPESQuvtZFwu?=
 =?iso-8859-1?Q?o0H9Q9ErSNN5O0fBA6QPdXPfhHfWCHUADwVHSfAgERioLCoyCmDjvA98T+?=
 =?iso-8859-1?Q?Rj9/UcXvH2b2M5K+Vpojh7TEKEr3biaDo0Dh2WfB8vPW0Z6Dma/92f6uh/?=
 =?iso-8859-1?Q?Zfpu3sgInFIjb51AP9sbuFMkFCE0HFEz9pVUbg7mHZt2oGScmWDhAvFmiH?=
 =?iso-8859-1?Q?XLsY00cY77K6P23eaCHJJN6tlwuj7v+xA52bEZkymrEuCwjcWuQMbEPNzm?=
 =?iso-8859-1?Q?fkr0XfJ03LXkvK2bDqATRYJPy6BnWRm1tm7A2cEdTUGinZY2XMBSN0elvN?=
 =?iso-8859-1?Q?RD/MoIakrSTYxaiS4Fy36S+51jUtx5kpjQRKRMFJnamr/ACbKmqXKkp5oD?=
 =?iso-8859-1?Q?jTjZvl+PaU+Z49N/1RrKSJi93E5X8CEP3AgG/0r7vaRvy1CoeL7e3d2snb?=
 =?iso-8859-1?Q?hfOy2CEpRb3oN+GaSZ1GmI+miQLUqluQBw/MgxkmRRM80nUWq435486MbS?=
 =?iso-8859-1?Q?fz+3c0aIwE5M+thVuJvvXdR7Kogo1YduH6MLuBNqoPLXJ7w6vVScDbeeRx?=
 =?iso-8859-1?Q?Z9AHnsZ58GT8SbYB2Sodut+dKeDIfPRiCzvi/KRE1K982wraN6CUrvd2fD?=
 =?iso-8859-1?Q?gv3xGhqCyN4aCU36QN7y91I+vKUW93BrJOFRPnLABf1B95543c3YlMWJTv?=
 =?iso-8859-1?Q?awH3xHmWTvMv472esi2rWU3mLuyrKPruuIqGHefv1P1jHFmO8QWeltk4N7?=
 =?iso-8859-1?Q?NIpgrFxj7trme6EN/yJfsc9EBEe1RwLTeakhhe6JdNd7ePXfTlTaK3Ewmu?=
 =?iso-8859-1?Q?3Ky6sRPaGKjT4zZcG7vt47Fi6E6/2Uub9VKRsFwCLGNYVjzhMZHY9+c24Y?=
 =?iso-8859-1?Q?VJB9uZZ93vXq3xgipuzAHQjhiDgj2d/5r5BxKpwi4+UHwgpoYkKLerMVsG?=
 =?iso-8859-1?Q?pIq05cW+XUwMv9vOoh3E5M+9NSU91Bs8QI4FQ7RuzAbGuM41EPEnakqMNU?=
 =?iso-8859-1?Q?lBfuVkNca32IZ84tQ+U1uaumwXh40Twu+qzLAAwkLYF5UCl7y2RCWB+mhR?=
 =?iso-8859-1?Q?ta948EuxqnKtwXsaR/lBqjsSyD4Ik0otaz67J5ZiZ+jvzthDKzYGEhIma4?=
 =?iso-8859-1?Q?S6pNtLUNCW7Ij1xbdBYNeA2W0HuDaaPiXMOPZRB0x4c3qZBGxrGKe51fPH?=
 =?iso-8859-1?Q?h+dxcmiz1jxeoA/T/HWy88U7ShOCjEIBSEkXG5zoo/yyg7suJZ87VRewUS?=
 =?iso-8859-1?Q?ZpgdR9ugKY9lJ+0ubW23BtNU+G1yMsmq2BHeYsRv/Kcra+b8uTvhRKR63a?=
 =?iso-8859-1?Q?e6HaeloE18/AC3EAiIVdy1TKnuMsQ4vdTtU/mVCBQ/7HpoRKwHzbgfWaUF?=
 =?iso-8859-1?Q?4/7suCQ+kL75gAmnrbw2elCxPvlLyU2FxfjwcYDstc1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?VY76LAWrxtrqlVKQXu2sIjYnbJm2NW8EYCnCYJxkyCaKoEhe37DH7c0FxG?=
 =?iso-8859-1?Q?VUA0LvHuwXeiTjdx941HcvlSMgMp7HCr2+kZLk1eXdjI4hh7r12HCpiZd7?=
 =?iso-8859-1?Q?iXTOIp817RJTzJmdIXTTaej5PofNyTsJGtF/kaB90ccLTNCbxJ/yygxjJF?=
 =?iso-8859-1?Q?21cExjYrJU8B4dYbz6blOMhNhaIwviH/HVd1ZGevFB+v1OQHXYzGZvyBan?=
 =?iso-8859-1?Q?TMpBbck9QG/oHtFItfkEduK8e58/4zlpRw4NFx1I+qjiH+WPWeXyN1kwJn?=
 =?iso-8859-1?Q?Kc+8s/3Yu1AzDu1GtSbFuseeXlCi8/8n50ck2ihHyR6Ai+TK2S1JvXsp0q?=
 =?iso-8859-1?Q?suL6WEelyfwu+gbMhNGaK8SdrhOOhNXVObxpfMouImbTKEROccZrA0Afwq?=
 =?iso-8859-1?Q?vLo9V55burvTfb+VsHrT0TyqAqhrUSZHROyVebK25XP6XAF6bdcbcBqH3d?=
 =?iso-8859-1?Q?sWMR/qyPjjPP+EkF/GO28auM8ITKH2r/U5Oz+8ZmHgk0ljBLKd7qQ82Ehn?=
 =?iso-8859-1?Q?dThapBVFVkfNJzTOMbVFPXhshnajjnmcxJRV64IlQRcSakaCoQtzAYNoJw?=
 =?iso-8859-1?Q?cdQjDEw8GoawjuRXgCheOOgsB/hWfwUrxZv0ZvAgTse8Aq/XBWABskpQ1Z?=
 =?iso-8859-1?Q?6and7Kc87rFjjgWQ+i1VxXPVoIaqyPWaaM/xWHLkBMeQegFdi2ijFYhTGo?=
 =?iso-8859-1?Q?zsJv97HBIwMXOTJ5zjXL9gTVvFYHv9ee416aPWrH/10X8jbz70X8O7D1VZ?=
 =?iso-8859-1?Q?XDv5zJ6KGUWPY7QpL6zBSuMrtuKbmPm51k3UKRcZbW2Io6G6R3gxDT1n9w?=
 =?iso-8859-1?Q?pqaFhB3B2HVQ9DkX5jVYWEdIk29ENCkJJfV/G2RTT0lXCk2bzjTsta37rL?=
 =?iso-8859-1?Q?OE0oLWugmNKNOkRkFrF1MNDIIN21VYXgHIBKKE8Fdfv9/cKgzBSvI2pkaZ?=
 =?iso-8859-1?Q?SNiTDy0Hk8NzdFpNtZxp3dehp7wb4XvW1JtNOkSuKWHDV7+IGcEb3xbZ3r?=
 =?iso-8859-1?Q?/eXKxKRAvMF2IVc+998OUBPGmZvG20PWSTVVgsO/JQeKxRHYfp+BX1J/xV?=
 =?iso-8859-1?Q?GJbqNoUC9lWn1miaDsdZZVZKiHUVUcrKASWM7Qui7t03dt5nEas2/NKPwB?=
 =?iso-8859-1?Q?z6C/MuRmBy1mlUvuFjSVpg1bAynDMqy3WYWKXUAMudKzaGpcbET3sBRKI8?=
 =?iso-8859-1?Q?nZPTvr5tTPDUrDriEZxdW4jX98dFN7i+ZdmZtWJ2sNUfw/g19L5I6PCK/J?=
 =?iso-8859-1?Q?s8epCVwx7kt15vLkwHaCBFjnE1d70kVkec/emUBXyFuddpC+BfyC0aN7jD?=
 =?iso-8859-1?Q?b6Fy8XMlE9uIflL0Uvrm0eE1WRfQeeeckKknf3zjvqGJwj4UZ5up2+A08J?=
 =?iso-8859-1?Q?+iM63PDXZOl1pLqGIjZqhIkNo5z+BXVHtVJ74oH+wgB/EHdxoy1mm+pB1N?=
 =?iso-8859-1?Q?jb8PmWB2seJuLk3Q8zyd/4xya19p0jIOoTBc5mu5/fDWqSivB92lGtRuws?=
 =?iso-8859-1?Q?+ZrYwsUpPdjQWP3at4QpSO2oT72VfVxKGFrcu+h53yFV9r6ZzrFVIom+wF?=
 =?iso-8859-1?Q?lYZ11oD5yORe1VDW/kUzxgZK8czdUqbmjfnkdl2yebg+odNfoEWA97Cy4P?=
 =?iso-8859-1?Q?SV/r/s8UYDg4P2XGyDGA1TktIqQcb/21E2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c73453-e993-4879-f7fd-08dd8529d195
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 01:21:23.3758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgMw5LmytkTu9HmNgvdmG30Ouk9jax1oXxyeoif8jV8eaF8B+JX3LXyucw/hB0nythzG8v8zAYlQAlRozBOosQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7587

On Sun, Apr 27, 2025 at 08:11:43AM +0800, xiaolei wang wrote:
>
>On 4/27/25 04:14, Mathieu Poirier wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>> 
>> On Sat, 26 Apr 2025 at 07:46, xiaolei wang <xiaolei.wang@windriver.com> wrote:
>> > 
>> > On 4/26/25 21:18, Peng Fan wrote:
>> > > CAUTION: This email comes from a non Wind River email account!
>> > > Do not click links or open attachments unless you recognize the sender and know the content is safe.
>> > > 
>> > > On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
>> > > > When rproc->state = RPROC_DETACHED and rproc_attach() is used
>> > > > to attach to the remote processor, if rproc_handle_resources()
>> > > > returns a failure, the resources allocated by rproc_prepare_device()
>> > > > should be released, otherwise the following memory leak will occur.
>> > > > 
>> > > > Therefore, add imx_rproc_unprepare() to imx_rproc to release the
>> > > > memory allocated in imx_rproc_prepare().
>> > > > 
>> > > > unreferenced object 0xffff0000861c5d00 (size 128):
>> > > > comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
>> > > > hex dump (first 32 bytes):
>> > > > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>> > > > 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
>> > > > backtrace:
>> > > > [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
>> > > > [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
>> > > > [<00000000521c0345>] kmalloc_trace+0x40/0x158
>> > > > [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
>> > > > [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
>> > > > [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
>> > > > [<00000000e7e994ac>] rproc_add+0x124/0x17c
>> > > > [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
>> > > > [<00000000efc298a1>] platform_probe+0x68/0xd8
>> > > > [<00000000110be6fe>] really_probe+0x110/0x27c
>> > > > [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
>> > > > [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
>> > > > [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
>> > > > [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
>> > > > [<00000000db3eb243>] __device_attach+0xfc/0x18c
>> > > > [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
>> > > > 
>> > > Fix Tag?
>> > I will add it
>> > 
>> > > > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> > > > ---
>> > > > drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
>> > > > 1 file changed, 14 insertions(+)
>> > > > 
>> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> > > > index 74299af1d7f1..c489bd15ee91 100644
>> > > > --- a/drivers/remoteproc/imx_rproc.c
>> > > > +++ b/drivers/remoteproc/imx_rproc.c
>> > > > @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
>> > > >         return  0;
>> > > > }
>> > > > 
>> > > > +static int imx_rproc_unprepare(struct rproc *rproc)
>> > > > +{
>> > > > +      struct rproc_mem_entry *entry, *tmp;
>> > > > +
>> > > > +      rproc_coredump_cleanup(rproc);
>> > > > +      /* clean up carveout allocations */
>> > > > +      list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
>> > > > +              list_del(&entry->node);
>> > > > +              kfree(entry);
>> > > > +      }
>> > > > +      return  0;
>> > > Could "rproc_resource_cleanup(rproc);" be used here?
>> > Thanks for your suggestion, I will try it
>> Before sending another revision, please detail the steps needed to
>> reproduce this problem.
>
>Hi
>
>When I was using the imx95 board, I found that attach remote

ok. i.MX95 is not supported in upstream. But this error seems
valid to other i.MX SoCs.

With M7 binary being packed in flash.bin(boot image used by ROM and SCMI firmware),
M7 is in a separate logic machine, and linux has no permission
to control M7.

But if M7 does not publish a valid resource table, linux will report 
error when using the resource table from the fixed address(rsc_table).

>
>core failed during the startup process, and then I found many memory
>
>leak prompts. The following may be some useful log information:
>
>
>[    0.184904] remoteproc remoteproc0: neutron-rproc is available
>[    3.009728] remoteproc remoteproc1: imx-rproc is available
>[    3.016002] remoteproc remoteproc1: attaching to imx-rproc
>[    3.026761] remoteproc remoteproc1: carveout rsc has non zero reserved
>bytes
>[    3.039148] remoteproc remoteproc1: Failed to process resources: -22
>[    3.057878] remoteproc remoteproc1: releasing imx-rproc

So to make it clear, I would update the commit log:

To support cases remote cores are started by ROM/System Firmware/bootloader,
"rsc-table" property is to indicate the address of resource table to build
rpmsg connection between Linux and remote cores. However remote cores
may not publish a valid resource table or resource table is attacked
to be filled with garbage data.

Then when remoteproc driver handles the resource table, it will
report "Failed to process resources: -22", then failed attach to
remote cores. In this cases, to avoid memory leak, need to free
the allocated resources.

This was found on i.MX95, but it also applies to i.MX93 and i.MX8M family.

---------------------

You may need to wait Mathieu to see whether he agrees on the upper update
or you have more information to be added.

Regards,
Peng
>
>thanks
>
>xiaolei
>
>> 
>> > thanks
>> > 
>> > xiaolei
>> > 
>> > > Regards,
>> > > Peng

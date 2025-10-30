Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013001.outbound.protection.outlook.com [52.101.83.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E11DF965;
	Thu, 30 Oct 2025 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761793748; cv=fail; b=PnSKWrDwanbRItWwzTbAE1ZLT0vg1uJa3mN0EdjHDpOseVccduXkcdp7GcIxsyfsK7s2R8MXicKuz3xd6miCoSaHbhk5FFeRnH1o0/yuxluJW1VeRhbbOis3ZAHMei1EjMTZ5OAKAD/NnbN6mrhbDE4s+M46y4LIejVHfCqXwBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761793748; c=relaxed/simple;
	bh=QP8Rn3Qhi70x72aQsbUk591yXu7B2bzfXHTm52hyCXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rcejaR8K4ePVIGqOLxVsDDLXwK2P/6LFkk1/Pds3Q4kGr4HNQlOS4b4Eq3ecMlRzhi24yFSjTm1MBT+RvZkVdWNZtQtbMMIh1zLmjlsWT4AADqaeTKdNxN84fOHMbyyfRFezlSnDW/25S+Out9tl1qlme7SGHbkhvSx++xcvpKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jAvneXTH; arc=fail smtp.client-ip=52.101.83.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jAvneXTH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRYuP7SvQCFIS+Fm8YnzkD5Qjeve/zhEbd1tAoEeX1uwuop30hL37qIEm2lbQPbb25mqoWGlP+rBbQcqym4ZjhfGnSWHdziKCihhOYwxXhz/1155DsUkMGz9XCROO8Kf7JblL6z5LXMthBWW/yhoXKjXm3jE0iyJIa94SUZkRa0fDpDLZjka107CZqMufGf4Vmf7SWSM9Ilonwjip7Ja3BetkNvePVSbps0UOo8nl+CygBTnGn3E59P+ZZTjN1LUgYf1ESdvxaESarJZD6sMD+H33lfJRnMmIkxvBrvlkTm1grCY782Gnv/uWnd+z5+vALbAKioFnndwI9rTQBmyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYrULdhA+VoDC7woBF7mf9DGr69bz4jnlB1tGnkgb4w=;
 b=RqG6fIelB6gx5nwXaV33bpdGL9+ewRJI78t1diHyfOfm5ioU9lFH8zYTlR0W305LPICF9cmXy0zmY/KYcEkktNRvxHr7r4qWXzURiMvFxr+fE2RgJ0Vg5Vb3BkcTXmyc5Fj4K+IsYCkhAhrgaj40Bp0//2ZQO6QyuqjlEf9CkxmukNdPjYmkmOnjFM9y2QI3OKTt7ejM/eqjlN4uKG0gy2Sgl4IMAbx1Gt52WOwDNEm0eNCRrVwGaCpbjBTmRQTViUv4hv+0ETq2TF7OHDiENHxqZQDyb76b0oz9Vg6fmw1pughpwBIlk+xOBHE5kylPAO6ozgSd9lLIaamnfKe/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYrULdhA+VoDC7woBF7mf9DGr69bz4jnlB1tGnkgb4w=;
 b=jAvneXTH/ilJP6KpaNm6fE7JdDHR4bZqFs3Q+5QkZNOpXgHPSKR4pxu0OF//5oJ9Sxj8Lqhao7zfu812QDrxdsuKmV4Z1GjvN2LKsF5wzrATiEZyVXsSPQDPFTQXQvfegfg9g5frp8t28CWrGUdhb68fNUp/T+Xm/2As/EH/QoltVPvsVROasDNlK+e+akKEy+55FX4vHg8OSjxF1xKecobQ2ROPShaNui1rSvHRxHr4XHVI3s1bOj1f8pkfYruiXWWkaE75FscXRST6v8yCJAi9dxzHLoqYSKezpj9JzA9pbhAE8EhGl5IkyU0RTrhRrx90Tp0vwIYLaG7urTMVLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10971.eurprd04.prod.outlook.com (2603:10a6:150:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Thu, 30 Oct
 2025 03:09:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 03:09:01 +0000
Date: Thu, 30 Oct 2025 12:21:24 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
Message-ID: <20251030042124.GA18595@nxa18884-linux.ap.freescale.net>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251029032422.GA7297@nxa18884-linux.ap.freescale.net>
 <b9ce8b9c-6391-47fd-b7b5-be5cddf9cd4e@amd.com>
 <1bb3a121-614d-4040-9cbe-505ccb7a7fcc@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bb3a121-614d-4040-9cbe-505ccb7a7fcc@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10971:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b2be7d-3423-4f65-f16a-08de1761acd8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DwVf5q4Ee8H1lnacCWkDpL37ZaeI8kypDuiZiQXqtwH8h5YdVThA9S0F1S8E?=
 =?us-ascii?Q?SM/8ob1+eQDUs9c0Gs3df4FERK5rJEpiaXeZWwfhX+wE4ajNUQBe8CK0wr/x?=
 =?us-ascii?Q?QelNzR5sSYMI32z4Hl4AjyVWH7A0mIfDw0PtxnDYv4fHNbkSHNA93NxBhndX?=
 =?us-ascii?Q?bw3QYGxSX+1VWR1x+iwGOD5YT9HTjsKBvbR9/0y6EuMGjLasZ27mnhSL9Q3N?=
 =?us-ascii?Q?63Jo1Fg9GoyD49diX9TQWk9Crk1rnIUhAsJDfkThAA5juJPaY+LxDrHvZqZr?=
 =?us-ascii?Q?kRrfKQiVR+nW4CY345SYGQetSCB6L9jRvNbgOb77mnXzZ5rvq39D56P1AJU3?=
 =?us-ascii?Q?lXD7+VDenqpPYjDgKfAexbZ8dvHK8VpGtXsZKHASSBcMtfL8BpaNNP1P/3rt?=
 =?us-ascii?Q?q0n5y8AmXP2f1DvDqwaM6FNNBjUEejeqorPQ+0DwP54BY7hR49oS+JxuALg9?=
 =?us-ascii?Q?wpUry3irBEiDICm5ecWe/JvxSj49IFtYQy/nxj4XKYRHzu1jWgxqPNco7eKJ?=
 =?us-ascii?Q?Fv7IqXdhXci8ECpdDQVF5qz/X9nI0D+QTVj3wL+kNmR2VFRwaLJXHC6Uj9VT?=
 =?us-ascii?Q?mJ0TjKNY7/5sfWKZP1/ti1/83sbjkfNd+rNws6Zeo14KmvWjWhfiVyXB5gI6?=
 =?us-ascii?Q?w3jlSTpM4yZpXjhi5s2Hom9QOTU264P8hWKKGVJLRhTuwhJjDg4XTGXgMZqC?=
 =?us-ascii?Q?cseiF/hfNq+apdyanT5KRYB2gtxkckMiLZnOvoX5TLUthfDEvjysot0DmcAZ?=
 =?us-ascii?Q?sOn2Werhv+fIdnapHypSHiGja21muMXJ+F9nBV49iEjd+cHMkATZGQtIOCMh?=
 =?us-ascii?Q?Tux47Rp1hyBvJHBvQOyyAwj5DY8MeKpuyTaw+fvS51GB7dl4KLpWxL8XUoGQ?=
 =?us-ascii?Q?K5IpbeU5BhUpCLWoIyTMm6MDUcJXMBezQk0A6ORT8oKApKSsOtPwD5WxQdvP?=
 =?us-ascii?Q?KKEnEn1v572BPapcgXZAifJrJymhBzmTjxWXaaxz1qEPCrDmtqHq1jfSrrq+?=
 =?us-ascii?Q?inVn16o/hG0zvaO0mvlXRlV/FwGKULWroXwTiBqhX9cBMhuRe9ZG0xdaxfGn?=
 =?us-ascii?Q?cbXVSTsWjn5wL9tfGlnaMwdnLEE9InZGpr/H9n3sqI8qRfOdN1HbRo1uL/Oy?=
 =?us-ascii?Q?YHxnJDXYbhAy16Jh+mBXA1zIvRT4weGcCj1K7psmF8E2zP4JGt5bNVr91RzJ?=
 =?us-ascii?Q?YcbFO7jaM0Aopqch79IuC+OG2defsAFkkbBWfw1AdtXBQ+0topK3Unnk+FmM?=
 =?us-ascii?Q?6QCMxgvV1RjGHmdjw1HvkCHmifEcDx3/KA2xwxsXo2Bhb0TKwGPkoVycvC5w?=
 =?us-ascii?Q?UFTnmu7fgcSGjPVY+BZZAxEjm8RKYsIYXaX/pvKVe8hQ5LW/eb5DY7PaGms8?=
 =?us-ascii?Q?gJGBK84XltDWEJZN4zHeZT9FIjtYCek/iafs0YohcObTstP2cBkcBWzeRQYn?=
 =?us-ascii?Q?7/XrtdqI11tzJhcud8L6JuTXUfwIknYvlxUrEshq0YN0ruXyaxoB0FSxXMXf?=
 =?us-ascii?Q?GGXRPH0CqvmPOz/xbsOLqSGtJsYNarleETDY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sgh94NoJ7/6cNVk474Tw1/81WEtqbAXQ/nELpiXTDcq9GleeLEMy/OB/acQQ?=
 =?us-ascii?Q?F5wglP291mAZNTePD1Aug8m/RJhyl9+en9I2b7GrF7jOiPRbcYrXBboI9fnV?=
 =?us-ascii?Q?/HVADLNiQDcf5+kzSN+OvmpUD876a29JEcGrCpPk1dsse7dm1+weeCyxzZe0?=
 =?us-ascii?Q?H2MvNU6caA8fmZEY+RNUX5Po9FibmabvbGdvLkwThPbs9eUwpt0A8YV992eB?=
 =?us-ascii?Q?PpJNIEI4NHxxNkNtLkXDrZHsIQEUfwkfm1qirfCjOicb8HlX06Bw1NRjXRjM?=
 =?us-ascii?Q?IiDZ1bkvW9kRq+zLUdjaK/6zkq+k58J4flFl+KNk3J40go/p494P6Ucheywz?=
 =?us-ascii?Q?5nnLyoAPqFr2SryT/BSXoPej0jP+j1nBlMZglYOafi0YTfldTFvBn44Zy6cY?=
 =?us-ascii?Q?jxq6/Q4VR4BYOSHeVQw77PXu6zM2cdYd7w16WLtdZjFLDkgB/cv3HO5zwFEm?=
 =?us-ascii?Q?kcPe1JtsZxR+ugBQLDd3sfkiAF2WbFpfylY/aobXMovkX4G5eNLrQIDOBr1Z?=
 =?us-ascii?Q?/1XpC9Tgg2oPEnmrUIa4JmNjyVnk2tzdIjnDydYhc9IZae2rKRQDX7UCOFM6?=
 =?us-ascii?Q?bLmAFpUa1b5XZyd7CiZxIQ2gFn2nMquSosNnyvLvdlsey999+1sQB8XHGccm?=
 =?us-ascii?Q?BgSP4Kmzd/GpPGPXeKYbc9yDWNr3VOmOUp95ON+7F4SyMVK5k/ZYYq0i1iKg?=
 =?us-ascii?Q?khygsVwwR72kNL0R3Bgb+wiUt1c0AG722t4A0vV5ubtmx3cWc61NOsyNw5Ty?=
 =?us-ascii?Q?Aq0ZA+0y/ASx1jwoqJhl3i8ZyZKeOLMKhe0Hu/5Da9UxhbBEj3gK7yUmJ3DR?=
 =?us-ascii?Q?sMV/ZBUlOok6PlH1NJduceYzK1yZofyeLx5B9QbZl6mGuV2oK1RMU12EyaB8?=
 =?us-ascii?Q?xYYpKXVNexcn3EYiE4iIIKK1TnKXjoxpXPkHEXsT2qXUlPPbkLfWn9D2J8Mj?=
 =?us-ascii?Q?8CapxO49/gMW/2gJ7CF/jR2cjPj2oW3+fVKYHBncqb2aHLsXqeQP2AEoSVZj?=
 =?us-ascii?Q?DIigwrYHIjWQ2lGmP6EJKmc/8Cqo5242QuwMFCwT4F2rsEs3fSSkR0rCeoOY?=
 =?us-ascii?Q?iwfENXo4AXyoyNXj7cSaeIJiqvPFc/l6yoKIb34xc/fpYfMbi8lk4/frqTH1?=
 =?us-ascii?Q?aP1I3j1AYSA4bZFYbVLbz+AXyvvdIQ+jz7HC7e9SzArfNrOfE+cnH8QPP/sf?=
 =?us-ascii?Q?+Spq4I2gTlqzAG7mjho5fHfWDxvLiYFdFdrD4aOekwCIBN4oFkn1DFHI7mL1?=
 =?us-ascii?Q?E+Kp70go0PMcHcl4+3ZLQ6NAdjDEgoeCHfK1oB9iknH/JKHt1ZbOgD0TnimU?=
 =?us-ascii?Q?/+9pK5HQuUTJslGjgAri69IRWJ0ytEDyZyZpWqqhHul0ylB4WC4EAkmaSUKR?=
 =?us-ascii?Q?XNRyWbZBRGqJULRETyUT7sj/ghLj/G1tmyUuOfz2Wo7L/ebA16BQwB4OtrL1?=
 =?us-ascii?Q?9cwM4ZXhhLU/vlhMQjjTKTIjIUDPtageKklyoed4stLEzEzB8p8whl9ijLuX?=
 =?us-ascii?Q?x4Ge9bOU0VglinyET5E8d0Q8YVM4NthrH+CpBhK63S0Bg5UPESJlB4Fut9mi?=
 =?us-ascii?Q?1gpbJ8BSRo/tD+cBcPfC8HASAAIl+vl0u0sk/G0F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b2be7d-3423-4f65-f16a-08de1761acd8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:09:01.4505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gT3hFxV4WwfirD9zns22qe5Hs752ye6deTh/ff1FfQksH3sDSrzDRnAsaJMYS1voIT5wmqxg4N4P9AyK78H5Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10971

Hi Tanmay,

On Wed, Oct 29, 2025 at 06:51:51PM -0500, Tanmay Shah wrote:
...
>> > 
>> 
>> Hi Peng,
>> 
>> I don't understand why it should fail. The patch simply implements
>> rproc_detach() -> rproc_attach() sequence.
>> 
>
>Hi Peng,
>
>Thanks for testing the patch. I appreciate your quick response. I think
>rproc_boot() should be used instead of rproc_attach(). That should probably
>solve the issue you are facing. I will send v2 with this change for you to
>try.
>
>Thanks,
>Tanmay
>
>> In your case, when you do detach -> attach via sysfs that sequence works?
>> If that works, then crash recovery should work as well.

sysfs does not have attach option, only start/stop/detach are there.

>> 
>> Could you give steps how do you generate the crash?

I have not look into the details on why it fails at my side for the 2nd time.

On my board, the M4 core use watchdog to reset itself and notify Linux, then
linux side imx_rproc driver will do
"rproc_report_crash(priv->rproc, RPROC_WATCHDOG);"

I will give a debug on the failures in a few days.

Thanks,
Peng

>> 
>> Thanks,
>> Tanmay
>> 
>> > Thanks,
>> > Peng
>> 
>

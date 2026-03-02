Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584038F63D
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Mar 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444682; cv=fail; b=mpXzq74SmrDDzfZMvR9LEq2SZIM7MGF3MYBcpaM9LrJn0ooJMUb4NPok9aPXwKQ+zgj0s7DBy3Q1AGWs5Bxba2d0TXK52RQVySdCsSNtDUOfkKK0sLJ1H7kYPV9hVb4XfXWh7vC9dX5gAJ1MQIF7EzmWsiQXpR7PVfKZte3YwTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444682; c=relaxed/simple;
	bh=FfDBwFHGzGzEqDNx+7Orv7gu/e99o5CshWfgjkdE6LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OR5C33p3ksU9J+dbT3olKl6UYml/2PLN/TZLpcdUFlrPEGSkEX4r7QoWOEG0Iemba73u71EvWZIzWQ5GvKH0+1A8FYOP4pUXdOmPSzDgs8WFWu2Dz6ZQuBM4PnUQPtxAheh7ALUPgHeMHZ4yBxkCZoPlC0KGPeZvKRl747IJEHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lgw5WqP+; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Lgw5WqP+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7/VB63tIPBUsMa1iHXE8UCqwPZOnHsKRa/Fs1IYkE50PfcQ15oRuG7mDpV1zAH2vTOHk/cjj0VeqZU4HAU64qPGX1zSmk2Bx1AzeCp/5xMoHWRqsyGfKXAx45ZjyE07lIh/FUkKAuy41vSOoRR2N+857l2Sol6EnidoBvxMOYUxSbqDARhhxmNuVmxEPmcNOjEhRN+luSMyywOlEk5nQO5EC+dwaj2QSyedlrNUwpmcOc7NsTAyeMZDAROjb+EpDmh/2MogSahh5iQpCUhFp/9H8TdxVS4RhwF+ue8cLYhDHJgdwzCvT/EXBnNSNTtCGyTskFAJIXGHqHcjsMkoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gP6YNljDG36J1qWKr7uPo3tVCQdt6VxzyWt+zkLhXk=;
 b=F2UNXkkCC+9Mk4OkLgSe2fNLdHkwaV+hYRSDGFoNSk8uX1pHjxGcKpLcwWTfbbKK71nuMNnKZrEoQXD/qDP8y0Q5NUiNc4/3R90boNZ1yDxX1C6FKzFCtfX1vp/uO6FrtUKTZUv3cwm30asFe7yeUnYGXc/T3rVU80d40n6j7qUF+9XoupgWHiNy6S0Fuw+/LON2cjp1aEfJd/wkJqNaziJMllL3jC8qrQeFWNkg+G7E7TXqpVBv/r0pqiZC1rOO6InyD6V1FF+Hk8n/z52lV9SX+jIXElneIz9LJjsHUyDpq12KAujFGQs46hOZFFhsnoGztKyboicEDJil2UlfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gP6YNljDG36J1qWKr7uPo3tVCQdt6VxzyWt+zkLhXk=;
 b=Lgw5WqP+jzAxuGThRF92bFbTWkoxz9RSYI6cfn5+N63B5rKEhl/m7RApFGOiGvB8UhaYF/iSb+YKS3VLBxkpej7D7WMLllcExtKCEM782QkkMXHa/nbjKXWmCBptnx7dI3v0lbyt/rdAcHc8ftIC19oagPKg/BWkuJRo0iCDFOkYb6ljaTxuKnlnMPWeszgCn6GHD6ZVuQGINIWwyJmEJ4EVa9BBl4gRBIl0K3aOXB8CP4t1lhFYtKNccNdU8n4DRWQiXJILl8KzQTuqjUFsgC1dbyHgASlHnfEzNnlDX/vqABu6J9hal9yuqBSWnVXVZL4h2taKt3HvvrEbcRmMzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 09:44:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 09:44:38 +0000
Date: Mon, 2 Mar 2026 17:46:37 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: k3: Fix NULL vs IS_ERR() bug in
 k3_reserved_mem_init()
Message-ID: <aaVcfUD74+0gW8bP@shlinux89>
References: <20260227092110.4044313-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227092110.4044313-1-nichen@iscas.ac.cn>
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: f10b8ebd-4206-4a06-4606-08de784051ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	P/eOwQ1DHBrhv9N2HH4c4sDLtsNEUwyAR70bPiCVBQo40izW/EGo7Y69XMwQJQApTm0etNSzAUW6Jeutag/ahI97VLQBnVOnIuYsTuRJzovztCigcsTj/lNxbp+7DTuLaKovEu9+v/714DM5t91uvwz/sYBUgX/ZQrdg+kN5p6Dp6YFs/fyh3QxrVO46xvnwzPWHEmXQpVsC7p8bAnm4Yq6IIB6lOTPLBHG7qXtJt11BE/bk0cscf0bJ8jmMr/bdvwX/cIkg53iyxLdBu6/XMvVN2T6+tV3/0TPxSXIvuRoSTQyzBWqXMGcWybufDDFHAkBU7oZzlORcso2P/02KJ0R+Bji0U3cXiXKUkFZ5tEI3kfx1v+Sg2PCfnx5YZcmllLAd4h6zGphdhepeGZCU2bhcI45/iO4ZlseeumiN3ist3yTa6CYybH07nYHMIArz7MjSA7GgfglkMhDYaM5+fqwfbxloTVSOSTrLQvoX1Pi1cJvDXXguhtQdD9YBbCCv+r1x+BQX1qBbjdIh9Xj/BjhcvV2UGpA4GUouEFptgJZjO0Cy/qakSbjCrMncrCuuIhHKCoaepPOtJDhlj9qINpqVn0Gvfh9zKyOwselar6yepppvyGzLANiLIJLCHJic0/6OwYzywmMNbg+SQWskEJTDkbjXYS+BvgmzIGX1cF69NIRZ50JDA8emFCmWWwKbivg7oMza+S/iXvagLdd9GNIqBxpUV+OKW4ZVr9QkuSqLZYBZsWI6hiR8NfH468m/tZXzyKjEcRXPXfrZO5nllpsVUtDXrcRLdNtRaWw0BKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/x1clYB1flkM00HTOnk4dHzz2oUtWHQrAFXkEW6/uorQQIlTtcl9RDKGOpym?=
 =?us-ascii?Q?+FXb/b8UErNL2MKVXcnssxqEehv4/W7t1PwfUCO/ivRbdD0Un0U4ftinAMop?=
 =?us-ascii?Q?0uJKgVQtJvT8fM86BStuHHbmdw9Ejsqr+FgMkPHjXaDEMs1PlpWtHZDUGlEp?=
 =?us-ascii?Q?Zwb//KI6ymWsCQFs5sp5znawxs+GSqgPJw/PAJQS6YDiaDVaROEyoEXKuoU7?=
 =?us-ascii?Q?n3yUFFAySYPhuF/HPfOM+acqdkvzqr6oaH0M14OKaf7/dSBsOUXREyM4CqXX?=
 =?us-ascii?Q?RtF931liCYJcx3NXs2KyFqhHOFdBuvsPdSbwP8wsEsMwQCU/5xeUBO6TgMbC?=
 =?us-ascii?Q?tiFmKwbD8+wmz9b7MEAMRGtJEPpVTn4NUshJw5A428/WHGggOSzspfBT6RE/?=
 =?us-ascii?Q?qq0iukty5E54s1Vq6QVfjhwYELP96ISyvcN25dPVlH3ajmDJunbHmLVaP+6R?=
 =?us-ascii?Q?sGtpr74Q8LwAiddjFdg3UTnSLj+0ADatS6hW/z0KHmaopJH137YJl+er0aQn?=
 =?us-ascii?Q?QiuGJzvvUHDVFO1caMnHE/t3zzAwLKHtEjPi0DTB/DOaUDrskwBVL9hLsOci?=
 =?us-ascii?Q?RGBa2pwrxdgq3s+504dR2Rb2XeekYJgZXhbT/dGhW7UrGg2M2Z33dfvVuqZs?=
 =?us-ascii?Q?rGhPUEFI7UlHX1PnMXxLR4pquuxOeq3XU2d4x5jHpYxa8wwn++wJBlfDP5xL?=
 =?us-ascii?Q?w3a+d22wpIbkHm26fmlftN9LgSSCFmDx69ugrsYjNSHyMUTCtcijq7pX6Auj?=
 =?us-ascii?Q?firuYVVrAZewduezcl2V1AwwUeZ0G67MQCIpXCGx5idL9e2IH3Vdi5R2xJT6?=
 =?us-ascii?Q?uhULvpS/VFMim2irFtr9NeN9oGJIUy2d+pNFqKu1IghNTrW2JHz+61v84XiQ?=
 =?us-ascii?Q?VXQrZSUMB9Ws2XJXmNPIGk1wtSEA1w5sFzKUI7RSU218WKzDS9y4oFKu+Khl?=
 =?us-ascii?Q?10Xx+jX+anfLnC2Gb/tCuWvb92eByGYjH6uaLhTCku5oj27T7IBJCdmjjqHb?=
 =?us-ascii?Q?OLRywvQomEZanniUiSR7HG4crrq8k+F+y2LgqMIfNUW06jKmJdEFxbZPbHaM?=
 =?us-ascii?Q?b2TlbIM2El0VMn4mtvxf3VPcFZ6mrPGsYpPsmRogXA2srvcCelx1EL4/RL9Y?=
 =?us-ascii?Q?IFbV6irCQbtSMNxHgbq7AtYfVEC7l4fFaneT1yooVXNqyEJ6Mdr+Eid7ny8P?=
 =?us-ascii?Q?u0qs05Vgef/RD+raRW4yzBznX5WfwR7hlt+BoI6l5Ve/daM11+KDJxpOWRGo?=
 =?us-ascii?Q?rnVGb68J3PI5v56brFBaxuFZQfSPO5IphcQoo7K9PNF+/1ZBCs/nClUTEZIM?=
 =?us-ascii?Q?IJCdR8BqpiBMcNQaFVwhPIuE7+evR9+BjwnFhbiLrp1yPMrTp4XlPCkovkrJ?=
 =?us-ascii?Q?v3b+wdE1Jz6mvyE/Tgv2XmhJnAJq19izthKL2tGAWiHa5n6lNxG27EYmKxdq?=
 =?us-ascii?Q?4bWI7h2gN4xCvojsgjbXj4wWN1I02oFunHmHJsczcXcs1YOlN3p/Bz8AOLIv?=
 =?us-ascii?Q?3F+77MqVX5iYocGcKkhdG4/zZwxryIbblm7A0eQvFny5rtreTJodMuCaQ5j4?=
 =?us-ascii?Q?d89XruZ8f9UydiOcdouOzKL9jwIQ9PT9DDowT9/TNPFmwOozIaw+sqcCshxy?=
 =?us-ascii?Q?yKF+I0F+sigfi7j9QDaVH3ZgkJGBjr2diLdg0chNaHaytgKcuhwD2VDalIc3?=
 =?us-ascii?Q?VymGcyujQXlN26lzljNt0qy1Ldrw53oCb/zRTHotPNRx9yLhX9P3Gq9LxVxH?=
 =?us-ascii?Q?+ECLQK3E/A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10b8ebd-4206-4a06-4606-08de784051ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:44:38.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQX3hsuIeVD18pIDEoCIUM1MWQj92g3TVdTwmTyb2r30QOUeSDogjuU1HFmX7X/wKI3NgAt0bBk1cLuk8m0r8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359

On Fri, Feb 27, 2026 at 05:21:10PM +0800, Chen Ni wrote:
>The devm_ioremap_resource_wc() function never returns NULL, it returns
>error pointers.  Update the error checking to match.
>
>Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
>Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

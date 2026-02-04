Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195F41B34E;
	Wed,  4 Feb 2026 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770217050; cv=fail; b=CSJ4Sfn0XxDOywVlRoSwl3DVBZsyval46Xi8TiSLM73aUIcmwmkDsAkn4CJobeC8ELFJ9b+YIcD4ADhmvqqiAyzDfqJiG5VmHv4CuRDDzWHfHb02zV4H0udGFJ8D7QMaRNeM3FqbSIcaX6TM/3X5N1RLMwbtcFt0Lw4speno/Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770217050; c=relaxed/simple;
	bh=wDj+kPYfThjjZg1BCjcJFE+Ee+OFgZ63P33vChLpXX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KLGGA6xYEi8olIw7xV/Wl9alREKOJexc+WHWCzVOf60U7mzkLjnyQmVBWculk+dpE7AnpK9l742hXWtnqms6HSp6g+2ZHkT3qWk4bYGErFRegRN9m8pUPLFJmgul3LnVKEl0hPAlFhVqSNW302TYqLiDgqZhRyVZk7T5mNUfrLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rdy+erDt; arc=fail smtp.client-ip=40.93.194.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rdy+erDt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0Mfrf3y94Dsgn9nsgiBuGHm85UYSTQ/T1pn4pwdD9ZaL8xRuC3Zk6A7vX6kp57HYjplcKmr/OaMBciNXxhsq63mCS3HAj0Kf10dsHRW7JHXW1yzpEhFqKURG6wC3NHfC4WXFp+US+D1ZbAugyKdKBYyzG3VsNE+05ygzmE3MLwD+c7Y2CuwKQ+rC+M6weoFt4kM3MKHEsrMoFRPrv4hzTlvGiSuVxueBFiY2nZ4oykxKj8jT+nwCPplATX2O8+FeNoYmesc1ARuq9hLL6tmlvA3XSDc004+p6tNCs716ZVQCzlZkPVWy+w44AAMNI2mXhs9tdZzob1MMK7tXuMFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAwzZKXPwavdvGgh8Ogi72CTj+uPLhKTOZ66oHbcpJw=;
 b=qemrrJx+QCmC5D8YtKoBgfWwHHVfk1gjelF8vHx+fNSboLg2chedD4O5e27csjRP3LBzAPrectMmoq4sgUIPuMoc+TZwY65IZWCHa6V95oP0qMkY3LbI9YzSaW8iGMQDvAxuJRirdxPB860D8+Zk87PqNJLhbJjPPzQ9Wv5GmDeBpSMM6X81dOCG4tLuRfjlvJLpE8RSbs1IKpvKrO9ugmLLDL6a663YkXCgw5dNwkVPrlsoIP89pHD4xpQ1hbt9rtd0kIlUoLU4KyX19ZvU3pBpYv1rYIAqrLCyHKy6m8CYwS4xdDGLq6OHe3qE5JOAErLao9625YlJ67QUowXKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=ti.com; dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAwzZKXPwavdvGgh8Ogi72CTj+uPLhKTOZ66oHbcpJw=;
 b=rdy+erDt1M06APQCmS0s/lw6NLPYox/ca/ICeNVwsgSB3dv7GI0P5P0G+k5UVVq2d8ogoQ18hU4wSMrTTGtdXeKcL+ZlSxXKIQBuDC9RkclFHMynvhqdlOuZPLBIivZ8PM2kUqxa5Huge4B+S/mGIWSf4APKmTw4Lw8M8fuzCnw=
Received: from PH7PR02CA0008.namprd02.prod.outlook.com (2603:10b6:510:33d::27)
 by SJ2PR10MB7705.namprd10.prod.outlook.com (2603:10b6:a03:57b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:57:23 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:33d:cafe::71) by PH7PR02CA0008.outlook.office365.com
 (2603:10b6:510:33d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Wed,
 4 Feb 2026 14:57:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Wed, 4 Feb 2026 14:57:23 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 08:57:16 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 08:57:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 08:57:16 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614EvG2P1299303;
	Wed, 4 Feb 2026 08:57:16 -0600
Message-ID: <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
Date: Wed, 4 Feb 2026 08:57:16 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] remoteproc: core: support fixed device index from
 DT aliases
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|SJ2PR10MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d75d01-116b-4c71-2fe6-08de63fdb435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akJaYVhRcTVGcWtCaVRudkNUNUpjNDdIeVRxcWR3RTRVZktDcVBrN3RuNkVZ?=
 =?utf-8?B?UDlZeHBYZ3RoejlJVnM0QTcvblBBeDJoQ0dmSVg2emUvRFBqNUtQM3YzZjU1?=
 =?utf-8?B?UFV1djB0T3NwVnBnSjJ5aDFXWWwyZXhZcm9PNzd6OTVCUmpSVUswbHVJeG9E?=
 =?utf-8?B?VHVHaXRiZVBvNXN5VlFLcU9JZ256S051bVNLcldNWXc0c2JPcGU1UmRmV1Nq?=
 =?utf-8?B?azlTRkFsd2lOSGIzSzRwV2lFTWlmbi8zZ1V0ZE9hVEM3ZDcvMFFsWHJxRmgx?=
 =?utf-8?B?MmQ5RG5PQk5VL2J3WVBuWWJXV1pTRzVsNG5oRDFrZU1WVk1jSVhSWUtBVm92?=
 =?utf-8?B?NkF0MEZUNkdhYlErZXd5eHRsT3EwVTQ5aU56K2RKa05EMFFtMFhmcVVvNFZk?=
 =?utf-8?B?Q3VGZTBEaVFjYUpCcU5oSmVqUExLMEJONW1iTDUyUENYV1BPZmtBeWFNVFRB?=
 =?utf-8?B?ZXZ6KzAvbWlyUk9wM1FtSmdpWEJQR3FYTTVVRDBwelNKbXEzSmlTZTFtdG0x?=
 =?utf-8?B?R2VsdnpndERia3FFUHhWTHA4WFoxT0dFQUhjdWRMazNjcjRjV0RMcU92YmRp?=
 =?utf-8?B?dGV0cHZrWEZLbm1mMGlSSjhXdW4yZUlXZ3lsNzdWT3BXSW1FU2xPZDVVaEph?=
 =?utf-8?B?Vy9BNi9qUzE1bHd3MUkxN2pXWHVKK1NkY3N0Z3BicDNyTHNRUURRb2VTeDBq?=
 =?utf-8?B?OUpmY25QZGxtY0tuVVptQU0xblZMLzhNR3BaUDVuTXk2RTh5TDk1ZVN4aFRk?=
 =?utf-8?B?V2xLaUE2cHBGQmxHdm1vSTBCNXAvOG1qMmFQMHZCdjZKOGwzMGdxZkplR0Vv?=
 =?utf-8?B?YUJkcUIrVnNVVjUwRzY3ak5XQTJaNlVDT2xXVWFQc0pyVVVtdUNSSldjS3RY?=
 =?utf-8?B?Y1dlUlJGSnlJamNyQ29XVGZPcVFTR051QXlLWUVJeFE0SWQrUFRpSWs1bStl?=
 =?utf-8?B?dnlOQXJiSXo2M1R1QXIwWml0S3hmQmlRcXd0ZUsrUWFSeU13NUJ3ZmhBTnRW?=
 =?utf-8?B?c3FEZUw3aFlzaDIwSWEwdExCWERITGEwajBwbGUxeWQ1T2NmNHo1ODZMWEdX?=
 =?utf-8?B?MTBvM29YUWxieDc4Ky80bEExOENhaUtHTTFUbGZRcGZDQmZsTnU1WCtjTlBC?=
 =?utf-8?B?OWxVZkRDTWN2UExvelVxTXF2UWNwd3FlNllLT2pJL1lZYXlJUWRHR2YvRDAv?=
 =?utf-8?B?ZGF2SHBmWVkvalRGckpXUUo1QlFScmpKZTFEL0NBV0FPc00weDBpd1lsc2FK?=
 =?utf-8?B?NGRuRkhPSkx2OFZ2STRGZitRcnN0Nm5NT3RGbjZzZm1TdVBVUDdjYjZraFoz?=
 =?utf-8?B?QVIvUkVnNmJxSUdMQnVlMzVwaTNIWSs5NUE1RUt3YmMvT2xjVDJReWFwR1RZ?=
 =?utf-8?B?bTBqZE5RdURaNDVISUJQQ2cyVnpHeGd1aGtwZWMxQjJ4WHdSNVMwMTFYOVRI?=
 =?utf-8?B?cytFc3dZeElyakRrM2wvNkFaZ2pjOHBPQzN4QktQYU1ad3hMODRxbnlzZDlC?=
 =?utf-8?B?TDZFMmhFc2RzRFZzdVNkSmxZRUtoVVdOR0NabjFTTGt0ME5ZczhOeHRZRVBp?=
 =?utf-8?B?UFNMVDBGYlB2SWtwUllCUDhEempHL21YTW1hM1ExOXVPOGdPSklEU2kwTHV5?=
 =?utf-8?B?RC9BL3d1OGtlYS9WZnRmUzNDNHNMbmdONXovU05OMElQWmgwb0hmUjBxODZN?=
 =?utf-8?B?NloyYlh2a05kMmE4OUE4c05mRGlabWEvd1ZwWlFJM3RobFdrUWU4d2NGckRI?=
 =?utf-8?B?bnF6R3B1TXBRV20xRnFUanl3WFgyNDJCbmg0UGpBNTBFNkZmbmhjQUFvcHIr?=
 =?utf-8?B?WmFNOVc1Qi9kMzBNaEtMYU9tZ01HdEh1Y3lNNENTbmJudWlvMkJQUEhuQ29W?=
 =?utf-8?B?bW5sQUFWclNuVzVXZy9sY2t5NTQ5UEhKbVI1VDFwZTRrMkR3V2M3OEZnWTNq?=
 =?utf-8?B?NmpaVyszTkVUejY5OHBuejRjVW42YUkwTVRFbzVMMWc4bHNvT2lDUTZCMTdK?=
 =?utf-8?B?ZzZiZnJ4UWdYaUNKV0lLVWpPZFhWYW9veExnQk1lQ0FFZGF0emQyRG9UMW9w?=
 =?utf-8?B?SlZidnd2anBKMDUvSUN2WTVZNkxCUGxGUVlDbEFTQlg4L00xeVlVMmJwaHN1?=
 =?utf-8?B?L0RnMlR1WkU0WUFFR3BndzBZVERKYmlPMTArMDRoK3lHYUp6Qk1uUkhBSlRN?=
 =?utf-8?Q?06+m/tdF5gz1DGNiYWqPUvs=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rBYRJjTdHsmWjlYzqIxHaJgx0wftOEo/IsmLKh/HUj84rLXGqZRo9p4IhjCbjbsmPPbqVCSdbPMRymqMJkQpQMQh/8iV9Da7DX7KKG7G/IYYFmngd7QecywtNg32/1iXyYOyixqCHHRg3K8mOnaAW1YCXiRfAq2WY8X8R0/gyuPcBo/3kiHdO0BvvUQvQpX6XHwTlmai8xU1Rf+yr1HDDPA5IcpJ80FGTSqjWzA/snkz+KfgJVj/SXjgdr/tbdyjUYl3yeiTMSgoiN5JQ1mSvmd5nZN1bPI12yg8z9gHfUsnWLh4hjr1v8IXkY2rchJOuvtE+VpLhuOPvjTocB21FbCdQmpyCLHuyhPK6khMx24gQ7GciYJyKyA+kb01ovcwzotx/wL3SMQSW7QpVsfL6kCd2oYtkUW4LmVFFytLrxeQOpdAde3fKtQ1iDOw5PpT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:57:23.3147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d75d01-116b-4c71-2fe6-08de63fdb435
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7705

On 2/4/26 4:52 AM, Arnaud Pouliquen wrote:
> On systems with multiple remote processors, the remoteproc device
> enumeration is not stable as it depends on the probe ordering.
> As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
> always refer to the same remote processor instance, which complicates
> userspace applications.
> 

While I will agree it is slightly more complicated in userspace to lookup
the device by name string rather than by some static number, there seems to
be a good reason for not doing this also.

Much like network interfaces where the /dev/eth<x> can change each boot and
attempts to make that static from kernel has been turned down: having static
indexes doesn't make userspace software any more portable.

Say you lock your M33 core to rproc<1> on one SoC, it doesn't mean your next
SoC will have the same rproc order, or even have a M33 at all. So you still
need your userspace code to lookup and check the name, otherwise you make
bad assumptions. Not having static IDs forces software to do the correct
thing here.

The only valid reason I can think up is maybe this makes board specific
documentation easier. One can say:

"On the STM32MP257F-DK, check that the M33 has booted by running
`cat /sys/class/remoteproc/remoteproc3/status`"

without having to first find the right number by checking each
`remoteproc<x>/name`. But wouldn't adding something like a named
sysfs dir syslinks work even better?

`cat /sys/class/remoteproc/m33@76000000/status`

(and yes I know someone here at TI did this alias naming for our
keystone platforms, but if not for possible backwards compat breaks
I'd love to remove that one also)

Andrew

> Inspired by the SPI implementation, this commit allows board-specific
> numbering to be defined in device tree while still supporting dynamically
> registered remote processors.
> 
> For instance, on STM32MP25 Soc this can be used by defining:
> 
>      aliases {
>          rproc0 = &m33_rproc;
>          rproc1 = &m0_rproc;
>      };
> 
> When a "rproc<x>" DT alias is present, use it to assign a fixed
> "/sys/class/remoteproc/remoteproc<x>" entry.
> If no remoteproc alias is defined, keep the legacy index allocation.
> If only some remoteproc instances have an alias, allocate dynamic
> index starting after the highest alias index declared.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com>
> ---
> V3:
> - fix double space typo
> - add Peng Fan's Tested-by
> 
> V2:
> - Introduces rproc_get_index based on Mathieu Poirier's suggestion.
>    An update compared to Mathieu's version is that the call to
>    ida_alloc_range is retained if an alias is found for the remote device,
>    to balance with ida_free().
> - Rename DT alias stem from "remoteproc" to "rproc" to be consistent with
>    keytone driver.
> ---
>   drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++--
>   include/linux/remoteproc.h           |  3 +++
>   2 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index aada2780b343..4a02814c5d04 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2433,6 +2433,43 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>   	return 0;
>   }
>   
> +/**
> + * rproc_get_index - assign a unique device index for a remote processor
> + * @dev: device associated with the remote processor
> + *
> + * Look for a static index coming from the "rproc" DT alias
> + * (e.g. "rproc0"). If none is found, start allocating
> + * dynamic IDs after the highest alias in use.
> + *
> + * Return: a non-negative index on success, or a negative error code on failure.
> + */
> +static int rproc_get_index(struct device *dev)
> +{
> +	int index;
> +
> +	/* No DT to deal with */
> +	if (!dev->of_node)
> +		goto legacy;
> +
> +	/* See if an alias has been assigned to this remoteproc */
> +	index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
> +	if (index >= 0)
> +		return ida_alloc_range(&rproc_dev_index, index, index,
> +				       GFP_KERNEL);
> +	/*
> +	 * No alias has been assigned to this remoteproc device. See if any
> +	 * "rproc" aliases have been assigned and start allocating after
> +	 * the highest one if it is the case.
> +	 */
> +	index = of_alias_get_highest_id(RPROC_ALIAS);
> +	if (index >= 0)
> +		return ida_alloc_range(&rproc_dev_index, index + 1, ~0,
> +				       GFP_KERNEL);
> +
> +legacy:
> +	return ida_alloc(&rproc_dev_index, GFP_KERNEL);
> +}
> +
>   /**
>    * rproc_alloc() - allocate a remote processor handle
>    * @dev: the underlying device
> @@ -2481,8 +2518,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>   	rproc->dev.driver_data = rproc;
>   	idr_init(&rproc->notifyids);
>   
> -	/* Assign a unique device index and name */
> -	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
> +	rproc->index = rproc_get_index(dev);
>   	if (rproc->index < 0) {
>   		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
>   		goto put_device;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..3feb2456ecc4 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -503,6 +503,9 @@ enum rproc_features {
>   	RPROC_MAX_FEATURES,
>   };
>   
> + /* device tree remoteproc Alias stem */
> + #define RPROC_ALIAS "rproc"
> +
>   /**
>    * struct rproc - represents a physical remote processor device
>    * @node: list node of this rproc object


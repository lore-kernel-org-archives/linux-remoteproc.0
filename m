Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013057.outbound.protection.outlook.com [40.93.196.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F866329E53;
	Thu,  5 Feb 2026 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770322090; cv=fail; b=RTaJHla08OoI5TJ39gYJ+FnhV0F3jmFLAzcIz9qX51+/KRAB0B8tnXT/qM12KrGoZN9wkhzj/WatllGfH7SJu7jdmdn0BoKjIgRy0zH8yg4NNgsrk5Fx73W6TiqI/oEgPs0uYh0VqCyoOpqBiB1PzsDkHVrctjKvY/6amxQnwOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770322090; c=relaxed/simple;
	bh=orSiJ5q0AEicB9O+rY6pSyLZrIhKokLqfBLijZXU9fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iHMwZcKPtIxWH4aNWfWWqLUd52M6MoO5q+t85mSi98ystL1puw8z3JyCkSw9FsDh/fI8erXNyGGLoG/DrpOXIrnxJqJugoOP6IsdQvEY+ryLPd6AwXmjgJBsFXWBg5BQQzoJAHhOzIENOnmAfAiYHygyBCJ4tvaZg8/2vcqBb3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZpCT2MHq; arc=fail smtp.client-ip=40.93.196.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZpCT2MHq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyWbFLxokiVNRIvuue3WqJIY57QBCVALqlaqiSmZnQsXEN6yCwOyV07Pvx9OQTZZLOu7O8ZDq8paH+Q29xsY4os+Dxkuo3MvHjEzAgJLT7XdDs2Jcn6Vl4UHN1LcggOqbiA8m7cXRLV9mVLoeaSSQf7awu719TXQbh3bLbLNM2Fby927xLVI451RNiRK2ukKgWLh4pAYSdnrIbmHv4BKZk94p8wf0mxkYPYgDbGRTD70PfrgcsNCSfDCysp9a9ucv/Fa0JKs6XqTM0PPFM+TgtuhswcUNivoQUsxK1MyGgIQ739619R+GLgrQA4q7CoNLRJpoF5s+7f0Ka68znlKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VlQ9fn7jgTAY2Bpv9ysAPoUy4+Kw/XZsIf6Misinn8=;
 b=wkF072XiNyVx/n0s4WbbGvEqoNHt3AM1/CcZiFitCKUaW0l8DHECST5u0Yb6tfkSNRDlw99lwyetQMcInNOWqMkMr+pePL1Cg/hrnqFNXFspQX2LmQDd3T0iWs7TUVrakrIi8KTw0Xrj26P8z+S9tGXUyUwrKUQE+NKugu8Yd4/Fmy2vL3y+d4ZBLZ4T/daVAkjWOOCPaC+Oz6rl0PT5s4LDklicRV7XfeN4aojd6mqujcCGfXtkXZ2kq6hy4fdN4bzVvGW+nRlCndiMJ9Rx+qsaE/AphjpQdTXVaPEWf2Z8Ryyq0mwo2Dq72wbislFfJWTeeCWmIMoAmOHTbq+N0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=ti.com; dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VlQ9fn7jgTAY2Bpv9ysAPoUy4+Kw/XZsIf6Misinn8=;
 b=ZpCT2MHqKCLsbMCYD3pMvjt3LJPzKSmXQI4AeVU6go6bB0NDJwXRw6LVZfHoec06UW4zvzCXXWtp86Q/p6DDwWof1Q/pPNEqMBfHZwS+Pl3UYNtWj9/97GkQuxmbt/OH0KxL0/Zj1ZNlM+0xnbiewq2RFCWRb1EF/EQ6M3dxEDQ=
Received: from SJ0PR05CA0125.namprd05.prod.outlook.com (2603:10b6:a03:33d::10)
 by SA1PR10MB5736.namprd10.prod.outlook.com (2603:10b6:806:232::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 20:08:07 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::58) by SJ0PR05CA0125.outlook.office365.com
 (2603:10b6:a03:33d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 20:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 20:08:05 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 14:07:49 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 14:07:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 14:07:48 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615K7mUQ4009717;
	Thu, 5 Feb 2026 14:07:48 -0600
Message-ID: <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
Date: Thu, 5 Feb 2026 14:07:48 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] remoteproc: core: support fixed device index from
 DT aliases
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
 <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|SA1PR10MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: 76439056-99cc-4624-b8a3-08de64f24677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVh3c3dpT2Q1R29nQ1daWUhMYUlpc0tTZy9nSnoweEFPNHZBV3VXaFFzaENN?=
 =?utf-8?B?VXU4elZCcmtuS0RMcDZXQVJUV3dCYVFFUmtPSFRTMnZ4WEwydzZUQlhBNDNM?=
 =?utf-8?B?NVhsa09vMjhGWXk5bXdiKzFEblc4cUpMc3NCYmIybTRGUndycmdwc2ZKQlVl?=
 =?utf-8?B?WEt6U05PTmoyb0FTOVhpVGFhbFZkOVdrZFZUUm9xQUt2VTJPTFQ1YkNFZ2FJ?=
 =?utf-8?B?OXJMVTRSTk5tZkoxaFBNKzd1azFHQ2hrRWtUVnFDK3BPc00zUHNDdkZoQUVN?=
 =?utf-8?B?clpmNXh3Vmh3NmhzT2xteHFOY1NLd05BUGV3T3Z6YXMwcEM3ZjZHRWJpRUMy?=
 =?utf-8?B?UEVvcEh5T0Zkd2NpLzlEUC9KdmM2WWVhTmYxYVBEU3ZldStpQUdkaExwTzZq?=
 =?utf-8?B?ZVJWOEt4QkpwZGQvVkRkbzIvUkpUS0o5cHRZZE92WlBaU203bExXcmtQUE5s?=
 =?utf-8?B?b1NqWFV3cUh0dnovRFRUR1VOaXJQUTV4R1NlQmpwRFcrRjgyMWhKQWJCdFRQ?=
 =?utf-8?B?amFjY1k5VCt5cHhxSTFadDZKQWRQNmlCWVlKdlV3emtqbU5tRHlJdHc5QTUr?=
 =?utf-8?B?RVlOdjFaODMwNElXcHBwMSs2V1V0eVJ1ajRkWnlSMGVoQkV5QmhmQStyWm9N?=
 =?utf-8?B?NTZ2ako4TzFRZXpVL3BNMHBPdC9PWnArOERGZ3FLYlJoS0hEQXdqb2RpZnYx?=
 =?utf-8?B?ZDg5Q3dpYUJ5ZmhoNHR3SlQrY2t0akUxV3hZajVOYTZBT004N0N1bWNwVXU0?=
 =?utf-8?B?ODFWVmsvQ2tqeDR6Y1AyWjBPOFRZa2xKa1I0dlRPdEVIMFVDVFBwNTN2RmNi?=
 =?utf-8?B?MFBnZFo2OFc0TmtYWXpZY3pmMkhNVTlmMUhTemNMdVRDR21WVTVHcXZwUytO?=
 =?utf-8?B?RjRQSHI2R1M5aGtCanUxbUVhVDR3S2txYTV1LzRKZUFIZUpzYnBwMEhVbEw1?=
 =?utf-8?B?NHl3d1YrZ2MyRGtqZ1pnU3pGTEVNNFc0cjI1UXRKM3BqbmE4Z2VZMzNFUzdt?=
 =?utf-8?B?YXRZQ2JGNytCTmJ1ZTVOd2Vpb25VeCt1NHFKS1M1RjZrWTYwUktkNU9QWTNU?=
 =?utf-8?B?djA1Nm5HditKK3plVTUzMXozWDZXV1BWUjhodkFJU3U4YnJPVUc3Z2g0MGhj?=
 =?utf-8?B?aUpKQzRoeFFBNWN2dEdhTHhUSzY5MzZwalQyT204RDdkYUN2RXlJSGlkT3Y3?=
 =?utf-8?B?N3R3SVp2eldsL2VtTFMzMkZMbTBFa2NyWCtvMnVaemFhZk9HTVJURllwSnU2?=
 =?utf-8?B?cG83QzVJUy8vR20vcEJDVWZCeGh2V3k2VnJ3UW9jazEwdllWbmpkNHIrSUxO?=
 =?utf-8?B?VUdIUElTMVJoTWFSZC9zV2lrTEgzRFQ4dUZMTWpJV3JkVVBNZGx1UUJNR1Zm?=
 =?utf-8?B?NWxHNjd1SXQzL0F2YmxCdG5zK2RRNDJzdEFyN0dncE9ZaXM2ZCtJcjJnWUl4?=
 =?utf-8?B?MzJnKzhCQlJPcEdsSlVHdnlEYUliQWptenhjWnlIWitrY2dzajJJU0d5T3ht?=
 =?utf-8?B?bFh5eDdPc3FxdUM4TjdzOWFlTHRwSmIzdFBYZUNraXowZWZZUUNCcFF0Zy9D?=
 =?utf-8?B?Z0Q5d1o3cTU0ZDdRbkxqQzVoaGEwVVFyUFhEamJ3QU5DTzBuNWw0Q3pzSjM2?=
 =?utf-8?B?NUlOWmlNOW52TFJQOTVHVEp4elV1MjR2SUN0VE9VdDJNYWIwbGF4SVNGQm1a?=
 =?utf-8?B?bVlLUmF3c0dxbGtCWEU2OEhoTDdVNjBxdjNvSXNuUHlvV3pOc0xuQko2Q3o1?=
 =?utf-8?B?MTI1M05FQVpLdjZCZzZYdGdpa096aGl0eWt4N2NMSFJGaFZzbmI1cnVaa0dF?=
 =?utf-8?B?WVk3VXZObFJOSmFjMDU1YWZucGxVanR2NVRHMDlPcE1sNktETkxGUTI0ZEYv?=
 =?utf-8?B?Y3J2M2xHYkRGM1VZamR6L0IvS1VzTGszQWZlZEs0ZndrNVhKOXF1MmhYNUwx?=
 =?utf-8?B?eDd3VnRsdzh4T3MrQkppdTI2MkxjWDk0V1Y1NFRtZWF5VlgyemxFMHFxZ1ox?=
 =?utf-8?B?ZU5EcjlIcEtvc0hGQTc2aGhvbkhROElpMGZHdlpJQ3BqVjNsbTVyZTZBdTdz?=
 =?utf-8?B?Ni9BdXFXN1JHQjJvc3granJLemltTkNjekxiTmp3Q29tZDNpbXQ0ZkRZTzVY?=
 =?utf-8?B?YjBYZTlnbHhEMEJOYmhhSnNKeW9FZGlzQWNEZkRRS1hreWdBSW5HUWhEcEtN?=
 =?utf-8?B?Uk1GL2hoYUtHQzZJM3RORzBack1RcHo5ZnJlRVFlaTFjVlZXYjMxancrOHQ1?=
 =?utf-8?B?K08xelpHR1hDcys5aU9uNm9POXJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0MWnRePpgEKupU7kxIqaXtfXqKiokrCRpnAe+zZhdnIbFVtTtC12Fn4D3fLln/LSqehHLAwL4SaD/cFj95nmxcD4TFp0N5bOKOD6a74JfvFHVbo+eiqBYMh1iIafnfRksxymWnEspJs6zIq6qD7iduPhbnAUZkJ1xxwbGyq0epjk0MeOPt1KIJ63YoRgQ6+d+Y1dKom8X2bbzi80dXrKvIROJxF55eJ8Nw0Oq58EjO9PFafg0jXFt4XquGqp7p6hrqwCRiZ1VW8J103uY2PFyTqfj/gYE2AFqqBoQ8uDkRerVeJca9d4/W2TD0hx/KHbbY5A88ih5feC+i+MBt60VQKgk20ZKdhfcDUVy7hP3ZNKyQDy5GFn1W9SUKXQ3HXS4C4bRt3uSSBFnPLfM+Jwz4US0fEDvwmT/SHjYFs4Cig7W+BN1AnRXJ++x/Icru26
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 20:08:05.8929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76439056-99cc-4624-b8a3-08de64f24677
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5736

On 2/5/26 11:58 AM, Arnaud POULIQUEN wrote:
> Hello,
> 
> On 2/4/26 15:57, Andrew Davis wrote:
>> On 2/4/26 4:52 AM, Arnaud Pouliquen wrote:
>>> On systems with multiple remote processors, the remoteproc device
>>> enumeration is not stable as it depends on the probe ordering.
>>> As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
>>> always refer to the same remote processor instance, which complicates
>>> userspace applications.
>>>
>>
>> While I will agree it is slightly more complicated in userspace to lookup
>> the device by name string rather than by some static number, there seems to
>> be a good reason for not doing this also.
>>
>> Much like network interfaces where the /dev/eth<x> can change each boot and
>> attempts to make that static from kernel has been turned down: having static
>> indexes doesn't make userspace software any more portable.
>>
>> Say you lock your M33 core to rproc<1> on one SoC, it doesn't mean your next
>> SoC will have the same rproc order, or even have a M33 at all. So you still
>> need your userspace code to lookup and check the name, otherwise you make
>> bad assumptions. Not having static IDs forces software to do the correct
>> thing here.
> 
> That was also my initial approach, but it is difficult to impose on our customers who have legacy applications, especially since they are accustomed to using fixed indexes with other framework ABIs.
> 
>>
>> The only valid reason I can think up is maybe this makes board specific
>> documentation easier. One can say:
>>
>> "On the STM32MP257F-DK, check that the M33 has booted by running
>> `cat /sys/class/remoteproc/remoteproc3/status`"
>>
>> without having to first find the right number by checking each
>> `remoteproc<x>/name`. But wouldn't adding something like a named
>> sysfs dir syslinks work even better?
>>
>> `cat /sys/class/remoteproc/m33@76000000/status`
> 
> The only benefit I can see in checking /sys/class/remoteproc/<name>/status instead of /sys/class/remoteproc/remoteproc<x>/name is to avoid iterating over devices by name. However, in both cases, the application still needs to know the remote processor name, which is platform-dependent and usually defined by the device tree.
> 
> At the end, using an index here is simply an optional alternative to the name, as seen in other framework implementations.
> 

Yes, both name and number based indexing will be platform-dependent, but
they are not purely equivalent. The thing I want to avoid about number based
lookup is in documentation. I see docs already that say something like

> To start the R5F core run this command:
> echo start > /sys/class/remoteproc/remoteproc2/state

And folks (or LLMs being trained on the docs) might assume this is in
any way a portable thing to do. Which we know it is not, the number might
change even between two platforms from the same vendor. Where as if the
instructions said:

> echo start > /sys/class/remoteproc/78000000.r5f/state

It becomes immediately obvious this is valid only for a given platform.

The other thing I want to avoid is the ever-growing alias lists in DT.
Could be done without having to add a list of aliases to every DT. Is
there no other heuristic that we could use to produce an static ordering?

Andrew

> Regards,
> Arnaud
> 
>>
>> (and yes I know someone here at TI did this alias naming for our
>> keystone platforms, but if not for possible backwards compat breaks
>> I'd love to remove that one also)
>>
>> Andrew
>>
>>> Inspired by the SPI implementation, this commit allows board-specific
>>> numbering to be defined in device tree while still supporting dynamically
>>> registered remote processors.
>>>
>>> For instance, on STM32MP25 Soc this can be used by defining:
>>>
>>>      aliases {
>>>          rproc0 = &m33_rproc;
>>>          rproc1 = &m0_rproc;
>>>      };
>>>
>>> When a "rproc<x>" DT alias is present, use it to assign a fixed
>>> "/sys/class/remoteproc/remoteproc<x>" entry.
>>> If no remoteproc alias is defined, keep the legacy index allocation.
>>> If only some remoteproc instances have an alias, allocate dynamic
>>> index starting after the highest alias index declared.
>>>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>> Tested-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>> V3:
>>> - fix double space typo
>>> - add Peng Fan's Tested-by
>>>
>>> V2:
>>> - Introduces rproc_get_index based on Mathieu Poirier's suggestion.
>>>    An update compared to Mathieu's version is that the call to
>>>    ida_alloc_range is retained if an alias is found for the remote device,
>>>    to balance with ida_free().
>>> - Rename DT alias stem from "remoteproc" to "rproc" to be consistent with
>>>    keytone driver.
>>> ---
>>>   drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++--
>>>   include/linux/remoteproc.h           |  3 +++
>>>   2 files changed, 41 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/ remoteproc/remoteproc_core.c
>>> index aada2780b343..4a02814c5d04 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -2433,6 +2433,43 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>>>       return 0;
>>>   }
>>> +/**
>>> + * rproc_get_index - assign a unique device index for a remote processor
>>> + * @dev: device associated with the remote processor
>>> + *
>>> + * Look for a static index coming from the "rproc" DT alias
>>> + * (e.g. "rproc0"). If none is found, start allocating
>>> + * dynamic IDs after the highest alias in use.
>>> + *
>>> + * Return: a non-negative index on success, or a negative error code on failure.
>>> + */
>>> +static int rproc_get_index(struct device *dev)
>>> +{
>>> +    int index;
>>> +
>>> +    /* No DT to deal with */
>>> +    if (!dev->of_node)
>>> +        goto legacy;
>>> +
>>> +    /* See if an alias has been assigned to this remoteproc */
>>> +    index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
>>> +    if (index >= 0)
>>> +        return ida_alloc_range(&rproc_dev_index, index, index,
>>> +                       GFP_KERNEL);
>>> +    /*
>>> +     * No alias has been assigned to this remoteproc device. See if any
>>> +     * "rproc" aliases have been assigned and start allocating after
>>> +     * the highest one if it is the case.
>>> +     */
>>> +    index = of_alias_get_highest_id(RPROC_ALIAS);
>>> +    if (index >= 0)
>>> +        return ida_alloc_range(&rproc_dev_index, index + 1, ~0,
>>> +                       GFP_KERNEL);
>>> +
>>> +legacy:
>>> +    return ida_alloc(&rproc_dev_index, GFP_KERNEL);
>>> +}
>>> +
>>>   /**
>>>    * rproc_alloc() - allocate a remote processor handle
>>>    * @dev: the underlying device
>>> @@ -2481,8 +2518,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>>>       rproc->dev.driver_data = rproc;
>>>       idr_init(&rproc->notifyids);
>>> -    /* Assign a unique device index and name */
>>> -    rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
>>> +    rproc->index = rproc_get_index(dev);
>>>       if (rproc->index < 0) {
>>>           dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
>>>           goto put_device;
>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>> index b4795698d8c2..3feb2456ecc4 100644
>>> --- a/include/linux/remoteproc.h
>>> +++ b/include/linux/remoteproc.h
>>> @@ -503,6 +503,9 @@ enum rproc_features {
>>>       RPROC_MAX_FEATURES,
>>>   };
>>> + /* device tree remoteproc Alias stem */
>>> + #define RPROC_ALIAS "rproc"
>>> +
>>>   /**
>>>    * struct rproc - represents a physical remote processor device
>>>    * @node: list node of this rproc object
>>
> 


Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010021.outbound.protection.outlook.com [52.101.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5573254A8;
	Mon, 16 Mar 2026 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679113; cv=fail; b=akpJFX8M9jCzdnVsyopRf1ZmQubB70FKQxD/shaMt21kOqrcpFQsNUvnVU0VbjaeuEexObUKniaVsd57mYe2aK8tLS8iJh5df5zvnaFUno64uDAAliPFv5tJt05atK1miAcIYAAJ6vKAF9lBjQx73yXrromrAMtV8r15Tl+q1HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679113; c=relaxed/simple;
	bh=sjU2wmjnFpIXolvpttxcGYiHBj6U5teUD8UbYu5FcgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hUmCMACNOqI4mJeptfO+W3jtu0uscBaw+GOKEWdME128GMMJ9DLD/GJc4Z3hwGUnn3A6Zn8mpiYdSvM+l08NYEK3LqWZoOnxdy2rtlzeowsc3GB0F71C/Hb/3OnYt/z942xhKePbhj/2Dhu8XjPYrB3V5imL3MeMPft/W6gI/Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PhVmIGgL; arc=fail smtp.client-ip=52.101.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PhVmIGgL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yq1ZSPQQlsAoc/5C/Uo4JDUjUuImAPYqTJR/rQwRWXaYKZPSzZ/qLuPhTt+sTJtcZ32L+9kKBiHnZopz42lpDV9JWVjxYtJU9UiRGcO/4sJXiAVZCSrR8Eup40e+fe2dkXR9zZnOJTb5vphreojSndu5ZKpWBG0t1iIAkeLh60o0d0HpH4SKyn786yJxn0ieeOa3qOp5x5yaIDN6CflZDmelJjnmEeEUoIhzJxILjd5HYEYHMpqFe+zkRqwQwZ5bbeb9saxhZDXOMqjclzH1O2+S+12DN5fHUf1C1+nKQPnwmxCDDCZSnT0r9bNzijKgDa5hbcsmW+uBTaO6JmN0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqdLa/hOBBXdD0BFi8MvU9de4vmClr7tzhH3yOi856M=;
 b=yUASJEPbPq26n6TE+xAFapa/gHYhRGpLqLHrp0oguUTtFUEpyAR3aiehUic7oLS2nNOIhuujEFL31F/lqMTMqsB8CtpSB6YtybRyP4jtE9xrtUfGDUJ8mYjBcrCWQkvoWCfgplWSPj8+zmvFFr+AVm906CtWxr3jJqY0cAlV5SvNoRe7kHnGxsKOK9MBIRqc1ESTlCsp8sJn6pzxoaBRN5bJ/l3OHISM/QGN4gqvZWLz3TDI+U5D1RqdxdzaX0KqULa/7VW1Gqbx2aiYIKv2WXqPVxWivLMJ0MRln2owVprFSui4slJoR8TQnkTN9BBJQXvW0ofxJkdXbdwbMKB47Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqdLa/hOBBXdD0BFi8MvU9de4vmClr7tzhH3yOi856M=;
 b=PhVmIGgLIsRhaahP3K7KT1PX8cqVHNkgqQhmbat9fvbI7jVGHyh4YiAJVKrKIMU04ZKRSoVc/nGU1NF/eZck+cFBZvXzvhVULAvpAsRbu2J5C2SPi47fcu4R/HlFs9XLZJkFDnQz65ClLH0/PfFS2wJ0kqj5B7V37srSBOUI8ak=
Received: from SJ0PR13CA0120.namprd13.prod.outlook.com (2603:10b6:a03:2c5::35)
 by DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 16:38:25 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::5e) by SJ0PR13CA0120.outlook.office365.com
 (2603:10b6:a03:2c5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 16:38:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 16:38:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 16 Mar
 2026 11:38:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Mar
 2026 11:37:06 -0500
Received: from [10.31.206.142] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 11:37:05 -0500
Message-ID: <6e18177d-d2be-4d42-807f-2238436bd4a2@amd.com>
Date: Mon, 16 Mar 2026 11:37:05 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 3/3] remoteproc: zynqmp: release mailbox channels on
 shutdown
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260303235127.2317955-1-tanmay.shah@amd.com>
 <20260303235127.2317955-4-tanmay.shah@amd.com> <abA4wGI7DvQLhTzY@p14s>
 <91a3bf88-cd64-4f3d-adb6-5e21558e8ff8@amd.com> <abgkB_9fMPGtq3Jn@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <abgkB_9fMPGtq3Jn@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: dec81bc2-fcc7-4507-7cc9-08de837a7188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	co/XZJs+LPmGkZdj2aTOICGBOjbypvrdNI3VOc4ffty6v8kKI+FfhwZXFGR10GJKULYTsHS0aTVWBLqG+Zr0oUYNCX1Etp7fy8lvFil0qCCibSsLWVsgCwQVkb3DuZlpkb3dzWXBJXvcCd859aK8OMYeeLys+TIyMsqdkDqqJ5tU2Qko8NZ+KvAM6ti+GOrwgbI6WUa1yT0PxPHLb2tlEnqzF9a6Z2OFzK5ZV5KMA+8dixxjXlVJusFbfLgytoYwRHkFspyFPHNuqnY1CT4tsdayHm81HYK7/CjfqRFuXZzz94WbDM6mUIJW3BSr23PNBqKRDqRKrlaq8XbcUy0DqJFB/67fS9PAQGlTaoj9TDWgxhdPRI1Y0CyJPdUx1Rx1M9TLG2OPP/SunaRKHyKM2v8835mDfI1DOPEcMw4oYC1p22QuBer/uqLqtI6M8/K1EP3VLU69X5BvEOqqrtbQFKRfqN6IfksMOBYCkfCvT4IbjQ3h9UIhFX7jT+7AGX0NnmTXltPTl03aeVQ3N+Ot4GS5tKw6v5eE6F+MSM4VFPd7TGsm9+yMqVvT0pzyXOGtTL6W+zTLGhOBhW+PLt1bDGFIO7c3545HBOy8myXy7n9pyL57jArH4WGxi237SPjkaDjH9QwCapPMdf+/DPe6/Yzkv7jATV2OklhLiUr0JQsUqmxYpCUqEeFeDsQe77+5GTthJdy6++wvKWMgCyDrv+pQ+Cdpeb76Fpp2aFI07lgI/nnZta0bfp8Q4xgbNn3uJllpIm9uwy5576XrcrQ0Ng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RQmRgv61h/skY7XUwvq9wAwVLOkSR06CmiXsnHZVwRl12+cyxQK5KSEKuuKX1gVjseiWMjVfp5I+oAMOBa/hh1koSezziTkJoZmLq/LJao+RioS4oSzFECIy8QW5g7RSq1WYg2mB9WRZGpywflXm2GTPjd9nDMjL1hTbHQ1QBOFjPGvxCze4rSqBeVyonc1eLKbr2c05/2UEHWsiSrRHKMHWrHqRebP/iZfnGrT+XlNJexh4AGqQeyha5BapnVvQM9QdmLFf9vY44QQ0Hl9xekfspQEcf4s7WHF376qdU7c6rDkHMT/8ruayUYBj/LMh4cLAvVpeTfv22bNvovdFnBvS5hYWCV4JpUFW8DIvjHHG4lskAZRSPvhLSCCf5y2iudqnV+Xm3/14YgVmZTOyvrGXQU44EH7TGKpXVOZmsIdF+4DeFGQ/YN+e4FWGczuH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:38:24.6116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dec81bc2-fcc7-4507-7cc9-08de837a7188
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684



On 3/16/2026 10:38 AM, Mathieu Poirier wrote:
> On Tue, Mar 10, 2026 at 11:04:54AM -0500, Shah, Tanmay wrote:
>>
>>
>> On 3/10/2026 10:29 AM, Mathieu Poirier wrote:
>>> On Tue, Mar 03, 2026 at 03:51:28PM -0800, Tanmay Shah wrote:
>>>> mailbox driver can't introduce shutdown callback, as it might endup
>>>> closing mbox channels prematurely. By allowing the client driver to
>>>> manage the shutdown process, it's ensured that mailbox channels are
>>>> closed only when they are no longer needed.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> index 5e92dc51f1c0..50a9974f3202 100644
>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> @@ -1490,6 +1490,8 @@ static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
>>>>  			dev_err(cluster->dev, "failed to %s rproc %d\n",
>>>>  				rproc_state_str, rproc->index);
>>>>  		}
>>>> +
>>>> +		zynqmp_r5_free_mbox(r5_core->ipi);
>>>
>>> This is already called in zynqmp_r5_cluster_exit(), why doing it here again?
>>>
>>
>> Hi,
>>
>> Thanks for reviews.
>> I think cluster_exit() call is called only during driver unload. Where
>> as shutdown callback is called during power-off commands of linux like
>> reboot or shutdown.
>>
>> That is why I am calling it separately during shutdown() callback.
> 
> Then call zynqmp_r5_free_mbox() from zynqmp_r5_remoteproc_shutdown() rather than
> zynqmp_r5_cluster_exit().
> 

I have to call zynqmp_r5_free_mbox() from both handlers i.e.
platform_driver.remove() and platform_driver.shutdown(). I can't skip
either of them.

Because during driver unload (rmmod), shutdown() handler won't be
called. And during power-off commands (reboot, shutdown) remove()
handler won't be called.

Let me know if I am still missing something.

Thanks,
Tanmay

>>
>> Thanks,
>> Tanmay
>>
>>> I have applied the other two patches in this series.
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>>  	}
>>>>  }
>>>>  
>>>> -- 
>>>> 2.34.1
>>>>
>>


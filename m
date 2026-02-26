Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FA631AF24;
	Thu, 26 Feb 2026 22:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772145416; cv=fail; b=pZKPylqZWbP/O5DiSnfc93OHEZ4P8ChiiZzAFcVbry0JXBaHMAn820U/96e5JIBxKk8oOPd6mY+cIW/KdRvVVwGLkBtphZS2xdYPwJ2gWAAQBzBVOjO70H7ioUA6bS+UBQsgXW/6RJ6yNLJvI23jmSFtNjbndaWMc2qpZkyrkko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772145416; c=relaxed/simple;
	bh=FWDprvvnTZmgoZqDXOYEFvXIXqdoYXM36fitvjtA6IQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e8bmU6bIPb41dlHpChqHLcFuHJu0IUrARqL6GtcqTuE7nk3K71V+kyusFH8oE/vy3ZA9fVD6Sfch0J6amdU9QKJ4qc69M2PQFWwJyueyVeg6WgSI6pU+ROhyQo2SBXNWgpjsYfjepv5CozEEdY394wUofK4+LkW8HgyutHFjq04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R2PL8nfp; arc=fail smtp.client-ip=40.93.195.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R2PL8nfp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXJEKWjUb2JtVVuDRIiozJgcP8loEa4D36/+5pVX9QxO3Cbn2TSy5bKTztQbabVmxmkRHgk96yamMXbttLAcMwYWTZ34zFNlW4gRRPcGJkMNPoGYeawdsFHsG1c1+n2tVX9JhFRlo8vlZxwY72vOD+Qmuv+kk4mckTSutFYDGg0vxo4xmarZ9UDy9Rzn/QTJk0TlFfAU6rLcXUp2xWhHdidoF847wFlU01+qQTlM9Qbb+1tgqT3OiuCdD/+6ei512vugMHQYBY/8v0aNNhqaQ01Ajc/uEsPeIuivyOdvGdMzVgQiMdUUe0xxfLkmx8UYJI6c6kuYkpVUtCnBzRtggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvLGYnhJNT9e3prILxnVenW/cwvFA7VA0KYrb6NWtDA=;
 b=p/0OfnMSuoKl7+ewMouJ3BU99hnPAijkbUi6GXCX+ORmISKmCpUmygveSryOPO3PBjzKSANEZXhdnlK5h7TBQpYZPE95tLkZv3XHxruE8jn5HPePjstYkihAEummVc0LurCuhI4pVQ8mX82bk7GQwSJC84FVBcpOMvZEkQLIjAGodkRbuR5JZhyUhQvGXwyq7bHkyAGbFJs8YvOfxpwpFzkSkb5MDk6Lq+jtzVnhPrs4Q46fS2jAicSE6a0AL2sWdzaQ2Egfr66BxFYgwFD3qqap0VaL3YXcZ1r/ryudaaPdu2eDyD2c7i6GINiwnmmY8rxmt9y3F7mhDdE6g/8uiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvLGYnhJNT9e3prILxnVenW/cwvFA7VA0KYrb6NWtDA=;
 b=R2PL8nfpMy7bGMdtF00g/dg15FxZJ5JJJelygjTMyTwHJF8hft2xo6SegqjNcU82n1phETk7w4HS8sQQXtwzLDDBHia3nTmtvwphFxPqjEFH+4+gM1gGMEPDNcfyeSSniNDJtTVSCJuRbIXxgq01krS0B/QUEuKB0roHfRqSDFA=
Received: from MN0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::13)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 22:36:48 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::41) by MN0P220CA0015.outlook.office365.com
 (2603:10b6:208:52e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 22:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Thu, 26 Feb 2026 22:36:48 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 16:36:48 -0600
Received: from [10.31.200.39] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Feb 2026 16:36:47 -0600
Message-ID: <efaeea43-19e6-4dc2-ade3-6e8ad3e99843@amd.com>
Date: Thu, 26 Feb 2026 16:36:48 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 1/2] remoteproc: core: full attach detach during
 recovery
To: Bjorn Andersson <andersson@kernel.org>, <tanmay.shah@amd.com>
CC: <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-2-tanmay.shah@amd.com>
 <tggyglgkgwj4skvyyeg74gdhlzmw45pmpakvrnghp5jsv6ujtp@z32a7g2s6sle>
 <fcbdd56d-7631-4ab1-adbf-48fd49c9a8cb@amd.com>
 <l7ar4qgfb7i4fsi2hclhokvmlln5wgkgwv3n6hdp3gehwsm72a@uz4ouv5kwlgk>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <l7ar4qgfb7i4fsi2hclhokvmlln5wgkgwv3n6hdp3gehwsm72a@uz4ouv5kwlgk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 176ff932-4471-4928-5c1b-08de7587877b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	jQySHRM1mzJgkXA/UTU5I9dlQ5HXdlQMVO8OfS+O0XzepFFY+tkDPc8yKsP9gKat1OYZ2xbnwLtqQ9KROfUB4HOZ5v+8k5X81oOFjxPc/HYnSCsdzUrYDyV60S6X4KPN194uqAaO4iKPrDrXhjx9s2q+BHljHKmeucRuDK2InuKbiiJwTAGa0haqKLwRyTvnkRInWdL/gypIAeoS8ZHJjP9/RIPi7kKheOPGa2zuo1tfVager49GM3bhPMD0E191K9qrRqlH1UCkKRMfGk1MJ1YnMCiUotWzSZQRVT4GP21kIPecv/JmqHmw3MLMT+riINIY8dVCukC7hsWJum50Sz5JMJNDY/neNZucW8Cqti0Ej/m773QPFm/b9vb2KuVyk73otai+qfXC8zeaTdLOenltblRBnLg8vEC1DxsU0aFLPgbnylpc4+E0BeYqxI4DHxWkadWpDuV3GqiNtMHVQ7Ci4DX5h9tSks+8zz0K70Eg5xEGgL3ynmKznbDOcDnCEj7pwLiLFAo2Vv5F1mXwi6vL5ZpyeZ3mSwdH/xcYogk35sGoHrnITJqOOQ/FEAexs9S0RnrG9ZCcTCD36PiQDiCHEzdxwqUvoV480g8cK7pzKjLGE+f2Fzsnn4B8/Dp4k7OftnkXWsedZZl5Dx6V93oUme7rqzD1DEa+xCoaymr41txNsvJ7a9Egjdb7baoKE4DWx35S0C+AxuYBkS+k1ion/QDqFGCQuMX9GvTBuNwYlWROXbWWxKQqQ2YtZL1turTR0jYQhYo6S2ylpno9ZYgkG4bNmZTKe6tmrGuV24wabIt8JZ/Ax9kMwmURua0vR+bSy/w2d3/uV66HgK/gxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gc0gYJlX0XnS53xT8AugkPEYLDwjMs2iO4kNBN0lF/75ixgdv664uTJT0WBJlOFlc3XFdiWJkpz4naoveZQtRZ1NTWER9o7vYfJZUTctVM+bQDE0TYXwfkHP6B6XNfmGXs30Y1zxryaCZcutDeyeH+5dm1cdwqXVS70BKI+ZeuMG/ZoCxpEjzlNZ23f/PG+Gb8lyIMpsuVWQRIuIiuABGfTVz1jMeeLE81RHGWocwt3bQJcadoEaeUFbcfkkZDoI07ZwTZHRvjIXDAwayyNTxnTbM7D05ebBGTMTNKoYD9pNwppOOMX+D/3Zh4Zfq4a6tCYZ45s1b9tTJkEuT4+6Wytzywfnz4rDeaZvGy/Cci8Ul60fBSAvlaKlzdHRiNhOEPIMrz6iK7MZxHN1s4gZQ3zqA8D9cOcOq+6rND6VVPd7V6OtHHU8Guvmzd5U0F2T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:36:48.6792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 176ff932-4471-4928-5c1b-08de7587877b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726



On 2/25/2026 5:42 PM, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 03:43:56PM -0600, Shah, Tanmay wrote:
>> Hello,
>>
>> Thank you for the reviews. My response below:
>>
>> On 2/23/2026 1:27 PM, Bjorn Andersson wrote:
>>> On Mon, Feb 23, 2026 at 10:50:05AM -0800, Tanmay Shah wrote:
>>>> Current attach on recovery mechanism loads the clean resource table
>>>> during recovery, but doesn't re-allocate the resources. RPMsg
>>>> communication will fail after recovery due to this. Fix this
>>>> incorrect behavior by doing the full detach and attach of remote
>>>> processor during the recovery. This will load the clean resource table
>>>> and re-allocate all the resources, which will set up correct vring
>>>> information in the resource table.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>>  - both rproc_attach_recovery() and
>>>>    rproc_boot_recovery() are called the same way.
>>>>  - remove unrelated changes
>>>>
>>>> Changes in v2:
>>>>  - use rproc_boot instead of rproc_attach
>>>>  - move debug message early in the function
>>>>
>>>>  drivers/remoteproc/remoteproc_core.c | 33 +++++++++++-----------------
>>>>  1 file changed, 13 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>> index aada2780b343..790ad7c6d12e 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc *rproc)
>>>>  {
>>>>  	int ret;
>>>>  
>>>> -	ret = __rproc_detach(rproc);
>>>> +	ret = rproc_detach(rproc);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> -	return __rproc_attach(rproc);
>>>> +	return rproc_boot(rproc);
>>>>  }
>>>>  
>>>>  static int rproc_boot_recovery(struct rproc *rproc)
>>>> @@ -1790,10 +1790,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>>>  	struct device *dev = &rproc->dev;
>>>>  	int ret;
>>>>  
>>>> -	ret = rproc_stop(rproc, true);
>>>> +	ret = mutex_lock_interruptible(&rproc->lock);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> +	ret = rproc_stop(rproc, true);
>>>> +	if (ret)
>>>> +		goto unlock_mutex;
>>>> +
>>>>  	/* generate coredump */
>>>>  	rproc->ops->coredump(rproc);
>>>>  
>>>> @@ -1801,7 +1805,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>>>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>>>  	if (ret < 0) {
>>>>  		dev_err(dev, "request_firmware failed: %d\n", ret);
>>>> -		return ret;
>>>> +		goto unlock_mutex;
>>>>  	}
>>>>  
>>>>  	/* boot the remote processor up again */
>>>> @@ -1809,6 +1813,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>>>  
>>>>  	release_firmware(firmware_p);
>>>>  
>>>> +unlock_mutex:
>>>> +	mutex_unlock(&rproc->lock);
>>>>  	return ret;
>>>>  }
>>>>  
>>>> @@ -1827,26 +1833,13 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>>>  int rproc_trigger_recovery(struct rproc *rproc)
>>>>  {
>>>>  	struct device *dev = &rproc->dev;
>>>> -	int ret;
>>>> -
>>>> -	ret = mutex_lock_interruptible(&rproc->lock);
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>> -	/* State could have changed before we got the mutex */
>>>> -	if (rproc->state != RPROC_CRASHED)
>>>> -		goto unlock_mutex;
>>>>  
>>>>  	dev_err(dev, "recovering %s\n", rproc->name);
>>>>  
>>>>  	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
>>>> -		ret = rproc_attach_recovery(rproc);
>>>> +		return rproc_attach_recovery(rproc);
>>>
>>> rproc_trigger_recovery() can be called either from scheduled work or
>>> directly from the debugfs/sysfs interface, it doesn't seem safe to me to
>>> call rproc_attach_recovery() without ensuring mutual exclusion between
>>> multiple parallel callers.
>>>
>>
>> I think mutual exclusion is still maintained.
>>
>>> In fact, I can see the relationship between the commit message and the
>>> changes in rproc_attach_recovery() and rproc_detach(), but I'm not sure
>>> why you need to change rproc_boot_recovery() and
>>> rproc_trigger_recovery(). Perhaps you're just missing some explanation
>>> in the commit message?
>>>
>>
>> Here, I am refactoring how lock is used and that is why I have to modify
>> rproc_trigger_recovery() and rproc_boot_recovery().
>>
>> Before:
>>
>> rproc_trigger_recovery() -> lock() -> __rproc_detach() /
>> rproc_boot_recovery() -> unlock()
>>
>> Now, __rproc_detach is replaced with rproc_detach(), which already has
>> mutual exclusion implemented within the call.
>>
>> After:
>>
>> 1) for attach recovery
>> rproc_trigger_recovery() -> rproc_attach_recovery() -> rproc_detach() ->
>> lock() -> ... -> unlock() -> rproc_boot() -> lock() ... -> unlock()
>>
> 
> The concern I had was that we're letting others execute inbetween
> rproc_detach() and rproc_boot(). But perhaps that's okay?
> 
>> 2) To call rproc_attach_recovery() and rproc_boot_recovery() in the same
>> manner, I modified rproc_boot_recovery() and introduced mutual exclusion
>> around it.
>>
> 
> No, in rproc_boot_recovery() you're locking around stop and start. In
> rproc_attach_recovery() you're locking within each part.
> 
> Looking more at this, I dislike the asymmetry between rproc_detach() vs
> rproc_boot(), and how I presume this then relies on rproc_boot() mostly
> just calling rproc_attach().
> 
> This seems to come from the fact that rproc_attach() and rproc_start()
> aren't symmetrical and rproc_detach() and rproc_stop() aren't.
> 
> It would be good if we could get this lined up, so that it's not so hard
> to reason about the different code paths through the core.
> 
> 
> Regardless of this though, the removal of the check for state !=
> RPROC_CRASHED (under a lock) means that inbetween
> rproc_crash_handler_work() and rproc_trigger_recovery() someone can
> write "recover" into the "recovery" debugfs entry and we will recover
> twice.
> 

Okay, to address this concern I will maintain original code in the
rproc_trigger_reocvery().

In, rproc_attach_recovery() I won't be calling rproc_detach() and
rproc_boot(). Instead I will programming sequence needed from
rproc_detach(), and then call rproc_attach() directly. This will help
maintain mutual exclusion same as before during the recovery process.

This will duplicate some code, but that can be refactored later, when
asymmetry of rproc_detach() vs rproc_stop() will be fixed.

I hope that's fine. I am open to any other proposal as well.

If you prefer to see v4, before further reviews let me know.

Thanks,
Tanmay


> Regards,
> Bjorn
> 
>> If you prefer, I can add commit message explaining this change. This is
>> only refactoring of the code and no new feature though.
>> Let me know if something is still missing in the implementation or in
>> the above explanation.
>>
>> Thank You,
>> Tanmay
>>
>>> Regards,
>>> Bjorn
>>>
>>>>  	else
>>>> -		ret = rproc_boot_recovery(rproc);
>>>> -
>>>> -unlock_mutex:
>>>> -	mutex_unlock(&rproc->lock);
>>>> -	return ret;
>>>> +		return rproc_boot_recovery(rproc);
>>>>  }
>>>>  
>>>>  /**
>>>> @@ -2057,7 +2050,7 @@ int rproc_detach(struct rproc *rproc)
>>>>  		return ret;
>>>>  	}
>>>>  
>>>> -	if (rproc->state != RPROC_ATTACHED) {
>>>> +	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
>>>>  		ret = -EINVAL;
>>>>  		goto out;
>>>>  	}
>>>> -- 
>>>> 2.34.1
>>>>
>>


Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012033.outbound.protection.outlook.com [40.93.195.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F152FFF9D;
	Tue, 17 Mar 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764268; cv=fail; b=T7YzyxqbcBxbVqdIWwgUldkIJkYrdqSKymxeog+8QSn9ADQ+eElwflJRhbheYCuzCJbTIBZlA+yarhe3dbb0p9raOEQv5JbH1bo2Mue5nU25yrJQ+mpe6QXA3UBiXnEossB6NNZHqCceZx2GjT6yGWm8WijHJXBlFsRUZLJbgik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764268; c=relaxed/simple;
	bh=fpwWRRkHpw45Cy4vES0JxNWeyH6EE/e42q7OBExoWi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UIctGb2ybp6wEhs67U6DWskqa0QKsMWcMLScQiVr9bcqdAQtP/X8XaRNcHEUQ+zEcbjmFgmBlWnTt+k6WVsXI/ZD1vAusXOyG3J9bgerUIJGzYXzaxkzsAnFdIsGWMLsdieutlVAFCn6rLeCq5SaRfJNCXEdN9HG2eSmykW8kI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ef1sBlZf; arc=fail smtp.client-ip=40.93.195.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ef1sBlZf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMzaECQwrZASTs8055aVwdE2ewaaKHKbHcGKfDi/+lQXgO85bZ34VdjVGjbJzDM76FfjSiGbSVu1ze9mYYrcgwiBngaZeBoiGLGZMakxiUXEySB+udWJDZyunb1UqkTvlySgGg8TnXjMh8Gz/4Yw8liiD2HihnUTyZk+2oubHS759McHP6aO7ySL35xN+efYYMwF/xd0fXuyx6QrfHN3qEoxWCiI7+8DT0IvVmmdnimiwZbAaJMVQbKpRWvKOkSeiW9x2Qt3PjG0reBB4ym2yAqUJJ1H9KglTIagSgfHVTf20YNsn/sze7YyzQ0DdU7ShaCa1yEsOG0ptH1lDub+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QR8qTLvQxc/bWeEGaFfSdsIpiDtAv42Xmu6/ncSwnoY=;
 b=rHG6/ExQvV/lWHa0yaJ3y5cCRs29dtuxoC4XNaPA8S25MudDE7GUV0DW9lMg5agQYThZ3kNRE9mK9eo0QZqqhYtSTgW3d9nN5t6uiYc9BXsvLXa/ncqmieFfr+7+ZLNwwid6AUcOj4AcukB8GIVSmcrUMKAk2BMvsKSZvBjSSXGRScUrrSmr2sZfHCrAFdhTF/EiYI8dBVTM3pMbCiGxTKES4x8B4HU6198yo+pdlPrSCr8BPhOwYpAvt/KyylXT29bGSpssZ43dTwAi5bvu/sWM5WPpZ/wUcjzUcEYTgzp8ZeKu/v0Ha2211ZC18VEzFRdaGeL1ZLNBU5vOiFGKiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QR8qTLvQxc/bWeEGaFfSdsIpiDtAv42Xmu6/ncSwnoY=;
 b=ef1sBlZflNFxeVvOmREpK6qf+vXj05KaI65qznt2xW7bzeHZqKCtG4gd43iUxH9Zsrimd03ZOh9+R60sKpmTvrCxdfXon0e4lM+rbzDh3A01uM/WuTFi/hFp2NTLPBOiA5u9w3ElWitmouDCCXp4kAsw6CRcZ/wyESh05DTevGQ=
Received: from SN7P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::32)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:17:39 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::f5) by SN7P220CA0027.outlook.office365.com
 (2603:10b6:806:123::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 16:17:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:17:38 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:17:38 -0500
Received: from [10.31.206.142] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:17:38 -0500
Message-ID: <5bddb3fb-56a9-4e9d-92f0-e1b2f1de964a@amd.com>
Date: Tue, 17 Mar 2026 11:17:37 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: do not send new mailbox notification
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260219224329.3475032-1-tanmay.shah@amd.com>
 <abgfO32Dc9QbgQau@p14s> <dcf81aa3-a50e-4545-8d6f-7885c6804e87@amd.com>
 <ablv2f7Y7bESE3Bg@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ablv2f7Y7bESE3Bg@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c734660-5600-4ecd-9f36-08de8440b571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|13003099007|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Dmago/gbZgCifrYVQzQO6r87H2KW9iiYayy0fY+ZzQO9aeAwtjueG0E58KZ4kMCPJkXjQ3ZP2f06Fg/awmMSOb/yfB7oOqlyKHKZ3iuKI8VHt5bVAwtWWJIetz1+HZQk8bWZELUjh9osYAlHZfZNoq9a9gblMDyg3mRUYKJ1Jgw4tj3SlUHmnrJ4jVLeq3ScLExcS3ELUUV+cNB5mF+8v3mLxjVkx3C6m7aCQkFiLEc1L0Ab6DLn4MIaN+OmAEnO99ZE0Mckbdmw6GuGPUqFEEHhdmmvd+TkQ/NTTw4jYB+vK/oKR0AM4AY2yrB7jyy6QFurLiJsFRyrKLpT0LBevC0nleL/A0mABTEM4zOF6KpF0VR7XjDTXiWErKkZg5Hzjh1xPbSB6U/QDSkwsER/4Xu6UVUQm3yiAlB01IL7gcv+Dksc2omqj0aFO4Zoa4oDfssftjC8NqHGHNcWOGAE6wL15oyjh+QGSNZWV2YvsVQsVVTcppz0wp9SnfvF9H5O3BO5vNkmXaemLLQJw84xAtrx82wKFbs7fhXpkaTALipd0EpH+CCWHvCrIFBRouwu6Uj6OlQVMt9UOE6CAnxmWcUY/zAZHM+4hvFyNjBZmFA3RAvEAwqzhnQ9XOousQBVz1r5NZut6KVlzObm/GA8sfZxFl95Q104vLQyirGza0CXDKODKN/lCfCFXGrvM/KNX9EDQUXeNkzUAdVD7JiaUQ+YD42IzRUgG0J+tLt+ZaY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(13003099007)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Qu47eqr94ZsKH3wPQR3fwJL6GQm21MIPgj3ILXcj5vpC9eLIysRI0bLNGSkvFEzYxZ0Eh+bp2O5DB5SJn6xM0Bj0E6lxmvodkV67hWZyK9ufCKfsldPqrROyWSkJezLpStcNRnf2mmEWeqRspGRb+773CsO7L6Ms2odHmmiSlwhJ/T4yjie6KKaBNJIOhitwCf/E66mR8h1GEBRsSgfGfrBehbJ3uZB8MnW3820YsyfuPOg+VEc67T2YK7/IVUMeB5GwhziYY60q4X/uz+hexvPYsJVeLP9FTB9ldFrsafc3edX3Ewt/NvvOtCBmA0xu1XRdA1erVFzLjtDLv9FQItkSdkAQGaXUYQ85BdkUwoeaisg5HVmQI6MbU7qwtdFimUSdf2LVBAJFkS1glxAz7BqrmxFRoQMnMlDAOtzJCHcejER0GbUjzXnZcazzJIr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:17:38.9734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c734660-5600-4ecd-9f36-08de8440b571
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676



On 3/17/2026 10:14 AM, Mathieu Poirier wrote:
> On Mon, Mar 16, 2026 at 11:29:49AM -0500, Shah, Tanmay wrote:
>>
>>
>> On 3/16/2026 10:18 AM, Mathieu Poirier wrote:
>>> On Thu, Feb 19, 2026 at 02:43:30PM -0800, Tanmay Shah wrote:
>>>> Only write a new message to the tx mbox queue if slot is available in
>>>> the tx queue. If queue is full, then do not send new mbox notification.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>
>>>> Depends on: https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/T/#u
>>>>
>>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> index bd619a6c42aa..622de733c929 100644
>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> @@ -332,7 +332,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>>>>  	int ret;
>>>>  
>>>>  	ipi = r5_core->ipi;
>>>> -	if (!ipi)
>>>> +	if (!ipi || !ipi->tx_chan)
>>>> +		return;
>>>> +
>>>> +	if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
>>>>  		return;
>>>>
>>>
>>> Is see 3 options to handle this situation:
>>>
>>> (1) I can provide an RB for this patch and Jassi picks it up in his tree.  The
>>> downside is that if a subsequent submission conflicts with this change, we have
>>> to wait for the next cycle.  In that case:
>>>
>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>
>>> (2) Jassi provides me with a pull request to bring the patch in the
>>> rproc-next tree.
>>>
>>
>> Hi Mathieu,
>>
>> I am curious what do you mean by pull request?
>>
>> Jassi had included remoteproc mailing list when sent the original patch
>> here:
>> https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/
>>
>> Since then no other change was introduced in that patch. Isn't it enough
>> for it to pick-up for rproc-next? I am just asking from the process
>> point of view, what should have been done differently?
>>
>> If all looks good, then I think you can pick up original patch from him
>> for rproc-next, as the same patch got merged in the linux-next.
> 
> If I apply Jassi's patch to rproc-next, we'll end up with the same patch with
> two different SHA1s in two different trees, something that is not compatible
> with the linux-next process.  To avoid this kind of situation we work with pull
> requests, which doesn't change the patch's SHA1.
> 
> Since preparing a pull request takes time that Jassi may not have, I provided my
> R-B for your patch, allowing him to merge it in his mailbox tree.
> 

Thanks Mathieu,

It makes sense now. I appreciate your response.
It looks like then option-3 is the cleanest solution then.

I can wait now as I have your R-B anyway now.

I will rebase the patch after 5-weeks on the remoteproc for-next branch.
If I see the merge conflict, then I will resend the patch.

Thanks,
Tanmay

>>
>> Thanks,
>> Tanmay
>>
>>> (3) I pick it up in the rproc-next tree in 5 weeks when v7.1-rc1 comes out.
>>>   
>>>>  	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
>>>>
>>>> base-commit: 462799c088e71b2b8a511c2a9649420fcb569ab7
>>>> -- 
>>>> 2.34.1
>>>>
>>


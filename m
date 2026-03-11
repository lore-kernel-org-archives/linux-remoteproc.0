Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CAC2C0285;
	Wed, 11 Mar 2026 19:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257310; cv=fail; b=rDcG1+14mKFWMmk0tzSSba9HuGfKSfcOCf4v4oW6sSZX1jqzGjvZewTWr2yfOUi2sxuFqeV8+qRe8CTq5+tF/rcSd/Df3josxEtHbRtoJivnze3/JGvrNvBkKVdtT85knlHe8+5RgEO60kzTzA+552c20uA25UhtMOXXDu+J9LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257310; c=relaxed/simple;
	bh=QJ6X4R3larHWKeKUfkGWsbUPSPhU+x7Rw04x8ZmNq3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oDDBCyXbrwMaxX2ZWt78IvWxGBm7W9i0CUh0JihaXH1iFXIi/GKqVTtpnWQtee82hg/xBGWnv5LkR3Wa1fZhPTwFSO9i1vea0aebD9WVXl9+eziltvASjS2FLY/5FGy045NeOP8W+91H3dLKIF15fvvsfvH+I398y2j+jc0njrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fRtOoPV1; arc=fail smtp.client-ip=40.107.208.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fRtOoPV1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbZH0pEELXhW3a9iqMBpXe7SuoB8Jfz0on55ZIOhA8NQJXcDHNSpBUqGKApcmD4ZkiNWvcUbFiulAIXGTF1AHneDW+5UzpPqo8Y7gAYQweXNU17D+1ghu6+731whpjeEJrYBtrYnEY/Nx5lxT8ivZJLs7dDpEIXvhouQXMZTTib0x75q+ITz3lkWC5PbHKJtKxA4qQhBxxC/NewCAUNWzMmrK4lyji7zVCToH2MuLAzZSUdyQ0fPZ7afR1yPXUP7HvSwCvXdZxxn5lK9Co6rm/TradbZD+UmwtK2X6qECkRbyzRfGQ4VLHXgxCL7mU4+CF7/g/hd+AlLmx3v5DQBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bkv1+p4Js6NzfkAzivEHajfBwKNrdYJq18Dun67D3w=;
 b=TkJOq2+YbN9WYJTErCkB7DnUH5O1fisiIzLB+zyBAkC9+CAq9G//3umG3rGbgzZOy+3NhwVg35cjWYSig+tD/Jx3u4bd7wN22Ur6tR6KbFaq0Xl0q2aa0yU0cFRq7FqZcR2UE+cMza6IILSX6aH9hTZ4vbDf0r+TztDLS93abAUInGJRHZ7+hvlzgywlYK5m6yLl+nxnnX7uxMdQC+yVDwDxxnYzDVC6DzA2O3/tzmx0BHYaHMrqpD+VQGERLCqOfIeNx09ExPYQaC2Fxxdi6/3Gw9rpJg3nIaVJDKLqJzhOCf2gUHJtyD4azEF1PgnrOL1EcPyeG3mK0ksXQHWCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bkv1+p4Js6NzfkAzivEHajfBwKNrdYJq18Dun67D3w=;
 b=fRtOoPV1NGXvUcojBsKAuMaVbgpJ7zOgp/JtYfTE/cvKHLKhccs1aguVJMxIMAuC3ZOgTWYYO7fKzUNmvqVi1k/QfnmraEXNRV4e4BpdhhrMAlC3qXd3ESMJBTLutP/yWuFtZwIHrMb2KuKmuqDRSryg9pjjABjIhLnhITuDTFU=
Received: from BY5PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:1e0::16)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Wed, 11 Mar
 2026 19:28:20 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::93) by BY5PR03CA0006.outlook.office365.com
 (2603:10b6:a03:1e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 19:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 19:28:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 11 Mar
 2026 14:28:19 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Mar
 2026 14:28:19 -0500
Received: from [10.31.206.142] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Mar 2026 14:28:18 -0500
Message-ID: <4868ea67-34f8-4b41-8d5e-9fc3d4517c01@amd.com>
Date: Wed, 11 Mar 2026 14:28:18 -0500
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
 <91a3bf88-cd64-4f3d-adb6-5e21558e8ff8@amd.com> <abGihYilz6yC0TCh@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <abGihYilz6yC0TCh@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c5b559-d205-4d78-5ed9-08de7fa45a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MKZAic3WIxRVdoGFfUBWrQh6aP28ZZMXP0M5TlI6/qcnSLWoKuklu8GUFXUimg5RW3wigXLnOu733/MC9LEs+pP7aNrBOwbsu7x9CEUg5QqV9zKJm+TjBxq5NrTVONAi2T3MCPRyQ2lP4iNrSeibT+m2fzIVxY8Clitt9FURpGpoG8qtwc0fIOYRxpIehR/r7zN0Ckuh7bBSjs/k3qm0TMjEYwXwGEVmLWA7Am4lYKVQXPf1UHveybvrITV/1+R9EGzXtua3bkzhmBKLi70CSPrc8hbZIWONGR/pAbbsNuF+BAFdKIj8qpgsmkBc3PX4frWawOFO9W5uijmIgtYNPB6J/wOObM+lbV/zgRep61k8VMWsBKrDvGxj04xQEZO6wYXQItXMoKu7A4w/xhSwcNFlhwbMleVRBLHbD2OQGb5W9KkleeZldGUsSWlGn64zwbhuDXL1W7K8sgnh40SSgUAQoMPYW+bn91hv55Z45s7VcK5EAJnMWXhqQIdwIOcwxgPyfYdwNxgiPAdNdpxxS/nFK195CyrHnAncKMLgovw6rKkmPrSY8aKk7j1Cv7qOTg8U85MpOAnfMigU+ac5BXfN7i+yMDahu9oWgOpjmEH/4L4a6Y+LXjnvyluy5B0iBSpzJ0TbztWNte9FpvrlPpYTazSjCvnMHpF/5XziyZvgBg0EI4lo+Zdk8IZn8zT4H3GNp/L1CndX6Y6IMQjFeR15m0i0W4D9LkXNlIoCK1sI7Rp9wRPdsr5ebAxxSi/6h9i1frE3XAziBtjNGH8nGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P+i8ovBcrZvFjXP+/ArLNmsZV4NIIGC2oo0X42J1zlq5gzz0O+YOKtocumDCff8GoBxGWKtaofRVNAIJg4sFg4ePJi8R+FWy6mS1mPJpc2xjXtrL5I2LJzDL5ubYdWH/sx3rUg/IacrPe8bSMomRBy+UjwI7u//exMptZVxuqmaGYpeuTcz6o0q+K7nKwb+wZ3Zejxkv0e86DDvwdWwB74e4l5CRED7t3NKc8sf0hMSOkTmMoVKD0C0geuNIRssEVzrzfZDM1CccgNDZJM8pyJJa72IxlBZUh0gmjDUfLMKQTwOYChXfiwCHrP+01MtFgh8rmtpchcS9Gbt+dl5rscdMpjORHlcplye5eN+GkXQi1nNaEmLGGwtjsWxfwnyNaZZLK/FkLMlC3BgCmY4RgUQaM+KdJb8aXIGTyIyf9HhOYxVEu74rfxbazitoJmOY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:28:19.6840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c5b559-d205-4d78-5ed9-08de7fa45a30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370



On 3/11/2026 12:12 PM, Mathieu Poirier wrote:
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
> The problem here is that zynqmp_r5_free_mbox() is called twice.  At shutdown
> time all drivers go throuth the normal driver shutdown process where
> platform_driver.shutdown() is called and subsequently device management
> callbacks such as zynqmp_r5_cluster_exit().  The same applies to loading and
> unloading of drivers.  Unless there is a corner case I can't see, calling
> zynqmp_r5_free_mbox() twice is not needed.
> 

Hi Mathieu,

I tested this patch again. On my platform I don't see
zynqmp_r5_cluster_exit() being called when issuing `reboot` command.

It only calls platform_driver.shutdown() callback.

I think device management APIs are called only during driver remove
callback, and not shutdown sequence.

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


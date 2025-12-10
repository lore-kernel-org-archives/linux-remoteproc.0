Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012067.outbound.protection.outlook.com [52.101.48.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8C28467C
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765391347; cv=fail; b=QsB0SRSkKVDYrBSZI6WDA2AVcYg6wosKZognD9X3OFElHR4nsJikZs0d/s6WSXco+A8V/cK9tZKwd2DzKONjDf0DMYz9tVYqPpNot7pN9yJZZUTPKMT5yk85wh6fKTtnoLXXjQlgWGd9L+rAHoyRqKp3sK/th5sl+Bf0ZePvcg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765391347; c=relaxed/simple;
	bh=W6ObDzstlyndPRZ3use5uwMAmM4OWNr6/LjcyJbiK3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e2bhIkDKeXzDZ7MXjfrrvXS5l9mbRoPejpkekZ64uIv0nVRMXWmcE8I/34Zwg0Q2bhNykHwwIjKNzbiMJ8jrctMeecy1h792WKd9aPFA7tRxuk/nFrjPcrYt7lz94jGvfJmSWUoXfRGpzyK1ddxWI6HYoHiz9AZxcOgxom8MJf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jID94Ir+; arc=fail smtp.client-ip=52.101.48.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jID94Ir+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gu+CAgkW9DUidgUliT3TiTSC5TqZh/bKs62uLDjdjdnpaB9eL34nTguNlK4tC4v4Ptd1FUlood5JIRu4PH6n+xR0z2YPBvoJdXqOfcn6Wix4LR165j1hP4+EaVW8ok03IaQsaoaoUBNrdCsaKaajy3QDTNsN1DGNHtZ+KerWkR7I6JjB3LPRI5E9KUZLlCzj4JPdtESfe6qpUeGYYnLew29aDyyXsuOYGMK9QuPqrxU0+VBhw4qoJJpddJcfaH4Q2Z5D0ssDB4tuYzz19IR0tnpGyeVguwALy3cHag0KF4wyU+olGBQGfBeFduh55LveQ7qBeNOUiKrA5RgK3FbmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzDkANtQdbVPDxhhEhqA56GxVTP3XzMKi8Y+V+2WpZU=;
 b=ubfRK4ra458ek8y6QkBzWOFcn0n+HY5dJpS6GkC77Ss/wY7i1cMx/YSV4wx4lXL150zBBXHN7dPH2r4eyy54CCSaJNxRm83TXYjCvxXMzt7F79qiEGA1FS1txlV6U2Q3nnB637ZY+tZohHvbrAj0e9/z9dyrVibjQXfu52j+V6PSy59kdw/yQYdtJ8i9BnH/8XG+ZI1HIS0qlxqHgZNYZVSmce9Xl64UK3itmePKh/kp41OUjkSO7EsdntFynlOXihU+PzB/Xsvip44SlTycnsCxCvPFo9S32sAg7Oz7tnGIwGHyixel9TcdPvTC57BUWz3ADKTd4Eiwwh1fxGd/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=mailbox.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzDkANtQdbVPDxhhEhqA56GxVTP3XzMKi8Y+V+2WpZU=;
 b=jID94Ir+hUUwBuRH1th0M454frdt1JFTkkRc/Bdo/UxiY+ESJROOrTyNhZ4L5UmmLymwfjNbG/l9a3gY/J3l/C8tx7aH9W2EAQsea5kqlNJX/9DuHRcLBSiFi1BI1OrcHmqzUPOFUDqYIsMKtLn/v3+OiUs1Wqt+eBkpacHkBTA=
Received: from MW4PR04CA0078.namprd04.prod.outlook.com (2603:10b6:303:6b::23)
 by SA3PR12MB9157.namprd12.prod.outlook.com (2603:10b6:806:39a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 18:28:54 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::60) by MW4PR04CA0078.outlook.office365.com
 (2603:10b6:303:6b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 18:28:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 10 Dec 2025 18:28:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 12:28:52 -0600
Received: from [172.31.132.204] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 10:28:52 -0800
Message-ID: <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>
Date: Wed, 10 Dec 2025 12:28:52 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Stefan Roese <stefan.roese@mailbox.org>, Zhongqiu Han
	<zhongqiu.han@oss.qualcomm.com>, <linux-remoteproc@vger.kernel.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
 <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
 <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|SA3PR12MB9157:EE_
X-MS-Office365-Filtering-Correlation-Id: b8526f90-8aaf-4f66-6020-08de3819f942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmVJc3RsZVNnVmdIeFA5cUJmZlJGZmxnK05TcUc2VUZZOWNzZmw5ZFIwZVp5?=
 =?utf-8?B?RDZ0Z1FuTjJMZGhZSlJyRzEyK3VuM1hlT3dqb0Q3eXNDQnVrQ2FKc3VKTU50?=
 =?utf-8?B?WE85UklwUGx5L3JqNkJNT1FKOGVtYWlqT0txdmZCMzNvSk1ySi84M2Evd0JC?=
 =?utf-8?B?OW84VmJ6VDREMzRPOEYrY2VFZ3A5RmdXTjNDSVRyU2FPYTFoSjJzR2QwQ3Va?=
 =?utf-8?B?azVjdjU1cHp3QTFMMjlEM1IvR0hsN2puMFM5OHh5dlh0bDlzVEFlem1HbkNW?=
 =?utf-8?B?dHB0aC90aUJZcnRCVmVBV3JOOWZxQmFDRGowZk03U2ZENnV3RGVHbXkvRlE0?=
 =?utf-8?B?cVMxTDlnTjNGcTBHZ29IbzlMS0tHVGs2T08xUndodFNnNU9zNUdERnp0S0tv?=
 =?utf-8?B?UHV1L3U0bG5SZ1ViUHNSY3pFa0liMWJUN3I1UDNIeFJHaFlBb1ZhYTN4QjA5?=
 =?utf-8?B?L0NwUEpUckJVSFUwUE9mUFJSMTBwWnpyUlVUcDdad0VDTTZMTE5sQ2tzVWZK?=
 =?utf-8?B?QXorYjQ2WHJMdk40Qnc0TjFFMjQ5NGFxZHhFSUIrRTJydFN2LzUzV3NXeFUy?=
 =?utf-8?B?RHk5eTdoTmxCSWZsWHdnMW1mSXFOdlFJRGhQbEZKeG1UcnV4YXA2UU1kaVFZ?=
 =?utf-8?B?RExpMDJaMmhVNjdncVQ1bDN4NFRGRFVyRU1temxKd1FvTkdnejVzRTEvUkNj?=
 =?utf-8?B?eXgrSHJVWmxEY0k4Q3JBR2hvQ1FJY0pKeGM5NWNldVpWNUwya01hMk0xK1lF?=
 =?utf-8?B?dGx5MUNVVUtrSFFwY2MrU0VDR1lGNDFyV2M5Y3Nmc1hFSXZOeHhUR1NLTFlX?=
 =?utf-8?B?bFA0NjVGVi9yQStPdVFweFJhS0Q4Sm1GcytrNmJtSVVDRWFjYm5rdk9qbEtn?=
 =?utf-8?B?RnlJVElTY3puK3hUdzBqNitOS3FEUEtvbmhhUEFwczhkQVl2aGZERFZ2NEt5?=
 =?utf-8?B?RFNGYmZKQmpCdGJaVEZzUXdPSHNHRzBCWEEzc0hISVh1ckNlaVgzeDlnWmFr?=
 =?utf-8?B?bXQ5UmJCM3Z6L0NVZjVXdVlPeVo2QThhSGtnT1dYMDJuN1BSRGhlRnZzbEx6?=
 =?utf-8?B?ZFJ2ZEdZRmxqME8xWmZFQ2NpVzV4QVFCRDZJTURKTnorQ3hOZkRwOTVUSjhB?=
 =?utf-8?B?eTNocDZVUFRJcVVoN3BLbk1tYjNPeGRad2lsUUdjNmJMRGhNODR3a2lVbERW?=
 =?utf-8?B?YklmcnRmTS8wSXFtblFUNFB2Wk5EenBPZzVyOWtwdzVCZkh4eS9jRFJSWDlY?=
 =?utf-8?B?Rlc2U1l3LzR3dDFBcDQzL3ZqMHJYTlNyYW1jcWc3TGFwKytBbGcrQlc3alc4?=
 =?utf-8?B?Nnl5ay92dDdRbWJhT0xzY01MZzZKdjVwcjF4Z2tMYlMxcWtHb0Q0VlFiM05s?=
 =?utf-8?B?YkpOcDdMbXJkczVIR0htS0loOGZHOUFnWUxlZGxNTTVyWDZiVnh6UjM5UjJ2?=
 =?utf-8?B?UkxqNnl4L0p6NFpMMEZIcWQxOURBemZxeFBDRDg3SXVpemFmbStML1pmU3VK?=
 =?utf-8?B?Y1VUcFpSY251K2lNSmx6RHpjNmFJRUxHT3Bxa0VseTFCQ2tLdUNMcDBzVlhz?=
 =?utf-8?B?dUxnenh4MW5jeXUwMFVqSXl3MVB5dWwyb1JXVWloTngwN05wb2QzRnE2aFR4?=
 =?utf-8?B?Rk9nY1V3OGlJUm0xT0tHdTFuaGIwakpQR3VEei9TenpzQ1BONFVUT3VhcHFv?=
 =?utf-8?B?R2hRejgwMDhEdFdXbnpzcjV3dW1hQjFrSGptVmFBZjBFV2dUeUtlN2wxUjF1?=
 =?utf-8?B?YldkT2lFMzk3RmJGb1ZkMHVxTWpqMmZrNW16UmF5WE1KcmczRVh4M1pKY0tW?=
 =?utf-8?B?eHNXOEkxdytzb2plU0Y4NDZmbjcwaCtaMGlsb1dEeS9zQWt1MWJGQWpFc2p0?=
 =?utf-8?B?bnlPeHdGOW9kaHNkd2pOTDlNcDJQbXM3cTROWmZoVUloZnpsUG1lOEFkMTNL?=
 =?utf-8?B?VDRtNTRyRHpXbnBoRStxQzVYclVFL2VvTnNUdjZ5QzczeVdrdmZwZVBUR0JQ?=
 =?utf-8?B?Y09GL0h1ZDdGZHlTTnIvcHJBYngxbnZ6VklJcG4yeGF0elZweEhjQ0J2cXN4?=
 =?utf-8?Q?tgb+TH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 18:28:53.9082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8526f90-8aaf-4f66-6020-08de3819f942
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9157

Hello, please check my comments below:

On 12/10/25 2:29 AM, Stefan Roese wrote:
> Hi Tanmay,
> 
> On 12/10/25 03:51, Zhongqiu Han wrote:
>> On 12/5/2025 8:06 PM, Stefan Roese wrote:
>>> Hi Tanmay,
>>>
>>> On 12/4/25 17:45, Tanmay Shah wrote:
>>>> Hello,
>>>>
>>>> Thank You for your patch. Please find my comments below.
>>>>
>>>> On 12/4/25 4:40 AM, Stefan Roese wrote:
>>>>> Testing on our ZynqMP platform has shown, that some R5 messages might
>>>>> get dropped under high CPU load. This patch creates a new high-prio
>>>>

This commit text should be fixed. Messages are not dropped by Linux, but 
R5 can't send new messages as rx vq is not processed by Linux.

>>>> Here, I would like to understand what it means by "R5 messages might 
>>>> get dropped"
>>>>
>>>> Even under high CPU load, the messages from R5 are stored in the 
>>>> virtqueues. If Linux doesn't read it, then it is not really lost/ 
>>>> dropped.
>>>>
>>>> Could you please explain your use case in detail and how the testing 
>>>> is conducted?
>>>
>>> Our use-case is, that we send ~4k messages per second from the R5 to
>>> Linux - sometimes even a bit more. Normally these messages are received
>>> okay and no messages are dropped. Sometimes, under "high CPU load"
>>> scenarios it happens, that the R5 has to drop messages, as there is no
>>> free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
>>> from the Linux driver not emptying the RX queue.
>>>

Thanks for the details. Your understanding is correct.

>>> Could you please elaborate on these virtqueues a bit? Especially why no
>>> messages drop should happen because of these virtqueues?
>>
>> AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
>> message has been successfully enqueued. The observed "drop" here appears
>> to be on the R5 side, where the application discards messages when no
>> entry buffer is available.
> 
> Correct.
> 
>> In the long run, while improving the Linux side is recommended,
> 
> Yes, please.
> 
>> it could
>> also be helpful for the R5 side to implement strategies such as an
>> application-level buffer and retry mechanisms.
> 
> We already did this. We've added an additional buffer mechanism to the
> R5, which improved this "message drop situation" a bit. Still it did not
> fix it for all our high message rate situations - still resulting in
> frame drops on the R5 side (the R5 is a bit resource restricted).
> 
> Improving the responsiveness on the Linux side seems to be the best way
> for us to deal with this problem.
> 

I agree to this. However, Just want to understand and cover full picture 
here.

On R5 side, I am assuming open-amp library is used for the RPMsg 
communication.

rpmsg_send() API will end up here: 
https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/rpmsg/rpmsg_virtio.c#L384

Here, if the new buffer is not available, then R5 is supposed to wait 
for 1ms before sending a new message. After 1ms, R5 will try to get 
buffer again, and this continues for 15 seconds. This is the default 
mechanism.

This mechanism is used in your case correctly ?

Alternatively you can register platform specific wait mechanism via this 
callback: 
https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/include/openamp/rpmsg_virtio.h#L42

Few questions for further understanding:

1) As per your use case, 4k per second data transfer rate must be 
maintained all the time? And this is achieved with this patch?

Even after having the high priority queue, if someone wants to achieve 
8k per seconds or 16k per seconds data transfer rate, at some point we 
will hit this issue again.

The reliable solution would be to keep the data transfer rate 
reasonable, and have solid re-try mechanism.

I am okay to take this patch in after addressing comments below but, 
please make sure all above things are r5 side is working as well.

Thanks,
Tanmay


> Thanks,
> Stefan
> 
>>
>>>
>>> Thanks,
>>> Stefan
>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>> workqueue which is now used instead of the default system workqueue.
>>>>> With this change we don't experience these message drops any more.
>>>>>
>>>>> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
>>>>> Cc: Tanmay Shah <tanmay.shah@amd.com>
>>>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> ---
>>>>> v3:
>>>>> - Call cancel_work_sync() before freeing ipi (suggested by Zhongqiu 
>>>>> Han)
>>>>>
>>>>> v2:
>>>>> - Also call destroy_workqueue() in zynqmp_r5_cluster_exit() 
>>>>> (suggested by Zhongqiu Han)
>>>>> - Correct call seq to avoid UAF (suggested by Zhongqiu Han)
>>>>>
>>>>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 23 ++++++++++++++++++++++-
>>>>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/ 
>>>>> remoteproc/xlnx_r5_remoteproc.c
>>>>> index feca6de68da28..308328b0b489f 100644
>>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>> @@ -16,6 +16,7 @@
>>>>>   #include <linux/of_reserved_mem.h>
>>>>>   #include <linux/platform_device.h>
>>>>>   #include <linux/remoteproc.h>
>>>>> +#include <linux/workqueue.h>
>>>>>   #include "remoteproc_internal.h"
>>>>> @@ -116,6 +117,7 @@ struct zynqmp_r5_cluster {
>>>>>       enum  zynqmp_r5_cluster_mode mode;
>>>>>       int core_count;
>>>>>       struct zynqmp_r5_core **r5_cores;
>>>>> +    struct workqueue_struct *workqueue;
>>>>>   };
>>>>>   /**
>>>>> @@ -174,10 +176,18 @@ static void handle_event_notified(struct 
>>>>> work_struct *work)
>>>>>   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>>>   {
>>>>>       struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>>>>> +    struct zynqmp_r5_cluster *cluster;
>>>>>       struct mbox_info *ipi;
>>>>> +    struct device *dev;
>>>>>       size_t len;
>>>>>       ipi = container_of(cl, struct mbox_info, mbox_cl);
>>>>> +    dev = ipi->r5_core->dev;
>>>>> +    cluster = dev_get_drvdata(dev->parent);
>>>>> +    if (!cluster) {
>>>>> +        dev_err(dev->parent, "Invalid driver data\n");
>>>>> +        return;
>>>>> +    }
>>>>>       /* copy data from ipi buffer to r5_core */
>>>>>       ipi_msg = (struct zynqmp_ipi_message *)msg;
>>>>> @@ -195,7 +205,7 @@ static void zynqmp_r5_mb_rx_cb(struct 
>>>>> mbox_client *cl, void *msg)
>>>>>       if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>>>>           dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>>>>> -    schedule_work(&ipi->mbox_work);
>>>>> +    queue_work(cluster->workqueue, &ipi->mbox_work);
>>>>>   }
>>>>>   /**
>>>>> @@ -1154,6 +1164,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>>>>       for (i = 0; i < cluster->core_count; i++) {
>>>>>           r5_core = cluster->r5_cores[i];
>>>>> +        cancel_work_sync(&r5_core->ipi->mbox_work);

I see merge-conflict on top of the for-next branch. Please rebase the 
patch on top of the for-next branch: 
https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=for-next


>>>>>           zynqmp_r5_free_mbox(r5_core->ipi);
>>>>>           of_reserved_mem_device_release(r5_core->dev);
>>>>>           put_device(r5_core->dev);
>>>>> @@ -1162,6 +1173,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>>>>       }
>>>>>       kfree(cluster->r5_cores);
>>>>> +    destroy_workqueue(cluster->workqueue);
>>>>>       kfree(cluster);
>>>>>       platform_set_drvdata(pdev, NULL);
>>>>>   }
>>>>> @@ -1194,11 +1206,20 @@ static int 
>>>>> zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
>>>>>           return ret;
>>>>>       }
>>>>> +    cluster->workqueue = alloc_workqueue(dev_name(dev),
>>>>> +                         WQ_UNBOUND | WQ_HIGHPRI, 0);
>>>>> +    if (!cluster->workqueue) {
>>>>> +        dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
>>>>> +        kfree(cluster);
>>>>> +        return -ENOMEM;
>>>>> +    }
>>>>> +

Workqueue will be unused if mbox properties are not mentioned in the 
device-tree. So, we need to allocate workqueue only if IPI is setup for 
at least one core. I think following logic should work:

Make decision if workqueue is needed or not, if zynqmp_r5_setup_mbox() 
function is passing for atleast one core. If zynqmp_r5_setup_mbox() is 
success, then set a flag to allocate workqueue, and then later right 
before calling zynqmp_r5_core_init() allocate the workqueue for the cluster.

Remoteproc can be used only to load() and start() stop() fw, and RPMsg 
can be optional.

Also, before calling destroy_workqueue make sure to have NULL check and 
destroy only if it was allocated.

Thanks,
Tanmay

>>>>>       /* wire in so each core can be cleaned up at driver remove */
>>>>>       platform_set_drvdata(pdev, cluster);
>>>>>       ret = zynqmp_r5_cluster_init(cluster);
>>>>>       if (ret) {
>>>>> +        destroy_workqueue(cluster->workqueue);
>>>>>           kfree(cluster);
>>>>>           platform_set_drvdata(pdev, NULL);
>>>>>           dev_err_probe(dev, ret, "Invalid r5f subsystem device 
>>>>> tree\n");
>>>>
>>>
>>
>>
> 


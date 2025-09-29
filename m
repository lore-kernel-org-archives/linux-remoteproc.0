Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012068.outbound.protection.outlook.com [40.107.200.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7522224AFA;
	Mon, 29 Sep 2025 19:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759174531; cv=fail; b=Wc8DNBT/jcA+gnS9B4/TB/8pSZXNPcQGCYSzLyDvIuhkrr2jg4OtCk7YHdMRIHMGe04IpSzY24bOuXvm79bazAZoFJccH6DhBUfs1Pwz/M5ESlNgb06PBdBEY/Dur/7KLGg5wwMRKxgoT3jy78caxJFIbw/fSSj2krykS09SYZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759174531; c=relaxed/simple;
	bh=db+7af/LA6tmsPMZdPGpFLZ5NUYYusb252VdUOSYQ+4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=qG2F87R0E2DlJA3H+gpZK3oxopNjke4/jGawbohRXQnJ3WpUaLESov1m02E2eqoclbM/DS46KqHzffCvjeel4wgupJV8ilKpP9p/wZJcO5asaDt2JETyvBCe67ZpD4Za4LpcvdUVTD2utahUHSDSKQWOr7tP+9HDUTqvg/mFJwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a+AU7DVe; arc=fail smtp.client-ip=40.107.200.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a+AU7DVe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGHsma+c/j1JODHS9fAT8CgJKmAiINfJ4EeV70YYLfU3Dc/tvMqa6SpHgH1ETXx/apiB510AuPCTwBiOfUaMsl4LZbm9EVkHRqw+YYyXPWNAvGaVTm2DfJ5HgRBMhuqply8qqsF6g/YDwp98ihuljPjybQD5HU3zxvsSruzQsCSX4F9EM8YdJ5J0gNIrbF48VVtCI9liJZSjWuXdXoFUlIfZsVDRNrODjtCUWAT245rARaxmYJwXgcp//s+QIQabrRu6S6V1D2TNF4iyRbaq3atcXQGTArKePKyjCNGubwFpMx0R0GoxJ4401bpISMdODUztUA9w81xywjaupJRMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEDTtLvnSaZ9AEXtlj763DtbhaQ//S6+jMx4pKqEbZ4=;
 b=sOgG5KcPS6S32u7qtZ11HXtj1kCFWzzJ08x1UL+LyDwE6+IgVVnjZeuc2XCtmfRWaVqQsi5eVNrPdYozTvDCRTwrsSjmJYHn+TL9VV7RDL+Paoovg/DDJVIBrVe1Ebo/aZIeoYeAskDZ4w/bq4IUJuDceU2iYyPqO6/iwMV8LHM98Z9GJ7WkKtvzwhVEWWNbKBRVPPGYdIK5x8QzqGCq5dEQ8vGd81/cwx8P63lw0Rgp98oDvmD/EBtF9ge6PxAlA1SzMh9vi/2u8zSeElhWN5Vz5UeuxzS7G48VzNdRfZ4V+9/r53GbKr6QSQsiXEU4R0MIlr+Ip6WtN/xXMO9dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEDTtLvnSaZ9AEXtlj763DtbhaQ//S6+jMx4pKqEbZ4=;
 b=a+AU7DVeKlNhJOZKIJd247/mke5Bn2U01Is4XLOKJMgvZ0yosEyyG58BZDH1R0rjD2A0u/3bkzSgelD9bzi6O2wF08j8EqyFuQKy2Gjph0gBmhQn8xNg9p6dX6jYl6lfvBjGfHFaW0+iYU/nGZ7gsa+gky/tilO5TcgKVz8T804=
Received: from BLAPR03CA0091.namprd03.prod.outlook.com (2603:10b6:208:32a::6)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 19:35:26 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:208:32a:cafe::95) by BLAPR03CA0091.outlook.office365.com
 (2603:10b6:208:32a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.15 via Frontend Transport; Mon,
 29 Sep 2025 19:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.1 via Frontend Transport; Mon, 29 Sep 2025 19:35:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 12:35:25 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 12:35:24 -0700
Message-ID: <09b6bf14-752d-45b2-9cbb-f64f7b6703ee@amd.com>
Date: Mon, 29 Sep 2025 14:35:24 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
From: Tanmay Shah <tanmay.shah@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Peng Fan
	<peng.fan@oss.nxp.com>
CC: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20250925185043.3013388-1-tanmay.shah@amd.com>
 <20250926073735.GD8204@nxa18884-linux.ap.freescale.net>
 <e93f0ee7-687a-4f47-a847-90cc1ea87290@amd.com>
 <20250928075641.GA29690@nxa18884-linux.ap.freescale.net>
 <aNqbc5Q_tVStXkhI@p14s> <8cb065f6-eee3-49f4-b657-1f4c74f1b324@amd.com>
Content-Language: en-US
In-Reply-To: <8cb065f6-eee3-49f4-b657-1f4c74f1b324@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|MN2PR12MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: 1401ece3-c7ba-4192-8e30-08ddff8f56db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFh3T3k2bzRPcWZZL0ZSU2FHd0svU1ZJKzV2bmc3dFlReFFGRWlsZVZHdVk4?=
 =?utf-8?B?djgxK3VtcHh0c0hiMW5hV2h3cVFoWkUwUjZEcmNUMXphUkNNekZYQ3IwVEta?=
 =?utf-8?B?bnI5MkxSL3FQakN5V2dFUFRxRHVhWE5Qc2pqVHM0NUtkb0prdVp0NVZiWXpr?=
 =?utf-8?B?UlMydk5mQ2g4VXNPQ2l3OENaL3Q4eVRJTTRSSnhiS3IzL0tIY21OK0tYVEZw?=
 =?utf-8?B?SjdGbWtCeFhoTkZXc1hjVVR0ZXB4cCtKUVZyMXcvSDJ4R1FGV1ppSStXcWd3?=
 =?utf-8?B?bXFpSENTOExZdjY1b2ZENGZ3Z0FzM0lNNk9oTDVTSEYvcVNvcTVYS0h4MUpj?=
 =?utf-8?B?SVYrOVNDYmF0dVFNOWNnOVIzTkdMcWZqaWZzYm1saTZIM1V3SExCZmJ2Q0R2?=
 =?utf-8?B?TG5OaHdkZVU2QVdVUGFXemk0bC93WndmenN1bW4rNXZjY1kxVWw4ZlRNTm1v?=
 =?utf-8?B?YTJqK0NRZE9sblB3WEIvc01oTmZtY1BhbEEzckk1QnpHd3ZCMUhqa01zaThE?=
 =?utf-8?B?U21QYno5a1lPMWFsTE9IR3FUYis3azFJV1hwcmVvbzdBVS9Ia2t0dmhuVEVK?=
 =?utf-8?B?UWZnTy93OHRWeTcycHRHczhRVm1CVmtvL2FzS3RFeHJyNW9Zck5lbER2TzNP?=
 =?utf-8?B?KzN2ZVNDM25GaTBYV3h3cUQ4TDFxYTZuOWVucUsvNXVvWllaSnhwS2FtUHVn?=
 =?utf-8?B?UjBPZGtUWEVjQmZCSk1rcWQvZG1GRU1rN2l4T2g5NEk1dDFGTmFjR015VkR5?=
 =?utf-8?B?ejkxVGJOZFVOS0FyRHc2amY4OTJOazJ2VGFpbnVicEZoTXkrQzh3TnFuVXlO?=
 =?utf-8?B?SWR4Z0IrRi8va0Z5MzFkQmJsZU80MGMzWjNVc0hTcWY4VjhWczlSU1U2eS9Q?=
 =?utf-8?B?THVzQXhIcDU3N1dYbmpKRU1ENmJ4UlJQNnNsVUxkN0NhSHdiY1RKaGt4RGs4?=
 =?utf-8?B?b3kzcFp5WDc0YnlSZVR3UytsVHNhU0pOSFBmUUlWQTQ1TE9WTklTTStqNU10?=
 =?utf-8?B?SWYzalkySEVwbU92UEo5Zkc5YTY3d0RnYUdtLzhKeXZzMkFValZ1RVVZdHNJ?=
 =?utf-8?B?Q3BhS2lVNkUxTExQNmhnbkNRN0sraEd2bXpkL0NSV1FaalFIcmxhSHdxR0FN?=
 =?utf-8?B?YUJkMnJaVWtVUXNwK2lxaEg3TnYwSVkyYUlHRDJjdU5vc3doMXdRV0xIdEdr?=
 =?utf-8?B?RHdoZWhwYkhpWFllUVRlbEZ4dXJ6VnIydlQvM2psNmNTb0N1RlptQmIzVlBT?=
 =?utf-8?B?d2ZPdko4UjA1OGI4cm9CN091U2M3R2FzUnB0ZUpYRXA3VGhKejZ1cTRYb1VR?=
 =?utf-8?B?UVM1MTFHM3ZZd1h4L2tvMVAxQm5KMm0xZXNMQ09aM0IzN2VPRmY3aTQrQXcr?=
 =?utf-8?B?VkVMMXB6RlV2SW5pYnp1NEZlcFJUVUV2Yk4yZmZnSzhoWHZVTXBuc1paeGJO?=
 =?utf-8?B?ZXRuendBSWZJbmVIQThVVjhjWWh3bG9vRVJxSmJoY04rN29qMHZkUjYzTDJU?=
 =?utf-8?B?WU9PVmJPMndIOWFkdHZSckVTdVBhOGlzQzZyMTY0WWhRbkZNV0dWU204bXpq?=
 =?utf-8?B?ZmpvcG1haU9ldlNMbmFuU1lid2M1d3NkTjB5UklyRWI3OUllTUxWNlJyaXh6?=
 =?utf-8?B?RXI5cHdMRFVtYytFOGVROUJxOG5BS3ZMRklyMVlvRTNpcUpWYnlTU3hMSGxN?=
 =?utf-8?B?Z25vajhucmswQlE1SnhWd25RbDBlTHRZU08xTFZma2xJWkR2ZEVaRWVaQUJt?=
 =?utf-8?B?VGk3VnNQM3pTaHlwQ25HM1l5V09FbVFrTlRuWmc5T21ZWi9VcG5MT05hSnNN?=
 =?utf-8?B?QnpqWmR5SmVQTVZCZjJjRzAyMlpSNjI4Q25sa3dCeVRjVlptVHJnd0VjVnU3?=
 =?utf-8?B?SzFJUGRjRSt2dXhBRkFrbCt4Zk1RY2RXOUdwZlRYYXBIcmh2MC80S1c3aDNk?=
 =?utf-8?B?M0FZbGp5Qy9jUDJCaWlxZUt6VnAxazlvd0pRVktLS2hzMEdkUTNBUk16eHE4?=
 =?utf-8?B?MWNabUQ5TDJGcnBQUzRJL3Z5eklrRElDOFZoWXA4K0Zoa0JkUWhyTnJUVE1G?=
 =?utf-8?Q?JlSM4Z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:35:25.8691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1401ece3-c7ba-4192-8e30-08ddff8f56db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222



On 9/29/25 2:26 PM, Tanmay Shah wrote:
> 
> 
> On 9/29/25 9:45 AM, Mathieu Poirier wrote:
>> On Sun, Sep 28, 2025 at 03:56:41PM +0800, Peng Fan wrote:
>>> Hi,
>>>
>>> On Fri, Sep 26, 2025 at 10:40:09AM -0500, Tanmay Shah wrote:
>>>>>> ---
>>>>>> drivers/mailbox/mailbox.c               | 24 ++++++++++++++++++++++++
>>>>>> drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
>>>>>> include/linux/mailbox_client.h          |  1 +
>>>>>
>>>>> The mailbox and remoteproc should be separated.
>>>>>
>>>>

[...]

> 
>>>>
>>>>>
>>>>>> +    res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
>>
>> Please have a look at this condition again - the implementation of
>> addr_to_rbuf() [1] is checking for space differently.
>>
>> [1]. https://elixir.bootlin.com/linux/v6.17/source/drivers/mailbox/ 
>> mailbox.c#L32
>>

Here Ack as well. I think it should be same as what's there in add_to_rbuf.

>>>>>> +    spin_unlock_irqrestore(&chan->lock, flags);
>>>>>> +
>>>>>> +    return res;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(mbox_queue_full);
>>>>>
>>>>> add_to_rbuf is able to return ENOBUFS when call mbox_send_message.
>>>>> Does checking mbox_send_message return value works for you?
>>>>>
>>>>
>>>> That is the problem. mbox_send_message uses add_to_rbuf and fails. 
>>>> But during
>>>> failure, it prints warning message:
>>>>
>>>> dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
>>>>
>>>> In some cases there are lot of such messages on terminal. Functionally
>>>> nothing is wrong and everything is working but user keeps getting false
>>>> positive warning about increasing mbox tx queue length. That is why 
>>>> we need
>>>> API to check if mbox queue length is full or not before doing
>>>> mbox_send_message. Not all clients need to use it, but some cane 
>>>> make use of
>>>> it.
>>>
>>> I think check whether mbox_send_message returns -ENOBUFS or not should
>>> work for you. If the "Try increasing MBOX_TX_QUEUE_LEN" message
>>> bothers you, it could be update to dev_dbg per my understanding.
>>>
>>
>> This new API is trying to avoid calling mbox_send_message(), no 
>> checking if it
>> succeeded or not.  Moving dev_err() nto dev_dbg() is also the wrong 
>> approach.
>>
> 
> Correct.
> 
>>> Regards,
>>> Peng
>>>
>>>>
>>>>
>>>>>> +
>>>>>> /**
>>>>>>    * mbox_send_message -    For client to submit a message to be
>>>>>>    *                sent to the remote.
>>>>>
>>>>> Regards
>>>>> Peng
>>>>
> 
> 


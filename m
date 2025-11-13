Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B482580F3;
	Thu, 13 Nov 2025 21:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068936; cv=fail; b=RXBzGRBbiwwHv9gTYPTqqsPSxWylb/QI5fF8acUAh77L+tlV+0zqRyDF3PBR74bF9kV44kfW/RF4KrjNMYv7bShq2PENFC2t4x5P7cNKKVS2P4DD4dCI/oKtxuNEiJ+Gus1ReKhL31b2PfBxa7f8yrNKkQ1sxsXmWXoe885ZXCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068936; c=relaxed/simple;
	bh=AuBl9slciZsQ1n5/UGmbJ/YO9J+ko37Q6/6E10Cai0M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Xm3Xbs24+vhzT1CnpaPA9sgVnCLxCOWRHp+zZRxnqhbKBVRe1sff8ezNTpfrcO+IdHnzH6mRkkxNANuJFvFWTeJ47oo4+Hqwbo3ByL7my0DoUo5Cwg+7S7S8VWMkvBPj8XzCc/BfrB93hDqxwCy3ygWaX5kaLtMhgQGESMMf+ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NFLW4Vh+; arc=fail smtp.client-ip=52.101.193.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NFLW4Vh+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ls+m1NEpyVPnwJD3bduWFZ7ATzqfKMxJNZDbKM6JfIj2MrVQQ7kvf6EmJF+Mh87Atul/+831f96V7kp3WzxEmSdkU98Jg8/8akyVWC2dNvqef4xv4Y1/wgrMmTJXFalR/cw9AD6cSO2BNaSVQcMmTrl7kpSJlA39/tVQr4Ry2YK71CCt2AvBLxm4O6RJit7yfdjnKjttV18OOM/v0wXeBQQKHjKk3vrW0US6cuSW+Kbxg16mhsj1xP2WE8n3/o0h1utSg8Om2/mIXSlVS3XPQ0Gsbir3D4msm6lIF22XFmqbFh1wSWC9ev4Q8M8qppiCkv4qQIZ3bzzPAjTzQMZuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoNfeF+UBZO89SAUaa5BcJlGImi70LwwENhKhYA1EQs=;
 b=jHwLwtmWJHQe7/8y4l9c7AGMy78k/6qXRBURHjvvIiIhOPRo8Otx+57MTPxPMsLzSKM5ctHBav9LKRuMOqaMu11nNxldcx2E7r8oHxOh5uYR03xSnxOcCdgKpBvn+6StrhyHS0u4jnh8vAkhN9WUvBBbb82uGbTscYaTziGAZp0Daq4RV6td6LDDozesRY1zVA+QvToYWFmb5eeObcejQodhVvbxb6UxOGKu1m1I5H0RMe3Ru0/8b6zkyH1x53fxYP8JkaoN6eCds+tv+wKoo6FB3uqTD7CDgIg5OKe3FuHpwtJoSFt6XzzAmd9ETR9uNm4xCcFP5jWveH1PVO3nlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoNfeF+UBZO89SAUaa5BcJlGImi70LwwENhKhYA1EQs=;
 b=NFLW4Vh+kcs2O4hpobWU0W0oiu2H3KKi50YEPtZ690aCZqm5Sc+JgLEWDl4hwbNDZx7aBY/TnV/yfVLrMltFCUPs3OwnLfcYvtNtiJQ5GIMCruoPOELScbVS1YVxeMj18Uz95fHGwlha7nbn9t937TTVa50LkOimAAVeuw7MBZE=
Received: from SA9PR13CA0064.namprd13.prod.outlook.com (2603:10b6:806:23::9)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 21:22:12 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::c8) by SA9PR13CA0064.outlook.office365.com
 (2603:10b6:806:23::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Thu,
 13 Nov 2025 21:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 21:22:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 13:22:02 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 13:22:01 -0800
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 13 Nov 2025 13:22:01 -0800
Message-ID: <6691892e-dc55-49bc-9c86-eac12756d681@amd.com>
Date: Thu, 13 Nov 2025 15:22:00 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 1/2] mailbox: check mailbox queue is full or not
From: Tanmay Shah <tanmay.shah@amd.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20251007151828.1527105-1-tanmay.shah@amd.com>
 <20251007151828.1527105-2-tanmay.shah@amd.com>
 <CABb+yY0m_Whm1F7d2ub+vhn0eTb47UC9g=JvpLnWh-2E1oo52A@mail.gmail.com>
 <aa1ff206-d505-433b-9715-56d866a5f675@amd.com>
 <33edad1d-08b9-4fe4-8525-a1f50a898e2f@amd.com>
Content-Language: en-US
In-Reply-To: <33edad1d-08b9-4fe4-8525-a1f50a898e2f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 3edf3e56-81ac-4cd5-c23e-08de22fab58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2thSWNoY011VHJSYURXWVBPVDhpU0tncHZQQzVQQzAxekFXN1dLZzhpdnBP?=
 =?utf-8?B?VjJGMW40U2VzdDB6NnIrMjNJc1M1Unc4Tmo0Um5CdXVQbFV3RmJaTytkcmRz?=
 =?utf-8?B?S3BRTHdsQUE1QW5SeGJwZjUvWTlKV09kUm9BZmJQVkY2QkVwWVVJeDlGUHg2?=
 =?utf-8?B?UlBpTkgyT1JDTDFzSHR6bmdhSVJyRm9vQXlubnhBK2RhdnprcHVCTDN0a0to?=
 =?utf-8?B?bDdUcENjUVJzZlU1a3FtSXV3TzBLT1BpTnF4N2JDMTYrL2grUk9mMjQ1U1Mw?=
 =?utf-8?B?ZXFQMHVReUQ0Rnc2MXRUSk5MRlhIcjMvV2R1Uy9YZktKTGtkaHFGRGk0L01S?=
 =?utf-8?B?ZzFDSkZNY2Izc20xMUhoZnFtMXRlRWY5amptakdQTUVOMkVscG53MGczK25O?=
 =?utf-8?B?SWdXZXF1cUw3ZjVPS211anp0UCtyYkpxNDI1WUlvaG54MXpvMUhqTTc5bitn?=
 =?utf-8?B?OVNzSWw1d1YrNi9ERXB6TFJlUmJ4SVZGVVF1T2RTRCtJNzIzT0l2TnZHd0dh?=
 =?utf-8?B?WWpremZ3bnJhR1p4TWluUUtCazFJY1JoYmNGbm5wbVFic2tWNGt1QTdlSWxK?=
 =?utf-8?B?cVMvc043WFI3SVBqYUpCbzlYUmw3RGI5MW9QUlNHS0Jmb0Y3N0N4UlhCbkp4?=
 =?utf-8?B?MTQ4a0dPbWY1Q0JTVm11Y29XVWcvcGU5L3VydFU5dWtIbFVyNi8reUlYMFJn?=
 =?utf-8?B?bmRydXhqRlZJZnNwM3hCdkJWS25rQ1FCdjVUV2VXeFpOYVA5WUVBTTVUWTFX?=
 =?utf-8?B?ZHNkUzZYOXVLOEJVVE96KzU1STkzSU9QZHlyMk50VGJpWVZaeWFrNE94bjgy?=
 =?utf-8?B?QVhOdHRWb0NhU0tkalV5djVhYzVuNE1YMkJOTG9HU1BVNktYVTY2Y2xhNnht?=
 =?utf-8?B?ei8zcmloQVVhZk1lYTI1UTBVSE9jMVJ5UG5mSVRiUmR5dklBZUtpRDBpTVdy?=
 =?utf-8?B?T0NCK0crV0JlNndGUnM4TFVmbnRSZFAvb2FzMmowVlFKQkM5b2d3ckoxdXpr?=
 =?utf-8?B?dlVhOS92RU9ORjk4ck91MGhkYnhxaHgyZ0htWE1lYlhKTm1TeWovellDdG5l?=
 =?utf-8?B?ckJoY3ltUTlKRW91QnRzOXU4YTR2MVI4dmxheVNsOW1FREpYeUFaTHd6RlQx?=
 =?utf-8?B?QXR2aDQvUElRblJsNzF5N3hSTnd2RzhVaS9yN1pqYUg4YWxPV3BXNjVEUnVN?=
 =?utf-8?B?bDZRdmVkNEZmQkNxM0lLYzZIblFkU3dWRFpGUEE0clRRTWdIYWxUa1B4cUEz?=
 =?utf-8?B?akVPT1I5ekVSdzgwekg4TGl6cWJqN1I4dkU3MHVzdUNWV1VXTmhpQnZRczJ1?=
 =?utf-8?B?STgzN3JXdll6UEZSL1c0WGsyMGYrSWI5ZTMvc2p6WHBzemQzWHBkeGxaOVhz?=
 =?utf-8?B?VnRqaWRnWG5UcENNTFhCbzJRY3FzaHBkbkFvbmEzM2dCQ0tPU0hJYjdEM1N4?=
 =?utf-8?B?bE9xRWoyTHlOZUxhS0Frd05LOW1LZEZXUTVyZmUwOHVEalFJd01sdmhqUHl5?=
 =?utf-8?B?enUzUFo0cGZXOEEzclZ4aWUvTkNkUTNubE90ZVhHdVpSMFFPN1dqREp6NDM5?=
 =?utf-8?B?V0Q3VHJUQlpyaXBVOFV5WkNUdnBIMUZtL25hL2FrRHZEeU5YNy9UTVVtMmY4?=
 =?utf-8?B?ckV5T0FxSnNWc2gvcThIQUtWREVvUnFkS0dwVFRHMDQ2NXZ0cnRKMXVjKzRw?=
 =?utf-8?B?RDhLK0s2Z2tQQXZoSzJlNmIvU0s3SnRwK2FlYUlFRHF4THRpMTNJRWpuOEVl?=
 =?utf-8?B?dGN6OVBuSEUwaTc3OUx4Zk1qUlFWTy9QQ0lYTkZGOHVZSlg5RlRsRmxWVHdo?=
 =?utf-8?B?Z3I2VXFOc0MxOFVqbmdEdkVNQ0xsbXc0dDRQOHg5VWxjTDFodDE2V1pnT0xR?=
 =?utf-8?B?LzRsVG1hZEJGTUVJSkZDU1VUVDVDbWIvQVpPbjZuNHFBUXBmQk5UMno4ajUy?=
 =?utf-8?B?ckswL2p5TjVEbVM0NXZPOEVsb2k5YUZaZGZ0aDdXbWVDempoejE2aUYwdVMw?=
 =?utf-8?B?MTlCcW4yTkdzZXYxUmJZWUx6WWNvdHNKbjhZTkZ0UktiT0JGdTBsR1Y2WURI?=
 =?utf-8?Q?+oz+Ov?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 21:22:11.5577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edf3e56-81ac-4cd5-c23e-08de22fab58c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270



On 10/15/25 10:26 AM, Tanmay Shah wrote:
> 
> 
> On 10/8/25 11:49 AM, Tanmay Shah wrote:
>>
>>
>> On 10/7/25 2:58 PM, Jassi Brar wrote:
>>> On Tue, Oct 7, 2025 at 10:19 AM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>>>
>>>> Sometimes clients need to know if mailbox queue is full or not before
>>>> posting new message via mailbox. If mailbox queue is full clients can
>>>> choose not to post new message. This doesn't mean current queue length
>>>> should be increased, but clients may want to wait till previous Tx is
>>>> done. Introduce variable per channel to track available msg slots.
>>>> Clients can check this variable and decide not to send new message if
>>>> it is 0. This  can help avoid false positive warning from mailbox
>>>> framework "Try increasing MBOX_TX_QUEUE_LEN".
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>
>>>> v2:
>>>>    - Separate patch for remoteproc subsystem.
>>>>    - Change design and introduce msg_slot_ro field for each channel
>>>>      instead of API. Clients can use this variable directly.
>>>>    - Remove mbox_queue_full API
>>>>
>>>>   drivers/mailbox/mailbox.c          | 3 +++
>>>>   include/linux/mailbox_controller.h | 2 ++
>>>>   2 files changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>>>> index 5cd8ae222073..c2e187aa5d22 100644
>>>> --- a/drivers/mailbox/mailbox.c
>>>> +++ b/drivers/mailbox/mailbox.c
>>>> @@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, 
>>>> void *mssg)
>>>>          idx = chan->msg_free;
>>>>          chan->msg_data[idx] = mssg;
>>>>          chan->msg_count++;
>>>> +       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
>>>>
>>>>          if (idx == MBOX_TX_QUEUE_LEN - 1)
>>>>                  chan->msg_free = 0;
>>>> @@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
>>>>                  if (!err) {
>>>>                          chan->active_req = data;
>>>>                          chan->msg_count--;
>>>> +                       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - 
>>>> chan->msg_count);
>>>>
>>> No, I had suggested adding this info in client structure.
>>> There is no point in carrying msg_count and msg_slot_ro in mbox_chan.
>>> The client needs this info but can/should not access the chan internals.
>>>
>>
>> Hi Jassi,
>>
>> If I move msg_slot_ro to mbox_client that means, each channel needs 
>> its own client structure. But it is possible to map single client to 
>> multiple channels.
>>
>> How about if I rename msg_slot_ro to msg_slot_tx_ro -> that says this 
>> field should be used only for "tx" channel.
>>
>> Or is it must to map unique client data structure to each channel? If 
>> so, can I update mbox_client structure documentation ?
>>
> 
> Hi Jassi,
> 
> I looked into this further. Looks like it's not possible to introduce 
> msg_slot_ro in the client data structure as of today. Because multiple 
> drivers are sharing same client for "tx" and "rx" both channels. 
> [references: 1, 2, 3]
> 
> so, msg_slot_ro won't be calculated correctly I believe.
> 
> I can change architecture for xlnx driver i.e. assign separate clients 
> for each channel, but still it won't work for other platforms. Please 
> let me know how to proceed further.
> 
> Can we provide API that does (MBOX_TX_QUEUE_LEN - chan->msg_count) == 0?
> 
> I am not sure if I should attempt to change the architecture of other 
> platform's drivers.
> 
> 
> References:
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/ 
> linux.git/tree/drivers/remoteproc/imx_rproc.c?h=for-next#n768
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/ 
> linux.git/tree/drivers/remoteproc/xlnx_r5_remoteproc.c?h=for-next#n280
> 
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/ 
> linux.git/tree/drivers/remoteproc/st_remoteproc.c?h=for-next#n386
> 
> Thank you.
> 
> 

Hello Jassi,

Gentle reminder on this matter. I am waiting for your input on above.

Thank You,
Tanmay

>> Thanks,
>> Tanmay.
>>
>>> thanks
>>> jassi
>>
> 
> 


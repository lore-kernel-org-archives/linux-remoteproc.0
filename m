Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7AB1FF1AD;
	Wed,  8 Oct 2025 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759938961; cv=fail; b=A6+F2tXkqjulCn8dnHeXcs7pq5E2nz8n8vqr3umjIhCF4WKFQrI4PIJB/O09NdrJMk5XcJ51kMjKsgMCBGXGCaUx8tMtagTRp9HPXf+3h4OiOnbaK9g/gRliqvzYFutpJXNu94PmNhzI+hb9e6/E5+2khUuBeKVnR1o9PRhWcJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759938961; c=relaxed/simple;
	bh=0bEjxj0l3jsFynVn06M3sJsgngl9GzhsKmSDCDd6VEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MbmCGt1+umgvqlLnkCxjvp0AOhF2qiE9Ys9tiPwVazsd6JR6h+laIVo5sIrfvRIxFN/AGHYeOMCVDVSkNrZWDZo93FrMCEjADDxhxZJrLKZTB2tZZeczRTGG4eL0sXGkmCywrU4wqRPw6GSoH8u/XZ++OsxmJPZ32QHz7L0EdvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VcHF921T; arc=fail smtp.client-ip=52.101.61.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VcHF921T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEorFwCvBEkVcJRpmx9YH96nJSNcHDMWUMg6M5DNYGArGdOAIiARP+mFwvmFrxINmCTRqyUmVk+KCTx5BCxuPxGtiB0CLjCUaCZCkX+QGEiDUTUi0/Nn99LB2LRDtnn8X3hDnBc5IzWnwrg8PQDGTJQexkVap22+p7okOnWyN8Xa5VlrzA76JPrDSfU2UO0wj+aVOGHAXP6v6ttdDN3S49h7dQLC3PlmQDt80OA+9amhz5uRjvUFcM6tS15FgwJ7FXV2OsaSgDYLjzpzJSK8uS7zwICtnGpG+AUnd92FpXmHnoEkTgNlIyNJH+ks4skfHOvXWfvQrrFihJXyb10BcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PvVw3jduBSJoTQBvS1pGLga7wepmG79uX9d75F53NA=;
 b=CfFF79J5WkwYrv0EDotvdEcSmoNmq8y/13vLTIcA5Spj2MgbzBqy5FHUEdhAuKsDty37kbZG+ME+W0UiDehNyvhO9/joEgK/rkkBhJqStMqXdOSfLcApN/nHk86tQWRwzoG30+gJesU4iyUXHLEX9qTrVfu7MtmJVclzqHq84M2FEBRFG3JAZIOiAUeHDGr9QG0+hsN+be3ca0irKSBco4PShsTr+LhzjroeS0Rmh0R3ES74OB0fuRBqoQ79poY7gft6H7GMSbQVg55zJ/sNWk9Ppva3kyk2Y5epla5XaKnA3rqbWQvcVmOHBZATaNnDNXgjlxA0B/XFSNY8DIFqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PvVw3jduBSJoTQBvS1pGLga7wepmG79uX9d75F53NA=;
 b=VcHF921TarLtA7e9vC0tithR9/WWEEHqXk41IcC3iMGI/uOGTctA7IDZucdbt12u8CoavKqiGjoA6GBdz4aTDd3aR441QpBWqV+I/g79lZZgB1YLdjqx7gP4vzxNsspm9MXnz6kS+H2HFCAxst1c0CgfD/kxNDlqeqF7Kry7xyk=
Received: from CH2PR20CA0011.namprd20.prod.outlook.com (2603:10b6:610:58::21)
 by DM4PR12MB7671.namprd12.prod.outlook.com (2603:10b6:8:104::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 15:55:57 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::40) by CH2PR20CA0011.outlook.office365.com
 (2603:10b6:610:58::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Wed, 8
 Oct 2025 15:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 15:55:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Oct
 2025 08:55:56 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Oct 2025 08:55:56 -0700
Message-ID: <a5b03f04-9add-4adc-abe8-95024d05b9b9@amd.com>
Date: Wed, 8 Oct 2025 10:55:56 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 1/2] mailbox: check mailbox queue is full or not
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20251007151828.1527105-1-tanmay.shah@amd.com>
 <20251007151828.1527105-2-tanmay.shah@amd.com>
 <CABb+yY0m_Whm1F7d2ub+vhn0eTb47UC9g=JvpLnWh-2E1oo52A@mail.gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CABb+yY0m_Whm1F7d2ub+vhn0eTb47UC9g=JvpLnWh-2E1oo52A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DM4PR12MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fcbfaae-daff-4d5f-bcc4-08de06832b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3ppN0xscTN3MVdCdWdDc1VDVmpHdFU3NUFpeXpmRFJPM2NGdmhKZ3lFYnQx?=
 =?utf-8?B?T0p3TXZMc1JRNkZIMXduWnBxTExzSVk5NWJ2Y1BLMnZ5bS9TREhmVVMxYzhy?=
 =?utf-8?B?WlZ5bVN2KzlDRnZVSmFFL0YrdERBOWx2S291aDFmbmc0SEMrWFdWTmNZSGQz?=
 =?utf-8?B?WHVub2lndUQ5YTZPMUdId3dJR29oZE5sdVNvUVN4YXgrUEYya0dSSnFJa2lG?=
 =?utf-8?B?azlFVWtEckhpVG9kcmNHc0s5Lzhtdmpaa0tjbVNaL1V3K2VqTHZsUzBET0tM?=
 =?utf-8?B?M3FJT2htV3ZWZDQ1ZEh3RnZMbHhrZTJheGxYb1B3S0FHaGVEcU9jS0tqYTFQ?=
 =?utf-8?B?RmNUeDZ1azhaQ1hrQ3dMMEdodHQ0UDZzUTJiNEFBZ0hpQUFuRm1Oc3JiMFVo?=
 =?utf-8?B?aUtKaHlKbG9tcnJoUjE1cEJpZnF0YldHZVlZb1hRb2NMSVpYNWZWWTlKN2Zm?=
 =?utf-8?B?L3E5UytRNThFMEhPZmJId0t2YlJwcmhYUEZlOERVTC8xbEJoNkp1QkZSU1Nr?=
 =?utf-8?B?YWRyb2tzTmZRQTdSVHlZdnJDdHlQOUk1dVcvWDgzMUJ1ZE9CaUVoT0FmNy8r?=
 =?utf-8?B?WlUydEdKUXlzaGM2eEw1dFdTOGI5NnkrR25wKzR5NXpROXFycHVhWmZmczlm?=
 =?utf-8?B?U0I3dlkxTFpIa1dic2hEVDR5bnRhNStNR2JWcWcyUy9Ya3lZY04zS1JuQjRY?=
 =?utf-8?B?ZkpaZytvbXpWa1NvbFVtalZzSkdKYWdENUJMYUZJSUszcXdnTzRua2VoVThF?=
 =?utf-8?B?dHlLV3BnalNLVEcrQURzRVZYUG1YaHZuY2FvSmRsK3BNdnhoRTdKZmtNZTJw?=
 =?utf-8?B?aDU4TXVJMTFUaUlpNExDTUhJSzBmY2VjejBGWDhodFNzQjlXVUQvMXNza1JG?=
 =?utf-8?B?bGlobXRGNG50ZDQ5Rko4TzI3cGJDRXI3S0RkUXUxcVQzRE9YWXVTMlA0ZnA5?=
 =?utf-8?B?OTk2Q0FuUU1WSjJ0MnlISGMyYWdTT0hvWlhQSGlLQkJqcVV3RU9PU3NsbEdC?=
 =?utf-8?B?c0hSYVV3VktMS3BDVUxESE81bitQWWoyUnFRdDdkUDR4NFB1QWFrZnBuSEw2?=
 =?utf-8?B?WlZxYXBFM3hXWXR0ei8vdW4vcS9oTWticjZMQXNYTTFGK3lkdDIxaWhudmJI?=
 =?utf-8?B?RkFzUXRlaExHTGpSejY0aEJMd0hxWWMxZU4rMDBocjdlQTV4YmNUMUpUQVk4?=
 =?utf-8?B?dFRPK0hKRkRFRldMbkJ5RjdVR1RJWkNpa2U5c1MrR25YM05jOVF0VkFoZWtD?=
 =?utf-8?B?dEdlVXBuMEtnMlFpcmVrYUVmcG5PTmVEWitxc29HZ09TNVFJdis5Ky9JYXVr?=
 =?utf-8?B?ZE8wZzFJcFY1QlRNQUZrNlRibmlCZHpyY1VjOWJ3dUpWMjkxcnVORkRYTita?=
 =?utf-8?B?c1N1dTVITXlhd2s5NVFYbFU3Y3Q2OWJaMGRIWUo4Tm1DZEZsdWlab2JFekg4?=
 =?utf-8?B?NUZzOVBVcXE4UHNLaTA0aHJzMkNlUFdJbm9iZnN2RXkyMVpHRmR1cElwRis2?=
 =?utf-8?B?THZVSlFRREpSN1ZDLzFFd0ROMER2bHF4MzJkaWZKUEltM1RwU0YrUUc4R2cr?=
 =?utf-8?B?VUh1a1JTcjRyY2h1Zy85RGFiV1A2cFV4U1ZveUVBblF3dWkzczBBamN6TUd1?=
 =?utf-8?B?S2NiVmhIa2RtT2YzdW8yVUpxQTdDOFBFOWNRRFVwU0tQaHdQelgyWDVKd080?=
 =?utf-8?B?VlFoQUxzOWN6S01XYkxQWi9jM3ZzV2toOUxFNmdZSFl4QU82cFhYTmF6WFJ0?=
 =?utf-8?B?UzNLUXRJaUZQVzNialM5RVdRV1ZkTExOSWVqdE16UGtMVzVGZHBvd21kOVdY?=
 =?utf-8?B?SUpDckxLeTJ4a1JWVzF1VSt3amZNd2tHWVg5UHRadUZFSU5YYWd1OFFNQUhn?=
 =?utf-8?B?R0xwcHZ3c2xYRXhXaDQ0aEloaUx2RGZKUktNL3h1NU1nUDM2ZWJrNFRrN3BR?=
 =?utf-8?B?dnNKdlRubFV3cnBGWUZDM2pxanN6cDArdGxZdklSVUtDY3VNUkRpcEZjZVRC?=
 =?utf-8?B?NmVRSlpvQjhLanlQUVpMVW9SQ01VZWlLazJpcTJqNDdQRWFMNGtjOVVHbmVa?=
 =?utf-8?B?S0RNMEFQRHcwV3F1NVdtK0t5RWN3eFljRFdOK2tiT0ZpNkp0WWFGVzljS1A5?=
 =?utf-8?Q?Wr1E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 15:55:57.3321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcbfaae-daff-4d5f-bcc4-08de06832b85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7671



On 10/7/25 2:58 PM, Jassi Brar wrote:
> On Tue, Oct 7, 2025 at 10:19 AM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>
>> Sometimes clients need to know if mailbox queue is full or not before
>> posting new message via mailbox. If mailbox queue is full clients can
>> choose not to post new message. This doesn't mean current queue length
>> should be increased, but clients may want to wait till previous Tx is
>> done. Introduce variable per channel to track available msg slots.
>> Clients can check this variable and decide not to send new message if
>> it is 0. This  can help avoid false positive warning from mailbox
>> framework "Try increasing MBOX_TX_QUEUE_LEN".
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> v2:
>>    - Separate patch for remoteproc subsystem.
>>    - Change design and introduce msg_slot_ro field for each channel
>>      instead of API. Clients can use this variable directly.
>>    - Remove mbox_queue_full API
>>
>>   drivers/mailbox/mailbox.c          | 3 +++
>>   include/linux/mailbox_controller.h | 2 ++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> index 5cd8ae222073..c2e187aa5d22 100644
>> --- a/drivers/mailbox/mailbox.c
>> +++ b/drivers/mailbox/mailbox.c
>> @@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
>>          idx = chan->msg_free;
>>          chan->msg_data[idx] = mssg;
>>          chan->msg_count++;
>> +       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
>>
>>          if (idx == MBOX_TX_QUEUE_LEN - 1)
>>                  chan->msg_free = 0;
>> @@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
>>                  if (!err) {
>>                          chan->active_req = data;
>>                          chan->msg_count--;
>> +                       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
>>
> No, I had suggested adding this info in client structure.
> There is no point in carrying msg_count and msg_slot_ro in mbox_chan.
> The client needs this info but can/should not access the chan internals.
> 

Sure, that makes sense. Will change in v3.

> thanks
> jassi


Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63AD2DFF13;
	Tue, 18 Nov 2025 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763491878; cv=fail; b=nBfPkZG88DeTmUfU/QsEgrHvpoHNPOPXY8yA43CBMBm8lCo+dpATFSt8Rn5dbxTM5FlTni7OMkY78mvq2u3o5FcPvpRyf1MZsF7xbPCYwM4dS8puzbJxzAvKhYHjadVc6NMQKawcNy2YS5ZdKa8KvEM8NQ4FpzEznmxil9pxUlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763491878; c=relaxed/simple;
	bh=fTrwEBHPfyDHuVxwwx4nYSmubu8QtO1Khnfwo/tLAQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J+AT5/ennOBmo4q/2yUvpu+sFq640KgiJEHsq9K2OJ6DVE3rYMgk7Ee1OnBpl6JQwmun72hri2t4s7V7IdwPbbioiaAdb6KVP80sprUoE2HgukizSjIoL1R/ArIbd2Mb2ORjrQbitdH/qaaQneFyrXQ9SFqZH5GftPuNPg/Cp4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oKUCVc8C; arc=fail smtp.client-ip=52.101.53.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oKUCVc8C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXWNqpiz84PJMrHfSSuZFYm+gkZ7zS3YM+ikmaMxSF9cETdKToxay3qi4zboAl16j3BeBkYG7hIzgzABY3ePKgoUMvie4xA4i6cvVyKA2lT0gkmr1BUr9bfxieZPvm3J2Hjpxajg1x8K8IDwzktvKXTDb/AwpduEtvajG4CPRoSP+YouuhtDzkQ+2gPiW4Ifx0mxBx14R8bt4mixNmCqcEVftaW3aUyqpCKcrs+O6l0ftcXrfg2Xo0y1CbCwcPPo7Ud3wkV3qzvP89SwBJL+F4uXpENmv2UgLwoTzbpy2oh7zQv1zeFP7axx6tcioGA6S+G8ozrxdDjQpro7LLNpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOPmq8qkkuyxsgrWe1/TvTTgdJWXKgi0T6z8WprXCi4=;
 b=aSbHqJ0zQq7MD+Prs1X63ziI/sB1m4MyKL5SMzoHxMf7qOmVNdvP7cjpoW+pQ85qW43uA16TTB0eicaqfkPUMV10zWeDphwPgeTXGOB+cXhMDy1ISbSMBN/J7m+so28pFUhucHRsUM1FFj+WnEwYkOwHmZdgth55CBIFE3Hb4jeRoI+WZK1y/AaBcpWusIMoapDFQZ2ABBDsHF6+Xf+Ey1sMTX6nRfJcNdH/149tMMDRAKZVEhL74iE+HNcZ/I59Hnw6nmkxZNtemNrra6UdIJqViGspERcXrh2NdhL8zGNVgSeFmab2UpS9czOOHtZtebOgp6ZFDUoooBWD83nNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOPmq8qkkuyxsgrWe1/TvTTgdJWXKgi0T6z8WprXCi4=;
 b=oKUCVc8Cnz2G3U4LIu/2Iv8i844OEKywUdU4rn7JLT5GWAIqjIeIw+sUtRFVIUIj1Mw40j6EtUn/C1Wy8xJDl8pmdghtW1V3V9BJsofcju3YBGFG30WREisINRRStiI3NSGNvyNRLl3IVasE8x7KLkyApXQx05KkhmmIA885A9E=
Received: from MW4PR03CA0162.namprd03.prod.outlook.com (2603:10b6:303:8d::17)
 by LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 18:51:11 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::67) by MW4PR03CA0162.outlook.office365.com
 (2603:10b6:303:8d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 18:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 18:51:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 10:51:09 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 10:51:09 -0800
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 10:51:09 -0800
Message-ID: <c9f65597-52ba-41ef-842a-2569c2074d6f@amd.com>
Date: Tue, 18 Nov 2025 12:51:08 -0600
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
 <aa1ff206-d505-433b-9715-56d866a5f675@amd.com>
 <33edad1d-08b9-4fe4-8525-a1f50a898e2f@amd.com>
 <CABb+yY1Y90S_dbybMT07PTvmy60W2mt3mHdP56sp6DO75bpuNw@mail.gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CABb+yY1Y90S_dbybMT07PTvmy60W2mt3mHdP56sp6DO75bpuNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|LV3PR12MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b117ef9-6322-4683-56f8-08de26d370e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmxPbW40WWhCMXBmcXN6Z3BJSlB3OFZ3TDdLZGF5WmszZ0pOZ1BwT2ozYytY?=
 =?utf-8?B?SDZiZ0FSMXhHL21YbmNBU2ZvWkwyZWV4emhsdHhOYS9qcTQ2NWdrZ3pjb1lr?=
 =?utf-8?B?eGYzay8rMGJGTkx0OXhRN2M0T2IwOGRqYmc5Y3R6ak9SaEpHM0xYeUcvSklR?=
 =?utf-8?B?enRpQytVSlBZY00vTG4xQVR2Q2xSdTFrcGx6RVB3ZGp2ZVB0RWExR2J2RC9h?=
 =?utf-8?B?UEExVXlpWVBpMys2RlZrVDVCejc5TXF6cXYveG5MYXkxRncySWMrb0FtbnVk?=
 =?utf-8?B?c0RBODZUaWVRZzA3VzdwYlB3UzM3RW9ZYmcvME9VRFNnTTBmdmRUd3hNZTdQ?=
 =?utf-8?B?ekxIbHR4a01rZnB2aDFaZUkyc3huTG9vVnk1aWszTnNmZUZoQ0s5U015RnVB?=
 =?utf-8?B?Z0tzSWZpdFRaVWdjaU1QSllrL1lKNVRPR25HMkE0Q003QUpUYlpSeHRielBD?=
 =?utf-8?B?Sy9majYzUitwa09lT1hHbGREeWt0MFJGMDFXWFpEcjgwQ1FOb3RxVWVkRXJy?=
 =?utf-8?B?Z01zQlFzNGxvZkVteGlDZU91dDBLQnBhYUhQckhBeldmSWYwUzlWelZDY0Zu?=
 =?utf-8?B?cTc4MUVmaFJ5QjZMSmVzVVhyZDBTU29JbGdRRFBxUWNtOE1mNEhQMUNtbGhu?=
 =?utf-8?B?Nk0wSFMyNmh2SERlMGhBU3M3Q2ZsN1F4STNnVXZ4ajNYRW5SWStxOFNHQkFN?=
 =?utf-8?B?UTRGTWVKWUJ3bjFxN0VJd3crc3FVdUsyZ1dTdXpQRWY3YnljUWhoN2FGVnox?=
 =?utf-8?B?OWVTNlBmUGlvM1ozcnJFait6alk4b3J6M1FkSkZMcEV2VGUxbm44aUo1ZmlS?=
 =?utf-8?B?c3BhUWdnRFRjL3ZUc0kxQmw5RzFUalhCY0RuQmhJVlVWcjFuWEY4Wk8wSFNj?=
 =?utf-8?B?NHZGUE1YUkdrMWR6Sk01REtab09RMGhBOFVFL0ZpZGw5U3g4VFNINVF5eHdN?=
 =?utf-8?B?L0Rza2l1ekh3c21HMVVSTExNNFJ6N05kTVlINDlpbERjODJNQldhTTF4b1Zr?=
 =?utf-8?B?R0JMZUt3MVNkK1doanFKb3JXQ080NHBWQVV3VkdaUGhrNjliR05Yck9mZkZo?=
 =?utf-8?B?c2UxTFNDRVUwV3hhUFRvSTY3dGdqalZrejAzdkF3L2VTVjdRRHV5emhLYWp0?=
 =?utf-8?B?cFpvZ1BMdkFhOHcrSlE2K25vWXhPcWd2MURBZnhoT1o4SUlMWHBBYmNpWUdF?=
 =?utf-8?B?ZWhMV3Vxa2NPcWtHRmZkaWducVRGelU2UlFmUmhBYlhYcWFrTDlWclRWcGZE?=
 =?utf-8?B?Rk5NLytwWnYzcmJ6ZlJ5bkkyUk9JejNnL1g4Rm15SFN6V1ZvYmtvdURoVUN6?=
 =?utf-8?B?anBnRVhtdTNTSGYyblM5SFNuMXlGTGF1L3VndXJqZ0pSVFI3S0w5ajg1WE1r?=
 =?utf-8?B?TTBVa2hPRDJQQXlLbi9mMDJnK1RIdHlXSm95UzlGSHUvMFR3L29sbGVRRDRN?=
 =?utf-8?B?UGtoOEtjendSL01RN25tTjQyRzJ6QmVLZDJocGhadzhNemxRVmtDQURDZG1t?=
 =?utf-8?B?VTc5QWs0elo4SVVBcGd3N1p4QS9qZ1A3MDR1WEdJNTdrUXl2MDhZYzVLcHRO?=
 =?utf-8?B?K3o5bGhLUThWdTJBRElkaDVtZE84UFliWkgzL1NUVytoUElkWGNUaFYxY2hj?=
 =?utf-8?B?dXB3aVNGc3hTaVFiZDY5V21tLzdFUzNCbWFBRGQyLy9MRnNZSmk5WHROZ3Jy?=
 =?utf-8?B?QmpBb2JVWUZXWXplRTNsWERHVVl0eVcyUzA4aFdpWCtUWUZGWS9PTit1dWIv?=
 =?utf-8?B?VEtnUTk4OXh6eGMrc3lrUEtwbXh3TFhsNHlrWUNPbkgwamc3VmVvVTFhOG5Q?=
 =?utf-8?B?bXd1cFFFSmhXR29XeUpQNmMrU0lMdmxpV3dNM1RoNzRUU2dVK2xtSzFxQUs0?=
 =?utf-8?B?S25KT0dSZGpKZlVkMUNmcHowR3lWWjlBc3RoZytLdDF2UEtMMjNUVld0bkpJ?=
 =?utf-8?B?VFNnS2JJMldNemJqaVgvSnRKZkRqNnJSSWRtTVp0dVV5Q1BmQytJak5lYWY1?=
 =?utf-8?B?RHNCM0pmVDZYZlpNT2dDaXJyRzNFdmpUejFlZmFWVVJLQWNnMWpwUHBKeGlQ?=
 =?utf-8?B?UTdZbXNQbnIvNFA0a2VXU1Y5M29tK1JNUHF2ekZHcEplSnp5bko0YXBkcVRG?=
 =?utf-8?Q?O5UE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 18:51:10.5865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b117ef9-6322-4683-56f8-08de26d370e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268



On 11/15/25 11:38 AM, Jassi Brar wrote:
> On Wed, Oct 15, 2025 at 10:27 AM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>>>>> index 5cd8ae222073..c2e187aa5d22 100644
>>>>> --- a/drivers/mailbox/mailbox.c
>>>>> +++ b/drivers/mailbox/mailbox.c
>>>>> @@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void
>>>>> *mssg)
>>>>>           idx = chan->msg_free;
>>>>>           chan->msg_data[idx] = mssg;
>>>>>           chan->msg_count++;
>>>>> +       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
>>>>>
>>>>>           if (idx == MBOX_TX_QUEUE_LEN - 1)
>>>>>                   chan->msg_free = 0;
>>>>> @@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
>>>>>                   if (!err) {
>>>>>                           chan->active_req = data;
>>>>>                           chan->msg_count--;
>>>>> +                       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN -
>>>>> chan->msg_count);
>>>>>
>>>> No, I had suggested adding this info in client structure.
>>>> There is no point in carrying msg_count and msg_slot_ro in mbox_chan.
>>>> The client needs this info but can/should not access the chan internals.
>>>>
>>>
>>> Hi Jassi,
>>>
>>> If I move msg_slot_ro to mbox_client that means, each channel needs its
>>> own client structure. But it is possible to map single client to
>>> multiple channels.
>>>
>>> How about if I rename msg_slot_ro to msg_slot_tx_ro -> that says this
>>> field should be used only for "tx" channel.
>>>
>>> Or is it must to map unique client data structure to each channel? If
>>> so, can I update mbox_client structure documentation ?
>>>
>>
>> Hi Jassi,
>>
>> I looked into this further. Looks like it's not possible to introduce
>> msg_slot_ro in the client data structure as of today. Because multiple
>> drivers are sharing same client for "tx" and "rx" both channels.
>> [references: 1, 2, 3]
>>
>> so, msg_slot_ro won't be calculated correctly I believe.
>>
> I don't see it. Can you please explain how the calculated value could be wrong?
> 

Hi Jassi,

so on my platform I introduced some extra logs:

[   80.827479] mbox chan Rx send message
[   80.827485] add_to_rbuf: &chan->cl->msg_slot_ro = 00000000ab5fa771, 
msg slot ro = 19
[   80.827494] msg_submit: &chan->cl->msg_slot_ro = 00000000ab5fa771, 
msg slot ro = 20
[   80.833064] mbox chan Tx send message
[   80.833070] add_to_rbuf: &chan->cl->msg_slot_ro = 00000000ab5fa771, 
msg slot ro = 19
[   80.833079] msg_submit: &chan->cl->msg_slot_ro = 00000000ab5fa771, 
msg slot ro = 20
[   80.837486] mbox chan Rx send message
[   80.837492] add_to_rbuf: &chan->cl->msg_slot_ro = 00000000ab5fa771, 
msg slot ro = 19
[   80.837501] msg_submit: &chan->cl->msg_slot_ro = 00000000ab5fa771, 
msg slot ro = 20

Tx and Rx both channels are updating same address of msg_slot_ro. If 
user wants to check msg_slot_ro for Tx channel, then it is possible that 
it was updated by Rx channel instead. Ideally there should be two copies 
of msg_slot_ro, one for Tx and one for Rx channel.

This happens because Tx and Rx both channels shares same client data 
structure.

Same can happen on other platforms as well.

Thanks,
Tanmay

> thnx
> -jassi


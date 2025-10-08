Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6E629BDA0;
	Wed,  8 Oct 2025 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942159; cv=fail; b=YyTJ47pz2d6ztl1tEOFGLtCajrYGGzRxg4CQ0jGGJHTCLdGlVkmSR/9YpudRozilxItAlGjt4abdcKoPyms05vh6UBdhQrotpJnZz3UQrpsW1+zGlN4qIoF/C5MpoThyNXMgoEbL2peLT3RFwIZ9UbJ6+CgutVqw3jnghHsr3mI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942159; c=relaxed/simple;
	bh=9f9GuhQcZTjIIjuMZyh0xglERnztiG7Q6LnKH3PEd44=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tvYjhF0Kw4nMzcs92ZJKncDoymCF2bUBXwsXBG9r4u3SiVqPGvSGVTjiolS3bC5FC0s6nESOBA5CqIJr7OpoaN6oUYGdG4WUPXWYPEUhvZwN7BCIMgZE8CmxLskQDtCimxKPxz2MIESLKv8p9rT+t2yDwsvyHyhCue9cOSH79hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oKQOuzuz; arc=fail smtp.client-ip=40.93.198.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oKQOuzuz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/W9xafezvT9kbLHVUNrE01GWqcpeIaB0cIxLs2i/LsMHg3yliW7t0ouAQGxohmz9mDHiUUiuRzmMBQpwHZVBgPjQWmHmNJu0zZDEwglwQhIl9ROnVSMeyaKkm34uI/Ga49zCzqIXw3TZrCJuyEgh27uTzeGLM13Fqx53HU9ZmvnL/AqnySkMoyF7Qi01CdsOMzvqrQkMIwBDh1JgdkCgba0fN2M6SgP7pCQec+jpcOgJpqeF8h390V/g1xTk+cNOQdhKh1XZs6xHprU/2bG+YPNQ0ay7BJBl91BhUmvt3gtLHTCuBSIvKDpXYz1jMMqMBDiWHJBqC8hAxQFJFCJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkin8PKg2vvjhPKkQO1KaRK0KHyAqHgB9V+iUa8KmXg=;
 b=b8/v8JJ+m8RsEWNSlS/yiI83P5RfFUdSFx2yDeVDku1POCglTzyItd11dseOABVgL7SPvPqAanaS238LH2DknveX1LKw2odReos10yZZxxlbGnMcqnlSPd+FWOZylU8BqdGpTuP/LuK7wW7Q8x1LhD6MvOs+cfv+6WpmGfWC5l1YKn8SswZ/X/nx+SqxfGFx35Rnp5Gbmw5BNlvILfUd/rX/MhcegnnxvR048zyMSzJs6sNu+/+yt6Q3A1thctL3zhMrQQJeKWNqy6/EHqsneTMsJnVI9DRpvo7PchCNlYoMG1xQ+plkhUbUM0yRdyJwztu0G37Bd6Nuh7fpBnND0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkin8PKg2vvjhPKkQO1KaRK0KHyAqHgB9V+iUa8KmXg=;
 b=oKQOuzuzIGsPYixVA0X8Lp8uR8rjKLI7TEDWBDurDPN86wm7wJKF2+1h/ESD/AmWqUUsnXHerdqj+44R9YKtqIPi1Nb5kiEAKg0d7gFZThMSgyRvgj7a4Xoax/V2S4WaE7b0sT6okf1sAquZ1ltHf3DfgctpDaDckc0WR8tD3Y8=
Received: from MN2PR19CA0024.namprd19.prod.outlook.com (2603:10b6:208:178::37)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 16:49:11 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::e6) by MN2PR19CA0024.outlook.office365.com
 (2603:10b6:208:178::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Wed,
 8 Oct 2025 16:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 16:49:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Oct
 2025 09:49:10 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Oct 2025 09:49:10 -0700
Message-ID: <aa1ff206-d505-433b-9715-56d866a5f675@amd.com>
Date: Wed, 8 Oct 2025 11:49:09 -0500
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: cceacf25-818b-42c4-cb26-08de068a9b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHYrdHRMWTFwTFJvU2VoaTY1Z2hNYXNldjB3RllsRWNxK29vQk4wb01CR3BV?=
 =?utf-8?B?K21zRmdTRk41cTdJTmo2a2w0K1hYRjRmWlRzcTh2aVZVSWcxbHYvNndNb2Jz?=
 =?utf-8?B?WkJCVFR3RzZJc2dYT2tMc0xPRmVOQ0JWUS9yZ2M2R0YrMmd2ZWsxdVVxR0RI?=
 =?utf-8?B?Wk9lczNSSTE0WlRWL2xaY3lFZVYvMmJxcDBwb1B1aVFFWFpSQ0lMU245azk2?=
 =?utf-8?B?cU11V0FXWWtDenVZNzdEMjgrNzBXa2xVWlF6LzFRZGdXOEhBT093UkFtbXcv?=
 =?utf-8?B?cmI2cFVPUVBmVTIyL1ZKZXJFSmhnbkFsd1JPNkt4a2lic0RoblhLSkw5RlNp?=
 =?utf-8?B?Z1dDR2tvaEdnd09uZTlPZzUwVjgzTThCTENPbHprZlNCakVpUkVOcE9xd3o3?=
 =?utf-8?B?c3RGdmZIV0VaaGY1Lzdiby9sQmQ1ZWUwajg5SkRxR0YraFh5SWxSWjhrUlVa?=
 =?utf-8?B?R3Z2QWU0V1YxL1hJWmZPMDBpbEdLYzRxRWd4SmpYbnd2SkN6cEErQlFJODJ5?=
 =?utf-8?B?elBQSGlQSitYK3p2RHk1YXUybE1PK1JKd0ZyRmhPWWpKSE9hR0UvM0FLalRn?=
 =?utf-8?B?QWNDYjh2ZGFRMGp6aG94L081OVA4NGFLd285Z2NrNVpuN05kb1JBR28vc2lR?=
 =?utf-8?B?VG9ReWc0K1hHUUErc3pPTFJQS0FFeHRUaXMrbUJuZkpZdEE0Wk92R094VGhs?=
 =?utf-8?B?M1lRM3NwcUtVQjZuY0VXMHAvQjJCYWthZi9Yb2lHZUN0cjhZcUVuTXVYSnBz?=
 =?utf-8?B?YWFhNklEUE4zd29ieVZCWml5L1NlU0g1eXJqT29jSnF5dmVSQUozSzFSUE82?=
 =?utf-8?B?MzhobW5OMzlMcHFNc3AxMEtqT1Y3ZGFWRzRYWHhpNVpZaXh6TzJqSU95Kzc4?=
 =?utf-8?B?L05XWGJoVGtzZmdoK3FPMlV5VjNOc0pWQkM5OWtxL1JCVlA3TGdWQ3o1Q3F6?=
 =?utf-8?B?YUY4aTlHSEJxQm13U3FmVXk3T3VBNHpwbEpZME95QXlGRlhjc2VJZFpFeFpr?=
 =?utf-8?B?eHF1MndseDRuZEYrckFjRkI1WDYvbUFsV2x5QVJET3htZ213UThYd21rUzJU?=
 =?utf-8?B?TFpBNFNqTzlzZmlSbXdpeG0xMFBrQjdMYkMxb3JOUHhSaVFMc1IrczA5Tzlt?=
 =?utf-8?B?Y0RBdGNtNW4rMGw3c2h4cDBlRWJsOUc2Q0MvcWxLRlpML0lYYWhaWlZlUTN2?=
 =?utf-8?B?U2pSQW0xVnFnNzk2emdzMkM0cWZDUS80VHhWcVhINEtES3oveVI1ZStxZSsw?=
 =?utf-8?B?eXR4dEc5K2FsbHVHUUNuazkwK0prWXhHbXlTU3VQYWFOZ1MrUmg0OHZtUCtE?=
 =?utf-8?B?clo3ZFJjL1JFQ2RsZnRrd3R2elBmMlFGUWh3V29CcTdEYmZnSlBoeEhlVTVH?=
 =?utf-8?B?YWdSaFdvZFh2N25CK0RMMlViWTBpbHBQZnJIa2s2bHovSXhKRVVscm1ZbHpU?=
 =?utf-8?B?UmQ0T1RQVVNjaXVvdzRXcktyc2VlYk5ZaXRIYUFwOHkzem1YYU9KbnF1M3Rv?=
 =?utf-8?B?TVVGTDdyMWNQMm4rQUhSZ254TVFGaEZrTUtMdEtVaWFlanVqQkpxUUQyZG1i?=
 =?utf-8?B?U0tzUVViSzdVamJkSzVzcHVrOExEd0xkZUxXVTl2M2kySHk4dzFCVll1eitO?=
 =?utf-8?B?b0Y0M2J3Si83UFZCUzRjQUpCWW1jQnpaZHd1Q01aRWRYZlNQdGgvNmVVYXBF?=
 =?utf-8?B?VkZDWm1mV0dTR2d3cG90dmpCcEFFN3haMk56VUdJZUJFOGZuVkdhZDB0ZmVI?=
 =?utf-8?B?M0tIYlQrNnVFUEREb25ObktkekdmSEtxSTBlR05aQ2V4OVAzanQ4L2xVbWtP?=
 =?utf-8?B?TUg4dEpCbGlCdWxxOG1oekRCOWRWMk80N05ORHNZUm5sTnUydFJGTlYxNUhs?=
 =?utf-8?B?RU1KVlR6U0w4MjMyUTdiTVpnMzFtU3hlT1JQM1dybS8wcnZ5cmhEQWNPSi9t?=
 =?utf-8?B?SVBoQldXR0hncXgyQnMyYmNLbzlYa1llWWJvQURWcnJlSm1TaThMT1lwcjNs?=
 =?utf-8?B?cG5xUTQvV25IcW5EOURIOWZXM256S0lJN1ZDVzdmMThaRVZPbm93MGQra2lS?=
 =?utf-8?B?RnNRU3hZOTlVQ0RBSVJhVDNtRTlUMDZrdUEyWi9EQWpDN1MxRkZOYVNYNVBo?=
 =?utf-8?Q?/HO4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 16:49:11.2506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cceacf25-818b-42c4-cb26-08de068a9b3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504



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

Hi Jassi,

If I move msg_slot_ro to mbox_client that means, each channel needs its 
own client structure. But it is possible to map single client to 
multiple channels.

How about if I rename msg_slot_ro to msg_slot_tx_ro -> that says this 
field should be used only for "tx" channel.

Or is it must to map unique client data structure to each channel? If 
so, can I update mbox_client structure documentation ?

Thanks,
Tanmay.

> thanks
> jassi


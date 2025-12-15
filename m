Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013066.outbound.protection.outlook.com [40.93.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263D0325497;
	Mon, 15 Dec 2025 18:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765823500; cv=fail; b=f0r848cITnkRdJ4H4nykFAVQ3iIfNeIWD4cDFh6oOf0F2cLeUnv8PG/k6DEFintu39PCVW5wEJ/iBVwS+e6I4vyMc31RbnI9RfbPQzeJVxtOnoWcDOXFIqI+iYB1i5+T3OkC9JfQ0GYMsUgMXBgaG6z/69wqTkMENXadO4DJrR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765823500; c=relaxed/simple;
	bh=pirX2BEaoWRAq75fElG9cVcQU+474ZaILxLsduakOVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uiM61pFnzcsTfDmgVWsXrIqNaaRU3zKCVB7VzQWkDe3IohrFxksqna1iNFjnvupm7SBfmn82npC8oXgWDOfizqOl5aSClL4mKJmaxU8IiGoLyfjtCfVNzK/gqBzjxqRLFrBkDKb8/cGcVWUvWuVXQkcLiREEbA/MUeyuxnLBwbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z50Oh6l/; arc=fail smtp.client-ip=40.93.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z50Oh6l/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBX1VS1zt6H6EkyiHEEaq/fiiDfAhXPwzf74oA7z8J/v42pC9WBCVVgnkTmCTL2pB9DLGrjyxdu863RyNSnSmTj2qTOs4DkghIR6+2DY021twcWJw+mwikhwFTzVnhW9RmZoC7nLkqahtMwjikL+SZBEQUupiVctvsYrVChVFLa2XSHcnlHOukwBmXtDgjXT4m4/SluzS2MhzmJP4LwF5qA8+fobRfPRm8iSEGaQhRejVRoMuGg+npIs4rK4eY8DtjjnHn4QJrKnvd6QQ6cYA3+avavA9eK6d8SF0Sn+QBP3FdOgG/FTZo4o6Qj+qIFbts3KVbk8W92PTtr4FSr9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/eEXcB9/WSXsxy+AmDWfiAHXPC/fs+RJCjGLjyUx+I=;
 b=BWIy4uI4zNVmZmn8M6BtlzReYKiZDFBuuAz3uGFO/eP0pgBHYWFvpgCZgOCnE5B4rPV5HWQby77bz7tj5jAUn6tklNLiw7ZmJgdbDkEmwkUgFu11iGZYpaB61qm4tFVjDhNvwmzC0sXrcx8x2nkayMckzylRjblepSRDV0e4FXyBWx+XYUAbqZFNmTN25hw2gjepam0CofclEiuQpkFiP+cDknWBK0Wo2C31tXXT82s1Ciu0UN/bl87pUDSgDcCR20bccPgA/F4RgQ1OsdySt5PV6tGteXgXrKr6+WQ6aum/1jKYpfw4YgTu5EbewWqwLx7pcAjGXyYK2l1SvGTHOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/eEXcB9/WSXsxy+AmDWfiAHXPC/fs+RJCjGLjyUx+I=;
 b=Z50Oh6l/dqpe60yv9Z78OhT66j/Nr/7CQeLOVQiKlhZbpzZdxI1jiHb0PzpRDH8zNDmObaCKnxaVY6NSELxxDDcAxGGBd17As586OMSDxExvMFyi4gxXZygmRmqLpAK6k7mjz9IrwHHrScPK/tzCeL80V2Ep9lOqWF+uNP9/xGk=
Received: from SJ0PR05CA0044.namprd05.prod.outlook.com (2603:10b6:a03:33f::19)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:31:28 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::6c) by SJ0PR05CA0044.outlook.office365.com
 (2603:10b6:a03:33f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Mon,
 15 Dec 2025 18:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 18:31:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 15 Dec
 2025 12:31:27 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Dec
 2025 12:31:26 -0600
Received: from [172.31.132.204] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 10:31:26 -0800
Message-ID: <27cae4ac-effc-425e-9614-b7245536a4f2@amd.com>
Date: Mon, 15 Dec 2025 12:31:25 -0600
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
 <c9f65597-52ba-41ef-842a-2569c2074d6f@amd.com>
 <CABb+yY0qZktWThE82RppmCN1cC=UvKkKp-F3T1ydwiUfyOZGkw@mail.gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CABb+yY0qZktWThE82RppmCN1cC=UvKkKp-F3T1ydwiUfyOZGkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: d36df6ed-6163-4f8d-0d56-08de3c0828be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTFyUFVQdXFhcUwyR2FoWmVUTDVNczVDR1JhY1Y4eVhMQ3RmU3lnekNoSkIz?=
 =?utf-8?B?Umo4SnIrSExXVjJreVVoUUwyWGxjUTZBMGMyUG5acWR4RVB5ZlAzQ3R3dEUy?=
 =?utf-8?B?aC9GRzk0RWlwcHZBV25iQVFaL05QSG1ZaFcxSDRibElnaWRhdTFmbEZYeVFC?=
 =?utf-8?B?b25SWjN0aEVMYTZZVWhkRU1mSW1DeXUrS2RMb2hPVFJhZ1Z4b2hDaG9iSDM4?=
 =?utf-8?B?UzJwVC82KzlXUk1WKzZGeEJGRHJra05GWThmcXppdVZpZVhUcnB0aURvbkhk?=
 =?utf-8?B?Q0hXSzU2R3hBcFNLWTUxeTJTOWJ3VzJNaGN4Vm1sNDNiZlZTei9uajh3c0Zz?=
 =?utf-8?B?UlpOYmlSeDNhTWE1ZERLekdtOHZFY2FpbVRGLzhmVFpDa0d4RFlQNGxPVjlG?=
 =?utf-8?B?ZkxxUUFEMFJNTG9IL0dGb2RabWtJQm9sbVhnNWFtaXVwbGxNNGpuQkFSWjV2?=
 =?utf-8?B?NlZjY3Z5VGV4VlpSNUJ2cUZ0Rm9hb2FoRXdSQmVSUTVwYWlMclFEblQ1QVNC?=
 =?utf-8?B?d0VaemVTR01FbnJ1RndnM2dUenlISTVpTHh5YTRyU2JBdmJYMTNXeldOQUhy?=
 =?utf-8?B?TGJjMDF1Z0NTNjQ2UllYcUtWY2tDS0hIZEFQa1hBUVR3OHdCZlBFYVVaSUIx?=
 =?utf-8?B?WTJGT3FFM0E3M2k5Mk1uWXVHNlk1R3Iwc2EvOUNLMHpWditXcXNGUitxUVNS?=
 =?utf-8?B?bWN5WlFPNVg4MkFmdC80ajlyNEQzU05qQXRXMUlBRFpRZ0pUZkJWd0Z5cWNx?=
 =?utf-8?B?YU9POE56dVRDNy8wR2NqNGNBdFAvckFyK3R5clpqME9DZERJU2FtYVdoWFBJ?=
 =?utf-8?B?cVk2bjFaa0s4b0kxLzd6bVRFTmJLaC9GQnhNQ0h2WVRnQW1hZU1oMkhNMVZF?=
 =?utf-8?B?c0NhRlZRQU5ZZ1FKY1pkZUIzWG5OU2JBZFloL29XTElHTXh1Nks4YzZ0V0l2?=
 =?utf-8?B?amkvczEvSnVYS2lqT05VTlB1YjdtbUMxQktHUlpEUGVZVGR1K1pvOWtnRXE5?=
 =?utf-8?B?TEo1bEpQYWg1dzg3ODhpeHpyYlpzZWQxdnVGRG5ycVQra1pkOElpa2paS21N?=
 =?utf-8?B?Z1VZbUVITVlNTk81S3BxME82TVBuNm4vdXFBMDdpR2FzaVdldmJSMVhjNzkz?=
 =?utf-8?B?NVNldGRNMldobjBDWjNCT2pZVHdZYTFpdTBjNjFwaCtPODZ3VEZ6aDlPNzNJ?=
 =?utf-8?B?Qm1heXdreDBMTGRFYTR6WFFhVk5jWWlBNzZQQjFSOHdYdnRvc2RVRWxSRUZl?=
 =?utf-8?B?TmgyOUhtUnprSDdlWWxXK0hHMDhJNyt4NmIrZVd3WDhhcDhQZU1JT1oyaG8w?=
 =?utf-8?B?UWhNMERHbDl1cW1nbEVrc2JNRk52RGpPemhFM2kvY3lhTDRWU2hidTQwVnB1?=
 =?utf-8?B?WVFxalNMcVltMDV6WVgrZGJnejByK3FYTXU3SDhCdmE4OFpwWlprT0RlQjBt?=
 =?utf-8?B?cms4ek9RbldkTlFuVXJzSEJweUpXb1FyYmF0V3lNZzJiUTVXWm5IczFSdXFT?=
 =?utf-8?B?bjV4SGhaVC9YMFBqOG50Um8xV0U4SkthcUMwVTRtOHlDTVpGU2ZhTmpFWm5t?=
 =?utf-8?B?NU5JWUIwSEU5b2F1T1ErT2QzOUREclJuaVhCd1NPS0VYeWlwc2NCMlZMZE94?=
 =?utf-8?B?MU9wQkNIQWlZQnJ5MVV4Z2ZVQ0xmQk4yRzQzSURaRG5IQnp2SENoamsyRTAw?=
 =?utf-8?B?SWh1Z2s1cFlxQVJkYm5vVUpKK1NleVo5VFV6WHYwa01FbEROUjM5Ym9UNUcv?=
 =?utf-8?B?TVVyOG1zcVNyRXdVdkRiWUgrbFNsbExqcUhDbFc1TlNYd2Rzc3pZZjFoL3M3?=
 =?utf-8?B?eitjSk5EMnpQVUtLNFlkZmNkcDR1MWYzVzIyZk9tdjVySEFXSXhRODhnWjZG?=
 =?utf-8?B?UERoaWNYQ2d1NEJaRGFiZ1Y4ck9HSnFMOGQzWWhtR1E0U0twWVFMWkRxcmN5?=
 =?utf-8?B?aFltUi91ekdnL0FtWkFPSTN2N1h5aDZQckZJZis2ajI1dktwNE9mRVh6N3Yx?=
 =?utf-8?B?UnlZRDVHYm12SnhMWkNMNk9pNk1TbVFPUzBwNmppVTFYU3VWRThxMUZMUmR1?=
 =?utf-8?B?TnpmbVFmUDZRWHhmTkRzT3FTb0RncmQ5NDRWM3hacW1mZG05T2E4ZEpEcGNp?=
 =?utf-8?Q?6P8A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 18:31:27.3348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d36df6ed-6163-4f8d-0d56-08de3c0828be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029



On 12/3/25 8:13 PM, Jassi Brar wrote:
> On Tue, Nov 18, 2025 at 12:51 PM Tanmay Shah <tanmay.shah@amd.com> wrote:
>> On 11/15/25 11:38 AM, Jassi Brar wrote:
>>> On Wed, Oct 15, 2025 at 10:27 AM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>>>>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>>>>>>> index 5cd8ae222073..c2e187aa5d22 100644
>>>>>>> --- a/drivers/mailbox/mailbox.c
>>>>>>> +++ b/drivers/mailbox/mailbox.c
>>>>>>> @@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void
>>>>>>> *mssg)
>>>>>>>           idx = chan->msg_free;
>>>>>>>           chan->msg_data[idx] = mssg;
>>>>>>>           chan->msg_count++;
>>>>>>> +       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
>>>>>>>
>>>>>>>           if (idx == MBOX_TX_QUEUE_LEN - 1)
>>>>>>>                   chan->msg_free = 0;
>>>>>>> @@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
>>>>>>>                   if (!err) {
>>>>>>>                           chan->active_req = data;
>>>>>>>                           chan->msg_count--;
>>>>>>> +                       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN -
>>>>>>> chan->msg_count);
>>>>>>>
>>>>>> No, I had suggested adding this info in client structure.
>>>>>> There is no point in carrying msg_count and msg_slot_ro in mbox_chan.
>>>>>> The client needs this info but can/should not access the chan internals.
>>>>>>
>>>>>
>>>>> Hi Jassi,
>>>>>
>>>>> If I move msg_slot_ro to mbox_client that means, each channel needs its
>>>>> own client structure. But it is possible to map single client to
>>>>> multiple channels.
>>>>>
>>>>> How about if I rename msg_slot_ro to msg_slot_tx_ro -> that says this
>>>>> field should be used only for "tx" channel.
>>>>>
>>>>> Or is it must to map unique client data structure to each channel? If
>>>>> so, can I update mbox_client structure documentation ?
>>>>>
>>>>
>>>> Hi Jassi,
>>>>
>>>> I looked into this further. Looks like it's not possible to introduce
>>>> msg_slot_ro in the client data structure as of today. Because multiple
>>>> drivers are sharing same client for "tx" and "rx" both channels.
>>>> [references: 1, 2, 3]
>>>>
>>>> so, msg_slot_ro won't be calculated correctly I believe.
>>>>
>>> I don't see it. Can you please explain how the calculated value could be wrong?
>>>
>>
>> Hi Jassi,
>>
>> so on my platform I introduced some extra logs:
>>
>> [   80.827479] mbox chan Rx send message
>> [   80.827485] add_to_rbuf: &chan->cl->msg_slot_ro = 00000000ab5fa771,
>> msg slot ro = 19
>> [   80.827494] msg_submit: &chan->cl->msg_slot_ro = 00000000ab5fa771,
>> msg slot ro = 20
>> [   80.833064] mbox chan Tx send message
>> [   80.833070] add_to_rbuf: &chan->cl->msg_slot_ro = 00000000ab5fa771,
>> msg slot ro = 19
>> [   80.833079] msg_submit: &chan->cl->msg_slot_ro = 00000000ab5fa771,
>> msg slot ro = 20
>> [   80.837486] mbox chan Rx send message
>> [   80.837492] add_to_rbuf: &chan->cl->msg_slot_ro = 00000000ab5fa771,
>> msg slot ro = 19
>> [   80.837501] msg_submit: &chan->cl->msg_slot_ro = 00000000ab5fa771,
>> msg slot ro = 20
>>
>> Tx and Rx both channels are updating same address of msg_slot_ro. If
>> user wants to check msg_slot_ro for Tx channel, then it is possible that
>> it was updated by Rx channel instead. Ideally there should be two copies
>> of msg_slot_ro, one for Tx and one for Rx channel.
>>
>> This happens because Tx and Rx both channels shares same client data
>> structure.
>>
>> Same can happen on other platforms as well.
>>
> The queue is only for TX.
> The received data is directly handed to the client. So RX path should
> not be modifying that queue availability variable.
> 

Hi Jassi,

Thank you for this clarification. The xlnx mbox driver is designed to send and
receive on both "tx" and "rx" channels. The "rx" channel receives data, and ack
back on the same "rx" channel.

I guess the best solution would be to have separate mbox_client data structure
for each channel in the remoteproc xlnx platform driver, and then implement the
rest of the solution as you had suggested.

I will send v3 after testing.

Thanks,
Tanmay
> thanks


Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517302F4A;
	Tue, 30 Sep 2025 01:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759195803; cv=fail; b=ELE3Rh/I82gVwz1s0xhe2aRicHWN7lFoxwpjW3rgI7lKIXWwyD8UF3kdKfu2P95+KX6cYCKxrvm1q4X14XTUiMwYecaTA88jRFVJFgOw64ck51Sk6cOZyDQASYRgNFmiticU0+c3kYvHPuxqJRl8Ru8m51s2FLDfkLxr0Sl6kVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759195803; c=relaxed/simple;
	bh=JlcQvX/hDDi4+0OzIn95PcERQISsjWL6/ZKoayZifOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r7YShAv/W77mTFrdQJTIIF82EsvSe7ko6NGXnkAdu7SGMR0MES7yhpYHrnMpu/We4xQfzHMYnaj0yb1P2W8Z7jxcCqs/DwvOc6ZaiC4UkTQXsYyn9Wo5jzw2CAX4jNfH5TJd/3mWnW/f1Gj+/vN9kBpP/nnWsipywMszKphT/Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e34BA40Y; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e34BA40Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+xPgFzbOb0E6kOFej3tX6OniSDihbOv3oyFiHHn6Fp3p8JuOS2NtkLYZrXcWTr9WtqZv+2LSvm9KRUKpi8zZfmhM6SvwVQASRrr8dJRslZ3zpx+NY9rkJ6feX6XqoRu24R7jG1XKhK4D+MjTkPTkBgcTylbT9thvk1jqSBT2bVEkb5bnYbKtOFX34X3NjiugfTq7xt6nk3tEP3kvrK1EEy2darltVR8zmxQEt/i31mZXtByl/LsnRbFuSQy2WNJF6BmoOu6IAKCOFKCuSTpJ60tqCdyH59A1OOv7bwj6/I+BDHlIMwREzcAysMvlF3fw52j7d1epilojxAm3KgofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndPCul9ZK8hx8jqtGJpXFIkGi06ESAtn7AJQoeuX6p8=;
 b=lSMDO8TPV302CQ9EeiFbnmbW/3/ePCuFs21w2squ24J7I85vZA5NovoaKgTjhG1hazmKX+J0qUl1gIRFKG5P7zH1BhPLStIeeELT1WTgWSbgLTTqqVuAQjNMuzloRDlaec98lIwxC87y3e6+ta1nbTl8jYar50Vm90zvg66uICYvMx9v/kHq3lBA1RWMnKryEYQrMHaYLw+FHDKqASVhTG4v2y3RFFW6B3xs0NLRZyRat1zc9cFbyddFQrduNhkg5xw9B+FvuQEbH3aaF04APIP+E/Wz6dmicvmrhRJDOJWuaOknTANyK2ce48KL1kR4KU34dB4stCbWSGOm2Ma0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndPCul9ZK8hx8jqtGJpXFIkGi06ESAtn7AJQoeuX6p8=;
 b=e34BA40YysvrPZJRoSRIl8EbrXRZ1fywzQy/0eqYpClw0h21e/Df3Ra14x0dXZwuSfYMsXAFBaWjH/r7pi0/5G5vU6nVpMcxFnVnBTTkI6dQgVVC212O8ev1X/3ct/2fiTRLqBAhemdvpttSNumPVdrJRspIjNMsNV1Ns5v0irdY3UG0p+cXpQGk3v5nnO2theVppEF7sg03hbztKdgN6behsxDSQ3xEUiqy7ZInSD6WrUR+VghZ0lpivP78Mj8mcLB6wHaZ230OErEYH1MoPUDba16ZNKm1zfEr0zsnUe7b6VYS9h72VMg6YKqfBP9KU4FGEofLI3oGZaodOeTNoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8398.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 01:29:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 01:29:57 +0000
Date: Tue, 30 Sep 2025 10:41:46 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tanmay Shah <tanmay.shah@amd.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, jassisinghbrar@gmail.com,
	andersson@kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
Message-ID: <20250930024146.GA17703@nxa18884-linux.ap.freescale.net>
References: <20250925185043.3013388-1-tanmay.shah@amd.com>
 <20250926073735.GD8204@nxa18884-linux.ap.freescale.net>
 <e93f0ee7-687a-4f47-a847-90cc1ea87290@amd.com>
 <20250928075641.GA29690@nxa18884-linux.ap.freescale.net>
 <aNqbc5Q_tVStXkhI@p14s>
 <8cb065f6-eee3-49f4-b657-1f4c74f1b324@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cb065f6-eee3-49f4-b657-1f4c74f1b324@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR03CA0122.apcprd03.prod.outlook.com
 (2603:1096:4:91::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6b2bb0-aadd-4590-0547-08ddffc0dd25
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UKndzSzmKUF/zzLL7DLE/fgp5DM5S8D39HoooVXoaL94MDvRD+2Ek7tsKiom?=
 =?us-ascii?Q?8seZnP5SpujDIPHK0DfgnccWaEehcZIzmD1d5t4ED83bKVTBMIbH/MTi9rad?=
 =?us-ascii?Q?9vVqREEj+BZjokRM73ITZmlsUL3WkRz7289QyWnSchNCOv5H+q8daUZGfzc4?=
 =?us-ascii?Q?DqJKVPjL7UKc0WGX4a3xORS9p2QwLf8kBjsRXgJErBDQh4UZUHRuAbOqmX3x?=
 =?us-ascii?Q?i8MVQWG6uTUttaxyj8HOcECBulEd3+2+83JScVdP78qDJK9cUudVJsj91Mu2?=
 =?us-ascii?Q?bcrewjpDUThtCYWnAJSmTwVc8vifRY0//QNyh78IFCkQx6n7IcWTtUfS5EMs?=
 =?us-ascii?Q?zFqWfUtq5mwhkumuKyhtcjnBM0KEgxIJvtSEi2uDFdGywz9mDxD6Je+vYxen?=
 =?us-ascii?Q?PVynO2JYzC9WFElL+azIvOHLC1x/NX+JWifJH0vXNiensiTBDKJ+1A983xmU?=
 =?us-ascii?Q?iMHCSPnpyGo6NNsKBnsK1xpY6ixo/Gg8QE+yzt8yo81PD8yWmHa1tPnFagbq?=
 =?us-ascii?Q?J2EzEmBuyfUy6JZCRNSCfkZpRCj2OtKzkS+pYZqNBzNC+lseiKpwiiFpGj13?=
 =?us-ascii?Q?FD1ZTNaO5cKhnI1KJgNiF8zQfHSkD9COklwBYfhwvUYXst2HfXcv6A/rCw0O?=
 =?us-ascii?Q?xTRlDt44zIvGPU0/j5taoTDDaCniibhYYN+bQCJvo8YgeuA47kWPjvkV39vg?=
 =?us-ascii?Q?pba9N+72WfUBvCKT3yhjK7xw481t0NC/Ad316LDSrKsxiSV2w6iQwbJLl54p?=
 =?us-ascii?Q?ojr2cqGgqOZBRbw02so4tKhioQlFZfJUnMXPNOqtRWHlWLgyA40QTPBAZami?=
 =?us-ascii?Q?+ors8EfVPTnPj1Eiww4kDLGDU2KoQgVik6XlvSMVnB3c7iMQQf0cW2+iTT+Z?=
 =?us-ascii?Q?21R9VIPQnXHKNjq5j6CbhQ/AFsrTYI4Lpo37WkiTMR0oof7sLhgRZ3wKYqCM?=
 =?us-ascii?Q?M5hBHz1VuDZS1547j5yfG84C4jINg77tS5M2Irt5aGHsKltIqAOGuG06XJsV?=
 =?us-ascii?Q?lrkSvc2DHBPGAtFRnR4tbfgEhJB1TbcBYOA9gDScU9Sn27X36WrKKOOEvVw4?=
 =?us-ascii?Q?w5dHDtKboL2Hj05psUSbzWv1AxxXmSi3/ZIaT2M5faYZ+GnxcRy/U5rh8Zm1?=
 =?us-ascii?Q?ROb6MP7LHlitcFjTmoMOBvA5JRxfpt/T6JvUKIzaA7mZrTRolt0P2GWU0n1e?=
 =?us-ascii?Q?hwfFuPg605hPrTlmHR47VK/Ya4KbGCuphMg6b1jzQMMNZgHYeb204YLgIUcz?=
 =?us-ascii?Q?NxOuph4TZfnSoUtW2oL2fkExKh5+IwS32ih8tnI9v8len2TkSkCLboLdceTq?=
 =?us-ascii?Q?HZRJt09vKl0HT0Ei+ziZ1aYhEDgm6VZ8X1/scG7U47ZBr2tidbrEKphzTAOC?=
 =?us-ascii?Q?nEuCmEkJiSxB5j7YKXyC0POdr3F8eyyEaztdgeCR1TulwReDY1hjW665qwuK?=
 =?us-ascii?Q?VhsHAewTsahaejpt3vBuwVa8EnM0AK9ppFOnqNztYZZQOaOzALXQxA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gfzdDaScJx6x5gvRL8ZA2pwB1n8ZjqfFZqhEG11lrG5n72jYIbow0zlioogx?=
 =?us-ascii?Q?kiG1XAVKQATEU7lwyywJCFm8UqfWe+wsWvxCY/XIj+AAoebxG9mhlublINYy?=
 =?us-ascii?Q?b9FqKqWAKyuqxNlGzddTMSbjF8b4u2w4EPYUUZlspsfWcOs+hL8tBxLzFFM9?=
 =?us-ascii?Q?QypbKreDnmcLf0IzReDRClUDxMnLKHoVlnDoNM4VT/N/8y7VPxyNbioAp9BI?=
 =?us-ascii?Q?nixvkvP7jNzKcy9vkpn+yZCQaS5mOYTul0ATgBuNZGr8CjKBQm+em55xttxS?=
 =?us-ascii?Q?TxY5osdg4xfRDeVNpiLDZeZ8zTZlseAnMNTGXVQrDuZQQbKJAUyCrk1/mvx+?=
 =?us-ascii?Q?giBthG53qd+SGHp+/4Sc7GXNXFtNC+BfPcQ6Qn3cKPtqzm4N823F8HexKqkp?=
 =?us-ascii?Q?nClIhTviSG86xJhPRmfm1LTZTOo3vcxelrX/g8llVaWpDEshHbbu5EmWp4Vw?=
 =?us-ascii?Q?Pu8pcAXdBuuC24yQiQAiBT3DHeRTjOkGeQCiCLQCmUK6TLK0BtvFlMHTEzJP?=
 =?us-ascii?Q?mXFAoIoMSiH0WKoukuZMF2LvJ+LvUiNOxmUfc2FgeNe4RmzVfYi19pRo0CDl?=
 =?us-ascii?Q?xTqCDTClZhGrcI49afLtCOFtvQ2mSRK7/D/t8ItDMfaroMbrlHxTiZ3mbg94?=
 =?us-ascii?Q?Hukk08a3NiMslsG+AApd9V/0KH2yjCO/P+O6m6Z6v5VPL3s6+kOaFWfQPzz4?=
 =?us-ascii?Q?/X7ksWQeMcI2sdLaHdxJg33A6mCnfAFL/IS78OwnIoI/YhCXd68N88/7HdpZ?=
 =?us-ascii?Q?9ESL7E9gtHCR6YMaAcF1St90AvNdq5cX5y+W/sPGTDPxMF+FRl5k8Iy4yAEu?=
 =?us-ascii?Q?kLZK99B4uxgYqc//NOJ4ouC6397n4V/w1pvGfr6wW0wXEs4cpGD1njesqjN4?=
 =?us-ascii?Q?8RtiN3YYQ3gXWLIOkXJNm15dyv445CWFcd0qrYPMQIO5fRNdYwFSc2K0GQxT?=
 =?us-ascii?Q?KVQX4ezZZAL/97xo0WcvBiHrd2CIj+6gBr4+phtsMnq72XClwBEVfGQHSzyM?=
 =?us-ascii?Q?Soh5+xsy72x2zN4y6gtaxFA8iSPPUS4we6biTj4ILHxgq1ApAhuhtEErDkiv?=
 =?us-ascii?Q?/WUMqFbTrGnAPT0VRQojk+fGdRTjdIvURB3bgPgkljUIVlyMTB2NEfQ24Lml?=
 =?us-ascii?Q?SPcxRLMlMsnoiZOQcHXv3NH1FliypGrg4lzaP9ltM5aCRwID+uKOJS+cYXeT?=
 =?us-ascii?Q?ma8aWCVdT5MlBtlRodEkiBDBqkJonSYWjH76LjT9XCFcLR4boLI/AzTa1H8E?=
 =?us-ascii?Q?UAkV7RUl2Fn3k9gzEpBa5eq3MLvCMWDCZQ972iExhQOLnglh4dcCvCsS1Ado?=
 =?us-ascii?Q?Q9FsmbgfQqYS9l0H83GClGEuYaQO3C0fSRmHfkHaWo1zs70264hQwMDqRc5p?=
 =?us-ascii?Q?PPGgCJKWs1vlJd6jR5nPjGx6hPjneeF2rwnrym95NWTw3s6wKlid1CzdNN4n?=
 =?us-ascii?Q?9Ek9NPbu55gW9MPqqnFz3pnGO/QWB+gBvtYf7SJM23oDWTdZ500kKHW6JMBf?=
 =?us-ascii?Q?YKibYV576cvWzT8oOamOU3RPmV9SX8fp66UUimajr2RmsUj1YlaZyrVUoUzL?=
 =?us-ascii?Q?uedBX1d+SdeJIOI0R44CCjRFG+IECzv1PpHIIqdC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6b2bb0-aadd-4590-0547-08ddffc0dd25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 01:29:57.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcF+nj75dRmXEf+wXmAm/VsHavuKIrtbainBGslInkVvoggRlb4mNpl2eYKxeG81CePZMnihnxcbN6u+0qxCLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8398

On Mon, Sep 29, 2025 at 02:26:01PM -0500, Tanmay Shah wrote:
>> > > > 
>> > > > > +	res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
>> 
>> Please have a look at this condition again - the implementation of
>> addr_to_rbuf() [1] is checking for space differently.

Tanmay,

May I know why you want to compare with "MBOX_TX_QUEUE_LEN - 1",
not "MBOX_TX_QUEUE_LEN"?

>> 
>> [1]. https://elixir.bootlin.com/linux/v6.17/source/drivers/mailbox/mailbox.c#L32
>> 
>> > > > > +	spin_unlock_irqrestore(&chan->lock, flags);
>> > > > > +
>> > > > > +	return res;
>> > > > > +}
>> > > > > +EXPORT_SYMBOL_GPL(mbox_queue_full);
>> > > > 
>> > > > add_to_rbuf is able to return ENOBUFS when call mbox_send_message.
>> > > > Does checking mbox_send_message return value works for you?
>> > > > 
>> > > 
>> > > That is the problem. mbox_send_message uses add_to_rbuf and fails. But during
>> > > failure, it prints warning message:
>> > > 
>> > > dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
>> > > 
>> > > In some cases there are lot of such messages on terminal. Functionally
>> > > nothing is wrong and everything is working but user keeps getting false
>> > > positive warning about increasing mbox tx queue length. That is why we need
>> > > API to check if mbox queue length is full or not before doing
>> > > mbox_send_message. Not all clients need to use it, but some cane make use of
>> > > it.
>> > 
>> > I think check whether mbox_send_message returns -ENOBUFS or not should
>> > work for you. If the "Try increasing MBOX_TX_QUEUE_LEN" message
>> > bothers you, it could be update to dev_dbg per my understanding.
>> > 
>> 
>> This new API is trying to avoid calling mbox_send_message(), no checking if it
>> succeeded or not. 

I think it may not deserve to introduce a new API. add_to_rbuf is almost
the first function that mbox_send_message calls. But if Tanmay insists on
adding a new API, I am fine. Jassi may comment more. 

>> Moving dev_err() nto dev_dbg() is also the wrong approach.
>> 
>
>Correct.

The caller of mbox_send_message detect error value and choose
to add dev_err or not in caller driver, so I think dev_dbg is fine here.

I would appreciate if there is explaination on why dev_dbg is not correct :)

Thanks,
Peng

>
>> > Regards,
>> > Peng
>> > 
>> > > 
>> > > 
>> > > > > +
>> > > > > /**
>> > > > >    * mbox_send_message -	For client to submit a message to be
>> > > > >    *				sent to the remote.
>> > > > 
>> > > > Regards
>> > > > Peng
>> > > 
>

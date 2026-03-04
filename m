Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1748132ED54;
	Wed,  4 Mar 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636983; cv=fail; b=Guc0+rmARjPfQMaee880dhZnhc3O1ZKGveNzt2L3YNHB4gRMlWMOaOlEOkQSQLR/vfWTijh8YO5qkF5z0apUPIY3FIx/ZIWhYamMBTFESfsMWsU+SbWaWb4VvzEeH9imEO3fiml5bIML7QXDRJ5z7vvr7VUySEfXlj+IM+O2kwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636983; c=relaxed/simple;
	bh=PpGRt1Lh4wzch+c9M46W4RYLkZmmkbKPwdEj/2q6VA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZxU/Yd9T70qv6zM563g0QE9FDXHe5MDTbMkX8pEeDXX4183JOUDJgjwWxy018H0xffnPmXlYW7ctAypSVjw9N4Ig7lii2L/D0mOABAABex17aARNa7jACrBnh9BFdTdqkTQ8khXurxsKkPqHFjfK28CSEsor/CzfTA67PEcTT0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Oh6ZRWBd; arc=fail smtp.client-ip=52.101.61.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Oh6ZRWBd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKL+nioYJ4U+odRikddnN5Stg4Zaanijevi+PMTlyt0Yh1E7VHvBVLZjAGDElmFCONv2y7/lpOENiVOKD/wPd083Anjjg/tn0V8znim7eJ+2GcuXHz+H8x4zKlb2nstBbB/Qm/i5p5EvrwsVoA50mSe6BvvC0ryXvDkgNi1CNDB6AqsdiJwFfzgmPll8atO8Ass9sPFxLJI+M3MpgBjtBKepN+oXDfUeSt1FDOsgNCa54gml5QP8XP/0kuB5g6tFKvomhwzViuu65XPfVNClOh+lyQD4cJrQYzRbg0gNreBjnVft+v/gekzyoizQjK3VZ/38Q3M4qXQy3AayZO7Okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v53kShnlc2StxvzL17mkso6zI5Tsg84giXBvYT6j2h0=;
 b=oBoxff163uYpCej0Ipi/P372u2IkkJln72Xu30j4oSVACVoCmxT/mnlCxcsH9bpI9dL9m5DyHhJ6CslPqGqkiZcHulULHW9VnrL2mst8XfJ2R0lCr64npVM5//OXl60zdmYrMD4o4gUug2TN4mYlHVbOr6etg47oRC1mWfboJOzPlqbNbPXJeTEQfHANbceqq3b5L9VFWNGsMGpfN9WOa1DWbRk+Ojbw7w0/Z6WY0wqVIPhwFoWccp6Vr8acL3SmpiMHwPeHrjVAa61Io3lmu0MVoUqESYLND2D510bUkVDW2HwnB6oKQwv/FA6cFa2kIWt9nOh6Cz8hFJGAs1FirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v53kShnlc2StxvzL17mkso6zI5Tsg84giXBvYT6j2h0=;
 b=Oh6ZRWBdPH6J7FRs0/zawPZV98+ZtdHZ6NRssHURpI/kC8ylDhyZKh7RN+xEpwdd0mDcVYZyzgd9bEl7bu8fKAYyDIrGU0aauT1W2Cw6giSxSz/NhNkfAyfN1l3+eR3G3Sj+4jTCiJgTOUpiIBqyeTSXxyyuRgHxLuerNBlvUQM=
Received: from SJ0PR13CA0011.namprd13.prod.outlook.com (2603:10b6:a03:2c0::16)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:09:31 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::1b) by SJ0PR13CA0011.outlook.office365.com
 (2603:10b6:a03:2c0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Wed,
 4 Mar 2026 15:09:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 15:09:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Mar
 2026 09:09:29 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Mar
 2026 09:09:29 -0600
Received: from [10.31.206.142] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 09:09:28 -0600
Message-ID: <6fd87385-1b8b-4b1e-b27f-b06f81096b23@amd.com>
Date: Wed, 4 Mar 2026 09:09:28 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] mailbox: add API to query available TX queue slots
To: Bjorn Andersson <andersson@kernel.org>, Jassi Brar
	<jassisinghbrar@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<tanmay.shah@amd.com>, <mathieu.poirier@linaro.org>
References: <20260209234430.512492-1-jassisinghbrar@gmail.com>
 <jo4kugxook5b6fl7ifh3nuznehotkyqwnrgwq3olank7cvzhmj@hj5ibm3bbsln>
 <CABb+yY2vzczJ8ODc22P4hCDn1=epki9aXgJCySumeADBuHgaKg@mail.gmail.com>
 <nelghqxyuwelah3op6ls6pflm5ujwayfzuchode44vjmagymmv@ptisap64ewkl>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <nelghqxyuwelah3op6ls6pflm5ujwayfzuchode44vjmagymmv@ptisap64ewkl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 89fb2299-fa44-4d0a-94f7-08de7a0008e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	cwdHgag2qcBOY/3yehy/FCFdQbNkcHbiwSecDr9vqz4uWUNcYjI06m8BEDMm3b09y0sTVPHTPA8pyviebBrw0r53MxYbb75AOpnJbSozXRsLCDXgrZH3aTTsv4SDMOe1lOcGcj/Icqg4QpCxOz4U227MnFlqJyddih4eqK2ZtoXFNta3E05b0K3btnx1YE+hVa/KqAMRUyjywDXPF+d0Vct9krYtLbgfWO5i89llkKsOj8aTaU+FLlChzGsWs1D6K+x0NcFwRn/1nP2DHIYEEEGNMBstaNzNHUdwymPLE/hpdYDtqELcpeIjfqv1kAJn/TArQvwO2mULKtibeRGDVjeqkCLlrYY9ms8+vUmzFmutq2T9OSbhe3mzJAir5N58nZEPJIrfmTHfE1eTsJF4wdmVukZw57IG1uIwqPbX5kPMFgQZWbOeczpQTx3JmvM36WlKo9UeZlp/yM/rIkoeXotmfZHGKa1yHAO+JyAoxFoqqhkP29wBgSf+7gtF+lJ9LEBgOzuDOgCkl+fbD3fFe9exW7oPo+R+I/tG5KK3zxg8vPkgoEW2TG7FT1Ef99Zj5aj60Zy6j7K1ZafOQ/5KggNtnkx1JSLdmK5RMeH6H6WWBjRcugVn8wTQfavRmCBIrD+3nkci1aQ7+XfTRFqGC3JCnmPYmOb/mdiPDlwnDbOT0qgSYJNc0Ywg/h8qu3curcXvGuvbNzq7TYqpgcRjmP9nYw0ETdD9BcNyzoviF7KpSVtkzjr4nhpqpGSxh8wOd8T1K5jrQM8w4cS5PadsHA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dZcUC7EW/ZwV0c56zJlfMUksElrKqXRtQyGwEiX/d1ZCM0O9ZGq2VtwjDR+zzYknukTwFqicQwLyGoveU9f6LEylacURErekiokvfzv20UG9AUGlDmy1Ivn4KIhmeKa7MuzRqABDJBtlYtgjszQ+nAV70m2h+t3/4ipmDRW+xvE2Y9XHmi74JTRD4CzQh0/eWheAVa5cM9iz8xMgQugrrjZ9azWcMyxgSxlyiJ21UVfH+NRNxKd715Ayot0FuX5nRq/2wty5vFKX/MHrOOnPmJ4F1v0lK6On8tAALcHLGHQeT5oOlNR856CZ6nrxhoPwy6lDWYTr+XuXIQmHs2sxZD3n+QoknpTSpp9nTooaVzbKUqO29WYQcil0BaXpIOWK3vFIjBTiDW7O/vM/CqhzcOPMn2qrc9WkwNGyuzku0N2O+2EU2I8uqX/QX3et8M8K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:09:29.9970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fb2299-fa44-4d0a-94f7-08de7a0008e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174



On 2/26/2026 9:53 PM, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 06:35:16PM -0600, Jassi Brar wrote:
>> On Mon, Feb 23, 2026 at 9:29 AM Bjorn Andersson <andersson@kernel.org> wrote:
>>>
>>> On Mon, Feb 09, 2026 at 05:44:30PM -0600, jassisinghbrar@gmail.com wrote:
>>>> From: Jassi Brar <jassisinghbrar@gmail.com>
>>>>
>>>> Clients sometimes need to know whether the mailbox TX queue has room
>>>> before posting a new message.
>>>
>>> This is rather vague, could you be more specific?
>>>
>>>> Rather than exposing internal queue state
>>>> through a struct field, provide a proper accessor function that returns
>>>> the number of available slots for a given channel.
>>>>
>>>> This lets clients choose to back off when the queue is full instead of
>>>> hitting the -ENOBUFS error path and the misleading "Try increasing
>>>> MBOX_TX_QUEUE_LEN" warning.
>>>>
>>>
>>> In the event that we're using the mailbox framework as a doorbell, I
>>> presume that the queue is full of duplicate rings already - so backing
>>> off it perfectly fine.
>>>
>>> But in the case where the client actually uses the interface to convey
>>> data, what is the expected way for the client to know when to make
>>> another attempt?
>>>
>> Whatever the client is currently using. It just backs off for another
>> such signal when mbox_chan_tx_slots_available() returns 0.
>> If a client submits periodically, it will back off for another period.
>> If a client submits upon receiving ack packet for last submission, it
>> will back off until it gets another ack packet.
>>
> 
> Thanks for clarifying.
> 

Hi Jassi,

What is the next step for this patch? When it is expected to merge?


Thank You,
Tanmay

> Regards,
> Bjorn
> 
>> Cheers!
>> Jassi


Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010025.outbound.protection.outlook.com [52.101.193.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA133985A;
	Mon, 16 Mar 2026 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678600; cv=fail; b=hWlo/oR3zA7Ny5NlX8JdysSbCTSS/TW994S40ty9ixvgErE23zTCJjZ8m15Qbv+qO1AwVPlUP/bER1GEkSJid4EoRwkX6IvD1e1OLP1GKXOEyVPGVoZNwKGoUKATAVoCD1ep4q8xJPPHpkldXbwplXSHAUFqxT9SHaBK9U0YCJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678600; c=relaxed/simple;
	bh=Ojbujoj1COiYbxcplzVrvvvuULFRYFcraU+/JlAs1Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NfowstCkBWTDQpNJxgm2XMRHnHHTJd0EBUPEU/6JgqpHBmzpmD4yRg1VimsHEgAq8fE2PtzhsbTWeV0XdvUvX88vcWyPlDy53uOBpagyTeExTA4HGXkDoMb7x8OXd7al+sN+PQ8/Etrzhu9pwr+cpqwxnDUxTkZ34BH/PSSG0oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xzVj9p9i; arc=fail smtp.client-ip=52.101.193.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xzVj9p9i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFuJ/TinCwY6NtH9417B47PyyNjY1u7bKYNZWUD4NWOenVH6TujGFM3otnsjHL7j4kcWd5vWbNW9PyLTfouQjjMuZ0qZL0C7WTP0yl98qUG1ILiCwiEElO2inGGacZ9Z6z0us6EKqgOjbmLhRX9lvuJehDXW6WoolkbNFVPxXThWu5vwrtddhXcc+vIVMlwozyvrfszLRr7k6c1DKzasv8vM0TEgjHiL6nGqSpJEPl1lqdCvUPgNrJX5RObYLiBC7aaAA80Do2hohqFRP0U0uTQYizdssEQSFYj5BUOcRNTG4SJDmE7A58u5TPY2NSI5vw967f9j+4AXjU5anNQYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8J2vslMq9BjncBV5iKY8W6oC3lN7TMeHNxazT9HvZw=;
 b=gO9wBDlfh4dUJbcuw8HpEG4A8+neEOtLXfrmxD6A7Frd3QdBdSZKYnlUKhaqB77yDDkLak49554OLvC+hqRlGOK/MtTGPUhWBQSpUb+3gnUHBJhogAtfiIjjt7pNjI5Y2EMkU1CU6uZbuiMpsIx+Lx6GuARYiwbpsCVTIaWEon4J4TQSOwIWRGagYSAkCbSwUs1nHe9FMjKE2VhZp0ciV1prWekGRtakmx4sQZOZl5TL25lLHsJ1lNN3TNydbpqaBwPLEojCLgvqYVR07cmm61VEKYuRkwrsE75PO4mnPahzfjxy9IJxzoMFoSn52gTwbwpfDrJuatnRXpANYNF3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8J2vslMq9BjncBV5iKY8W6oC3lN7TMeHNxazT9HvZw=;
 b=xzVj9p9ieOClgDQRXmYQWx1PNLPNlqamCrlWa56W+IvJUInOMsWTXJCpk7AY1vInlwJotWO8fV2ZmusxvAK3s3RmcwTdAIwLVmb+PhuzRtFKkm0mdQWJSeRrXkp1GiKyDtoTzJRy7IAx3OLzc6kWxrubXFMigVQJwVoZ4f3MXZA=
Received: from SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::7)
 by SA1PR12MB5670.namprd12.prod.outlook.com (2603:10b6:806:239::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 16:29:51 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::ff) by SJ0P220CA0001.outlook.office365.com
 (2603:10b6:a03:41b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Mon,
 16 Mar 2026 16:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 16:29:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 11:29:50 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 09:29:50 -0700
Received: from [10.31.206.142] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 11:29:49 -0500
Message-ID: <dcf81aa3-a50e-4545-8d6f-7885c6804e87@amd.com>
Date: Mon, 16 Mar 2026 11:29:49 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: do not send new mailbox notification
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260219224329.3475032-1-tanmay.shah@amd.com>
 <abgfO32Dc9QbgQau@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <abgfO32Dc9QbgQau@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|SA1PR12MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: 6443c6a4-f7fc-4d0a-5657-08de83793f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	/h6KmUGYaG2+7UFL8jy6ehvYrbrIRM+E3YTvGy2/rcu/8v72hz3Z3CqcjYWAatiNZ4qFl/LIOv4gUNFi4md34J2Gq8mKkUvy/y/FYFmbNS+lC/1q0762/wFDimegECuIQhSLRoaHW2Ab+7d/isxQ1MI+RidP2hMQW4leYJ+3AVNex01PcFssdMXXzB+SoBgCQ6DdL0k5PL4U2yFlBhduQ2o1ZEBw5E9Z98jHHAsuVLcl/50folz7IRzJvF9gnNLaLmjlX3IqHfmXxWFRMp/AoPuqmMDxpIw6uwuyK/O7nFC+UK3C6Cq+Ext4KThGFtgD49luan99/omhbtbu/+7HLtXCqAt+JwweVKf5ZNL8wQIjT3o8StWbK8Q+1SWWS9Ps6HJoc3zaSZMNgvbkdA2Z/p+aOw+nQ0D/CU3KsaR9YUL7XsZZxivHM0oM3k/td8iXYEgfDERlFatlMrfw5HejoMRJG5xZjM8u3+vkuK1wHeOe4wf0ye5MFLNgroCRI3sq2CJvRSzh0FB/NksDh2L4KV3EU9LpCJEIM40hJC+MHzZeZK60pcdUKYt2VgROdeCxKo7JXVhYx5HsHMGsvQJnmj9bF8Y8FvsCDWf4oCvf+NLgZAz34lmnD0IFmPc2BlCuyGAxvBbORTP+1oVZMASb9oBMUHoM0qamJ5wfmZ16jr7moZXqQ2AwbmDj4GmGxTyqWpcEg50TIkVC6/L/Va7frqQGcsjZbZ/9eBMLKk/V2YA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KBu+oSVAAyQAuS1m7Nj+JID0taEOMJyEVQbY+I2Igb1tHV56Tm3t96yWUtch4pToEpsJHxf1sW6ScFIKBsSYanNiur/+wsQUufM+4MIMGZxEyuRXHksdYsk00NthSHLwZeGP4La8//4qt4raT84mDG1UzHlZZsw/gbVrEICiLWjLNhvvw8c8+nW6nNe8egm/isxw0YvM8GDavoVWhXQbqOkSiUTKWFQxQ55A164fHOK6f/TFYoc19ZCRNtQhzewIpQUIHNWCCCrjpxiVOWxUeBZUtEGx3h4BERz2nvw/H5JURlRh6xNdEy1eevc+gPszcQCNBfJ0uzuLljgVBt7sdWcMRhNVNuZtUbIUv+qba0dg3kELKMd9kBde64PIPrEGknZq7wUjD+FnHDNaw8yna9X0iyX9PQIV8RRqTBAeyHDX1YDti5N4Rz3kUuLBTL2a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:29:51.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6443c6a4-f7fc-4d0a-5657-08de83793f71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5670



On 3/16/2026 10:18 AM, Mathieu Poirier wrote:
> On Thu, Feb 19, 2026 at 02:43:30PM -0800, Tanmay Shah wrote:
>> Only write a new message to the tx mbox queue if slot is available in
>> the tx queue. If queue is full, then do not send new mbox notification.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Depends on: https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/T/#u
>>
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index bd619a6c42aa..622de733c929 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -332,7 +332,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>>  	int ret;
>>  
>>  	ipi = r5_core->ipi;
>> -	if (!ipi)
>> +	if (!ipi || !ipi->tx_chan)
>> +		return;
>> +
>> +	if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
>>  		return;
>>
> 
> Is see 3 options to handle this situation:
> 
> (1) I can provide an RB for this patch and Jassi picks it up in his tree.  The
> downside is that if a subsequent submission conflicts with this change, we have
> to wait for the next cycle.  In that case:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> (2) Jassi provides me with a pull request to bring the patch in the
> rproc-next tree.
> 

Hi Mathieu,

I am curious what do you mean by pull request?

Jassi had included remoteproc mailing list when sent the original patch
here:
https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/

Since then no other change was introduced in that patch. Isn't it enough
for it to pick-up for rproc-next? I am just asking from the process
point of view, what should have been done differently?

If all looks good, then I think you can pick up original patch from him
for rproc-next, as the same patch got merged in the linux-next.

Thanks,
Tanmay

> (3) I pick it up in the rproc-next tree in 5 weeks when v7.1-rc1 comes out.
>   
>>  	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
>>
>> base-commit: 462799c088e71b2b8a511c2a9649420fcb569ab7
>> -- 
>> 2.34.1
>>


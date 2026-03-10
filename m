Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC240DFD8;
	Tue, 10 Mar 2026 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158710; cv=fail; b=ii3mdKIMnoE+KOSohxExdaPMV/kkJJFRBx1tl73ozdNZLbgTW/N5AgJRJRR5CTn0XCXkgJASELU3SDnzk4A7un8rOTzDF5972VqOLzZNtybthfZ3aNBQBEcajy36q5IYhGriRhxDs0b3o01PstljOFg3XSkjCWnzl+yHHoFVhJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158710; c=relaxed/simple;
	bh=4h0OyDbBmH0De5aTEApHpxfPbwwI2qGQXJer1AbXFxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S3A0NwGGQZ58pDJ4wpTAmK2YbnryyukMc4ztrPFN26jZ61x9hUujJ1f8ZhetxIE+6JKVYrQq/THMjyEo47Z3n8vEWCxVO6c6gNlio2jVZpnqzTSa2IiTu3s9TRZw1nFZn9M/HRSz3JHoaFhwtRzomSA68bOJX2yNC9e+x45JYcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wY+0NAhK; arc=fail smtp.client-ip=40.93.195.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wY+0NAhK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9SN0NArkfVIcCe6KrG1VUaIhJjaC/2fYLZkWZa3cRhxpL5jPhcHmh1l9W5aOskVGVAddNlwFNrysZWLwUVVuLCCFqe1n8XzaYWQ9wosSbs7nEuPFhsoxVeVsAWvTuuoiBAGfXacl7P7e9YWscfEw7LnmUlayWCnWFWal3jI3QvbID4WAFAkbmBEJi9SHDx+DKusMLxz3drq0rb5/0FTXd+WMIyopwUHOX9j0nFOKRIDnIuhiRZywbUB6cRnauCx5MitU1fQdCtA6RYhPG84s5Z38zrtJqLW/crN2u+52vnG7DOJq/86/HX48PcacJh2KSB5iwhvJwRrJW/Rd+58VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BblxHM362VhzcsIzrHI5S0s+bDClZTIS3liD0Ivvs4I=;
 b=V+PP3NHpOMvE8kaejOy4PEqrKrRuX2fyO3X1Nwl0eYOMDdKWekjZgNwD737enTjokpgaSoIiJaP9ENA833shi34NSWVvWPgDy5SirE4U752Oy8HZV8N0Jek5pKBeXh8/fCoatkng47I4kkdgyppCNLn3iiqZmx/WKCUwc78zxjpWf2U0/CLipErg+1D60NndHIuqNaoMkv0YQs8uxDuA0v9bCfrXGaQYkYVF7lPdjtqwhh9wwllSsgRWLLfsF10OQSyzYrY22JSaVMGNh18ziNhgDDrCDJP3coxX7O8RcoIto2oNs3HzA0YdNvOhMcGeiTPI769L/k2jhp8bqs5syw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BblxHM362VhzcsIzrHI5S0s+bDClZTIS3liD0Ivvs4I=;
 b=wY+0NAhKjCOr+szijZzHeFvxmJ7pJAGAKNXMDiu5qhy3iKLyp1lidYDNKWdItfZGjCWlNpkH1ajXQUqvdeYqjTgmmeb+xP6KsPhVMGdqw4g1638gwx/ZiZnbH1gtcGgpfMwRs2k1Oj7q8eQpApyF47op3bDNxnGH8vXyaOmkCkk=
Received: from BN1PR10CA0024.namprd10.prod.outlook.com (2603:10b6:408:e0::29)
 by BL3PR12MB6450.namprd12.prod.outlook.com (2603:10b6:208:3b9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 16:05:03 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::ee) by BN1PR10CA0024.outlook.office365.com
 (2603:10b6:408:e0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 16:04:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 16:05:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Mar
 2026 11:05:00 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Mar
 2026 09:05:00 -0700
Received: from [10.31.206.142] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Mar 2026 11:04:59 -0500
Message-ID: <91a3bf88-cd64-4f3d-adb6-5e21558e8ff8@amd.com>
Date: Tue, 10 Mar 2026 11:04:54 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 3/3] remoteproc: zynqmp: release mailbox channels on
 shutdown
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260303235127.2317955-1-tanmay.shah@amd.com>
 <20260303235127.2317955-4-tanmay.shah@amd.com> <abA4wGI7DvQLhTzY@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <abA4wGI7DvQLhTzY@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|BL3PR12MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a62556-0783-4b4c-1f2c-08de7ebeca2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SIB0b61EgVq/sIGZJ+QvFJ3mlSa8OobazyjsWWr/difriu7ZtqLqsXWZ03m9EEdPKokvNq5H7+2OoZjUUc5zqN1Rgv/38Evp/8lH5jbj8uKvBKppz8WscM1iFA4qp0np/LCcoeXq73T0udSB7k85NPjRTuG+eEwEmH22bUWZlb/TEmKjgBBQRwnXWrGK6JrMm3lXE9ZjKiWoLaRrYUN0uR5R2/PUaaYKw1FAw35ZRkEN/txNNpztuSPRV0KBP3QfP2rGeAKIluKe0+M04vh9dCiDx6br5imDih8c4Y4logqxX7EEezqj0AIxW9mjpSARGxKws3M83KE6qKXPs+ApS1XnUzR9KqDGJIpr48YHSCRsNWbpEPj5A0IQiHwdfnhw7WnHlVO/dOtQXSDS+ylf2j837rqBsuRbQqLZmO6affa7zkZuTdWIAYOd6qu6Q9OgJMMQZOHr8vpm58nIQ08cBhwAxsN79XeJp9shnMsZG8xzJz0wBgpCAdL731aSxHc0TVKyuf5yDSKQpH2z38tJUSVr/fewi9gw2qAF86i5aAKtSLNl/q3JgObMrN9vsmqLHXDgWxOJgmU9l+2scP7KliDLRW5de+BCZCRA4a+uugpzqV5GU9E/yqVnhgvWeC7PTUb6t0HuRfMCqYmFqjEdRyHOT3B8/CbPH2pKOYjpTBOih2SWouloZsPVXA6TJWrccCPbX0jpPnKupCGFxQ6N5V7AYpR89luTlfrSqlEjrWqzRjIDLI/yhM9gBoF2bpWM/28JTqxQo/M6of5Uruo0jA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rvgUfQ4CZ/A2VIzpIHxKhUTJVs4c260F6V1FbYljzep3zarotagUdVYotVLPFQsf89moqIMttHEyvA8MAhGGNGL/N14DJoO1p2G1BJv3r3IaC3cLGttU0xtCx3ubnRqFn37/RmW3xOmIT/bGTyHhTzF7ChS+U01Z4QXyk57K5y2gCIO+aWwpLAoJP8xsgPyyM2fby0/Mr2xvF1GrUmWe4QzL+EPe8Q1Qp4zD/oKwEQMOZbewBFfdLL7DEv1QzuyrNipnWqSPvA1jjLe8aXnnTK4OQ5DlvGZDdk1KWKYwvxvA20TZ0Ze/+HUe+5oC35FDfHkbDtnYFwLQCFLMnJ2JhExkgEVW54V3Nxe+0aAfwX2WuCQSMIJ8wPfIhat7BQsMPsHxuQ9+OcoFsSRvIhRsTPps2fRTYpZF1mOqlT44OOZ04VYfzb2EXQ9g+m7vKz07
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 16:05:03.3647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a62556-0783-4b4c-1f2c-08de7ebeca2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6450



On 3/10/2026 10:29 AM, Mathieu Poirier wrote:
> On Tue, Mar 03, 2026 at 03:51:28PM -0800, Tanmay Shah wrote:
>> mailbox driver can't introduce shutdown callback, as it might endup
>> closing mbox channels prematurely. By allowing the client driver to
>> manage the shutdown process, it's ensured that mailbox channels are
>> closed only when they are no longer needed.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 5e92dc51f1c0..50a9974f3202 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -1490,6 +1490,8 @@ static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
>>  			dev_err(cluster->dev, "failed to %s rproc %d\n",
>>  				rproc_state_str, rproc->index);
>>  		}
>> +
>> +		zynqmp_r5_free_mbox(r5_core->ipi);
> 
> This is already called in zynqmp_r5_cluster_exit(), why doing it here again?
> 

Hi,

Thanks for reviews.
I think cluster_exit() call is called only during driver unload. Where
as shutdown callback is called during power-off commands of linux like
reboot or shutdown.

That is why I am calling it separately during shutdown() callback.

Thanks,
Tanmay

> I have applied the other two patches in this series.
> 
> Thanks,
> Mathieu
> 
>>  	}
>>  }
>>  
>> -- 
>> 2.34.1
>>


Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97158521216;
	Wed, 30 Sep 2026 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805575; cv=fail; b=cwEXmB4WJvhRJJ3T/V9eqyIy1KfHkpRbFT/H7ygY1p/g+aqlNrIGozPTeqnoWruLi5cr1vYsigj0ZCa7VGygznoXrrh+Rb6l5FbITLL2a8fo+rjBF6UKTfnkMgfPbhFwqnMcHjnoygPlnAPkpykBF4/duJPd3z8rPLU71lRQYek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805575; c=relaxed/simple;
	bh=aGmZFW22sfE4sSERtJrpM8gvBDTGflUKqyl4Vp5VAE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eRQ+asV4paYlvisEBpqwefcW4khw/cKhc22pJDhP6KgezMb4qvBXfCMM++24q+0JEXgWLmHkd6bqo3pNSv9rpZluW8PTHToCDRWuIfgr0wM9FaBGAegnIZFsUpltPdSvOJatLk6y2k4+YvSnLTNb12NageIPA21SKcXzxNq2bwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Cs90Jy/J; arc=fail smtp.client-ip=40.93.198.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Cs90Jy/J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkAaX6WQuh/STDL5rGhJGH1tUnXGDGZ3R72qnFsjG8mch0w8MeEDiG/2rYH+P+fr7FTKJYay/WPN2M542H6UA9gC32YHICUTIMmxMJOMiw+76ngjar8DRDS5AuHVQCJl3jkNJIkwikJYcmPQHLkjFrlGJB5g/iZ4yOlHE7P8KkYjwOXZxgM1xcChLBqs1wp476Ykl2B/vANFxr6y6EOPXX+fUQ8zr5Za/P03JQC1awGR9Kqu7OuO7IShSJmYnzXK/wR8AvLpRr1tCNtpKh647Mq/VINln6HUFTbo+em30ls9XgRgfUb1q5Qekndlh2Is2UNKW75yO7CIUxg2LUNM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7Ot/8/uHwozDy7LiXhR/xVvAiuRIceJ/kfOPBcAFZk=;
 b=lZShDK4he6jCdd4nfuv4WBsXivUgNRvop3lnQR5pes8nadJhaqHLox3vxePGMOS4PNjxuB53D8GHT9UUEoNatgVtpcRj85YGor4R4HVSFd41/XAtNs8+cWdI3INgEC1COhgnqAXJbTF+JXwO6oZ4mUV1xU0maSL56ZCOJA3S5hSBaTQTBOaTQc5ALC+gYDx033E5uMewcS+Vx/C537n82VL8XWipNaU6j4Kb+fYz+ObS6GlJj6x+IOWRIWSmfncQE6ufjP2rDrnAmZDEYqYfVGxWYxPS2b0Uedx9mGT7Uja161JNCCnBnfSaXUbovA7D4nt6op6FLIkB0SuCJ8PARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valla.it smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7Ot/8/uHwozDy7LiXhR/xVvAiuRIceJ/kfOPBcAFZk=;
 b=Cs90Jy/JyEEDu54y+6dqynIiW3Wxkm/9rRKMfvMNWZH1TGg8wP5/zFBF3zQ9ROCotQV0X2gjNzpql834oGtweT42vLn1vgufo3uOp0mpnzCYEvfFJIicj4k+CmDOCJeJ256oXfmWTVI6wmid2Cm/QsF4aIxNJhDT5epdwZs1BsI=
Received: from PH8PR20CA0002.namprd20.prod.outlook.com (2603:10b6:510:23c::6)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 21:59:30 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:23c:cafe::18) by PH8PR20CA0002.outlook.office365.com
 (2603:10b6:510:23c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 21:59:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 21:59:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 16:59:27 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 16:59:27 -0500
Message-ID: <44648601-e04e-4d6e-a192-3df6dc1b3b24@amd.com>
Date: Wed, 30 Sep 2026 16:59:27 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: reset vdev before removing
 it
To: Francesco Valla <francesco@valla.it>, Tanmay Shah <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260924205901.2505186-2-tanmay.shah@amd.com>
 <arjZvftSMlG3OMHP@bywater>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <arjZvftSMlG3OMHP@bywater>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 2799a727-e4fd-4164-2e6d-08df1f3e1949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	aj31QP4cIfA1LSj6K1CI8pJC4cpYNgk/MF30DKjz9wYyp/fXJhP2sOhnLoTJQJncv7X3jz8m8ZilFTt0k4+QvMXKoQjerju21GIw2seD9/0R63yoSmn3lzlWSs6OjHiGc6b0DFZMD7thy5/jX+4a6oIpDEhm84lIbZm7zdpFUKQsWNc8KkOWPwgcmNpUnC5qZWtxbY9xnyfycfJZFdzNMtPO+stCSgy1pC8h2qaVsaGdiTvYhh3xKFzue7XlenML42BNEzhKg/kiUNMlgjDTXjkSA2hQ/MmuPiMoIiJCDaU8dsDSx4cEjIEk5EaRyUImCIC7S7EOqDjwPUSYqQRKuyMrsSLhJUAnc7QIcbyodLftlcGwkjIawEHZIZ6SaGJFFTpyvYkT378B4ZUc1PfjT4I+LkzU+zhvqxZAbl7yI5Z4cmkKE4L9m7PQ9BNGk4YnhRmypNirUA6P7oGz2pu4HR/kywhQg5Iq/uS0Cl0c6houExzWe78b7d9U/YCJBfwfrI0zljHkrOsTvz/k9kEnd25IceIqw52gMd8YucBmLWYR4jypF3aJTHvOnMrBZ6gHkDVMrGFgJsZnd5xiTdkXdPPf6JFIj7FsLRdk3ZaTyLHrdqPmL0w/LtFjYsmpYd1hFMUuF81sHhpBv5EEGvOvXpq8oC5rj2R+dliQgDa8cIgqNJtoJMlQUIZVHo3Jb2xO8ZrfgqSYyDGzxJGhCUT4Zw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	owb70Ce898HD7HnnTlgl4ArNtXVg6kJpOMhJHvGrpSu09fA0vQAWcasWpY2bOeIxDPBwrSgJr3HGhCpWgvi2vFqZQQeUzCJ09BlVx0ofNbh/pWTr4aOqUz8pRH24g2AMiola/c5YfkJOvSvu763xn4EFLZnsAvJQPJQgLLJMcVuSH9pJ64aIRSjgCpe9xnpVvTMxGXU721go0YYeT3qzBbzLEPgBZrebNV6j3Lkje1a1HJcmax4M1i1JfCd1ZOigQIrqgM8QdruW6frXpKGB/CJGZCtNCXk+2tvuSueFkL6Kipp6CuicdIyl/feEW+QbINS1ZJBzDfUVT/ePDM8EU8Lk4X+Aolv6HqsIWZd3Nyi2LkOgIRlMqRvqKEROmKXmALYAGMsecdb7QamMiE40UUY0IDzN0FISLQBvSKlBZQAPnW4WeLF7scsHZ5T4XgkU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:59:28.1926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2799a727-e4fd-4164-2e6d-08df1f3e1949
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106



On 9/27/2026 3:55 AM, Francesco Valla wrote:
> Hi Tanmay,
> 
> On Thu, Sep 24, 2026 at 01:59:02PM -0700, Tanmay Shah wrote:
>> The virtio device is removed when the remoteproc device is removed. The
>> driver should issue reset on the virtio device so the remote can do
>> corresponding cleanup.
>>
> 
> Shouldn't be the driver, and not the transport, the one that calls
> virtio_reset_device()?
> 

Hello Francesco,

Thanks for your reviews. I will look into it.

Tanmay

>> Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/remoteproc_virtio.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>> index d5e9ff045a28..1cb0ee0ea656 100644
>> --- a/drivers/remoteproc/remoteproc_virtio.c
>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>> @@ -469,6 +469,8 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>>  {
>>  	struct virtio_device *vdev = dev_to_virtio(dev);
>>  
>> +	virtio_reset_device(vdev);
>> +
>>  	unregister_virtio_device(vdev);
>>  	return 0;
>>  }
>>
>> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
>> -- 
>> 2.43.0
>>


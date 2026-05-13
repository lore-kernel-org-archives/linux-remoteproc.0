Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2D374E5A;
	Wed, 13 May 2026 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657857; cv=fail; b=bpNC1E0VjKBWnQMRu2bqaEKZ+v0c4U+mXA3qhJ6TovPsurpWfBzyNnhBiF2QDBuVGMBzi5WKpngbPjOOsBEOlks64zRPqaC22ZJNk5yRdZfz097kvcgbC1g+benqab9ZKs8lc8W6y4nxRC5ddtrzXnkxWrbIP1v+GLwDnNfO3qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657857; c=relaxed/simple;
	bh=0Hdl3WSXUK3i9tTI7uJr9rO7ChR8sPA9rglua5KS3So=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EULNpJfxBElwHXlMlb5aF6eMqYZi/ctHKAEwm/lJk+r7NXW7jKeLbj3K/RhVMLZ0awa5hJDROzvEJFnTtTlbnLODcKU6jW6YEcK1bQH6CevcItrsM2oj8xLhQqGa2KnZoSZ39SHXfvFTyQuTB7EqL2M8egxmzpSqX0Qjaj2X3Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZO9CumzF; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZO9CumzF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8lAyjg6kLUI9O3JCBoezfREaIlKIe1w1yt052qpHGOJ1QXvx85of4iYcd7l/AxQY5N61q6C9Omb22ZlyD6+Oi+tcVVXB6DbS4XlRCl5D3l26DIhBIRrQmFqsTFBvIa5twBQQ5dq/RivDAhdHeeOdMYIEsXJneF09OCYZT3wGu3RZZeNagt634nfi6lwgoNgwQWNWQpY7SbTj0bgktFo5zeVusWfAkpIN1zAouBOC/CbB6vZ+emVBWM/B2ROrTAFftKRBqfijQnpXxtx2AEfqWEx/GlrhrNmPVwZCFcOmbgpcmSpFs3YUu+HWz3CeJ5zKWDGR9UqVUDWlRyL8hRf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5ZIz6KLruL9znndppI3AG344Bk/x3jdkQlTq7DA078=;
 b=OURiKjwQfrw5+1RmiRjHGa85pe4MakjXQTBP+JwmpPsKIPDBBcwM/FCVwD1PWKuZgUcCUdBzAEQiWWLBfpKiErf1Ohkg3epLNItbyen15bZee10+p4qKn2nt1Zny2wftM7Lygup1YXnnSflpmM+T7lJmvk5nNN9kEMMP2h11ly5b/4DY+pAIg2v7zypjdC1cGsU9zQ0x2o8PfdcluCrzSOMocSB4Hn+aWKgJ4F98uuc/D93fRME8b0lyHfj3m5gLEKEVrd6sBJ2qjsfK4r2QLFsz+26Bj0v/SjhntoxeBTvMnr83vDeL8oKZKUCE7gEBTnhTsOXeW/4ZiSIvAecEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5ZIz6KLruL9znndppI3AG344Bk/x3jdkQlTq7DA078=;
 b=ZO9CumzFmJacxxfYfTKBa3fLnv9o9Pd5/o3G5dVe+6ht/mHohn8dOfKgjtIauzOwYybjMIR3DtWI4enkAVAmrQhKLlK/YjIhu2+vilwoqzOJsegfGThVSp1wrbFDLfH2BMdUEllAp2IB5On7DrKRKAlpJPXDkNkQUCXLwndZClbJTgAq5izgf7QJaOh577w7x+CAQaWXWxG78MJfSCWrAiGWzdGasxpxfi8QUgbxp2XcSOlZvkPvzRW6XFQR7qkFyAdFQLrK8fYIH1aqn1t6yRoUqEgZS79bz/r0E9Pss13BLo5zi2tZXfgWQAnSLJL8Iln6uBOt7jAh/WWViq9d3A==
Received: from AS4P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::20)
 by VI1PR10MB3981.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 07:37:29 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::fb) by AS4P190CA0010.outlook.office365.com
 (2603:10a6:20b:5de::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 07:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 07:37:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 09:40:54 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 09:37:27 +0200
Message-ID: <a933ca19-3ede-4708-aa00-d3df2000c3f0@foss.st.com>
Date: Wed, 13 May 2026 09:37:24 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] remoteproc: add helper for optional ELF resource
 tables
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, <tanmay.shah@amd.com>, "Ben
 Levinsky" <ben.levinsky@amd.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
 <9e3a88d9-1679-43ae-a96b-62a29bd45d9d@amd.com>
 <3b1c5579-a9de-4955-ad3c-df3f8c1860f4@oss.nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <3b1c5579-a9de-4955-ad3c-df3f8c1860f4@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|VI1PR10MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 605137ee-1b03-479b-9294-08deb0c27c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	se8zNJvlpwDQM/1G+2ZErAnzUBNze5XGn3QL3h+FZttMd8E0ki1g9wclqBTg8p6J9yZLvLE0gMJmjwmkBC47JyVvj2AaO/o9PIIwUwGCXDfgmnqjpGxZ1cel24pBmccT5W2MUIJHFZLrYkf8RFhz1RPruLRs8YPvnYRDjuywEnv6aBKg210gQXRwZGTb3cHfAIOANpqEeFrdpWHGBoNMRtSljNRMtqB7czG7lqdqslFLpRTpQO5JD5oo7OVV7wnUJIW5vA425RiKJwZEYsVRtNlfbQWuJsk1+9qWYzlgkvRGibDgqW0s/wqFd3Fu7oUN7LUpdihi5HfYlNBL729H6LdmkFwjOTOx1oTYYHeHUq4rrtunnokE6VvhW0/gzCE/KY0UiXbHSlmGoGz9DeuPVVonqex0g2ZOTS8yYfXLtEAlQKauEnHla8E8T8KmNwLgMhnVT8/tNgtV0Vx13tbqN3B50oekJOLprSeLD833Zr6m75dn+vdgzUNwh5z80xi4gXZy5rbpEGt37IMa5vxohBDy5IdkMfZHmGLnKxshTUvmmY7P9UxN7hNK9zD938r6NaU8xT0bnFPdB6CVUxbTYtFrtxxMnw7GGCa/lOoI7U/b5yn6svzszlz4nKwaD9V0EAxeVD++iBNDWN0TKplJXJ+Vw/JQH6emJGrnoHL6bak30MNvRSCZo6PTUi6/by3GQ6JSP2uPpPH4n/5F84n/PaZnfGz+/lnBctIib1YNu5I=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ez/JtjGs3awTK6ENW5Jwv9Np3JxJI5VcrYPs0CU+3fUgEhGwBGhjVIqDyd7efEIDyL08RRZ5QPLcCDslR/uv5a2N4je75gE2bltBd7iQy9HzyprWDu/+BsNcdKIfFbajdAN8RuFstOlffHffYjUFojokcl5GG6lSiptTXjNYEsXY/XSRHQ6p6KJ16A3sfQYRZ7tlhTdgNjTlDArfPFB8ldNA1g85aSJFHQmKJ0vUNhvZdo3q7TbWgdZsjJwCqH0nVSH/eO3Ab6BWD5aVsuev5Lg3UpwaQPuhnyd6EvTds4RZ9UUPqJRTorRWz4lwZwSmV1nmMy4RO8kXLBjKo3qpMvvyA7K/NqkUYtCRfvH7xakXmBNIJGbq5Jv8CTX1vUwCyAlSkVfOOag8RfxBCsyKUVwl7CGMrzy9hNJFxTHLjLk/Nzc7OugMwti79Jde1RV7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:37:28.7272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 605137ee-1b03-479b-9294-08deb0c27c43
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3981



On 5/13/26 08:30, Daniel Baluta wrote:
> On 5/12/26 17:53, Shah, Tanmay wrote:
>>
>>
>> On 5/12/2026 2:55 AM, Daniel Baluta wrote:
>>> On 5/12/26 00:18, Ben Levinsky wrote:
>>>> [You don't often get email from ben.levinsky@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
>>>> drivers that treat a missing ELF resource table as optional. The helper
>>>> returns success on -EINVAL and propagates other failures unchanged.
>>>>
>>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>>> ---
>>>>   drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>>> index 3724a47a9748..dff87e468837 100644
>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>>>>          return 0;
>>>>   }
>>>>
>>>> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
>>>> +                                                   const struct firmware *fw)
>>>> +{
>>>> +       int ret;
>>>> +
>>>> +       ret = rproc_elf_load_rsc_table(rproc, fw);
>>>> +       if (ret == -EINVAL)
>>>> +               dev_dbg(&rproc->dev, "no resource table found\n");
>>>
>>> You are changing loglevel here. Initial drivers use dev_info or dev_warn. At least I'm used
>>> with seeing this messages in the logs.
>>>
>>> So, what do you think on adding at least dev_info to this instead of dev_dbg?
>>>
>>
>> Actually can we leave that choice to the platform driver ? There are
>> many use cases where the remoteproc subsystem is used to load and start
>> the remote core and the firmware doesn't have the resource table. We
>> don't want to make info level log for such use cases, as the resource
>> table is not expected in the first place there.
> 
> Agree, this is the best way to go.
> 
> 

LGTM

If you keep the rproc_elf_load_rsc_table_optional() helper, I would 
suggest inverting the logic for dev_dbg(). Regarding the discussion, it 
seems more logical to print a message when a resource table is found.
An add-on could be to also print the address and size found.

Thanks,
Arnaud

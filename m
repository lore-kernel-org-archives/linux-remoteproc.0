Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E43B83E1;
	Tue,  2 Jun 2026 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389288; cv=fail; b=AMydJj3Yo7ZrvZigA4qhYMnoGHUf9hJlRX4DkTqF3z40xD29bN0Hu8L/rZ1pAXNOhqnQCwMjZfvdtsyJ+DoCY2dmMZJP7xwRK7d1sKM8bl137eb/S9Fk5AfjWVZrxR/qT5X2MIDAIhrzM4jWBAIc4MsVSp64sr9LL1OdYbqwkuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389288; c=relaxed/simple;
	bh=c1IK6W8hcYTH7Ak8lcWGMdIbd08w4Bafxe1mnukM7Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G01znMITzO3m7m5b4+vX5z3LinWqWPfD+ZJgH4mHWxKAh5foUSPlkB79mNlqaDiXVoNuNpvHXzipTj8Z+ppBMdfv3EoRStLFBgEUZ7By/VLKjTaeZYYUjf+D8LDY+T/onuwtZiBgxEN0oKHgqrsvvs9eRoNcyYRUkfWZVG7me4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GxKFAkDF; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GxKFAkDF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUPWjvAUeJmhx60Fpybh3rMbD5eClcqpY3S0YE3YvTEzPE3lXTItn9syEn2CdqaYyKchLtTQ4PexQhKriEQ9Zsk4H60VNPu/9Ur+VFDQ/k4k2tVaJr6ztU5gpbuOX8nkFj4kvOmxgKPp/Tz5E+1jUny3IYq+WrzJTQOrVsIhM/k/SGrSG3+OVKaQGFxpti+HaCie8MJ+RI55ga28oR2ZriZxfVyfUxpJOrkjR/cNkDk90qKoLPu1os6xeBr55P81pMRq8rLgpr0vcOB7yXj8EgBVZJHaaALOE9g8WzN1hQhWrUNrWr2doYrKh+jEk1ds6upUWzTD1eRSzYDE/LeXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rarP5p263r+6umRACNcgqSlS6gH625duq/91scd7DUk=;
 b=RrErvBMKhLxk1yy3FevW9oIE7wgpkH0irMcmg4Ukuh5T8v/eR/EPR/A3y4UMOj/+WwyWU3DA3AsH2RfUvzbEYmweIw+Iipp1+BkJJvTNsn95yVna0IJhXb1RNmeu0S/51+zT44kt1aWPLQbJuFVaV6l6zT+7uWaBsWxCvGTfNjDvo6pNJ6XmLwIREwWhs1KHJXfUu7w2nWB6OGA542eXaNK2Ghq+QtFAX0z00Q29ZUgCzK9jQGgGnpgei0dXqJzPnjiQxRy0N4lSOBcousEHq0kiw4ho72RKHUWcfOiwivM4lvA18s2Loe0i2Qpsy8wQb+jO+nXK7d/OuSwsR3swIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rarP5p263r+6umRACNcgqSlS6gH625duq/91scd7DUk=;
 b=GxKFAkDF4rPgohIhlGlk92CFPIlKw6abmPIVrPeRillJ5+l7lklQNUQFTQzm5eJKY74Npj+KaZ2UybaPNy9FJXEitAzZQjw60asucYrRZb0tiardNZDqfuSCd1sYQQVuaMhIPw4xrSujamKoVn7mCUPCHYYl/nrOTJxCU+bhO9IROMtaz1Wq2bAh4wuudulvPjukeBYS1JegIluV3FotzqRlw/CFSfOxcUGs/Y765sv+2UT4TNS3LINPYtwIVAcCa8cwTOJPXPUfkckIrIssbhb5o+lJgIc9TBCHe0m9/8MkPDOG+jt+bQ1ZOzNDFoVQympbJ0l1YE4BiiXb4eyiWg==
Received: from AS4PR10CA0002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::19)
 by AS8PR10MB7564.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:34:43 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::42) by AS4PR10CA0002.outlook.office365.com
 (2603:10a6:20b:5dc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 08:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 08:34:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 10:38:48 +0200
Received: from [10.252.30.132] (10.252.30.132) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 10:34:38 +0200
Message-ID: <44c03148-9ff2-4fad-846d-ffe3d71adac1@foss.st.com>
Date: Tue, 2 Jun 2026 10:34:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] samples: rpmsg: add MTU size info
To: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-5-tanmay.shah@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260529164327.1827121-5-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|AS8PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: beaf6c7c-9f3f-4d4c-3354-08dec081caea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3Rijzmk4gQBhTiNrqh0qQ0XeT+gOjaIPeg8XpX4Ii5BrITG6M7c6jHw0WWUnQe95S7fp4HPbWVipjxC2r/l2W7j9ljVQ9CwCJDygLV9va9e6k/Yk1fAGdn5kQpIAriEga2tbU7X3lETMOnsITStJqBqhV7zcnntVs9+oCGjW36o7cIsfgu9ZRY2Q3l82O9ZjOjSb8XyE0WN51Bk+QwJb/dE1Yr3uP/RWQORDvE69KcDscU7CqzVkhZ6BtARQAppUCVMYIDVK26atudd75d2WduS0dyjB+A1Du+kDAvne0vljRDamQSIUxskO6XVKxFttNl/D8y9w7P3Bb7mN3Z5HrObwX6H8/wI7qJoW3eh459X0pTRckAxgkS0hFJF9stn20+VagbHOZiGn1Tyhy3J2TW7NnQtAGZ20mD1eY02J7Osw1lEk1udEtqELJ/SZFuWHSZ+4nO4oWFEqKL9FiOSq9iUI8gvgDROjYn1+2MuZGeYxLWROexHRfdNBepkCnS7K1r6VeDtek1FfIz2A5XoJhVr5EN33VZbd+cqgTzcVPSFgjgusOs7AQokwTZVYEr6FP6M4ZefHbftu+98sQ0F5bytNt0pLb7jTJh8Nyq10PYU1N9DPIStqWzFFX+e2CUQRDDGq0UoKTm401FTF7PltcojdLpT1wXLiR1sFkPMxwvpmTFPUaBJ7P545kTRNWU0y
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9yw/wZR5nef8+qgOQ8Po+Jun7PUaVS8fnuEUB94JLSEG+qpR1cVROL6sQLeBxtom7FKILUyLtN5mZ1+PldG9fgZkuPXlgqA6tcritO+ztfq9/e3LgPo1lyfqDAdycI7bbz7njOucGPFQ4Qx0M0uAp/lwug242JtThJCCvcwfQdFcaTmt/Zv9CDKdWGs8xHTiuBr2yjWRolsK4cmRyXzdyNQ+h+N9apx/OCD/K6JMElWkrguIrQT3h313KSSRIFF9R8URs9qLIOTvM3/GBuSZSlfy47AIP7QSTJK+llDIpoxafZNZQo3GiWgdvMX7wO0IvPKJXY1a881jE8yaHMZDnG/eLk+Ogb36Pql/P3PCytwYaLKN/rWeH0qr0wro/GWNRhVVKUiFZIkSvATwG+fKvufMZB29n/T+MAdqC2uI4YSogkpKD+wB5+X8N4I1fu/2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:34:41.9963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beaf6c7c-9f3f-4d4c-3354-08dec081caea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7564



On 5/29/26 18:43, Tanmay Shah wrote:
> RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
> Add log to the sample driver that prints current MTU size of the rpmsg
> buffer.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v3:
>    - Check for error when retrieving MTU size
>    - %s/mtu/MTU/
> 
>   samples/rpmsg/rpmsg_client_sample.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
> index ae5081662283..55afa53189af 100644
> --- a/samples/rpmsg/rpmsg_client_sample.c
> +++ b/samples/rpmsg/rpmsg_client_sample.c
> @@ -52,6 +52,7 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
>   {
>   	int ret;
>   	struct instance_data *idata;
> +	ssize_t mtu;
>   
>   	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
>   					rpdev->src, rpdev->dst);
> @@ -62,6 +63,14 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
>   
>   	dev_set_drvdata(&rpdev->dev, idata);
>   
> +	mtu = rpmsg_get_mtu(rpdev->ept);
> +	if (mtu < 0) {
> +		dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
> +		return mtu;
> +	}
> +
> +	dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
> +

Do you really need this commit? rpmsg_send should return an error if the 
buffer size is insufficient [1].

[1] 
https://elixir.bootlin.com/linux/v7.0.10/source/drivers/rpmsg/virtio_rpmsg_bus.c#L517

Regards,
Arnaud

>   	/* send a message to our remote processor */
>   	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
>   	if (ret) {


Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0A827FD49;
	Tue, 31 Mar 2026 06:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939810; cv=fail; b=C9oKkIT93KnFrjMUGtqK8QtMD3f4Ao3bFCN1F9nvhqf92NlMWbhLbJ69uu1SagdH6ALjbHui4pBB6L49HVdI3yudgW9LzD/fQ8/tP7TZ8Ozo8RlY1m3qkq+/ikpBfs2NLA78kK5ALD/hbR85Z+1/HqmIUPJQXZZ5SVCqxduX1pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939810; c=relaxed/simple;
	bh=AELKvpfRe4QBoHFC6ys0rBMtB5aezze4EflowuJloNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cw5hKbKpS6SLTdcSKAEcnFmTTQTyERJkns/H+EZegsXRmvVnGiw5DmCngH9ryGwBW4J4qV3YrNYfBd4BwCYZbUA/ZajsMD+V0gEIpnurtVTRcPW6xLdeKRGqYyTfJpz9I/aZqiIWOVGa/oq9DW18YOp/f1phyB2823zWrQ8dy08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QTZ6jaxB; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QTZ6jaxB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es6cS9aEQSugOlP1f340lYvHnkvEx0bjbwG0BF6iOllGIjc6TTqzzBY4UsnvzmNEi/O6isuqXzTxuLrnyLOUxM7ogOrsdeTF0vAZMkhW+tqeYDDGM0fVgyO1NnSzzgI0XrSNsBI6ZuuZCzGW5kt7i8CSIOOfjGTgVcH49uTo3xDl4S0cdqfd9Lz+WvI+T+xMuFnGTVK7Vr5R0a31ers6Z+a6GNVvIty5kKw8rQ1g2fEw1oDK09PrnxjOkmk6iwFk6Iw5dY8NY0MG+iHTLieTKkBLxsqp9yWLYAVhBZ8X/j+yw0XQGcUj0UQfU4Q+1NHoqMOtk8dM4krZetXP5vlvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHBxMVZimeJM2DIM39oo0qgPkYmxhyT0+LoIFplCxK4=;
 b=wvkMerwskdmYOI+ivunsb7++n/+Cbxc0oRiNJgn/V43V25WsuGdpES4jbqUBnqA3zTBhcyaBV6LS4KhFtB5sybH/Q3TgMF+h3lRTd95LTpWrcv2i1f65JNQ5eCbheRR4bZPtfClhgt8MSSnfUexkmCkPTsalnN+Phml1YBguojwchbK1wfk/BXWUDmvRsEUGWy18+MHtzcUnCKh1uzN72pdAE9DTk0wnV93UX6UcxvVVbiMzHvyhwN/PYcIsJ1pWHT1LS/97Mo0M6TTIK68kQYCPlLBrx9DWOsbhUZw4s2+sAtizBDqvwYyuYU2Lb9Xh4jIIURZ+sOTyquG1mCTLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHBxMVZimeJM2DIM39oo0qgPkYmxhyT0+LoIFplCxK4=;
 b=QTZ6jaxBwP/0pNc/ZX0NfKn5K86hAkd9RnT2K2sx/QBuhNWO6g2v63ud579giXS3n1ONzq9uiB7QfBPcNkXEkVlcF/UVDctTtRKwMheznqiRRqRu5WAUVarQn0JqFspI9k2Pesf/HkzTyxtn+ru/Ypzg+BEKO3Hh34i9vC0eGtIaefoj6vBhBilAyx4Uhww9FLa6HGvgTHVKHxdud6goRmAB81t1v7a2xqs7gQ5WbJ1IZ65WbKRCvUwLNSBwkhzI2yST2oOj/zQrftxDdarE9uiNmgr2kYp4Capd98RHMywjc247QqNynqUYbAh7PM8MHnIkSCBRLNTNifQ+RfswkQ==
Received: from AM6PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:20b:92::49)
 by AM0PR10MB9622.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:741::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 06:50:05 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:92:cafe::34) by AM6PR04CA0036.outlook.office365.com
 (2603:10a6:20b:92::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 06:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 06:50:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 31 Mar
 2026 08:53:01 +0200
Received: from [10.252.12.61] (10.252.12.61) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 31 Mar
 2026 08:50:04 +0200
Message-ID: <c9c1c699-0ad9-4b68-9ccb-6b4860361321@foss.st.com>
Date: Tue, 31 Mar 2026 08:50:02 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: dead code cleanup in Kconfig for STM32_RPROC
To: Julian Braha <julianbraha@gmail.com>, <mathieu.poirier@linaro.org>,
	<andersson@kernel.org>, <fabien.dessenne@st.com>
CC: <ludovic.barre@st.com>, <loic.pallardy@st.com>, <arnaud.pouliquen@st.com>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20260330224545.29769-1-julianbraha@gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260330224545.29769-1-julianbraha@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78F:EE_|AM0PR10MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: a93e14cb-d1d4-4d98-138d-08de8ef1bdc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UTkA7laB/8wg8WFXi2209JHODIC2UtaAsElYjE52R2T+Vk6yYgwxmGxFPHC76KssKZ6J7MRSC0MNmGXIYdY7N2g/KfqmvSsveo8JKdHsYyt+pZ4fXK0jzsLvVvyE7kzkRdMugCE1d+iM6utsdPR3426vX6HEXXJjruFZWUeECrL6lVbf32cH46QhK1IONR56ovDuPlq9bB16X9iR+RKPe6t22MRUDQSEUe2QSxZjnVcBNFjqlrMcAlTvM7OMe++Kumou7OAKchnpShfffijAXZaoI0T8QFTvXm55wlD1ROZh9CsMm86q9c1XhoeLjVBy5X18JgzyrYXvkY+P8KpQoHIJ2Dl6lYeF57rfaz82OGCwUUImoO2aTvpdo0fqZre3U4mwXJp68cyUwNWSZ3Gux3D9mXxPKi9lYbhGJL9G/JRP/5+11p0pNwGSWRFvy2EXd9xLpZsT7hFDMKYYvAKBcg0lKpaa5Tukh0dWsUEpau8fHJPIpxLn/gQBaxfvK5uOgfHaRN7LN2f6LvFw8OF92pFqwoCEQm2B09sER3Bubxz0doUzXi2gmP1tvVdTSpX8eIYEIoXxn59s/TqeBBTB/3jgxGhnCHIhmg0S7wo/nXo1Z7CWhImmuttMBp+NedeoPgRJqsNQ8TvTMfydCTiJ7pNqLxGPIWECKiAfDva5J+VSGSR+Xp9AKN/NCwmBFRwmSJcNkpduMgtqGQk/ZwpU3vAI2sC8N2TDgcqe6dwqgMRSyviDDYUaUXlbXpDdcNAMc/Ch3+3I6Qful3OnNj/Tog==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gyZQI8A1goajPlZPdgCJRdIs24wG/rQCBTSm2i8UBl9u/Or+2ZxwBSxcphToSuN3A7ktNzY9hQN9d2osUr0HbYEMtyfz+IVwFyBhXY8xsYQaLN3jxXAigdpXDFJb1JF1n73ilZHBjtPKn607H1mjikS1U8KEIbLjr1E3MB0uSm7YRDnREskuSVdFtI/FBzaKaJcufKxgiRy9iMvYEGK7PkTGISWmQSr0PwbuXSrGqFdLIExzqDhAdnzxVod6zKSRRLAWmjzaHCGX4PcxVms9J44/2Ckzqhm1m2kI6CJd7egezURrHC829aMJswojnzC7Yhme1Z1hl4GdwVYxuGQ3Zb0mcDxUkglHrK0rbiU/oHmRywSrEMVsxT7uhMoBoqKBlJMdyvLqsaeHdb9P14PUxgrwr8BZ8LgE2MbgFOaPQBKH9QS3L/Jsm8yt6gliY0O9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 06:50:05.4071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93e14cb-d1d4-4d98-138d-08de8ef1bdc1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9622

Hello,

On 3/31/26 00:45, Julian Braha wrote:
> There is already an 'if REMOTEPROC' condition wrapping this config option,
> making the 'depends on PCI' statement a duplicate dependency (dead code).
> 
> I propose leaving the outer 'if REMOTEPROC...endif' and removing the
> individual 'depends on REMOTEPROC' statement.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>   drivers/remoteproc/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index ee54436fea5a..c78e431b7b2d 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -316,7 +316,6 @@ config ST_SLIM_REMOTEPROC
>   config STM32_RPROC
>   	tristate "STM32 remoteproc support"
>   	depends on ARCH_STM32 || COMPILE_TEST
> -	depends on REMOTEPROC
>   	select MAILBOX
>   	help
>   	  Say y here to support STM32 MCU processors via the

Acked-by:  Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud

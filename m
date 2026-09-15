Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A0A4A207C;
	Tue, 15 Sep 2026 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482860; cv=fail; b=BVfsWXfcsBJ2N32RofpOkuynNrIxJ+b0jsBlg72ChXpi0n6bchKaLFdt3qOlydRRchUUwWo4ACMTlr+Bp344kF7SB0Yw4TuLYb9gna+t6lgR4ylsCO7Glumx1b+ktUVFeiaMnzoYaYRlV20Uc+vMGSm1XCKj6T9zVoUco7gyLCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482860; c=relaxed/simple;
	bh=qDyDUjy+d5OCumhtEpa+1IQ1iaaLle+YXeKsZKeSQYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=if3wm+7a1X6uVp5HZtw2oXPGSrLsjQHRNKSq8bMS0KUCLtvdx/5l8MnTEdJ+sVIN1cAEL5IWX2oLI6+f9xPTFgl6HkYyW2XAEwIpJPeaWTwTdTS3B1MdR4XFuEMHFDC+g9d3N5j/Fa0Dcbt643qFKBUlZOF03gdWdIwnCiMthZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Ug+mUeJe; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jGFGFwtJ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Ug+mUeJe";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jGFGFwtJ"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD197d013261;
	Tue, 15 Sep 2026 09:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Bs4O8HzY04+o5temNWfDm5Vrcq2P+6zyZlMpuZAlc
	eE=; b=Ug+mUeJeERrgpTg8GpeWxPDWaI55wxn+QpVqmT4Lw8T/BkSTGE1vh2y2c
	H902VuhwbJ71WMG2ZyKFNo/RATKAhFdzDpfkUH6MdclL5gICM8wLDuifLbg2FsZW
	OcMa+QgAT0MFXXWjRvbKUiIfuP2o7I8YGsGOxBniGCStveIx9hdsk9j9UAxDBKzc
	oPeTKdx1/qaetzrEWFYu3nO6UtN99WfMc/rNPUTGvgtYhf8FQ+UC1da/BQU7089M
	WPrselM61nQvlvKK2cPHVWMBYLRLWJIu+de01LOzfe/h0tJb/OiQs3rJhkZO0wnr
	vmuVq0MMg2w8m8PdeX01HCfkCLpEg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013011.outbound.protection.outlook.com [40.93.196.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gq362syq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:34:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdVjI94NtO2MhjrmLcOy4MXkonmkLPe4eWvNIeRClfuL2VdLOniVLuyEt03azqRgJpJ87jbo9ZYh6KlY8/PT6FjixDgZeNpgYySzjamAmXBX2iK7iQ7WyZjqFv5FNtBxIYRq4vFXNIklTu/xCSE08sm8FeiZ8Dqc58te7kIshAT6M480s5GmGZH/HlslFmGxXl1WPeR6ory731PnqgdqpJXZd1luN2R3aqC53iAESc95ZNxvmxb1hkZAltEm+yNnqn5wAAxLUNpakeIKfOKE1dhgNxqioTU34QInZoUJOPpOXdf3dwk6rDB+lF1P7/3ddYC6Da5vtTzWjCJ/vN7kXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs4O8HzY04+o5temNWfDm5Vrcq2P+6zyZlMpuZAlceE=;
 b=Y1UsV7qK9Zeog8nGfc7eZLm+5tNUgYFIQoF29AmNVG5uiRGQrJ3Ef6A0s4DTusqe8VqqlBss7qKt4qAyO77/8PAyWNKiXK39hhua8e7czb5UpKWe61ReqcBbf0OP1M8z7hxkaso+6w/2fr5ef3URdzmVGQO7YwE+uuizdXWffuY2PtFRiRW5ix3vX3fqKWHVtgpXor/chi2JWLWtvLDT432a3FAE4RSSKhGApcFFGiMd4M2YI4TXxlKRoAVKtV6NsyXeQV+7oGieeQHIKZXh/Zkz9WjyBoS3QMjaAKIWt79Mw67j4RTSm5vKGPdOaZVw/UBN/Cib+oXCL6PBTNxcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs4O8HzY04+o5temNWfDm5Vrcq2P+6zyZlMpuZAlceE=;
 b=jGFGFwtJ1ZmAR5x2XXQpvcElPbZ5ELFPRT4QjO7OUzKT2r/OseJXKipv87tDpjxDfCodYW4/vBsflu2DpeQyuCZaE1W8TfiMvm1Wx80imA2KNa/kP30bv9oOkSKNsk09rDeI90eY15RGNMZnCgw+mN3sqQ8jflAL0nFMMXv1T2o=
Received: from BL1PR13CA0271.namprd13.prod.outlook.com (2603:10b6:208:2bc::6)
 by DS7PR10MB4957.namprd10.prod.outlook.com (2603:10b6:5:3b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 14:34:05 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::97) by BL1PR13CA0271.outlook.office365.com
 (2603:10b6:208:2bc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Tue, 15
 Sep 2026 14:34:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 14:34:04 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 09:33:26 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 09:33:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 09:33:25 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FEXNhd171910;
	Tue, 15 Sep 2026 09:33:23 -0500
Message-ID: <0c4cdd98-4029-48a0-9a04-e2bd5f062eb1@ti.com>
Date: Tue, 15 Sep 2026 20:03:22 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: Add compile testing for additional TI
 drivers
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260904195634.2275867-1-afd@ti.com>
 <20260904195634.2275867-3-afd@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20260904195634.2275867-3-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|DS7PR10MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: cac07b7b-27c1-41c8-122b-08df1336647f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|4143699003|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pPkJKlJMFtVJyqa7urQaaa1EOo7K3NYutduz1QJ7Xg8tGuTqXbpwAFfoVu+ETA/50dur+Ousd3lSuyAzoyddVG7EjQ2n/Qqzmcg/VKEb6Vq33su3n1rLkhM33myuadu/ajBnh3Mgy2jyJfLWf9x82q1nXVRk4iZbayCqZMkBPYwJRtnMI2RkL/7MthaVhnGXjZhx7mn9KyI0vNObbW0HXFcbPWRUOxVENS8m2bfFKD+P14sNgdakcj1vSqkK58KS5qd0WAIDgOmlYfWHrk7jSnFMv23huf81HpQxb+iNq88Qct7hOJ8kQxuSrpNTKs4URHLLtAF4H8p6E68Uz7uQazToQJoJWLT31P5yN9vV7oJddnV6AKfOIF/mGm+ITTt5skF/U3VXD987pZLGFmIfQSQ1CbVlov9wYXSsmz5+Q7fbHUD2NZq2sSnKdWiqpfQB8qMlTC9XyS1kF+ya3ACAlK/uwR/9l6A2hwvA4LUBZLGApgH+VmR7WwijOgo+2tUvl34mRsEenUsSLsh8te2dAcqDlxIVwtAR6b9bOSu1sZFEWeuGxMhChhgkCaxk33tZRP+HrPUcAXnKQB3q1i1WAc9CisfYw10zdOV/Na1ebOeMoXjmu+jxkfAf3a2XXVLxnS5XVGgKKq3IdlkpfKVs9ysaK/skS+DgWpFwIQ2JBlJyPvmHeQXJ/E5JlWvJA8xK4GsRuYDZg3t8gFjlRT4wtQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(4143699003)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZMBscHloET1jbnzJafHjbuj5vPp49g3uenz/R5ABPD46dcu0HyQ3ZfD2vFSFnIxPoeXI5T70+7LpWwsVfTEZXf9CekeDXzKnRiZjlSczmBT3g9YmgblUoE+h+o++oN3FGH9UAP4KR3nCwWCn1Nr+j9jQ/fC2KTqxGUNR0arfc7ADHUtDYKBtkU3Qcty2Jw4dYdTtqH8qS2qIx3LO3LOYIFVMnbNmLgxCrQsSNgMnIU6BEgA76AvDyxjwnQkpQPEsq0cnrGQ76An4amkSFyUrCK+OaG5VcVvH1LEDMcCVEYbsf7/uUmcLTLprs69aaOBC4hd4wr7FGabxvW6NNQjlw+LkY4TrQ/V9Mt5xZ+xu3g13L0OaMp1ZYNYQ7K8Bgd0q18WttoQmd9HDbajPQoDueT3SviBcHhc5uFUNzNkqISfyEahzwgqtTKuWGuxFuWxB
X-Exchange-RoutingPolicyChecked:
	KVweW7/CZugNTQiSP/J8nqpaRZrLCruFDwdWcnE2zqfSLb3dlQQYt+CGQcMseJhHBwGUMEyqT4IgvCYwS6Y2wmtBL1oTsTyPfZqFp/QfingZmKJHrKxEwUxVjywC0vSMc6I0Pl/VCTlAlInSS6IlMSPoVy/ArF1BD6AO/8Ch24ZCGmGeUThy1nSMgUJVWRW/tgoHlcCise62xTma4++pPo+NJn6vYYesxa6ve7gw3RI/k4x4UcJB5BAv4E4i12PqCRYDqSI+iCyUn3lRW4mDB05MWGTjn9hVqlmrTZzhaJsGfaISRVJaJ3/vltA32XuCKIwjBut/2mxcsKmrCSRyxA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:34:04.3935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac07b7b-27c1-41c8-122b-08df1336647f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4957
X-Authority-Analysis: v=2.4 cv=P9yvFSAu c=1 sm=1 tr=0 ts=6aa95763 cx=c_pps
 a=+o5UappCifC5MfkOrb/nTg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=j-SA41x6M93Vl1qRaJYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: cN72gQ2z73VNUr1wkrKbNiYdePWYJiUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIxMSBTYWx0ZWRfX1ZshW8pv4rto
 jNHjw7YcPouHpFDwE9VfhxS/Z+WMkGcGcsAtsTwBCyq9tRNpWrsA4JmlBWuIyVYjJdJFG/FGs0i
 B/XBkNZ8AJTOFlWvFs7RANmVdj9hSXdkFAOSajSM8rqriGR81Y7AQuc+l8UGWN0Gsy5jFpI0rqj
 jzwaTQvCe3WnwKcKRs32E6QHANqtIX69Eh1181L2+y3vOvw3Oco+h56fWFZHspO1ghAw08xrb/G
 aDDUm3wLxHim1JcN5T01Kc8rprStHrHP1KL49YANHQZsvUiesTvZiVV9Ib39ZCNa8440eRdwNP2
 0Ss/rglXhaG/AzjHwCU3YkHBthbawHcPtFirZnC6cdffUBp0tQ0cWNL+an/izmqsY159XAnZw9k
 jcTxf92QWZqcLi18kp4BGUfvx+robb7I466XwWStZGfDf12Nzn9Z1PnwM2cuLI+2iB7GWd91nqF
 g2M/OT4SyrkI/XnznSw==
X-Proofpoint-ORIG-GUID: cN72gQ2z73VNUr1wkrKbNiYdePWYJiUH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIxMSBTYWx0ZWRfXzcl1QzH7VMdJ
 6eXkcYDO7yk1FV1E0PH2QzoaoXP4fu3tPAaZ0iyz8rW8gOxFojR7bP7oENHKaHUf17SIezuNpHJ
 /p5aHb7sj13y2BvR8Ke2+dy2JlaR+Lw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150211


On 9/5/2026 1:26 AM, Andrew Davis wrote:
> Many Remoteproc drivers, including K3, can and are built for compile
> testing. The WKUP_M3, Keystone, and DA8xx can be also, enable this here.
>
> Doing this exposes a compile warning on 64bit platforms as size_t changes
> size, use the correct printf format specifier for size_t.
>
> We cannot compile test for OMAP_REMOTEPROC due to dependency on OMAP
> clock framework. But while here fix up the Kconfig help text which claims
> this driver only works for OMAP4, when it really works across several
> OMAP-class devices.
>
> Signed-off-by: Andrew Davis <afd@ti.com>


Thanks for cleaning this up. Test suite is happy.

Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Beleswar Padhi <b-padhi@ti.com>

Nit: A cover letter would be good to send R/B and T/B for the entire series.

Thanks,
Beleswar

> ---
>   drivers/remoteproc/Kconfig           | 10 ++++------
>   drivers/remoteproc/omap_remoteproc.c |  2 +-
>   2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 5b56b2dcc725f..73500fdc227db 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -83,9 +83,7 @@ config OMAP_REMOTEPROC
>   	select OMAP2PLUS_MBOX
>   	help
>   	  Say y here to support OMAP's remote processors (dual M3
> -	  and DSP on OMAP4) via the remote processor framework.
> -
> -	  Currently only supported on OMAP4.
> +	  and DSP) via the remote processor framework.
>   
>   	  Usually you want to say Y here, in order to enable multimedia
>   	  use-cases to run on your platform (multimedia codecs are
> @@ -108,7 +106,7 @@ config OMAP_REMOTEPROC_WATCHDOG
>   
>   config WKUP_M3_RPROC
>   	tristate "AMx3xx Wakeup M3 remoteproc support"
> -	depends on SOC_AM33XX || SOC_AM43XX
> +	depends on SOC_AM33XX || SOC_AM43XX || COMPILE_TEST
>   	help
>   	  Say y here to support Wakeup M3 remote processor on TI AM33xx
>   	  and AM43xx family of SoCs.
> @@ -120,7 +118,7 @@ config WKUP_M3_RPROC
>   
>   config DA8XX_REMOTEPROC
>   	tristate "DA8xx/OMAP-L13x remoteproc support"
> -	depends on ARCH_DAVINCI_DA8XX
> +	depends on ARCH_DAVINCI_DA8XX || COMPILE_TEST
>   	depends on DMA_CMA
>   	help
>   	  Say y here to support DA8xx/OMAP-L13x remote processors via the
> @@ -141,7 +139,7 @@ config DA8XX_REMOTEPROC
>   
>   config KEYSTONE_REMOTEPROC
>   	tristate "Keystone Remoteproc support"
> -	depends on ARCH_KEYSTONE
> +	depends on ARCH_KEYSTONE || COMPILE_TEST
>   	help
>   	  Say Y here here to support Keystone remote processors (DSP)
>   	  via the remote processor framework.
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index efff95b8e363f..1e96506ce7ca7 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -1208,7 +1208,7 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>   		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
>   		oproc->mem[i].size = resource_size(res);
>   
> -		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
> +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %p da 0x%x\n",
>   			data->mems[i].name, &oproc->mem[i].bus_addr,
>   			oproc->mem[i].size, oproc->mem[i].cpu_addr,
>   			oproc->mem[i].dev_addr);

Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD72D3C37A5;
	Tue, 15 Sep 2026 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482765; cv=fail; b=gv3PqO/EVV6tbWN7eCAehPLVGLjDPe/oDAFW5IzbRxH/t+0+i2/8bZ6Rf0A1hzdhIPqYrOHfyEGWUTJKdLIk3KaC3K+3TgfvBI9UF7FANApsKfmfKKrvLHlq3CyNpotMfnbIBUS2SqRxz+3wQwfIs4p+ynTlzsK6hPCx/ddrJhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482765; c=relaxed/simple;
	bh=By9AxK19SerZN3zsj9+DevCmc1L47JfBXMNW4H8mWNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dxFSNNWNmthCa4pAIVRGSR3QfJwO4S3ey7wgbCVisU2/AX1EUdDWMLUETdgEJrLSyVqtci+MqNnZ7vmHF7i+iNbIlrTgfJVl+aiy+vh8JuwjbH8gVBZZfI9n24P/TiQwdPOF2IUrsz46VSEpmAozt6ojLqUbI3PQv//WNtHfT1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=m1JGhYlj; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XQyvHYON; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="m1JGhYlj";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XQyvHYON"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD1CF8013389;
	Tue, 15 Sep 2026 09:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qzu5P9ft0DhUnTabfvmGCgIWohixBXPt25Z3Yckld
	Sc=; b=m1JGhYlj5Ri6MwPSFovuMAhw8CI9yTQIIn3uxu3kaPOt3p7H/GOgP1/S7
	gizJVi7dOAEpYn9BWJ9+bap4sjWPYnfrVCBQ72bzGJTfIV3VLxF4bweyPAWHFrdi
	PT76hRi1ZG8sWhFY5EXquUNBbSvcPQNUOrUxw3gI+ZLgpWgTPRdr+l9SbdBUwaxr
	Djb/0UGvdurk10TkWDeJC0CGCLOwLlc37Hs+Avk9x91pA4tDjYBVqZO1czhgJe7g
	FB5te+3Sg00iGJhZHnldUefSCOnNpOZwPj+Wmbh8pJ3XXN8gS8IAwYG6QjRbn61m
	s0HRMW6eSm6yftbEr+fD9jntqU7Ww==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010034.outbound.protection.outlook.com [52.101.201.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gq362sy9d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:32:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7DlPD9MarFZrOMS7u5UqOPjmaRN1Nl7CwYLRIOaLJJcfNBz6Khioc+Z9J5UsM4Yf7g8ArhZkfYxHk1oTmfb3grGZWHEu7QMSalTcyHg3ma5Bs4cCz/fdSHnb4YHHpbHIy8Jt7+j01u1Un6S7Cj2f09SeWXHPC970E0CKF95CxDSviFn/kEo/onAOV12bDSm06qzUOGLGmPrrt66hqFHi92DGBejycmxPGhv/CGwxmibv7G+anIVN8RctPoVi/NGulAFOXuMSeKfnRmViP6E/7FUrWla0eSJ5Pu2UZ7pe5NPrg7TFjZbgYsfc7KWU9uWa8c0fE+nw76Wb1ps2a42sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzu5P9ft0DhUnTabfvmGCgIWohixBXPt25Z3YckldSc=;
 b=Qi+d1j59iBzrxEpN7QybU68xmame+advYOV6vWrvjkTUxRFcsOCrVdf1kepi88TpzIKJubQJIdD3r4quVswzSM4F/uhNykYejW3M+1qEOlKyH8PtQR0ScHEeqsSW6bz3KpPX0C7RhK/zhKMEquENPOgtKd/RQlVhGx4ba1EFoESOLlhZu4lk7RaiVaO7f0jT1APJQroKrh6DPVA8dllsskA/ZS5/p0c9Igh56lSzDos8dbHLkbvM6pSu9wHIozB5iT88RxVdu+buBQ6Q1t5vV6rAi8z76lFvwDK+bAxAhIwiIl00zv5y3cRIFksMlO4/x4KS1l0/OKZbSWzYNkwV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzu5P9ft0DhUnTabfvmGCgIWohixBXPt25Z3YckldSc=;
 b=XQyvHYON7MRxBh3wnAZhnbINE9qCERy43CLhIagSokyuN/Vj/IzZl7VgHAeGPqy6VkMmRkri1BOpyRBdRQCWgJpUVWKhAezNcyp6PzS1MxAQtL+HVVPet4XA5sUlsLuGU10MaP+0Q+feCIRfAraiUUj3y6WjtB0Cplc7L36xbkc=
Received: from BL1PR13CA0269.namprd13.prod.outlook.com (2603:10b6:208:2ba::34)
 by SA1PR10MB997737.namprd10.prod.outlook.com (2603:10b6:806:4bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 14:32:17 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:2ba:cafe::77) by BL1PR13CA0269.outlook.office365.com
 (2603:10b6:208:2ba::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 14:32:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Tue, 15 Sep 2026 14:32:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 09:30:59 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 09:30:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 09:30:59 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FEUupx3400452;
	Tue, 15 Sep 2026 09:30:57 -0500
Message-ID: <9ab22cc8-69fe-4f76-819e-71ce480c867a@ti.com>
Date: Tue, 15 Sep 2026 20:00:56 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] remoteproc: k3: Include what we need and only what we
 need
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260904195634.2275867-1-afd@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20260904195634.2275867-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SA1PR10MB997737:EE_
X-MS-Office365-Filtering-Correlation-Id: 04550437-a074-4c00-1030-08df1336237c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V8/yBZwmS4yFQ2iupDhrIlgcsYuLyUx0z7VARRYMSyET0eV8+K2nsOzKybf59f8XNTLy2pw4SMAloQVCGDsO5wFCi1eCtQ2FvczClEADXRLTucJexABmEoxrOb9S2e2ZCAhvNna24Cuhlq/4J8RE/CUBVmJ/MzzWGIY85BV3OhNyCLp+1BvWn0RRZjhKyycNgFqArmNFHVSb9LzBY9EbzSlcBW5IskRTLpfF4UpzqXpCZTIeYJU2446umsLCRkfEt0E9+QazWck2UsPlCTRuKkMUHMCggqXmfmt5BSr2yvkiFA6ft9c9tGw/UU1O22LZejLWThSL42OxWYBB5D5wBUe/lwLE9G09LvcpahQnBx2WTtHwYB51DmkF2enWeAcig7w7amU/4QfLRLzg9+UnsFUQTjL/JujPCRwgv/deS4vap8PzgRbZ1bpzo/rM3CY1P2GUIXFKjJYuHaxceWNLOlS2NNaguzN4JjEffq5QOA5jRl6IFFSELfJqxqu5BUm9zxX0L+gSjylILeWQZ0lPKduPUb9uM4SJGj8X5YbhzWzj6pubo+14nUi/MXPzgQArKBq9P13a471U2Babk2lE5pYkgnpRbzWQ4UW1e3NtLRpAfBM3yC8WPf38xbQfAFCzucZc+Y0vJvx+B3iIUt+mFKE0pBoR0G21NUdh7LR32RpMRE3+6hYWgnL9ui7LCVdM
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2U6CXEVnmUc3kwhyGPMn0MxRR9Q0zcWzxWudjg9nxsXvT/Zz+6t6yRDblVkTGpfH+lcmR5iNQgQTjAMt0tmgWb57n7spD2E59RXe8LYocOR4UKhj3lMf42z+LWuJWU3S9oLOQhkDOloauHqniG2WkOuqTyK1OK29yDFI60Z+lq4m0/0Ys93/DOJ7tZt0Q5BV00cuJLQR3F0yFz26ktNkKG6qzUk6k/hN3Zi/7tQE4jDSkYJhwz/WejsKEBQV0SNLZvv/T5gZP9ftm0+kp7yT/d1zPQtE/X+LyrjdSLFFisYwh2gHG7MbxQ/mXV4ew1dC26fDnElWyD9ZhWpsSMkr4Ts0qv5xHlQuH5xXSTxVKSK7VVsJ3eOqUExwmn01UwNIbeyJPt80Ksk0AvWfeaG0XqC/b8M53oIUAtY5Jc5Wa2ktU0agACzqeha2WslqvRWM
X-Exchange-RoutingPolicyChecked:
	aOHrTsQmshBp0PNfsboFLUbD0BNqafIaCBwRbj+3RZBZWyuXtcYpHvEX3MvRBKy4CfqmIkBX1oO+ucU9I9JLROFqD16TyaMSJIkgyHXhzz2raxJ5mTGFqlgErpvAgF3DarTODMpurDP2cvcIblEtz4NIdypF9tc7DnINu391SqPajOMC0ZxNns8es7pygYXi4FLSz0ancbt8jYQgJLsjmtRMUbDvY5RKScOwfNYQJC/8AyjjTdyrupYEZ+4e2q+0IgKlr8FImPO2odt4xnzIo3lV2mDTkUA1xGCTDNhx+L3YDXnXOhPNoyaUKdVMY726kFe8S12A0olFcF8KuxpJ+g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:32:15.3264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04550437-a074-4c00-1030-08df1336237c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997737
X-Authority-Analysis: v=2.4 cv=P9yvFSAu c=1 sm=1 tr=0 ts=6aa95706 cx=c_pps
 a=p9IRwfs10qZ2nHdxx/cwJw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=UBZWY0DgWjV9GpcX:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=UYwgWJugbqnFbEsF1LoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pt-7EH0ZD8lawgXbYN-RL_-V-i6qY-rD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIxMSBTYWx0ZWRfX8i9d9cNYW2H3
 toToMI6WibhBw0N+dAFqDk2IdphNvsqvl/7W9fSDrYl75Dwu35K0opG7P9Gfvqjw4vLZmY1S43c
 fcRsABX8LkSRNYdxsiGEvkZwSsT78p8cT+PD0Yb0aN2fEeQvwL9B2h8ELUGmd30LV7/Y1c4U6wG
 8Rs85fZdirNUvSpWW45Ut0GOFd8gpcGclyiOfER4dr4g0Mcnumc/G7QkbevXWM35wtfPeR3IpYW
 JiNIRR99mZvNVS+6NGdU//Pcdff4TNvKLrZbjeaRxA19QeOzQSsxnJZhZCLXdvs5+MMqbEY3Jvg
 wPL9ly/ASi8Ul+5mWlhQj71Udm+M0r/b/3pk0pynmNTngAGsMPIZEVEup91MQ/CIGC3hyGIkAU1
 teHQkspDnQNIpDCzNA9tlXZ1M50Hfa/2u7eIhLhll0Ls+IcIjuv953C2RdwnbB2Ks+FMJZE5Elq
 jrcmurLsmNQTzAYyBbQ==
X-Proofpoint-ORIG-GUID: pt-7EH0ZD8lawgXbYN-RL_-V-i6qY-rD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIxMSBTYWx0ZWRfX3Sbq0oSYUTol
 lBTYQgNLi+GByh3er92Z6lGh4l3UjMv2BPe93Nd8e8U0zRzDHxaHOtXCu7erKTPJFAs9SvR8OK1
 HHSHIaNxs1xZBb3qBBv9E1brp43PsPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150211


On 9/5/2026 1:26 AM, Andrew Davis wrote:
> The header ti_k3_common.h uses several definitions in headers it does not
> include itself, this makes users of this header responsible for including
> the right headers first. Instead include what we need here. Then go and
> remove some headers that we do not use from the K3 Remoteproc drivers.
>
> Signed-off-by: Andrew Davis <afd@ti.com>


Thanks for cleaning this up. Test suite is happy.

Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Beleswar Padhi <b-padhi@ti.com>

Thanks,
Beleswar

> ---
>   drivers/remoteproc/ti_k3_common.h         | 4 ++++
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 3 ---
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 4 +---
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 5 -----
>   4 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> index aee3c28dbe510..c8430e42225fe 100644
> --- a/drivers/remoteproc/ti_k3_common.h
> +++ b/drivers/remoteproc/ti_k3_common.h
> @@ -21,6 +21,10 @@
>   #ifndef REMOTEPROC_TI_K3_COMMON_H
>   #define REMOTEPROC_TI_K3_COMMON_H
>   
> +#include <linux/mailbox_client.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
>   #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
>   
>   /**
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index d6ceea6dc920e..c916a86bc8294 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -7,11 +7,8 @@
>    */
>   
>   #include <linux/io.h>
> -#include <linux/mailbox_client.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_reserved_mem.h>
> -#include <linux/omap-mailbox.h>
>   #include <linux/platform_device.h>
>   #include <linux/remoteproc.h>
>   #include <linux/reset.h>
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 3a11fd24eb52b..4c46f4a256a92 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -7,10 +7,8 @@
>    */
>   
>   #include <linux/io.h>
> -#include <linux/mailbox_client.h>
>   #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_reserved_mem.h>
> +#include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/remoteproc.h>
>   #include <linux/reset.h>
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index b1d04d082e44c..404acc1a9bb7c 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -6,17 +6,12 @@
>    *	Suman Anna <s-anna@ti.com>
>    */
>   
> -#include <linux/dma-mapping.h>
>   #include <linux/err.h>
>   #include <linux/interrupt.h>
> -#include <linux/kernel.h>
> -#include <linux/mailbox_client.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
> -#include <linux/of_reserved_mem.h>
>   #include <linux/of_platform.h>
> -#include <linux/omap-mailbox.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/remoteproc.h>

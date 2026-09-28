Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7F4DE718;
	Mon, 28 Sep 2026 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606438; cv=fail; b=P5cSTzcyjvLBG92kGtx7eViVT0cz+/xCYoqQ726Bs5CMrALUvh4h321pF9GWLFTNEbs0S4n3u/AYIKX4/xS4rWWtUjqb89DOihycV6ud0098b+AYNRgz01J3X02IiX+dov1KIJHXvdZwNEtA3CkvoDq1PQUvb7sxJy2SatkiT6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606438; c=relaxed/simple;
	bh=ojPtGmtpM5KF/CuXANAnDhQN4uJ/5+kN23HbDhIy38E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QEpS6ZF7xc0hRC5eDayrxcJr58bgdcUW6qS29GdLkrsav8ZfoB5GoMLOV+D+t9aYL6r3G5+foQgZDf0tSkYM8m29URp6jnX1eSuB3/icbptD8jDxfyCzQEP1MA8h2iERek+KR6753jljuEUaFCoYD2+83Wm6YWb/3IPwi/skFT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aztRpbAu; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BmNpwaoL; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aztRpbAu";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BmNpwaoL"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68SBAgOn1608470;
	Mon, 28 Sep 2026 09:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GAd6pns19h4FsA8pYOdxNQPmhgW4DV1VFhRL5350s
	ZU=; b=aztRpbAukxquoxt2td2uYSqPOdIYoBipIJQNNdw5WLI60imQsME2ZfENJ
	++0rxaICcyMRpI66fbqmFhUNwFLxIwc0fF1ucf2vBEDdSkPAb/dR9I5+WHKRdBgw
	BQaZgIOmYk8cGQGX27ozeHXRbJoS9NUpGx2d/pOvySZTKkewHdtsNtL4D1NB8x0u
	irbjuCLTKQpm0LZjvBdCg6WuaEIkqApPOpEy1ssQOtncaNxePpbGlmzkTI32l1xz
	UL0WrGQtsM/QGEn8PS+FmJITZ/UNXdbodHR/QfqkKz95Kp7dEr/ut/JYOr7mdo3r
	nnoNXpfNkHNheGCSxjKIG2TfSGpOQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2npe0a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 09:40:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIetQThJQqhWhymUXjiAapgNSXOWYdpiSwTS2uGlLVmFcXkHLCOzrj1YWQPmXScxX7cXKyv6wWCaW8fk7VTleHBg/mgKr41KJYnIqUBcEonC0Fzfk+FoehIXcSq2dr8sHPR9Bc1o0ZAClu55M65vurHw8VuH6GE/yKx3/pELo8ItTq5DsC3Te6dQz1MJvA5ioDnmt3jS3iQFfCK/pyQlnoV9aqDK4jI3SZX/m3wYRArRuIXMOqeejTVQ56+sVrn2a2xRdUN88yNNJ3HkQB4tQFXxI8ePYTQdYXWnLi9dxWj0BJ5FEb39aK/rhb52xEr26vWtl0ciB5yXjNpTCkWZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAd6pns19h4FsA8pYOdxNQPmhgW4DV1VFhRL5350sZU=;
 b=S5x7yuh+ZBnloyMcMrHvTe10ZonWyxLKSEJNAlRQ2QKbLvcZmt5JSnhKSS+am6/Xux+0zSdNOZRX1ltl65dPdtGSk2i7TXpJqaXfl4pquYATuFB58sda+O17ce36oiYWys7rft6q5zsrFPd3ECY4v0TzgnxA32ZBYxcReuB32msoN9EC8B7Mmrn8OJrXG7EAu4r9Rz4joQ6uQmBtGm9B1SrjTkVQkk1LU8LLPrBB06sMoi4S+O+AZl6poPEytizuaSFZVQYFFj26TY77ZCkHmGx6QoctBot9F97Mlb10kyNq/QOqOOj/iXpzK6buV9A1yt7xXVvRwF7o+H3ANebQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAd6pns19h4FsA8pYOdxNQPmhgW4DV1VFhRL5350sZU=;
 b=BmNpwaoLJZX6c2KpNJ43MYXStfbpbYdzcg70O5B5RjALej7DEO3pU9nCWluuUoNBonfzeOYJew0Ax5kalhpyhIf2oFQDtCnQSLtZJUZbmZSv/BPQqxMSfOTr5YPA0/iJicwowGvJst9lalYQGPdGbKZFkbXDe36bA1ApKeHoGYA=
Received: from BY5PR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:1d0::21)
 by CY8PR10MB6611.namprd10.prod.outlook.com (2603:10b6:930:55::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Mon, 28 Sep
 2026 14:40:02 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::80) by BY5PR04CA0011.outlook.office365.com
 (2603:10b6:a03:1d0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 14:40:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 14:40:00 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 09:39:06 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 09:39:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 09:39:06 -0500
Received: from [10.249.33.243] ([10.249.33.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SEd6xT3322617;
	Mon, 28 Sep 2026 09:39:06 -0500
Message-ID: <8cc7301a-653f-4a8a-85e7-41bdc9d9abd6@ti.com>
Date: Mon, 28 Sep 2026 09:39:06 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: Add ti_sci_dev_ops abstraction
To: Siddharth Karanam <sid9.karanam@gmail.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20260922191453.324983-1-sid9.karanam@gmail.com>
 <20260922191453.324983-2-sid9.karanam@gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260922191453.324983-2-sid9.karanam@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|CY8PR10MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: b153717f-ad8e-4983-b87c-08df1d6e606a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|3023799007|10067099003|56012099006|4143699003|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	cVNx+01qsJaq8S1bGgp+w9c1fHlRSxiPTUgCVWdjc40Abj9vqt/KDMBeU01Iz5wa2g/nKstL1F8w0hLZhh5x/teiuJiuBTqYJfl0MxD+w5PDyhD69kjEPS8xSVfMKBaancyEGmmyQXvP2SO6H18EsxXxC44LLbVcwF3CQKTPXTicoKFo1w7mk+O+cwlCzjmoPjQRD6jyu1BoUc4I6KQj1BDu62HXy8Q6Z1vVukhqiFxpSCw4PV7r1saqWYUxR1baJOQslv90pAmERVw10WT4JpzagfHt7FTAOJR7JXw+/N7/0PxLLGsNmOlihr/QjkxeRAN7Qm06TioQ592QU0OUza2g5eOMWsnCYGNWIgZNyX8yPtXEQel1rjJQMGTksaDu8vgQv79k/wZYdQtMbhJv3EIQiogY4vTDfJxYQK7Z4M/YzWF3k2gKnR5i1rx+U3n0QOUWJdCBIqdb/IRh2WK60ZHyXxSRZ9UrN+SKUqP55qkYD8RjWO4vEn/dOnt+U8hWA9fg5KInIPSnh+6tH0IpQJEheRtBR3QgP8gM18+NiKD32phttkCKdpWTqLtvSswLiMOI5UUNR2ZT6loMFA4yaqHONMxIozfWXQKLhX1FEKHqEsZLtIV5HjMTc7/cWL3wbycds30xiv2dptOrB/WIJg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(3023799007)(10067099003)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	we2680FoI3HEs49PV0PgePMUowEWaW0JzOhjzGpods+9sNYvemj3UNPF4CYO2iqeGjlB2D/8QZw/B/FF4VyzTDhvFjl2CkQo+pRQAr3HNUp6cFJljIho8mgHqaKOwXSLiHYF0EpbTKDAuAo4j7xDS0dNIClTSVkwLJ8bpLN/SGDd9AndL/3Wls8oM5EJy0+8pdNxTw0hWhV7GmqAIaklisBMhNTXgap70yCBv1IsUAPAeKV/Gw+CoZx7J2yjoqJUeVD06p5nKwKDmrvKczvatWDd59y4m5H6/NuKrN5O/O+uzyXqmf8fH2suNi+DV1ATxGEFyCuSZvLdBZdLcjoP0QAtlJekI5CxRsRgJV8ulP+MGwBy31OHeTQBXhZY8sdys2r0yrKtzl9azWS1VT4ZhUjDd1QFmNL9YDFKCZDYI1Vi8P7anJdYLiNnvDlTa1O+
X-Exchange-RoutingPolicyChecked:
	Q/WkDVQrZxJUdT9+PfoRpQEckLwJgyNiPPEZhzTx5syuWAr79celzPQArWjowqqpNqIrbzAwhz9S9XO0XuxILWUu4l9oWvFQ/qCtLDvNpAw0YCW7/ZxTQzpTvsx8g2ULll5sWnNSMfVmdruiE2aNYthiuHofy5FccOFpELEsKVKcbsJI/sVEClbC4T+lmHUoBNWKn2rrNn9H3SFc41mPRI8MyAHwrwy6vOcc72xR5J1gpcGlp6MrqDZzYwuZM/lKDLwgAae5Ki7mxre77ttTbU3z8oR/1vM3U5s5D9+6Y3mBLvL98mZPIcmioec8AAObwb32FKRlUwM4nCaOA3ifoQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:00.9768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b153717f-ad8e-4983-b87c-08df1d6e606a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6611
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX3pElatC3khvP
 OH2XPFnbdy6iljxnj1if9HL5N/JFZP8dnB5SfUIMyjS5ac5WBHjP3wiq1RPEmsdY6rJR8H31fuV
 EOcMkp6qdAOexZ4abara4MucSJlsTtA=
X-Proofpoint-ORIG-GUID: L5-WTr4EgzC1f9l6bZLg__FP-SCuOgZV
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6aba7c4d cx=c_pps
 a=beY4+7vfl+OHeoikwBMclQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=9xkm5mRPVq_RN2qXlsEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: L5-WTr4EgzC1f9l6bZLg__FP-SCuOgZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXxEUK9P+aK1nz
 sJmHgC2NVIEE5KG1MPaayW1mjilXrcyiUa1+4QcB28kNKhpD53PF50ZtYFH1XG/rAJsdbNG8t6W
 E7NOWu7JrBAHUbwyINqT1vhiMP2YscsFN3to7M0VtDjGbJZsykpfbxrqO57DIV4I1VnvnsP+BE1
 TDfnGuC3+ZWX2BISekNMWyJ7gM1FRdtQLy6LObMY5yFZ8qB+AqHiagW80shV71i3+ehUz0tlC/E
 xE8a2kNZkkXYq4oKkILvSOQkPsaBw+2O8gbBJKlCCtwtSMRg8Bm/Jxt3rN46W5y2LTCN/EZ2xNJ
 2LCDvW/RRpUGxr84RBymHwn+pTYvW2+CFGKCKrHYKt4LD+X+EtyKHHTTgcAwndxvamMyFcFSEfg
 MFW18Jd51Od1jgnPydOsNOKxjFq77jucnqDTf96OpTCVZmZNqLmvgt83liJhAtFh7GvX6yLNW7Y
 RYzYJOZObV5Q+M1ImqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058

On 9/22/26 2:14 PM, Siddharth Karanam wrote:
> Instead of invoking ti_sci_handle's ti_sci_dev_ops member directly
> in the driver code, this abstracts the property read of
> "ti,sci-dev-id" and the function pointers supported by
> ti_sci_dev_ops such as is_on, get_device and put_device.
> 
> The goal of the patch is to maintain a single source
> of origin for all ti_sci_dev_ops call sites. Any stray calls
> to any dev_ops function pointer members in driver code should
> eventually be abstracted through this header.
> 
> Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
> ---

The concept looks fine to me as it mostly just mirrors the same
abstraction we did for ti_sci_proc_ops in ti_sci_proc.h.

So my question is why not instead just extend `struct ti_sci_proc`
with the extra ops and dev_id, then add these helper functions
to that header?

Andrew

>   drivers/remoteproc/ti_k3_common.c         | 16 ++---
>   drivers/remoteproc/ti_k3_common.h         |  4 +-
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 14 ++--
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 13 ++--
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 40 +++++------
>   drivers/remoteproc/ti_sci_dev.h           | 82 +++++++++++++++++++++++
>   6 files changed, 120 insertions(+), 49 deletions(-)
>   create mode 100644 drivers/remoteproc/ti_sci_dev.h
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 3cb8ae5d72f6..befa9a9bea3a 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -32,6 +32,7 @@
>   
>   #include "omap_remoteproc.h"
>   #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>   #include "ti_sci_proc.h"
>   #include "ti_k3_common.h"
>   
> @@ -120,8 +121,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>   		if (ret)
>   			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
>   	} else {
> -		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_put_device(kproc->tsd);
>   		if (ret)
>   			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
>   	}
> @@ -140,13 +140,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
>   		ret = reset_control_deassert(kproc->reset);
>   		if (ret) {
>   			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
> -			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -								  kproc->ti_sci_id))
> +			if (ti_sci_dev_put_device(kproc->tsd))
>   				dev_warn(dev, "module-reset assert back failed\n");
>   		}
>   	} else {
> -		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_get_device(kproc->tsd);
>   		if (ret)
>   			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
>   	}
> @@ -223,8 +221,7 @@ int k3_rproc_prepare(struct rproc *rproc)
>   		}
>   	}
>   
> -	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_get_device(kproc->tsd);
>   	if (ret) {
>   		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
>   		return ret;
> @@ -253,8 +250,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
>   	if (rproc->state == RPROC_DETACHED)
>   		return 0;
>   
> -	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_put_device(kproc->tsd);
>   	if (ret) {
>   		dev_err(dev, "module-reset assert failed\n");
>   		return ret;
> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> index aee3c28dbe51..7ba0903ebe0a 100644
> --- a/drivers/remoteproc/ti_k3_common.h
> +++ b/drivers/remoteproc/ti_k3_common.h
> @@ -72,8 +72,8 @@ struct k3_rproc_dev_data {
>    * @reset: reset control handle
>    * @data: pointer to DSP-specific device data
>    * @tsp: TI-SCI processor control handle
> + * @tsd: TI-SCI device control handle
>    * @ti_sci: TI-SCI handle
> - * @ti_sci_id: TI-SCI device identifier
>    * @mbox: mailbox channel handle
>    * @client: mailbox client to request the mailbox channel
>    * @priv: void pointer to carry any private data
> @@ -88,8 +88,8 @@ struct k3_rproc {
>   	struct reset_control *reset;
>   	const struct k3_rproc_dev_data *data;
>   	struct ti_sci_proc *tsp;
> +	struct ti_sci_dev *tsd;
>   	const struct ti_sci_handle *ti_sci;
> -	u32 ti_sci_id;
>   	struct mbox_chan *mbox;
>   	struct mbox_client client;
>   	void *priv;
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index d6ceea6dc920..b6042fe7bae7 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -19,6 +19,7 @@
>   
>   #include "omap_remoteproc.h"
>   #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>   #include "ti_sci_proc.h"
>   #include "ti_k3_common.h"
>   
> @@ -69,7 +70,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
>   static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
>   	const struct k3_rproc_dev_data *data;
>   	struct k3_rproc *kproc;
>   	struct rproc *rproc;
> @@ -110,10 +110,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
>   				     "failed to get ti-sci handle\n");
>   
> -	ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
> -
>   	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
>   	if (IS_ERR(kproc->reset))
>   		return dev_err_probe(dev, PTR_ERR(kproc->reset),
> @@ -124,6 +120,11 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>   				     "failed to construct ti-sci proc control\n");
>   
> +	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> +	if (IS_ERR(kproc->tsd))
> +		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> +				     "failed to construct ti-sci dev control\n");
> +
>   	ret = ti_sci_proc_request(kproc->tsp);
>   	if (ret < 0) {
>   		dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
> @@ -141,8 +142,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "reserved memory init failed\n");
>   
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       NULL, &p_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, NULL, &p_state);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
>   
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 3a11fd24eb52..ddf8cb9974ca 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -18,6 +18,7 @@
>   
>   #include "omap_remoteproc.h"
>   #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>   #include "ti_sci_proc.h"
>   #include "ti_k3_common.h"
>   
> @@ -70,10 +71,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
>   				     "failed to get ti-sci handle\n");
>   
> -	ret = of_property_read_u32(dev->of_node, "ti,sci-dev-id", &kproc->ti_sci_id);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
> -
>   	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
>   	if (IS_ERR(kproc->reset))
>   		return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed to get reset\n");
> @@ -83,6 +80,11 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>   				     "failed to construct ti-sci proc control\n");
>   
> +	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> +	if (IS_ERR(kproc->tsd))
> +		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> +				     "failed to construct ti-sci dev control\n");
> +
>   	ret = ti_sci_proc_request(kproc->tsp);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
> @@ -98,8 +100,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "reserved memory init failed\n");
>   
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       &r_state, &p_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &p_state);
>   	if (ret)
>   		return dev_err_probe(dev, ret,
>   				     "failed to get initial state, mode cannot be determined\n");
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index b1d04d082e44..a387848ac400 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -25,6 +25,7 @@
>   
>   #include "omap_remoteproc.h"
>   #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>   #include "ti_sci_proc.h"
>   #include "ti_k3_common.h"
>   
> @@ -140,8 +141,7 @@ static int k3_r5_split_reset(struct k3_rproc *kproc)
>   		return ret;
>   	}
>   
> -	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_put_device(kproc->tsd);
>   	if (ret) {
>   		dev_err(kproc->dev, "module-reset assert failed, ret = %d\n",
>   			ret);
> @@ -156,8 +156,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
>   {
>   	int ret;
>   
> -	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_get_device(kproc->tsd);
>   	if (ret) {
>   		dev_err(kproc->dev, "module-reset deassert failed, ret = %d\n",
>   			ret);
> @@ -168,8 +167,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
>   	if (ret) {
>   		dev_err(kproc->dev, "local-reset deassert failed, ret = %d\n",
>   			ret);
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>   			dev_warn(kproc->dev, "module-reset assert back failed\n");
>   	}
>   
> @@ -196,8 +194,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
>   	/* disable PSC modules on all applicable cores */
>   	list_for_each_entry(core, &cluster->cores, elem) {
>   		kproc = core->kproc;
> -		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_put_device(kproc->tsd);
>   		if (ret) {
>   			dev_err(core->dev, "module-reset assert failed, ret = %d\n",
>   				ret);
> @@ -210,8 +207,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
>   unroll_module_reset:
>   	list_for_each_entry_continue_reverse(core, &cluster->cores, elem) {
>   		kproc = core->kproc;
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>   			dev_warn(core->dev, "module-reset assert back failed\n");
>   	}
>   	core = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
> @@ -233,8 +229,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>   	/* enable PSC modules on all applicable cores */
>   	list_for_each_entry_reverse(core, &cluster->cores, elem) {
>   		kproc = core->kproc;
> -		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_get_device(kproc->tsd);
>   		if (ret) {
>   			dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
>   				ret);
> @@ -264,8 +259,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>   unroll_module_reset:
>   	list_for_each_entry_from(core, &cluster->cores, elem) {
>   		kproc = core->kproc;
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>   			dev_warn(core->dev, "module-reset assert back failed\n");
>   	}
>   
> @@ -827,8 +821,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
>   
>   	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>   
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       &r_state, &c_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &c_state);
>   	if (ret) {
>   		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
>   			ret);
> @@ -1023,7 +1016,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct k3_rproc *kproc;
>   	struct k3_r5_core *core, *core1;
> -	struct device_node *np;
>   	struct device *cdev;
>   	const char *fw_name;
>   	struct rproc *rproc;
> @@ -1032,7 +1024,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>   	list_for_each_entry(core, &cluster->cores, elem) {
>   		cdev = core->dev;
> -		np = dev_of_node(cdev);
>   		ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
>   		if (ret) {
>   			dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
> @@ -1067,12 +1058,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   			goto out;
>   		}
>   
> -		ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
> -		if (ret) {
> -			dev_err(cdev, "missing 'ti,sci-dev-id' property\n");
> -			goto out;
> -		}
> -
>   		kproc->reset = devm_reset_control_get_exclusive(cdev, NULL);
>   		if (IS_ERR(kproc->reset)) {
>   			ret = dev_err_probe(cdev, PTR_ERR(kproc->reset),
> @@ -1087,6 +1072,13 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   			goto out;
>   		}
>   
> +		kproc->tsd = ti_sci_dev_of_get_tsd(cdev, kproc->ti_sci);
> +		if (IS_ERR(kproc->tsd)) {
> +			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsd),
> +					    "failed to construct ti-sci dev control\n");
> +			goto out;
> +		}
> +
>   		ret = k3_r5_core_of_get_internal_memories(to_platform_device(cdev), kproc);
>   		if (ret) {
>   			dev_err(cdev, "failed to get internal memories, ret = %d\n",
> diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sci_dev.h
> new file mode 100644
> index 000000000000..897998a97d7f
> --- /dev/null
> +++ b/drivers/remoteproc/ti_sci_dev.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Texas Instruments TI-SCI Device Controller Helper Functions
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +#ifndef REMOTEPROC_TI_SCI_DEV_H
> +#define REMOTEPROC_TI_SCI_DEV_H
> +
> +#include <linux/soc/ti/ti_sci_protocol.h>
> +#include <linux/pm_runtime.h>
> +
> +/**
> + * struct ti_sci_dev - structure representing a device control client
> + * @sci: cached TI-SCI protocol handle
> + * @ops: cached TI-SCI device ops
> + * @dev: cached client device pointer
> + * @dev_id: TI-SCI device id for the consumer remoteproc device
> + */
> +struct ti_sci_dev {
> +	const struct ti_sci_handle *sci;
> +	const struct ti_sci_dev_ops *ops;
> +	struct device *dev;
> +	u32 dev_id;
> +};
> +
> +static inline
> +struct ti_sci_dev *ti_sci_dev_of_get_tsd(struct device *dev,
> +					 const struct ti_sci_handle *sci)
> +{
> +	struct ti_sci_dev *tsd;
> +	int ret;
> +
> +	tsd = devm_kzalloc(dev, sizeof(*tsd), GFP_KERNEL);
> +	if (!tsd)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
> +				   &tsd->dev_id);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	tsd->dev = dev;
> +	tsd->sci = sci;
> +	tsd->ops = &sci->ops.dev_ops;
> +
> +	return tsd;
> +}
> +
> +static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_state,
> +				   bool *c_state)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->is_on(tsd->sci, tsd->dev_id, r_state, c_state);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device is_on failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->get_device(tsd->sci, tsd->dev_id);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->put_device(tsd->sci, tsd->dev_id);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
> +	return ret;
> +}
> +
> +#endif /* REMOTEPROC_TI_SCI_DEV_H */


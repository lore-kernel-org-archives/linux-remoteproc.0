Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324A457F73A;
	Wed,  9 Sep 2026 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970080; cv=fail; b=YOwZyLrEVAK8sFuWGoagJM5SQmzFb37NEquMlASRjE5ABP/a4+oZce0CCoqABF+BmDFMHsS3lB1/m9QhSY0omlp7Uj+FgdXdnFlLSTyvAxXhN1llQa7ZhrVEawgPMGyjQEfFncYipwqhLFq6NHQVh2lTZaVSYZhpog7ouA2qRqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970080; c=relaxed/simple;
	bh=sH92invQSjGyzhLrp4G9Au9jB8LhY9gewuIKdcPmsjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XbocaiTXdi1muvareWDG8vOoTO+PzDF1lMbyx/BesUoHBIQzZhQnvX8y7r+hFs/0/OhGe7CsXR8wSJDVWNv7tPnAe+pQJRsc5ilxfdPPWcKRBVQw/yuzxw3PyV4DWRMUHLghFCwVacoGfG9YqhzUJMCQKYu9fqqvP9smtAKFWLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=apgw2Kkl; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PatwRj76; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="apgw2Kkl";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PatwRj76"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689FY0EL122276;
	Wed, 9 Sep 2026 11:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1H2q95gKY0BeNYEHGSfvmbGgdSmc4DWn3n5234h96
	0I=; b=apgw2Kkl42QydzmSxQGQ0AhzHsJBKSChi6FcwH2mBOGnRi9EPglcbtn0x
	nUul7ccW7t+enY8K+BES1+Q9YHgmwOHIx3AHuPZqHaewG7u2vnkbT28TCJamHcan
	mjhYIbQ/h+UTk+s0f0DLLtzKT2nVteA5uL5HJNadBfW88sxUZj9HEWIs61IXRgK3
	RMT3L3wozsGPi575zqqzyFPC1FDF1ypjpMirayLELuycdpVjDhf55ycDm4F083oz
	5eHFfqQ1+jdxPJs3Zaqa07vWvwYDczr8V6uCafmDWTnJ4urPlhvRYjx+JhaXTkH1
	eelR9h0L1DR4Xn1IrMvf0W2MutzVA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gk4a8jdeh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 11:07:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOyrADVJgaYDQrdkAHvAo+BRHD1re5jzfDEyk4vwlLPxQt+0mFNAdCvtABh7V+4+PW+xrHTA90qnhhSjW20i7bUQwG9wflSKGiOFkd4Hz0I/7VZw3y1rmTU8GzW08g8MmviQCHv311kzVkF8TBaAEQeksyx2sVV4fRAbuFRAfcMRy/+FYCeegJIEPCz+uQQTWAAGoQ7sTlMQzmJxiNfEwQjxVU+TPwxX1HgoN4yM/+AUuD8zbEC/VhAsJBB1cC5RyN0xSj6m1ErA25BkDemP40XM0Jv1SXwUOXkFLjl+7omeqZuO4y3EmpomR5VqNK9U67Z9zjb4BXbA/W6PHU5wGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H2q95gKY0BeNYEHGSfvmbGgdSmc4DWn3n5234h960I=;
 b=hCNfFuzoAp4aeavEuRP2Y3a+iie+xe4sQGXLr/BjyoVwQiITtUg97uu3QWYQmRqU+h5bi8h91tea4a2dpJxeHmnflW+UBggTrJgN5Wa6cLNk/pXWvIHcOyt0SaQbtBFo1heazzMb7C/cYR+2n2QHf2LCSgiYj1tD8/GcX7iqjM7VTgV3ub44YajROobvKnT8tuDKyB075pa0ObSRKWd1mL5BoRvCaK1/W9by4cp5Kwg6NpZENH+x6880MmCkE+woTf6vH6hyBVypzlDsQLa2VHI39SSkGPVsvoDHj8qfq9AEOo/0v1xC9wfhnr0qYOwiWbFbGbr/ycF8IuZ2ydOW5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H2q95gKY0BeNYEHGSfvmbGgdSmc4DWn3n5234h960I=;
 b=PatwRj76HiZxHSrj8aVG50U+DG63NGvt5iGYYcwfj/YHnctXJRmsWgU+QI0rDeZX3GeZcHHoHeCNGuAyui/s/IEJMN0ZfOLNRyYrSghlGpwrcjGzppK/sCZ3JvFvIL9aWpHnEBEr+0dYW++8K6PjaLPO4t3QnL3HtwcOTc4Rjrc=
Received: from PH7PR02CA0022.namprd02.prod.outlook.com (2603:10b6:510:33d::20)
 by DS4PPF3984739DB.namprd10.prod.outlook.com (2603:10b6:f:fc00::d15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 16:07:45 +0000
Received: from MW1PEPF0001615C.namprd21.prod.outlook.com
 (2603:10b6:510:33d:cafe::4c) by PH7PR02CA0022.outlook.office365.com
 (2603:10b6:510:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 16:07:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615C.mail.protection.outlook.com (10.167.249.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Wed, 9 Sep 2026 16:07:43 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 11:07:03 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 11:07:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 11:07:03 -0500
Received: from [10.249.32.135] ([10.249.32.135])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689G725V600197;
	Wed, 9 Sep 2026 11:07:03 -0500
Message-ID: <6d91cb0e-45c7-4ae2-be10-1e930a2fbe4e@ti.com>
Date: Wed, 9 Sep 2026 11:07:02 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] remoteproc: k3-dsp: Fix usage of omap_mbox_message
 and mbox_msg_t
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260904195634.2275867-1-afd@ti.com>
 <20260904195634.2275867-2-afd@ti.com>
 <CANLsYkxzv53oxQ8NDaNM==u3xE0e9u1_BUUFCbNS+Xfcy9Yupg@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CANLsYkxzv53oxQ8NDaNM==u3xE0e9u1_BUUFCbNS+Xfcy9Yupg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615C:EE_|DS4PPF3984739DB:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7d5c72-66f8-42c2-3583-08df0e8c7b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|4143699003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	w6GRkEXcesZNErEWe46onYFVAG8qVdX6C1yRcGSyVBJhZCgqL73mTsWUlr1IfDxRdT4ia33gGVfX2Qy6gougQX4h+r1KjDqBDKd2rB8eLOub90NkiTg1nHMBWfEtoy4sztEoIDizMAGp5bxZQxi7b3TSApkbjsbcyY2tVtPH6T9rLF6/fkk2acYfnfYD+CpB8fS2PYGlL4tqBZYRgwoxZrKnjiUi7Eaa6+/1Oafym8bHGJbNkmdX6DBZs4Z8khzrlVmqiNq/lWyRszKTwWyW9rNPtJvbVfMJpF1Y1IJmbfGL+JtjJeWd78NkkHLJ81Y7N16kJmUkgp2bGDJHK/xNPTFNBla+QewU05xSMI5bUbg+JXEcFJA5S/a8jUq2XaElpRu3IwLJ1HksQkSWSBQzSr+r34g8QGbU7m84/N/mV6pbekuuY2Nvseet2p2iNlKA7q5mzJOahhcQMHTPOFrlfIjpjfbRgsMboGhBJ46Qw0Gie45ohbK1T3DXsX8OpcxvqkdqFqPJ+aFLnA1yYA+wFBKwE5qL8amfMiePF9TEuyWfpIBq1Ny3qvkARU5vsqOg0DpaCeGXHwJSX4wh/lKE5sRWRF83IVnB3RNyX0/lv/VdlsKizY0CrJovVxvgO99EW6CKF1uDhAz2mV0IJvGwgATE1jEkqjHjzCzMpg70N2SJXh2FvJUglnMt89HI+Kkc/kpbNELp3sibEfuNqiO6wQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	npJZBt9rD62+liahV6R2qCtT/rl1gS7QakxhNa3Fm/e+poJcBHfwKwfug02vzPzjqlzNPwFWrHVu25nmk9ISUF0zVTrGid1HVQ2ua/QyVz0TVfZAsegS2SkMDkbgG4a14lO+9vUi09W7t+n8hxC2r8b44RTulIpPGEGKkWu6uYSBA9KKF6nUvGv9SRmOvwMNzhTAxcZpJzimCG+oCBYJkkS9wW3+cuM/2tUYafno9kGqXV4G00oE13S5h98iAEP0CqoDaKdM/TRP7MPRAFDpHfOiNufQHQjxkMA1jAx7GOR20BA1lDgTELUYn65loYllYG/WXUJ/Btdtk+6N4PeqFDN5e+OiIPBCM/Zibh+VNjDl8No/u8HXnl2gEUbdIvpsjalM4Wfnw45v6TIaekOZLgOcX49Qk1mM9v1M8rhIcoIuVBHmI42QFIFLKYi/xfCx
X-Exchange-RoutingPolicyChecked:
	zxmAmlwgOrdrgjOUndNyuJrB0kFECrYrsO4rXDwK1+23Q6sqAH6UIS7LfnPyJOaBe5CJ5r8o8VusIyW4/3c0WXgiIHKiSnLdjgIO8YrRvvwTgTWjVS/iEG4Ttz/clmDIEoDsOiv0WeXaFREKomrzfr8S96o8rxUeO/hXCdi56mClP3arl72CO2/cTERFKtU9aOUh+Eb1j6IMfSNB7wuq6yki4uMDZFsCS321M3NZN4kE9aelWWn8VDLN+TJpI1FLaBp6y/9KGK6d5qkKFUSgsvxtje0keS1DhmsZ+bgEREhqIvylspNZ7XTyi+hJiliVLHYhnp+hlE6wRcOFK4ev2Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:07:43.9264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7d5c72-66f8-42c2-3583-08df0e8c7b87
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3984739DB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE3OSBTYWx0ZWRfX7rf4iihrpmPz
 p/oYqa9eJN5WgAHBigeWGtw6IFBroQEfITwIeyZ6dgx4lSmVRf+8koiPjCKOQVFJdAWANspFCI9
 ZC9Pn/17JC/KLLkqVOYYgmU5pLxf46xFUT1RZO36j/I5jguxpLrA0EDzxRIev2fetOgsDVpc16G
 XEua2+eSXcGBA1hECFra3aumjpt+kiQeN/l/vz3Co5eWPJehjOYKrC4iHAP+BVltOFEVf+8aQR3
 P3nH6AHVTybXoZyknMUpigxPuACmbbMClayY5uySiHdZH8MqH/z1kCt8Mj3VUiYaHFqdPz4xOoA
 iJg+zJRayueps/K/MhHwzOM46fOJ0GJNgmJdrgOQcnMMgmWWROlv/iU4OybQNmA4wj4EbziTkOG
 5TC/Cz1Lv0SJQzQQQ+Y0e3FO/hqdl+WM/X0xVHlYdrwounCyeasYnrAkZShR88FwZQ/Z8g+DHIJ
 eYeOhEZXpQ5yBaKrjxA==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6aa18459 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=nLAFwQByviZN4qJGt1YA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: F_nXo3O824xQY-e7GUBQGqAV7FFz02cT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE3OSBTYWx0ZWRfX/J7XIE0UNCdP
 BYsIHdlCHWAIciMemxYwMyQcEFYwRax1x87hfaq9LbGxTLVTq+mkgKVyes/7ABCUtOIBPU0Lyg5
 FNO92KMUrRhO3i9yoheYunOY/wvKcfk=
X-Proofpoint-GUID: F_nXo3O824xQY-e7GUBQGqAV7FFz02cT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090179

On 9/9/26 10:48 AM, Mathieu Poirier wrote:
> On Fri, 4 Sept 2026 at 13:56, Andrew Davis <afd@ti.com> wrote:
>>
>> The type of message sent using omap-mailbox is always u32. The definition
>> of mbox_msg_t is uintptr_t which is wrong as that type changes based on
>> the architecture (32bit vs 64bit). Make the type fixed to u32.
>>
>> This then means we need to fix the helper macro omap_mbox_message so it
>> doesn't cast to u32 twice. What this macro should be doing is converting
>> from the message type returned from the mailbox framework into the
>> omap-mailbox type. When fixing this we should add a macro for the other
>> direction (from omap-mailbox type to something that can be used with
>> mbox_send_message).
>>
>> After these changes, make use of the new macros as appropriate.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   drivers/remoteproc/omap_remoteproc.c | 10 +++++-----
>>   drivers/remoteproc/ti_k3_common.c    | 10 ++--------
>>   include/linux/omap-mailbox.h         |  5 +++--
>>   3 files changed, 10 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index 6ed0f28edac9c..efff95b8e363f 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -499,7 +499,7 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>>                                                  client);
>>          struct device *dev = oproc->rproc->dev.parent;
>>          const char *name = oproc->rproc->name;
>> -       u32 msg = (u32)data;
>> +       mbox_msg_t msg = omap_mbox_from_message(data);
>>
> 
> This patch looks familiar - was it submitted before but not merged?
> 

Checking the archives I see I sent a patch a couple years back that
removed the omap-mailbox.h header as it wasn't really used anywhere.
This patch kinda goes the other way and fixes the header so it has
some use.

> I'm fine with this set but would like an RB/TB from someone else at TI
> (for all 3 patches).
> 

Sure, let me see if I can get someone else here to independently test this
and report back on list.

Thanks,
Andrew

> Thanks,
> Mathieu
> 
>>          dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>>
>> @@ -550,7 +550,7 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>>          }
>>
>>          /* send the index of the triggered virtqueue in the mailbox payload */
>> -       ret = mbox_send_message(oproc->mbox, (void *)vqid);
>> +       ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(vqid));
>>          if (ret < 0)
>>                  dev_err(dev, "failed to send mailbox message, status = %d\n",
>>                          ret);
>> @@ -628,7 +628,7 @@ static int omap_rproc_start(struct rproc *rproc)
>>           * Note that the reply will _not_ arrive immediately: this message
>>           * will wait in the mailbox fifo until the remote processor is booted.
>>           */
>> -       ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
>> +       ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(RP_MBOX_ECHO_REQUEST));
>>          if (ret < 0) {
>>                  dev_err(dev, "mbox_send_message failed: %d\n", ret);
>>                  goto put_mbox;
>> @@ -777,13 +777,13 @@ static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
>>          struct omap_rproc *oproc = rproc->priv;
>>          unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
>>          unsigned long ta = jiffies + to;
>> -       u32 suspend_msg = auto_suspend ?
>> +       mbox_msg_t suspend_msg = auto_suspend ?
>>                                  RP_MBOX_SUSPEND_AUTO : RP_MBOX_SUSPEND_SYSTEM;
>>          int ret;
>>
>>          reinit_completion(&oproc->pm_comp);
>>          oproc->suspend_acked = false;
>> -       ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
>> +       ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(suspend_msg));
>>          if (ret < 0) {
>>                  dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
>>                  return ret;
>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>> index 3cb8ae5d72f67..4b6da3363f6c2 100644
>> --- a/drivers/remoteproc/ti_k3_common.c
>> +++ b/drivers/remoteproc/ti_k3_common.c
>> @@ -54,7 +54,7 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>>          struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
>>          struct device *dev = kproc->rproc->dev.parent;
>>          struct rproc *rproc = kproc->rproc;
>> -       u32 msg = (u32)(uintptr_t)(data);
>> +       mbox_msg_t msg = omap_mbox_from_message(data);
>>
>>          dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>>
>> @@ -94,15 +94,9 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
>>   {
>>          struct k3_rproc *kproc = rproc->priv;
>>          struct device *dev = kproc->dev;
>> -       u32 msg = (u32)vqid;
>>          int ret;
>>
>> -       /*
>> -        * Send the index of the triggered virtqueue in the mailbox payload.
>> -        * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
>> -        * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
>> -        */
>> -       ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
>> +       ret = mbox_send_message(kproc->mbox, omap_mbox_to_message(vqid));
>>          if (ret < 0)
>>                  dev_err(dev, "failed to send mailbox message, status = %d\n",
>>                          ret);
>> diff --git a/include/linux/omap-mailbox.h b/include/linux/omap-mailbox.h
>> index 3cc5c4ed7f5a6..e45f8c3841c23 100644
>> --- a/include/linux/omap-mailbox.h
>> +++ b/include/linux/omap-mailbox.h
>> @@ -6,8 +6,9 @@
>>   #ifndef OMAP_MAILBOX_H
>>   #define OMAP_MAILBOX_H
>>
>> -typedef uintptr_t mbox_msg_t;
>> +typedef u32 mbox_msg_t;
>>
>> -#define omap_mbox_message(data) (u32)(mbox_msg_t)(data)
>> +#define omap_mbox_to_message(data) ((void *)(uintptr_t)(data))
>> +#define omap_mbox_from_message(data) ((mbox_msg_t)(uintptr_t)(data))
>>
>>   #endif /* OMAP_MAILBOX_H */
>> --
>> 2.39.2
>>


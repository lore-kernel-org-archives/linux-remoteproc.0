Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582352;
	b=trxzn5RZZxB7O2ggiYgiApv1tvza/QGz0NSg22WLqI2W+F2deDPu5CEWx9zHXM+GLldH
	 PcJj4C1bp7P5Egs0CBQBTMcpLlv5mbY65ZJ4Xogcryi+bjgKD/BP+DOzwAdr/qZguu3Fv
	 9AC+detrsS+ND20hMytSJrRX+4ZN6VfbwSzoTJ6UPA5LpyViabhN2V4S21q+pH4GBGvkC
	 /cP0FHIiT4ptSXO8UE5VxbtIZgKP2EO7EgUneqrmu5kbQ7PfFJQQHP0lTCdO1rlHGK+5P
	 uTutnqvO2dihPa3jnjMe+NQx7QVOcjCezfrOJ3GrSYl5Eqo0ogRxgnlEtvk+sGwyRvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=;
	b=MvSr3gLLxRcdvQqFReIOy8f+1nUU6yp0yfeTRziO2h+hTI2a2/k5ykRsN4ve0WK/aj0E
	 dvbFdJlMHrP+87I14sBlAQCFQChLfdU6WF8qdE21nV2cUAJ26NPdu4ZoFNJCznqR6to2j
	 lB6UDniUtM0LmjsIvNfJtwG2jaGugK+4j/1BCXMkfivqDqGwVTNCY0BljHrE6krGSYhcZ
	 zLISuRUydjbfpjm3tYJdAiwPRARQjuUEhrW1FXUYxqJjxbKtw/F+eQy1GktqyI9T6F1mC
	 JICFOZMmJFIUCh2slKoVtFO+AfO4Td3SjUzTdV1JdbgzrQZO4TA0BDkYwgQqRyDLA0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8RcDq9l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BX8vv8eG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2150606A321
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 11:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2150606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8RcDq9l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BX8vv8eG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6HVb4170559
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 11:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=; b=l8RcDq9l3hlmBKdH
	rHQYwc1NxJzwU37rKeIVvtCVpG8tsm7/8m+fWL+7YJUxZ6Vz3+cd8wWCQAS9o3c5
	UdJdmH9FKwP5kfwIwPl+6MWhFnTlVJPaPtLBL7lNfsIAWyL75d8BjyW6+oSjkyUJ
	ts9zKlfWRcQohLZIuyF4Kv2BswJmjxVnnHcFvKZONBDwYAAPXPzEQlklVjDT1vn6
	Pb+hBCG0A9MkIXgbz/Mn7vUDpELVFnNAi4axkd37MCHC/jFgEMY8ILSzysAg/KqK
	Fd+dyBGog6MJCbZC6DMF7dy2OC4ssqVHtW3J9pskxoTBWqBA/VRpeZn2rAqlwH9F
	yNqkLA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hunk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 11:32:20 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc781089b9so11749137.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582340; x=1793187140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=;
        b=BX8vv8eG8yWLU8t59zgLyYucAfauxQu/MVcVqHl2vpjylDXahr3wVfRZ06iW+ZRxJ3
         6CWxW+zygFXhtz6Mo0HWMDW+qYuhan67+2XfnOIsCx/eUxFo18/ZCv+mTDIQ0lL78nCf
         ++Gp8KseVbLeJnMZiTP7oxohYQkVXc5YCsp2OoqoAQSarSBiwktZdIoH/MH5YUGiitZX
         8/W+EWcAT/xerh2c5R29x+CvH/LUYiyJ5lNIPfZuo3L3Ekkobw48/y5UYm4d+tcnW06k
         vUqZiN9eCLUnPXAJyNP7twozyjkXKQr4Bm8pDd9pRWFxA4FXR7vOku5T6bbHptlJ3J/k
         Y1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582340; x=1793187140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=;
        b=lI6tO2FVj1pXoxjfWZLAYMiEX4VtP8c1aHWY/QJBOtkeLKVA0SbxN8m9g5lAPxMOL0
         ZaMfRu5rvKI8K4pQoABBDx+QbmrxCnIUR8FNgeAxNvMd8XcPoVglaPhZi0ITIIzt4zNX
         btM+D41g3nxrk8loAS0qpajWy55Qe16HlrtrIkwtC1/z8S/OAADyaQeGxnw5lNLkCypM
         3JTGPhNBWhokDqbC3Yf/BrWQm0tBf76h3fj1+fdzNX6si4uSg2AGyXzyAI5/gnlwD7js
         mUZ2PS9oB4FwtrSNWYOJhy0uqox4lAl2tSGi3VsvDggR7siBAIAQ4kjYtq7osh0TL/QB
         W+fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe+cS9x3m24JZ03W5aL2t0+xk+fo6d3oO1vakz582a1XP/Id15n1re97UGRpMnfH4wCrmASuwR3Bcg/CmCg+9v@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Xh1gQOGZMl4DPotc3rcpwbc0+8XdZ4UXFA2I19I0Ln+cuQL3
	GFXtHCiNpTixZEk5ONwww0jrRnwQd/u2mKjIWjqRN/7zFMYsRhFMMqyPpYljRWtJqUthALcuf/A
	eHnWHtmC8qDnHatipCbqAJ3chc0NdPKLuD3KQUEenQbdRJd9dEcbnEf07/ntZV6n8lVvwh4FS
X-Gm-Gg: AYBFou2z70XctflwrE+GQ7AlWgDMFRJBH3iVxAQo7ak0p8gDZJznGywxnmKsFMe7AjH
	v2bUwGMrpFqcN9igCp8pLtD6bH2jIOSqneEWx59yrJolKzazfYaUGgri2vvzp4tp/DObbJpCbYj
	w8X5ptAVF7mQMgvJvG7WZurBdDlVhC/Hxa11f1rxBCg4ryakQMWQfe3cKQCpwCQ+RX/EvV3z2kj
	3vVuuG8V0TKHwLB2IUpB1ZF2q6JCJh4rAkjwiK2u8AK4w+6yD5XCTn9AleRJAvLHciP3ztOu4ea
	4WHW5OiDNKcfgFa94zEwKQQN4n7x7V3mKlvSiCEDv4CIqjLxIG9smqo90mnWe7irkf6Nbr2Yx3p
	lJ1wadKYHAPQWIwgoxiMBlQ==
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr467051137.3.1792582339551;
        Wed, 21 Oct 2026 04:32:19 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr467038137.3.1792582339070;
        Wed, 21 Oct 2026 04:32:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fafd25sm67887866b.47.2026.10.21.04.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:32:18 -0700 (PDT)
Message-ID: <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:32:13 +0200
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and
 qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8a2c4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=25W5T12MUkcB5wj6RmwA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX9WvvLuPmCyBc
 z8GTGNQLWPdbMoaTQr0L4K6WQiuBT/PCgGPhXAg4vKSZDyUFBO6NfKX9tNWAHUz9Pr4UTMBSwY3
 kOStpTH9CObJ0+LW6zo5LR3YuDj2ttE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX+81bDXlM/jbT
 /Y0imvEztMx2bvPw5Ev33i9LXkzlttITnhZ75uPKug2nfz2BBtxWlFfceZ1KIJ3IAYTt8UfhBxx
 X51S07lpuTANA1A4CoBjDTaNmrt16cy9z2XKIL29VF3tag7h+X7zEppGyQVp9E2aMhMcnvwuGyK
 +BG/tKFaOTCbzA1z96l1gSGi00QQFFhxfx4rmfMpbjFI/dISy3ncyPT5aMRvhEiXWmlGjx+VQTr
 RD8B2moqkX29ji3LgL5RIV5TeVFHrXaaoIbuD85jST0sQk/z4S/0J+3ehgrqQlKwaLTumL1Q+8Q
 MnNjvY0ZJ7/JJYUyXZA8IFGoxbkwl46niOj6ajOQ2f1DvjiDdVzYOnklGTlGXdE38B/Cd5ddrs+
 YPSkehyxsvfRAT8EhKPg77pOWN0yApFFJbX6ysn+XwLhsAg548fsWEkvoA8go7a1IgHXVg/ESOH
 eQ2EB+v+ofj/kWPh6JA==
X-Proofpoint-GUID: ywEDE7UhTIRl1JfDtddmIYxnMPCaTbAB
X-Proofpoint-ORIG-GUID: ywEDE7UhTIRl1JfDtddmIYxnMPCaTbAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045

On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> public function, migrate every user to the new PAS context-aware API
> qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> 
> This series migrates every remaining caller of the deprecated APIs
> (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> 
> This series is based on top of although no dependency as such.
>   firmware: qcom: pas: Make MDT buffer retention explicit

LLM has the following comments:

 1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
reload, because qcom_pas_metadata_release() is never called
(patches 1-6)
 2. devm_qcom_pas_context_alloc() is called from repeatable runtime
paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
 3. use_tzmem is never set, so the shmbridge prepare step never
runs on SCM and the commit messages are inaccurate; TEE gets
a real mem_phys/mem_size change
 4. Not bisectable: patch 4 relies on the NULL mem_region
handling that only arrives in patch 7
 5. Patches 3 and 4 don't apply to this tree; iris
iris_detect_firmware() still needs mem_virt after the load;
the base of the series is not stated
 6. Patch 7: NULL mem_region now means "map internally", which
weakens the -EINVAL sanity check
 7. Patch 6: redundant second ioremap_wc() on top of ath12k's
persistent memremap()
 8. Patch 6: ctx is set under one scm_auth_enabled check and
used under another, which is fragile
 9. Patch 2: the context now carries the full region size instead of
the MDT size, which matters if use_tzmem gets enabled
10. Patch 3: stale qcom_mdt_load() comments remain in
iris_firmware.c
11. Patch 8: no issues found

Konrad

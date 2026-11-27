Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772901;
	b=WUJ8hXXKFKCuW4j5I+kwBvV7cTteoVtRjAIZfxjrv6v6R0C9LKSVru2jNUi5R+XDdFEI
	 CWaPA2mC9sz+Mg0RyqW+mppRgn3xk37GjGPYAHMmQeNmU11Pe1bwyHwIy3T4p6zM/6RLS
	 1uRYMupN5576Ec+8OjcoXUwAT7G/xHcBaScjn8+rKCVmlZlpCEiwScmvjkYIWKXoJD8F2
	 Xli6/FUYvX7EkOdZySILiUF6abDhRDhomJERlGMUI7mAV3IfbDx25KdWrUTm12B8fMYAh
	 3nI1z9tFnJDj+wABmEInNJhSvqtd5dYnn46+foXPxHP6F8AR8P1QmniWq6XzO/BMIvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
	b=dYcBrJ/gJNXYdKHaEllMhJ/l1Cj2cQjT0OLXY56Msr+223l1SfYiDDt3Fgb/msEg1/QV
	 kCZ3owQGfBMHcP/NjztumDBezVx+zspEsoFLz5LdkaQwEHrD2oYMh7thre0mNFVcibS4d
	 wTcXJG89Bm+9awjb2OlfdeAN81grQJ48c2PByNfOoUEiEOvxql1tZUk9tV3515ijKF1NK
	 4fpUeKz7yucCVlUT7zeebnaIfNPb7lynjq8gyzxEmuzHY+hnbgsik/kgUiMynwqukFvnP
	 92ao6xd3KlOqWEqbfvqPNyWEySHU+4bPla7NWhdpsw4+Ga6wZeQ/mfmqRZ5IW6WevoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZjyaOow;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5oSXALr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58F0606A31E
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E58F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZjyaOow;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5oSXALr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GQjt1197178
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=; b=fZjyaOowGea9OJ+y
	GAEOqSDBMxGhKNfGZx7uZPHCGvgTGF7cYDktJ+48vi0QJ7n71fVLFWEaKm9b+J36
	eT8sSyaaZRkpnhur2FlvWo8rHMP7Eox8SSN3kHpbE9FxDWHIcCoeiLe9jV5HiEme
	3lywV8yDlxISOy4jsX/okmkRd79yf67B7IYkYTeeJBB0wInDq/jl9kw3yppHYZgu
	7uxSXwLFc+rfsFryUSRXbQV0ITAgQLapuEO3ftV2qg05zibPwYGSBacn9q4x87UV
	OXMzaeEAz/vZ6cF0QsbYIhFUh2BVyh8Qx3zbTtVI7shX8BkTH4/blmAOlp/Gkkhg
	U5LfyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k8mgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:48:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f033dc37cfso75193005ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772899; x=1796377699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
        b=C5oSXALre9byhG3JOjtRwFsImfkdKz+YfBXja4OhHljw9Sy/3w1onxdywOe/IRCqvW
         pCBCwuBb8GW0mBXYjj4S3mwOTfrll0/BScDexAXBHR1vETIpsZXAZXkpuqDmQo67Jmq6
         kQZFxZoKeeYe/2CossTflYtiQ3u/rDYjgr6Y7SeYckUd1fqu/dSdbSyldFQBLK6CFddi
         +mmEGt3VRzurMegvOrqsnwqiAzLQ0rPGdFCUwQfS99bFn/O9AkvdkcRz73G96gxQ5bmd
         oYSqxK8LgYANIBHkkUxqqs+8yv7vgLhMy9+7H8vAP6Y7vv1/mv5odsRN+Ktu9+SuSryr
         1Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772899; x=1796377699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
        b=VCM+YJPhtIBa3CXxNvJ/5WJS7tLJdWJ580dwucNpHvnYlXU5wpzxpTltIwoJeGukMD
         t7LF0t0Gwh+ThkqFqjK2f8MD+3L1ERN1WuDuJF6i2q9adkHR/nNQXGQC15XtnBtCLc+c
         kMFyRPXXTzNhHeFpPkLBLaOTact9tl2M41gYDMJLelRBOUrAAvUhXGImilKhZ6O91NDF
         xUgux0ukPgnt9U1CsptTEzdnq5BPCgDml7tOQNkMlSmtf2ZcM2/08nQkd+L1SivmaBZF
         A2DP439pR5AjH0kcP8/DGDA4hlnylNTUedvtZgdP7BDrR3zHivIkwb/thbhs7qN2KgfQ
         QhAw==
X-Gm-Message-State: APuU4Z+0R7iTyZ06w2YvLbuOA3Ve060gE+6rNVc2mVNCUBJWwEV+B05r
	LEJITLJP2SvkE3yR2UURZm3ZRbnUCcxnfYapUj6qoMzIgETnJ7eY8hciIkPmoOybPqH6CwjFIa5
	xLFnGLV8gsY6bLo4wvsnGaX23eqiYq+0JG/RmX3JOAA1GQDKS9/uzCiijt5F2+mV4rgACw/4O
X-Gm-Gg: AZFdTZedMJQLhYU396MhlgzdB0iNlwMlJgJA0hpML5t/9V66VkK7qfQ/pG+nwoJ7d4E
	iAhZFWjFMjlHLlRkkwwQ0Ona9rvijmWH9qzyqFD/7eZ8fYUOCSXjOsJ2ck0S+tJllC6r1qwoaG8
	5kTzsgIUqoxviuolw73eCD9fxCZK/TEgMFZzTq0/mw4FPHh5+FdURzz2Y08taTZ28eZlX4heFyw
	0EoWq77DVGsjFQ5NwvHVcZ+0EyXckY+T51gKBFTc0QK0yx5OfJVYs9hysB2Qlbtrpa43SZziqvB
	x7HkXqeR2OsjhLYMV69gYMqI6YhvDcxuIbDzeBdIjrJ8hXCSjqQC61R8N2CD9A8CEHrYBSJAcxe
	mKi7Tn4a17fuYsf9zMH1B1Oe/GqRMPwFHIsrWYyg37lccb6yyT5fTRTjFxyD0a2nCWwJ7neiDSP
	jhVA3KrsA3AXOwsHgtwKJJLIJAtjQblDuktmqV6ipay6mYDm8wCHpo76wcAK/34+dfZFnDRpWHz
	Yrc
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr233462895ad.66.1795772898780;
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr233462675ad.66.1795772898346;
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dbe86sm117153235ad.32.2026.11.27.01.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
Message-ID: <7a77f62b-7ea3-43e3-963b-e01b86e14e62@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:18:13 +0530
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
Subject: Re: [PATCH 1/4] remoteproc: qcom: Fix bounds check in adsp_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-2-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-2-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX6Y/An82y2sKr
 lBwJ3MNLkeMvm+j9vSJzjkVRWlQ23vgv3wc3AqkWdLie6ku5xa45S70ZGYzf9hAbbLVibSLFpQt
 MM/Y7gwf7aObpsGSCu0CqWRlGN87TWkV8+wJAhqAaPWLnsPvGIuFUzI3/25pTqaK/P+yCFg0tFl
 XUMB9JlM+OyTBvZhq1fFerSFL9eQWnVPVUpqZGjrsv+DS3g8hKtWH7Wp7ocYvhRr3O2QlKdCHxD
 3xONPLW4uXnYcj8b3QoOqD9wQDi4dZjQUUO3zAAMZJuVLbE6DaXvFQeFTwtteexDbiOE/TTRJEX
 KHG0CXUeBoyD4J/9zH4eol1bjF3BPoptNhGsCXEhpcokG/+dR6zgfa4hoEVc6irarZ/LzC+hqJN
 wYLzmHcN/Y+poiO44yrRgnpRtq7ZKn3xuTcRLgu6P5UmejnXqC3va3ei0dDHmF1eEV/XRctea8F
 ew7EbL/PWgjMizy3Spw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX4SxbL4x9Uh9e
 rD9JDmY6WxB2PyrOFC6Zh7M2+KZup6TK2Gv4R6tTXLreKByqE7lLx3nqOnzgI9ggflonugzgI+o
 qB5sD2QDPV4EExnWjIEgVZWCfSVmKwo=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b0951e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Tzi7ytpEPZjzls8BuX6ax9flGUXtj5Ay
X-Proofpoint-ORIG-GUID: Tzi7ytpEPZjzls8BuX6ax9flGUXtj5Ay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - adsp->mem_reloc and stored in a
> 32 bit signed int, while da and adsp->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> adsp->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < adsp->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > adsp->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Looks good to me.

Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna

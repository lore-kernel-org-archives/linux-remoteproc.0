Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483585;
	b=Ptb+BDPin2zcWSbwGqFkxawy4dGMDUYKmZzeWbFKkhzjhi4gsHZA2WmbPwTYOAFgmnp0
	 k/G1lJrsCdLdeooOk2m8ZrD67+Xn6zlcEpNBna42ZbVExGaJ1LN/k+EmfbDc5j2tWY5dC
	 cWMI3CgNfeSovHVfWpqYav7k7kTSqE8u/6G8yS5B4ZEAnFO5I5mWUA+n7zlXkKPE+53d2
	 NrZdhfhLmJxcLri64dhFe4lwXE8aGB4anojafUS4wVxWOdNrAhe6Xu0uhDEqnd7KK/vKz
	 grKsHnV54Y/zUFwPHLQV771p+XiOFToJMWt6/QO2zpI0lvdqgZusN6wrPwiiIbbIprg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
	b=Lg2LTa6VEYsS5jBOB46Wv7D1Wb8Bjl00ES/SHzQwKZlb5Zn1J5GGwBLGOwWopbrfhYe/
	 8XKvveZi4U+HeVY/94NERbkxBaxO4fWSnCOtzqCUcQ7oN81keQgTBOG4Hzt4wmXpNkkrU
	 aKArCqRPh/aQ7AMZ8puOShrPf3curcfIoJBmPHiNKI+sDwhRQE9hFB+0JXVl2nRgSOMzi
	 Spt9UO824iRR03PSxwGQaOlw5C50zG44d3smFb0WD33uNEARZpdyq1qO7iMTl/gg/jXi4
	 oRN5YsP3hyzLS5YY9cByBWF1W8Z78S00I35XaQ0PaQ+wFhCM0EuNVGmpG+57w2ecqKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpNb66Oq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ftzLpFoD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F355460A2615
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 08:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F355460A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpNb66Oq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ftzLpFoD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t6HC1210957
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 08:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=; b=KpNb66Oq1aRXfUnE
	ROS4fb8H53uodsq4JHXsH/eQt9SR08bcFIM0qWPot3jle7phvh+stibRceQOEYUB
	jumdSuExfPIM+TgERy/96l1u3ZkTccnSFB0ND9tMbFIeNZhi9pnY5Dz+M6cD9vt8
	wgjUxwG9C826lZVkASOGAKQ8TxsjjUCKBUTS8WYx6P6UjH+yau6WGT7sR0MewrCQ
	rsAeOYCmP46aFZJR8kfO4XK2KKi+9XvYYTq6y9vJF592TuqDSUx+AJe94fqR2CSs
	PYuqDWna9t8k96/ExrWxtMIOIvR12yEIXh9uknEiD3JMVHDkc+gTW60DfvDMpB+g
	1yL6mQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1hg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 08:06:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b89618384so3866036d6.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483583; x=1793088383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
        b=ftzLpFoDs7mkowakEA6xGdnBxVbSuueYihGxCs+0CE5vnN0Ebq4R8Sg1kOfL+kyNMT
         mO8eqDD/HbSBj/eEPZdD0laqWif/YeoWGVajNpyxgOV1lNp3DklDgeaaafKWcWYEBzyq
         iRpXIw40yV6BDhwhLIYLW9UlO/Ekc6xI5q/luqH2mIAZwFfbCUJCQB5Gc1UiSsJ8EIjF
         fTCbnn+NPZ/8karS2AdpX4JldyLgqnF+CfsYXn3UGlMhTkw5RNZ5dnQkjIqN98nnDjOX
         rhoRQSf+8+pOKQZ/v4KeFahB13afUKKBhu9qsrFpXqkK8Sg5mvsqUZgV6hCqBfUcsHdZ
         JVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483583; x=1793088383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
        b=tMv51La3auLzd4Ll7ihmd0i0qpJGx0TH7hsEVxYgTjXs9DyVRlMe5hdN8mJqG6upVm
         +pYU+aA3vFIvhbFViQS93n+aPvCa+1eedxAGI0lgtz00FKRnIdk+1mjjsA6xEXKnV/QK
         BDxR3yVhxPUEqlFGK7kIyWiZmsy/8FvCquous8D2YzpZh9JqJVA6J7K7E3hTG3V5RY6a
         a1swR/NL6dk9QL5YqlT2L4GE9gv84lZaVIHLzQhb0zHNDqfate/JLRW8ZFtSy+ihnSc8
         lkGDtU6CgvPlsdRsw5zG7ZuHmI0bjAUZfzby4w6nae750R6EFtQ5kCPNkZ0VTzIStsaz
         WYbg==
X-Forwarded-Encrypted: i=1; AKwUvBwuGeYBvIFWz40Z6TY7pNLxsR3YAJI4VQfhlYUrrJKgmhhev/ZhGRW4fmSnoSxvu684grqEhn2IHX1VodMuHbKR@vger.kernel.org
X-Gm-Message-State: AFq9FYIpkEPe+u/vpTP8iZPblAuaS5qzsxMfEXBGEbyRCK3RVv9WqnaV
	O94LodfY7wSnudLRGlNBUblHAhnbW1SZV8/nuKz7YJdBx598zbUftgz16w0dKMqmNEdFT5SLc0R
	0cI0Ec+nZRt4QOxliPGtOL+mD+Jq2n6CbzCAYVonG39iOw60t40X+UfaNAMLnyvhg4rti686w
X-Gm-Gg: AYBFou1qa3ai40gxfT1n3t7o+TULB1roqQm01WXiHcWL/h8OlClSNOT4TA6T6To2LW3
	mHNDy51AyL7z6ENuoUtcAeAvkZijiU8gc+V4ecwA6ld08jW6OhC3EvkpJ3n0jvmA+HV3TvnseUh
	Ivhql/vU2EoUDydWuhB4pGhZrsoMM/SQCE0iyiA0sNkjA9PE+B9x4Qi00Bqv36OGzqCYfTiVcr1
	UevMA0mPyWGfRWqARkfQIcEIcwLL/GAavfiqrfdNANx3colk52WovSLB2LD10GVpyGWnRnR8V26
	MjiTxEgKZmnmSdFixIu4V8/D1Q9I8PjJ8Nd7WqEeNrPdYuiNIfT06TTzdqJCnQTTJsmwNKh/lQF
	zWB9cgHdYXLdBEkucRjtiuQ==
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr127073631cf.4.1792483578913;
        Tue, 20 Oct 2026 01:06:18 -0700 (PDT)
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr127073391cf.4.1792483578436;
        Tue, 20 Oct 2026 01:06:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c466de84b94sm20989766b.65.2026.10.20.01.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:06:17 -0700 (PDT)
Message-ID: <d4957cd5-c546-46c2-81e0-b2afc14a4ea6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:06:15 +0200
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Preserve shutdown error in
 qcom_pas_stop()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-b4-q6v5_pas_stop_preserve_shutdown_error-v1-1-2adced730893@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-b4-q6v5_pas_stop_preserve_shutdown_error-v1-1-2adced730893@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UViYbd2wc6fygU503QaqQZ70ho1tHzIc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX+i73KYCAq8mr
 E6eHV32ZGdQY9iurYIghqmV89UzmCHLw4MrynSjm4Ua2nEEGtDWWF7hHS5GZIxBYQkoPbYd6KZA
 0O/jlJWO/rVV2uHi0g8uso0LH2nT50g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX0SrAxQ2ZcDRx
 ppn1U6NnIqh9/k8zY5OhpIEEwPzejUCejJuTqPeJW3wMg+dPKhOK4P5OH9/8rLDHcmOpyjP0ziE
 /K+VCF0OtAsLoY58Um53hgkYZlH5cszgghmctv74nlbzpZQElW82FlIPoF1n1YFkGkMO6L3VYt+
 WbVnuqDcOMTGYJHiYFfP/TiIhGIUKxHZOFvQsGrGp4G89ZTl0MOb6KUv1g9S8+U6+Hyq6PG7c0X
 mfU7q6CC/1LzagI3pFysbV0QDS2hUnc6Cd6Uzq+nG2GmVsu6atOIG7c6mw1k4v9/jA9l3XB/NWA
 aQFmqHL4ykE5gffRkPlm6ujhDpLDvZFwjX+Sw/We7qIl2CHZnzw3EX2aMJbTE09ALnKLPtWrMcJ
 2mdc1CIsYODnB0j6EQ1xTsM/g5NYiMfU2Ua+/I9QlpbrRhGcZ9KpVR4Aa7OF+TYKQxJ3Sq7ShM9
 Ja20NyVgxi1A0KQ7oew==
X-Proofpoint-GUID: UViYbd2wc6fygU503QaqQZ70ho1tHzIc
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad72100 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=v8fyVrpRRJkhpEgro6wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200032

On 9/21/26 9:33 PM, Anup Vishwakarma wrote:
> qcom_pas_stop() unconditionally overwrites ret with the return value of
> qcom_smem_bust_hwspin_lock_by_host(), discarding any earlier shutdown
> error from qcom_pas_shutdown(). If the primary shutdown fails but the
> hwspin_lock bust succeeds, the function returns 0, silently masking the
> failure from the remoteproc core.
> 
> Use a separate local variable for the hwspin_lock result and only update
> ret if it is currently 0, consistent with how the DTB shutdown error is
> already handled in the same function.
> 
> Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

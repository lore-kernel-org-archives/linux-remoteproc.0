Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFA66FC5
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736591; cv=none; b=oB5yzGABJ4nauoiE+3HRw3thl7oXSaMZHAEvGIsLUt2JdfelP34vVPWMAftmZxHNmz4JoSudwxJge/tKSPgABFbl+DKLegWQDSeQQgXcWiIw5E5nBSnEZhkNxX6yNo6NhaOlXinkTuT8H8/X/3D8+LC8gFFLM1sB20+JxrShT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736591; c=relaxed/simple;
	bh=fOd1vlATrzNbyl3rkNB9cxiicKWC6JmMvDCgEnlt5Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fs4icUPOfDgfW/+2IDOFkrMgmCCwo/mWSWxk8cF7Q7dj1ZvCBLXtYFyk9ZlxFqaZEHYinK1qdJC+0Hew30mc9GZwrCwKICAshm+2l8afXA1FSDqOA1JxHPxhuzGnVKTGRNt58ls0T4PTwHb60rqybopx0ZuI+5jXBJO/ofCIjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSQsE/3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyRiesGR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSQsE/3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyRiesGR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATR922592814
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 12:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccr431kUVmDQuUtWvidvL76eb4saCqdVGrFri8yjl1g=; b=fSQsE/3CdQ6xfPPc
	p2/Gx341qGxio8XPLy7t+l94WQrlYyaaewy35VCClw/aXOsieiqygXBdAb40FX3B
	mQZcV/xir/5RiYgns3g9hr1BsWFXOZRv0QNaRWLw0yYkbchRE/dCgs/xfUyUoxs2
	hMGXXadSKd10/iucNtAXVMPY0NZ8zTe2SqCsfah2OrdcSjjc5BOAqrCqSfuwbDJX
	fTlAQN6QWaSIKUXNpYKMtiybsIkfjSRrFOUo9Mo8JW5fzxFGxIWIN9MnijUIuJYQ
	ACSFADHh2gP1XsKqgMcPPpt1BZqomj3iaiUKNsqwa0o+yM23gO275EHoiDlQWJ/B
	K7tZDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhn26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 12:36:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso643961cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 05:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782736589; x=1783341389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccr431kUVmDQuUtWvidvL76eb4saCqdVGrFri8yjl1g=;
        b=UyRiesGRvXrW/AyJ5xQmCIPCUr/XaWrHmqzZt+V49L/1S3DcvBfZ22tHaWlMEBDFZ9
         RYY+yrO9tS/V+cFBKzqK7V5dg3Lvx1vI8xuqO3F9G0nM9vwuqiLYOJa8w/CClxucmyef
         g+uTiuXZw40UcbD+lgoogjZTkvTL84inn/CbFoz8TCrGTHuLq+jL9ydanU/dJUFBCSEK
         KM6H0kwKPT4mw+yt+gMcWUmxEEh+zge40QVgk+mnE1U0c78zggBvIk9D3o3ikupgjuCl
         jLNDQTNRxNSzbKclp/4cxEiNl0/vNNhCWcRfgZuzjxG4tAYb3BuhbnXtPieL/5mJi0JQ
         jo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736589; x=1783341389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccr431kUVmDQuUtWvidvL76eb4saCqdVGrFri8yjl1g=;
        b=KQIANSBK2PXPRhEQogUE8TFcpWt1a+VOyw7zUryCE7B++PsgI/OH20mjETIY9+hTXz
         41J8yvCHarM/qRIFZmF+aaXZqxmGzEIyMJHUisxJ5RHoMPBxNv2FuLiBHOxcZjkCzK4H
         ha/VrxGHvZqw9pgSQs/XyMZYubtwHAznfw7ZIZjMPtM6mIKQAQE5zb9NnFu7ygGJLLZZ
         ngXxLa4M1tkflxcYl7dSXxU25YwhmAXtPJhbC5lhk/zeMETzEnNzToMtNcKAZ4KIK3r2
         CDQdX29/m1ZGqIND4tsG2yeT2GhK+/INa03FDPCSyiMCtI9sHYK6Nc/feWJHyTrVB8f4
         QaLA==
X-Forwarded-Encrypted: i=1; AFNElJ/XM4/vdr9wF3bfbdvDT47PQoGiBmTr8+lSEDARE8sCHxsP48AYlb20K9p5fkD5DOza07SJa2ZwkGnoIy8qY1mj@vger.kernel.org
X-Gm-Message-State: AOJu0YzGrwqaKpAFWRsud9TrV6DIpXPQTzgDhp/VE2YvKVP9znKbweba
	6a1Ijj4hJyv8AjYqTtd/C3wFGPetxjxpAhxB1kMg6mJejT9kX1kx/Ka5SDAybZ2lCT8dyr7j7Yk
	Of3iQwW64cW4jNQ+80o6VZJoVkL1HhKMRDD+zJ/bg7qkVcijFVVSbdO0mTZvlRs8THUxbtcaG
X-Gm-Gg: AfdE7ckvs6pK5OWaYi56qrocAzVfRKnyyUb5uyJILtbCD9cVSiPSFy7CbVe/mgIsxME
	kl+EwFLHpZzRV+hf2EB4bDPBawisuHFsDPkQL8wbbKyHNNjC95fNBTddeYibcVZess/YLBjolV/
	N+jDF+f1EyP/MrjlaSb/Xs5CIEDUrrygNrS++cj0zp1cKitdZyAcodBPyh8ISIjGVJw3QVyD/m4
	l4EhRE0QcaZKak+QlhUac/Pu5FmC7eUKoZHEloOU6j2YPKLdjy72ltm7Hyba5eOSnrIniukJbvp
	qLhOUqHzLS2a3PRcTlLuJYoyDyEjK4m396F2AAWViQBmBavBYDDcXEup5rxOGLixOCxDjJ9bEmk
	s4sQupIbABDqUIMSVPVZSwXOswnGSPw7IR7k=
X-Received: by 2002:a05:622a:211:b0:51c:8fb:fa47 with SMTP id d75a77b69052e-51c08fbfae7mr10319301cf.9.1782736588805;
        Mon, 29 Jun 2026 05:36:28 -0700 (PDT)
X-Received: by 2002:a05:622a:211:b0:51c:8fb:fa47 with SMTP id d75a77b69052e-51c08fbfae7mr10319051cf.9.1782736588316;
        Mon, 29 Jun 2026 05:36:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c126ed2de5csm118170466b.7.2026.06.29.05.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:36:27 -0700 (PDT)
Message-ID: <dff71427-abbe-4df8-bed2-e3f489229a70@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:36:25 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: smem: order FIFO read after availability
 check
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Arun Kumar Neelakantam <quic_aneela@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tony.truong@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com, stable@vger.kernel.org
References: <20260618-rpmsg-glink-smem-mb-v1-1-68a026453a69@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618-rpmsg-glink-smem-mb-v1-1-68a026453a69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M4ARGLTQvVkNvsfN4kcGV98b3ic2eerp
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a4266cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bQgpNS1FtnsdpSD-sWwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfXzs9+Ka9ySdgp
 cpBaFfd18gcR6WVrmd9PRsDCvuhWPA8cqjeEn6np50b/0N00hQMw5suovgrqcUHjNPNsEixz94p
 WHukh+o8y2S9aOyHva9XQ1LHmWn6VHo=
X-Proofpoint-ORIG-GUID: M4ARGLTQvVkNvsfN4kcGV98b3ic2eerp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfX8KiNoRNOQcZN
 3gXl3k+zceZ+hKBBrxh3WksqyAqGxsrxYLmVdtxE/Fz1JT6OS3DOK04Pk0uKvFFjqXV8Z0suKLf
 IolkGUgAaZ0nvTprldJhQPATwfT9YLly9P0kdru5DV8FXNhXg1eNyG26N9q53UVeR/I4wwlDkY7
 wZJA67JdonPGOl0W1qGAhPnT5qbJ90+ql055CDavN2skV6j/EYP9jm0cSmLvK7guDzkjCT+vRO+
 j/FclEDtDd0x+v034RxprRvNmREx4B10IGuNJNZOy/pU2PwQM5hbVzD0g/F77EGFjYErwX7g11x
 PBW9lWGYh0/36kGI7q4Q7PYz/+R5ayP82acHDFkB1xPVHs62plLyQZ1ViLe29cLPtD/GZMdtDUN
 plULxGkRO0YHKWgNMpOWKZSsrVAY78MwiZwBhRgaLMZo3lF+oXLq2VHpDhK6WFpIvv2qIqerEqi
 wwQQKLnofHTNUmt6PqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290103

On 6/18/26 9:16 AM, Chunkai Deng wrote:
> glink_smem_rx_peek() reads the RX FIFO payload after the caller has
> determined data is available via glink_smem_rx_avail(), which reads the
> remote-updated head index. A control dependency between the head read
> and the subsequent payload read does not order the two loads, so the
> CPU may speculatively read the FIFO before observing the head update
> and consume stale data the remote has not yet published.
> 
> Add rmb() in glink_smem_rx_peek() before the memcpy_fromio() so the
> availability (head) read is ordered ahead of the FIFO payload read,
> matching the consumer pattern in
> Documentation/core-api/circular-buffers.rst.
> 
> Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem based transport")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

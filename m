Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772507;
	b=YJMHXQJ/OX1ZVuoU+4lPWOfbbX89wlhABA/PNrCmuhjqfnJUYwIBm1ysyUbPJ4eWn33i
	 GX49TIER338qfOwziQw8w4sXisWETB/Qr/c1v36w23ia0qxPkLae6QoXboawU+rEo8zmE
	 K1Waai2uUktO7HY/MRgjndoRXIT0Msv/Hf36M8uM/UMgIGuYxDoc5KvkAXq7/8sflWfTH
	 h4+Qby9/+ZmzPYj2tdYHlrKTeS0o0Z9zPpmns2ntFl2Gt0a7Mxta++QzXL3e/dn0nG8h1
	 imvd4EbTeMTx3c0kxkjPmTRzID8kHBmbMhoIqc45fmUiPnAbBkfqI1Lz79Q40adDtMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RdqSCJ/NcYPtxF3w3antuKaSQ1Vhmfw1KhJOl9INpIk=;
	b=rQmgyRRp3SAkmS1VKaGAJ3iWYO6PhgKqPRs47E3cDJB8xwSEXiD3CedU0x3iJbp7QAyl
	 +CnQLqcNIcMZI0EDZa1NySbiEaE7sciNwFaWm0liTc2CPSs/hS/on32GwmRPTrMRxAKSZ
	 GrTfKIHJS0p+iETkDxwnH9Ht+t1UPV9K1cCMYuU2sxm3ORugrC5RDvkqMXm0vm8ByCWY4
	 1TMtqKVxIMgPldeC+XyMsVw7TREDT1vOf3ZI12uhu/pjdorREZVebMM1LtLZD1UjepPHU
	 p/Pn2V9TWRner+IWz+YWRbwlXhTN6UvjH9YO6chaEu7dhsHKtFbTCmS1KzdiNNMZCZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCnFkHjX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q4Fn7/uJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DA606A31E
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCnFkHjX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4Fn7/uJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GdZV1475065
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdqSCJ/NcYPtxF3w3antuKaSQ1Vhmfw1KhJOl9INpIk=; b=dCnFkHjXGMW1WSJj
	6x9Ev+pT3MdNSVSG3jPToyK4zAQ0mYGXQkLKZ9BAIcA3ziA/HxLQOaVk74Qpm/Ih
	5hrgRuvPRSymCcjwxDg9L3lxZC6FvjXMx+HSs5jVUNRr78j7QArNaYlMeTHc9qsL
	pIOdJHSS0sCT62ehzJGDBRqpyWJccPvzK0o4HF9atHCaV3RAaXbESbJbRFSi0yQ6
	K0UKeEAm02VV/0/D7BarU5GEWbI1sVKITje1/IP0Avku3T1wSCbshthvveyBPrHm
	uBE2RHwEQcH28gsAozcx0uVfWC3rejEaCwKPwHNfCTH2Sm3Ppi5Znd+yfTRSsgke
	aibhOw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htc0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:41:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso5050435a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772506; x=1796377306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdqSCJ/NcYPtxF3w3antuKaSQ1Vhmfw1KhJOl9INpIk=;
        b=Q4Fn7/uJTwxybbCIMlZq2Z0bq7mYWmyNFKCX36vvrckvTEQgmYa+YNAhVpawy+85rc
         hEPiZc8cDMQyj0Q3NPNMyU4PKo1lNTp76ZkzhpVzHC/DxXnAUYnEaVDSfM3luyv0/47Q
         a1EmwirVbsoTJpLr7enPb4xtTP7gdTqAQwJeg++fmnSeE2y2j3mKCY+ENewbZsbJ28rS
         /jyy2zSDpyZ8z+aEihas799sO/egbbLV/v0n4HIcxEV9KHsYJxlRIWToQiEfwekkurDI
         Wbin6PTTp4wLKSOdMXX7gkyJ6pvzMndXtldZ4Jd7lruTXZFbyAiQdVtFNNcZ1pI+KbPq
         Qcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772506; x=1796377306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdqSCJ/NcYPtxF3w3antuKaSQ1Vhmfw1KhJOl9INpIk=;
        b=PyDF1jFEdZePpCpb/86i9p64C6u3+HCqajQxjAdIz63sN89TYIPrjb7zJY/3YvWqpD
         30rS7kAU+mfFvflET2Ue4alfsAQY56vdKOignfhwrDL8+oi3MiXGcTFcj2dIIgFkXGOk
         i3jE+RwfdeM9nOQXm0TLVlX1tMmrM92aYrecbZTlcbs/IWP+VHnmbjIlxHcwObeOI+LE
         gGXIzLc0KL6db6aZ1ilEv74cfJIXQijPuZlr6CT0OhhAyNq6E49qa/Z2CA91BbtHgyaZ
         4biAfGAsHI2aWiEw8J9tPORZiAA1Sg+CqSwUQpwlk7Kh7zLM8Y6TuP5XhEVEVUlmP8wd
         VqMA==
X-Forwarded-Encrypted: i=1; AL+hErHaaPatL5rudr0zv2EouOaoEhCcfZ6Scve1C7dCVY/x89WP7EtDLOVuQ7fD+PSSGfxToDD8oQDZ4uh8NLSFwfDd@vger.kernel.org
X-Gm-Message-State: APuU4Z/sOH5huHyLhM7sEKxszvtfTJdGDnFUEkLaWazWjOXHSbem5tgd
	K9lg6xTugHXxBNGu1065pVloA2PZkNzgsAMeaprPiZkGQ7GDlQIS2YLFnYPPWonaZ5OuFtAnCmk
	/sMMy9zbuVe0khEX2jmyue8L4cfOAr8asJljJKYJSj6fvNLUE2iUdWuAijsjWZH28ebA6CbXd
X-Gm-Gg: AZFdTZfb1S3WN3dNpNfXp6e4dcdNtjKJ+QE8yGXVXDp53EIN8jLV01/r6vJfAd2xWKy
	9oqwEXZMSgycAYt8EbemK+lnbQ3D2vKauvpEPqHSnZwl3CjXVwoJSHeyUbHyreLl6rjjZbhu1LP
	+YtC7sHrkrJ9De3SJRLmx9D0CIk9t0ChuVvL7l3+16g49urowvOc8K6eVvXT7EZ0J/5BjrCkuPQ
	na5rkhlfdbWAf0giHQ2Il5jdWF8yhJSsxs/rJA9BbrckMdvbdjHxj/SuBMeEVRGRZPgSx8ILkf3
	kn93BX2LyWRQbGePb6zMaYl83uFndgl7XZmWOPVfBHfgEWc29eU4Wiz7/Ylh7ARQuSUYECxxDJd
	c4lROtmfL9sIenGzw1vdowiET+grMB18eNfMTw6JAoOtLKzyWmftWcMu5eRLThGG3qzXeZR/9g+
	XAejNO0dv4mw9PTPgY0XHtwRU/4jrb0UgHyePUwQOC4w4o1eMrZigbS48AFZTmK3p1M0i2+sEze
	hkr
X-Received: by 2002:a17:90b:57ef:b0:3b5:a3:4425 with SMTP id 98e67ed59e1d1-3b500a34698mr6475821a91.42.1795772505821;
        Fri, 27 Nov 2026 01:41:45 -0800 (PST)
X-Received: by 2002:a17:90b:57ef:b0:3b5:a3:4425 with SMTP id 98e67ed59e1d1-3b500a34698mr6475798a91.42.1795772505385;
        Fri, 27 Nov 2026 01:41:45 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm40254986a91.5.2026.11.27.01.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:41:45 -0800 (PST)
Message-ID: <8500763d-778a-4183-b8fe-2b16cfc67b46@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:11:39 +0530
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
Subject: Re: [PATCH] remoteproc: qcom: Fix da_to_va() offset truncation
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        abelvesa@kernel.org
Cc: niklas.cassel@linaro.org, rohitkr@codeaurora.org,
        sibi.sankar@oss.qualcomm.com, robh@kernel.org,
        quic_srichara@quicinc.com, konradybcio@kernel.org,
        rajendra.nayak@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20261127092834.731-1-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261127092834.731-1-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX2bOTh5xiCCwo
 gzz1iLzj7fb27EWGNvOoiHIgQnfqzCtBhXgPWzmJ7THFpksbn8iuZTh+118hbdQT0xsANPaIakn
 PNwsEM6ACg/CLRdNZMiTgJ4CnLx6YsU=
X-Proofpoint-GUID: 1DDMLn17v5etvIiwLLE1tAgzP_2-Jeg1
X-Proofpoint-ORIG-GUID: 1DDMLn17v5etvIiwLLE1tAgzP_2-Jeg1
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09505a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=aSOuLjqlkGThcsStIF8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX7G1pEXCqMJlj
 8fiLV+OJ41MbiRTO0A0JLZkIsmDQMx5rLU7lYm70jtPEVOCeR1KSMA9dck4yWMUFvQa5QKjeh5k
 5NTXUwdG0ZkguF8fB0Ov7dEmDs9k0BCI3QiUnJ/qw3jHaQEK0jTUcBRSEECo1jz1D0Oi0BTCdBR
 71DXB3i7QXRyGOvI1E3YeQiedvTI4W1MvY8IojQAopOVvhT9B3Wsal9LAvsEEKMwyKjNcOlseGb
 cFlm5eZZfnvRE72YlpOX3UrI25iov3IGKSLfbnXxDaQW4uonBAOGZfdVIBFYJJtrf3+sbQ/dT0M
 EXUzC3PipaezTcJCL30x4cMROVQtOg1O/PBVusIMfJpGU6steGBS7byJED/jcPNiY6SIVo+WC9u
 VL8BQYsr6thnvUGIiV8ha5yMSmkABJ96tWKtcHM0xDYrFS1oW2AUK5dEiT1D2LlwXsdnzpVmhPs
 mZenYeasZWu7XgirX/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/27/2026 2:58 PM, Atul Akella wrote:
> On Fri, Nov 27, 2026 at 01:07:50AM -0800, Gopikrishna Garmidi wrote:
>> The da_to_va() callbacks compute the offset into the carveout as an int
>> from a u64 device address. An address such as mem_reloc + 0x100000010
>> truncates to 0x10, passes the bounds check and gets mapped to the wrong
>> place. The check "offset + len > mem_size" can also overflow.
>>
>> Use a u64 offset, reject addresses below the carveout base and compare
>> without risking overflow. Apply the same change to the pas, adsp, wcss
>> and wcnss drivers, which all share this pattern.
> 
> Hi Gopikrishna,
> 
> This overlaps with a series I sent on Nov 7 covering the same four
> drivers and the same root cause (int offset truncating the u64
> da base subtraction):
> 
> https://lore.kernel.org/linux-remoteproc/20261106184312.100-1-atul.akella@gmail.com/
> 
> Mine's still awaiting review, so happy to defer or let the maintainers
> pick whichever they'd rather carry forward. Wanted to flag the overlap
> before there's duplicate review effort on both sides.
> 

Hi Atul,

Thanks for pointing that out, I missed your series. Yours came first and
covers the same four drivers with the same change, so please go ahead
with it. I'm dropping this patch and will review yours instead.

Thanks,
Gopikrishna

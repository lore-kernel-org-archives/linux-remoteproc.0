Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577432;
	b=KurgOc61Dhe4y/kyZ6eoVFB5s0qqFb/1WhpFe371/2mGYCHaxf/jqtRH4z3wMpZ17NdD
	 XSJmHX+iGlch5iD+38K9K0ezecxSfXzEucJaupF2wzTSS8TZ9IYI3k8kko2Dl3uiKEA4h
	 sd6/rtBEiPpf7Pn2eR/3hKW/rjpO279mNGHHlBiJPLpZvDg7Uf8x6Pbj23lC7qjHPYlHS
	 LrJE1/5zxz9jZ0pE35gwxZWmNB9ypIUC7LSJiWfGIVxeQ3soc6Fg9AmMhX2kt2HxquFSo
	 2MJkZntcLRgAbwFywL+s9JYjLl3T86JQav/s5tnz39tX+4Fy15uFhQexe6BCOqOn6bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
	b=MBqhZeLf4P6NbsNIm1+eNdlqAYwXqP1WAkgyBj1WThGXzt/MAGHqi779c5EJeLrSSZs1
	 upCoQGD8LP3DQ/iBPGlP2U2f8gGsACfILXjYW+30fVBZYvlJovG9ULU31YEudlNRJZd/0
	 HRFyub6glUWDmKRiu9UkQ5chNBt/vIOa4SCSO0PfJtPA5lZp7OlQMu9dfkXSnCeRqYcj8
	 647NniE/Wj8oHnV2wzZRHyohvsua9YIMmFQQTxK4YX1xmM7IvLTUnkGkdDPOHdgNSP5Xe
	 58ANbYh1HQr7LNyO9G2jmzdjIqbIFOef7VSVeeangDFVUoP2ePU3oCwpOOcWZl4jBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmspqwe1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chZ+TAtF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38053606A31D
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38053606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmspqwe1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chZ+TAtF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6Ase1358779
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=; b=nmspqwe1evtvHtRG
	xBo/HHDJkLRvA+UYlJHq9hBB4zxxK2olD9A1xpcpnw0E6GWlaQyNVR2MQjlA8+Lm
	AyDXBIfXGDUIdYn2i58t8DKmXxQkvXCvUlZL33Q6HryH9WWsVrwCtzdnH9B9/13k
	gCBwscQnZ5HNSrhagSICTwDYp1YBmbjcgyicjEDGo9XtwMJIli2bV324CzKhLza7
	Eyrg3DjvPQhZzkNXYc7DEDarF8IULSXHP6+rGCx0ozrvYzmXLenH48f38cpxchjv
	lAGuppfbcmAPWU7dKPFN9kFtla9maLtFQj5zVQ8pTmdQ3RjDGSJ9k8aCvzG7gRUY
	bve31Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ucsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:10:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso5202185a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577430; x=1793182230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
        b=chZ+TAtFUH7j/UnROmsS/OOQ8WWj9kXXKsKraqSHcs7JOZZkNYDEYrkk4Z3Erh5H5A
         sJjaL/rv5VRmrK47x0zMJ5+5f0u/wwMUTymQXwa56Og8TCFjsR10v04B1dbgOyf7/UbY
         TwFjy5T8WZcWRM73Igyhh6nKHkMLIQy2EFRcQhGJw9wo61epDMkRZOxfriAdaHXbVqrC
         RAnCJss3w9d/3/L7mNyZpdBbiRqCA8Nhu5P/Fyh66UWG+hZsnVyAgJ0ZEJoNFeazeIAm
         p7WAlfYGFY01mx76papDOqDt9H1dTjIxk97ahyTle/7uersjDflHdaYmY7hvQ9UmiTB4
         mlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577430; x=1793182230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
        b=BdoBp4BaH4YOKRoh/jdVVdmbKT0d2IY5MlMpKtpbluima8mNA0Gk7jdN50HxmNkMRG
         nUod/Rl/zlrqAnp4HnagorfXakRS84LKRgEILv04edKeFhzeKG5a6X9OQwF97f3OHHWN
         0Q2nveko/dYx5iG/vQ1bNQvibQ4LCYM/e+K1/LYDU3fy7T4RP5whxYhOJhZjC4TDZWfm
         m+R61hqN9WE5OJBNNauyqoyF8QBIrZgzjgFo9Y2QNZNonrX8MNHsD+o+EpVRW7tfSJBd
         XJUpzITaeL83ofw52LQCkKQTnIQfG/M8p78NPoILAGSUYHPN3nkcRFTMlbzOI2xSQlyf
         y2KA==
X-Forwarded-Encrypted: i=1; AKwUvBwFf16xMgURWbOy5GIU6VF2dutPC2lRPuQpE3W2LPejN2Dyfq7Bi0G0zvAVVrSe+W03RfNgz7hcAipiqDycUoT4@vger.kernel.org
X-Gm-Message-State: AFq9FYIFuhYKzx/MxNQLBQr8Zjw3Jhqo2K2GlMe0UGwwYOPW7qLoP2vh
	2CezJ9c1bfyMUgNPnAVmEsIXWsNyAdNAFw3RWbtWcahV1DeI72KjSzs18UimOOjlvNZdBnTCGxH
	DMsZ2cfRjjP/kjTowcf3fb2T7vfkkWVQr4FGTgkLKWhVqTmdTAv2Wt6kBYjV4HNyGUzhg3GA2
X-Gm-Gg: AYBFou25I5EgErRLL6nsM6pTzeM/hGPhz01OWgLSn5c5p8I5ofyQkfcv8/VVZtuPMSQ
	6RG/CzbdV1ZtQ5RqC4MB50B5Es92rMCL0SmShRGKjkbas4kbk8HYs7iRgARAjTq8o3BR7Ap4kZa
	Js469kgmMmQsuOgbYXoDzPrAnEJwD8vjfZXU6eHjTG+dpOiVSEqwwTXK/AO8BpGcdBogGLPwSMO
	VLGX8JS4aCQ7XNUigE9JBUGN1DnXR7hahnUz1RdW1foGT+kioueAMUkcXQx4Xm04VMRMxOlo4Tr
	5cLvFoMDQF7IxzYhcRKKel1BOzbUO3UCqeMjwHpFMPQaQ8XQTx+JR17owVUSAgZ+hlVDTak27RU
	Rmm/dWe38P3RzmX4rsU/DTg==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr356252085a.6.1792577430307;
        Wed, 21 Oct 2026 03:10:30 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr356247885a.6.1792577429799;
        Wed, 21 Oct 2026 03:10:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900818asm61438566b.79.2026.10.21.03.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:10:28 -0700 (PDT)
Message-ID: <349feee5-32ff-42f4-a3f7-8cd6b0d9e750@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:10:27 +0200
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
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Fix 64-bit address
 truncation in dump and translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: grrCJumXCa2GB2gHlfsRga8GfM91-KIX
X-Proofpoint-GUID: grrCJumXCa2GB2gHlfsRga8GfM91-KIX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX1iLAXal6q0rf
 oukzol+zOcoUjdKpDjHc9MAWBNnL4CvevoKfy2QJ34yybe4sxJni4VA77tWPP8Hjp43m4ch3SzP
 HkZ0qP1Ylfu1KA3Tz2xZH4sB7QCVszY=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88f97 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX8GFOmsFLaHRX
 3OjNFmKFreV90k/jBRyubvx+lvmcYZvUYLOgKgkyied2hpszAbq1BPLfWkKKJAjMidvPt4Tu+nR
 rPYFM7wCBRQ5Wm1tq7olUpC06nLqBb2fFj7SI0c2V5tgT63vSE179dgfMP38Ff6j6aOo4WMzpOI
 aJexeQLGvGoVWYd7W0xCsarRwL29p/45yddXgxIXz4uiQze7HswY+XcqiHa7JroBsErctI+sbU0
 IIa6fwwAxDSiMfdCvAGybAQeM7yK8bTo/qWYQShmhWi8dxXZ1y/nR4MA6wYTxx40pD/wycU08+D
 QD5ClCVrVpCWhcyyZfEaSnOu2WEazW6BmkO7zK0PD6P2nvEwWHQDmOlHg5xpYqPrXGAW2GlUX7G
 4Bgk4uOOl7JujXrNkUYFauf/9GO//3JLhqzO7FwyEBbtqB3tEjjJP5r60rUlSZcB2V0U9F+I9bd
 q6OrbptN/elN6AoXsRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In qcom_pas_segment_dump() and qcom_pas_da_to_va(), the offset
> calculation results are stored in signed 32-bit integers (total_offset
> and offset). On 64-bit architectures, this can truncate the 64-bit
> address arithmetic result if the subtraction or addition exceeds 2GB,
> causing erroneous bounds check failures or invalid pointer translations.
> 
> Fix this by using unsigned size_t offsets and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

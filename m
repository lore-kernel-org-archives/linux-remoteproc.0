Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771691;
	b=oqc3kCoX8Krvh3fRdD4xXaf7GOCTZhYX9rCZNlkL7++2XL/ocB1yZurq5gbRKSQqFqig
	 F/5sFUDsZb8IT4jihrXC8mdajlHY5KVWum8TwAVQ7W+mrfhZimv16ok2L6ymNvMvr2L+j
	 545NfJ3qF/ZLtTFH0mrsrbuaGdRNLUlux13IMukJ0GvGg0wkr44IRy3M8GhKMxfrOEOBG
	 NEA7P5OVly7QOpgpZ3e2IZ+/8CYAeXLG3BWH0vULhxDd6pLB7VNU1usiApPfHHMdvxbU4
	 DXH808TVZZZ6DqCMIyTyAXge5292wPLakDePoIkOyTjn0rV/3qy2xdWTmtF8KG4q+Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SVUt42Zowk/lVILB1uSHbBReYTS3hYUPxrg0SJvsPf0=;
	b=RE7B6zkiSXYYGNrKDlglVERv0HRVvq2EXQamzhBO2r2M0ceUBGxO+ok42Xz1n0pyijNf
	 +WKa7LtIcXIdWZzwtp5wsoukPqP8iHPstjmBp7IQWQYBkVIu9P9SKa1ySMP2MJTY2yQlq
	 KmaPm4XGPeKX0DkqpQgfR7dVGDtHE0YTqxC+H4FU7vBGyZAJtMfN4ztJFuzgExUUmrbp0
	 EsIIND9NUrewM2hPS7qtDtuwW4zdTteSh+aqMmElUhoFXdPVOLxyF3gg/XmYIazR+Qha0
	 ixXlpRcvejcaKuvqTIxF2DrTZnhiwpcjhyi36/ktpIst0poN780IfouR7Ua9/KNYVcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SGrm9ZVS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4Tua+SU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24EE606A31C
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F24EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SGrm9ZVS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4Tua+SU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GcHr905124
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVUt42Zowk/lVILB1uSHbBReYTS3hYUPxrg0SJvsPf0=; b=SGrm9ZVSiF9T95oH
	qmPF8D7WrSgal/RzVrhLc7lmGgk0K94tIweGRxDIt1GTeqqaWyiYs3Cry+TgHtfd
	fbCJY1m5j1GDh/f+fV4KhYO6eQbC+1GodNp5uGtKoTctAP8L299sH662fe56vEZC
	eysIDrTIYL8HjFxVEwK0wcVOpUOVmN5DffLfw4aTq3IabSkmxiLOWchB+UFEJORM
	cGKE4I9F5HQ8u36NiQW0QLvxv37/veB5VJslgjw4ihYsgAKZuzjjMF5XzXbO682S
	Mm+okZxuSQ+ZmRJWpW6SGZyLnWhMIlPi6BZKNyREXNFnJMR6JKF4Y1r7ksC9eoPw
	Z7jQrA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39uxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:28:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92134a35ec9so7659646d6.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771685; x=1796376485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVUt42Zowk/lVILB1uSHbBReYTS3hYUPxrg0SJvsPf0=;
        b=A4Tua+SU3blpSX7t9VOhLpeEc1rsDOOdaJQ1k0JnmsI6aHYbOvOy5qziorBQQ8QJxD
         szq4YGlhcUMvBn1KdlPeEgg4NNf3nMZcRROLegU2tLsjHACt/2PDJK+yynFAo6CieW3K
         JqLIqFXdEhJNzP2bO5uc2JqW8I4YuzRoZp22+zqpFIcF1Cs+t+7Aa3mnSUUHfLutrDWo
         P39FYLkKh220Iq1UQknWMzKL14merRE0rPC4O14HJ6PK0bgku46ul0eLX8XTIaW5psoC
         KDLCAo0u9icmbYZ1wOU31vdbzkmvDtRmKMmf/IHWQ4jjkzqkyps7EHbrhpGr8FaZqHCG
         BtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771685; x=1796376485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVUt42Zowk/lVILB1uSHbBReYTS3hYUPxrg0SJvsPf0=;
        b=Sa26BoaJKmE2bx3qMBgfgUeWWJNh7a1GFflJOwyP1BN3k14REWbw13+cwPQ6a4NcgW
         ZZ6tZBSZK/xfcFJRrCwvGTX+AvBu+EBGAsise25Tp14xLXmvVluTeS88gYUjhamO08DO
         y5CphSJB0O2hbF1IrNyCeMYs+7OmuLf+4erWfZOUF5Xq/neT2BIFhSBNrtX9l/wwb3Y5
         kSeBUpnlFqoLscF1rGjigLwO/v8S859J7Xf/ueP7yZNB/Eyyml5f9I5ScAbBKxn0d5p0
         5t1D+Z5KclwL5wT9cZ9IdlS90QHTsAnwg+J9BdUOu7ntUS2CrLBlEtenbvQE4dRt6sU4
         H0mQ==
X-Forwarded-Encrypted: i=1; AL+hErF7iEYp6bHyJK8vCW4YTx4oUp0t5PgogHBlF5b3p27PNb9fpoEjYoE7nlWWtiKtZyVeUr2B/KhVPs+4tvMYVTNF@vger.kernel.org
X-Gm-Message-State: APuU4Z9rIyl8J188SSNszyr8nDJvT4XGzGEfB0kJ1rnKayaRiKfKJfg3
	iQLrt11yw5Q+WCv8B/sibfXOxDPYUl1fppoaEVvx5pDA2Y/VBZW20jvcFeIK76jMk/ilGJ3OWPQ
	LyeglCGvPAh3jXh24ADz27dka4STTKU1BfkYjLmQAvLcXKMV9+AtCCpvI3oOpzOCccid4pOXA
X-Gm-Gg: AZFdTZchOnUgzKj3365SQMyjMzaHstM22fQ/WdiBU7V2uYDraalYoaVu4Cqjjw0WQll
	tPkutzx2MGKDFXjcOHOR3t3nkqy6hCniOQN9yQpaNyJBU25xkr3M2K21fvn0sfQxHTeVJhiKmNy
	dILq3zZl+GgcJop9JBUFBkRAkAooa0ohfqHUukvdLg677tU56SGH1FLGEsSqvtc6UgC0elU2Aur
	Kf+kxInfvv6y84BYym5Z0D3r0tHgLck/u9yBab5KLIMHSPY1sj2W0LlEEUc3HIz+YoeMX34Cz//
	FcfF68VGFt5EG7hjIIg4WsxMcqHRQDZlOaReN+t0z7qetRYYuM3IG1ufuopFlfzOAU9bAvOE1/r
	X0cekQ7mQNO8YxLfBcby/J72uZ5OFD0V+xbFfsy6Yofg0DGfsTWs4mT98W3nSG1/yNBN4ugg=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr3960150085a.6.1795771685490;
        Fri, 27 Nov 2026 01:28:05 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr3960146085a.6.1795771684996;
        Fri, 27 Nov 2026 01:28:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm859204166b.75.2026.11.27.01.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:28:04 -0800 (PST)
Message-ID: <4ef53fcc-77f0-43f2-a01f-2fb097d1fbe1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:28:02 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Don't mask shutdown error with
 SMEM lock bust
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, abelvesa@kernel.org
Cc: quic_clew@quicinc.com, quic_rmaina@quicinc.com, konradybcio@kernel.org,
        sibi.sankar@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261127092656.2064915-1-gopikrishna.garmidi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127092656.2064915-1-gopikrishna.garmidi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b094d27 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zLq4OPsqqHyM_4SzrCEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Z8O6lhS4iQJ4tVX8xntVV066iZN_0HbE
X-Proofpoint-ORIG-GUID: Z8O6lhS4iQJ4tVX8xntVV066iZN_0HbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX/icWfLRKxbVi
 B6IVAUmXX4zjhJx2Hj8w7kQgtlYvetMe2jqlcWIi3N1SHOw6okBcilqzU5kl/Fik9JlvaVsKwyG
 S4KwPgbd51l7HjyPTcDbqKOWJfjWPVHSAN/TfTP7jCf+qPjWa2AxOxWIo02kRk1ZoH7QpXM8pMm
 7ngE0yyHl4Pc/ceqjdxS6k0IG698pWz1fD4JGIBSehs/RBLYuDeivl4cncdJuGdYgz6f64EtFJi
 ppQHwYuGyEBTtO/Spdwn2i9h0d0SyCZrjz4Yuoxs7fjC14uzcNtFtcrvJsWTJ3Esq7nVlXz9w/k
 D7/+PGoe7buQqByQNWuDDHLWp/JAppZ1u2J++K12qLKXR08Oj0UpbW63TY8BkSdHWUShouwSRXG
 knie8M6uVTFoo+RfRwRefz7stooVCd7YDGoH7za+bmwrQ8se18MChqKkvIi4IrlWSId4vA/UvmU
 /8l+kp9as4SLhaY1MAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX/iTh7h2h21dp
 AILD30kLh9bCosDwDA6Q9kH7m6cAnEjEHdHyQiZygwOy3UmT8M0RbzlqCMH79diYvRIjcrmPZ8C
 K9+qy6hbkOPLBkVIM/FpQrUY4O/O79M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270037

On 11/27/26 10:26 AM, Gopikrishna Garmidi wrote:
> In qcom_pas_stop(), the return value of
> qcom_smem_bust_hwspin_lock_by_host() is assigned to ret, which discards
> the result of qcom_pas_shutdown() (and of the DTB shutdown) collected
> above. A failed shutdown is then reported as success whenever the lock
> bust works, and the caller carries on as if the remote processor were
> safely stopped.
> 
> Commit 9db31edf92dd ("remoteproc: qcom_q6v5_pas: Fix error masking in
> qcom_pas_stop()") fixed the same problem for the DTB shutdown but missed
> this one. Keep the first error and only report the lock bust result if
> nothing failed before it.
> 
> Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Assisted-by: LLM

This tag is obsolete, please drop it (checkpatch should warn you if
you're on linux-next/master)

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30669242D9B
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160101; cv=none; b=KQ0tRw2ze29qZZ+6xvo6qeVZLujMPYdoO5+oBKzPLsHxLtuG8smaqu4dSi4IciWDDYCnJo0/G//aj8FwD3jEF2PnX9s5cZ761GIrMJuYkHsUrorsGyiwYGCCbEod8NKUYqbRcFvMnZciLbZKmZ7l+FirX838VZGGk7PkxYFbAd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160101; c=relaxed/simple;
	bh=OtDf5kcTqEA1PEC3v0u0wM/mWSz9h5KHwFsQnufun3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmxL+vLLXrsjOt7nVYAkc/aQewzjLX1ewo0rnRXs1Kimy7O8fLBkF3uoj/Hg/iKAdJSaICRU7f4YpA5H/LG5KruOBddTc9Fm64vDtT8sDe3eoHAqufWuNlRtQ8XuT+vEp7+TIsSPxE7KtTc4XY6Jcci6phIDm9u9t73nuyH/rn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WW6EBvTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIau3zYA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WW6EBvTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIau3zYA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52UXO1445297
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 07:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5+jtKls3jVZt1Vk8tCZgUdFuEyXJOu1YclDw7gKN9w=; b=WW6EBvTthhXbs/IQ
	QKblKD9+s8LJJUVw81dIUv2Yv9CxXVAxNFroXU1TMH/OCnOfzGfZmiTe3//aew25
	nloGvaRIljsbOELbTRFcewDIR4aCW+nBzX4b59eSZORL7i387oWq2BfkmreOg9wk
	cwVlretRiHb+33uCW03OxZH1TXGtLZNS9pwp8+q+cjqe1PNQcH/wxEWmYrQD+uVs
	S+cRxRN6HOd9BEsa2ha8YfD88YPWGQ/dLkU8KFWQjHktapOYaju/Q/d5DsyT65CB
	OJh+wSfv6xKK48YN3crcC3G7+2VP9jyKagRW2olSyMccQCtZsw5neJAD5K96ZnXc
	zZU3bw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgvwwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 07:08:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fa40fed05so6295111cf.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 00:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160098; x=1788764898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5+jtKls3jVZt1Vk8tCZgUdFuEyXJOu1YclDw7gKN9w=;
        b=fIau3zYALqBXVxnyZuWM2ztooE0hOL3PTGhsD5Kbd6URdw5Hl87QnQIi2ITlaIlcBz
         BjrmIXxYVhA9lhTSyD4ep00EwpSOJkAI4jS98Q7bYSJErMGj6paY/nBu2ZjyHsr+g3vK
         wZ67z0DY1q+tIDzzXkPt0ifRf1hOf0deJE+FTy10NY47C1RVObO6zcv76ImohIwsxF0A
         X2git/OEHD5N7/lHOhNbyp6ec6m/Qj7Pw1CX4T9FogU+DiVKkb5g70DP4krylL7+47/d
         +0Zx0hHspiVxv8teDknh6WG5qi3nHohLATI95mDujBRW6fFumQ60Lw7ETwOY7BYoposz
         v7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160098; x=1788764898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5+jtKls3jVZt1Vk8tCZgUdFuEyXJOu1YclDw7gKN9w=;
        b=OjfSbVdfzN9dw/AlHJVpxh9TSdjt25HU94xr/E+q1v+le16oR80NklqGUliIPLMt6F
         EMufdAaKH0DAtdozAGUUpX5PpU7mwkywzleoHr6oHRswBeKncp6MQbv6RA1U7TMKHF/Q
         FOIkbxajOls5KNtRPwIdcoBjRylSW1g8jvclJmuRLEEXR4EhY/Bqn2XhfpgoMF1PEafH
         Ku/Vms6MaTE2t2JAIbYbH6UFeDcJua5H+W+/SePQGmL5Na2GCYlG6O2fd8q1vUl06t0a
         PrrS922mkDzCRCs/KwsVczV6IhzHh1Wo0ZFWpLK/Iny4HZFLDphtG05OkAYmf1B4RLFO
         NT+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqX3AObJdEv2BPjwtX0PofKrbU0IzhcdQKGEYuZ4RCiFYeSvx4slaVmnT0YVW7wwIxsX1TVzMsKSdpvWVuEo7uF@vger.kernel.org
X-Gm-Message-State: AFuF++kwIYCtBe9z0OwZ5WcPECPxmYJwbGJ5qerHUsYnfi0offVs5xc/
	AYCu8VnHICDi0mjrJjIE/gS6iaB1ouFjW5ve5ntmwAQhWYMUuIaVzyXOvgt0MXCOWh4q9MokxbK
	a0c6lB31iybvvPSObv4a1pbiH856292F+W7sAcm2qVQiItjYtwYz0HS7wHmPZsXxXRNQGQorF
X-Gm-Gg: AR+sD11K65iMMCfnQrGMmSc3/ZRpLr5a7PMnQ2othh8SU9nx/QytJNynHILYLaBlCX1
	HQqiJirhR737vRoB0nCfEoPFmAjMgfyb2oyDm9E2+pye4MvvJwyYaOd3F+owScRx6P0z1DBxmQp
	z1l1e4l7VkxK437JLdSALktyllmTZa3S0GTQZwOKCJ2YRvAWjuCmdk1eZhVpGEoK9ZoclsUW7kE
	56f5nQ41BudYrkA1kzfE/Z2vivcOm7mQ97v3DmwF2u492/nINNKwCURhbYBvuVqWz3wkHqDT6N6
	56bb5rHZhBa7qq0ADoREuk5Dcvdi9BLCH3gtGphylrIvvQB+M+7InSzral5A8Lcf5LKBFzdsf7G
	fgWkobLfbOk2scIayu/THTw==
X-Received: by 2002:a05:620a:1b9a:b0:92b:7420:bd58 with SMTP id af79cd13be357-939285432f8mr768781285a.0.1788160098289;
        Mon, 31 Aug 2026 00:08:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:92b:7420:bd58 with SMTP id af79cd13be357-939285432f8mr768779785a.0.1788160097890;
        Mon, 31 Aug 2026 00:08:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249434sm389101766b.55.2026.08.31.00.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:08:17 -0700 (PDT)
Message-ID: <1ad7deb5-5544-40aa-baab-865a4612af70@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:08:15 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfX+5WBQT0x57e7
 KbPmPWaWHNtgtafdcc2WgMni6JobBULrks48ojES6+Lr2cE4fbk/Jn+5EBuKKDpUwD/errjZvDb
 O+/xhoJhwC0umzJLtZWTDXulomDhWUTaFt1gnWGCPGWTP5tqZ4JoVyY27HTFP4hXAjJkQY9L3IT
 S8C6zrQfxhDxM7VX0AKLzhePh9Q6jhWVzAO8bhl8yqBIQHt2Msu+tP55TM2j5IeQ6tHeXwgsmgo
 dBMJT0oUjApLR2TOsLBIXF9ye7dTnoGtwOdOXHwWFrilaS66dFykdbM6LqGhdUM+QZGR1GWm6Jr
 zl5C5mn6sHx78pZ+6GzI4k3hZnBKep7NyWuqL/rxmG+Ne1SAGPjFFM9LdodGNZ0HPjHjZO6Q+AC
 aeYKzoIqDnoPuFg0NT/DK3c7SwhqxzWLO1jk17twZM1/diW4pOExtD4Cw4lgOFzZC+p5kj5ghZK
 41kAsCcPUebnWkyWrbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfX5A/O/la6PJX4
 2nytAcRDxdeRQbGSIHO914EP/Y7No0gED77/MDZsG1HTyvQ24/5cVNmrOXen1SvBnE0THzLehJS
 wiX6IUIZiLAilxRJtKKR7ikQi+ucL4c=
X-Proofpoint-ORIG-GUID: USobs4HGdLOoDj9gpQ29OeqMML27X2j5
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a952863 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=LiietuZ_TH7RrXzX-7sA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: USobs4HGdLOoDj9gpQ29OeqMML27X2j5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310059

On 8/28/26 8:13 PM, Mukesh Ojha wrote:
> The proxy power domain enable path currently requests INT_MAX performance
> state for every proxy PD.  While this serves as a "take highest available"
> hint, some SoCs require specific per-domain RPMH levels for correct
> operation during firmware load rather than a blanket maximum.

I would have assumed having a surplus of power shouldn't be an issue..

Is this specific to Hawi? Is that a firmware bug essentially?

Konrad

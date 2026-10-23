Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742763;
	b=Zvl/PeAqW5Tth/Bmyvzx0MYT66L4EWRviA8xjdLDRu9fSchzpN2OuGLDRMoH53OCLrjw
	 xZn3lqm1w6ZaUScZQ390awZj6tm+LhcMTRLC/aBWfBSK6bL0FD8x2AgVUZGT4VRViSqh7
	 +edQ5yEto2F6MMGXaULsUsgKzTQcbl3KcLzIKZFNJVBI3fv77NkO2oSc1WCe/T/ABqE3J
	 PUQlLB0UvKuPGNRomC4R2NRxFGXHEK+ztB6O8Eolj6RU4DhoXjVujba4hYOD6eDXzZAt9
	 AzFUUwBMJhqp5Rs7+iopa+E939RQsC/45EBzvyu2wzbRlEJ2RuO9SteU3K0+1Y1uuEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
	b=5d1Is57UhkB+/p8fIbBNNcp8VNUuHka6xfosXesiWJSuZyDzTnzpmb5XVc7q9FsNWCgA
	 8s0FeUPhThB9KhrYTUpDc+Yz7umOKoTKOm1g03bnmazGXAM4uEW5brp66IYBkWuC6dTAX
	 wLT/Iv4ED91w9MuElf7Vbc5tJYBgdXwKKw774gC0AtgIcjfY3jaRw4+446OdQv8PepR6H
	 wu//QgoLDvunDpEKWEnbVAWUlP/fTduweSRUVLuiXl8Mv3CiqAnt9Jy2mwx/0UVHN7Tjv
	 Q08GlivPUimfK0nj+mntFRWmOLyl03oPytm2JTAN745zg5OIQ/ZHFe87jQCvpp6VGXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kG4s0kT2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6tUCf1Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB86606A31B
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 08:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB86606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kG4s0kT2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6tUCf1Q
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9Kw2112148
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 08:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=; b=kG4s0kT21uYk+jbh
	LbLcYMsll56FYoJQubZo/rQGOLrE0wF/AQXBWTQkW6AdTUcdAF/brlzuqJ2XpfSq
	J+D62aeNuNhkSWH5/iKjWcFRuTet9tibPVDZ2JYrJjCinplz1eKGzbMbrdyM5iY/
	7v0ord5ZH6FjxN+bdcylNfBatEDB8ne/GzCQaRe4mPW9jTGnKOe3ND4N3iFmN3rw
	RGzsM36qpKChaDjdhZyFfv+Oe1Vue+/1SXYOSgIiQ0m0Ok6XfW5uzRmRmQfTQy+V
	ZuI/cPo9MQZhRV3edOrsdDcnFE9YPVcMFuU9u0R8QBZR4VbuU4Cj+5gugdKSUTwm
	/5PFmg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsyka2w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 08:06:02 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9906ce36960so34735241.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 01:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742761; x=1793347561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
        b=Z6tUCf1Qe24S/l9pnoOdyW27NgnQyScVvOVOuK/yhYyCyeTdSh2aoaZuHNwnsHB2AY
         JJDmH9hTmd8XwIbT4zvVGkpqKQAWh+pyXsdyaIlC0cqFD3P0DjNodLfVEYNOmNA9Aua3
         9f7UqEZ9RhUtkFESTNWAasmIYLc+wcOw5WhcI5OHpmJt+51TbKL7cQqLHrO2JjE2KNr+
         e+4S3LzIGn0VbiC29qE/JOk1swoorSluN2XBVS2mQcC9BKgDAwIDz9qiKyqWYRj84BZ2
         y5Iyikq/cfhCsvGp/gJaYk7K6KNSnjPWOl/p9vWU7v4xKj/eTqIkfNtlypC6btb50npf
         3+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742761; x=1793347561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
        b=PMJZH2/ZjeanNviYn1gS7XtyF747+q0oPn+OfMYwPsnbnaUJR/lKlfHDNyJFg2pB8k
         /rkrBz6dyKrFIpIvmlcAhUYnP/ug41cChiA/Y0CSjeKUtrY6SeL6SsfgnMNpUwxzn5QL
         ++Z3RQjJkoY0z7G+hiRfrmqbOnzzfabN/nv3e37GWYd2FnI/V5IAdwTmtqFGxH3h4sNR
         7pPNt3SjzL58srDhxhc6z89JXn/FAd2IbDaaCKzfQ0LnxyJUKUk6O7LgbINgacWP2MAE
         Bz1+Ii+HPsSVOeF50Xy6vQRm9QX7fEvxmf0dLusBc2dUBVUzlr3j3XbMtNp/+pZX2wOu
         GGXA==
X-Forwarded-Encrypted: i=1; AKwUvBwxcl8PCH2fJWYsBb5HDb4NsDTq/NV6vOqJrsBrU/qsJPr86aK1+M+ZVbf3IUf/z/orKzK1iKnHDv6Nxw3k2W2d@vger.kernel.org
X-Gm-Message-State: AFq9FYLuVU6vH8YFFKdOKEmQ+P/P0CATtxr2YPF5ohVG61dmGJKW8KSF
	x74XJLOR2Nsf7ACJ4gVOn2+0q8MbIy6fS10UPRt3lQyL6BKT6VEdImzwcB0M2DLnAu00i2avbyh
	EnSEdcJawDOWsYIKWxmu/IpH+DsHt8sGkxsanF/7GQ3BoBfDubvtY+810B8V34xCqXRrkuxgc
X-Gm-Gg: AYBFou07BDvHM8JbADeufgf+afpN45+uAjzjQFE1R+ganfczXisyh5VK6WO5IiOsenX
	Rxwg4EMdK9VDMXsxtfJtNgUj3qm2EaHQ33O86PjaYgVj7T2toT2KA5vUz0ydJQGc3p1xmMq1JKV
	mXzRJtmywXu4Els8is25WANnVCXKfVzmyP0wrFTaMPuvAREgbSYh9TAEk9iMFjrSWcI2k0JDL0V
	2bZWAZppULLDM8oj3PZxi1N5QpKOI1rtJCMTCLcUB95U3t5sWpv+t3Yf/EZQsxoiH9QFHqNorFZ
	mmjiLPL2Ie+dDOyF+E5EmCgUD5MtDnpQfOzaWgbx/ZuUlJH5gaO2zEglqS+EolzVrhnqZaQldv1
	+DXj1zZgD7CPRqUniAI5alw==
X-Received: by 2002:a05:6102:a189:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ccc32bcf6fmr479054137.2.1792742761087;
        Fri, 23 Oct 2026 01:06:01 -0700 (PDT)
X-Received: by 2002:a05:6102:a189:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ccc32bcf6fmr479044137.2.1792742760678;
        Fri, 23 Oct 2026 01:06:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfba36sm74805266b.79.2026.10.23.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:05:59 -0700 (PDT)
Message-ID: <fea00cb9-3ade-44ca-8eff-e2a387074b4a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:05:57 +0200
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
Subject: Re: [PATCH] remoteproc: qcom: pas: Release DTB firmware after load
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXw3FaX+EsAJbY
 92oe6PMAJ3FQWkPgGO2d5Fo6q9B44KL9VU5kTniLbaBRMuZHlB2R2VTUWLZDbCsUPKs8+0gYxMH
 iDyRccAFS9iWRgXc3CP3SUQTEOYwUtmIIRoupQEPiR+PzzkrksWqdpWUUow1kMclwaHJPG7rmMn
 c3o8hf6iptDT2UavDN1tzEPh2Zb0RrYLaLddcTpBEnDAC887R+4zl1ABUr8Hn4IlA5yzSLN3Mrn
 FMNfatdAHy1QioXC+2nWdbo85dqlVNUv+rQLxM6/+pvCatUPNiJD+ihb36uJ27sA2pn4NqKaO+u
 f4S7GklTZ8387os3RdSsbghx6Zx7kdWaGm/YqrZOmNl9TiiNEbZIsYu8pj7BqXaiA+GfGSKnn4R
 0jlGXPwh1racnJPu29x79J/udtsWzF+Ts9tIu7MuQSyP5rFvFGVJ8B8CpLASbL3u3rP3tigcsA9
 cRMhQHGNlOwgs1Z10Bw==
X-Proofpoint-ORIG-GUID: -7R5Y5rjrg8xclAx6_F-PXUlzx5iIToz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX5RcZmNiKrpyY
 tEBxklST7B4Z2mFjaKHlsaxPaCmVK+copTfHhR9glWrcEY7b1yrJSK4y0OpBdTSheno2Y7iSNuW
 ulBnUfh9vI0BnGxkWMJwNVZou04E+2Y=
X-Proofpoint-GUID: -7R5Y5rjrg8xclAx6_F-PXUlzx5iIToz
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb156a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OpgpJtwNEdfdaaOfhYsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

On 10/22/26 4:54 PM, Anup Vishwakarma wrote:
> qcom_pas_load() releases the DTB firmware only when
> qcom_mdt_pas_load() fails. On success the firmware is never released,
> so the DTB image stays allocated, and each later load leaks another
> struct firmware and an extra reference to the shared firmware buffer.
> 
> The firmware is not needed once qcom_mdt_pas_load() returns, since the
> metadata and segments have already been copied. Release it right after
> the call, on both paths, and clear the pointer.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

nice!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

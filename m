Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026A834F498
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769766933; cv=none; b=XOMPX7ko1mEmvGVHjh8O8e403AmL+LZhWXTELIrRAKcBGpY1r22tiH/b42EaYseLDtyalxDq/bl0qVXvD/5CSqyJayeHVNvnsVsGOu6CcS3Gy9GvtrTg8r/hYpQZ83nH1DKEfKfpjpYPj9bSY2jtkEojDpz597qqeTSvffk/v+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769766933; c=relaxed/simple;
	bh=LCiS/f2tpueWranb2vZDsO7aMcHwlPN3ZBP0H7aGbyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bgagx+sHOS4r/CaQ95CDwGpurkHlVSdgB8mDRy18w49oxKLaWj4dsa8vgfYq032guljbK8D4bSAS10iEooOa1CjJluEnmQ0zd68DVOpDyXeMhHDYXXQfNH4mNQsNtU9ZqpUiiNuBFVNJcOevJNsaocvRjGqDQMjnTE0s9Pkhsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ma51icA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICVKmIl/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ma51icA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICVKmIl/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7GNu72412953
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 09:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=; b=ma51icA+jsduw5Ur
	N6yIoFMjb361n6ckJK3YOl12X+YA6L/dBAazyD/O/lPF9FqwRdkvjqRuNt7GOC0t
	NN/NMsnElgMl4C+zQjuVrHClRchriaMrjENFLN/GglLkubVpoB7j7RaOG98nWASS
	FKt+9z5Dmh/bwHdZLRnne7COwyjgMsDEiK/Fq0q168Kjy3DaeHF2rlOlvxfKl7sX
	NW9PY6CRP9C/IbmgFgSb9Kq8N/OPjBy6o/uhOOcReKIzIcWAyPN+s7Ik/iMrA+KV
	m7sC6/+iiZXrLyUp3cliThSfNNi0WAGf9ww70ANcKFYv+0U6+YhmdpJFirlD6yfH
	m4PhFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41gfrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 09:55:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso46799685a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 01:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769766929; x=1770371729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=;
        b=ICVKmIl/mKLKc3PCkhTOX5HtK549Ta86VZa/QCVB7kGgbaYJ4tonI6k1QcQRMOfWpz
         z6IREWvaE3DuuV1Ieok9knqvGcLe1qv/Ce08/hPvRBJtfmclwa5PB2Iyffc+0yNQzWcS
         FVWU0p5+ko7wFNkhUJ/Y7HNuxBlo+w+s8fGlWVxQib5PdlqTXHUt+fHrFDrJioXQJu+V
         ImCwpgsdoSB7cRRnJlvDSlxv12/4Cz+KMd6BVfpAz8b5AtlPJmU/R2j42yUfEZ6+Dbfd
         zdSi5fQf6zXdhIWPMyA6R0Yb+H+mx/wVWezNBtsit19Z9c13LzlpXQHJmzRIRbvRGIzm
         JhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769766929; x=1770371729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=;
        b=BTBVgtFWaLjKx9msElJyWNp8gM+hiKaQjG6UvpgirhQ1i9LhGIoZCS29yUqNRm8Myt
         XIWPZrBvNXaKhA5yLfxOk+8Drrh73Dy1F6HkHA9ML8rW84Ez+v+LqXKLRuVzTHThN8HA
         MIGC2YD3rp6P8DL4FYEonUuZWjAtxtUdJU4VtaCoTV57cs/LVJ3fakddT5e9kanM/H1s
         N0LAi721OH3bDU44DmT3fBlAL04yVU0s4OwXb0nzBCdB1RqwUM+S2o9HRP1ptqpVrRcz
         lol0g4ahHE2HTylIXeyGwha5iwN/W5I/B8/4QYLHfvRmBrYI8tEpxHuruqpsTdTVajY5
         fJKA==
X-Forwarded-Encrypted: i=1; AJvYcCVkXAAxfh9UdcVkInKIQEHI5phLMwyhI/PaGQ45VgVomI5HKLckzVo+2j0+pbWtZoyUN1um2tUADMpzV5QsKK6e@vger.kernel.org
X-Gm-Message-State: AOJu0YyzN7VhZ0PD+AY8qWjktsC64PmsKZx30r6wI4sMOLuGwLYaYVOX
	52eldbsgVdTNF9jid/bSR59TSJs5GhcEzer6zGaR8GcGhtvBq5Mt98p/mdAuQbETwK+3qL/rRuN
	iguGGGzGJhrmtpiS0SmqCxyUl8s/2rVxjZC8OeqBcSUqECoNZaAbWeDdYRuyHkYRoKc1FlM/b
X-Gm-Gg: AZuq6aJEwi0hKrUwmwscDrEnpRLMNdEVLMl3WwO66UtIzTBjQt6JVqcGTOlH1n0Or/n
	PhGTSKcBIIrO+0mN6xzHed1pAgKSFJ61Wj1P/cQm7PbHt3AdkouGdEeiLGmei8EpsWBGL0ccwFW
	SgQWDq9WnFqHUaobNUj68ObpC/e6q1+TxwdP5MwZ2mZMV2R3dtxmO+sXjDGpFPDZhC5DGYLGJP+
	O+262SvMGN6Q10NvIlgdu13XjSYfJ9oc0bPDiS1/dXcUJ5dSeuUU6ArcN09nDwf69TIYlXAEoAr
	3DLUSuzM2iU5zLTSEOMrVp5aHO9Fj1SptNTEGp9+gdUAeDZ0b/s5rDAadwIM0fnqKZnwiXKhnar
	m7S0tQmMZW+pAJQVTIUJeYz3zUsTfoVOwqJ4fNqDcRiFczHtIxyPxnK+bKoUGR1CFgOk=
X-Received: by 2002:a05:620a:1a8d:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c9eb229dd1mr253236185a.2.1769766929322;
        Fri, 30 Jan 2026 01:55:29 -0800 (PST)
X-Received: by 2002:a05:620a:1a8d:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c9eb229dd1mr253234685a.2.1769766928922;
        Fri, 30 Jan 2026 01:55:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6f8sm393035566b.65.2026.01.30.01.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:55:27 -0800 (PST)
Message-ID: <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:55:24 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J9VGiDnEdrjX-xaeCzEKcNoZOWRLw3dI
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697c8011 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EIOd5lv5QegryJ6n6bMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: J9VGiDnEdrjX-xaeCzEKcNoZOWRLw3dI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NiBTYWx0ZWRfXwb6VT4ZNb54n
 PpYwdYk/L0kc1whc5Xx2d5dQ1g5EJ01EiBX71iIJM9D4lll4mjdB1EOQSZs8T/pATc8z04t7Eyo
 KqZPzGIJnKthm2BnmU5tla/C27eSxuWQafyyMgVsrOFLUY8MnkQ51b/hrEBv6m/V8OKC+TnMFGH
 Tq6EgAamlEowA8JQi1A/4IlQzKefd2pDiint8PCMDGq9anIRPv5DCtcj6hYjIwx/W9Hy+qEMSWc
 rfrc2rGWEQjq5KSiojEXlPqdl6PBL635PBThC9r4Z6sYBHii+6mu0laUK+BeXbdzOMi/TpdmURH
 bL33NCVmxvhkOVW5GG9HNjbSAdQJM3s7Xulkn2mDr5Rk3Y9evV4hDvhybZLOH2L+lfYCVuWTfOn
 EOt5GbO9Vn0v0EsYjGA7MLmFXUy6B+IJam/p/TFy+gRm4ZXj5AdBUDir31byc+kdFSVtZ3RxLjL
 ot20wrYNhNinPIGXz+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300076

On 1/29/26 1:13 AM, Sibi Sankar wrote:
> Enable ADSP and CDSP on Glymur CRD board.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 0899214465ac..0eed4faa8b07 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -487,6 +487,20 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/glymur/adsp.mbn",
> +			"qcom/glymur/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/glymur/cdsp.mbn",
> +			"qcom/glymur/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};

Please make sure it gets to L-F (only Kaanapali is there right now)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


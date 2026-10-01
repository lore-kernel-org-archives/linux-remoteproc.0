Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7472C3164D8
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843937; cv=none; b=DkuLHi7QR+h0Uvag/dVkTRH6+ZyAJSn18DV6o38uYVyVsoQdwoOrvS4c5XsBz7VHVfB+8HdQUxIJWpZq6OqFrAnFyBNWRdpOTbEotOlsUlF8g3QqNxuedW3yd1fsex414E+MFHkgEUak6pWrdcKAWm0Adfb1nyLHdYwCkfwoGaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843937; c=relaxed/simple;
	bh=BIIqgLUhmWpsWY5nKggkmUgfD3kve40HmBqG/K2bve4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TZdVYg7+thfzV9ZURvr1uNgPPJ/MrXCGYOge+t2+XMlQocIUpZN4YPsuFskEyMuDdziV95HLGiXxsRIJNadjWeRGXHm4YtNOS3SwmvdGrh3usSvSdJJ2brM8RG5cJSmwD9amskx+7bpY2+gZT20ojC7ncfSEgJAVeQqQN0hshmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cc1ZPgTy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUwLdy+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cc1ZPgTy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUwLdy+A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xbWc962499
	for <linux-remoteproc@vger.kernel.org>; Thu, 1 Oct 2026 08:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFA5T25KDO1NFJggwk8JAg6XIqf3mZLwXS73+Irh4q4=; b=cc1ZPgTysUVQ5497
	qKkvDUW0qKAd5P7rx+ZZTC53KoxR93l+nFATzZ9n1cY3QaGUkkYgrmwa7Gq8DLqy
	tFn/DUS6MhFqR6t15Uy1pl301/CYhwMS2tvMO/lW3ELwDFtATVjf/wVN/+A/8cog
	i5yT/gZnsxEAYFjtXbFjSQ71xBxgphMlW6/iJETbaoOnyPOKAyHWWneRKreVWcYk
	+6hnR23OEh53nm+hWyZjKjxNghmw8KWMoZUVb3XgZ/r76krjNg31MSpfVbh15GaX
	or4szjVNFpu9WfIzRz1+lflzmMWprKV+3MVJuv8NpwqwXyOXQwFKSQDLvT2yRGPt
	gie1og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcu369-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 08:38:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso84172485a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 01:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843933; x=1791448733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFA5T25KDO1NFJggwk8JAg6XIqf3mZLwXS73+Irh4q4=;
        b=dUwLdy+Aui2TmkoL2+4QjdVmlXPlZIzEcmW9b/LMwO7/3ugkfq4bLTMNrcJOilexQM
         11WPPe2acquH6cRMAygbsgAhIX1S1zqGzDxGtf4TxVwTgJPEV3EaGPZ3uUapQp1Fm9QJ
         uZaIOgrn4Mb88dWlQ+dx0lBAxoA6JOKWtE8G+mVUgRORMb6lOrUevYPBiQMiONFo7mGk
         xcr6a3OWhjPUEERP9dUDzSXzA3ZdpaTVlTeC6PUI2ttjG4gBQ+QSqnI3leOR4seEbnxR
         IzMy0iuwcoMosBnCKgcOOwznuvgJ2tiLUYVxLW/KV6uKDewLtmj/tYPP98fBlteRvMCg
         afUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843933; x=1791448733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFA5T25KDO1NFJggwk8JAg6XIqf3mZLwXS73+Irh4q4=;
        b=na4fZFVh0DHXXhqmKl6wVuoQ40xJjAPwSx/pJ8EbHOS74mJxCgcdzkHOoGKM3fWnzn
         YRt7JseKfmaioqSLqkTEOYKNdIa0iJTGOQ5ngPHxuz5I1tcsjC88Iw7FAGXKh8xAyW4c
         SMtIJ4tOat1GDhdQF9Gp/yjrxyfrTYE98U0toIB0LtejWj02gPwBp/dH0/AiP9OYuuhm
         +lmvFFhMTiz9p1cgSlupzgsLsylVJRJ3CkKWJj3Kvg84hKeqKhVZ1lPGHG0yzIhqqx9V
         wKBrCtrRspcZTENABFhxo7Ja1yt+GPkPnEoHoJDDYnPJT/4N6GB3YJbYYYU2G8yVEeJS
         kvcg==
X-Forwarded-Encrypted: i=1; AKwUvBxYhllIVL0dmbjEN7zZKqSlv+ReiKwGx8pp/QfPezrKsyxbENb+EGyGYdq2trbLmk2ciSZLxryiWkU3OzUxk5cv@vger.kernel.org
X-Gm-Message-State: AFuF++l9t7RyRRQUnBlR4GxnRuJKHskCDXD4KuTDBfmN/nPYx2wsr/oZ
	EVHMi2i4ehs7dxr5NCZgXdf2a7O4haWxIU2swss61p0EsGh5ovNKsBROlkiwj6PLerlh4XLYTy7
	OwqFAD/k06orJIg8OM17c8N7+EqawYHptnzCGr9npI4e4H0cnh1OgZgr5mnQIi6HsrCKWKC25
X-Gm-Gg: AYBFou2rb8B7zFjjqwYpuJFrhy7FQ/+QDePMzsEB+UQ0W/nxCovvlRPb/9mVLqz+x5U
	3zmTzSHI4SAq2N3Ua+aiBjA2T4mS/sov72LRIvtDbT6XUUe+HebIZKpgR811LTDULZhd0cPqKZH
	3nXgHK7buAuqkZjFu0bAp5+r22soQ3YXcBMKgUFSJ+EHeqcMTf4n0621lIrZkrW2rldgE7MCloF
	R3KuD4uG4BjwgczRwHzX9uaquig7Sjl9pJ2rmJt28RsIU3r7fPp7CgppHcTGtv3lqNRT7+t6Vlj
	CjB/SUuCGCAI0C3BJcoxU/qUQeP7Pjjh/VcGA609z1WNJA2TJpt9QKp80tnxOK5JzE/mUYC4sri
	BkAEm1ISAJeauIxGtn5wJ3g==
X-Received: by 2002:a05:620a:40d6:b0:939:8bc:8826 with SMTP id af79cd13be357-93ca9683063mr675712485a.2.1790843932885;
        Thu, 01 Oct 2026 01:38:52 -0700 (PDT)
X-Received: by 2002:a05:620a:40d6:b0:939:8bc:8826 with SMTP id af79cd13be357-93ca9683063mr675709385a.2.1790843932231;
        Thu, 01 Oct 2026 01:38:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8efb0sm107009866b.23.2026.10.01.01.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:38:51 -0700 (PDT)
Message-ID: <152190f2-5293-4e6c-ae6a-349cba77b6bf@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sdm670-google: enable adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXxz2bvF0pQ40X
 3HlSTlHDrsyZvtt0cy0GuctgS9pJRPUycVOmv62yrQKvWY1dZBJH8BIjb5dO83ygTax7kee4qtR
 554MMFCGUZHxEZ8qkvSTAQ6zCXrdsV6qS0DG6r6gbqVixIVPHBpsIJCp6ML/opZM4kKPR/i3khD
 pU43R2dR/2lNTg0O1uy8Bz+PmqjCBnCL4LMSp6RbrrtR7IX7Xf0dUmmn5DjHwq2+83PXn8APaei
 /GO+ayD+bmnABTraScsHDHEds2cIpcCjI4iTOOBzL1bMq5y+gTeG51iQnD9+4KvTZRVsbK8jjNq
 P4ifG53ahA9OtF7CUNUED2wc3Jakq+jR9aTHxiivpiKFGzW9Fq4YgcYMWVNA+mvbtnrPEI4z3sP
 Q7XwE576y8vu5Y7zge/Ve1kzVvKmc4pU98mTZpXto/CpMaI9uM4auOcB2B9iS1OP9hEqfJVYa3+
 sovggUD7NvvuGDfcHNQ==
X-Proofpoint-GUID: H_b1nB8_rvA3e3iUC9Hgm6YdNF9cdx_6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXxdF9StYGZ5zY
 FbUes2ef7ne7ScOEyHQjSz784uo/M1lMM6mo8C6i4/xi7A6okShZLWpUI3WOUI5r+slT8MFzBR0
 0ocflpEi5LIyHB+BDPh72ZrDcaZNMek=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe1c1d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=6YNwo6Dc39sHZJQzegsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: H_b1nB8_rvA3e3iUC9Hgm6YdNF9cdx_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

On 9/22/26 3:57 AM, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index b4854801a5f5..70996b94cd33 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -196,6 +196,11 @@ cam_vio_ldo: cam-vio-ldo-regulator {
>  	};
>  };
>  
> +&adsp_pas {
> +	status = "okay";
> +	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
> +};

Please ensure 'status' is the last property with an \n before it

Konrad

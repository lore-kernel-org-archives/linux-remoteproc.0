Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577632;
	b=rdazhJZ9Yu9w1aseP190t0HHyf/TTqRw+0pjGGuKLT/ZCti3RrxSC8Q89rWxNXAo5Jhu
	 D4Q6hpciZRB+3sYuQavdOiCaFACiX4mXZO7cci+eWHQdpjWkjFNYccOORnkrUNR+pVJg+
	 Rr0i1WrPDlVue7Z3o5WoKMTQLfXNsgFPrxiyy4hCth4u4rV2XnqRKj6Q9gw/uKLZZDW/y
	 hGCUxESUz1X4ek5m+xTb2zaoAoZxKgBKlu0IuHrKQjLwBW1OADW2GxGFygWQBtD2e6Wcp
	 JFgPZQknzGFSK3dKMbumMuR4Yv11/k3RAdRvVBCW+/khfPruYCW/oNk1SSuo3UJ6GMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
	b=flUibF1pE2w0HUTPEvwajxI+0Kn8t3og7pj//16IGjp3fCVKUSnUFJLRFF4xNWK3AlFs
	 sU8ecspPsQwIUE3c2yvSTnP2E6n96nlaTjFuVeYqk/9yf2hAb7PANb/tIx1R+niTEkkaC
	 IvFUjSsW27PpmXWDYxjMp6xzdCopd9Jyu1e1kPnw+aMOYefJZhmQ8Jr3CWGisSSnzABrq
	 Sn9FAoXgrtkUW7Q9/iQ/7ERbRPxv+G+5Sosf6KRFtUnMZmoy/rLvfV/cHoooDjAsLLrf7
	 LHfHZwG6h2Rzw/W5HA0sS/B0KZIYg7J9qK//RPvDmPcc/AXq8WGll7l/JkmApN5L6Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVzNUnuj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRdCIOL2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A81606A31A
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A81606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVzNUnuj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRdCIOL2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5k1U3015975
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=; b=iVzNUnujYHA3V9R7
	hcOuAWdvNdtyjm2mjF82GXc6S3/HAqgRlEIhBzHwGMrldPe2Rg8y9hVVTLOVG/rn
	sKAyQVFsSLh+z46A8K4s2Teiwxb//N418PEZtFBUu1mwpfc2NVojXjVgl7hqwUhP
	VB/me1qJd8dZhjBtKtvMXNFScA2uA5gofh2thSqjMDKD7BFOVXxuzPXZcWffSz3b
	eKKIeCuh7HBegJk+taiZNXJXoxAoa9HQXzAw2Z1Yj+N2JaGStAJOTvRLTKymxb0c
	4z4Y9V/Mog5cym5TYrlKCOTa5hVeLHAHqdysoObK/EelBrgE1DAZT7oPsdIdOfcS
	C0JMqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78hsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:13:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso5231685a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577630; x=1793182430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
        b=WRdCIOL2DLoIdAdg2NhJrfORU8NKBUCbqn9NVMtLiDUA6sUZm4fZhR9rruEcGz/4Kn
         EWoxzihxfwrqnzMt5OEF+iADdp9lAYASBYv3aMvbEg/IM2/Ml3r68Db7ZZiz/po9Zqz9
         ZXEPE+4svlE3eL8imjn3jhZh1+i36cG/YVOizbT0bn3eibE4X6jsiZb7qqMk9A1NuTD7
         LvdX8ythKCWUef4g4BwPKjnjsnaGGwBSo1VSdAqVUMTEM903NjB8ctWYjwuhSjZ3Rz67
         eNV20GxqOUDihQLTSyc6OSXv362pGIBO2eaezdFFNUOwBpPZmEtbb1cHlqzJHnHps7jo
         M3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577630; x=1793182430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
        b=Lnhe52UM4rnoaPaeE4GuMOcdHMRHtPhI95fZFlvRuyvYs9pP7oKuz+Q//D5zvj0yqx
         DrqtiZu1aH/rIV9cy6GNLZ9X/xrBW10gI68X2qsjXBHaXg8Zmb9K01NoOzz75BEz2AAM
         GwmRj2nPwb39U5ZtYsPvjU3HC0GQsO6AHzoCBCThFS+gq8c2MIyjoqn67RwVMNhAdYyS
         kaE9QaYUVPZYeMJz/yBFahQAKoReV8AzFMcS7DCkOCysi/EsYzHagWucXUbFVHxKEtyu
         gb17VZXCPXF/5klLFxEc2+YhULRSDQu+Q2Dghc8YMGpCAdXbCDzMDD3L0WLTGRkaXJpS
         HPbw==
X-Forwarded-Encrypted: i=1; AKwUvBznNJtnGCSLiFWrwvWvrXnjOWlCTwh8d0jQYhS0mmh+HCgQdwYqi4WYNA1/lTIp+rYFSbxSmo0yWgRQym9NyJ5P@vger.kernel.org
X-Gm-Message-State: AFq9FYII0QGPofXVddDOqcBEAed0fzc7SQ6WtGOsHyvgh/AmVNYji9EX
	0gSQcUnzsTCzH+PN0Z9c+sK8uyVZRoQRUSXSBYR2g/ffwhD+CBd5qi4awbPYIPfjpcuSRVObY+7
	SAsAY/QRePY0IbDANoqh/Qw9oDDF8BFmlShKG+EE9eVv3X3UMddi9Y2Nr//BfD4L1qZN1vb8V
X-Gm-Gg: AYBFou3IuycuFMDKcRYmEtZar6lgBXvXBYFwRU1xhMJZRbrWvt1sc2Ys/vBq6uVU62L
	hacR7N9+B5FrxOPGuNPnXcbijvV078EXuJE5DnL6DU16c8/ilwBRks7LvSsjeK0mpFXYOvk/0gL
	4LoFB7OJHRkwEpahRF1tfea2TpKG9m2cP2Q87uAZjoP9v6EjL3gBeKELwmn3QJRNN3ECw73Sl00
	Aw7aC+QaP3C9RXBvpcjUFKo5N3l7UeiBprcURSaUYM+SolxrbOQrG0bkqUs6rCSSbtLUouM17JN
	nhFk4IhPZP+0nCroPkgglFgzCQIMHflcGpo5QrZxM0CiPllWYKz0oL71354ADtI29/SW9jBf2Xk
	SR/RCzKpmByrRyz6UlWCfPQ==
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr355236985a.4.1792577629889;
        Wed, 21 Oct 2026 03:13:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr355233185a.4.1792577629343;
        Wed, 21 Oct 2026 03:13:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5a82fsm62538766b.4.2026.10.21.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:13:48 -0700 (PDT)
Message-ID: <12ea4915-5ecb-46e8-ad56-57ee989e1efc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:13:46 +0200
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
X-Proofpoint-GUID: S0MiTuelS58MTYcgv1WwenYOc35Ax0Bu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX07ftmlxPU9D8
 3vmqRIdsOKgJjCTqyx5Dulemuqn1ueCieEfokSWHDhB2m9/LAFDN0XtBA+3Sl5ZFgNrBrZghcv0
 o4765C57U0gkVL7kOmzywVGxdmto5pXvBfVVc5eCSFV86/RnkUAZou/lesoXYLJ1GZJZSl5zk89
 bEfbEpJzpHnT7ZpFM8hdn8R9pRSl3hUgEAqtmhXEZHgpbjns7LZrUpkbc4sxVihewJ1vJTQNONg
 yHJUZ+ijXtIapMwNwEvSVFD6YJ03BcEubxg4+6kNYyZA1dLI2AxWsMSoE+l5R7sEGnVrqlJJgKp
 SGTIM3WWxMgXUC/aKesH4UJNkja6cL8+aQMivNTTFe4TpscQJ4nf2lwX5BGdjTWjuRqrFWBtEW5
 5NqqMyW07ERbbguBAALRnM1IOjUlg+LJ+3C2MeT8qC/xeEsIrvpEKfLUKNwvt4oYDYBvjOkbj1+
 anAZN4WYlasiljz3hCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX3ysJOXyltRth
 aS94T7nnTtKhRKT+tPsRnKxUICDKcZeU/j3/Z6ki7ysSbb3GijM1O/sZSmk+atX99MGgx0ow9PB
 5Oobk3goHOJJhDkxGaQ1BcQmW8tv/hY=
X-Proofpoint-ORIG-GUID: S0MiTuelS58MTYcgv1WwenYOc35Ax0Bu
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8905e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

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

Fixes: a376c10d45a8 ("remoteproc: qcom: pas: Adjust the phys addr wrt the mem region")

Konrad

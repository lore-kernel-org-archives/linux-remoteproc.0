Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5BF435ABB
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357010; cv=none; b=B+9+v1OJ1CCPP+CbOyQ27KXxqsSRyYRxSxIgvuheuR66gjFZawsyP6lzXIugQTa5w3NNCgLo7VV1n9VLALA2Y9mnpS2kRo4ZEmvPiyF1kfU3t+D1n1aRxOlj8HaDym2gNfoJUDao7oxJ1koiugJu5t/DZT6DcKaug5oCvNwCRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357010; c=relaxed/simple;
	bh=Gp9gRhqHhA/mroT+KL/Nv+qmsWbBRdIiJM0Bj3/656s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPxYgDx/GiHGP0nuPybtnqlrkpBEvj9/zHsFqh0D4r0w8Ui2uocrGwDeFlEebiUrw/Ia1PMctkp/DmeEykYWmJvwWBZeUOfGucm3alc80+d+KNq+UJv8crQOC2ERdQgsPA0VIn2tdUJtSBFODU7FG4kGI/de/zkBJmIcbuiVaPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovvmGeRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0s58gYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovvmGeRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0s58gYZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFCVY990326
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 16:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=59jxAI22TJRL0Dh1Jvyc1De/
	oQ5JZ0dExzadshOF7vE=; b=ovvmGeRZGMFlIYrnybNY+oWWjfnQpELlkl+otXwB
	rCymcy+EClHImWC4OnZ4JkyzHqaVJsQovKo/IBNdSvMdDDKOGU/b4Dc6y+OY5kcc
	YbzxKPGYPHeWn2uiLrxoROPmotrSUuzv1q+dgOkptJNmievkWh/GDw+D4hVIu6Qq
	vAhfw/sNfhM8VwwCCIte186yC1p6H41VqK5K+Art1aOXdaYVybW4r5LQgfMtfJnN
	MJbg9/ahV9CuJgOL+jCnPA2/7Q+ep666xs+Oi1ZCOZj1zBumMKSHh2Vt4lGPuIbC
	p9R2RNoIgaZTHNlZRCP6pOTYGH7UmPhCOW1Aa6DJ5u0Tjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsymm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 16:56:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8895156101so4883102a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357008; x=1783961808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=59jxAI22TJRL0Dh1Jvyc1De/oQ5JZ0dExzadshOF7vE=;
        b=P0s58gYZpoVoYzHlK/N+HmHoZ0xM57dKhnfYiV0Z4kIntTyYgg+KD11PyFkke2eMjK
         S0v79nMNoVg8wbWOmj8TgM38Zxo+cdYJOCiQc1DQSBVca8qBkGt+f2L85nFTkmaWWOGb
         u3a1B0PXssaYAFEjnjHYyprzhWbE90+DNqBu1mk6iT/smXJqVBOvkLHcgM6IBrsrbV1y
         iUYJmNuCF4q0YFfbDAcwX7sSnNULMaA2ncOFFvsctfFYhSDG6B4NswgrHXlCUL84iuSG
         kaESF4qWgS2JCJxj3SloXjYJbzdBP9byzmPF32GKKX9V5qFfez5ZMeJC5A+VVHd0ZsfF
         8wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357008; x=1783961808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59jxAI22TJRL0Dh1Jvyc1De/oQ5JZ0dExzadshOF7vE=;
        b=O31T7yPrJLHdhP5HnMjKieRzNCK9tCjqoZ3YglMvant0Tvyml9nxpoT2oIuKORfCp3
         bCtRg/j9kP7m5M6xjEWMHrQQn4pWHU5F5T+bLGxU3qfnyjdUwcu06bnQuQLKtB4TGSxW
         wUhNQ+ZhQqcE04eU8xrG0hDlnA7VBrW6Envj+o0YM6Cn5hb2NHiih4MawXfYQVOI3RVg
         uKNVWQ/abo26kJtHQahy9JD1wwKeclS1OaZqK7BnWHQZ5aflB5CBXRoRqxoTb/7Br+ZM
         zq7FkObmOC4sZ/PL73hVwVVZNNh+qRk6wNmZH5gPXUP/4dLZI6YR17Xgu557UAY+AyJR
         I70A==
X-Forwarded-Encrypted: i=1; AHgh+RqAL7KOQF6aGsfPlyd8gduk7bQ6GKykltjWLkFbyuH4YG9J3mV/f3D7aRVBfko2ik3RenVqcXKL63/ocTzn9/4X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3i1IZnZ8orTyZ71r/vt1AJeBpRthsR7hmL01nUIHNPamDpqjx
	iHqewZC2yRTmnstaHhrtx9c1O3ql4b5CBbrcuGN+WowAbTigkaDdeP0C5eXH6uv4NYL47Na0WGK
	YNwh+GekmERjhEqXWFaaevpP69EbicvN374pz8VZO+eWVyE+wYkU44XI4DoShtvvrfqEnUO3Q
X-Gm-Gg: AfdE7cl1VNHobhse+iTmG5YfHyY0gf7Xh7jzR9PSmsCxALp+Fb+Xu3+1So2UZVvZ/0D
	X0XG5zr5MYQDSMQZblmb50lU/MzFqFmX8JFVPWwwuF1CnACS79Ogpwz5eSLLxHY9mFaVzwzucIQ
	KY+1llPy24rjd22Ta0oiKA0sqLaEy3vaN2bGj5LqI90cwJHx6atn9caLZ2bGPMjDD56AjoNHyke
	o0/BmUDKqPuKuThxZfSzCEGFpLejVpUM1xhm2NN9TVOSF/zWawsehDJX0P4vsFxTS8hpBRiQVuX
	zIUL1gxbSQ0k3bsA1cIlc0UHLkpNXv+eh/KiW3uFX/Fevvk1D3URYGwUuDhXmCfNqcGOb8h3hpG
	YCKjw8ycP/4VEm8f8EHbpKKG2tHmTjqCUE7Cquw==
X-Received: by 2002:a05:6a20:7491:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3c08ee92de5mr1666350637.36.1783357007404;
        Mon, 06 Jul 2026 09:56:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:7491:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3c08ee92de5mr1666306637.36.1783357006887;
        Mon, 06 Jul 2026 09:56:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3b252222sm37522653eec.23.2026.07.06.09.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:46 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:26:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem
 control instance ID
Message-ID: <20260706165640.ujq6zxcm2xjonytw@hu-mojha-hyd.qualcomm.com>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
X-Proofpoint-GUID: fJ-B24N_08JwiNEhNYDeXdy2nx8i4SfS
X-Proofpoint-ORIG-GUID: fJ-B24N_08JwiNEhNYDeXdy2nx8i4SfS
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bde50 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qd7qWWBmuhcpzUx0zIEA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX8BMxXzt4S7yG
 sKwlxdIlsiH5acRb61VVY6c+9PtXNxMCXwdwUMadTaUQw+A0kXcJn+RXcIAuVjqiU6F2qNCjfPH
 LK/3q32VmBozhF3nGWZ8eEmcTD0EJfmuLVitICCgwE2wwKGPXl+k+/0SUJDuptGwhXIiDzFuMwk
 wJPq5O55N/5cYkotSaBJkQoeB86BcZxXrkIe/M0xa5mWdYvkLDQZkRuH66eM6NwKJD47XFuymtQ
 j78YmocwHMixc4crTzK7nhKGuKi7q4neaByXCobqeQj4JsKm8bQnDVd5cwf1a0qPVxV2NAk2F0j
 +jIP2riWC/iH94nQP+lsuvd9IHujBsMNm7+KOlTGcmnUf27bF038MiDCOk/3d+BQyChs6jHH2PB
 X7z5ck3JD8QaYegyuP6ZW9mKSUsjaRiMoRkwZHnQ/0oFIDHXehslHNRfyYCpSkOsS4JRe2tKGAS
 77J0GxKAjihnblqb6xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXxpxxP+mK6Mbz
 M4HBXud52ayvwliLWQw0zUw1MQhOfBnHIbg2Geiozg8zNnUJvzK7Uab7TgpieP8IFQMp2XQmIOb
 ssLo4Gz1l7KFzm6cn1UPiV6ERjDy6Ek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170

On Mon, Jul 06, 2026 at 05:37:17PM +0200, Stephan Gerhold wrote:
> On MDM9607, the modem firmware exposes the QMI subsystem control service
> with instance ID 0x22 (34), as visible e.g. with qrtr-lookup:
> 
>   $ qrtr-lookup
>   Service Version Instance Node  Port
>        43       2       34    3     1 Subsystem control service
> 
> Currently, qcom_q6v5_mss uses ssctl_id 0x12 for all platforms. The QMI
> service never shows up with this ID, leading to the following error when
> trying to shutdown the modem:
> 
>   qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service
> 
> Set the correct ssctl_id to allow clean shutdown of the modem firmware with
> the subsystem control service. ssctl_id 0x22 is also used by other
> modem-only Qualcomm platforms in qcom_q6v5_pas, such as SDX55.
> 
> Fixes: 4fe236a1d024 ("remoteproc: qcom_q6v5_mss: Add MDM9607")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-Mukesh

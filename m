Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE321E8332
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Dec 2025 20:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310706; cv=none; b=nQkdm2ZzAzHgZlY3X+2V6rPUloZw6A2uGlwjXksQT+RcRT3di/ak4nNgXDmRwCWUjfsb2hGgQm2Bm3iaIPFvjYCkimsiHRCXVhzT+laV/tqjCHIo2JG/tzRyLsbn4Nw8qol9Izw2aWk7HRzDxk2oRakrPzpSnc6RIZp5Cm88oY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310706; c=relaxed/simple;
	bh=ejXY9qkcfYiiBA2jlNqE1PLszyFbfXQeFd13v4ybFRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQ1KkMzGV/0+kkgjM9QmSa6c8JkBpgRIZWUEVC0wDGJ8yhjwbky5KaMoQX7LGkQIpIYFupfzJXmlGScnMFfY/35BIUFEPUGBAJG2IiL0rqislnyYLjrlL7jdBzUuoIqYunsUG2jlmXuS5k0d9vJKJrlo1ZhcShrXMQX0fZRnQwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7mo91fo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dk1ERJDn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7mo91fo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk1ERJDn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Giu0X3542177
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Dec 2025 20:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AaUoS367PS82i4ffAxkDidXw
	K+3jS8e9PS5K6YsjNPE=; b=S7mo91fowkEggx/75aGsedQDQreptUwkAFq/0sTR
	/hsbJa27LyqmHFiK3cU8pjKVZDkECzWe/gF2LlnmZvRbm2eH0jhr2jCvD2IQOTHm
	h2RFKFqt+j9itxNXtU+U3+DAC8+l3nuWuj0pxHxPMcenysNi3iDvqJHOjAruoAm7
	z86Kugjyl4th9vafNwwsYQtWFOgcBvBiVFEJdiW4xyZSZSBChSZhw2pd0aIflDlc
	8RZWPUs5wp5OsWyT1rcc8gFoe67ThW49a7tVdopxkYZuvmU/srt7JwLmwvcuou2F
	6R1q0CCFm06YubHwk4OAhMNBMcSPJfd7sRThW50WOFNIUw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf2fvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 20:05:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-882485f2984so110242516d6.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 12:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765310704; x=1765915504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AaUoS367PS82i4ffAxkDidXwK+3jS8e9PS5K6YsjNPE=;
        b=Dk1ERJDnwkGvKqheO3jyTnsE1QCdECZ6j/rCWzrkQO/O1vrX0LXwgZHAmwsMGuA7xJ
         q+IeNV99qEc53lu481RVVPrwAmTg00BNNW9ZTMWBc9DYJeOnpYnsWMGg2kFQODGFqMed
         vl/4R6q3alCddFNTDoeobUbZhRrkHh2ySVbyZHJvJLk+VCvxzpF78Z9sUnl+KNoq6C/s
         p6KkHutJT/mq6CTGMmo6Fdq0gFJO62jGxtGh7oYT56C6DedkJ2J3JyrfBKvqmV7Yas6d
         CKwJUHPRejcqVeqvY2UN1ZrNlGVq5Q4kiFwS4uzzCJCR9ubZVR5RS3I091b7dPxDEY/M
         rqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765310704; x=1765915504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaUoS367PS82i4ffAxkDidXwK+3jS8e9PS5K6YsjNPE=;
        b=jmmvR5KiD6kg2ai/ZX7xws7Q9IilBLtaPYfdFMHxQgP/zX/g6LPQgHG19TZ+JVBWvH
         bQfzGLWHy3Bj/mASm7qaVrnjm75Zsc9adogbZ2IA9DjkDRK7ppl4MTNa48S0DKIYld/s
         mE9Pfupbodv15gpjOvnNYL6Ybr9ADdwpGF0Qon16Lf/MRXxJnTLr/KgP4Dz0u4WlcKkb
         5oz4Jxq6Jq0cgpa8CA/ccr78L2IaE2TNjRgb5qsZDldhnsVmib1juDcv2mjxvnx3aEu1
         cEbHbywUjLWYJ9Muk5UXbuOrBO8dJvjxR34hDNj/y56q6q8bJm2z9kXA8ks+4DC4WfP8
         WosA==
X-Forwarded-Encrypted: i=1; AJvYcCXRKcDFkYhfqKqW8clEiYefmUcCUDVbNkMKhVXj3fyv3tirQyE1GtZEkxwAfHdrkxVW03QZtvxLJr/kPFOu5Uum@vger.kernel.org
X-Gm-Message-State: AOJu0YzjqeRQXatAL1TbkFWw487WfB/yl1HTe075xSdCLeacWqYA/WCV
	jEjvYOo1khJznFxFJssDSvugW+5F4qdRQHlNKoimQGYP8VfmNlvDcUsXm8GN6BVShH5fgNqJ2+8
	cu+B5puqxHuhlcZcWMovKJyDMsCvad8k13sxIzkbzjilugT//aT/4AFNN73VG2biU09VmPqyq
X-Gm-Gg: ASbGnctsqpJ+6FEiFZ1cXN0341nbICg0zERcPctDWzegnQ18CvVKPidi2a0jx9gaR/4
	iRwuOOfMvpT1zwZRZI+G+dINzS+dJgHRQC/gh31Pt8AlTAWIvcRR2xXUpkzm7YmNpf1v+5C27gE
	UPsl25d1YHS3hNfzWhbSHq2yKm1UNkhjuVp6KezLKEeSHRHomRctbljlNHke69ucgp9LuniyRi1
	wK08YbC0ZGw8BfGs115UyriSzXhByIh7LqK7GIXLBoOpW7UROKXd8Z8RjtGbqC+lbCdHbr2NdEO
	RV5+ecIBwGDGY51bsoRoDLlp2++JHlqgB3Py4XF247IFS1NjrytCavDnGm4tpbgNVjRVjQapsaC
	nJ/nIzoaXjeT0xAPloslH5vdkobMhkpS0R14WxV9lYzgb0P1tkMEd8ioD+kRwZtS5WLbV1ViPl3
	4dUNmXmJaWaC1ggdY3gayFhN0=
X-Received: by 2002:a05:622a:148d:b0:4eb:a4fc:6095 with SMTP id d75a77b69052e-4f03ff2055emr185688541cf.68.1765310703770;
        Tue, 09 Dec 2025 12:05:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWdU83n8r3+pF7hBLbvlPVS2hulqvwWJVcQX9Oy4tft3zu2KPJ8Yznes+5bnxCDzeZS63rBw==
X-Received: by 2002:a05:622a:148d:b0:4eb:a4fc:6095 with SMTP id d75a77b69052e-4f03ff2055emr185688011cf.68.1765310703323;
        Tue, 09 Dec 2025 12:05:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b2eecbsm5381148e87.43.2025.12.09.12.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:05:02 -0800 (PST)
Date: Tue, 9 Dec 2025 22:05:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 5/8] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Message-ID: <mnriqymdonsqjmoyy7wtrfi2lr3ievgzisf4fhotvaejitck7e@gcjldnhw2tme>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
 <20251208-ipq5018-wifi-v6-5-d0ce2facaa5f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-ipq5018-wifi-v6-5-d0ce2facaa5f@outlook.com>
X-Proofpoint-ORIG-GUID: NbcqTSGRHDTlGvNDuUgrNY6XheVH5Zal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE1MyBTYWx0ZWRfXx7Rsjc5sIgmV
 3r5Qem70Ptl19tVlp84gD2XW1ZuA099iuKzjY++4IIW1ZkMTL/iALOvKSFy61LQkDeclfYgBiMf
 IyxUOduQz3S/9tqg6nRGqN+WrbBhPmfo43HSHTIpBhvqNUdxhBgLrMOU39NfeoyL7Zhfln9CzfJ
 y9/apbblM7UVD2RH+4D1RpqKJoWxeO4apRUhhHRgpZ4BX5L69UmxMmT3jC4nCAU3hqUCyggDB60
 9FSXJdJkE4dkaOAAxsJtOJ9j5sJKpvwJ/6gEKPRYsWX8W/X6If+0KcbidTDaYhgnOJssu4wNRjX
 HIBmLCxYmvuaE6Ajc4CyUkXDs84sXM5ZpeiLrp1EL48u/7iLhBY5bzyqiQ+ICmfczDNMLLwnwVe
 7JLHS0PZAyEovo1NV65utBlyN80F8g==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=693880f0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=OCM-LVnu836T4zQjxcQA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: NbcqTSGRHDTlGvNDuUgrNY6XheVH5Zal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090153

On Mon, Dec 08, 2025 at 04:25:37PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

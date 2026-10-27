Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098022;
	b=BI+Wbmcl+GedGoh7cX/qZaRjNH1lTj3tYhiIcqeJtokeErTDeDnSUvxh6sLXD7CCIQ3M
	 bTHQJ1PDk0MCsjIDloB6GcejDbCtfT9WdsFaAuVcvVI6Fc9sN+XfJqX2nU+T6X7zW4hG1
	 A/4WzILV0dDvcwCrFHe6YOs9wDY84E9oOsun8q3qgae+ndOIWie4UfX61sQlY8jWm4h9t
	 5zmq4pPwY8CuidmF4X7HF35snBRXlx5Z2W5SLbWWcE7OuytO2Kwt1fuSni1onrrr2a23R
	 7wuwWkK5xNQouT1BW6THZfZ8lvgUtUlUIkcrEbWeGHeGL4PrFi1hDlfwuTv9EL4UP7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
	b=Wbjx7O1IdB2vzIVMtYV+nrcigewBjD6lkVJC46s3TZQ9TpydS2UbuYfhEzznihlHUyK/
	 bGaVj5RgdRxAthQnELj/MMRjLeewHAORF2ljGaCsvAPF7H3X5AMlzmOTEvFlQ4kgArOHW
	 xCLjbDsI/BmDdDAiE+9rfJRxbEI0BCLwTHI01uLJrHLVAonnKVpUUZKjuatNAtIcJv68m
	 Hrx51hJ7KkWR3HnKVkuSS7rL3Sza8USd3Twq4Xsys1Qz04d3nuMJ/AougcxI/vkS4GGRT
	 jx2pirIN+jvSFlpRQP0FQD5UN0E+1tx17tzJPLWO9UkelFjBKhozKqwptR8nBIqyRyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a08wf+Sq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl+AVOWC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F84D606A31A
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 10:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F84D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a08wf+Sq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl+AVOWC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe8RE2458558
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=; b=a08wf+SqybYfPFpj
	CytNS6e4xDsBCkAlLEx1QU4PEo3mSYKh8DvmOmD25zWSYiDLe5VxrfoksTWKId9h
	Sz90DiVgekaD6JdCoOAPLu9JpWoHFvVcqyLgXzwIEoWd8yVVy0oDC/teYrclqvNd
	qCeYoorf5tiEqCsc0L9loQGJ4sBCQXA6EDmlYRKMztilJImASV9wzhnVrn1Zwt5W
	3EmhDT91onmQ+9MPym84c22NJGUET488USoXhXZiLwgk1AiBYqEH4+ve6/KPQSjJ
	4aIvH5WymHGAZQ4HcR95r59UQFhTWVdjW+eTOQevO2KTPG9n4vKDBQA72Os6tl+d
	Ak2Jfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9v0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 10:47:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so14270191cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098020; x=1793702820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
        b=Hl+AVOWCU4ZrcfwUxKJkxKivhj+CjijexNngoCePy/1nLR6+tX4s1XPIfCaOuUThPg
         AeyX1QIWNpA2OlyHse450PiZ7cCmgKVEQoohGvdBi4VwKL3cRa6gkk+WpzJw5lCHUva2
         a3Ob7+jbXXfeWEvnbOhVgwK3Xh7ie5yuLkSr8kkNXedp3jzAq8Yr8RIb4Ce1UhgX4zgD
         SsfUB34qduiwBnfZE5BsworOoBMewd7vGghjj2wJesW/bkLnIKHHMN4+nppiH1Ye/bAJ
         58N82lJkvYiG9S1TUdFZi1qUrC0zBpJDR82Gp0+XlxhqasxskA9TwzWFh3vNzl+Mi5ch
         NntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098020; x=1793702820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
        b=fD1JVkYylgwv3gNmiGPHZfWRFwcys6zQg6MQmKTNAH0Bc7C5d4aBHmJiB/xt4p2M/t
         4ZguorqWihv/ixc5LP4wS12KyxEmPJzqYmaRtxkx4A5CsWLhzZ6dPzdrwvw8CSOw1Syu
         P/0EbSUiwXqgYZdSUl7RYqLDacRzKGJe0wR1js/xsLOIc8B/BmGhkmWiF+ZOhwWh+aua
         fTe9ZgoMc8a488nmCWwmIQzc1T4+WU9LXbrnROd2AhhR1ozcvGAxK09WKNzDFSr3jUwL
         s3N5myIPEG00k9BTSR000u0gTfTNN2uAK3/qNMCB7K8cl2JbKGEtpsbd0Ggti4rCROhx
         5qZg==
X-Forwarded-Encrypted: i=1; AKwUvBxz4R5TZZCVKNOjX0YtUxjcesZOa/V8yrRlJTZB+P1nRuQ8KrG4y/4ZR1VH6QQBXf02a2QUTqW+At3KBu+E/bBI@vger.kernel.org
X-Gm-Message-State: AFq9FYK3lab8eCQkHU/EbK3rt2ALjUEBotH3+zdueonFhNa9C44zOAYB
	yntxJHxI2tKDmUd2B1txuc1xRHY9Q2xFC2Xl+tAhqlX4ikY35grUA5pDWXIGksCCiHFWOal2Csf
	knPqsrwpj+lQVJk3LTZr7Hn9MDiWwaCpBYAwllH8uWpluztbUCCiys7qXoKkXirFHllxRz6Mm
X-Gm-Gg: AYBFou2BJnliRR9EMuYjBeicDBrf8ezTAE7HQcmb5ZWvpUdiTAX2dOCvXh7ooEKfp0X
	PHODGGV3zVAtCMYuSP+fzvPezCNRomSO5TvP6qjmXFtlPwtAMLAMURD4j+b4oJvcEpml4uODpHg
	rbhDW0tJujgTpByidvjYN8BStyxyPjcOZWShh70wWTjGp7l+o4mDNVmh0LegykfOVJ+9lVA7CJD
	dJADGvKv2kTnFdAo2tiKGJHo4TA9X39/prz6ahEFXC3VLt+YKR5P+wrIn6VGFkd8z+7xFgK/fXT
	u+JzeC/DY9dCKGQol78bTasn/VaqCxbe1bdQJIwbAPsvNcg4STJ9yzvWl/wznIPBAG9Njm0V7HB
	/emOtkFNr8dl7v7j5fHYfhw==
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr1516912185a.2.1793098020497;
        Tue, 27 Oct 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr1516908285a.2.1793098019913;
        Tue, 27 Oct 2026 03:46:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b47b29dfc3sm1138884a12.32.2026.10.27.03.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:46:58 -0700 (PDT)
Message-ID: <2a77fa74-6016-48ee-a1b4-1df45b1652d0@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:46:55 +0100
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
Subject: Re: [PATCH] remoteproc: qcom: pas: Print auth error code
To: effeffe99@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026-pas-auth-error-v1-1-1569e83358e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-pas-auth-error-v1-1-1569e83358e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX7QBzHL3a/rP3
 O4RQ/WayxU4NX0ZGXz+78ELwlr4Rzs2TzJjxGWGGtJbX0WaqB82L8+2mHHWKqjyVYc2tAR4DO1v
 xZck/CpV/8RIemUGc0OgZ0v8vgXwO1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX64Vclpehu5Kc
 4yLx8NluqqSea+QR91w9w0mAHA2T+uMoJEvUF/ZY8w2Ay+vurrS13/JzvIQix2qPOFZTDzlW1m/
 mFvbljeguF19zBftKN5ROYqa2hNBH36ii+DseEWQmE67vSUW0Ye+JKPhEP+saJWdIT5Xzkpadzd
 +NC4cGzuDWhyzqmVndCUwEm4su8fz01v3+M0aK5DO2PQJ9F6kUdq+P/DL3ymyfqWPryzfhk4axP
 C18NnU+1MQz06Pd9vkMRO5aVrVdC0h2eAxifWFnBR5BYGNv8YpL8UC8Q/9K5LlRnPJN6Nb1a39q
 0A9OW0ZxeFk5fQHXzqcMTvLfkm+CqH4HqBTkdNgueH+llEEMnBqJFi2tLYNNWZ4eG+5VIs9ADL5
 6Doxi0PlH2UdsM4zIhmJTnCPf2OTUP2bGfkw/6BQO4HKKpyyly41J4lBSGSD6CUGqV4WZGo/K8v
 2RsBWLFm+8gSfJvYi4w==
X-Proofpoint-ORIG-GUID: PLFu3oLyx8nC6l2Lg8IWuBUaK_J0jUJf
X-Proofpoint-GUID: PLFu3oLyx8nC6l2Lg8IWuBUaK_J0jUJf
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08125 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xm1_ZTsVmEa9A2bUQEYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270042

On 10/26/26 7:19 PM, Filippo Falezza via B4 Relay wrote:
> From: Filippo Falezza <effeffe99@gmail.com>
> 
> When a subsystem fails to start, qcom_pas_start() logs "failed to
> authenticate image and release reset", but drops the error returned by
> qcom_pas_prepare_and_auth_reset(). That code tells the failures apart:
> a negative errno is either a clock, interconnect or SHM bridge failure
> on the Linux side or the SCM call's own status, remapped by
> qcom_scm_call(); a positive value is the status the PIL service
> returned for the request. Without it, finding out which one happened
> means adding a print and rebuilding the kernel.
> 
> Print the error code, for the DTB image as well as the main one.
> 
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06437B3FD
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234254; cv=none; b=c4fIVsIvWDSdKeijTPuI/n680YG+jXj758FWWwYoaYVNMqVinbOvnH/sjOyxZyA1zUTNcfnIUdXg+em+KoqP9zFeG8GgHu6qFPYWTnx9cGh/XVQ+rYa2Go6gZKeIIHT+rxEOoQiPO5a9P7KSqVLHVTNeEwXsmFkMxXHvHfxmCaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234254; c=relaxed/simple;
	bh=5E58D+EVQJVFrRxJAbfWFijvIQe461itWawamqbK6Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijj+C6JXASztGrf3hHeKHYgRzQ/ux3VZvtrm1AjVoxxvhLIq2CXgkh73LCz/GxSy6cYvwGx7pf5hQmwPyg2gq4rxCG+e9Cc3ARpOsRHaK6CmZZp01nD8aw8Cn1dtnhaght9ErQuWM3uHCHfPtjJklS9jZT5v38AJP3Q677OJm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofeS1Rd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a45L+mMn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofeS1Rd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a45L+mMn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485nIC62778936
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VOKsL2J49RtwwStWfXi2hXlW
	idwW72y1RKXh369+Eps=; b=ofeS1Rd3Q1DU1m+cYgr83/9VZmuty+jzKYGTCmm5
	MHwXoUZouZe8U3f1KN+BqaBTeMTvdhYOIWyfHRFKygYXWbLN7jR7XniVBid8hZ47
	2AZ0+z9s3Wk5hlTeyGvgS6xOaxRYuD1W4lLSS5r0nuXksr966uUUgS5JqK0ss33h
	5Ejflfbto3v7U28/jbnXJIwFEtRhkZEIVfNCXSMZZIrMyCGOd4cO2teDXM/NDjD6
	uUr1WawKgtsNGfUirXeHN1rLorLfZ+OGHo6yer3YAuzUkKTl/UAhuaTqPtOimRYM
	sTcVkZSpjsbTLQBPZUYEDCzctYjJytqLBK9UT891qGXUcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285jg8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 09:57:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51009190feeso13907471cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234251; x=1778839051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VOKsL2J49RtwwStWfXi2hXlWidwW72y1RKXh369+Eps=;
        b=a45L+mMnjq3U8BMd5BaTdka0WdnbpOwG37T4RzK6FqRoaMpjIud0oh8v6/GiYhCgzd
         I5hhnSCOy6wZXHY6GBnk/MvME7k1viwNrFa3Ssx1rrQw3CoGO4C7AQlrY1xRgsZ1OiPq
         20k8uILZsfnzQHsQmFZfsPmkfxcbhN/pD8VkWrFX1VwCVyPd3GL04umksDEsTRKk61ny
         /7dPVVp/8fS+Zia7vEbqvJs8Nv5HhHmxHfGAU3OhV9peWFpYe93mGUB6hC3mODSkX2Ko
         LzV7E8luGV3w2/j8ATwv3invork4SQFrbYuX0rqKoSm7LkT18m5Kp8rzFiziO22dFZVO
         sPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234251; x=1778839051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOKsL2J49RtwwStWfXi2hXlWidwW72y1RKXh369+Eps=;
        b=MFwcSx8j0ZHRqB4xA9H22WH00nLscJS3+VcREnYjFQg7WHdFSROKfTfa6vsztl6/nj
         f35xRHYo930ujccC39fhIudHymB1rLnx3sCL+wE/PybUoE8cvEoad1MtvHIXgXKPE+sC
         vuxeeGuGUMZZVg2ujJ9HRAStDXvkBCuILkVyVrnwXNBRZK/ztW9PNsRCdKOUdTFfA4ZL
         dGAIaw/legW8Au3re7jfOQ3IVXp6gOd9DSJHZelLARq5SeAcvuUYoeARxZJlWZbg3ySD
         wPzN0ctBXyzoUk6PMb97j3xk2NmyzT+0rbXM8sCHF/V7G/TFAAVWV9w6EDRt/Z+fK8ZP
         Mzfw==
X-Forwarded-Encrypted: i=1; AFNElJ8QkwPze7tjJga3lF8p+N1Mr5pYy/U9aTSELtAmYTVH4Da5S3cQieOfbdqUtxy0tggzMQfCj3X05WeWW4L9WrfX@vger.kernel.org
X-Gm-Message-State: AOJu0YyAGBKs6KElPpBm6B3XLXzZ3uVgukuPxd02ywgw2M69hoKU90/d
	7aF4RhlP/O/qilSmH1kpXPrJgAiEkRjH6O2mlKb1Vx+oIKwqve1L7AvMjElnNwH1HprDPY06Pwc
	LZhDocWD0EDgzL57LQAgly6F0ZfGVGrhY/NoDIKePUc9D4OuBxdsD3LMpFSb3X6pGI5UQYSJf
X-Gm-Gg: AeBDieveVU2CGJWF9zAQleqR8GNVvcvqk+Rd9jY3YLR+IL+wgqlt2Dcnt5e/a/RiPb8
	aaeh0QaXqlTTtWpDxCE6A2/7ld/wh+K+hkX96AhANbt8kbyPmCOjEsFAZilJlRBDzQUll5v6mDh
	UEwxJc23SqiYt8h4sWYRtUsBgw6ZW4uRXwF5sEudyUrwXOzGNA9LcHbyo5OmCG4K4ZHJfc4tiw7
	tT8qGkgzovumaOIPnuEbKRXY+Q7dR5VQS2a23hnbMywaXhCWis51Zp7ke0jM3ynuITe/0BpKRwD
	zRu8WFDiRztfS12JgSDldz/Ho3+GjBwUVN4Ud4J4FxSo/D2JQZzlvYOhBxrXUqvZpPBgsYm6ysH
	4BKRTG+YLdBtxZ0Ol3cCEvUH4Ns7TlWmwzv4XfkvAPhyWvXmZrjb0AejKTWikg/vq4FiqLe3+Tt
	lC7agAU/vvnYAxUuJS78ORrOEYQKHPyc0JeFIOSIQU7ZYEAA==
X-Received: by 2002:ac8:5953:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-51461fa0395mr155370731cf.31.1778234251072;
        Fri, 08 May 2026 02:57:31 -0700 (PDT)
X-Received: by 2002:ac8:5953:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-51461fa0395mr155370361cf.31.1778234250536;
        Fri, 08 May 2026 02:57:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm375257e87.62.2026.05.08.02.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:57:29 -0700 (PDT)
Date: Fri, 8 May 2026 12:57:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC
 support
Message-ID: <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfX4JFLwJgvKWA+
 xgcL0wbdt+7CUeyfGVg06LA2/kq69RsiFB5tiKcMtYADBoWyZICq8IDqlafPni5uRa5n1yRXCHK
 0yCTgQyiBzVUqiIbHOmnadPL2izSCnwZwxb1+irjKQS5hryGe6/H2SL7aK0E56Mg1Sw3g0Mzbqs
 NqlenYHUNJ0gcjWx0E2GekUirbAiUy6gHNbk+sIK0jUN2zSwc9XNYC7IWpavxvowcrZqy5bHJej
 1HKbfELHjnAh5ryTEF91uKEiwM73b6ElQ7rXOSs77Za74SVu1lBe+SSnoRMvHHM5IPyPzgKtMNK
 CTutd6tcHaiPaSop1Z5aJmD/y/UQeceANKTgpa2cLcpxUEV6etJBCzAPWpCpe8JrtQVFQkMCjx4
 xCWUZ1MlR9fzs6UD3hc8f4USxwEMhj4FBUcdBJiTbcXPljJiiYqZYk9d/IfKquQ053d58O436rB
 ZCtLhMoGao/kIOlVzQQ==
X-Proofpoint-GUID: T2smq9q1a754_fdztQLE-km7wT-DPfg2
X-Proofpoint-ORIG-GUID: T2smq9q1a754_fdztQLE-km7wT-DPfg2
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fdb38c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GA4JE4aC73f7OREyLVIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080102

On Fri, May 08, 2026 at 12:49:50PM +0530, Sneh Mankad wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Enable Shikra APCS IPC support by adding the compatible.
> It reuses apps_shared_apcs_data.

With the DT bindings in place this patch is not required and useless.

> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>  	{}
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

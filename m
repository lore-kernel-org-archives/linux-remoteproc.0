Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD34F68A4
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073887; cv=none; b=BeoeRzMdvqj3nq/VV86mAJMwetq55/tUYg285pKcI9JxGiBmACPz4h4VxT3HBkc2UIS0DxF7A9i6f2is9WQOic5cdM3rVrwZcB2uEVyY0IOQ4umlq3iNsN+4hipZiwE02R1wQv3OJGx0dSOoboStui0c8/NyC+2wF6FfSwLHwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073887; c=relaxed/simple;
	bh=umTzAitXHWmLYEotv+KuFJnI11K50uWLB9nmZJ251Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VtPr0xA/0/F2MKHebbKeeNjcUgihKV2un6IXLfLlSflWIR74mL13hXzLPOtOLGYP22xx9jztV1qdnlLL1bZe7bAvQzGx9JIhMen0V3VM6cjR+I1HKNHSydBnZJG0Vw+gO4jgbSAls6SIodlpcQd200g9i43AsmFGkl3uUnVxj+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhAlvLxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4tQf6gi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhAlvLxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4tQf6gi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MA32ia801425
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 10:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	044jsrB67uaRkWcSYVBrDKkesOnR5wd9zo0iuc05Kz8=; b=YhAlvLxsdJGCWPoo
	zK7eiPz8T6eJA5pWPuTzns/TNFFSsgrFv1b9KL3tMz7uGFk4yzPV5EdN0K1FRb3N
	18EIveuauidwF2/6cCEkNhUFMp7QT27O7kd2tCSiTKAsu79sWgvm21ZadkPNvTf3
	kK9CR9Glb5RBR0FHj9knlw19cNwtqaAZLP0IETZfKCXWiGRddq2bpVR3MHvNIHOs
	3hDUrLjuOvhreG/8qDqHXR1fe+cm1pVuV27dNT0uIgh1fZaiZ30Mk87XPO2FTZuw
	lWmfnFZ8VVr9qLsUFn3hsdXOIkBUav8VpPGyEm9dmUW0FeExovBoSWsZvyFyZZXU
	LTumkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4r58c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 10:44:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d0caso105907385a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073880; x=1790678680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=044jsrB67uaRkWcSYVBrDKkesOnR5wd9zo0iuc05Kz8=;
        b=A4tQf6giWKfIPNqaZClsuvMHWCXs+mkGdUQgoErojHM+2fV5I0zJgUYJ9E+qWokdAf
         fEfPNU5TC5/m2lduT3JEy/XThKsdVHl7Or2Rxg0wv079atJOP0wFAHkkbAatdpeRC/TR
         8madP9JjLl+p7IHcoJemvsd1TM0UJPBDxyrDNd8pXIczDPF+0w9gO3i3rd69q81YywaK
         JqReJQoeuGTHrot2yhGblf2f9qUwoBbazY9Uf5D87M8fhLx1AFA3Wcm9tn/VTElgqDVR
         9F/jAzdlnOGWvjr0cm7i12/1hdKAhXKlTk4iQcB46uCgN0nZArJKVCgctB2VJ2L09RVY
         ub8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073880; x=1790678680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=044jsrB67uaRkWcSYVBrDKkesOnR5wd9zo0iuc05Kz8=;
        b=N1jOSOsnVPi36Kp1dtyb23DJOjxPCzhg6SvAPX3JqBFtLvKV7bZ2t87p2rNQxUOi8a
         YxH1skZbcuzZ4uxZry4nBmHM8b0w29jzaIWleb+VK5eAi8noGs83vJy/pu2kAfYUgKcG
         8iMuTR9kNdjx9jjpIkcqujIqT5pZkl6hhAfUBfNzBTir4eCjEeAZluOT029z9ikVPr8k
         PE5gOYme/vxeVQWsftUKu1Z6DfibV4gsEDtwyTKD2w2xhIA8DgFwdur6NgiwTIoZRRRs
         +SPWmOZb1S74bDcO2j4EcUypu71Qv7j/X2ffLovPeiyeG8N5Y46t1yybr3qH8PycU2zK
         FNwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlzqK+hvQLOpreZEv/er2XCCOX8mHD95OGHFmBPDoCh1CifIloirNWHwH8wNahONpd0jkmR4ECLylOsvg8M4yv@vger.kernel.org
X-Gm-Message-State: AFuF++nwUTTTQp2pEDORHyZQut47yuu/9C2fmFyH9swSXxk2jSG7ofPG
	H2PqyNw2CgfVxRBxw1q50AGWaZw2KPY66zgmT93twDofZzY3pQgQ84KvkkonIuDrlojTuawnPxL
	RbQ2KpT81xe+SohCGvWcdLM+7v7GJydDuqrz/4aABfVacLMaGB9SJqTapfgPR8w/fbzzAqDhwvB
	TbB5jy
X-Gm-Gg: AYBFou0wnfPJn8VnyxGotJx9npO8apd2RM+8fFTAdrQy+jI4OJks/xuhig9b75A3797
	wwILOLEnKYkDov/uXd6h+KUa4Bxl/1ltl9Ed5be276jNyRfnptG+NpJLcSCeuYbsACKgeZOUHge
	Ivk1ygwDINb1Mg23Qs6ePFKAAzjMYbnxV1MLlO22SvGwafVfiYmFTwMeuqY8wOiGOS0WQ9hqN3v
	P63SsubuPbs59wT2YhcSvKfBymb4HNRHTZ1x6ATFQNVc3dAUZ619xbL0cVyH8nvtSyC2BGjHACf
	FxVv7hjiwtlxjBO+xHIaGZRzxXZJWp5zbXjm5ViU2Q++PDZzl6BPtV9TCZZrbHBXt2VaKgRLDJR
	8oM3tf6Wd5/uHxBtvK3pSRg==
X-Received: by 2002:a05:620a:d85:b0:93b:beb1:5790 with SMTP id af79cd13be357-93c15f855ccmr500229785a.5.1790073880181;
        Tue, 22 Sep 2026 03:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:d85:b0:93b:beb1:5790 with SMTP id af79cd13be357-93c15f855ccmr500226485a.5.1790073879816;
        Tue, 22 Sep 2026 03:44:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54fbc2sm63789366b.16.2026.09.22.03.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:44:39 -0700 (PDT)
Message-ID: <58ced827-d6ec-49e1-9a2d-a4d5c4111721@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] remoteproc: qcom: pas: Add SDM670 ADSP support
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
 <20260922015801.32373-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NSBTYWx0ZWRfXzFE0VjiZUQKn
 Jomh79SzppnfvkBXpDhFjLSD7ay2KfECYl+wYIysAEgihI7VXIVwyvW0ZCzClbLeWoFTw9vOFla
 GVXpIJPclimVuRDb1C/8RFX7JXR90zmEP85k/4v1UkXH6HA2CgxM20ibxcotMKrkUDf5LKBV6cs
 ROsZxVOwgWDn7Sv0FMNtQ3FSz4DpI3wi1nX5g/8NMoxbYjKbZZWvyhavhxqn7Wk/pZz0AG4oQbe
 Y1R7nRKkUW6MQ0S/8XLCG5M3StC1//zo3zkZmlJCeLD+J+V2ZDZZ7Hia3IZtXbgrvGtfbm3kapA
 uQdB43oueQw8tkkjI9arCZmguCSjqo2ZkQIR8j87Fs14oOH163qOrSDWYUb5j0cWvIC9f+1QRb5
 SqLXKFoZW0miFWGMOREY5HNWEZeFZ8ZCUJPc82c2vRbkafLg0vCTJs1OSWcJD6ZpWg8EbBRx5DS
 4IMHYigy1/apBsp6mwQ==
X-Proofpoint-GUID: 7M4YD2-QjGFiQy-Mn-2DswB4Dp6Td9JY
X-Proofpoint-ORIG-GUID: 7M4YD2-QjGFiQy-Mn-2DswB4Dp6Td9JY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NSBTYWx0ZWRfX1YscVyaaHV+h
 hAlI4xyRocz38/7lblmdw4ZhM/j46+186UM62b7EzFjEW/g54lkGKCbbnvJB+2i52vzeKlpD8zB
 4B2mz7+Vg2vRQv0AdsyAFKhrlin4nB8=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab25c19 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=do7GNnlObjUVy-8jmn8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220155

On 9/22/26 3:57 AM, Richard Acayan wrote:
> The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
> compatible for it, with the same data as SDM845 since the driver
> requires the load_state.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ca8e61254c44..5272a462fc49 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
>  	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
> +	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },

Would a fallback compatible be suitable here?

Konrad

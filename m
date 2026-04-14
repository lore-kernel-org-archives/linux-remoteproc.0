Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466532777F3
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 05:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776143308; cv=none; b=ri6dlZY7B+oUEtnA5nIYSFByueG4Zh5Ly/RiBixMLe03H2opJc3fC9Y7ra15NPVrVnEvebzkw/mARZq58iSrV9bWQYec/nhRrlDeppquR91m4tDaISXVba6f3/a3SVwIFXrgFBeblqoPyEUlhB40No6aw0jLfejTyWaSk9+Tu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776143308; c=relaxed/simple;
	bh=lI71pR7b1UtY+HJX/qJKan+BvKisGJTcDsTu9l2I034=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aU6TZY3NZWuw28unwtjQ6MCKXA6ZKFNCri8y2dpacfUvz1EZ8c982PysR31gfMwDmaxuiJ0FkxDfPAFQvK5hGv+ADtaE9X4w2DOaH/gxzSPrsxd5X4HZiuhGLUlb0Xl9jNTB5aYpKtUXsy5mjQoPa4Tbg1j8cZUND+0WIzchUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctu95rg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLxS7+U+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctu95rg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLxS7+U+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLEW4M1479190
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 05:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=; b=ctu95rg2oTUEsUgL
	Ydvj+yBEuZBteguOdTX1WmL9U/ZkXJaXdvKGocIODuY+XIDgkHkthkgllg1aOpQO
	OXv35QY/+GOGGAcd0lPaHHnsbHIlQ2XPrNtUwxK7fPJnPpq4Bbjp/mnAq5LgqNpm
	Yq8UZ8s/5yk6DWRr7wIgEtfD38FGfhhvbmnEEOIESI+rsDD1egOCzRj+Z3A5w3we
	ZdxyD6XbteYim90U95MQ1bnaxPt+6Bo9uuxFJqUZfzZ2Z5MckgJnNA41zgDyv6bV
	//63wVZTCm4osJyNWc5A4F53SBxkE4YrfIQkkOhB7MH6p1HJnnDHUIqkYHPzoNFw
	fYldZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j134a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 05:08:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82ce0a9e558so3792691b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2026 22:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776143305; x=1776748105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=;
        b=YLxS7+U+RuB6n7izTDyjiNj5q24so/F2HT3YmzY49d39bkr7WQZNEm0Rt46juHgHwu
         EXKlw5iu0UG9OQPiTbV2RQCL8zuiIqJu/fHWAzN+UPSa7DF/m4vMqyq2I/RkhvTV7Jng
         d36/feD9Ih+nn4ITe/CDDevTEtjmYvEvXFoUdKuhPdkcaRn4kN1om43oVx2IPuWyw7/1
         tq66KR+r03359TSgdGGTz6bIp92TjTJjKmjMUV0d6Pxm6hVNYETqd7qhwqCPKNJBkTJc
         xJQ953A56mKtnH5DUTJ4244IZusW8lYU8t0ABN4ubkJ2CKo3DehXWFJlSLiuK6jL5eXn
         NRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776143305; x=1776748105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=;
        b=L1PB4+Xq1y4fvmyKbu3B/jc46fS5sMAIS6KkFEcMi+Lf0Y9JsokBm+gtSm+BsbIds9
         QraFg8ZMoGS98LcoyoMA9aQQ9jEx2K3t5sLX27PSMrzfXz9BaCJGTjkPPQxY9ZCU3JR3
         Aw3Jgf1bRZMKFV0zC52OFjF8H2c8mwvNY3U3Wxd66ULEWqqsDkUm5qU57TBqjXcqRQ8S
         WidBoUfbNpXVtQ6tMLz7YtBM0JxSElx216Q2CNFhqj7q5ZYCjt7rydjrDLqnmYX47g9X
         WhukBD1/Qldc2lJNVyHTOgeP490QW3wW/bS004Ghg081PIuv5xFCLcZLeqV9aHPtsuie
         iV3A==
X-Forwarded-Encrypted: i=1; AFNElJ+pMiyryX4CCf7nfMNO/zjAKL9Vs2146nxK7AxL83zlXnVIlJpp3PCIfEfQvKJI6bjtBXScxi2vUc9iA6IMCrph@vger.kernel.org
X-Gm-Message-State: AOJu0YzKJxyt6fMsqr5BBYrUx5316jPZDMeRD8/hfXUZCR18Rz9f5Kot
	9vfC4QN6V49tCM0VBhg61ZgobYuYGJSTpGc+P8Ad75hFTs+7odBI3VUHSaqtzaV+joxsTVo3zbc
	fWjHPQqb0NKg863MiuFNrwHruTsUjGImawUXW53GVzQLiKvIhxuOg1QShpcIUH/HHGaymIJc9
X-Gm-Gg: AeBDieuZHB16d6LDaA9TZhH+b5np6f9NVOC9nkbz7OGLwzzPSLKm+oHLnvHtNOCbxzU
	1u2MSPiqnHfTCKua3vQCInj2XOCjeSSjibkAhPMbKimzA2+Om0cw9o5qKXl611uRGPgEFTVS9jU
	9grm5kakbqb/bQ9iQgt7IUBlErC8mK7T6sXjh4VlRAA2hr3YtmMNQvd6Ty8ZYHznMjK0KqSU5+P
	BBUCgHGngPJ2DJ/nxxmhCsLZq9YXwDRhgfdj39Pu8MXWxqnN3Uvi6HJpOnageg4D57+3cR7b8Jv
	T7c5kEiybYve1qRguI9DXjuEqD11Yt8ewRZ8yA+1N/MXM57q8iTalbiyk41/sOVjacAahIsBtnN
	NKinkPX6fPyAs1yHGWo/b/U0lfYYe4ZfRvPFXnyJgIbDAxGAbEbctPvjxhUlfDiQPMxaDW3/oxa
	lpiDDIxJwG0TBI0Sg=
X-Received: by 2002:a05:6a00:808c:b0:829:6f7d:3093 with SMTP id d2e1a72fcca58-82f0c27862bmr14821292b3a.48.1776143305307;
        Mon, 13 Apr 2026 22:08:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:808c:b0:829:6f7d:3093 with SMTP id d2e1a72fcca58-82f0c27862bmr14821264b3a.48.1776143304792;
        Mon, 13 Apr 2026 22:08:24 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c371825sm12754570b3a.25.2026.04.13.22.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 22:08:24 -0700 (PDT)
Message-ID: <4aa94982-bcae-4335-b70d-4b0b4cdd697b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:08:19 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <ca268d5a-f55b-4f6f-ad35-1f856446c261@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ca268d5a-f55b-4f6f-ad35-1f856446c261@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wxxSpzaTs_I_CuAlInvJqFyQz0NtTlzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NiBTYWx0ZWRfX+lrOGQAOIs41
 Cianm2hLDzHbTbZxcAHwrGoWjtOzkZoFZe8SLswJ1FVAbTpD7rh+RSSan9UybRbA6bngWa+g+5I
 C4DuPIvYfokIJjiOMQXtxWbMq8b7JRKZpmuFTH8NKRwZXPMfUU0QvrgySiHAQ+tgzE9VU6Enek9
 SPt4fPoMblxu8h4z1crIJDrVULAvotD3SeRDymkvor6dc3n+SJHUBw4d2KAtAv0qr+YtZ8dhwXa
 bJ9/iXXJM4rR4BNPlGcAeU7go2bwh0HWltW19rLX93yAiU5FZb/o2bvRWwBEU8fdqjzMBD3vxYV
 nGc3dEsR7Ls8NSzpnuv4dZNua/2LtwUw6aY3KcrOMPv5GgE09fCq3z7R5WPvWC7yPGrIWGr3haI
 q7fVkuAg0NcL/YD7VhTBipOwAKhf74TgNZG5Sa9IbEt2HOu8vL9VnrpejUSiDNTBa1CLU/XCmk3
 vUFSsR7Wz3H3YdJLIiQ==
X-Proofpoint-ORIG-GUID: wxxSpzaTs_I_CuAlInvJqFyQz0NtTlzy
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69ddcbca cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OYuZKRwE9jNIGw8p0IgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140046



On 4/11/2026 2:04 PM, Jie Gan wrote:
> 
> 
> On 4/9/2026 4:52 PM, Jingyi Wang wrote:
<...>
>>   static const struct rproc_ops qcom_pas_ops = {
>>       .unprepare = qcom_pas_unprepare,
>>       .start = qcom_pas_start,
>> @@ -518,6 +582,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>       .parse_fw = qcom_pas_parse_firmware,
>>       .load = qcom_pas_load,
>>       .panic = qcom_pas_panic,
>> +    .attach = qcom_pas_attach,
> 
> Possible issue in the future here. The kaanapali_soccp_resource does not set minidump_id, so this is not triggered today, but it is a latent bug for any future device that sets both early_boot and minidump_id.
> 
> qcom_pas_attach is added to qcom_pas_ops but not to qcom_pas_minidump_ops. When a device with minidump_id set uses the minidump ops table, the .attach pointer is NULL. rproc_attach_device() checks if (rproc->ops->attach) before calling it, so the attach callback is silently skipped. For a device with early_boot = true and minidump_id != 0, the state is set to RPROC_DETACHED in probe, but the attach logic (crash check, ready check, ping) is never executed, leaving the subsystem in an inconsistent state.
> 
> Thanks,
> Jie
> 

ACK, we can add qcom_pas_attach to minidumps_ops in next version.

Thanks,
Jingyi

>>   };
>>   static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -855,6 +920,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>       pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>       pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +    if (desc->early_boot) {
>> +        ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>> +        if (ret)
>> +            dev_warn(&pdev->dev, "Falling back to firmware load\n");
>> +        else
>> +            pas->rproc->state = RPROC_DETACHED;
>> +    }
>> +
>>       ret = rproc_add(rproc);
>>       if (ret)
>>           goto remove_ssr_sysmon;
>>
> 


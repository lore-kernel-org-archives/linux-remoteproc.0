Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8DC30D418
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231100; cv=none; b=EG7sg8IjnVUyRxoyJE+qEeeDVC4oA49o55+wRZwIfe2Os1TTmOi/xd33KrRThPylNO0B0ilihbT6VLwHHjRf+k6Bb8FlwFlbZFMQD9+169thMaryNTQOCA27DVcCIPA1kH78GbYMuSmD7Ex+HuUUu/7faMs0IYBxqi+CeQiRYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231100; c=relaxed/simple;
	bh=F15rI8raRRwQYsuXkvJxdAImYFQOYUO1jCX9P+4euHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lf16kYS0ob6Kq7H9KaPMm73yqmwa47KWz40bMEZVDywZxUVK0nrQpsUG08HdI5oOKlCJcvyKt9IxXT5hyfOKmqZF4QWF1f/JAJLj8LDqwuBszSYqlsXPu5hajImwM1W/j1zWcjU0NAwjzcV1hU6yqo8uRzVXW+NqvG3Kuwlks34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ucp9UF/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMWlnkT8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ucp9UF/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMWlnkT8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZOZh4017430
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 16:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWalCLVslZDoTLDQCTyjSJkS10gzwkPB8ybj9bURY90=; b=Ucp9UF/ETlvAr9Mu
	2PMuhoM68GUVa51d/R2sXZipIn2l0dDOkjXSCL0gJeJj60pS/ew4fCsvHIskVJco
	IkLPK5IWmGI4hpA4HjmPT7woR+7BpQhjB8+Fp6K5nnIv3vcWdBsiA/i1QyiPlvZV
	7OrXw8LctvIWw7c2lUeOM/lnkyJlB0krYLRayWUkpVsg0EhfbJ6hqooo2iZd/j4Y
	bOg2MZGAvpmJaOs4mMTzm0Z5FJkKxILFtm8VSaMDnRh7rFDtTF6PxehUPDhtcYFm
	H0hZP3n5437HwrWpgfCaBqGrzObKV032H37vawL7oAV6sqX/dXd2WiIbXwJYApQp
	WdRSqA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjk8ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 16:11:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dc94673065so221506d6.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231097; x=1782835897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWalCLVslZDoTLDQCTyjSJkS10gzwkPB8ybj9bURY90=;
        b=BMWlnkT8n0jtHq5E+O5QpW7lOhWXD+umzXCDu72MfKYb4YxAxgqc4HqFs6DmwlTlWG
         /RaHAe75v2WuxqVc3LTgTKVcJXizxdF8//XDeUhFrjBI+s/DL3fH/8OW1cc1u3Eb28d2
         rgfB8tJnc2L9O3OApHeXg9Y0i/1kBoZeiG9O6Dd1E3Qj8hBofUTBrPelKvzGWlI2AGPX
         eg8W6+iQBG+T91026IocYSIOydLPXWAzFHwBIFEdCzSAasIPvqj/9s1BA7LpV3+VcWPQ
         ynYSc6dIUYqiBsAMdOkfe6oROAeu8sFAh0Xm9KVfWQj2ZoUx9olGuh+TikzpR7muogTh
         D3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231097; x=1782835897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWalCLVslZDoTLDQCTyjSJkS10gzwkPB8ybj9bURY90=;
        b=fXcwA1JO2SYw//lw4jg1HS2nobEXHZszr5/8o74iOKqdkl/N1O+Q1KdJ/MTjluD1WD
         dUi8Sg9ijSmjASp+d1Y+vAW/qf65EDU1rSFI2IVIJvNRn6+8iP0RLueufle6SaceWAqV
         T0vOJTiu+eBn4jiAQeHxKQERM8aCxL9DaGJDae4p3DS26kru16YL1sPIUgDwad2tkfmd
         8q8nBA2GAs7r2QQNYoFa53VWBwhO/fw1vEFFgeWSEpJCvm6JYH4g7yJ7SoKqn6uUQbD4
         qmhglbtQR19CnStFYdC0EKdT91N87PbjkPgwY6vYrH0/B1rg4hU/+dNIRKFfKtdS3c4a
         SS/w==
X-Forwarded-Encrypted: i=1; AFNElJ+jRu0c5cvY5BTR23QrGN3HzVEErTDC7HLy4UAVsUrQrNkw/z0+6b/rjN2LKZRWIji+aUmDFUhQQOEs9GHc3Lg7@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3Q58UTC/wTbT9Wi2SX/72nGOFkkpfV+35gMGwsyM8eGByxyT
	1DKe22iJuCY/6mzP938Yrj02ZmJSNXzxl7N7mLCq3Pw4Ncjfjh7rTAD9WgG5ptkb89fXUUDzHJk
	kyClBeCWHOkA2UjL4tnCAO8r6HZinIuEgnNABQkYb9OS4kIiE80YQKNlR7IZfNrWLu+suKxMUiC
	UM8mZf
X-Gm-Gg: AfdE7cnrye8+e66swXLaqYQWr31xc812VvKuVup5xTMoXwS8Q0rJOYYEQj1/BQjIXLS
	xqUuyFS/kZTBq7OVzmDu3aiqjSbtcsQKhYDKFeKUSpIP+i5YpNkFm0/hUW7qEpFIw4ct8jY4LeG
	3PeUOGYx7ybbPojx8NQtjDLdIJZSOAmacnFbrC7Q6KchKP0xxuoqeqUpRelHjeuCSZJus8M7xd9
	f0BALNBuaFtC3w9ehNGRfPpMCEoNwfsspxrtkkH3SLstlBcKe5nkv2eBBwFXdXHIxf5Jsoi9vJa
	sxgEnmy7oh/d0k7jLuWkCbsRl+OkRTmGafzngVGmqf0BN8u5vWsouhfLVeWSrj7s4jmyHvum9+p
	QqQvaHjbXLfJtvOkOb2ES/OgcGHcpZGE53MY=
X-Received: by 2002:a05:622a:489:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51a4f502a89mr56982501cf.7.1782231096757;
        Tue, 23 Jun 2026 09:11:36 -0700 (PDT)
X-Received: by 2002:a05:622a:489:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51a4f502a89mr56982051cf.7.1782231096205;
        Tue, 23 Jun 2026 09:11:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697e9292788sm494756a12.1.2026.06.23.09.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:11:35 -0700 (PDT)
Message-ID: <cad79064-5462-421a-b477-42c3d9729db4@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:11:32 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Release QMP handle on ICC path
 failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Haoxiang Li <haoxiang_li2024@163.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, djakov@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623132015.2243317-1-haoxiang_li2024@163.com>
 <20260623160132.5rknnudcs7g7haoi@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623160132.5rknnudcs7g7haoi@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX/cO3DKqWkdz+
 QGf2bPpxgy3wuuihhqoUBtAIjJHq18IBL/zZZcIU6lzj4y2v3xGXuaN8TZgIgdjjfURVQHeoCl9
 NKi600NUY3yTgk+1VWFhTQJYkS9I2enOdNEiMN1JD9Ni2wWVXUrC2Ug8Xoz03vCUWB6FuW8o9if
 yR0winj8aQW9ZjBiK8DXQt3WbVLhGxGr9GhoPNEsDjzcwE4CHe7Jinjx2y+shD5KAP4zTLbPFJA
 edIkHvf9Gr/Tkvs+t/34GRgdpkSvv8rFwJsH/GjUVJefhPkheA3KRL4HMqPplDjM6YEaNwDx0hR
 lZZfLWlrAOUHY3ZB4pmgvUb42g+eNM9waYobwYdeYcOyQOnaLpfYSfyD2YKzNWTwPL6d8j9FRYM
 MJBgZqEwPB8zLVpvlzGMMADbdD/VkA9hkvnP8RF29yEqBpPYMP2I+hkZ0HeV7fuJF1T5tApMsmE
 xfEDGyKYIvh3yKcCE+A==
X-Proofpoint-GUID: d7bcR3QWojn_KzsANrqdqFpwuM72a6ck
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3ab039 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Byx-y9mGAAAA:8 a=yyGnx8vvHWscMj4to3wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX8oQPFTUReJxy
 aumqNHkVSaAsv9KlDWKtXLeBp3dc9LnxhrQEXPjFJuK2aVyl2do3ZUapw5hW4HqFA/jYhKUjVvb
 odsGahR6h61UndJMg3YbrGvprCVcI6g=
X-Proofpoint-ORIG-GUID: d7bcR3QWojn_KzsANrqdqFpwuM72a6ck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230132

On 6/23/26 6:01 PM, Mukesh Ojha wrote:
> On Tue, Jun 23, 2026 at 09:20:15PM +0800, Haoxiang Li wrote:
>> qcom_q6v5_init() acquires the QMP handle before getting the
>> interconnect path. If devm_of_icc_get() fails, the function
>> returns without releasing the QMP handle, leaking the device
>> reference acquired by qmp_get().
>>
>> Release the QMP handle on the interconnect error path before returning.
>>
>> Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
>> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..b57041a37d28 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -347,9 +347,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  	}
>>  
>>  	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
>> -	if (IS_ERR(q6v5->path))
>> +	if (IS_ERR(q6v5->path)) {
>> +		qmp_put(q6v5->qmp);
>>  		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
>>  				     "failed to acquire interconnect path\n");
>> +	}
> 
> I would have preferred to move devm_of_icc_get before qmp_get()

Yeah this saves on cleanup

Konrad

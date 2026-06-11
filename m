Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356342EEE67
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 04:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153142; cv=none; b=lljER4MY4QsTmPfN5Fh6jCCWfBcaC8grolXmhbOFPrUCZS2p+Ow7/n3RydaSbMryjySBVDqR164UpdeZCZWXEXPJd+Er/31kKm4lYq+i/tz6pyXDsasWC6TkeUSMMMvu5ofB9fzQ1F9HWmaVxDWfeDZSHT2P04elaxE6OUrZL1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153142; c=relaxed/simple;
	bh=wDZgTVz/oZs6fHMeDkBQJjN738mapPf0RtpZObfLSGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqgNRwvt6vVY9gbfSJoG5Zb3w70GxW7bHW1Vxi064hdCYeQqA9RFLlUl7afHI9zuYuXFmOmbd5YiMKux7aBGtA8R0OW+MfT7PU9b8D4SwRnZruky/Ysysszx7JC+divDx6dl4NoHqBsQRHGQ8AgmYOgyFs0Cwh7EHLRi71Qd+qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUCmfE5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8QPs6Ma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUCmfE5X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8QPs6Ma"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NYPh3183749
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 04:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ks7xcs4CcsvhpxQlRnY7mYEmf/7lZqBcXTDU2LX0qM=; b=eUCmfE5XNyddAO+D
	0dw0SQBchcu20RPqbpJtWlc+F9af0uhK8DgWGreLf/IcuIAHWstGYcvZE1wBjWrP
	pOk3mE3TS7UAxtT2EbgtxlrfPWeHICyUpm/5ME2ncJCLlfHIEkDFMKo87wiJVxO9
	xTRl7wT+haxpU2/pecsGphJf0QdP8yTcuqM4gLs+mnNA/qOkCCwHBtEa4p3C2t/a
	269c2KgniB28cCu/RNw0PeGLnEqdXZ44WFMg8+cnx3oaU84JBeBc7z2zZvjNgkcL
	iJo0IJ4q4XAnWtTK5FJhCjIk5z/Zc8YSJ+yDMcDVAAVw5i6mMneD3B0oA02EzWKe
	yJjCVw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1mdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 04:45:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84233efcaadso5075344b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153139; x=1781757939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ks7xcs4CcsvhpxQlRnY7mYEmf/7lZqBcXTDU2LX0qM=;
        b=G8QPs6MaIde05IkbfG0Ekp9B3NYDtG+Wikvx63NT4Z3ZspkYV3dy4uEl8bzfL11in6
         MLrStFDGJVnFYS7e3PchvWDQELTzfFWBcKPMEcT0uJmIW6/2cA5gVXWBiuarZPMHIOv6
         DH4FbNHrI0Kzt4mlea1EjE5uzodvXYHLFnyWTepjmVGo6dxe0zzm9bNhzJNxc7snDicz
         O+jUMC/PFR7No/YfTxFjLT7KTnCxl9XXLTtob0AmixFFU4+P4OKHozQ9/KP0mA40d3ae
         ZXKat/xJchAJ7PuNas9iqqq1gewWuWipGGxLiKW/NBP7NyV3B+R61qq8gTSPNyLU86zl
         ATng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153139; x=1781757939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ks7xcs4CcsvhpxQlRnY7mYEmf/7lZqBcXTDU2LX0qM=;
        b=AHMc4EA6KasMcN5Kz9bmCronCmUN4bmRz8aCgmCGR/KrcdtuE4bHvT7eK8G+183r+r
         tLj193Ne5IEJjzF5V4Ou7v41CHCdM8helKY0c/0BYjZeNyPOt3LfN52gHoqaSARE/H0l
         KSg4CQ5YzSZQMk+QP12i7Rg3ayZVkDI3lwlYCs1C4ZTN25WZ0634g/im9tKQkif4aXxU
         +Af4IktNdWZZ8khQ7lZLOyZfvV7krbYEk28FQgs6fJ0XCW0rg0x1Cyd8BXuKo2H+8xBP
         5l2jTugz8v2FouUwEuk1ZgLYOUlerqHsrm47LewqDa7th0K/ziSK5Up/lcmwVO3+qZln
         Un8w==
X-Forwarded-Encrypted: i=1; AFNElJ+wn93Px5Tnrpqo32vVvIpW5XvW1meVBieZVsMe5zOJXkjzXs8nKPsn6nk7wg4TPBDgW+5hnuvP0ZoL+vGRyVhf@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhmfpySwpoSR7wne8OSbN2ON9b+tIpULhplYlWLKCD0m/ffHk
	TKkPkqQrY9ssUF4c5ZHEGxcIUStpWQAu/CIx3vGhLQdbpxq9gg4mXNmNZ9dYNBQ3srN7Mx6fY7o
	3oYbB9tofeBlc6rPKq8Ci561oehMY+XWCqM0pQe8bvY68lbaUaEfHtj5rywaH4rUT5aHjIE0Z
X-Gm-Gg: Acq92OHM9F5f2cXtGpxZQZrmf+7eoea6g/DfGD5x15juZ5Xm84oDQDhjqybIVzqiB0y
	kFs67c4/2fymJA4kHo+gzxI/Bvg6nU2ESlwfp+IlpP7MB7MC8uvSv77RkH7H6WTox2I9oyehpK+
	sKUXw3EAorD5BXHKT/Yp0q4+3bgOPwrzeZmVCEqLk098X2snm80xCXAiqKYFLDSGgVK517X2ZhT
	AlwfBGvO63paUvJkEtBle2dC2UZND/KEkBh1AaNsgV/W0N/V2h0DZ1f9oi2jZs3REDjBfFzwGPH
	JqpCfkfK2RteFFJe8Ja/xtOYhBOkbNCxTNzqnxYDuP1HAupT7BULYwtCzhYce2Z6OvyWPrdQx86
	INz9jPFrbfoetKncCj+J377JQ27Xxel1RyfSR2Yd5VeB062il/LxluAJ5zMj+fXU=
X-Received: by 2002:a05:6a00:bd89:b0:842:5ea5:5fdd with SMTP id d2e1a72fcca58-84336bc6f14mr1290367b3a.40.1781153138775;
        Wed, 10 Jun 2026 21:45:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd89:b0:842:5ea5:5fdd with SMTP id d2e1a72fcca58-84336bc6f14mr1290333b3a.40.1781153138304;
        Wed, 10 Jun 2026 21:45:38 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843383197e5sm467576b3a.52.2026.06.10.21.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 21:45:37 -0700 (PDT)
Message-ID: <cb244225-5375-4925-8d20-232cae9da672@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:15:30 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
 <e9573827-81b5-4c75-9d1a-d59a4809300c@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e9573827-81b5-4c75-9d1a-d59a4809300c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pZzm0u5u4XapggISou9bwExVxivRV7Cy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0MyBTYWx0ZWRfX4E8HCm6zR7N2
 bcMuroL5b0zA3myth2qxWX/DTGWGS8Uo78itNZmnC0TtQvPlKUA+/qNG+udDchc5zuqMRsuzmCR
 xdMcSa5/rULTVRKDWC7bL0+Tl8DxKHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0MyBTYWx0ZWRfXx6fyaSZ9hFcn
 zmyNqyce0jyIEW/khFkUuQS0+0KPx03tN2KNFYWIoS5culDal3MwbFKEyNl/1g3UHm9AfkTiNdy
 R7xtZ0oS/9PcQ+iYnbKQpsch6M2uMfk8zK44mJWsU2LkcIDD1YSNQ7qY6tFpMqKaCpckgKPfFXh
 GMzdrqkNkZrUpVfZuVHfZVB7HWuq0bjWkujROX25a3dw4kHIz8eOJHDjFnEOn2ymdrXv/fWUJQJ
 BsVSJo3Yk8Xbe4yN0CFyEPFBQvgdLMnXN/aSYSretDzT2kIcTIEXgj4Vx7PewejCJ1ZXjmJqT4C
 w/NRAACF75/CAkQpePXTokYhuxjSH9miKSPoWxvZNjb55ln8evIkmGE+Iht+99p1gVJu0cgBupw
 B278rVu1bA6BXH6JL0Snj0yvyuv54Vy4ohT49QeYph2LHAl/rBtASss1mVBsfLoaR+uWmaXWzDv
 OELQiqLgUDPsqmRuQLQ==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a3d73 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cgKxsijKBzv_CCWCEVYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: pZzm0u5u4XapggISou9bwExVxivRV7Cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110043



On 6/9/2026 5:33 PM, Konrad Dybcio wrote:
> On 6/9/26 12:22 PM, Gaurav Kohli wrote:
>> Add support for Thermal Mitigation Devices (TMDs) to enable
>> thermal throttling of remote processors through QMI.
>>
>> This enables the thermal framework to request mitigation when remote
>> subsystems (modem, CDSP) contribute to thermal issues.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> There's no other signs of Daniel in this patch, please fix the
> tags chain
> 
> [...]
> 

Thanks Konrad for review, will fix this.

>> +static int qcom_pas_setup_tmd(struct qcom_pas *pas)
>> +{
>> +	struct device *dev = pas->dev;
>> +	struct device_node *np = dev->of_node;
>> +	const char **tmd_names;
>> +	int num_tmds, ret, i;
>> +
>> +	if (!of_find_property(np, "tmd-names", NULL))
> 
> Let's use device_property_present() instead
> 

Ack.

>> +		return 0;
>> +
>> +	/* Get the TMD names array */
>> +	num_tmds = of_property_count_strings(np, "tmd-names");
> 
> Is this something we can stuff into platform_data for a given rproc on a
> given SoC (for which we already store *some* data in the PAS driver)?
> 

Without tmd-names in DT, it is unclear which index corresponds to which 
binding. With #cooling-cells, tmd-names in DT provides an explicit 
name-to-index mapping. Please suggest.
> Konrad


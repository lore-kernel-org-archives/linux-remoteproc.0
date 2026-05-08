Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA6F36F437
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231190; cv=none; b=uQDvZNi8EHMer5HB150f1FhRAx/+Rz12vDdgDOZ9gwaLm0y5kbqub3CdfhjToT9sMDT+pOBDvjYE0FzuNVsfr+k4iJbLqsOVNjQ9+GMhSuF18+A4oTHLkqlwrBbQur6qOPPUKWYbHdDO7K/mFqSgV+JceC4W8+l4WcNgasOEjcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231190; c=relaxed/simple;
	bh=gf7iZAxz3wmx3YV+UD5NpwhKTbizFgcP3gza2UsZXK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdU1uOZetbLXyy1mEF6VGF4Ubyu6Uzyh+qFNovQpAKudF6l+rbEu+GKTkvzAYC1qigYScvuCISKMxNtKuRXvPJQJIY3lDwFodzfWnsI+oopk/ZvShEXtuPZZ8Nut3Tj9oissTAdjgR2m41sxHHuphS0WFNSTqRwjSk2Zn9CVjxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCP8vG4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjsHV7sZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCP8vG4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjsHV7sZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486Gf5Z1174043
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 09:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azWDg4lbg6rRjZG0aZmL7inSID1cbw2W/ORXB2Sga+c=; b=GCP8vG4TahN4SgLV
	qfzee9B7I+k1Psi48LYQAY0tpJxoklO7tOT+UM5GTGQzV65alees9oehmW/3QAIm
	JibmjYUeiEFEcXmVFwawjJU9HWM9duNReJzUC+6IzAUCogMHcm1D/85uswCVTUHP
	LimAoXf1xJLHE/A1s7kGYFtW1He6aFNiO3a4b1JQneREXTkaPnakUCn42E/ZFz1l
	Nc+XCmLLpTOgkKo1/RrJYbz3UUXhz35+gJLypZ0Zord+BCPsDlMxmboYkYiVOcEI
	iVZQKa6A+hdDEtxmHKjkWhi3IwWyLJfjW0uRYHTr7KXq1Y5FIjM4j6X1Xib6vgkS
	QnfLSg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132ha4jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 09:06:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so2158141b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778231187; x=1778835987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azWDg4lbg6rRjZG0aZmL7inSID1cbw2W/ORXB2Sga+c=;
        b=QjsHV7sZUWoZ4uwz+3nSvbIsxJndT5S+MnEhslSGriT3GZ1aUaX9t4B6DunZl1vD/8
         +DI9C5EGumjsL/jaKQKgU3hqLHQs99LIhfRnb5igghNklZQ4VXP/8TWlNwp3ScEkTVuA
         r7r2nktq1qSQt2rupYX2EGQBb579JjefvcHYlii6/3iLxaJr2/FsJRhSBUzLvfDovIBe
         Elxr4dpHwm6kPuVhD3t3eujCWuTq53r6Zx9ovXU1coIdk/bAx0XD0eaxQLwEEGN09j2n
         bHKyTQmz3MhtY92LYXVZLeBKGXdAnpg6ImxKyNnBZU9zs5txuytdyt2Feh5R3DCe0jXu
         hY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778231187; x=1778835987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azWDg4lbg6rRjZG0aZmL7inSID1cbw2W/ORXB2Sga+c=;
        b=Ojjd+uQBHyzY/F0QlHF6B9f5CMRAPYx65X06cFfWrA02u7TTOg49hyjIcWCnd3NrU6
         SUb2/Po7IBTI9YsDeG/mt5XI4mx/LOXKwjGYPnMy2xnAJFG+eLuKkcYX3sQbbeD5iDs9
         WT2hPaJqOCL7q50y79THxs//GqAqavTxhiToQMtA4o9uR0RSind6AnsxnZvJjfKxUj5/
         1t8GVOzGK0UXDZezLMiMFkZNw/vqAy6156spmeg3rTd0uNY9bxnnadrA+W2ydi+2xTh5
         G8X8/FAqcKv0pCNBUBIsBDChMUbRs7AKgpbd3Z2Uohv0UU24YyrFBzVTpARc0Xr032Gf
         WsOA==
X-Forwarded-Encrypted: i=1; AFNElJ+6lBSdx1TMXeASy+2jBdGxDDXDHocRhz0IkLFtc/sGj/QrRId6paxksVmP3cMn2yST+rJotBxuYyV/3y1p4H5k@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk35OVwFPp1YQJAHcYQ8PHIT2WqfuEg7zVYsAKlULHXmvoeq1b
	xcHfShlnoVHLYCRIOm/kwPrJhqeGeu3YVPLMcXmKK9wytOFDN8QYN5Xy12GVjvvaH0HM6pwOU25
	DhiT8cFxtqSuC0t1rXACeeIszDaBd4W2txMPzlb0WwpaG2KYopXVaSCxseV1mNRnaNwvJYtS4
X-Gm-Gg: AeBDiesZ4vM6x1oBhdcH7DVX8rPz5JNDj7l2gfgHFk3TQ6nYhgW01SyVNtrztkUcr8v
	r+BsLbU02omVoceZB4cdpNaGV0ftuHLBnjiK6Hkvcly4L3RsDADo5ay/bswbuZYxQjSNsX9OusR
	JmBhXXa1nnEWe7B6OJFDD3ZBeI2L6wM4RjFAZTn0/Z/Eu10ZnNKvd8skjwvIUC/toi7pbvSgCWn
	aFMzZ9uM/H9cw50eUVFavxfCCqOkE1qSAHuf7F7y07O1RyZXKuqN5EPxqsixgn2N2fl0tKJwn4j
	ywmlOiJUJ3p2YItuB6Mg7r4AVMTgeCSwiSVHIWHHHb8kGxieKeD5Hvc6/RAtLfXTkdHz9fo2FnG
	XqjjQ6e+hDUjTAFj+lIegar+1r4tJKBf5plMB1rTk5ecsQ8Lt1A==
X-Received: by 2002:a05:6a00:27a4:b0:835:4776:7d7b with SMTP id d2e1a72fcca58-83a5e5528eamr10610503b3a.42.1778231187317;
        Fri, 08 May 2026 02:06:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a4:b0:835:4776:7d7b with SMTP id d2e1a72fcca58-83a5e5528eamr10610459b3a.42.1778231186768;
        Fri, 08 May 2026 02:06:26 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm14582809b3a.21.2026.05.08.02.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:06:26 -0700 (PDT)
Message-ID: <1962bdd6-f12a-4fb1-adf8-af5de5d7bad8@oss.qualcomm.com>
Date: Fri, 8 May 2026 14:36:16 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
 <ybuup437mpu346fqhnmyuqkj6satxte47sxg25mipy6mn2yvdr@xcjlcbwf5gum>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <ybuup437mpu346fqhnmyuqkj6satxte47sxg25mipy6mn2yvdr@xcjlcbwf5gum>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5MyBTYWx0ZWRfXyNMeVP6Ck4Hz
 PgjoGEBjCbQS/kp+WdktQFtCSbYCs/N7vpaX1TwxmvcvOyeoVjvopk00ZFAQsKopSbO4/4ydTe6
 SwkAv+YRABJVHPPxLTAMMEgec9/kJh46rbO9I5vHHmyi1OhVidPajzo9xoysviihuN3EVtTAU8V
 R+ZyF+ecFBH5PuEsOGRsARiVIO20eDCG2zU/j6N9L3rYxv92qvrEV+2XLq6MFNjvWR4wgJsNnO3
 YujVILFs05XMxwZ1GqPj1xLxskAm3dY0Kzy9fYJvQ8w8YCHIELc0rytFRc26ipdyNrtVkwr55Kc
 YpA57TU/bd7VWKZjkJnHVDFLlRpB6Pr8ZfON0MzTZqcW69tZbCa9UwyDMzyp9UFUHkAhzihMS4m
 97JAONH4MDtN3iuy0Obw2T0pGBfqowNNlAiBj9DzAGfdHwx3WttW18wsp/wx9jROM7Tsx+nHkVC
 hQS8u52oYItKfWbWVfA==
X-Proofpoint-ORIG-GUID: 7_Z-H5-IXSjk3Ipg0Tg2ByM9aaHp1jKx
X-Proofpoint-GUID: 7_Z-H5-IXSjk3Ipg0Tg2ByM9aaHp1jKx
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fda794 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mg0E_8RrCHGhU8BAAboA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080093


On 07-May-26 7:09 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 30, 2026 at 03:14:59PM +0530, Sneh Mankad wrote:
>> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
>> Enable Shikra APCS IPC support by adding the compatible.
>> It reuses apps_shared_apcs_data.
> This is obvious from the patch itself. Tell us something, which is not
> written in the patch. For example, why it uses the same data structure.
> Or why we need separate compat string and entry in the driver.
Understood Dmitry, will expand on the reasoning and share new version.

Thanks

Sneh

>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>>   	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>>   	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>>   	{}
>>   };
>>
>> -- 
>> 2.34.1
>>

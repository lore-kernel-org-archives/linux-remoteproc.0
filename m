Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B0819DFA5
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063663; cv=none; b=r4YVMTQasaiq0kjoGrn3sW1ELqjz5dt484YfedUjPMSckUx363GR9LEYgbxS/M9sjtgdgyisAV6UTRy+UmPwbqBmF3be92GPKp2cfnOBIQd7NAmjq0Ipz/iHMD1eYib+cX4/Y+/ixZ9HWWslePkHUXs2M5lvLHXIs1R2d8Ak37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063663; c=relaxed/simple;
	bh=/pm8ioqQTAsLKFJ0NAnuIl+VlV5w4q5k/XCEV8mzdPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+A2BErQdqGa7Cyz22+vcBo3ApH+6V4eEYX1tJ134q74kDOLPtJBozGO06gokLKyO9KgfW53aTNpv5DDN3pd+8eEHG/rKQBwqxQswb1yP9qZHwxEefFK9V/+fnFQcwju4lj65jeVfRK9+WnwiykE4L4OmS3jFSzTcDvUrfpSbow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUufsLfK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUufsLfK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S63ZHg011392
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R90vpW1QnIfTNntQHdxQT53KbjZtsNo83kpO3djLgxY=; b=GUufsLfK/RWAtKDg
	k2ttQBiY+DfPMuBD0uwlq3NIbbyJxeSHbY2F9huofhBQt7GhlIaYpV3Ahb0R9ia5
	9FF5T5ytDbVqPrG75xm3YNIre8O9S3GoLigUJsKQz1NqAbweP2AJdjq0/zcbX2oB
	Lzt6kma/y8+7n9lzxe7HKKNJKJsu6n6OoODUKnEYrk2kDdySKMv5RjdQuwC/HtHD
	z6jLwctxddlzPHfXB9TKW7hPYjT56FDhm4vqUnanrBdTsBuYpm3VyjUM+7pxny8j
	XwDFRLJRz8rPrjRz9b1K7dYNyjKFD/Y/Qo/WBHaerBxYJfUDM5NrHS5eFrLm9pEL
	1iVW/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44esmw8qqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:27:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f134dac1so140939485a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 03:27:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063659; x=1738668459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R90vpW1QnIfTNntQHdxQT53KbjZtsNo83kpO3djLgxY=;
        b=SdwzbLGLDPMFgA1prOg7xj7/I7YzevnEKH/HXuNvCihZu7kqlZwv0nxPU4E1usRkDN
         kWGrO7YlImCPOX3GpN2KU3gJwEiV1DG2oO60jDtetv5mqEMnK74TB4BWzJQlmZPERUj8
         r/4uH+7G28idKNi2vLo3dF1tnbQV68jnqRme9Nm0ATICesAlEjycdCarGW4631RFyDDp
         B3DI4DOC1stp7klrQ398yOnblvDJ1ciYdYUsi6YTNI5ejGrRPRcSX3rl4d4vnSsjPhL1
         /tCVnD0jw55EqzflHKlbyv1zRKhjw5YTsEykrdfR7qPicPswV6ubhhfFyT9WfhYUNC3K
         a/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXhyAHm+yYu8C4M0qTUG6u4WEa7WrEVLmbvLBADYBrYia2YBqL4QRUFuBySLoXJF8pUucOxzE98pIF+0FsycEOD@vger.kernel.org
X-Gm-Message-State: AOJu0YwGX6fcZ+Q2eOdUlRQ6yT2RAx7DPH9WxaZhEuBpM9RfFI09WRlI
	O7KY/EBFy29KbTxOw3YE5Ro44dxcGq0JxDCiAsSB+7Sf4fWl+A64jUt3IFNYR5QamJQa7zlieYZ
	7pnG1H/ZF9rPVj7jRQQEfyliz+4OJFPgrNwT6/GsdwiIJMujh0buh6fBjezzi69JlzsT2
X-Gm-Gg: ASbGncv1jR51F1JCWNnp1ePZnHhZJrtPkBrfe00bBFWLSomOSwJJP6GCYPmeL/cfKUa
	eEluBWfpa/jVRroAb+IaJdTTZJ61UsHXWuKadwRHTXn3xE8lemdKM91niWEP9p7YhZPTeltdXyu
	5Bu+TgUtVq2xVkUt0OK0yRzP0hsmG7EyuMd7+BCT0bKJ0r35zsOtOcKKVuXhzxKm+BNG+3cWt7c
	z/nWG2c0bUvHZkI1/6wKOnl15rt8T5RrV8HmIQ15gM205na3UNqaC51WmfyvKLc9o6g1hEX8igA
	ThfWy1R8W98DE/IaEKLFYqm9co7o33oMts11Sn2WmYDco9Nng74oo0aVoo8=
X-Received: by 2002:a05:622a:10e:b0:46c:86d8:fbc with SMTP id d75a77b69052e-46e4e830686mr142033891cf.11.1738063658953;
        Tue, 28 Jan 2025 03:27:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEsMGISBdAE4HwUk4/DapdIdoBqueAY6xEsCw7mHKRgQdChFAp+8zPxF/EfVH4RzZaeZ8PCg==
X-Received: by 2002:a05:622a:10e:b0:46c:86d8:fbc with SMTP id d75a77b69052e-46e4e830686mr142033741cf.11.1738063658665;
        Tue, 28 Jan 2025 03:27:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6c7366dd0sm61091166b.8.2025.01.28.03.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:27:38 -0800 (PST)
Message-ID: <f2ae5e21-88cb-4951-984c-2a29e117f058@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:27:35 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] ARM: dts: qcom: msm8226: Add node for TCSR halt
 regs
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-5-e88d76d6daff@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250126-msm8226-modem-v2-5-e88d76d6daff@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fvX6E3KgOuotpxQ-Da4FFwRZKHgch3ld
X-Proofpoint-GUID: fvX6E3KgOuotpxQ-Da4FFwRZKHgch3ld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=850 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280088

On 26.01.2025 9:57 PM, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Add a syscon device node for the TCSR halt regs needed by
> modem and other remoteprocs.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6419F40A
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062824; cv=none; b=QyHlFhyuZbnTgHk5J1GeRxplcJLbePuebIZ/pfG61iuqUprWPIpqOlHepDQ+wsZUlhzGxOUabOQjVgw7Oo4yXESYqRiFeucTD4Hwxzjr/X7VxDg4TyAtX/DkgeujiAVtKARSxD6TzyMr4CcUTFI/JZHQbCjujAI6wcdyqNYtWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062824; c=relaxed/simple;
	bh=VhMH2nygLaTG7mc/nW//k6R9Kfgy0BdrogZyfC03hPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXJ+RCW09qXcdVxkkuugy2hlMhnsUu8b7LILT24ZRAiXSF4Kgy0k657OTshPT7gJ5ve0d18X8YvbxcmtzAKjoiuV4z+TMVn3dNs116POAdS2x40lPagzKOHDY0KDbSh8qIkPtYFTx+v6HVSreQnOJjr0HQuwFVptt8Ak8nEgh9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8zQu5Tt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8zQu5Tt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S8ha8F015086
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DF4cChWUCVUfCwvnacvCOrX60QCJzf28MqWHnByY88E=; b=A8zQu5TtMCn6TfmQ
	wnVhTiTE+5JkVeV/UPhTR7IvX7/hYP2auLIeYUe6akEr9f1oLEwsoMvAN6Y9TI3g
	6O+/LxfrMH8gfUb17BraQR1rYSdPxFDc+/jfRjoGzmkAFTbNGz7lpbU0o70OV/an
	pWrK6JbXQF2xjNACP5G3DcWDY4cAI63BvMVFof0dmFSkhU7ulXHpJNXgoPoYaVn9
	uusgP3fdIwXqtIwhZdCPxKCTphopWr6fa4tpmIqAvktaA9V6/jSoD73iDf9DT9OG
	DfPTuBLCSVM0iEOycarLHphnuJyvwvDObd2WTgqTQdaBT4W67PNI6LPDKVoQZBo1
	MV+7yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44euyq8b0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:13:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f134dac1so140657785a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 03:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062819; x=1738667619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DF4cChWUCVUfCwvnacvCOrX60QCJzf28MqWHnByY88E=;
        b=eMa0UUnsyWgCwN95hdE3GnYOUCAA+ZJHK1OsykVRXSC9ukiZ9zAHHeQQRA/n6WUxcv
         pg7ourOIhTmmINfiG3i2Dr+sQuQy5zz0xHZvYPbEIYeH/kB+nUpUehAlYCiYVA9XxPwi
         ATZlV4vnwnDYMkscyE5ufBAi5ccdUck1kHVSYuejdB500AGBxm4hTH9iIaMwrXuRLVI2
         5ww4so5btvRyjQWu/UnBOSoq4Xn90qwQM2/+m47Dt2GMrBYnRizQvlerCPSQUZpd6qO2
         KBvZ6Aai91UwbPe2fIdplSSch1J9Ber24VDcJufDNs6zlfxbye08EFcUCouoBnRiMHED
         gPsg==
X-Forwarded-Encrypted: i=1; AJvYcCWxrpSjsOjE3DdHJ4AqGIA/OfHwLFjKrgYa121am0PjO+5y4lfAaZy8UYAe+qZXtgsBQ1cgLIpW1vBvvfWfJ83R@vger.kernel.org
X-Gm-Message-State: AOJu0YzhiCnWo41DCD7eoIampa6BXl1oACkGFJqu35WnHEXDWujIktXw
	BqlWVthSgWB75oWQ7BovNM/pycF7cHEKYqqXEHN07GwhEk7djU5cQZMmPLOmnAEhF1P1vIk0NR6
	z4kYUEL3Q16LffOP4IDj4bE5SudcyxN99eaBBJtHGbS/u/ur/6wZzkzAtKLpz5bzP99n2
X-Gm-Gg: ASbGncuEGSGyhkz4em5DDq3zJ+JBV9v3dH53IgTKizw+IBreqjSnZ40/DEvYBcb/RmR
	WXsRippKAyCdmZbalIG07efACjc7uOIszj+0zElNrUpReXkc2dLwuLeSHNRrrOTjc7OGE0Libgm
	ffphigPA4eCoRdsADcc9cCyVp9s/Paq984YqwjL24rY/28H15Ytfuu6mCErktz6PJXNMvjZmIWR
	CAIv2hVWiX9N10eAB6ThniIow6LFQ23UvLmnsDV7N118maZ3+77Emf2w7KA06lj+4xtSVCfzpz3
	1srMOn04G0s3N+d5vaLDLJGr8E2VnMLpO9yqJyEcTYl2/kAVrXBWXbpniOQ=
X-Received: by 2002:a05:620a:43a4:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7be8b2eb172mr1598261785a.5.1738062819159;
        Tue, 28 Jan 2025 03:13:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ1h7uf+LMhsXH4VhM6mHS1CLjA6Tpc20KWyM0RAcBNkCaIf1DJHDqGaYa5IelQE34WvcvZA==
X-Received: by 2002:a05:620a:43a4:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7be8b2eb172mr1598259585a.5.1738062818767;
        Tue, 28 Jan 2025 03:13:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863af41sm7222946a12.44.2025.01.28.03.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:13:37 -0800 (PST)
Message-ID: <f3dd3500-d07c-4231-a0df-cb4812ee0bca@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:13:34 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] ARM: dts: qcom: Introduce dtsi for LTE-capable
 MSM8926
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
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J1gnuIBZ4QmBWLZsLDL00MNcnqc0tkyq
X-Proofpoint-GUID: J1gnuIBZ4QmBWLZsLDL00MNcnqc0tkyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280086

On 27.01.2025 11:45 PM, Luca Weiss wrote:
> MSM8926, while being 'just' an LTE-capable variant of MSM8226, the dts
> needs to slightly change since the modem doesn't use the ext-bhs-reg and
> needs mss-supply, therefore it gets a new compatible.
> 
> Since we already have two -common.dtsi files which are used on both
> APQ8026/MSM8226 and MSM8926 devices, change the setup a bit by removing
> the SoC include from those and requiring the device dts to pick the
> correct one.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

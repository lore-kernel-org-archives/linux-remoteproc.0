Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA23C942E
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074685; cv=none; b=ccx/MjcIbAWFYf7LnRfxfodk3ZWUSF0wP1H4kSx4LBtS9+nIgDSEUGm1EmnaaC/WitBUq4FfJGjXQaiRXLKoz/NSCuFDx7OKliRTOAnmDtxsjrml9ZoNUOdBLCC5BolaZj8XTUXMN7mWtzPB6+aAFdXLcjXrwDMsPacJnknKMR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074685; c=relaxed/simple;
	bh=qiyzgDhFBvLQBInbQdAPGyL8srSytSEX42oOuQxiCH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qu2+za17Qv7tM/M6GqL7DmiENo2vwFX7QSO5LDgQa15xZaN2OICRPkSiIwVvA3V9/qQK0NRgCZJc2I5K6XHirE/t9Mh1gDlYO5mf8n+o6pnWX4mIhq6e16k32HhA65UOzRXsKkuLI12ep/xVjtbfY9YGFTxQj8ONPOumBzhYcFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XF25VBTj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkKlrQqr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XF25VBTj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkKlrQqr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IQFI3194644
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 10:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8sg/ld/I8qbw7uUnUsVl9AhVTb+2HSc9O79hpsKVLY8=; b=XF25VBTjXdW4rzLs
	Cv50XV/XSKIHVl2NDbWOZikEIzSts9CaNge1SdaskXgT77lLHZQRySRLceuSZw6w
	sjAzZuLbAQD7FDUUL/epyOXp7Ncz3eN8p3Olhq6f/Q/Dkm4dOdQZvpi7ALh3/drh
	hVifuvuDLxvcV2e3bfWznaqF1cFQ1GpktvjIn6Nspw5yZEpzzIPZ/lghhkTIjFrP
	rOxRC8MV55xl/RoDnQUUBN4BDqwTTU7jrwS88RV045BJEncNAdLoRDG9FG9A1gSE
	z8DXzKw5GEJ06tndCi1ST5hffPxVPH/zm3qfOUmd8rtPKoI6u4EgzzH7Fk633T2V
	wS+fdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrpjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 10:31:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so682253a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 03:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074681; x=1783679481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sg/ld/I8qbw7uUnUsVl9AhVTb+2HSc9O79hpsKVLY8=;
        b=HkKlrQqrBMdzBN6+NVhyBsbfGgnL6ph7UyOPJSl7ZXDHjrWVR7qq41L+SAHP7hQ478
         lvjIkJsbACA6u/oCwrBp0gYJJ8kuCRskgbMgRUgMuufnDhgDVxgILMLoh3Z19YApN8+Y
         6qTtCZImnkvGqXs7+ZR9MxMYIoP7XolbnYr7c9E8utarakkHyGJvgKSFMg5jCkCDfHTG
         pGzLZLsJb3JemIrDJ+c8/qQdZ7GKvFN+pi70bQ+dY0CDUsN2VToZ6qbdG5JjQG0hOFlF
         jbS3fgLnI/rZFp1+9Xnw3XkFubV0IVJcE+Do/lQY79NoXkCaiazklJLGrrbFKf+1ZeWt
         tkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074681; x=1783679481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sg/ld/I8qbw7uUnUsVl9AhVTb+2HSc9O79hpsKVLY8=;
        b=ABpAA/U+Y5pvSDg/HIuq16Zd8/0jeRN18rtY6cCZvPc5YK/2AdLGWmk+p43x2d7pPS
         BvZILsmuHWERptMsWHQpBYA4E1NQtf95h5S5GScbu/SaIziDfFiN9JLw4z6AIqp5D7l7
         bujBO5wisPTi8M0MuwKrEEGsJM7wWXnLo0nnhC/dRPVRoOnL/NVgNFHM1T05K1oa+/Nw
         j/e7EfnduzpQ1zDg75QcW4utigzNaQ1dud8R7zVB9olH4oPuTbOJ2+fVI3p5TAl0teWD
         EHjnqWwjrk9xLk1ftAH6wfxX93L5R4gjFg7iKSpUmNuIkgZ2qu9KyoAU4D5WaKOMpV7z
         0lrg==
X-Forwarded-Encrypted: i=1; AHgh+RoEPXonVxYPlzHNCSXcDBrElpRW2ECHbVOanW9s8/ajtRfZTVdpSbP9oI2VQwmlSvmdhaWYfZzCHEBFkLUtkUxo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6XgKAlnwK5r/ZispGSYg8Q3GsRFcTfkxaKNbJ9Rz9cRhRqtmR
	6ekhhsQz5SUo7+WgsNjNcUliGx+zgenYqWF3KhqjzpoqAAr8/BvMsU9kgjXEFFl1g6/V4XJyeHP
	CHQm8ROv4HYTRqaPJC5+JLTPCwYYZciHOTS9IuuFiTFnpDKKePOMis+ugUykelCIQ8N3wnsUOBQ
	vVQ98I
X-Gm-Gg: AfdE7ck6/X5FB/m3y+fvBFBHg2brQ3G9A7lUGP2MwqBdArlO++mZgQYgKUY2ILVO9Ch
	mF3a+IS7MhqWDV0zsITxSh8P7L50VCml5qEmaLuATKxUHzGqMWjZVz8o4fEUu2opM2YeMy/vmrX
	fIAfxuZJWIn1jpPCZAMavaSmKjDvdcf774F/oHx/b4VQj/s60UPo5/zpD+8VC1XMEmKNVQEma/+
	thpkc1OAk75UXoT7orO+HElGwBNNaPlK22z0w6DIshQYKG07XzyVh0EYOWX+pXWxAkmXtVunrAn
	YtNo/Dt6AqXG3u8fXV8ZcCMwsFys6IxzuxpzYue83FzDrGFaU4cW/zPMYkfkKrvvJ8Wn4cpjzqW
	EIugeQ/HIaLVlrZXL/QTZqGm4yaoc4XKbzlmPC1R23Q==
X-Received: by 2002:a17:902:da89:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2ca7e85a856mr102663315ad.31.1783074680711;
        Fri, 03 Jul 2026 03:31:20 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2ca7e85a856mr102662705ad.31.1783074680012;
        Fri, 03 Jul 2026 03:31:20 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71328d8sm7377295ad.29.2026.07.03.03.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:31:19 -0700 (PDT)
Message-ID: <faa65875-0aee-4a12-a751-084459edd4a7@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 16:01:13 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <20260703-bizarre-abiding-spoonbill-dcc142@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260703-bizarre-abiding-spoonbill-dcc142@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMSBTYWx0ZWRfX1KzHodXypht+
 oMVjHDXP5o5stemF5ipgk7UTfNoJSZ5ZExrrCn58TMs+7uVY8VeCLLf42DaACIk6yug7wu+yg5b
 uq5e/ayKjHLr5vQs0tRCVUui7AwUy96Xs2AzQaRAn374IXGYCY8br7EAXmv4aDzkmMP/TxB3NIp
 Q7xwhJXbfKQBCArgwPQreKE5vQm5sHSqACmdqFPcDG9WxY1mOYOumsSO0u7bj6YHHZrTXhqUvcF
 3dH/JP/qIqJwmgSwOfpxPVa1oHBCXbHQDfdTSNz6rokswW3DunEC2rhRnBUZR/il/Tx/cJjCPB5
 2vcdX1RNh8P+ONCAdH4MAvFgtIVzDwZLOUJCG14I0Yp8jFyO5zdr/MB8vfj1+i8kuoEGfKIosuu
 IA/r7AQGjhfVhGOSM4bd6r5WOEL+kVTuR+zIivEI4aknIMXJnkFyJ8ugMUZyYcP9Lt5XafAVO6Y
 pp1tBobR4WraV+77vrA==
X-Proofpoint-GUID: Wqmut3vWAZN23UnPArMyI2xU2H8o0H1d
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a478f79 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ac_jkr_iY3tVM05H0rEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Wqmut3vWAZN23UnPArMyI2xU2H8o0H1d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMSBTYWx0ZWRfX3Epoaa1saqsP
 zSFSqsrEOYnT6crJc/70k/iBZ0meddCy93NFTklTzgLpveuLS0pAJb0cYOcLWyq5j/qh5i5nNYz
 jKbryYZIkmOD/970wsB0l40DL8gRJUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030101



On 7/3/2026 1:22 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:33:04AM +0530, Gaurav Kohli wrote:
>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>
>> Qualcomm remote processors expose thermal mitigation endpoints
>> through QMI. These endpoints can be registered with the thermal
>> framework via the `#cooling-cells` property on the remoteproc node.
>>
>> The QMI TMD protocol identifies devices using string names (for example,
>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>> `#cooling-cells = <3>` requires numeric device id in the form:
>>
>>    <&phandle device_id min_state max_state>
>>
>> Define common TMD device index constants shared across currently
>> supported platforms. If a future target requires a different mapping,
>> additional target-specific constants can be introduced while preserving
>> existing DT ABI.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                                 |  1 +
>>   include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
> 
> Why is it put into firmware? What part of firmware are you describing?
> To me it looks like thermal thing and even you wrote: Thermal Mitigation Device

Ack, it looks better under thermal. Will move to
include/dt-bindings/thermal/qcom,qmi-tmd.h in the next version.
> 
> Best regards,
> Krzysztof
> 


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109788;
	b=w3AkTxFVAxTHAi/6DWkktDR6Li4QgYhjCN69Qn9cDDV3qH8ZH4zEwhrrUPpH/HvyycHl
	 YkTRe007wsyr53EkC2/uJ67vzfScQv+TkGuk6igZNmNdsKE/Q0Drt3c1ln5UCwRGVR8eh
	 WIE2zR3IeD6J8RdNi4mERD9AhWBNMVmSHS7CXuMynG07Zy7qtpGyow2AIO9lsZ2HOVadC
	 4YT/vwp9Mqb4VgH6hW1mgaqcBegvdrEoiW5EX9YuBp91lDINbB1G5bwQRZzkLYDvb0+me
	 A0Rd7FOVePPRoenJ8/CETrFs/Z7nJQAWT8fA/oVSLRFpQY47Q4QLNlw7sCXla+Wqj5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
	b=SEaUvudJ2h7vcTyGIhPdYsQuHe+5RB7j3/NjLCbQnYDjkHf8EY9W9t3+ThSyDricWEJw
	 B1j6jcdKh22NLybeQWFK5+dTIcliH7N7JWXw/LCh2iE0sOCe4rUvxXoTcIAua91g60NVJ
	 02CDquSJYiAxgm3pY1EMBRWUXlWEkkUrKPkEvOOFrw1h45fFCUVa3kkAZ9edXDkShfBK+
	 wtHo69KN7Hl0CyvrQwsOiP973l3YevjBn7QKD3dJ6yoJG5fnEDo7HiREJtab3Ad4CnVh3
	 WjFBlWPzLm/Ya/arQkYncKkRu3N7/RahioStf3s1u0Y2/7sLKUTAlz3SnV6pXNCquUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8ewLFbq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HV1zgTgX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B68B606A31A
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 14:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B68B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8ewLFbq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HV1zgTgX
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoH5Q2948346
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 14:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=; b=a8ewLFbqdXfjKUjK
	MMA/shdVyvemvXTbn0l+T819XaIhFdb2FIu1ugEAL94GzrVa4GtSxzBND4Mzb5NE
	unrLCM3ZBBsKzgIstFTRN01z28yAjZhkqV1FPFDO1TynSTxQVO4sVvEHKYMDiWm9
	tNpyQx3VQnqF4Ig6ObCEbsY0kYgEmWVur4coSOOrTeA4Z+l5DrjUIBkEAGsa/jYH
	9VZE8yxR/FvTC5Of70GTzWAHLD4Fg6kkg0b29MszjADf6/PlVV7JnozpzMbMwGc/
	jz5HvW54sQuc5Mk857WNGmwAW1Ms9SuX+UfLr8kMY/gdEJkCtrsX4W+CV+vwalsf
	xl+nRQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21ekc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 14:03:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabe7151daso103912e0c.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109785; x=1793714585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
        b=HV1zgTgX+LFVFrWYiJ/97rGDJdWSJHSGX9ZkUHK2TBmtFFobWP6Cy7aPl8yT6oxeSV
         QIaIqfpqpV/e1yFPxN8RaNzwV9XLh2+srZU1GSTAdoXhaCnZLEPgUImjbqO3FxCS3Mb/
         0lPfSBvj+mmGqWqNF9YDnhlP24AUx7YRyHq70cvql3mAGFFBQX8nNyORK0vob8FAVyEa
         N/j8ajEnzcmx6cZOj99rfRb/HCazFXK3xMs37iN2Nu8O+q4MOY4DPczCDMXoFzKF3Rq1
         LJuxRmV2maiovJHXE6cOhrqpJt9dZf1mQ0EBI51krBB/aWrMiVTIe63oz2gnRVJT0zBQ
         KIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109785; x=1793714585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
        b=oC2wvw2PD/o100YzpchdooeXEzH++m+oUEqv3TvgxgDGj1RzQw9lzXAsU/w6MnHI8W
         a8BDAGGpy0QSTGdMdtiIxZETcusWQ1qfaDTe19JsrI9NmTSv9pv5GalDjSAnSUyGnqcT
         J/lRyIk+ACTRf/cXgEELYEOzpDEoTVoqhA8f49S2fSGNuENOOp7Z7DkKfC9BJijBosl2
         MdxJF9SKjognNOSquqkl+lTOu8PVPghforMF4GCvIcvfkSgB6UB95Gfk9ZTfqhGSqU8U
         d88Vs6P2E0NjZK8KRkBO1bYtDYd1W5ONlZbQM9otVvTnqTmqBPhNrL2lPZ9dmVZcTxjB
         UJaw==
X-Forwarded-Encrypted: i=1; AKwUvBzHel+UhPP9gujQLizN1G3wxxQnwTBTOWlEiyaxiWCu1yJDmwsMh+kDUmRSQz7yhlyNc9Gy4OoxNbWS+h+kjTnq@vger.kernel.org
X-Gm-Message-State: AFq9FYKGeE1NoU/2Wn67HXbqM/tY0Yfcz1sM+KxoSG7guj0TYyPobtEk
	OxZOgsdB+3gbNU9Jh947RriC4pDElj+uD+YDUHNYDvtGWGz2FYW+iTsynbqqAjnDqgQP7eJQy2e
	FttFIGmidM+/FLis4nsBWy6cefxUYIVg+TApaaMC6ELmLjldkVaLPJ7edYH0Nb6cwi4ZEJ4wu
X-Gm-Gg: AYBFou0z6j9X7ao1tjVzlzFtGzgh+IlDTb5UJQW7U7/EGo+J2HMQEad9TzmfYsuI19K
	xEqySPrL4bApboHONA+uJ/hYysfzEmCbihnBtHePZuWFVpSwADbp1H3nJ76udIHwnjUyhn0qJ2e
	WFt1srl/6rv3vWSOMjjmyYWpRjiKchhi6CGmZ+C4hzs+5wnOSykZ7QCq8301d6rG7rbAo3vDpcc
	lo59fKCS6OTrcNpkyPut+wUTbTNAJbny6yTreOisAtCbZADTBc1XXuRnqLxKhfivO3GV5DpT/AY
	JdYu4zRnuoZvYcHfVrOEJ1c70dew2lkxZvOJM5GTyYHO5SJ1GptJ3Xknin2uWsOK6HznFidOpcO
	o9rFYYI2c4WQytoeyUXvvzQ==
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ec230af32bmr3420270e0c.1.1793109785144;
        Tue, 27 Oct 2026 07:03:05 -0700 (PDT)
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ec230af32bmr3420220e0c.1.1793109784529;
        Tue, 27 Oct 2026 07:03:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fbe6sm459999666b.10.2026.10.27.07.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:03:03 -0700 (PDT)
Message-ID: <1ae7cffd-f39e-415b-b2f5-ed3179284d6e@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:03:00 +0100
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
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
 <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
 <auCsCPL7gK2lIR5q@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <auCsCPL7gK2lIR5q@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX/uIuzE2TS+9q
 bSUotltvb1/ibrWUp7J7gJWFrVAZOsLu/unA7Nc8G6GwQTXZqwTAnVkF0vpxlXlF0BPynvqbXQK
 fEExxa2SV9cd2e2z7LiFwq2JLPY6ocqXcUhr0gY1lNueAJfS3bGQNWvyRV1YwdSCgBEP3Tp1RV7
 wRqhYjEU6MHGT7OwPjZWproW6rsTKPu4p2W62RNPZyTl7+zokd/AI6qwAM23x1+ymk9+GsMeMch
 7lZP9hGzhbCfN/3ecdeMTPg3pyf7E49cFF4PM+H6wsBXlbqrl2i10007bRAHA6eCtQISOUSHYlE
 y4js+YiKdyjHP7PwghML4WHrY/crcsW/wH1zZ820doScHkaDWC8ZQ7xy2AFuaswVA0MahweFTTm
 Ec5T8x6ilp8A8HOq6rwABzWgJICQVByA9UWbUq+lDzRdoFPQy2lSAZpoNHiLlGwob1OtNQOYyOS
 4rWSxbEqVbRJ+NZcA+Q==
X-Proofpoint-GUID: s-JLVn6TIF3M8twReZLw_XIKJ_jESgez
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX+f7uZgTbv/n4
 kxWFg89mW6itZxg+06yMtKMecT862JWpJf7kW0kPws96Q5XmcdYK+Kti/P+Bwc17d5m73G4BrPm
 eWIph+l0jTm/7QuX8HbjHjtEO3PvvzM=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0af1a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=DwHBtBTWuPJZlIKgACQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: s-JLVn6TIF3M8twReZLw_XIKJ_jESgez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270055

On 10/27/26 2:50 PM, Richard Acayan wrote:
> On Tue, Oct 20, 2026 at 12:37:36AM +0300, Dmitry Baryshkov wrote:
>> On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
>>> The Audio DSP (Digital Signal Processor) is responsible for audio and
>>> sensors on SDM670. Add this, along with the SMP2P nodes used to
>>> communicate with it.
>>>
>>> The sleep state is included to prevent the following crash:
>>>
>>>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
>>>
>>> Otherwise, it is unused.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>>>  1 file changed, 168 insertions(+)
>>>
>>> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>>>  			#freq-domain-cells = <1>;
>>>  		};
>>>  
>>> +		adsp_pas: remoteproc@62400000 {
>>> +			compatible = "qcom,sdm670-adsp-pas";
>>
>> Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
>> fallback here? Then you can drop a driver part.
> 
> Actually, looking at downstream, this should use the LCX power domain.
> Can power domains be omitted like on SDM845, or is LCX important enough?

It's used for "proxy voting" - i.e. the OS turns on the power so
that the ADSP can boot and set up its own voting (through a direct
interface to RPMH on its side), and then the OS drops its votes again

Konrad

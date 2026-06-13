Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8923CE4A2
	for <linux-remoteproc@vger.kernel.org>; Sat, 13 Jun 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781348718; cv=none; b=GCtNDPoH8cQIop04rjuV7U0pj4D+qO95g3Ysrv2LEypd7OYbRxj3Y2gYHC3883Sy93PRMuzSISdwOJc1sNnN3UpNAxzvJEP5CitYzWbkcTwOmuIVc8EgUjKE9UYmjil2WnxbWY2VYmMZurGvcJ186Uwmb0pULaOFx5sw1BV1K3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781348718; c=relaxed/simple;
	bh=hFuLzAKLku9zjjLmyY1LU1Y3IkgnibQ8as7e14dCSpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTI/dgVRTKDq2UUrLIQWX0aBK1+4yxIJZi0newfXSqBovKEzSkiLd5XyzYh9JiehyEI2MomuDzorai9lMJBjcMo7Rqt8fdc8Ie+mXM18Nc5J4tx4CWONRRTM9TgCeTuPtkLLtekshfC4Wp6obxuc08EWYGAiSp2/3nXiSBifzDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+0kXTNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLsHKpje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+0kXTNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLsHKpje"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DB0TUs2640416
	for <linux-remoteproc@vger.kernel.org>; Sat, 13 Jun 2026 11:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fRqve/iiEi4xLe1x8p2XFeA1tSQCSNKv74uJA29YfFI=; b=d+0kXTNFVgiLRzE+
	p0EZbjEhCmptGdcfghbY0edkgREO5wWW4mkF+qxGEEFgU05qKexaKw+J2YIbE/Jj
	7WzQbN6Fl4jlgjttjwrsuVCovdW7fEYk5XTcowxWAuAtSHUw8NFGXIDqPDfJQ66F
	2QE0nmM3wkyJT9cqAXdbTPZEUTfEO49cCGMcKi9al0+vOgSS2bgoy2oFJ/CR6q6w
	qxpzdDsyUycixWla2S74qN20ZjTgFZD/llKZt5sePyJ5HRchOo3o8ssmt/QyHTL6
	I1xlM+gd769eNTsx3dy4sFT++VPAu+0DXps7Mm2DQOoNp9FTYWCsJdHWkjppGp2A
	dxTZqQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk68uxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 13 Jun 2026 11:05:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2ed88c8so1770009a12.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 13 Jun 2026 04:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781348715; x=1781953515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRqve/iiEi4xLe1x8p2XFeA1tSQCSNKv74uJA29YfFI=;
        b=LLsHKpjeQu6OhkG9dnxXSyAD8c83lLCc86oTgHfeKlb1IHK+GZbrYS1UXCGHi78zXq
         YSq17K3K4eyHQ5EiitCjDmnLeKTuCL94TQTPoBEkgLETw1EAXH9guSJto0TEGW5bAEkN
         +I7VehrIeteLr06M2hzYN4n7wolE8VxfQFI4iiOdOoiPMu/r/ie1Wsnqc7vycY8i+aGi
         2Toqn2IA9mQyX+Yy53dJQyZp2riQAuOsjMR7d9swt4io+Dux5thvFxQAeABoEtH/8Hp3
         BFi6jWg1cDxQlJbjhRBBWIKc021pFuYitnCdB6GFrySwuScJwLFCPqGxbs1nGZcOi8FR
         TKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348715; x=1781953515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRqve/iiEi4xLe1x8p2XFeA1tSQCSNKv74uJA29YfFI=;
        b=cpegKhxdA+Qsqe4DaQuGGmXed1afvlRNZ87MacWPQDRXmADmwyj0l7tM1JE1V69Nkf
         BBfz75qEF41t8pBpS44E7bWvqwqxn6vklr+FpaH5eqPCD9hP7BJP3d0bBelrlwc0BKUP
         6VCApB3LDm1jVy1NO+YRwzJwrd2RvYsWBNo1ahqDteVRxvdUgeCYcvSlAYvgzmdTEobf
         NtwqUVQfKJkrnm76kYYj2rsd+Vrmwz264RITaaiEat2e4nX/QdWttLwtwKQrNzhecyfd
         sV9AJaIJjkwXJ3iiPqz3pQjEgYP7HuD3CX5Q3abK1CLO8IRIEasj5itNgDVnprfDWjFq
         icoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8J1Bw/kJTlqs8CvQBoJXIWUEt/8k90O4PaHe6MC1LzfZcrIKFSrDoXdmlyFC7qkSYCW8sigofJXrI2Bx+fnJZg@vger.kernel.org
X-Gm-Message-State: AOJu0YxXtwv+948PpkEB3lyNjf9HF8alyx7/l+BkyB8y7VFlD8cTltdn
	kOhvMuWoYiRvoYjH4ZcRETuUqnHjSrISb3oi0NMHv/icveQhS2oMb3mMzI/+7k3Ik//sTfgTiDd
	b49jFykDige6sl3jcqVIXKGRnN73JrALm5eaF9hie3CjbdYlXhkKbHk+t+EMeJke1uZURKaTp
X-Gm-Gg: Acq92OG7SnpqQpMQwO5lQxhFGRjAk6ls1V5nKdXKixXOiL6O5bnka+/szz5gfcPNI+9
	DqEfdg7EGOzSrLGH9/MK77ikGpSk/bTuZWaQowenV1FIOOKW0ZMx89OwK8yfqWzUey1c0B9Pdjh
	DmW8AiRVa6iUCF45/lR7gnGSf+1mXYLXzY+e3g/3gXqWFO3gvUAa7slF0TEIIt9JZiLfh7nvZXX
	cinAna5BrUTQ3VnV7xAQNn8GSn/wIyBpcdnGTmrjUkZ91slJW8ATryFdc0hLTp38ALmnL2RnatR
	JofFyBbyUzPYjJbqsdVU1wkg+WTKCBwDXhsnMYI03iYuiBEGc0gSUeSCBEq8J9I8uKLWLF9VOLW
	h2ywFAXfmGe05DJQrmdkMicIYw+qxhWJUvBBWoty41BBU4mi8/sgH
X-Received: by 2002:a05:6a21:7a8c:b0:3b3:1a06:e5 with SMTP id adf61e73a8af0-3b78416b85amr8312209637.33.1781348715518;
        Sat, 13 Jun 2026 04:05:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a8c:b0:3b3:1a06:e5 with SMTP id adf61e73a8af0-3b78416b85amr8312188637.33.1781348715107;
        Sat, 13 Jun 2026 04:05:15 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9bfe1sm5037247b3a.12.2026.06.13.04.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 04:05:14 -0700 (PDT)
Message-ID: <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 16:35:07 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
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
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDExMiBTYWx0ZWRfX4KgoaBupztWs
 LkpQ8gdWbLnqXLj4gaRhACT90uba5cFtIwCmtzZjGjkeRr3QaD0+zBJC7jhVPo9/CqwfLb2R7HW
 JhPYFM889w5E9uMSD+h0aRGNe1Lk9Fs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDExMiBTYWx0ZWRfX1im2I4havFvL
 07IGk8t0t6hiDcmNaoRrEmwQWEH9N/L/5blcf3KHsGpGjZDjWkTv+D+SZdG4w0DnabWCK7dK8pZ
 C0C6lZrlOYIG+mgKms83tsyToSZ81ya98Zdth7xc/tvju8p4B6kdi+8TKSAI4rrl2pjF9SrAit2
 gxQS06futvqGg93L9nO40LVRsTols/VSvuQvWXIZ7x+jaJsIPxNsO3QyqhVbkvdQ6f2PREtQvqP
 OjdLMIce4JAt+9ZlWkxUyvuZrqd7t6DC2oaJrJWauzHwHUqpEjXtf/n/LgSnCXH+ONyOcdCko5z
 VG/NgtisxlkS0O4xXvLhttn9VoEQjuOLJtQOYdcXQG8FQ6sCgbt5cTmaWb3IvC7HCUPI1W7i+13
 8is6FQ/aunmcJMn3QQczhA6f/WdWoMF0y7vBgYu68cUOru3rw0mzcUKJsYwuSzZMgs1RA6Vdf6T
 xxPtbpmOHvTpe/0JN6g==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2d396c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UvbFL3pLTf4PkRdXo8wA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: vIQ4iJxn9hix0zxnAMfkHh00x-wkEGTm
X-Proofpoint-ORIG-GUID: vIQ4iJxn9hix0zxnAMfkHh00x-wkEGTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130112



On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>
>>
>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>> Why? And where is this generic property defined? You cannot just
>>>>> sprinkle generic properties in random bindings.
>>>>>
>>>>
>>>> Ack, will add why part.
>>>> These names are matched with the thermal mitigation device identifiers
>>>> populated by remote firmware over QMI and define mitigation devices are
>>>> exposed as cooling devices.
>>>
>>> No, -names correspond to values passed via DT, not some remote firmware.
>>> The remote firmware should give you interface which is explicit and does
>>> not need such properties.
>>
>> thanks Krzysztof for review, We need tmd-names because of following reasons:
>>
>> Following Daniel's series [1], the thermal framework supports
>> mapping multiple cooling devices per remoteproc/device via indexed
>> cooling-cells.
>>
>> 1) The thermal framework's cooling-maps reference
>> cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
>> there's no way to know which index corresponds to which TMD, as firmware
>> may return tmd-names in any order.
>>
>> below are the changes post new thermal mapping changes:
>> DT: tmd-names = "cdsp_sw", "xyz";
>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
> 
> names property are not to instruct drivers to register or not to
> register something.
> 
> I don't understand the problem and explanation in the binding is
> basically non-existing.
> 
> Remember that all lists and indices ARE FIXED, so driver knows exactly
> which index means what.
> 

thanks for review, shall i use driver data, which is basically pas data 
structure like below:

static const struct qcom_pas_data {
     .crash_reason_smem = 601,
     .firmware_name = "cdsp.mdt",
     .tmd_names = (const char *[]){"xyz", NULL},
     .num_tmds = 1,

Is something like above acceptable? and this will also help to filter 
tmd names as well?

> 
>>
>> This allows cooling-maps like below:
>> cooling-device = <&remoteproc 0 ...>  // "cdsp_sw"
>> cooling-device = <&remoteproc 1 ...>  // "xyz"
>>
>> 2) Not all firmware-provided TMDs should be
>> exposed as cooling devices. The tmd-names property acts as a filter,
>> allowing board-specific DT to select only the relevant TMDs for that
>> platform.
> 
> And driver filters, no need for DT property.
> 
> 
> Best regards,
> Krzysztof


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D0930F929
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Dec 2025 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670407; cv=none; b=FmGtwBpFLHcQMR6t4Che4lo1LWyXSpEmyHvX9hEVpGafz55FPl36/xW6gyAhbLkdrfvYa5Qru9yK0Y0CS16XnuXW4H4ieW+q2Y1s4JWgydWqNj6RXJYjUFNOxoDqXLuhswRYu4DJsT5L2vKKjlfdysXQvr6HHzGycYD2CjOTlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670407; c=relaxed/simple;
	bh=jkD0PgX4AYLD/tWeanomvQ7p36iUYtXramiDJGNxlqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fp601nfl/QWNQwx+hgGFkRiy81FmnuA3VXuDxSvOFcczyqFFgIl67by7zO5drpoHCWSzK78Yz+y4VX1T+qr+/+hS/grje2iyK6wJgLP4aKJsJVHdhN/Z/7tWdDC+FXuh1CUf/vLKlSZajYdqUt4YfPwJ4KYIZT+1tTEejO4196E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7FBKA6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2odpmc4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7FBKA6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2odpmc4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B27oIQc1926505
	for <linux-remoteproc@vger.kernel.org>; Tue, 2 Dec 2025 10:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsmArkF89BOUHhGXQUlWFZF2aiQoOW1ZrRrGna7xdxg=; b=T7FBKA6m/ge7cXxt
	AXpuCZXKHfSJS4y+bY0aaVnQr4Fgd3vhmQcJz1p/CmJpjFtM8Obz7+j7Rgw9zI26
	DX5mhc5PDqf4bJxyKhtCxk7ToPh/sEND4h6Jt48sjxdEbBDxtcYBldwzm7Cu+Zwe
	w1gE5HFrUT/YPw/UCzOANxGS07yRASCudBSnjWsCFtpIFkFz/nQjR4wZI8bPJKKB
	K97Yeq5U9AJosGbQqGArzbtjLYi4ijvYPLyoDHj5TCeD+nEDYkHUSfLhvEMzSfyn
	w/9/d/Dxi42kzCnJLvYD2OuIofHA1ImuyiE4X6TFCJdFG9GodeE34jfnGSsbj7qj
	1GkM7A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm4xsu5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 10:13:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aa9f595688so7561261b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764670404; x=1765275204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsmArkF89BOUHhGXQUlWFZF2aiQoOW1ZrRrGna7xdxg=;
        b=V2odpmc4ypMEQtQyAR1x303PwKwZwzY0Jj2E7/YyeutsNyUfAVGGLds9uZmSwCq4eC
         jrwqnS6Kxmha96p8N+VU0/C2YzynLu94czRigHOPXqDiNb2bnKyp1Ba52EUb9UBQMR4K
         jNlS65+kk4KAtdLuE3RWauQHtWvfH5aonXsSWHjIs/1ZDLhmj3VVpoclECTEFlUDEnMT
         5+C/OULPHtfaCQS61QrK2vv/XqhkdlpY4fy7nw4URXQS1Acp+gL8kd3/L3yMLtJz63b3
         q8XC72EAXLPEI7gq30mp6Vx03Eh9fcw9FGOwFXKuYeUMxGz/VAngv6egCf6gSR3uJdzE
         6Nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764670404; x=1765275204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsmArkF89BOUHhGXQUlWFZF2aiQoOW1ZrRrGna7xdxg=;
        b=I9Gnycnz+ftjs7lxP8jG+1iJsGeKF6MQYkDYiqF8rGxdDWTfSJ6zbOly9s8m2FHFjR
         Aq3VGAfvI9+Ts3ciJC6QtwNmyGWH7rlVPcZDom+R1wMarxz396S5PuLnOGScsJlORZMh
         +QD9GRzgTCRw62vvQyE5p4oFl9PHKUy3MCFiuQdts/RgqstPKCYdHMB3tJTb6TjFr5iE
         Zr78mFlC3OFVVkbpgLuwr9UQMwCBCdwSIKK+8P149rC1YDOhuYhil7C6gx37Mn1ZaIqH
         i4qGWrnJVfDiODOmtZzCi9hNkhgCsXpzZ3iyN+r7McDf4eG99vCwLhNO3gznzH0oY13Y
         YMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfGL+NG9UqjDFJNPfjvYfK72q/IntxrY0jH/LUxtcTdK1r4pBIVMo3DGFrIMJDBnE0GPE5dMDiY4gkQ3+wghR4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1Q/7amlzzicot4/3WaVeCcitOzEwJG3DYmjYMj44tw29SBkm
	MSt3mw8awA6MQzdy46v4kyx3BXqySG4gMrsb3oPCmdacF2s+qO6TH3GTtFiqhhlSOsk3Tlj6MpC
	nV0+5MJvBUpD5Z1ZsBRh41Pi4N4k+Yk1kRz3Z33dCXQCKCRJoTU5wFg5S1/MmAfg+SjLzkXGr
X-Gm-Gg: ASbGnctPDKrQRiZ6tHOecSsNuLfqC3OgIBvYc8pf26bbDvhwlqesLsR2vo1oKpxlgJb
	ECRCR3Lf8qdfATAPcdF/bSlDVXxKB2KLb/82+sjyAs3LXwzJ8xGg3vV0UgIc6xw8672MQ+V7lRo
	WpczLQ71qSIp6bnH2XXKvOtwqr1TmO2OM04a9omYOroJDBohMq3Ye9z3hvkGoecNaETdMxRtqO+
	V4kDb+BuwSyinTvEZ6qO40dEB0gDWD2SjxzDJmucjBd2P5vPW7SBeHWhygK5GJzZ7WahN3prEtZ
	T32QQwu8Udz4gnW9Snwbq3AVtR3njaIA0rTkXbCWlpfY1mRTOp+QUETNc1wJSDpsA9Xcn/FCN6H
	8/bn9eao2VM9NcgAVMtrMQsKoMtdiW7DLa9kdqFSyWQ==
X-Received: by 2002:a05:6a00:17a7:b0:7b8:383d:870e with SMTP id d2e1a72fcca58-7c58c2ab7b5mr43279798b3a.2.1764670403820;
        Tue, 02 Dec 2025 02:13:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESsZ966I0XhgbDr2ekmgjrYiAu9aQpL3u5Xnmdj7BMfBxv2ve0RBT+vHWnMSj5FtqfLf96iA==
X-Received: by 2002:a05:6a00:17a7:b0:7b8:383d:870e with SMTP id d2e1a72fcca58-7c58c2ab7b5mr43279759b3a.2.1764670403377;
        Tue, 02 Dec 2025 02:13:23 -0800 (PST)
Received: from [10.206.101.67] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fc08bd1sm16402354b3a.63.2025.12.02.02.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 02:13:22 -0800 (PST)
Message-ID: <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 15:43:17 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
 <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EIzJX2UVYLUm8tv6u7j7LDMVMCdLj40x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MSBTYWx0ZWRfXxGWzApPRaR6Y
 hSOQcoHE+6KD/tyQRNRm4TLOV1PRIQ4gI32zoyhZ6tknUDshPLDHGgBKHDtSNfxfCdLDqcMwayQ
 BsY9vUP+rWZMjFC2ekJo9EC+qRCCWPMJNil9GzNj6FMz120tsLmvg/HEis3OFPop206XaSmYuck
 B5y5wKjXGRd4jBaq+bN4ToXZnkSit/xYU6xxszgIcdTg2D/aRAaS1Wc1hiBzWklY0F3/FS0198h
 rnFkff3+pE7GRqkpmIhUOV46JumPgvWeKdTSzZB6IyYgfnjEPdke66ELre2Yj9AtqWesMSojtXg
 MbnucgFkGjAJoFrJ+ueDHP9Ibx+ltw0mpDNpDSOCOCNSusPk3T4Q+QKfLqJnvB6k02CIRZt6MJ8
 2nYNjjr057OkvJLmGtN0iTNgr4y2Cg==
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=692ebbc4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Ajh8_egcEEMJNl95zMkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EIzJX2UVYLUm8tv6u7j7LDMVMCdLj40x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020081


On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
> On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
>> On 21/11/2025 11:37, Mukesh Ojha wrote:
>>>> Sorry.
>>>>
>>>> Did we actually come up with a cogent reason to omit the video firmware
>>>> loading here ?
>>>>
>>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>>>> getting video stuff done and storing up trouble.
>>>>
>>>> What exactly is the blockage - is it something you want help with ?
>>> I replied to you here[1] and given my reason..till something concluded on
>>> "multi-cell IOMMU[2]", I can not add video and block what is working
>>> already.
>>>
>>> [1]
>>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
>>> hyd.qualcomm.com/
>>
>> Why though ?
>>
>> You are mixing together the issue of multiple SIDs and the original loading
>> of firmware which could easily reuse the venus method of
>>
>> &iris {
>> 	video-firmware {
>> 		iommus = <&apss_smmu hex>;
>> 	};
>> };
> 
> I completely understand what you are saying, and it would be very easy
> for me to do that if it gets accepted. However, I doubt that the people
> who raised this concern would agree with the approach.
> 
> I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
> banks separately. I’ll leave this to @Vikas to answer.

Not exactly as a separate sub-node, but i do like the idea of 
introducing a simple iommu property, something like this, which Stephan 
proposed earlier in the discussion [1]

firmware-iommus = <&apps_smmu ...>;

I understand that we are doing the iommu-map thing, but a property 
exclusively for firmware like above look much simpler to me.

Dmitry/ Bryan/ Krzysztof if you are good with this, we can bring back 
video in this series. Please share your thoughts on this.

Regards,
Vikash

[1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/

> 
> Also, I do not want the video PIL discussion to be part of this series, as it could
> unnecessarily give the impression that this series depends on it.
> 
>>
>> That binding got dropped because it was unused in Iris.
>>
>> https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/
>>
>> I still fail to see why we are waiting for multi-cell IOMMU to land, when it
>> is expected to and what the VPU enablement story is upstream in the
>> meantime.
>>
>> Blocked it seems.
> 
> No, it is ongoing, there will be next version coming.
> 
>>
>> ---
>> bod
> 

